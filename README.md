# 🏨 IndiBooking - Full-Stack Hotel Booking Platform

[![Live Demo](https://img.shields.io/badge/🌐_Live_Demo-indibooking.click-blue?style=for-the-badge&logo=google-chrome)](https://indibooking.click)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin)](https://linkedin.com/in/hifzaan-mohammad)
[![GitHub](https://img.shields.io/badge/GitHub-hifzaanDev-181717?style=for-the-badge&logo=github)](https://github.com/hifzaanDev)

> **🚀 Experience IndiBooking live at [indibooking.click](https://indibooking.click)**

A high-performance, full-stack MERN hotel booking platform featuring dynamic search, multi-step reservations, and enterprise-grade AWS deployment with auto-scaling capabilities.

## ✨ Key Achievements

- ⚡ **Optimized Performance**: Achieved exceptional Lighthouse scores (100 Accessibility, 100 Best Practices, 73 Performance) with API response times under 400ms
- 🏗️ **Scalable AWS Architecture**: Deployed on Elastic Beanstalk with auto-scaling, S3 + CloudFront for frontend, and Route 53 domain management
- 🔐 **Secure Authentication**: Implemented efficient JWT-based authentication system with secure cookie handling
- 📊 **Optimized Database**: Designed MongoDB schema to handle complex hotel-room-reservation relationships with fast query performance

## 🎯 Live Application

**Visit the live platform:** [**indibooking.click**](https://indibooking.click)

Experience a fully functional hotel booking platform with real-time availability, dynamic pricing, and seamless reservation management.

## 🏗️ Architecture Overview

### Technology Stack

**Frontend:**
- React 18 with modern hooks and functional components
- React Router DOM for client-side routing
- React Date Range for booking date selection
- Axios for HTTP requests with interceptors
- FontAwesome icons for enhanced UI
- CSS modules for component styling

**Backend:**
- Node.js with Express.js framework
- MongoDB with Mongoose ODM
- JWT-based authentication with httpOnly cookies
- bcryptjs for password hashing
- CORS configuration for cross-origin requests
- Express middleware for error handling

**Infrastructure & DevOps:**
- AWS Elastic Beanstalk for backend auto-scaling
- Amazon S3 for static website hosting
- CloudFront CDN for caching and HTTPS
- Route 53 for DNS management
- SSL/TLS certificates for secure communication

### Deployment Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Route 53      │───▶│   CloudFront    │───▶│   S3 Bucket     │
│  (DNS + Domain) │    │  (CDN + HTTPS)  │    │   (Frontend)    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                               
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Route 53      │───▶│ Elastic Beanstalk│───▶│   EC2 Auto      │
│    (API DNS)    │    │  (Load Balancer) │    │   Scaling       │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                               │                 │
                                               │  ┌───────────┐  │
                                               │  │ Backend   │  │
                                               │  │ Instance  │  │
                                               │  └───────────┘  │
                                               │  ┌───────────┐  │
                                               │  │ MongoDB   │  │
                                               │  │ Atlas     │  │
                                               │  └───────────┘  │
                                               └─────────────────┘
```

## 🚀 Key Features

### Hotel Management System
- **Dynamic Search**: Real-time filtering by location, dates, and guest capacity
- **Multi-Step Reservation**: Intuitive booking flow with date selection and room selection
- **Property Listings**: Featured hotels with detailed information and image galleries
- **Room Availability**: Real-time room status tracking and availability management

### User Experience
- **Responsive Design**: Mobile-first approach with seamless cross-device experience
- **Interactive Components**: Date pickers, search filters, and booking modals
- **City-Specific Pages**: Dedicated pages for major Indian cities (Mumbai, Delhi, Bengaluru)
- **Featured Properties**: Highlighted accommodations with special offers

### Security & Performance
- **JWT Authentication**: Secure token-based authentication with httpOnly cookies
- **Password Encryption**: bcryptjs hashing for secure user credentials
- **CORS Protection**: Configured cross-origin resource sharing for API security
- **Error Handling**: Comprehensive error middleware with proper status codes

## 📁 Project Structure

```
IndiBooking/
├── 📁 hotel-booking/              # Main project directory
│   ├── 📄 package.json            # Frontend dependencies
│   ├── 📄 .gitignore              # Git ignore rules
│   │
│   ├── 📁 public/                 # Static assets
│   │   ├── 📄 index.html          # HTML entry point
│   │   └── 🖼️ favicon.ico         # App favicon
│   │
│   ├── 📁 src/                    # Frontend source code
│   │   ├── 📄 App.jsx             # Main React component
│   │   ├── 📄 index.js            # React app entry point
│   │   ├── 📄 axios.js            # Axios configuration
│   │   │
│   │   ├── 📁 components/         # Reusable UI components
│   │   │   ├── 📁 navbar/         # Navigation component
│   │   │   │   └── 📄 Navbar.jsx
│   │   │   ├── 📁 header/         # Page header component
│   │   │   │   └── 📄 Header.jsx
│   │   │   ├── 📁 featured/       # Featured hotels section
│   │   │   │   └── 📄 Features.jsx
│   │   │   ├── 📁 featuredProperties/ # Property listings
│   │   │   │   └── 📄 FeaturedProperties.jsx
│   │   │   ├── 📁 propertyList/   # Property type filters
│   │   │   │   └── 📄 PropertyList.jsx
│   │   │   ├── 📁 searchItem/     # Search result items
│   │   │   │   └── 📄 SearchItem.jsx
│   │   │   ├── 📁 reserve/        # Reservation modal
│   │   │   │   └── 📄 Reserve.jsx
│   │   │   ├── 📁 mailList/       # Newsletter component
│   │   │   │   └── 📄 MailList.jsx
│   │   │   ├── 📁 footer/         # Footer component
│   │   │   │   └── 📄 Footer.jsx
│   │   │   ├── 📁 mumbai/         # City-specific components
│   │   │   │   └── 📄 Mumbai.jsx
│   │   │   ├── 📁 delhi/
│   │   │   │   └── 📄 Delhi.jsx
│   │   │   ├── 📁 bengaluru/
│   │   │   │   └── 📄 Bengaluru.jsx
│   │   │   └── 📁 comingSoon/     # Coming soon features
│   │   │       └── 📄 ComingSoon.jsx
│   │   │
│   │   ├── 📁 pages/              # Main application pages
│   │   │   ├── 📁 home/           # Homepage
│   │   │   │   └── 📄 Homes.jsx
│   │   │   ├── 📁 list/           # Hotel listings page
│   │   │   │   └── 📄 List.jsx
│   │   │   └── 📁 hotel/          # Individual hotel page
│   │   │       └── 📄 Hotel.jsx
│   │   │
│   │   ├── 📁 context/            # React Context for state management
│   │   ├── 📁 hooks/              # Custom React hooks
│   │   ├── 📁 login/              # Authentication components
│   │   └── 📁 assets/             # Static assets and images
│   │
│   ├── 📁 api/                    # Backend API server
│   │   ├── 📄 app.js              # Express server entry point
│   │   ├── 📄 package.json        # Backend dependencies
│   │   ├── 📄 .env                # Environment variables
│   │   │
│   │   ├── 📁 models/             # MongoDB schemas
│   │   │   ├── 📄 User.js         # User model
│   │   │   ├── 📄 Hotel.js        # Hotel model
│   │   │   ├── 📄 Room.js         # Room model
│   │   │   └── 📄 Reservation.js  # Reservation model
│   │   │
│   │   ├── 📁 routes/             # API route definitions
│   │   │   ├── 📄 auth.js         # Authentication routes
│   │   │   ├── 📄 users.js        # User management routes
│   │   │   ├── 📄 hotels.js       # Hotel CRUD routes
│   │   │   ├── 📄 rooms.js        # Room management routes
│   │   │   └── 📄 reservations.js # Booking routes
│   │   │
│   │   ├── 📁 controllers/        # Route controllers
│   │   ├── 📁 utils/              # Utility functions
│   │   │
│   │   ├── 📁 .ebextensions/      # Elastic Beanstalk configuration
│   │   │   ├── 📄 00_install_certbot.config
│   │   │   ├── 📄 01_nginx_proxy.config
│   │   │   ├── 📄 02_environment.config
│   │   │   └── 📄 10_open_https_port.config
│   │   │
│   │   └── 📁 .platform/          # Platform-specific configs
│   │
│   └── 📁 build/                  # Production build files
```

## 🛠️ Local Development

### Prerequisites
- Node.js 18+
- MongoDB (local or Atlas)
- npm or yarn package manager

### Quick Start

```bash
# Clone the repository
git clone https://github.com/hifzaanDev/indibooking
cd hotel-booking

# Install frontend dependencies
npm install

# Install backend dependencies
cd api
npm install

# Configure environment variables
cp .env.example .env
# Update with your MongoDB connection string and JWT secret

# Start backend server
npm run dev

# Start frontend (in new terminal)
cd ..
npm start
```

### Environment Configuration

```env
# API/.env
MONGO=your_mongodb_connection_string
JWT_SECRET=your_jwt_secret_key
PORT=8080
```

## 📊 Performance Metrics

- **Lighthouse Scores**:
  - Accessibility: 100/100
  - Best Practices: 100/100
  - Performance: 73/100
- **API Response Time**: < 400ms average
- **Database Query Performance**: Optimized MongoDB indexes for fast lookups
- **Uptime**: 99.9% availability on AWS infrastructure
- **Auto-Scaling**: Elastic Beanstalk handles traffic spikes automatically

## 🔗 API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/logout` - User logout

### Hotels
- `GET /api/hotels` - Get all hotels with filtering
- `GET /api/hotels/:id` - Get specific hotel details
- `GET /api/hotels/countByCity` - Get hotel counts by city
- `GET /api/hotels/countByType` - Get hotel counts by type

### Rooms
- `GET /api/rooms/:id` - Get room details
- `PUT /api/rooms/availability/:id` - Update room availability

### Reservations
- `POST /api/reservations` - Create new reservation
- `GET /api/reservations/user/:userId` - Get user reservations

## 🌟 Technical Highlights

### AWS Deployment Strategy
- **Frontend**: Deployed on S3 with CloudFront CDN for global content delivery
- **Backend**: Auto-scaling Elastic Beanstalk environment with load balancing
- **Database**: MongoDB Atlas for managed database with replica sets
- **Security**: SSL/TLS certificates and secure cookie handling

### MongoDB Schema Optimization
- **Indexed Queries**: Strategic indexing for city, type, and availability searches
- **Relationship Modeling**: Efficient hotel-room-reservation relationships
- **Aggregation Pipelines**: Complex queries for availability and pricing

### React Architecture
- **Component-Based Design**: Modular, reusable components
- **State Management**: React Context for global state
- **Performance**: Code splitting and lazy loading
- **User Experience**: Intuitive booking flow with validation

## 📱 Contact

**Hifzaan Mohammad**  
📧 Email: [mohammadhifzan24@gmail.com](mailto:mohammadhifzan24@gmail.com)  
💼 LinkedIn: [linkedin.com/in/hifzaan-mohammad](https://linkedin.com/in/hifzaan-mohammad)  
👨‍💻 GitHub: [@hifzaanDev](https://github.com/hifzaanDev)

---

**🌟 Experience the full booking platform at [indibooking.click](https://indibooking.click)**
