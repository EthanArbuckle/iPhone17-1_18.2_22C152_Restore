@interface PBCodable
@end

@implementation PBCodable

id __61__PBCodable_MRAdditions__mr_valueForPotentiallyUndefinedKey___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  NSSelectorFromString(*(NSString **)(a1 + 40));
  if (objc_opt_respondsToSelector())
  {
    v2 = [*(id *)(a1 + 32) valueForKey:*(void *)(a1 + 40)];
  }
  else
  {
    v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "Encountered unknown protobuf key (%@) while converting to a dictionary; skipping.",
        (uint8_t *)&v6,
        0xCu);
    }

    v2 = 0;
  }

  return v2;
}

@end