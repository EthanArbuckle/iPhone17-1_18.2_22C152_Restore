@interface WDRunWithCharacterProperties
- (BOOL)isHidden;
- (WDCharacterProperties)properties;
- (WDRunWithCharacterProperties)initWithParagraph:(id)a3;
- (void)clearProperties;
- (void)setProperties:(id)a3;
@end

@implementation WDRunWithCharacterProperties

- (WDRunWithCharacterProperties)initWithParagraph:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WDRunWithCharacterProperties;
  v3 = [(WDRun *)&v7 initWithParagraph:a3];
  v4 = v3;
  if (v3)
  {
    mProperties = v3->mProperties;
    v3->mProperties = 0;
  }
  return v4;
}

- (void)clearProperties
{
}

- (BOOL)isHidden
{
  BOOL v3 = [(WDCharacterProperties *)self->mProperties isHiddenOverridden];
  mProperties = self->mProperties;
  if (v3)
  {
    LOBYTE(v5) = [(WDCharacterProperties *)mProperties hidden] != 0;
  }
  else if ([(WDCharacterProperties *)mProperties isBaseStyleOverridden] {
         && ([(WDCharacterProperties *)self->mProperties baseStyle],
  }
             (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v7 = (void *)v6;
    while (1)
    {
      v8 = [v7 characterProperties];
      int v9 = [v8 isHiddenOverridden];

      if (v9)
      {
        v11 = [v7 characterProperties];
        LOBYTE(v5) = [v11 hidden] == 1;

        goto LABEL_13;
      }
      v10 = [v7 baseStyle];

      if (v10 == v7) {
        break;
      }
      uint64_t v5 = [v7 baseStyle];

      objc_super v7 = (void *)v5;
      if (!v5) {
        return v5;
      }
    }
    LOBYTE(v5) = 0;
LABEL_13:
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (WDCharacterProperties)properties
{
  return (WDCharacterProperties *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

@end