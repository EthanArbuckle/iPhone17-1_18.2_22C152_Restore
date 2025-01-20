@interface ACAccount
@end

@implementation ACAccount

void __75__ACAccount_ICAccountAdditions__ic_setPrivateListeningEnabledForHomeUsers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 UUIDString];
  [v4 setObject:v5 forKey:v6];
}

void __71__ACAccount_ICAccountAdditions__ic_privateListeningEnabledForHomeUsers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (_NSIsNSString() && _NSIsNSNumber())
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
    if (v6) {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
    }
  }
}

@end