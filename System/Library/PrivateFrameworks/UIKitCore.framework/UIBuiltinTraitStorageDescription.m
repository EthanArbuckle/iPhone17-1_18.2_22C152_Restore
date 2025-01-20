@interface UIBuiltinTraitStorageDescription
@end

@implementation UIBuiltinTraitStorageDescription

unint64_t ___UIBuiltinTraitStorageDescription_block_invoke(uint64_t a1, unint64_t *a2, void *a3, uint64_t a4)
{
  unint64_t result = *a2;
  if (*a2 != a4)
  {
    v8 = _UIBuiltinTraitStorageDescriptionForIntegerTraitName(result, a3);
    v9 = *(void **)(a1 + 32);
    v10 = NSString;
    uint64_t v11 = _UIDescriptionForTraitName(a3);
    if (v8) {
      uint64_t v12 = [v10 stringWithFormat:@"%@ = %@", v11, v8];
    }
    else {
      uint64_t v12 = [v10 stringWithFormat:@"%@ = %ld", v11, *a2];
    }
    return [v9 addObject:v12];
  }
  return result;
}

uint64_t ___UIBuiltinTraitStorageDescription_block_invoke_3(uint64_t result, void *a2, void *a3, double a4)
{
  if (*(double *)a2 != a4)
  {
    v4 = *(void **)(result + 32);
    uint64_t v5 = [NSString stringWithFormat:@"%@ = %g", _UIDescriptionForTraitName(a3), *a2];
    return [v4 addObject:v5];
  }
  return result;
}

uint64_t ___UIBuiltinTraitStorageDescription_block_invoke_2(uint64_t result, void *a2, void *a3, uint64_t a4)
{
  if (*a2 != a4)
  {
    v4 = *(void **)(result + 32);
    uint64_t v5 = [NSString stringWithFormat:@"%@ = %ld", _UIDescriptionForTraitName(a3), *a2];
    return [v4 addObject:v5];
  }
  return result;
}

@end