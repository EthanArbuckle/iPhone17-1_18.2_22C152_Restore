@interface SBWindowDefaultLayoutStrategy
+ (id)_strategyWithClipping:(BOOL)a3;
+ (id)clipStrategy;
+ (id)noClipStrategy;
- (BOOL)shouldClipForWindow:(id)a3;
- (CGRect)frameWithInterfaceOrientation:(int64_t)a3 windowScene:(id)a4;
- (id)_init;
@end

@implementation SBWindowDefaultLayoutStrategy

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SBWindowDefaultLayoutStrategy;
  return [(SBWindowDefaultLayoutStrategy *)&v3 init];
}

+ (id)_strategyWithClipping:(BOOL)a3
{
  BOOL v3 = a3;
  if (_strategyWithClipping____once != -1) {
    dispatch_once(&_strategyWithClipping____once, &__block_literal_global_401);
  }
  v4 = &_strategyWithClipping____clipStrategy;
  if (!v3) {
    v4 = &_strategyWithClipping____noClipStrategy;
  }
  v5 = (void *)*v4;
  return v5;
}

uint64_t __55__SBWindowDefaultLayoutStrategy__strategyWithClipping___block_invoke()
{
  kdebug_trace();
  id v0 = [[SBWindowDefaultLayoutStrategy alloc] _init];
  v1 = (void *)_strategyWithClipping____clipStrategy;
  _strategyWithClipping____clipStrategy = (uint64_t)v0;

  *(unsigned char *)(_strategyWithClipping____clipStrategy + 8) = 1;
  id v2 = [[SBWindowDefaultLayoutStrategy alloc] _init];
  BOOL v3 = (void *)_strategyWithClipping____noClipStrategy;
  _strategyWithClipping____noClipStrategy = (uint64_t)v2;

  return kdebug_trace();
}

+ (id)clipStrategy
{
  return (id)[a1 _strategyWithClipping:1];
}

+ (id)noClipStrategy
{
  return (id)[a1 _strategyWithClipping:0];
}

- (CGRect)frameWithInterfaceOrientation:(int64_t)a3 windowScene:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    [v5 _referenceBounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat Width = v13;
  }
  else
  {
    v15 = [MEMORY[0x1E4F42D90] mainScreen];
    [v15 _referenceBounds];
    CGFloat v8 = v16;
    CGFloat v10 = v17;
    CGFloat v12 = v18;
    CGFloat Width = v19;
  }
  if ((unint64_t)(a3 - 3) <= 1)
  {
    v25.origin.x = v8;
    v25.origin.y = v10;
    v25.size.width = v12;
    v25.size.height = Width;
    CGFloat Height = CGRectGetHeight(v25);
    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.width = v12;
    v26.size.height = Width;
    CGFloat Width = CGRectGetWidth(v26);
    CGFloat v12 = Height;
  }

  double v21 = v8;
  double v22 = v10;
  double v23 = v12;
  double v24 = Width;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (BOOL)shouldClipForWindow:(id)a3
{
  return self->_clip;
}

@end