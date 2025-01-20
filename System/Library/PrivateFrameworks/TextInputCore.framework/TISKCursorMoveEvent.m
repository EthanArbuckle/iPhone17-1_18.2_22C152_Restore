@interface TISKCursorMoveEvent
- (id)description;
- (id)init:(double)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5;
@end

@implementation TISKCursorMoveEvent

- (id)description
{
  return (id)[NSString stringWithFormat:@"cm"];
}

- (id)init:(double)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TISKCursorMoveEvent;
  return [(TISKTimestampEvent *)&v6 init:12 timestamp:a4 emojiSearchMode:a5 order:a3];
}

@end