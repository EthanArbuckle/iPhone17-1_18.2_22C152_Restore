id PDULocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v1 = (void *)MEMORY[0x263F086E0];
  v2 = a1;
  v3 = [v1 bundleWithIdentifier:@"com.apple.PrivacyDisclosureUI"];
  v4 = [v3 localizedStringForKey:v2 value:v2 table:0];

  return v4;
}

id getDescriptionForCategorySuffix(void *a1, uint64_t a2)
{
  id v3 = a1;
  v4 = [@"NSRegulatoryPrivacyDisclosure" stringByAppendingString:a2];
  v5 = lookupLocalizedString(v3, v4);

  return v5;
}

id lookupLocalizedString(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  if (platformSpecificSuffixes_once != -1) {
    dispatch_once(&platformSpecificSuffixes_once, &__block_literal_global);
  }
  id v5 = (id)platformSpecificSuffixes_suffixes;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = objc_msgSend(v4, "stringByAppendingString:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);
      v11 = [v3 objectForKeyedSubscript:v10];

      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v11 = 0;
  }

  return v11;
}

void PDURetrieveLocalizedTitlesAndDescriptions(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a1;
  long long v16 = a2;
  if (a2)
  {
    a2 = [MEMORY[0x263EFF980] array];
  }
  v17 = a3;
  if (a3)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v18 = v5;
  uint64_t v7 = [v5 localizedInfoDictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [&unk_270850B70 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(&unk_270850B70);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v13 = getDescriptionForCategorySuffix(v7, v12);
        if (v13)
        {
          long long v14 = [@"DISCLOSURE_TITLE_" stringByAppendingString:v12];
          long long v15 = PDULocalizedString(v14);

          [a2 addObject:v15];
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [&unk_270850B70 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  if (v16) {
    *long long v16 = a2;
  }
  if (v17) {
    void *v17 = v6;
  }
}

id PDUWelcomeTitleTextForAppRecord(void *a1)
{
  id v1 = a1;
  v2 = (void *)MEMORY[0x263F086E0];
  id v3 = [v1 URL];
  id v4 = [v2 bundleWithURL:v3];

  id v5 = [v4 localizedInfoDictionary];
  uint64_t v6 = lookupLocalizedString(v5, @"NSRegulatoryPrivacyDisclosureTitle");
  if (!v6)
  {
    uint64_t v7 = [v1 localizedName];
    uint64_t v8 = PDULocalizedString(@"WELCOME_TITLE");
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", v8, v7);
  }
  return v6;
}

id PDULearnMoreDetailTextForAppRecord(void *a1)
{
  id v1 = a1;
  v2 = PDULocalizedString(@"WELCOME_LEARN_MORE_DETAIL");
  id v3 = NSString;
  id v4 = [v1 localizedName];

  id v5 = objc_msgSend(v3, "stringWithFormat:", v2, v4);

  return v5;
}

id PDULocalizedNameForAppRecord(void *a1)
{
  id v1 = a1;
  v2 = (void *)MEMORY[0x263F086E0];
  id v3 = [v1 URL];
  id v4 = [v2 bundleWithURL:v3];

  id v5 = [v4 localizedInfoDictionary];
  uint64_t v6 = lookupLocalizedString(v5, @"NSRegulatoryPrivacyDisclosureName");
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v1 localizedName];
  }
  uint64_t v9 = v8;

  return v9;
}

id PDUWelcomeDetailTextForAppRecord(void *a1)
{
  id v1 = a1;
  v2 = (void *)MEMORY[0x263F086E0];
  id v3 = [v1 URL];
  id v4 = [v2 bundleWithURL:v3];

  id v5 = [v4 localizedInfoDictionary];
  uint64_t v6 = lookupLocalizedString(v5, @"NSRegulatoryPrivacyDisclosureSummary");
  if (!v6)
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:@"NSRegulatoryPrivacyDisclosureSummmary"];
  }
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  if (v6 && [v6 length]) {
    [v7 addObject:v6];
  }
  id v8 = PDULearnMoreDetailTextForAppRecord(v1);
  [v7 addObject:v8];

  uint64_t v9 = [v7 componentsJoinedByString:@"\n\n"];

  return v9;
}

BOOL PDUShouldShowLearnMoreScreen(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F086E0];
  v2 = [a1 URL];
  id v3 = [v1 bundleWithURL:v2];

  id v4 = [v3 localizedInfoDictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [&unk_270850B70 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(&unk_270850B70);
      }
      uint64_t v10 = getDescriptionForCategorySuffix(v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
      if (v10) {
        ++v7;
      }
    }
    uint64_t v6 = [&unk_270850B70 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v6);
  if (v7)
  {
    BOOL v11 = 1;
  }
  else
  {
LABEL_12:
    uint64_t v12 = objc_msgSend(v3, "pdu_aboutPrivacyBundleID");
    BOOL v11 = v12 != 0;
  }
  return v11;
}

