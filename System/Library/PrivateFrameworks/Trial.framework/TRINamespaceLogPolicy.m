@interface TRINamespaceLogPolicy
+ (BOOL)shouldPrivacyFilterNamespace:(id)a3 policy:(unsigned __int8)a4;
@end

@implementation TRINamespaceLogPolicy

+ (BOOL)shouldPrivacyFilterNamespace:(id)a3 policy:(unsigned __int8)a4
{
  int v4 = a4;
  id v5 = a3;
  if (v4 == 2 || v4 == 1 && ([MEMORY[0x1E4F93B08] isInternalBuild] & 1) == 0)
  {
    if ([&unk_1EEFCBD98 containsObject:v5]) {
      char v6 = 1;
    }
    else {
      char v6 = [v5 hasPrefix:@"FED_STATS_BIOME"];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

@end