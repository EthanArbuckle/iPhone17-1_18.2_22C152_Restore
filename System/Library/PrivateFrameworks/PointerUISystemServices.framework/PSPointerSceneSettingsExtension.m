@interface PSPointerSceneSettingsExtension
+ (id)protocol;
+ (id)valueForUndefinedSetting:(id)a3;
- (CGAffineTransform)rootWindowTransform;
- (void)rootWindowTransform:(CGAffineTransform *)a3;
@end

@implementation PSPointerSceneSettingsExtension

+ (id)protocol
{
  return &unk_1F335BC68;
}

+ (id)valueForUndefinedSetting:(id)a3
{
  if ([a3 matchesProperty:sel_rootWindowTransform])
  {
    v3 = [MEMORY[0x1E4F29238] valueWithBytes:MEMORY[0x1E4F1DAB8] objCType:"{CGAffineTransform=dddddd}"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (CGAffineTransform)rootWindowTransform
{
  v4 = [(PSPointerSceneSettingsExtension *)self valueForProperty:a3 expectedClass:objc_opt_class()];
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  if (v4)
  {
    id v5 = v4;
    if (!strcmp((const char *)[v5 objCType], "{CGAffineTransform=dddddd}")) {
      [v5 getValue:retstr size:48];
    }
  }

  return (CGAffineTransform *)MEMORY[0x1F41817F8]();
}

- (void)rootWindowTransform:(CGAffineTransform *)a3
{
  [MEMORY[0x1E4F29238] valueWithBytes:a3 objCType:"{CGAffineTransform=dddddd}"];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PSPointerSceneSettingsExtension *)self setValue:v5 forProperty:a2];
}

@end