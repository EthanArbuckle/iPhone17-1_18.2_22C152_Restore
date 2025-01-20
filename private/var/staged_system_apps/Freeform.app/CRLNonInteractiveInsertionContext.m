@interface CRLNonInteractiveInsertionContext
- (BOOL)fromDragToInsertController;
- (BOOL)hasPreferredCenter;
- (BOOL)insertFloating;
- (BOOL)insertFromDrag;
- (BOOL)insertInline;
- (BOOL)isInteractive;
- (BOOL)isPreferredCenterRequired;
- (BOOL)shouldEndEditing;
- (CGPoint)preferredCenter;
@end

@implementation CRLNonInteractiveInsertionContext

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

- (BOOL)insertInline
{
  return 0;
}

- (CGPoint)preferredCenter
{
  int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E4610);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10108F6C0(v2, v3);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E4630);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101066770(v4, v2);
  }
  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLNonInteractiveInsertionContext preferredCenter]");
  v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInsertionContext.m"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:197 isFatal:0 description:"The preferred center is not applicable for a noninteractive insertion context."];

  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isInteractive
{
  return 0;
}

@end