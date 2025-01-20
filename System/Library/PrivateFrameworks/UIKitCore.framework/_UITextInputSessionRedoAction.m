@interface _UITextInputSessionRedoAction
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
@end

@implementation _UITextInputSessionRedoAction

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

@end