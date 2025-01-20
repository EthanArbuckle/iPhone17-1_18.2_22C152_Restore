@interface NSMutableAttributedString
@end

@implementation NSMutableAttributedString

void __92__NSMutableAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = [*(id *)(a1 + 32) length];
    v6 = [v3 absoluteString];
    v7 = operator new(0x18uLL);
    v8 = v7 + 3;
    v12[0] = v7;
    v12[2] = v7 + 3;
    void *v7 = 0;
    v7[1] = v5;
    id v9 = v6;
    v7[2] = v9;
    v12[1] = v7 + 3;
    while (v8 != (void *)v12[0])
    {
      uint64_t v10 = *(v8 - 3);
      uint64_t v11 = *(v8 - 2);
      v8 -= 3;
      objc_msgSend(WeakRetained, "replaceCharactersInRange:withString:", v10, v11, v8[2]);
    }
    v13 = (void **)v12;
    std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v13);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __92__NSMutableAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke_2(uint64_t a1, void *a2)
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