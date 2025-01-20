@interface NSWritingToolsProofreadingController(_UIWTCContextTracking)
- (id)_writingToolsContextID;
- (void)_setWritingToolsContextID:()_UIWTCContextTracking;
@end

@implementation NSWritingToolsProofreadingController(_UIWTCContextTracking)

- (void)_setWritingToolsContextID:()_UIWTCContextTracking
{
}

- (id)_writingToolsContextID
{
  return objc_getAssociatedObject(a1, &_UIWritingToolsContextIDKey);
}

@end