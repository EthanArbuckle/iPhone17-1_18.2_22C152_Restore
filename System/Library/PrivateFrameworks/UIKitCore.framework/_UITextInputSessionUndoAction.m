@interface _UITextInputSessionUndoAction
- (BOOL)changedContent;
- (BOOL)isCapableOfTextInsertion;
@end

@implementation _UITextInputSessionUndoAction

- (BOOL)changedContent
{
  return 1;
}

- (BOOL)isCapableOfTextInsertion
{
  return 1;
}

@end