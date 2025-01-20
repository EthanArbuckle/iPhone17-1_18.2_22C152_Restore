@interface UIKeyboardEmojiPopoverControllerBackground
+ (id)visualEffectGroupName;
@end

@implementation UIKeyboardEmojiPopoverControllerBackground

+ (id)visualEffectGroupName
{
  return +[UIKeyboardEmojiPopoverController visualEffectGroupName];
}

@end