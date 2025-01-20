@interface TSTTextEngineDelegate
- (BOOL)forceWesternLineBreaking;
- (TSTTextEngineDelegate)initWithPadding:(UIEdgeInsets)a3 verticalAlignment:(unsigned int)a4;
- (id)padding;
- (unsigned)verticalAlignment;
- (void)dealloc;
@end

@implementation TSTTextEngineDelegate

- (TSTTextEngineDelegate)initWithPadding:(UIEdgeInsets)a3 verticalAlignment:(unsigned int)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  v11.receiver = self;
  v11.super_class = (Class)TSTTextEngineDelegate;
  v9 = [(TSTTextEngineDelegate *)&v11 init];
  if (v9)
  {
    v9->mPadding = [[TSWPPadding alloc] initWithTopInset:top leftInset:left bottomInset:bottom rightInset:right];
    v9->mVerticalAlignment = a4;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTextEngineDelegate;
  [(TSTTextEngineDelegate *)&v3 dealloc];
}

- (id)padding
{
  return self->mPadding;
}

- (unsigned)verticalAlignment
{
  return self->mVerticalAlignment;
}

- (BOOL)forceWesternLineBreaking
{
  return 1;
}

@end