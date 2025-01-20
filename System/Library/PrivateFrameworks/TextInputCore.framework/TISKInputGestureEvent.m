@interface TISKInputGestureEvent
- (id)description;
- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5;
@end

@implementation TISKInputGestureEvent

- (id)description
{
  return (id)[NSString stringWithFormat:@"gs"];
}

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TISKInputGestureEvent;
  return [(TISKInputEvent *)&v6 init:a3 type:16 emojiSearchMode:a4 order:a5];
}

@end