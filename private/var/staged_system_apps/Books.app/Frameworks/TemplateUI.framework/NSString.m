@interface NSString
- (id)tui_identiferFromString;
@end

@implementation NSString

- (id)tui_identiferFromString
{
  return +[_TUIIdentifier fromString:self];
}

@end