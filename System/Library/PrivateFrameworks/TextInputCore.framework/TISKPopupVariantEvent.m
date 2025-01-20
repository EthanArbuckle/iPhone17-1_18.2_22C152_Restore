@interface TISKPopupVariantEvent
- (id)description;
- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5;
- (id)privateDescription;
@end

@implementation TISKPopupVariantEvent

- (id)privateDescription
{
  return @"pu";
}

- (id)description
{
  v2 = NSString;
  v3 = [(TISKInputEvent *)self input];
  v4 = [v3 string];
  v5 = [v2 stringWithFormat:@"pu-%@", v4];

  return v5;
}

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TISKPopupVariantEvent;
  return [(TISKInputEvent *)&v6 init:a3 type:15 emojiSearchMode:a4 order:a5];
}

@end