@interface PDTransition
- (BOOL)hasAdvanceAfterTime;
- (BOOL)hasIsAdvanceOnClick;
- (BOOL)hasSpeed;
- (BOOL)hasTransitionOptions;
- (BOOL)hasType;
- (BOOL)isAdvanceOnClick;
- (NSNumber)duration;
- (PDTransition)init;
- (id)description;
- (id)options;
- (int)advanceAfterTime;
- (int)speed;
- (int)type;
- (void)setAdvanceAfterTime:(int)a3;
- (void)setDuration:(id)a3;
- (void)setIsAdvanceOnClick:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setSpeed:(int)a3;
- (void)setType:(int)a3;
@end

@implementation PDTransition

- (PDTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDTransition;
  result = [(OADProperties *)&v3 init];
  if (result) {
    *(&result->mHasSpeed + 1) = 1;
  }
  return result;
}

- (void)setSpeed:(int)a3
{
  self->mHasType = 1;
  self->mType = a3;
}

- (void)setIsAdvanceOnClick:(BOOL)a3
{
  self->mHasSpeed = 1;
  *(&self->mHasSpeed + 1) = a3;
}

- (void)setAdvanceAfterTime:(int)a3
{
  *(&self->mHasSpeed + 2) = 1;
  self->mSpeed = a3;
}

- (void)setType:(int)a3
{
  *((unsigned char *)&self->super + 17) = 1;
  *((_DWORD *)&self->super + 5) = a3;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)hasType
{
  return *((unsigned char *)&self->super + 17)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (int)type
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasType];
  int v3 = v2[5];

  return v3;
}

- (BOOL)hasIsAdvanceOnClick
{
  return self->mHasSpeed || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isAdvanceOnClick
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasIsAdvanceOnClick];
  char v3 = v2[33];

  return v3;
}

- (BOOL)hasSpeed
{
  return self->mHasType || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (int)speed
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasSpeed];
  int v3 = v2[7];

  return v3;
}

- (BOOL)hasAdvanceAfterTime
{
  return *(&self->mHasSpeed + 2)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (int)advanceAfterTime
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasAdvanceAfterTime];
  int v3 = v2[9];

  return v3;
}

- (BOOL)hasTransitionOptions
{
  return *(void *)&self->mHasAdvanceOnClick
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)options
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasTransitionOptions];
  id v3 = v2[5];

  return v3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDTransition;
  v2 = [(OADProperties *)&v4 description];
  return v2;
}

- (NSNumber)duration
{
  return (NSNumber *)self->mOptions;
}

- (void)setDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOptions, 0);
  objc_storeStrong((id *)&self->mHasAdvanceOnClick, 0);
}

@end