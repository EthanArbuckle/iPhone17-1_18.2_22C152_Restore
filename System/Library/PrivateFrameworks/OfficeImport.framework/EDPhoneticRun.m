@interface EDPhoneticRun
- (EDPhoneticRun)init;
- (id)description;
- (unsigned)charBaseCount;
- (unsigned)charBaseIndex;
- (unsigned)charIndex;
- (void)adjustIndex:(unint64_t)a3;
- (void)setCharBaseCount:(unsigned int)a3;
- (void)setCharBaseIndex:(unsigned int)a3;
- (void)setCharIndex:(unsigned int)a3;
@end

@implementation EDPhoneticRun

- (EDPhoneticRun)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDPhoneticRun;
  result = [(EDPhoneticRun *)&v3 init];
  if (result)
  {
    *(void *)&result->mCharIndex = -1;
    result->mBaseCharCount = 0;
  }
  return result;
}

- (unsigned)charIndex
{
  return self->mCharIndex;
}

- (void)adjustIndex:(unint64_t)a3
{
  *(int32x2_t *)&self->mCharIndex = vadd_s32(*(int32x2_t *)&self->mCharIndex, vdup_n_s32(a3));
}

- (void)setCharIndex:(unsigned int)a3
{
  self->mCharIndex = a3;
}

- (unsigned)charBaseIndex
{
  return self->mBaseCharIndex;
}

- (void)setCharBaseIndex:(unsigned int)a3
{
  self->mBaseCharIndex = a3;
}

- (unsigned)charBaseCount
{
  return self->mBaseCharCount;
}

- (void)setCharBaseCount:(unsigned int)a3
{
  self->mBaseCharCount = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDPhoneticRun;
  v2 = [(EDPhoneticRun *)&v4 description];
  return v2;
}

@end