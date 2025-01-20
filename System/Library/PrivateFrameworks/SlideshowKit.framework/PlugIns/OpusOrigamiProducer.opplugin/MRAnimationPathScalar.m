@interface MRAnimationPathScalar
- (MRAnimationPathScalar)initWithMCAnimationPath:(id)a3 andValue:(double)a4;
- (void)dealloc;
@end

@implementation MRAnimationPathScalar

- (MRAnimationPathScalar)initWithMCAnimationPath:(id)a3 andValue:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MRAnimationPathScalar;
  v6 = [(MRAnimationPathScalar *)&v8 init];
  if (v6)
  {
    *((void *)v6 + 1) = a3;
    *((double *)v6 + 2) = a4;
    *(_OWORD *)(v6 + 24) = xmmword_165410;
  }
  return (MRAnimationPathScalar *)v6;
}

- (void)dealloc
{
  self->animationPath = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRAnimationPathScalar;
  [(MRAnimationPathScalar *)&v3 dealloc];
}

@end