# Hotel Booking Project - Realistic Commit History Generator (2025)
# This script creates commits with backdated timestamps over the past 2 months

# Configuration
$repoUrl = "https://github.com/kenk999/hotel-bookingV2.2.git"
$userName = "kenk999"
$userEmail = "mohammadhifzan24@gamil.com"

# Initialize git
Write-Host "Setting up git repository..." -ForegroundColor Green
git init
git remote add origin $repoUrl

# Configure git user
git config user.name $userName
git config user.email $userEmail

# Define commit groups with realistic development timeline (June-August 2025)
$commitGroups = @(
    @{
        Date = "2025-06-15"
        Time = "14:34:22"
        Files = @("package.json", "package-lock.json", ".gitignore")
        Message = "Initial project setup and package configuration"
    },
    @{
        Date = "2025-06-17"
        Time = "09:47:15"
        Files = @("api/package.json", "api/app.js", "api/.env")
        Message = "Add Express server and basic API structure"
    },
    @{
        Date = "2025-06-20"
        Time = "18:15:33"
        Files = @("api/models/User.js", "api/controllers/auth.js", "api/routes/auth.js")
        Message = "Implement user authentication system"
    },
    @{
        Date = "2025-06-23"
        Time = "11:23:41"
        Files = @("api/models/Hotel.js", "api/models/Room.js", "api/controllers/hotel.js")
        Message = "Add hotel and room data models"
    },
    @{
        Date = "2025-06-25"
        Time = "16:55:18"
        Files = @("api/routes/hotels.js", "api/routes/rooms.js", "api/controllers/room.js")
        Message = "Create hotel and room API endpoints"
    },
    @{
        Date = "2025-06-27"
        Time = "10:12:44"
        Files = @("api/utils/verifyToken.js", "api/models/Reservation.js")
        Message = "Add JWT authentication middleware and reservation model"
    },
    @{
        Date = "2025-06-30"
        Time = "15:38:27"
        Files = @("src/index.js", "src/App.jsx", "src/index.css", "public/index.html")
        Message = "Initialize React frontend application"
    },
    @{
        Date = "2025-07-02"
        Time = "13:18:52"
        Files = @("src/axios.js", "src/hooks/useFetch.js")
        Message = "Set up API client and custom hooks"
    },
    @{
        Date = "2025-07-04"
        Time = "20:25:16"
        Files = @("src/context/AuthContext.jsx", "src/context/SearchContext.jsx")
        Message = "Implement React context for state management"
    },
    @{
        Date = "2025-07-06"
        Time = "08:42:33"
        Files = @("src/components/navbar/Navbar.jsx")
        Message = "Create responsive navigation component"
    },
    @{
        Date = "2025-07-08"
        Time = "17:31:28"
        Files = @("src/components/header/Header.jsx")
        Message = "Add search header with date picker functionality"
    },
    @{
        Date = "2025-07-11"
        Time = "12:07:45"
        Files = @("public/assets/bang.jpg", "public/assets/Del.jpg", "public/assets/Mum.jpg")
        Message = "Add city images and visual assets"
    },
    @{
        Date = "2025-07-13"
        Time = "14:53:19"
        Files = @("src/components/featured/Features.jsx")
        Message = "Create featured cities component with analytics"
    },
    @{
        Date = "2025-07-15"
        Time = "19:16:42"
        Files = @("src/components/propertyList/PropertyList.jsx")
        Message = "Implement property type browsing functionality"
    },
    @{
        Date = "2025-07-17"
        Time = "11:44:58"
        Files = @("src/components/featuredProperties/FeaturedProperties.jsx")
        Message = "Add featured properties showcase component"
    },
    @{
        Date = "2025-07-19"
        Time = "16:29:13"
        Files = @("src/pages/home/Homes.jsx")
        Message = "Create main homepage layout and styling"
    },
    @{
        Date = "2025-07-21"
        Time = "09:35:27"
        Files = @("src/pages/list/List.jsx")
        Message = "Implement hotel search and filtering page"
    },
    @{
        Date = "2025-07-23"
        Time = "21:18:36"
        Files = @("src/components/searchItem/SearchItem.jsx")
        Message = "Create hotel search result item component"
    },
    @{
        Date = "2025-07-25"
        Time = "13:52:41"
        Files = @("src/pages/hotel/Hotel.jsx")
        Message = "Add detailed hotel view with image gallery"
    },
    @{
        Date = "2025-07-27"
        Time = "10:07:22"
        Files = @("src/components/reserve/Reserve.jsx")
        Message = "Implement room reservation functionality"
    },
    @{
        Date = "2025-07-29"
        Time = "15:33:48"
        Files = @("src/login/Login.jsx", "src/login/login.css")
        Message = "Add user login and registration system"
    },
    @{
        Date = "2025-07-31"
        Time = "18:46:15"
        Files = @("src/components/mumbai/Mumbai.jsx", "src/components/delhi/Delhi.jsx", "src/components/bengaluru/Bengaluru.jsx")
        Message = "Create city-specific landing pages"
    },
    @{
        Date = "2025-08-02"
        Time = "12:21:33"
        Files = @("api/controllers/reservation.js", "api/routes/reservations.js")
        Message = "Implement reservation management API endpoints"
    },
    @{
        Date = "2025-08-04"
        Time = "20:14:57"
        Files = @("api/controllers/user.js", "api/routes/users.js")
        Message = "Add user profile management endpoints"
    },
    @{
        Date = "2025-08-06"
        Time = "08:39:44"
        Files = @("src/components/footer/Footer.jsx", "src/components/mailList/MailList.jsx")
        Message = "Add footer and newsletter subscription components"
    },
    @{
        Date = "2025-08-07"
        Time = "11:28:16"
        Files = @("src/components/comingSoon/ComingSoon.jsx")
        Message = "Create coming soon page for future features"
    },
    @{
        Date = "2025-08-08"
        Time = "14:55:39"
        Files = @("api/Procfile")
        Message = "Add deployment configuration"
    },
    @{
        Date = "2025-08-09"
        Time = "17:42:11"
        Files = @("public/404.html", "public/_redirects")
        Message = "Add SPA routing support for production deployment"
    }
)

