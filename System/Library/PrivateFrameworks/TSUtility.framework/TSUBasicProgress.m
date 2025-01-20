@interface TSUBasicProgress
- (BOOL)isIndeterminate;
- (TSUBasicProgress)init;
- (TSUBasicProgress)initWithMaxValue:(double)a3;
- (double)maxValue;
- (double)value;
- (void)dealloc;
- (void)setIndeterminate:(BOOL)a3;
- (void)setValue:(double)a3;
@end

@implementation TSUBasicProgress

- (TSUBasicProgress)initWithMaxValue:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSUBasicProgress;
  v4 = [(TSUProgress *)&v7 init];
  if (v4)
  {
    v5 = objc_alloc_init(TSUBasicProgressStorage);
    v4->mStorage = v5;
    [(TSUBasicProgressStorage *)v5 setMaxValue:a3];
  }
  return v4;
}

- (TSUBasicProgress)init
{
  return [(TSUBasicProgress *)self initWithMaxValue:1.0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSUBasicProgress;
  [(TSUProgress *)&v3 dealloc];
}

- (double)value
{
  [(TSUBasicProgressStorage *)self->mStorage value];
  return result;
}

- (void)setValue:(double)a3
{
  [(TSUBasicProgressStorage *)self->mStorage setValue:a3];
  [(TSUProgress *)self protected_progressDidChange];
}

- (double)maxValue
{
  [(TSUBasicProgressStorage *)self->mStorage maxValue];
  return result;
}

- (BOOL)isIndeterminate
{
  return [(TSUBasicProgressStorage *)self->mStorage isIndeterminate];
}

- (void)setIndeterminate:(BOOL)a3
{
  [(TSUBasicProgressStorage *)self->mStorage setIndeterminate:a3];
  [(TSUProgress *)self protected_progressDidChange];
}

@end