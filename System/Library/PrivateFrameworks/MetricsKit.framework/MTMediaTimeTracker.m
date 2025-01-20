@interface MTMediaTimeTracker
- (MTMediaTimeTracker)initWithPosition:(unint64_t)a3 playbackRate:(float)a4;
- (NSDate)date;
- (float)playbackRate;
- (id)estimatedTimeAtPastPosition:(unint64_t)a3;
- (id)estimatedTimeAtPosition:(unint64_t)a3;
- (unint64_t)position;
- (void)setDate:(id)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setPosition:(unint64_t)a3;
- (void)updatePosition:(unint64_t)a3;
- (void)updatePosition:(unint64_t)a3 playbackRate:(float)a4;
@end

@implementation MTMediaTimeTracker

- (MTMediaTimeTracker)initWithPosition:(unint64_t)a3 playbackRate:(float)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MTMediaTimeTracker;
  v6 = [(MTMediaTimeTracker *)&v10 init];
  v8 = v6;
  if (v6)
  {
    *(float *)&double v7 = a4;
    [(MTMediaTimeTracker *)v6 updatePosition:a3 playbackRate:v7];
  }
  return v8;
}

- (void)updatePosition:(unint64_t)a3
{
  v5 = +[MTFrameworkEnvironment sharedEnvironment];
  v6 = [v5 date];
  [(MTMediaTimeTracker *)self setDate:v6];

  [(MTMediaTimeTracker *)self setPosition:a3];
}

- (void)updatePosition:(unint64_t)a3 playbackRate:(float)a4
{
  double v7 = +[MTFrameworkEnvironment sharedEnvironment];
  v8 = [v7 date];
  [(MTMediaTimeTracker *)self setDate:v8];

  [(MTMediaTimeTracker *)self setPosition:a3];
  *(float *)&double v9 = a4;

  [(MTMediaTimeTracker *)self setPlaybackRate:v9];
}

- (float)playbackRate
{
  float result = self->_playbackRate;
  if (result == 0.0) {
    return 1.0;
  }
  return result;
}

- (id)estimatedTimeAtPosition:(unint64_t)a3
{
  double v4 = ((double)a3 - (double)[(MTMediaTimeTracker *)self position]) / 1000.0;
  v5 = [(MTMediaTimeTracker *)self date];
  [(MTMediaTimeTracker *)self playbackRate];
  double v7 = [v5 dateByAddingTimeInterval:v4 / v6];

  return v7;
}

- (id)estimatedTimeAtPastPosition:(unint64_t)a3
{
  v3 = [(MTMediaTimeTracker *)self estimatedTimeAtPosition:a3];
  double v4 = +[MTFrameworkEnvironment sharedEnvironment];
  v5 = [v4 date];

  if ([v3 compare:v5] == -1) {
    float v6 = v3;
  }
  else {
    float v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
}

@end