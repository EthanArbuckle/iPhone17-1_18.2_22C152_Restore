@interface TSDDragInsertionContext
- (BOOL)fromDragToInsertController;
- (BOOL)hasPreferredCenter;
- (BOOL)insertFloating;
- (BOOL)insertFromDrag;
- (BOOL)insertWillBeDiscarded;
- (BOOL)isInteractive;
- (BOOL)isPreferredCenterRequired;
- (BOOL)shouldEndEditing;
- (CGPoint)preferredCenter;
- (TSDDragInsertionContext)init;
- (TSDDragInsertionContext)initWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 shouldEndEditing:(BOOL)a5 fromDragToInsertController:(BOOL)a6 insertWillBeDiscarded:(BOOL)a7;
@end

@implementation TSDDragInsertionContext

- (TSDDragInsertionContext)initWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 shouldEndEditing:(BOOL)a5 fromDragToInsertController:(BOOL)a6 insertWillBeDiscarded:(BOOL)a7
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)TSDDragInsertionContext;
  result = [(TSDInsertionContext *)&v14 init];
  if (result)
  {
    result->mPreferredCenter.CGFloat x = x;
    result->mPreferredCenter.CGFloat y = y;
    result->mPreferredCenterRequired = a4;
    result->mShouldEndEditing = a5;
    result->mFromDragToInsertController = a6;
    result->mInsertWillBeDiscarded = a7;
  }
  return result;
}

- (TSDDragInsertionContext)init
{
  return -[TSDDragInsertionContext initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertWillBeDiscarded:](self, "initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertWillBeDiscarded:", 0, 1, 0, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (BOOL)hasPreferredCenter
{
  return 1;
}

- (BOOL)insertFloating
{
  return 0;
}

- (BOOL)insertFromDrag
{
  return 1;
}

- (BOOL)isInteractive
{
  return 1;
}

- (BOOL)isPreferredCenterRequired
{
  return self->mPreferredCenterRequired;
}

- (CGPoint)preferredCenter
{
  double x = self->mPreferredCenter.x;
  double y = self->mPreferredCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)shouldEndEditing
{
  return self->mShouldEndEditing;
}

- (BOOL)fromDragToInsertController
{
  return self->mFromDragToInsertController;
}

- (BOOL)insertWillBeDiscarded
{
  return self->mInsertWillBeDiscarded;
}

@end