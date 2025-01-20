@interface _UITextViewVisualStyle_iOS
- (id)backgroundColor;
@end

@implementation _UITextViewVisualStyle_iOS

- (id)backgroundColor
{
  return +[UIColor systemBackgroundColor];
}

@end