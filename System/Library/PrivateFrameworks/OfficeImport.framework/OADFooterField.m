@interface OADFooterField
- (BOOL)isEmpty;
@end

@implementation OADFooterField

- (BOOL)isEmpty
{
  mText = self->super.mText;
  return !mText || [(NSString *)mText length] == 0;
}

@end