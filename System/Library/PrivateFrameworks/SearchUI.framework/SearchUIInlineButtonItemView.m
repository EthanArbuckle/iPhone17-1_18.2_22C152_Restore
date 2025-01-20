@interface SearchUIInlineButtonItemView
- (BOOL)drawsBackgroundPlatter;
- (id)accessibilityIdentifier;
@end

@implementation SearchUIInlineButtonItemView

- (BOOL)drawsBackgroundPlatter
{
  return 0;
}

- (id)accessibilityIdentifier
{
  return @"inline-button";
}

@end