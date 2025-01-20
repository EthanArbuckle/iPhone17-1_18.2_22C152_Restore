@interface OADShapeProperties
+ (id)defaultProperties;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTextBox;
- (unint64_t)hash;
- (void)setIsTextBox:(BOOL)a3;
@end

@implementation OADShapeProperties

+ (id)defaultProperties
{
  if (+[OADShapeProperties defaultProperties]::once != -1) {
    dispatch_once(&+[OADShapeProperties defaultProperties]::once, &__block_literal_global_61);
  }
  v2 = (void *)+[OADShapeProperties defaultProperties]::defaultProperties;
  return v2;
}

- (BOOL)isTextBox
{
  return *((unsigned char *)&self->super + 121);
}

- (void)setIsTextBox:(BOOL)a3
{
  *((unsigned char *)&self->super + 121) = a3;
}

- (unint64_t)hash
{
  uint64_t v2 = *((unsigned __int8 *)&self->super + 121);
  v4.receiver = self;
  v4.super_class = (Class)OADShapeProperties;
  return [(OADGraphicProperties *)&v4 hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v6 = v4;
    unint64_t v7 = [(OADShapeProperties *)self hash];
    if (v7 == [v6 hash])
    {
      int v8 = [v6 isTextBox];
      if (v8 == [(OADShapeProperties *)self isTextBox])
      {
        v10.receiver = self;
        v10.super_class = (Class)OADShapeProperties;
        [(OADGraphicProperties *)&v10 isEqual:v6];
      }
    }
  }
  return isKindOfClass & 1;
}

void __39__OADShapeProperties_defaultProperties__block_invoke()
{
  v0 = [(OADGraphicProperties *)[OADShapeProperties alloc] initWithDefaults];
  v1 = (void *)+[OADShapeProperties defaultProperties]::defaultProperties;
  +[OADShapeProperties defaultProperties]::defaultProperties = (uint64_t)v0;
}

@end