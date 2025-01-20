@interface TSDNonInteractiveInsertionContext
- (BOOL)fromDragToInsertController;
- (BOOL)hasPreferredCenter;
- (BOOL)insertFloating;
- (BOOL)insertFromDrag;
- (BOOL)insertWillBeDiscarded;
- (BOOL)isInteractive;
- (BOOL)isPreferredCenterRequired;
- (BOOL)shouldEndEditing;
- (CGPoint)preferredCenter;
@end

@implementation TSDNonInteractiveInsertionContext

- (BOOL)hasPreferredCenter
{
  return 0;
}

- (BOOL)isPreferredCenterRequired
{
  return 0;
}

- (BOOL)shouldEndEditing
{
  return 1;
}

- (BOOL)insertFloating
{
  return 0;
}

- (BOOL)insertFromDrag
{
  return 0;
}

- (BOOL)fromDragToInsertController
{
  return 0;
}

- (BOOL)insertWillBeDiscarded
{
  return 0;
}

- (CGPoint)preferredCenter
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDNonInteractiveInsertionContext preferredCenter]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInsertionContext.m"), 175, @"The preferred center is not applicable for a noninteractive insertion context.");
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  result.y = v5;
  result.x = v4;
  return result;
}

- (BOOL)isInteractive
{
  return 0;
}

@end