id PDULocalizedNameForBundle(void *a1)
{
  id v1 = a1;
  v2 = [v1 localizedInfoDictionary];
  id v3 = localizedNameForDictionary(v2);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [v1 infoDictionary];
    localizedNameForDictionary(v6);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

id localizedNameForDictionary(void *a1)
{
  id v1 = a1;
  v2 = [v1 objectForKeyedSubscript:@"CFBundleDisplayName"];
  if (!v2)
  {
    v2 = [v1 objectForKeyedSubscript:@"CFBundleName"];
  }

  return v2;
}

void __platformSpecificSuffixes_block_invoke()
{
  id v4 = [MEMORY[0x263EFF980] array];
  int v0 = MGGetSInt32Answer();
  switch(v0)
  {
    case 6:
      id v1 = @"_Watch";
      break;
    case 3:
      id v1 = @"_iPad";
      break;
    case 1:
      id v1 = @"_iPhone";
      break;
    default:
      goto LABEL_8;
  }
  [v4 addObject:v1];
LABEL_8:
  [v4 addObject:@"_iOS"];
  [v4 addObject:&stru_27084EB28];
  uint64_t v2 = [v4 copy];
  id v3 = (void *)platformSpecificSuffixes_suffixes;
  platformSpecificSuffixes_suffixes = v2;
}

PDUDisclosureReviewViewController_iOS *PDUDisclosureReviewViewControllerForBundle(void *a1)
{
  return PDUDisclosureReviewViewControllerForBundleWithVariant(a1, 1);
}

PDUDisclosureReviewViewController_iOS *PDUDisclosureReviewViewControllerForBundleWithVariant(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = [[PDUDisclosureReviewViewController_iOS alloc] initWithBundle:v3 variant:a2];

  return v4;
}

id PDUDisclosureReviewViewControllerForApplication(void *a1)
{
  return PDUDisclosureReviewViewControllerForApplicationWithVariant(a1, 1);
}

id PDUDisclosureReviewViewControllerForApplicationWithVariant(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v12 = 0;
  id v4 = [v3 findApplicationRecordWithError:&v12];
  id v5 = v12;
  if (v5)
  {
    uint64_t v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      PDUDisclosureReviewViewControllerForApplicationWithVariant_cold_1((uint64_t)v3, (uint64_t)v5, v6);
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x263F086E0];
    uint64_t v9 = [v4 URL];
    uint64_t v10 = [v8 bundleWithURL:v9];

    uint64_t v7 = PDUDisclosureReviewViewControllerForBundleWithVariant(v10, a2);
  }
  return v7;
}

BOOL PDUDoesApplicationSupportDisclosureReview()
{
  int v0 = PDCCurrentRegulatoryDisclosureVersionForApplicationIdentity();
  BOOL v1 = v0 != 0;

  return v1;
}

id PDUAllApplicationsSupportingDisclosureReview()
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F610B0] isPreflightFeatureEnabled])
  {
    int v0 = [MEMORY[0x263EFF9C0] set];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    BOOL v1 = PDCGlobalApplicationEnvironment();
    uint64_t v2 = [v1 allApplications];

    uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v26 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v8 = [v7 regulatoryPrivacyDisclosureVersion];

          if (v8)
          {
            long long v23 = 0u;
            long long v24 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            uint64_t v9 = [v7 identities];
            uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = *(void *)v22;
              do
              {
                for (uint64_t j = 0; j != v11; ++j)
                {
                  if (*(void *)v22 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  long long v14 = PDCApplicationIdentityToLSApplicationIdentity();
                  [v0 addObject:v14];
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
              }
              while (v11);
            }
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v4);
    }

    id v20 = 0;
    long long v15 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:@"com.apple.Preferences" allowPlaceholder:0 error:&v20];
    id v16 = v20;
    if (v16)
    {
      long long v17 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        PDUAllApplicationsSupportingDisclosureReview_cold_1((uint64_t)v16, v17);
      }
    }
    else if (v15)
    {
      uint64_t v18 = [v15 identities];
      [v0 addObjectsFromArray:v18];
    }
  }
  else
  {
    int v0 = [MEMORY[0x263EFFA08] set];
  }
  return v0;
}

id PDUGetBundle()
{
  if (PDUGetBundle_once != -1) {
    dispatch_once(&PDUGetBundle_once, &__block_literal_global_0);
  }
  int v0 = (void *)PDUGetBundle_result;
  return v0;
}

uint64_t __PDUGetBundle_block_invoke()
{
  PDUGetBundle_result = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

id PDUConvertColorString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 length];
  if (v2 == 6)
  {
    uint64_t v11 = 0;
    HIDWORD(v10) = 0;
    id v3 = v1;
    if (sscanf((const char *)[v3 cStringUsingEncoding:1], "%02x%02x%02x", (char *)&v11 + 4, &v11, (char *)&v10 + 4) == 3)
    {
      int v5 = v11;
      int v4 = HIDWORD(v11);
      double v7 = 1.0;
      int v6 = HIDWORD(v10);
      goto LABEL_7;
    }
  }
  else
  {
    if (v2 != 8)
    {

      goto LABEL_10;
    }
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    id v3 = v1;
    if (sscanf((const char *)[v3 cStringUsingEncoding:1], "%02x%02x%02x%02x", (char *)&v11 + 4, &v11, (char *)&v10 + 4, &v10) == 4)
    {
      int v5 = v11;
      int v4 = HIDWORD(v11);
      int v6 = HIDWORD(v10);
      double v7 = (double)(int)v10 / 255.0;
LABEL_7:

      uint64_t v8 = [MEMORY[0x263F1C550] colorWithRed:(double)v4 / 255.0 green:(double)v5 / 255.0 blue:(double)v6 / 255.0 alpha:v7];
      goto LABEL_11;
    }
  }

