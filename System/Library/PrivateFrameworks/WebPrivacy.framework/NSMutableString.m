@interface NSMutableString
@end

@implementation NSMutableString

void __82__NSMutableString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained length];
    v7 = [v3 absoluteString];
    v8 = operator new(0x18uLL);
    v9 = v8 + 3;
    v13[0] = v8;
    v13[2] = v8 + 3;
    void *v8 = 0;
    v8[1] = v6;
    id v10 = v7;
    v8[2] = v10;
    v13[1] = v8 + 3;
    while (v9 != (void *)v13[0])
    {
      uint64_t v11 = *(v9 - 3);
      uint64_t v12 = *(v9 - 2);
      v9 -= 3;
      objc_msgSend(v5, "replaceCharactersInRange:withString:", v11, v12, v9[2]);
    }
    v14 = (void **)v13;
    std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v14);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__NSMutableString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    for (uint64_t i = a2[1];
          i != *a2;
          objc_msgSend(WeakRetained, "replaceCharactersInRange:withString:", v6, v7, *(void *)(i + 16)))
    {
      uint64_t v6 = *(void *)(i - 24);
      uint64_t v7 = *(void *)(i - 16);
      i -= 24;
    }
  }

  v8 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v8();
}

@end