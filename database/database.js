const Sequelize = require('sequelize');

const connection = new Sequelize('store_admin', 'root', '', {
    host: 'localhost',
    dialect: 'mysql',
    timezone: '-03:00'
});

module.exports = connection;