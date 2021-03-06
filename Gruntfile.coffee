#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-exec"

  grunt.initConfig

    copy:
      jquery:
        files: [{
          expand: true
          cwd: "bower_components/jquery/dist/"
          src: "jquery.min.js"
          dest: "vendor/js/"
        }
            ,{
            expand: true
            cwd: "bower_components/bootstrap/dist/css/"
            src: "bootstrap.min.css"
            dest: "vendor/css/"
            },
            {
            expand: true
            cwd: "bower_components/bootstrap/dist/js/"
            src: "bootstrap.min.js"
            dest: "vendor/js/"
            },{
            expand: true
            cwd: "bower_components/DOMPurify/dist/"
            src: "purify.min.js"
            dest: "vendor/js/"
            },
            {
            expand: true
            cwd: "bower_components/animate.css/"
            src: "animate.min.css"
            dest: "vendor/css/"
            }]
    exec:
      jekyll:
        cmd: "jekyll build --trace"

    watch:
      options:
        livereload: true
      source:
        files: [
          "_drafts/**/*"
          "portfolio/**/*"          
          "_includes/**/*"
          "_layouts/**/*"
          "_posts/**/*"
          "about/**/*"
          "blog/**/*"
          "css/**/*"
          "cv/**/*"
          "js/**/*"
          "_config.yml"
          "*.html"
          "*.md"
        ]
        tasks: [
          "exec:jekyll"
        ]

    connect:
      server:
        options:
          port: 4000
          base: '_site'
          livereload: true
    livereload:
        options:
            open:'127.0.0.1:4000'

  grunt.registerTask "build", [
    "copy"
    "exec:jekyll"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "default", [
    "serve"
  ]