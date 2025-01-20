@interface RBAnimation
- (BOOL)isEqual:(id)a3;
- setRBAnimation:(_DWORD *)result;
- (double)activeDuration;
- (float)evaluateAtTime:(double)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)rb_animation;
- (void)addBezierDuration:(double)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5;
- (void)addDelay:(double)a3;
- (void)addPreset:(unsigned int)a3 duration:(double)a4;
- (void)addRepeatCount:(double)a3 autoreverses:(BOOL)a4;
- (void)addSampledFunctionWithDuration:(double)a3 count:(unint64_t)a4 values:(const float *)a5;
- (void)addSpeed:(double)a3;
- (void)addSpringDuration:(double)a3 mass:(double)a4 stiffness:(double)a5 damping:(double)a6 initialVelocity:(double)a7;
- (void)removeAll;
@end

@implementation RBAnimation

- (uint64_t)rb_animation
{
  if (a1) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

- setRBAnimation:(_DWORD *)result
{
  if (result)
  {
    v2 = result;
    v3 = result + 2;
    result[10] = 0;
    if (*(void *)(a2 + 24)) {
      v4 = *(int **)(a2 + 24);
    }
    else {
      v4 = (int *)a2;
    }
    unsigned int v5 = *(_DWORD *)(a2 + 32);
    if (result[11] < v5)
    {
      result = RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(result + 2, *(_DWORD *)(a2 + 32));
      uint64_t v6 = v2[10];
    }
    else
    {
      if (!v5)
      {
        int v11 = 0;
LABEL_14:
        v2[10] = v11 + v5;
        return result;
      }
      uint64_t v6 = 0;
    }
    v7 = (_DWORD *)*((void *)v2 + 4);
    if (!v7) {
      v7 = v3;
    }
    v8 = &v7[v6];
    unsigned int v9 = v5;
    do
    {
      int v10 = *v4++;
      *v8++ = v10;
      --v9;
    }
    while (v9);
    int v11 = v2[10];
    goto LABEL_14;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (_DWORD *)objc_opt_new();
  unsigned int v5 = v4;
  uint64_t v6 = v4 + 2;
  v4[10] = 0;
  if (self->_animation.terms_and_args._p_2) {
    p_2 = (int *)self->_animation.terms_and_args._p_2;
  }
  else {
    p_2 = (int *)&self->_animation;
  }
  unsigned int isa = self[1].super.isa;
  unsigned int v9 = isa;
  if (v4[11] < isa)
  {
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(v4 + 2, isa);
    uint64_t v10 = v5[10];
  }
  else
  {
    if (!isa)
    {
      int v14 = 0;
      goto LABEL_13;
    }
    uint64_t v10 = 0;
  }
  int v11 = (_DWORD *)*((void *)v5 + 4);
  if (!v11) {
    int v11 = v6;
  }
  v12 = &v11[v10];
  do
  {
    int v13 = *p_2++;
    *v12++ = v13;
    --v9;
  }
  while (v9);
  int v14 = v5[10];
LABEL_13:
  v5[10] = v14 + isa;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return RB::Animation::operator==((uint64_t)&self->_animation, (uint64_t)a3 + 8);
}

- (double)activeDuration
{
  p_animation = &self->_animation;
  if (self->_animation.terms_and_args._p_2) {
    p_animation = self->_animation.terms_and_args._p_2;
  }
  return RB::Animation::active_duration((uint64_t)p_animation, LODWORD(self[1].super.isa));
}

- (float)evaluateAtTime:(double)a3
{
  p_animation = &self->_animation;
  if (self->_animation.terms_and_args._p_2) {
    p_2 = self->_animation.terms_and_args._p_2;
  }
  else {
    p_2 = &self->_animation;
  }
  RB::Animation::prepare((uint64_t)p_2, LODWORD(self[1].super.isa), (uint64_t)v11);
  if (self->_animation.terms_and_args._p_2) {
    unsigned int v9 = self->_animation.terms_and_args._p_2;
  }
  else {
    unsigned int v9 = (TermOrArg)"_size"I"_capacity"I *)p_animation;
  }
  *(float *)&double v7 = a3;
  RB::Animation::eval((uint64_t)v9, LODWORD(self[1].super.isa), v11, v7, v8);
  return result;
}

- (void)removeAll
{
  LODWORD(self[1].super.isa) = 0;
}

- (void)addPreset:(unsigned int)a3 duration:(double)a4
{
  if (a3 <= 0xA)
  {
    uint64_t v4 = a3;
    p_animation = (char *)&self->_animation;
    unsigned int isa = self[1].super.isa;
    unsigned int v7 = isa + 2;
    if (isa <= 0xFFFFFFFD && HIDWORD(self[1].super.isa) < v7)
    {
      int v13 = self;
      unsigned int v14 = isa + 2;
      double v12 = a4;
      uint64_t v10 = &self->_animation;
      uint64_t v11 = a3;
      RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v7);
      p_animation = (char *)v10;
      uint64_t v4 = v11;
      unsigned int v7 = v14;
      self = v13;
      a4 = v12;
    }
    LODWORD(self[1].super.isa) = v7;
    if (self->_animation.terms_and_args._p_2) {
      p_animation = (char *)self->_animation.terms_and_args._p_2;
    }
    double v8 = &p_animation[4 * v7];
    *((_DWORD *)v8 - 2) = -[RBAnimation addPreset:duration:]::terms[v4];
    float v9 = a4;
    *((float *)v8 - 1) = v9;
  }
}