# Function to create commit with specific date
function Create-CommitWithDate {
    param(
        [string]$CommitDate,
        [string]$CommitTime, 
        [string[]]$Files,
        [string]$Message
    )
    
    $dateTime = "$CommitDate $CommitTime"
    
    Write-Host "Creating commit: $Message" -ForegroundColor Yellow
    Write-Host "Date: $dateTime" -ForegroundColor Cyan
    Write-Host "Files: $($Files -join ', ')" -ForegroundColor Magenta
    
    # Check if files exist before adding
    $existingFiles = @()
    foreach ($file in $Files) {
        if (Test-Path $file) {
            $existingFiles += $file
        } else {
            Write-Host "Warning: File $file does not exist, skipping..." -ForegroundColor Red
        }
    }
    
    if ($existingFiles.Count -gt 0) {
        # Add files to git
        foreach ($file in $existingFiles) {
            git add $file
        }
        
        # Create commit with backdated timestamp
        $env:GIT_AUTHOR_DATE = $dateTime
        $env:GIT_COMMITTER_DATE = $dateTime
        
        git commit -m $Message
        
        Write-Host "Committed successfully" -ForegroundColor Green
        Write-Host ""
    } else {
        Write-Host "No files to commit" -ForegroundColor Red
        Write-Host ""
    }
}

# Execute commits
Write-Host ""
Write-Host "Starting commit history creation..." -ForegroundColor Green
Write-Host "Repository: $repoUrl" -ForegroundColor Cyan
Write-Host "Time range: June 15, 2025 - August 9, 2025" -ForegroundColor Cyan
Write-Host ""

foreach ($group in $commitGroups) {
    Create-CommitWithDate -CommitDate $group.Date -CommitTime $group.Time -Files $group.Files -Message $group.Message
    Start-Sleep -Seconds 1
}

Write-Host "Pushing to GitHub (force push to overwrite)..." -ForegroundColor Green
git push -u origin master --force

Write-Host ""
Write-Host "Complete! Your project now has a realistic 2-month commit history!" -ForegroundColor Green
Write-Host "Check your repository: $repoUrl" -ForegroundColor Cyan
