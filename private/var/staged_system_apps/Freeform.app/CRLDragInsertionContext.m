@interface CRLDragInsertionContext
- (BOOL)fromDragToInsertController;
- (BOOL)hasPreferredCenter;
- (BOOL)insertFloating;
- (BOOL)insertFromDrag;
- (BOOL)insertInline;
- (BOOL)isInteractive;
- (BOOL)isPreferredCenterRequired;
- (BOOL)shouldEndEditing;
- (CGPoint)preferredCenter;
- (CRLDragInsertionContext)initWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 shouldEndEditing:(BOOL)a5 fromDragToInsertController:(BOOL)a6 insertFloating:(BOOL)a7 targetZOrder:(unint64_t)a8;
- (id)insertionContextFromInsertionContextWithNextZOrder;
- (id)insertionContextFromInsertionContextWithZOrder:(unint64_t)a3;
- (unint64_t)targetZOrder;
@end

@implementation CRLDragInsertionContext

- (CRLDragInsertionContext)initWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 shouldEndEditing:(BOOL)a5 fromDragToInsertController:(BOOL)a6 insertFloating:(BOOL)a7 targetZOrder:(unint64_t)a8
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v16.receiver = self;
  v16.super_class = (Class)CRLDragInsertionContext;
  result = [(CRLInsertionContext *)&v16 initSubclass];
  if (result)
  {
    result->_preferredCenter.CGFloat x = x;
    result->_preferredCenter.CGFloat y = y;
    result->_preferredCenterRequired = a4;
    result->_shouldEndEditing = a5;
    result->_fromDragToInsertController = a6;
    result->_insertFloating = a7;
    result->_targetZOrder = a8;
  }
  return result;
}

- (BOOL)hasPreferredCenter
{
  return 1;
}

- (BOOL)insertFromDrag
{
  return 1;
}

- (BOOL)insertInline
{
  return 0;
}

- (BOOL)isInteractive
{
  return 1;
}

- (id)insertionContextFromInsertionContextWithZOrder:(unint64_t)a3
{
  v3 = -[CRLDragInsertionContext initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:]([CRLDragInsertionContext alloc], "initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:", self->_preferredCenterRequired, self->_shouldEndEditing, self->_fromDragToInsertController, self->_insertFloating, a3, self->_preferredCenter.x, self->_preferredCenter.y);

  return v3;
}

- (id)insertionContextFromInsertionContextWithNextZOrder
{
  unint64_t targetZOrder = self->_targetZOrder;
  if (targetZOrder == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v3 = targetZOrder + 1;
  }
  v4 = -[CRLDragInsertionContext initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:]([CRLDragInsertionContext alloc], "initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:", self->_preferredCenterRequired, self->_shouldEndEditing, self->_fromDragToInsertController, self->_insertFloating, v3, self->_preferredCenter.x, self->_preferredCenter.y);

  return v4;
}

- (BOOL)isPreferredCenterRequired
{
  return self->_preferredCenterRequired;
}

- (CGPoint)preferredCenter
{
  double x = self->_preferredCenter.x;
  double y = self->_preferredCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)shouldEndEditing
{
  return self->_shouldEndEditing;
}

- (BOOL)fromDragToInsertController
{
  return self->_fromDragToInsertController;
}

- (BOOL)insertFloating
{
  return self->_insertFloating;
}

- (unint64_t)targetZOrder
{
  return self->_targetZOrder;
}

@end