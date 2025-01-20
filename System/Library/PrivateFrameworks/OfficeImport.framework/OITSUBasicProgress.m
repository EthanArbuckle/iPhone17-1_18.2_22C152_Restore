@interface OITSUBasicProgress
- (BOOL)isIndeterminate;
- (OITSUBasicProgress)init;
- (OITSUBasicProgress)initWithMaxValue:(double)a3;
- (double)maxValue;
- (double)value;
- (void)dealloc;
- (void)setIndeterminate:(BOOL)a3;
- (void)setValue:(double)a3;
@end

@implementation OITSUBasicProgress

- (OITSUBasicProgress)initWithMaxValue:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)OITSUBasicProgress;
  v4 = [(OITSUProgress *)&v7 init];
  if (v4)
  {
    v5 = objc_alloc_init(OITSUBasicProgressStorage);
    v4->mStorage = v5;
    [(OITSUBasicProgressStorage *)v5 setMaxValue:a3];
  }
  return v4;
}

- (OITSUBasicProgress)init
{
  return [(OITSUBasicProgress *)self initWithMaxValue:1.0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUBasicProgress;
  [(OITSUProgress *)&v3 dealloc];
}

- (double)value
{
  [(OITSUBasicProgressStorage *)self->mStorage value];
  return result;
}

- (void)setValue:(double)a3
{
  [(OITSUBasicProgressStorage *)self->mStorage setValue:a3];
  [(OITSUProgress *)self protected_progressDidChange];
}

- (double)maxValue
{
  [(OITSUBasicProgressStorage *)self->mStorage maxValue];
  return result;
}

- (BOOL)isIndeterminate
{
  return [(OITSUBasicProgressStorage *)self->mStorage isIndeterminate];
}

- (void)setIndeterminate:(BOOL)a3
{
  [(OITSUBasicProgressStorage *)self->mStorage setIndeterminate:a3];
  [(OITSUProgress *)self protected_progressDidChange];
}

@end