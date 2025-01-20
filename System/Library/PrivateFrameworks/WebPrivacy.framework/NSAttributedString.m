@interface NSAttributedString
@end

@implementation NSAttributedString

void __78__NSAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = [v5 length];
  v7 = [v3 absoluteString];
  v8 = operator new(0x18uLL);
  v11[0] = v8;
  v11[2] = v8 + 3;
  void *v8 = 0;
  v8[1] = v6;
  id v9 = v7;
  v8[2] = v9;
  v11[1] = v8 + 3;
  v10 = WebPrivacy::applyOrderedReplacements<NSAttributedString>(v5, v11);
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v10);

  v12 = (void **)v11;
  std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v12);
}

void __78__NSAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  WebPrivacy::applyOrderedReplacements<objc_object>(*(void **)(a1 + 40), a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

@end