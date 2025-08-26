import axios from 'axios';

const api = axios.create({
  baseURL: 'https://api.indibooking.click/api',
  withCredentials: true,
});

export default api;
