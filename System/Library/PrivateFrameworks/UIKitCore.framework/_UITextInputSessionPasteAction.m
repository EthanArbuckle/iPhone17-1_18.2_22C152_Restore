@interface _UITextInputSessionPasteAction
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
@end

@implementation _UITextInputSessionPasteAction

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

@end