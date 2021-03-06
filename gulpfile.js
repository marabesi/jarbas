var gulp = require('gulp');
var elm  = require('gulp-elm');
var watch  = require('gulp-watch');
var uglify = require('gulp-uglify');
var rename = require('gulp-rename');

gulp.task('elm', function () {
  return gulp.src('jarbas/frontend/elm/Main.elm')
    .pipe(elm())
    .on('error', onError)
    .pipe(uglify())
    .pipe(rename('jarbas/frontend/static/app.js'))
    .pipe(gulp.dest('.'));
});

gulp.task('watch', ['elm'], function () {
  watch('**/*.elm', function () {
    gulp.start('elm');
  });
});

function onError(err) {
    console.log(err);
    this.emit('end');
}
