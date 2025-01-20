@interface TISKTouchlessInputEvent
- (id)description;
- (id)init:(BOOL)a3 order:(int64_t)a4;
@end

@implementation TISKTouchlessInputEvent

- (id)description
{
  return (id)[NSString stringWithFormat:@"ti"];
}

- (id)init:(BOOL)a3 order:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TISKTouchlessInputEvent;
  return [(TISKEvent *)&v5 init:13 emojiSearchMode:a3 order:a4];
}

@end