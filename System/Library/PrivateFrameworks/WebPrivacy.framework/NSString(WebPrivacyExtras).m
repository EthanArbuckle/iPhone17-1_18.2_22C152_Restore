@interface NSString(WebPrivacyExtras)
- (NSString)_wp_stringByRemovingTrackingInformationFromURLs;
- (void)_wp_removeTrackingInformationFromURLs:()WebPrivacyExtras;
@end

@implementation NSString(WebPrivacyExtras)

- (NSString)_wp_stringByRemovingTrackingInformationFromURLs
{
  checkForURLUsingFastPath(a1, (uint64_t)v7);
  if (v7[0])
  {
    id v2 = v8;
    if (v8)
    {
      v3 = objc_msgSend(v8, "_wp_urlByRemovingTrackingInformation");
      v4 = [v3 absoluteString];
    }
    else
    {
      WebPrivacy::findOrderedReplacementRanges((WebPrivacy *)a1, (uint64_t)v6);
      WebPrivacy::applyOrderedReplacements<NSString>(a1, v6);
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = (void **)v6;
      std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v9);
      id v2 = 0;
    }
  }
  else
  {
    v4 = a1;
    id v2 = v8;
  }

  return v4;
}

- (void)_wp_removeTrackingInformationFromURLs:()WebPrivacyExtras
{
  id v4 = a3;
  checkForURLUsingFastPath(a1, (uint64_t)v14);
  if (v14[0])
  {
    v5 = v15;
    if (v15)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __68__NSString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke;
      v12[3] = &unk_265586048;
      id v13 = v4;
      objc_msgSend(v5, "_wp_removeTrackingInformation:", v12);
    }
    else
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3321888768;
      v9[2] = __68__NSString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs___block_invoke_2;
      v9[3] = &__block_descriptor_48_ea8_32c81_ZTSKZ68__NSString_WebPrivacyExtras___wp_removeTrackingInformationFromURLs__E3__3_e9_v16__0_v8l;
      v6 = (void *)MEMORY[0x263E40FD0](v4);
      v7 = (void *)[(NSString *)a1 copy];
      id v10 = (id)MEMORY[0x263E40FD0](v6);
      id v8 = v7;
      id v11 = v8;
      WebPrivacy::findOrderedReplacementRanges(a1, v9);

      v5 = 0;
    }
  }
  else
  {
    (*((void (**)(id, NSString *))v4 + 2))(v4, a1);
    v5 = v15;
  }
}

@end