- (void)addBezierDuration:(double)a3 controlPoint1:(CGPoint)a4 controlPoint2:(CGPoint)a5
{
  float x = a4.x;
  BOOL v6 = fabsf(x + -0.42) < 0.005;
  if (a4.y != 0.0) {
    BOOL v6 = 0;
  }
  float v7 = a5.x;
  BOOL v8 = fabsf(v7 + -0.58) < 0.005;
  if (a5.y != 1.0) {
    BOOL v8 = 0;
  }
  if (v6 && v8)
  {
    uint64_t v12 = 4;
LABEL_22:
    [(RBAnimation *)self addPreset:v12 duration:a3];
    return;
  }
  if (a5.x != 1.0) {
    BOOL v6 = 0;
  }
  if (v6 && a5.y == 1.0)
  {
    uint64_t v12 = 2;
    goto LABEL_22;
  }
  char v11 = !v8;
  if (a4.x != 0.0) {
    char v11 = 1;
  }
  if ((v11 & 1) == 0 && a4.y == 0.0)
  {
    uint64_t v12 = 3;
    goto LABEL_22;
  }
  p_animation = (char *)&self->_animation;
  unsigned int isa = self[1].super.isa;
  unsigned int v15 = isa + 6;
  if (isa <= 0xFFFFFFF9 && HIDWORD(self[1].super.isa) < v15)
  {
    v26 = self;
    unsigned int v27 = isa + 6;
    double v25 = a3;
    CGFloat y = a5.y;
    CGFloat v24 = a4.y;
    v22 = &self->_animation;
    float v23 = a4.x;
    float v20 = a5.x;
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v15);
    float v7 = v20;
    float x = v23;
    unsigned int v15 = v27;
    p_animation = (char *)v22;
    self = v26;
    a4.CGFloat y = v24;
    a5.CGFloat y = y;
    a3 = v25;
  }
  LODWORD(self[1].super.isa) = v15;
  if (self->_animation.terms_and_args._p_2) {
    p_animation = (char *)self->_animation.terms_and_args._p_2;
  }
  v16 = &p_animation[4 * v15];
  *((_DWORD *)v16 - 6) = 8;
  float v17 = a3;
  *((float *)v16 - 5) = v17;
  *((float *)v16 - 4) = x;
  float v18 = a4.y;
  *((float *)v16 - 3) = v18;
  *((float *)v16 - 2) = v7;
  float v19 = a5.y;
  *((float *)v16 - 1) = v19;
}

- (void)addSpringDuration:(double)a3 mass:(double)a4 stiffness:(double)a5 damping:(double)a6 initialVelocity:(double)a7
{
  if (a7 == 0.0) {
    int v13 = 9;
  }
  else {
    int v13 = 10;
  }
  if (a7 == 0.0) {
    unsigned int v14 = 5;
  }
  else {
    unsigned int v14 = 6;
  }
  p_animation = &self->_animation;
  unsigned int isa = self[1].super.isa;
  unsigned int v17 = isa + v14;
  if (isa < isa + v14 && HIDWORD(self[1].super.isa) < v17) {
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v17);
  }
  LODWORD(self[1].super.isa) = v17;
  p_2 = self->_animation.terms_and_args._p_2;
  if (!p_2) {
    p_2 = (TermOrArg)"_size"I"_capacity"I *)p_animation;
  }
  uint64_t v19 = (uint64_t)p_2 + 4 * v17 + -4 * v14;
  *(_DWORD *)uint64_t v19 = v13;
  float v20 = a3;
  float v21 = a4;
  *(float *)(v19 + 4) = v20;
  *(float *)(v19 + 8) = v21;
  float v22 = a5;
  float v23 = a6;
  *(float *)(v19 + 12) = v22;
  *(float *)(v19 + 16) = v23;
  if (a7 != 0.0)
  {
    float v24 = a7;
    *(float *)(v19 + 20) = v24;
  }
}

