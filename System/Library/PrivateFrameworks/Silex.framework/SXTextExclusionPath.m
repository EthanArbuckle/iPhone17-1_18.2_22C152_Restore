@interface SXTextExclusionPath
- (double)actualPosition;
- (double)exclusionRect;
- (double)insets;
- (double)path;
- (double)position;
- (double)setExclusionRect:(double)a3;
- (double)verticalAlignmentFactor;
- (id)description;
- (id)initWithTextRange:(uint64_t)a3 position:(double)a4 rect:(double)a5 withInsets:(double)a6;
- (uint64_t)lineVerticalAlignment;
- (uint64_t)range;
- (uint64_t)setActualPosition:(double)a3;
- (uint64_t)setFullBleed:(uint64_t)result;
- (uint64_t)setLineVerticalAlignment:(uint64_t)result;
- (uint64_t)setRange:(uint64_t)a3;
- (uint64_t)setVerticalAlignmentFactor:(uint64_t)result;
- (uint64_t)type;
- (void)adjustYPositionWithCurrentPosition:(double)a3;
- (void)callCompletionBlock;
- (void)callStartBlock;
- (void)setCompletionBlock:(void *)a1;
- (void)setComponentIdentifier:(uint64_t)a1;
- (void)setMinYBlock:(void *)a1;
- (void)wrappable;
@end

@implementation SXTextExclusionPath

- (id)initWithTextRange:(uint64_t)a3 position:(double)a4 rect:(double)a5 withInsets:(double)a6
{
  if (result)
  {
    v26.receiver = result;
    v26.super_class = (Class)SXTextExclusionPath;
    result = objc_msgSendSuper2(&v26, sel_init);
    if (result)
    {
      *((_DWORD *)result + 3) = 2;
      *((void *)result + 16) = a2;
      *((void *)result + 17) = a3;
      *((double *)result + 12) = a4 - a13;
      *((double *)result + 13) = a5 - a12;
      *((double *)result + 18) = a12;
      *((double *)result + 19) = a13;
      *((double *)result + 20) = a14;
      *((double *)result + 21) = a15;
      *((double *)result + 22) = a6;
      *((double *)result + 23) = a7;
      *((double *)result + 24) = a8 + a13 + a15;
      *((double *)result + 25) = a9 + a12 + a14;
    }
  }
  return result;
}

- (uint64_t)setActualPosition:(double)a3
{
  if (result)
  {
    *(double *)(result + 80) = a2;
    *(double *)(result + 88) = a3;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self) {
    componentIdentifier = self->_componentIdentifier;
  }
  else {
    componentIdentifier = 0;
  }
  v6 = componentIdentifier;
  v7 = -[SXTextExclusionPath path]((double *)self);
  [v7 bounds];
  v8 = NSStringFromCGRect(v15);
  if (self)
  {
    CGFloat x = self->_actualPosition.x;
    CGFloat y = self->_actualPosition.y;
  }
  else
  {
    CGFloat y = 0.0;
    CGFloat x = 0.0;
  }
  v11 = NSStringFromCGPoint(*(CGPoint *)&x);
  v12 = [v3 stringWithFormat:@"%@ <%p>: %@, %@, position: %@", v4, self, v6, v8, v11];

  return v12;
}

- (double)path
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRect:", a1[22], a1[23], a1[24], a1[25]);
    a1 = (double *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (double)actualPosition
{
  if (a1) {
    return *(double *)(a1 + 80);
  }
  else {
    return 0.0;
  }
}

- (void)wrappable
{
  if (a1)
  {
    v2 = a1;
    if (!a1[9])
    {
      v3 = [[SXTextExclusionPathWrapper alloc] initWithTextExclusionPath:a1];
      uint64_t v4 = (void *)v2[9];
      v2[9] = v3;
    }
    a1 = (id)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)callStartBlock
{
  if (a1 && a1[6])
  {
    (*(void (**)(void))(a1[6] + 16))();
    objc_setProperty_nonatomic_copy(a1, v2, 0, 48);
  }
}

- (void)adjustYPositionWithCurrentPosition:(double)a3
{
  if (a1 && *(void *)(a1 + 56))
  {
    double v5 = (*(double (**)(void))(*(void *)(a1 + 56) + 16))();
    if (v5 < a3) {
      double v5 = a3;
    }
    *(double *)(a1 + 104) = v5;
  }
}

- (void)callCompletionBlock
{
  if (a1)
  {
    objc_setProperty_nonatomic_copy(a1, a2, 0, 56);
    if (a1[8])
    {
      (*(void (**)(void))(a1[8] + 16))();
      objc_setProperty_nonatomic_copy(a1, v3, 0, 64);
    }
  }
}

- (void)setMinYBlock:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 56);
  }
}

- (void)setCompletionBlock:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 64);
  }
}

- (double)exclusionRect
{
  if (a1) {
    return *(double *)(a1 + 176);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)type
{
  if (result) {
    return *(unsigned int *)(result + 12);
  }
  return result;
}

- (double)position
{
  if (a1) {
    return *(double *)(a1 + 96);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)range
{
  if (result) {
    return *(void *)(result + 128);
  }
  return result;
}

- (uint64_t)setRange:(uint64_t)a3
{
  if (result)
  {
    *(void *)(result + 128) = a2;
    *(void *)(result + 136) = a3;
  }
  return result;
}

- (double)verticalAlignmentFactor
{
  if (a1) {
    return *(double *)(a1 + 32);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setVerticalAlignmentFactor:(uint64_t)result
{
  if (result) {
    *(double *)(result + 32) = a2;
  }
  return result;
}

- (uint64_t)lineVerticalAlignment
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

- (uint64_t)setLineVerticalAlignment:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (double)insets
{
  if (a1) {
    return *(double *)(a1 + 144);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setFullBleed:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 8) = a2;
  }
  return result;
}

- (void)setComponentIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (double)setExclusionRect:(double)a3
{
  if (result)
  {
    result[22] = a2;
    result[23] = a3;
    result[24] = a4;
    result[25] = a5;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrapper, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_minYBlock, 0);
  objc_storeStrong(&self->_startBlock, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
}

@end