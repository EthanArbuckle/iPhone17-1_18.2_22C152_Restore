@interface TISKTimestampEvent
- (BOOL)isMissingATouch;
- (double)timestamp;
- (double)touchDownTimestamp;
- (double)touchUpTimestamp;
- (id)init:(int)a3 timestamp:(double)a4 emojiSearchMode:(BOOL)a5 order:(int64_t)a6;
- (void)setTimestamp:(double)a3;
@end

@implementation TISKTimestampEvent

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)touchUpTimestamp
{
  return self->_timestamp;
}

- (double)touchDownTimestamp
{
  return self->_timestamp;
}

- (BOOL)isMissingATouch
{
  return self->_timestamp <= 0.0;
}

- (id)init:(int)a3 timestamp:(double)a4 emojiSearchMode:(BOOL)a5 order:(int64_t)a6
{
  v10.receiver = self;
  v10.super_class = (Class)TISKTimestampEvent;
  id v7 = [(TISKEvent *)&v10 init:*(void *)&a3 emojiSearchMode:a5 order:a6];
  v8 = v7;
  if (v7)
  {
    [v7 setTimestamp:a4];
    [v8 setHasTimestamp:1];
  }
  return v8;
}

@end