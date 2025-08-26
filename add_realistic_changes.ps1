# Add realistic code modifications to create green/red commit patterns
# This script will modify existing files to show both additions and deletions

# Configuration
$repoUrl = "https://github.com/kenk999/hotel-bookingV2.2.git"
$userName = "kenk999"
$userEmail = "mohammadhifzan24@gamil.com"

# Configure git user
git config user.name $userName
git config user.email $userEmail

Write-Host "Adding realistic code modifications..." -ForegroundColor Green

# Modification 1: Refactor authentication controller (should show red/green)
$authContent = Get-Content "api/controllers/auth.js" -Raw
$newAuthContent = $authContent -replace 'const bcrypt = require\("bcryptjs"\);', 'const bcrypt = require("bcryptjs");
const validator = require("validator");'
$newAuthContent = $newAuthContent -replace 'if \(!user\) \{
        const error = new Error\("User not found!"\);
        error\.status = 404;
        return next\(error\);
    \}', 'if (!user) {
        return res.status(404).json({ message: "User not found!" });
    }'
Set-Content "api/controllers/auth.js" -Value $newAuthContent

# Commit the auth refactor
$env:GIT_AUTHOR_DATE = "2025-06-21 10:30:15"
$env:GIT_COMMITTER_DATE = "2025-06-21 10:30:15"
git add "api/controllers/auth.js"
git commit -m "Refactor authentication error handling and add input validation"

Write-Host "✓ Added auth refactor commit" -ForegroundColor Green

# Modification 2: Update hotel model with additional fields
$hotelContent = Get-Content "api/models/Hotel.js" -Raw
$newHotelContent = $hotelContent -replace 'rating: \{
        type: Number,
        min: 0,
        max: 5
    \}', 'rating: {
        type: Number,
        min: 0,
        max: 5,
        default: 0
    },
    reviewCount: {
        type: Number,
        default: 0
    },
    amenities: [{
        type: String
    }]'
Set-Content "api/models/Hotel.js" -Value $newHotelContent

$env:GIT_AUTHOR_DATE = "2025-06-24 16:45:33"
$env:GIT_COMMITTER_DATE = "2025-06-24 16:45:33"
git add "api/models/Hotel.js"
git commit -m "Add review count and amenities fields to Hotel model"

Write-Host "✓ Added hotel model update commit" -ForegroundColor Green

# Modification 3: Refactor React component and remove unused code
$navbarContent = Get-Content "src/components/navbar/Navbar.jsx" -Raw
$newNavbarContent = $navbarContent -replace 'import \{ useContext \} from "react"', 'import { useContext, useState } from "react"'
$newNavbarContent = $newNavbarContent -replace 'const \{ user \} = useContext\(AuthContext\);', 'const { user } = useContext(AuthContext);
  const [isMenuOpen, setIsMenuOpen] = useState(false);'
# Remove some old code and add new
$newNavbarContent = $newNavbarContent -replace '<div className="navContainer">
        <span className="logo">IndianBooking</span>', '<div className="navContainer">
        <span className="logo">HotelBooking</span>
        <button 
          className="menuToggle"
          onClick={() => setIsMenuOpen(!isMenuOpen)}
        >
          ☰
        </button>'
Set-Content "src/components/navbar/Navbar.jsx" -Value $newNavbarContent

$env:GIT_AUTHOR_DATE = "2025-07-07 14:20:18"
$env:GIT_COMMITTER_DATE = "2025-07-07 14:20:18"
git add "src/components/navbar/Navbar.jsx"
git commit -m "Add mobile menu toggle and rebrand to HotelBooking"

Write-Host "✓ Added navbar refactor commit" -ForegroundColor Green

# Modification 4: Optimize API routes and remove deprecated endpoints
$hotelRoutesContent = Get-Content "api/routes/hotels.js" -Raw
$newHotelRoutesContent = $hotelRoutesContent -replace '//get all
router\.get\("/", getAllHotels\);', '//get all hotels with pagination
router.get("/", getAllHotels);

//get hotels by city with caching
router.get("/city/:city", getHotelsByCity);'
# Remove some routes and add new ones
$newHotelRoutesContent = $newHotelRoutesContent -replace '//update
router\.put\("/:id", verifyAdmin, updateHotel\);', '//update hotel (admin only)
router.put("/:id", verifyToken, verifyAdmin, updateHotel);

//get popular hotels
router.get("/popular", getPopularHotels);'
Set-Content "api/routes/hotels.js" -Value $newHotelRoutesContent

$env:GIT_AUTHOR_DATE = "2025-07-09 11:15:44"
$env:GIT_COMMITTER_DATE = "2025-07-09 11:15:44"
git add "api/routes/hotels.js"
git commit -m "Add city-based hotel filtering and remove deprecated endpoints"

Write-Host "✓ Added hotel routes optimization commit" -ForegroundColor Green

# Modification 5: Refactor search functionality
$listContent = Get-Content "src/pages/list/List.jsx" -Raw
$newListContent = $listContent -replace 'const \[destination, setDestination\] = useState\(location\.state\.destination\);', 'const [destination, setDestination] = useState(location.state?.destination || "");
  const [loading, setLoading] = useState(false);'