LABEL_10:
  uint64_t v8 = 0;
LABEL_11:

  return v8;
}

uint64_t PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI()
{
  if (PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI_onceToken != -1) {
    dispatch_once(&PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI_onceToken, &__block_literal_global_2);
  }
  return PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI_log;
}

void sub_25A6601E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id PDUWelcomeViewControllerForApplication(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  int v5 = PDCGlobalConsentStoreInstance();
  int v6 = PDUWelcomeViewControllerForApplicationWithConsentStore(v4, v3, v5);

  return v6;
}

PDUWelcomeViewController_iOS *PDUWelcomeViewControllerForApplicationWithConsentStore(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = [[PDUWelcomeViewController_iOS alloc] initWithApplicationIdentity:v7 consentStore:v5];

  [(PDUWelcomeViewController_iOS *)v8 setDelegate:v6];
  return v8;
}

id stackForViews(void *a1)
{
  id v1 = a1;
  if ([v1 count])
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F1C9B8]) initWithArrangedSubviews:v1];
    [v2 setAxis:1];
    [v2 setDistribution:0];
    [v2 setSpacing:1.17549435e-38];
    [v2 setLayoutMarginsRelativeArrangement:1];
    [v2 setPreservesSuperviewLayoutMargins:1];
    [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void fillViewWithNewSubview(void *a1, void *a2)
{
  v20[4] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = a1;
  [v4 addSubview:v3];
  uint64_t v18 = [v3 leadingAnchor];
  uint64_t v19 = [v4 layoutMarginsGuide];
  long long v17 = [v19 leadingAnchor];
  id v16 = [v18 constraintEqualToAnchor:v17];
  v20[0] = v16;
  long long v14 = [v3 trailingAnchor];
  long long v15 = [v4 layoutMarginsGuide];
  id v5 = [v15 trailingAnchor];
  id v6 = [v14 constraintEqualToAnchor:v5];
  v20[1] = v6;
  id v7 = [v3 topAnchor];
  uint64_t v8 = [v4 topAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  v20[2] = v9;
  uint64_t v10 = [v3 bottomAnchor];

  uint64_t v11 = [v4 bottomAnchor];
  uint64_t v12 = [v10 constraintEqualToAnchor:v11];
  v20[3] = v12;
  long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];
  [v4 addConstraints:v13];

  [v4 setNeedsLayout];
}

id PDUWelcomeTintColorForApplicationIdentity(void *a1)
{
  id v1 = a1;
  id v7 = 0;
  uint64_t v2 = [v1 findApplicationRecordWithError:&v7];
  id v3 = v7;
  if (v3)
  {
    id v4 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureUI();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      PDUDisclosureReviewViewControllerForApplicationWithVariant_cold_1((uint64_t)v1, (uint64_t)v3, v4);
    }
    id v5 = 0;
  }
  else
  {
    id v5 = PDUWelcomeTintColorForApplicationRecord(v2);
  }

  return v5;
}

id PDUWelcomeTintColorForApplicationRecord(void *a1)
{
  id v1 = (void *)MEMORY[0x263F086E0];
  uint64_t v2 = [a1 URL];
  id v3 = [v1 bundleWithURL:v2];
  id v4 = PDUWelcomeTintColorForBundle((uint64_t)v3);

  return v4;
}

id PDUWelcomeTintColorForBundle(uint64_t a1)
{
  id v1 = +[PDUAppDisclosureStyle styleWithBundle:a1];
  uint64_t v2 = [v1 tintColor];

  return v2;
}

void PDUDisclosureReviewViewControllerForApplicationWithVariant_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_25A65C000, log, OS_LOG_TYPE_ERROR, "Attempt to locate app %@ failed: %@", (uint8_t *)&v3, 0x16u);
}

void PDUAllApplicationsSupportingDisclosureReview_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25A65C000, a2, OS_LOG_TYPE_ERROR, "Attempt to locate settings failed: %@", (uint8_t *)&v2, 0xCu);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x270EE5B60](a1, *(void *)&intent, color, options);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

uint64_t PDCApplicationIdentityToLSApplicationIdentity()
{
  return MEMORY[0x270F56ED0]();
}

uint64_t PDCCurrentRegulatoryDisclosureVersionForApplicationIdentity()
{
  return MEMORY[0x270F56ED8]();
}

uint64_t PDCGlobalApplicationEnvironment()
{
  return MEMORY[0x270F56EE0]();
}

uint64_t PDCGlobalConsentStoreInstance()
{
  return MEMORY[0x270F56EE8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}