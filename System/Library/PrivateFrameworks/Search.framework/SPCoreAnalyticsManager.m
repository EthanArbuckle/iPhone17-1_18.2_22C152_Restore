@interface SPCoreAnalyticsManager
+ (id)aggdLogIdentifierFromItem:(id)a3 type:(int)a4 baseType:(id *)a5;
+ (void)computeEngagementMatrixForEngagedItem:(id)a3 topAnalyticsItemsPerSection:(id)a4;
+ (void)logEngagementWithBundleIdentifier:(id)a3 forEvent:(unint64_t)a4;
+ (void)logEngagementWithItem:(id)a3 atPosition:(unint64_t)a4 forEvent:(unint64_t)a5;
@end

@implementation SPCoreAnalyticsManager

+ (void)logEngagementWithBundleIdentifier:(id)a3 forEvent:(unint64_t)a4
{
  id v5 = a3;
  id v8 = v5;
  if (a4 == 1)
  {
    v6 = @"com.apple.searchd.eng.SEARCH_IN_APP.";
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    v6 = @"com.apple.searchd.eng.SHOW_MORE.";
LABEL_5:
    v7 = [(__CFString *)v6 stringByAppendingString:v5];
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:
  AnalyticsAddValueIfNonNull((uint64_t)v7);
}

+ (id)aggdLogIdentifierFromItem:(id)a3 type:(int)a4 baseType:(id *)a5
{
  id v7 = a3;
  id v8 = SPGetDisabledDomainSet();
  int v9 = [v8 containsObject:@"DOMAIN_PARSEC"];

  BOOL v10 = [v7 type] == 36 || objc_msgSend(v7, "type") == 37;
  v11 = @"com.apple.searchd.eng.shortcut";
  switch(a4)
  {
    case 0:
      v12 = @"com.apple.searchd.eng.enabled.";
      if (v9) {
        v12 = @"com.apple.searchd.eng.disabled.";
      }
      v13 = v12;
      goto LABEL_13;
    case 1:
      v13 = @"com.apple.searchd.eng.orbpreview.";
      goto LABEL_13;
    case 2:
      v13 = @"com.apple.searchd.eng.correction.static.";
      goto LABEL_13;
    case 3:
      v13 = @"com.apple.searchd.eng.correction.dynamic.";
      goto LABEL_13;
    case 4:
      v13 = @"com.apple.searchd.eng.topHit.";
      goto LABEL_13;
    case 5:
      char v25 = [v7 type] == 2 || v10;
      v26 = @"com.apple.searchd.eng.distance.local";
      if ((v25 & 1) == 0 && [v7 type] != 4) {
        v26 = @"com.apple.searchd.eng.distance.parsec";
      }
      v11 = v26;
      goto LABEL_22;
    case 6:
      goto LABEL_22;
    default:
      v13 = 0;
LABEL_13:
      v14 = [v7 sectionBundleIdentifier];
      int v15 = [v14 isEqualToString:@"com.apple.searchd.zkw.apps"];

      if (v15)
      {
        v16 = [(__CFString *)v13 stringByAppendingString:@"zkw.application."];
        v17 = [v7 applicationBundleIdentifier];
        v11 = [v16 stringByAppendingString:v17];

LABEL_15:
        goto LABEL_21;
      }
      v18 = [v7 sectionBundleIdentifier];
      if ([v18 isEqualToString:@"com.apple.application"])
      {

LABEL_19:
        id v20 = [(__CFString *)v13 stringByAppendingString:@"application"];
        *a5 = v20;
        v21 = NSString;
        v22 = [v7 applicationBundleIdentifier];
        v23 = [v21 stringWithFormat:@".%@", v22];
        v11 = [v20 stringByAppendingString:v23];

LABEL_20:
        goto LABEL_21;
      }
      char v19 = [v7 isLocalApplicationResult];

      if (v19) {
        goto LABEL_19;
      }
      v27 = [v7 sectionBundleIdentifier];
      int v28 = [@"com.apple.searchd.zkw.siriactions" isEqualToString:v27];

      if (v28)
      {
        v11 = [(__CFString *)v13 stringByAppendingString:@"com.apple.searchd.zkw.siriactions"];
      }
      else
      {
        v29 = [v7 sectionBundleIdentifier];
        int v30 = [@"com.apple.spotlightui.search-through" isEqualToString:v29];

        if (v30)
        {
          v16 = [v7 identifier];
          v11 = [(__CFString *)v13 stringByAppendingString:v16];
          goto LABEL_15;
        }
        id v20 = [v7 applicationBundleIdentifier];
        if (v20
          || ([v7 sectionBundleIdentifier], (id v20 = (id)objc_claimAutoreleasedReturnValue()) != 0))
        {
          int v31 = [v7 type];
          v11 = @"com.apple.searchd.eng.suggestion.parsec";
          switch(v31)
          {
            case 1:
              *a5 = [(__CFString *)v13 stringByAppendingString:@"parsec"];
              v32 = @"parsec.";
              goto LABEL_55;
            case 2:
              v35 = @"localCoreSpotlight";
              goto LABEL_46;
            case 3:
            case 5:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 18:
            case 19:
LABEL_52:
              v11 = @"com.apple.searchd.eng.correction.unknown";
              goto LABEL_20;
            case 4:
              v35 = @"userActivity";
LABEL_46:
              *a5 = [(__CFString *)v13 stringByAppendingString:v35];
              v32 = @"local.";
LABEL_55:
              v36 = [(__CFString *)v13 stringByAppendingString:v32];
              v11 = [v36 stringByAppendingString:v20];

              break;
            case 6:
              v11 = @"com.apple.searchd.eng.calculator";
              break;
            case 7:
              v11 = @"com.apple.searchd.eng.conversion";
              break;
            case 8:
              v11 = @"com.apple.searchd.eng.definition";
              break;
            case 16:
LABEL_41:
              v33 = [v7 contactIdentifier];

              if (v33)
              {
                v34 = @"suggestion.contact";
LABEL_57:
                *a5 = [(__CFString *)v13 stringByAppendingString:v34];
              }
              v11 = @"com.apple.searchd.eng.suggestion.local";
              break;
            case 17:
              goto LABEL_20;
            case 20:
              v11 = @"com.apple.searchd.eng.siri.action";
              break;
            case 21:
              v11 = @"com.apple.searchd.eng.siri.suggestion";
              break;
            default:
              switch(v31)
              {
                case ' ':
                  goto LABEL_41;
                case '$':
                  *a5 = [(__CFString *)v13 stringByAppendingString:@"localCoreSpotlight"];
                  v32 = @"local.contact.";
                  goto LABEL_55;
                case '%':
                  *a5 = [(__CFString *)v13 stringByAppendingString:@"localCoreSpotlight"];
                  v32 = @"local.people.";
                  goto LABEL_55;
                case '&':
                  v34 = @"suggestion.person";
                  goto LABEL_57;
                default:
                  goto LABEL_52;
              }
          }
          goto LABEL_20;
        }
        v11 = 0;
      }
LABEL_21:

LABEL_22:
      return v11;
  }
}

+ (void)computeEngagementMatrixForEngagedItem:(id)a3 topAnalyticsItemsPerSection:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v44 = [v5 sectionBundleIdentifier];
  int v7 = [v5 type];
  int v8 = [v5 type];
  if (v7 == 36)
  {
    BOOL v9 = 1;
  }
  else
  {
    int v10 = v8;
    BOOL v9 = 1;
    if ([v5 type] != 2
      && v10 != 37
      && [v5 type] != 4
      && [v5 type] != 6
      && [v5 type] != 7)
    {
      BOOL v9 = [v5 type] == 8;
    }
  }
  id v39 = v5;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v6;
  uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
  BOOL v38 = v9;
  if (v11)
  {
    uint64_t v12 = v11;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v13 = 0;
    uint64_t v14 = *(void *)v47;
    int v15 = @"com.apple.searchd.eng.parsec.engaged.top.%d.bundle";
    if (v9) {
      int v15 = @"com.apple.searchd.eng.local.engaged.top.%d.bundle";
    }
    v40 = v15;
    char v16 = 1;
    uint64_t v17 = 1;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        char v19 = v13;
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v13 = [v20 sectionBundleIdentifier];

        if (([v13 isEqualToString:@"com.apple.searchd.suggestions"] & 1) == 0
          && ([v13 isEqualToString:@"com.apple.searchd.zkw.apps"] & 1) == 0
          && ([v13 isEqualToString:@"com.apple.spotlightui.search-through"] & 1) == 0)
        {
          if (v16)
          {
            id v21 = v20;

            v43 = v21;
          }
          if ([v13 isEqualToString:v44]) {
            BOOL v22 = (int)v17 <= 10;
          }
          else {
            BOOL v22 = 0;
          }
          if (v22)
          {
            v23 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.searchd.eng.any.engaged.top.%d.bundle", v17);
            AnalyticsAddValueIfNonNull((uint64_t)v23);

            v24 = objc_msgSend(NSString, "stringWithFormat:", v40, v17);
            AnalyticsAddValueIfNonNull((uint64_t)v24);
          }
          if ([v20 type] == 1)
          {
            char v25 = v41;
            if (!v41)
            {
              char v25 = objc_opt_new();
              v41 = v25;
            }
          }
          else
          {
            char v25 = v42;
            if (!v42)
            {
              char v25 = objc_opt_new();
              v42 = v25;
            }
          }
          [v25 addObject:v20];
          char v16 = 0;
          uint64_t v17 = (v17 + 1);
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v12);
  }
  else
  {
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v13 = 0;
  }

  if (v38) {
    v26 = v42;
  }
  else {
    v26 = v41;
  }
  v27 = [v26 objectAtIndexedSubscript:0];
  int v28 = [v43 sectionBundleIdentifier];
  if ([v44 isEqualToString:v28])
  {
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    v52 = __AnalyticsAddValueIfNonNull_block_invoke;
    v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
    uint64_t v54 = 1;
    AnalyticsSendEventLazy();
    if (v38)
    {
      uint64_t v50 = MEMORY[0x263EF8330];
      uint64_t v51 = 3221225472;
      v52 = __AnalyticsAddValueIfNonNull_block_invoke;
      v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
      uint64_t v54 = 1;
      AnalyticsSendEventLazy();
      v29 = v39;
      goto LABEL_50;
    }
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    v52 = __AnalyticsAddValueIfNonNull_block_invoke;
    v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
    uint64_t v54 = 1;
    AnalyticsSendEventLazy();
    v29 = v39;
  }
  else
  {
    v29 = v39;
    if (v38) {
      goto LABEL_50;
    }
  }
  int v30 = [v27 sectionBundleIdentifier];
  int v31 = [v44 isEqualToString:v30];

  if (v31)
  {
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    v52 = __AnalyticsAddValueIfNonNull_block_invoke;
    v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
    uint64_t v54 = 1;
    AnalyticsSendEventLazy();
  }
  if ([v44 isEqualToString:v28])
  {
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    v52 = __AnalyticsAddValueIfNonNull_block_invoke;
    v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
    uint64_t v54 = 1;
    AnalyticsSendEventLazy();
  }
LABEL_50:
  v32 = [v27 sectionBundleIdentifier];
  if ([v44 isEqualToString:v32])
  {
  }
  else
  {
    v33 = [v27 sectionBundleIdentifier];
    int v34 = [v33 isEqualToString:@"com.apple.spotlight.tophits"];

    if (!v34) {
      goto LABEL_55;
    }
  }
  v35 = [v27 identifier];
  v36 = [v29 identifier];
  int v37 = [v35 isEqualToString:v36];

  if (v37)
  {
    uint64_t v50 = MEMORY[0x263EF8330];
    uint64_t v51 = 3221225472;
    v52 = __AnalyticsAddValueIfNonNull_block_invoke;
    v53 = &__block_descriptor_40_e19___NSDictionary_8__0l;
    uint64_t v54 = 1;
    AnalyticsSendEventLazy();
  }
LABEL_55:
}

