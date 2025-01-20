@interface OADTableProperties
+ (id)defaultProperties;
- (BOOL)bandColumn;
- (BOOL)bandRow;
- (BOOL)firstColumn;
- (BOOL)firstRow;
- (BOOL)hasBandsNormalToDir:(int)a3;
- (BOOL)hasEffects;
- (BOOL)hasVectorNormalToDir:(int)a3 atExtremePos:(int)a4;
- (BOOL)lastColumn;
- (BOOL)lastRow;
- (BOOL)rightToLeft;
- (NSString)description;
- (OADTableProperties)initWithDefaults;
- (id)effects;
- (id)style;
- (void)setBandColumn:(BOOL)a3;
- (void)setBandRow:(BOOL)a3;
- (void)setEffects:(id)a3;
- (void)setFirstColumn:(BOOL)a3;
- (void)setFirstRow:(BOOL)a3;
- (void)setLastColumn:(BOOL)a3;
- (void)setLastRow:(BOOL)a3;
- (void)setRightToLeft:(BOOL)a3;
- (void)setStyle:(id)a3;
@end

@implementation OADTableProperties

+ (id)defaultProperties
{
  if (+[OADTableProperties defaultProperties]::once != -1) {
    dispatch_once(&+[OADTableProperties defaultProperties]::once, &__block_literal_global_63);
  }
  v2 = (void *)+[OADTableProperties defaultProperties]::defaultProperties;
  return v2;
}

- (OADTableProperties)initWithDefaults
{
  v5.receiver = self;
  v5.super_class = (Class)OADTableProperties;
  v2 = [(OADDrawableProperties *)&v5 initWithDefaults];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF8C0] array];
    [(OADTableProperties *)v2 setEffects:v3];
  }
  return v2;
}

- (void)setFirstColumn:(BOOL)a3
{
  self->mFirstColumn = a3;
}

- (void)setFirstRow:(BOOL)a3
{
  self->mFirstRow = a3;
}

- (void)setLastColumn:(BOOL)a3
{
  self->mLastColumn = a3;
}

- (void)setLastRow:(BOOL)a3
{
  self->mLastRow = a3;
}

- (void)setBandColumn:(BOOL)a3
{
  self->mBandColumn = a3;
}

- (void)setBandRow:(BOOL)a3
{
  self->mBandRow = a3;
}

- (void)setRightToLeft:(BOOL)a3
{
  self->mRightToLeft = a3;
}

- (void)setEffects:(id)a3
{
}

- (void)setStyle:(id)a3
{
}

- (id)style
{
  return self->mStyle;
}

- (BOOL)firstRow
{
  return self->mFirstRow;
}

- (BOOL)bandRow
{
  return self->mBandRow;
}

- (BOOL)rightToLeft
{
  return self->mRightToLeft;
}

- (BOOL)firstColumn
{
  return self->mFirstColumn;
}

- (BOOL)lastRow
{
  return self->mLastRow;
}

- (BOOL)lastColumn
{
  return self->mLastColumn;
}

- (BOOL)bandColumn
{
  return self->mBandColumn;
}

- (BOOL)hasBandsNormalToDir:(int)a3
{
  if (a3) {
    return [(OADTableProperties *)self bandColumn];
  }
  else {
    return [(OADTableProperties *)self bandRow];
  }
}

- (BOOL)hasVectorNormalToDir:(int)a3 atExtremePos:(int)a4
{
  if (a3)
  {
    if (a4) {
      return [(OADTableProperties *)self lastColumn];
    }
    else {
      return [(OADTableProperties *)self firstColumn];
    }
  }
  else if (a4)
  {
    return [(OADTableProperties *)self lastRow];
  }
  else
  {
    return [(OADTableProperties *)self firstRow];
  }
}

- (id)effects
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasEffects];
  id v3 = v2[11];

  return v3;
}

- (BOOL)hasEffects
{
  return self->mEffects || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

void __39__OADTableProperties_defaultProperties__block_invoke()
{
  v0 = [[OADTableProperties alloc] initWithDefaults];
  v1 = (void *)+[OADTableProperties defaultProperties]::defaultProperties;
  +[OADTableProperties defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTableProperties;
  v2 = [(OADDrawableProperties *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mStyle, 0);
}

@end