- (void)addSampledFunctionWithDuration:(double)a3 count:(unint64_t)a4 values:(const float *)a5
{
  int v9 = 2 * a4;
  int v10 = 2 * a4 + 3;
  p_animation = &self->_animation;
  unsigned int isa = self[1].super.isa;
  uint64_t v13 = isa + v10;
  if (isa < v13 && HIDWORD(self[1].super.isa) < v13) {
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v13);
  }
  LODWORD(self[1].super.isa) = v13;
  if (self->_animation.terms_and_args._p_2) {
    p_2 = self->_animation.terms_and_args._p_2;
  }
  else {
    p_2 = (TermOrArg)"_size"I"_capacity"I *)p_animation;
  }
  uint64_t v15 = (uint64_t)p_2 + 4 * v13 + -4 * v10;
  *(_DWORD *)uint64_t v15 = 18;
  *(_DWORD *)(v15 + 4) = a4;
  float v16 = a3;
  *(float *)(v15 + 8) = v16;
  unint64_t v17 = 2 * a4;
  if (2 * a4)
  {
    float v18 = (_DWORD *)((char *)p_2 + 4 * v13 + -4 * (v9 + 2) + 8);
    do
    {
      int v19 = *(_DWORD *)a5++;
      *v18++ = v19;
      --v17;
    }
    while (v17);
  }
}

- (void)addSpeed:(double)a3
{
  p_animation = &self->_animation;
  unsigned int isa = self[1].super.isa;
  unsigned int v7 = isa + 2;
  if (isa <= 0xFFFFFFFD && HIDWORD(self[1].super.isa) < v7) {
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v7);
  }
  LODWORD(self[1].super.isa) = v7;
  p_2 = self->_animation.terms_and_args._p_2;
  if (!p_2) {
    p_2 = (TermOrArg)"_size"I"_capacity"I *)p_animation;
  }
  int v9 = (char *)p_2 + 4 * v7;
  *((_DWORD *)v9 - 2) = 11;
  float v10 = a3;
  *((float *)v9 - 1) = v10;
}

- (void)addDelay:(double)a3
{
  p_animation = &self->_animation;
  unsigned int isa = self[1].super.isa;
  unsigned int v7 = isa + 2;
  if (isa <= 0xFFFFFFFD && HIDWORD(self[1].super.isa) < v7) {
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v7);
  }
  LODWORD(self[1].super.isa) = v7;
  p_2 = self->_animation.terms_and_args._p_2;
  if (!p_2) {
    p_2 = (TermOrArg)"_size"I"_capacity"I *)p_animation;
  }
  int v9 = (char *)p_2 + 4 * v7;
  *((_DWORD *)v9 - 2) = 12;
  float v10 = a3;
  *((float *)v9 - 1) = v10;
}

- (void)addRepeatCount:(double)a3 autoreverses:(BOOL)a4
{
  BOOL v4 = a4;
  p_animation = &self->_animation;
  unsigned int isa = self[1].super.isa;
  unsigned int v9 = isa + 2;
  if (isa <= 0xFFFFFFFD && HIDWORD(self[1].super.isa) < v9) {
    RB::vector<RB::Animation::TermOrArg,6ul,unsigned int>::reserve_slow(&self->_animation, v9);
  }
  LODWORD(self[1].super.isa) = v9;
  p_2 = self->_animation.terms_and_args._p_2;
  if (!p_2) {
    p_2 = (TermOrArg)"_size"I"_capacity"I *)p_animation;
  }
  char v11 = (char *)p_2 + 4 * v9;
  if (v4) {
    int v12 = 14;
  }
  else {
    int v12 = 13;
  }
  *((_DWORD *)v11 - 2) = v12;
  float v13 = a3;
  *((float *)v11 - 1) = v13;
}

- (void).cxx_destruct
{
  p_2 = self->_animation.terms_and_args._p_2;
  if (p_2) {
    free(p_2);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0x600000000;
  return self;
}

@end