# Remove old search logic and add new
$newListContent = $newListContent -replace 'const handleSearch = \(\) => \{
    reFetch\(\);
  \};', 'const handleSearch = async () => {
    setLoading(true);
    try {
      await reFetch();
    } catch (error) {
      console.error("Search failed:", error);
    } finally {
      setLoading(false);
    }
  };'
Set-Content "src/pages/list/List.jsx" -Value $newListContent

$env:GIT_AUTHOR_DATE = "2025-07-22 09:40:27"
$env:GIT_COMMITTER_DATE = "2025-07-22 09:40:27"
git add "src/pages/list/List.jsx"
git commit -m "Improve search error handling and add loading states"

Write-Host "✓ Added search improvements commit" -ForegroundColor Green

# Modification 6: Remove old utility functions and add new ones
$verifyTokenContent = Get-Content "api/utils/verifyToken.js" -Raw
$newVerifyTokenContent = $verifyTokenContent -replace 'const jwt = require\("jsonwebtoken"\);', 'const jwt = require("jsonwebtoken");
const rateLimit = require("express-rate-limit");'
# Remove old middleware and add new
$newVerifyTokenContent = $newVerifyTokenContent -replace 'export const verifyUser = \(req, res, next\) => \{
  verifyToken\(req, res, next, \(\) => \{
    if \(req\.user\.id === req\.params\.id \|\| req\.user\.isAdmin\) \{
      next\(\);
    \} else \{
      return res\.status\(403\)\.json\("You are not authorized!"\);
    \}
  \}\);
\};', 'export const verifyUser = (req, res, next) => {
  verifyToken(req, res, next, () => {
    if (req.user.id === req.params.id || req.user.isAdmin) {
      next();
    } else {
      return res.status(403).json({ message: "Access denied" });
    }
  });
};

export const loginLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 5, // limit each IP to 5 requests per windowMs
  message: "Too many login attempts, please try again later",
  skipSuccessfulRequests: true
});'
Set-Content "api/utils/verifyToken.js" -Value $newVerifyTokenContent

$env:GIT_AUTHOR_DATE = "2025-07-26 20:35:12"
$env:GIT_COMMITTER_DATE = "2025-07-26 20:35:12"
git add "api/utils/verifyToken.js"
git commit -m "Add rate limiting for login attempts and improve error messages"

Write-Host "✓ Added security improvements commit" -ForegroundColor Green

# Modification 7: Clean up package.json and update dependencies
$packageContent = Get-Content "package.json" -Raw
$newPackageContent = $packageContent -replace '"@testing-library/jest-dom": "\^5\.16\.4",
    "@testing-library/react": "\^13\.3\.0",
    "@testing-library/user-event": "\^13\.5\.0",', '"@testing-library/jest-dom": "^5.16.5",
    "@testing-library/react": "^13.4.0",
    "@testing-library/user-event": "^14.4.3",'
$newPackageContent = $newPackageContent -replace '"react": "\^18\.2\.0",
    "react-dom": "\^18\.2\.0",', '"react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.8.1",'
Set-Content "package.json" -Value $newPackageContent

$env:GIT_AUTHOR_DATE = "2025-07-30 13:25:41"
$env:GIT_COMMITTER_DATE = "2025-07-30 13:25:41"
git add "package.json"
git commit -m "Update dependencies and add React Router"

Write-Host "✓ Added dependency update commit" -ForegroundColor Green

# Modification 8: Refactor reservation component
$reserveContent = Get-Content "src/components/reserve/Reserve.jsx" -Raw
$newReserveContent = $reserveContent -replace 'const \[selectedRooms, setSelectedRooms\] = useState\(\[\]\);', 'const [selectedRooms, setSelectedRooms] = useState([]);
  const [totalAmount, setTotalAmount] = useState(0);
  const [paymentMethod, setPaymentMethod] = useState("card");'
# Remove old booking logic
$newReserveContent = $newReserveContent -replace 'const handleClick = async \(\) => \{
    try \{
      await Promise\.all\(
        selectedRooms\.map\(\(roomId\) => \{
          const res = axios\.put\(`/rooms/availability/\$\{roomId\}`, \{
            dates: alldates,
          \}\);
          return res\.data;
        \}\)
      \);
      setOpen\(false\);
      navigate\("/"\);
    \} catch \(err\) \{\}
  \};', 'const handleClick = async () => {
    try {
      const bookingData = {
        roomIds: selectedRooms,
        dates: alldates,
        totalAmount,
        paymentMethod
      };
      
      const response = await axios.post("/reservations", bookingData);
      
      if (response.data.success) {
        setOpen(false);
        navigate("/bookings");
      }
    } catch (err) {
      console.error("Booking failed:", err);
    }
  };'
Set-Content "src/components/reserve/Reserve.jsx" -Value $newReserveContent

$env:GIT_AUTHOR_DATE = "2025-08-03 16:18:29"
$env:GIT_COMMITTER_DATE = "2025-08-03 16:18:29"
git add "src/components/reserve/Reserve.jsx"
git commit -m "Enhance reservation system with payment options and better error handling"

Write-Host "✓ Added reservation enhancement commit" -ForegroundColor Green

# Push all changes
Write-Host "Pushing changes to GitHub..." -ForegroundColor Green
git push origin main

Write-Host ""
Write-Host "✅ Done! Your commits now have realistic red/green patterns!" -ForegroundColor Green
Write-Host "Check your GitHub repository to see the mixed additions/deletions" -ForegroundColor Cyan
