@interface NTPBPersonalizationAggregateDelta
@end

@implementation NTPBPersonalizationAggregateDelta

IMP __75__NTPBPersonalizationAggregateDelta_FCBugFixSwizzle__fc_swizzleFor24117796__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_addEvents_);
  v2 = imp_implementationWithBlock(&__block_literal_global_16);
  return method_setImplementation(InstanceMethod, v2);
}

uint64_t __75__NTPBPersonalizationAggregateDelta_FCBugFixSwizzle__fc_swizzleFor24117796__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  v4 = a2;
  v5 = v4;
  v6 = (char *)v4 + (int)*MEMORY[0x1E4F82C80];
  uint64_t v7 = *((void *)v6 + 2);
  if (v7 && *((void *)v6 + 1) == v7)
  {
    if (v7 >= 1)
    {
      v10 = v4;
      v4 = malloc_type_realloc(*(void **)v6, 8 * v7, 0x100004052888210uLL);
      v5 = v10;
      if (v4)
      {
        *((void *)v6 + 2) = 2 * v7;
        uint64_t v8 = *((void *)v6 + 1);
        v4[v8] = a3;
        *(void *)v6 = v4;
        *((void *)v6 + 1) = v8 + 1;
      }
    }
  }
  else
  {
    v11 = v4;
    v4 = (_DWORD *)PBRepeatedUInt32Add();
    v5 = v11;
  }
  return MEMORY[0x1F41817F8](v4, v5);
}

@end