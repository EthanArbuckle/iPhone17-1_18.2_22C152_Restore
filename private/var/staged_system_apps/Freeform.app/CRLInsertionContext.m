@interface CRLInsertionContext
+ (id)dragInsertionContextWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 fromDragToInsertController:(BOOL)a5 insertFloating:(BOOL)a6 targetZOrder:(unint64_t)a7;
+ (id)dragInsertionContextWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 shouldEndEditing:(BOOL)a5 fromDragToInsertController:(BOOL)a6 insertFloating:(BOOL)a7 targetZOrder:(unint64_t)a8;
+ (id)iosDragFloatingInsertionContext;
+ (id)nonInteractiveFloatingInsertionContext;
+ (id)nonInteractiveInlineInsertionContext;
+ (id)nonInteractiveInsertionContext;
+ (id)nonInteractiveNonEditingEndingFloatingInsertionContext;
- (BOOL)fromDragToInsertController;
- (BOOL)hasPreferredCenter;
- (BOOL)insertFloating;
- (BOOL)insertFromDrag;
- (BOOL)insertInline;
- (BOOL)isInteractive;
- (BOOL)isPreferredCenterRequired;
- (BOOL)shouldEndEditing;
- (CGPoint)preferredCenter;
- (id)initSubclass;
- (unint64_t)targetZOrder;
@end

@implementation CRLInsertionContext

- (id)initSubclass
{
  v3.receiver = self;
  v3.super_class = (Class)CRLInsertionContext;
  return [(CRLInsertionContext *)&v3 init];
}

+ (id)nonInteractiveInsertionContext
{
  if (qword_1016A9378 != -1) {
    dispatch_once(&qword_1016A9378, &stru_1014E4570);
  }
  v2 = (void *)qword_1016A9370;

  return v2;
}

+ (id)nonInteractiveFloatingInsertionContext
{
  if (qword_1016A9388 != -1) {
    dispatch_once(&qword_1016A9388, &stru_1014E4590);
  }
  v2 = (void *)qword_1016A9380;

  return v2;
}

+ (id)iosDragFloatingInsertionContext
{
  if (qword_1016A9398 != -1) {
    dispatch_once(&qword_1016A9398, &stru_1014E45B0);
  }
  v2 = (void *)qword_1016A9390;

  return v2;
}

+ (id)nonInteractiveNonEditingEndingFloatingInsertionContext
{
  if (qword_1016A93A8 != -1) {
    dispatch_once(&qword_1016A93A8, &stru_1014E45D0);
  }
  v2 = (void *)qword_1016A93A0;

  return v2;
}

+ (id)nonInteractiveInlineInsertionContext
{
  if (qword_1016A93B8 != -1) {
    dispatch_once(&qword_1016A93B8, &stru_1014E45F0);
  }
  v2 = (void *)qword_1016A93B0;

  return v2;
}

+ (id)dragInsertionContextWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 fromDragToInsertController:(BOOL)a5 insertFloating:(BOOL)a6 targetZOrder:(unint64_t)a7
{
  return [a1 dragInsertionContextWithPreferredCenter:a4 required:a5 shouldEndEditing:a6 fromDragToInsertController:a7 insertFloating:a3.x, a3.y];
}

+ (id)dragInsertionContextWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 shouldEndEditing:(BOOL)a5 fromDragToInsertController:(BOOL)a6 insertFloating:(BOOL)a7 targetZOrder:(unint64_t)a8
{
  v8 = -[CRLDragInsertionContext initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:]([CRLDragInsertionContext alloc], "initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:", a4, a5, a6, a7, a8, a3.x, a3.y);

  return v8;
}

- (BOOL)hasPreferredCenter
{
  return 0;
}

- (BOOL)isPreferredCenterRequired
{
  return 0;
}

- (CGPoint)preferredCenter
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
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

- (unint64_t)targetZOrder
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isInteractive
{
  return 1;
}

@end