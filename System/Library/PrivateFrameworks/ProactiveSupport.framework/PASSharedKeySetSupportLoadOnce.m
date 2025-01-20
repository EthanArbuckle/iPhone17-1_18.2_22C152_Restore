@interface PASSharedKeySetSupportLoadOnce
@end

@implementation PASSharedKeySetSupportLoadOnce

void ___PASSharedKeySetSupportLoadOnce_block_invoke()
{
  v0 = (void *)MEMORY[0x1A62450A0]();
  v1 = (void *)MEMORY[0x1A62450A0]();
  Class v2 = NSClassFromString((NSString *)@"NSSharedKeySet");
  if (!v2)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = [NSString stringWithUTF8String:"void _PASSharedKeySetSupportLoadOnce(void)_block_invoke"];
    [v6 handleFailureInFunction:v7, @"_PASSharedKeySetSupport.m", 26, @"Invalid parameter not satisfying: %@", @"clsSharedKeySet" file lineNumber description];
  }
  _sharedKeySetCountSelector = (uint64_t)NSSelectorFromString((NSString *)@"count");
  v3 = (uint64_t (*)(void, void))[(objc_class *)v2 instanceMethodForSelector:_sharedKeySetCountSelector];
  if (!v3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = [NSString stringWithUTF8String:"void _PASSharedKeySetSupportLoadOnce(void)_block_invoke"];
    [v8 handleFailureInFunction:v9 file:@"_PASSharedKeySetSupport.m" lineNumber:30 description:@"Failed to find NSSharedKeySet IMP for \"count\""];
  }
  _sharedKeySetCount = v3;
  _sharedKeySetIndexForKeySelector = (uint64_t)NSSelectorFromString((NSString *)@"indexForKey:");
  v4 = (uint64_t (*)(void, void, void))[(objc_class *)v2 instanceMethodForSelector:_sharedKeySetIndexForKeySelector];
  if (!v4)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = [NSString stringWithUTF8String:"void _PASSharedKeySetSupportLoadOnce(void)_block_invoke"];
    [v10 handleFailureInFunction:v11 file:@"_PASSharedKeySetSupport.m" lineNumber:36 description:@"Failed to find NSSharedKeySet IMP for \"indexForKey:\""];
  }
  _sharedKeySetIndexForKey = v4;
  _sharedKeySetKeyAtIndexSelector = (uint64_t)NSSelectorFromString((NSString *)@"keyAtIndex:");
  v5 = (uint64_t (*)(void, void, void))[(objc_class *)v2 instanceMethodForSelector:_sharedKeySetKeyAtIndexSelector];
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"void _PASSharedKeySetSupportLoadOnce(void)_block_invoke"];
    [v12 handleFailureInFunction:v13 file:@"_PASSharedKeySetSupport.m" lineNumber:42 description:@"Failed to find NSSharedKeySet IMP for \"keyAtIndex:\""];
  }
  _sharedKeySetKeyAtIndex = v5;
}

@end