+ (void)logEngagementWithItem:(id)a3 atPosition:(unint64_t)a4 forEvent:(unint64_t)a5
{
  id v8 = a3;
  BOOL v9 = v8;
  if (a5 == 5)
  {
    id v25 = 0;
    int v10 = [a1 aggdLogIdentifierFromItem:v8 type:1 baseType:&v25];
    id v11 = v25;
    AnalyticsAddValueIfNonNull((uint64_t)v10);

    if (v11)
    {
      uint64_t v26 = MEMORY[0x263EF8330];
      uint64_t v27 = 3221225472;
      int v28 = __AnalyticsAddValueIfNonNull_block_invoke;
      v29 = &__block_descriptor_40_e19___NSDictionary_8__0l;
      uint64_t v30 = 1;
      AnalyticsSendEventLazy();
    }
  }
  else
  {
    if ([v8 isStaticCorrection])
    {
      id v24 = 0;
      uint64_t v12 = [a1 aggdLogIdentifierFromItem:v9 type:2 baseType:&v24];
      id v13 = v24;
      AnalyticsAddValueIfNonNull((uint64_t)v12);

      if (v13)
      {
        uint64_t v26 = MEMORY[0x263EF8330];
        uint64_t v27 = 3221225472;
        int v28 = __AnalyticsAddValueIfNonNull_block_invoke;
        v29 = &__block_descriptor_40_e19___NSDictionary_8__0l;
        uint64_t v30 = 1;
        AnalyticsSendEventLazy();
      }
    }
    else
    {
      id v13 = 0;
    }
    if ([v9 isDisplayNameCorrectionsMatch])
    {
      id v23 = v13;
      uint64_t v14 = [a1 aggdLogIdentifierFromItem:v9 type:3 baseType:&v23];
      id v15 = v23;

      AnalyticsAddValueIfNonNull((uint64_t)v14);
      if (v15)
      {
        uint64_t v26 = MEMORY[0x263EF8330];
        uint64_t v27 = 3221225472;
        int v28 = __AnalyticsAddValueIfNonNull_block_invoke;
        v29 = &__block_descriptor_40_e19___NSDictionary_8__0l;
        uint64_t v30 = 1;
        AnalyticsSendEventLazy();
        id v13 = v15;
      }
      else
      {
        id v13 = 0;
      }
    }
    id v22 = v13;
    char v16 = [a1 aggdLogIdentifierFromItem:v9 type:0 baseType:&v22];
    id v11 = v22;

    AnalyticsAddValueIfNonNull((uint64_t)v16);
    if (v11)
    {
      uint64_t v26 = MEMORY[0x263EF8330];
      uint64_t v27 = 3221225472;
      int v28 = __AnalyticsAddValueIfNonNull_block_invoke;
      v29 = &__block_descriptor_40_e19___NSDictionary_8__0l;
      uint64_t v30 = 1;
      AnalyticsSendEventLazy();
    }
    if ([v9 topHit])
    {
      if ([v9 isLocalShortcut])
      {
        uint64_t v17 = [a1 aggdLogIdentifierFromItem:v9 type:6 baseType:0];
        AnalyticsAddValueIfNonNull((uint64_t)v17);
      }
      id v21 = v11;
      v18 = [a1 aggdLogIdentifierFromItem:v9 type:4 baseType:&v21];
      id v19 = v21;

      AnalyticsAddValueIfNonNull((uint64_t)v18);
      id v11 = v19;
    }
    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v20 = [a1 aggdLogIdentifierFromItem:v9 type:5 baseType:0];
      AnalyticsAddValueIfNonNull((uint64_t)v20);
    }
  }
}

@end