@interface TISKWordDeleteEvent
- (TISKWordDeleteEvent)initWithEmojiSearchMode:(BOOL)a3 order:(int64_t)a4;
- (id)description;
- (void)reportToSession:(id)a3;
@end

@implementation TISKWordDeleteEvent

- (id)description
{
  return (id)[NSString stringWithFormat:@"wd"];
}

- (void)reportToSession:(id)a3
{
}

- (TISKWordDeleteEvent)initWithEmojiSearchMode:(BOOL)a3 order:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TISKWordDeleteEvent;
  return (TISKWordDeleteEvent *)[(TISKEvent *)&v5 init:11 emojiSearchMode:a3 order:a4];
}

@end