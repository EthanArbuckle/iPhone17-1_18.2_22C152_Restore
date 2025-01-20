@interface TISKSpecialKeyEvent
- (id)description;
- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5;
- (id)privateDescription;
@end

@implementation TISKSpecialKeyEvent

- (id)privateDescription
{
  return @"spl";
}

- (id)description
{
  v3 = [(TISKInputEvent *)self input];
  v4 = [v3 string];
  if ([v4 isEqualToString:@"\n"])
  {
    v5 = @"NL";
  }
  else
  {
    v6 = [(TISKInputEvent *)self input];
    v5 = [v6 string];
  }
  v7 = [NSString stringWithFormat:@"spl-%@", v5];

  return v7;
}

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TISKSpecialKeyEvent;
  return [(TISKInputEvent *)&v6 init:a3 type:6 emojiSearchMode:a4 order:a5];
}

@end