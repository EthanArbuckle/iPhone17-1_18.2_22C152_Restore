@interface NSAttributedString(WebPrivacyExtras)
- (id)_wp_stringByRemovingTrackingInformationFromURLs;
- (void)_wp_removeTrackingInformationFromURLs:()WebPrivacyExtras;
@end

@implementation NSAttributedString(WebPrivacyExtras)

- (id)_wp_stringByRemovingTrackingInformationFromURLs
{
  v2 = [a1 string];
  checkForURLUsingFastPath(v2, (uint64_t)v13);

  if (v13[0])
  {
    v3 = v14;
    if (v14)
    {
      uint64_t v4 = [a1 length];
      v5 = objc_msgSend(v3, "_wp_urlByRemovingTrackingInformation");
      v6 = [v5 absoluteString];
      v7 = operator new(0x18uLL);
      v12[0] = v7;
      v12[2] = v7 + 3;
      void *v7 = 0;
      v7[1] = v4;
      id v8 = v6;
      v7[2] = v8;
      v12[1] = v7 + 3;
      WebPrivacy::applyOrderedReplacements<NSAttributedString>(a1, v12);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (void **)v12;
      std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v15);
    }
    else
    {
      v10 = [a1 string];
      WebPrivacy::findOrderedReplacementRanges(v10, (uint64_t)v12);
      WebPrivacy::applyOrderedReplacements<NSAttributedString>(a1, v12);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (void **)v12;
      std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v15);

      v3 = 0;
    }
  }
  else
  {
    id v9 = a1;
    v3 = v14;
  }

  return v9;
}

- (void)_wp_removeTrackingInformationFromURLs:()WebPrivacyExtras
{
  id v4 = a3;
  v5 = [a1 string];
  checkForURLUsingFastPath(v5, (uint64_t)v16);

  if (v16[0])
  {
    v6 = v17;
    if (v17)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __78__NSAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke;
      v14[3] = &unk_265586070;
      v14[4] = a1;
      id v15 = v4;
      objc_msgSend(v6, "_wp_removeTrackingInformation:", v14);
    }
    else
    {
      v7 = [a1 string];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3321888768;
      v11[2] = __78__NSAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke_2;
      v11[3] = &__block_descriptor_48_ea8_32c91_ZTSKZ78__NSAttributedString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs__E3__4_e9_v16__0_v8l;
      id v8 = (void *)MEMORY[0x263E40FD0](v4);
      id v9 = (void *)[a1 copy];
      id v12 = (id)MEMORY[0x263E40FD0](v8);
      id v10 = v9;
      id v13 = v10;
      WebPrivacy::findOrderedReplacementRanges(v7, v11);

      v6 = 0;
    }
  }
  else
  {
    (*((void (**)(id, void *))v4 + 2))(v4, a1);
    v6 = v17;
  }
}

@end