@interface NSMutableString(WebPrivacyExtras)
- (void)_wp_removeTrackingInformationFromURLs;
- (void)_wp_removeTrackingInformationFromURLsInPlace:()WebPrivacyExtras;
@end

@implementation NSMutableString(WebPrivacyExtras)

- (void)_wp_removeTrackingInformationFromURLs
{
  checkForURLUsingFastPath(a1, (uint64_t)v17);
  v2 = v18;
  if (v17[0])
  {
    if (v18)
    {
      uint64_t v3 = [(NSString *)a1 length];
      v4 = objc_msgSend(v2, "_wp_urlByRemovingTrackingInformation");
      v5 = [v4 absoluteString];
      v6 = operator new(0x18uLL);
      v7 = v6 + 3;
      v14 = v6;
      v16 = v6 + 3;
      void *v6 = 0;
      v6[1] = v3;
      id v8 = v5;
      v6[2] = v8;
      v15 = v6 + 3;
      while (v7 != v14)
      {
        uint64_t v9 = *(v7 - 3);
        uint64_t v10 = *(v7 - 2);
        v7 -= 3;
        -[NSString replaceCharactersInRange:withString:](a1, "replaceCharactersInRange:withString:", v9, v10, v7[2]);
      }
      v19 = (void **)&v14;
      std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v19);
    }
    else
    {
      WebPrivacy::findOrderedReplacementRanges((WebPrivacy *)a1, (uint64_t)&v14);
      for (i = v15;
            i != v14;
            -[NSString replaceCharactersInRange:withString:](a1, "replaceCharactersInRange:withString:", v12, v13, i[2]))
      {
        uint64_t v12 = *(i - 3);
        uint64_t v13 = *(i - 2);
        i -= 3;
      }
      v19 = (void **)&v14;
      std::vector<std::pair<_NSRange,NSString * {__strong}>>::__destroy_vector::operator()[abi:nn180100](&v19);
    }
  }
}

- (void)_wp_removeTrackingInformationFromURLsInPlace:()WebPrivacyExtras
{
  v4 = a3;
  checkForURLUsingFastPath(a1, (uint64_t)v15);
  if (v15[0])
  {
    v5 = v16;
    if (v16)
    {
      objc_initWeak(&location, a1);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __82__NSMutableString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke;
      v12[3] = &unk_265586098;
      objc_copyWeak(&v14, &location);
      uint64_t v13 = v4;
      objc_msgSend(v5, "_wp_removeTrackingInformation:", v12);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_initWeak(&from, a1);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3321888768;
      v8[2] = __82__NSMutableString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace___block_invoke_2;
      v8[3] = &__block_descriptor_48_ea8_32c95_ZTSKZ82__NSMutableString_WebPrivacyExtras___wp_removeTrackingInformationFromURLsInPlace__E3__5_e9_v16__0_v8l;
      id location = (id)MEMORY[0x263E40FD0](v4);
      objc_copyWeak(&v7, &from);
      id v9 = (id)MEMORY[0x263E40FD0](location);
      objc_copyWeak(&v10, &v7);
      WebPrivacy::findOrderedReplacementRanges(a1, v8);
      objc_destroyWeak(&v7);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&from);
      v5 = 0;
    }
  }
  else
  {
    v4[2](v4);
    v5 = v16;
  }
}

@end