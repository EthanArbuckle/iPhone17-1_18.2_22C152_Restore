@interface ODDLayoutVariablePropertySet
+ (id)defaultProperties;
- (BOOL)hasDirection;
- (ODDLayoutVariablePropertySet)initWithDefaults;
- (id)description;
- (int)direction;
- (void)setDirection:(int)a3;
@end

@implementation ODDLayoutVariablePropertySet

- (ODDLayoutVariablePropertySet)initWithDefaults
{
  v6.receiver = self;
  v6.super_class = (Class)ODDLayoutVariablePropertySet;
  v2 = [(OADProperties *)&v6 initWithDefaults];
  v3 = v2;
  if (v2)
  {
    [(ODDLayoutVariablePropertySet *)v2 setDirection:0];
    v4 = v3;
  }

  return v3;
}

- (int)direction
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasDirection];
  int v3 = v2[5];

  return v3;
}

- (void)setDirection:(int)a3
{
  *((_DWORD *)&self->super + 5) = a3;
  LOBYTE(self->mDirection) = 1;
}

- (BOOL)hasDirection
{
  return LOBYTE(self->mDirection)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

+ (id)defaultProperties
{
  if (+[ODDLayoutVariablePropertySet defaultProperties]::once != -1) {
    dispatch_once(&+[ODDLayoutVariablePropertySet defaultProperties]::once, &__block_literal_global_66);
  }
  v2 = (void *)+[ODDLayoutVariablePropertySet defaultProperties]::defaultProperties;
  return v2;
}

void __49__ODDLayoutVariablePropertySet_defaultProperties__block_invoke()
{
  v0 = [[ODDLayoutVariablePropertySet alloc] initWithDefaults];
  v1 = (void *)+[ODDLayoutVariablePropertySet defaultProperties]::defaultProperties;
  +[ODDLayoutVariablePropertySet defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)ODDLayoutVariablePropertySet;
  v2 = [(OADProperties *)&v4 description];
  return v2;
}

@end