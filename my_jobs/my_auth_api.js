import axios from '@/api/axios'

const register = credentials => {

let str = "username="
str = str + credentials.username
str = str + "&email="
str = str + credentials.email
str = str + "&password="
str = str + credentials.password

console.log(str)

return axios.post('/users', str)

}

export default {
  register
}