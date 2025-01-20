@interface SBWidgetOnboardingLayoutBuilder
- (BOOL)isCalendarWidget:(id)a3;
- (BOOL)isCalendarWidgetIcon:(id)a3;
- (BOOL)isClockWidget:(id)a3;
- (BOOL)isFirstSuggestionActiveWidgetIcon:(id)a3;
- (BOOL)isSecondSuggestionActiveWidgetIcon:(id)a3;
- (NSArray)pinnedWidgets;
- (NSArray)suggestionWidgets;
- (SBWidgetOnboardingLayoutBuilder)initWithPinnedWidgets:(id)a3 suggestionWidgets:(id)a4;
- (id)deduplicateInsidePinnedWidgets;
- (id)defaultCalendarWidgetIcon:(id)a3;
- (id)defaultFirstSuggestionWidgetIcon:(id)a3;
- (id)defaultLargeFirstSuggestionWidgetIcon;
- (id)defaultLargeSecondSuggestionWidgetIcon;
- (id)defaultMediumCalendarWidgetIcon;
- (id)defaultMediumFirstSuggestionWidgetIcon;
- (id)defaultMediumSecondSuggestionWidgetIcon;
- (id)defaultSecondSuggestionWidgetIcon:(id)a3;
- (id)defaultSmallCalendarWidgetIcon;
- (id)defaultSmallClockWidgetIcon;
- (id)defaultSmallNotesWidgetIcon;
- (id)migratedDefaultWidgets:(BOOL)a3;
- (id)migratedFourWidgets:(id)a3;
- (id)migratedOneLargeWidget:(id)a3;
- (id)migratedOneMediumWidget:(id)a3;
- (id)migratedOneSmallWidget:(id)a3;
- (id)migratedSmallAndMediumWidget:(id)a3;
- (id)migratedThreeWidgets:(id)a3;
- (id)migratedTwoMediumWidgets:(id)a3;
- (id)migratedTwoSmallWidgets:(id)a3;
@end

@implementation SBWidgetOnboardingLayoutBuilder

- (SBWidgetOnboardingLayoutBuilder)initWithPinnedWidgets:(id)a3 suggestionWidgets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBWidgetOnboardingLayoutBuilder;
  v8 = [(SBWidgetOnboardingLayoutBuilder *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];
    pinnedWidgets = v8->_pinnedWidgets;
    v8->_pinnedWidgets = (NSArray *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];
    suggestionWidgets = v8->_suggestionWidgets;
    v8->_suggestionWidgets = (NSArray *)v11;
  }
  return v8;
}

- (id)defaultSmallClockWidgetIcon
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FA6488]) initWithWidgetExtensionIdentifiers:&unk_1F33485A0 widgetKinds:&unk_1F33485B8 widgetContainerBundleIdentifiers:&unk_1F33485D0];
  [v2 setGridSizeClass:*MEMORY[0x1E4FA6560]];
  return v2;
}

- (id)defaultSmallNotesWidgetIcon
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FA6488]) initWithWidgetExtensionIdentifiers:&unk_1F33485E8 widgetKinds:&unk_1F3348600 widgetContainerBundleIdentifiers:&unk_1F3348618];
  [v2 setGridSizeClass:*MEMORY[0x1E4FA6560]];
  return v2;
}

- (id)defaultCalendarWidgetIcon:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4FA6528]) {
    v3 = @"com.apple.CalendarWidget.CalendarListWidget";
  }
  else {
    v3 = @"com.apple.CalendarWidget.CalendarUpNextWidget";
  }
  if (*MEMORY[0x1E4FA6520]) {
    v4 = @"com.apple.CalendarWidget.CalendarUpNextWidget";
  }
  else {
    v4 = v3;
  }
  v5 = (objc_class *)MEMORY[0x1E4FA6488];
  id v6 = a3;
  id v7 = [v5 alloc];
  v11[0] = v4;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v9 = (void *)[v7 initWithWidgetExtensionIdentifiers:&unk_1F3348630 widgetKinds:v8 widgetContainerBundleIdentifiers:&unk_1F3348648];

  [v9 setGridSizeClass:v6];
  return v9;
}

- (id)defaultSmallCalendarWidgetIcon
{
  return [(SBWidgetOnboardingLayoutBuilder *)self defaultCalendarWidgetIcon:*MEMORY[0x1E4FA6560]];
}

- (id)defaultMediumCalendarWidgetIcon
{
  return [(SBWidgetOnboardingLayoutBuilder *)self defaultCalendarWidgetIcon:*MEMORY[0x1E4FA6530]];
}

- (id)defaultFirstSuggestionWidgetIcon:(id)a3
{
  id v4 = a3;
  v5 = [(SBWidgetOnboardingLayoutBuilder *)self suggestionWidgets];
  id v6 = [v5 firstObject];

  [v6 setGridSizeClass:v4];
  return v6;
}

- (id)defaultMediumFirstSuggestionWidgetIcon
{
  return [(SBWidgetOnboardingLayoutBuilder *)self defaultFirstSuggestionWidgetIcon:*MEMORY[0x1E4FA6530]];
}

- (id)defaultLargeFirstSuggestionWidgetIcon
{
  return [(SBWidgetOnboardingLayoutBuilder *)self defaultFirstSuggestionWidgetIcon:*MEMORY[0x1E4FA6528]];
}

- (id)defaultSecondSuggestionWidgetIcon:(id)a3
{
  id v4 = a3;
  v5 = [(SBWidgetOnboardingLayoutBuilder *)self suggestionWidgets];
  id v6 = [v5 objectAtIndex:1];

  [v6 setGridSizeClass:v4];
  return v6;
}

- (id)defaultMediumSecondSuggestionWidgetIcon
{
  return [(SBWidgetOnboardingLayoutBuilder *)self defaultSecondSuggestionWidgetIcon:*MEMORY[0x1E4FA6530]];
}

- (id)defaultLargeSecondSuggestionWidgetIcon
{
  return [(SBWidgetOnboardingLayoutBuilder *)self defaultSecondSuggestionWidgetIcon:*MEMORY[0x1E4FA6528]];
}

- (BOOL)isClockWidget:(id)a3
{
  id v4 = a3;
  v5 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallClockWidgetIcon];
  id v6 = [v4 extensionBundleIdentifier];

  id v7 = [v5 activeWidget];
  v8 = [v7 extensionBundleIdentifier];
  char v9 = [v6 isEqual:v8];

  return v9;
}

- (BOOL)isCalendarWidget:(id)a3
{
  id v4 = a3;
  v5 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallCalendarWidgetIcon];
  id v6 = [v4 extensionBundleIdentifier];

  id v7 = [v5 activeWidget];
  v8 = [v7 extensionBundleIdentifier];
  char v9 = [v6 isEqual:v8];

  return v9;
}

- (BOOL)isCalendarWidgetIcon:(id)a3
{
  id v4 = [a3 activeWidget];
  LOBYTE(self) = [(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidget:v4];

  return (char)self;
}

- (BOOL)isFirstSuggestionActiveWidgetIcon:(id)a3
{
  id v4 = a3;
  v5 = [(SBWidgetOnboardingLayoutBuilder *)self suggestionWidgets];
  id v6 = [v5 firstObject];

  id v7 = [v6 activeWidget];
  v8 = [v7 extensionBundleIdentifier];
  char v9 = [v4 activeWidget];

  v10 = [v9 extensionBundleIdentifier];
  char v11 = [v8 isEqual:v10];

  return v11;
}

- (BOOL)isSecondSuggestionActiveWidgetIcon:(id)a3
{
  id v4 = a3;
  v5 = [(SBWidgetOnboardingLayoutBuilder *)self suggestionWidgets];
  id v6 = [v5 objectAtIndex:1];

  id v7 = [v6 activeWidget];
  v8 = [v7 extensionBundleIdentifier];
  char v9 = [v4 activeWidget];

  v10 = [v9 extensionBundleIdentifier];
  char v11 = [v8 isEqual:v10];

  return v11;
}

- (id)deduplicateInsidePinnedWidgets
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v22 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(SBWidgetOnboardingLayoutBuilder *)self pinnedWidgets];
  uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v3;
        id v4 = *(void **)(*((void *)&v30 + 1) + 8 * v3);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v25 = v22;
        uint64_t v5 = [v25 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v27;
          while (2)
          {
            for (uint64_t i = 0; i != v6; ++i)
            {
              if (*(void *)v27 != v7) {
                objc_enumerationMutation(v25);
              }
              char v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              v10 = [v4 activeWidget];
              char v11 = [v10 extensionBundleIdentifier];
              v12 = [v9 activeWidget];
              v13 = [v12 extensionBundleIdentifier];
              int v14 = [v11 isEqual:v13];

              if (v14)
              {
                v15 = [v4 widgets];
                unint64_t v16 = [v15 count];
                v17 = [v9 widgets];
                unint64_t v18 = [v17 count];

                if (v16 > v18) {
                  objc_msgSend(v25, "replaceObjectAtIndex:withObject:", objc_msgSend(v25, "indexOfObject:", v9), v4);
                }

                goto LABEL_18;
              }
            }
            uint64_t v6 = [v25 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v6) {
              continue;
            }
            break;
          }
        }

        [v25 addObject:v4];
LABEL_18:
        uint64_t v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v23);
  }

  return v22;
}

- (id)migratedOneSmallWidget:(id)a3
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallClockWidgetIcon];
  uint64_t v6 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallCalendarWidgetIcon];
  uint64_t v7 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumFirstSuggestionWidgetIcon];
  v8 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumSecondSuggestionWidgetIcon];
  if ([(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v4]
    || [(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v4]|| [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v4])
  {
    v16[0] = v5;
    char v9 = (void **)v16;
    id v10 = v6;
    char v11 = v7;
    v12 = v8;
  }
  else
  {
    [v6 setGridSizeClass:*MEMORY[0x1E4FA6530]];
    v15 = v5;
    char v9 = &v15;
    id v10 = v4;
    char v11 = v6;
    v12 = v7;
  }
  v9[1] = v10;
  v9[2] = v11;
  v9[3] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

  return v13;
}

- (id)migratedOneMediumWidget:(id)a3
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallClockWidgetIcon];
  uint64_t v6 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallCalendarWidgetIcon];
  uint64_t v7 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumFirstSuggestionWidgetIcon];
  v8 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumSecondSuggestionWidgetIcon];
  if ([(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v4])
  {
    [v7 setGridSizeClass:*MEMORY[0x1E4FA6560]];
    v17[0] = v5;
    char v9 = (void **)v17;
    id v10 = v7;
    id v11 = v4;
LABEL_6:
    v12 = v8;
    goto LABEL_7;
  }
  if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v4]|| [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v4])
  {
    unint64_t v16 = v5;
    char v9 = &v16;
    id v10 = v6;
    id v11 = v7;
    goto LABEL_6;
  }
  v15 = v5;
  char v9 = &v15;
  id v10 = v6;
  id v11 = v4;
  v12 = v7;
LABEL_7:
  v9[1] = v10;
  v9[2] = v11;
  v9[3] = v12;
  v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

  return v13;
}

- (id)migratedOneLargeWidget:(id)a3
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallClockWidgetIcon];
  uint64_t v6 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallCalendarWidgetIcon];
  uint64_t v7 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumFirstSuggestionWidgetIcon];
  v8 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumSecondSuggestionWidgetIcon];
  if ([(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v4])
  {
    [v7 setGridSizeClass:*MEMORY[0x1E4FA6560]];
    v17[0] = v5;
    char v9 = (void **)v17;
    id v10 = v7;
  }
  else
  {
    if (![(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v4])
    {
      if ([(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v4])
      {
        v15 = v5;
        char v9 = &v15;
      }
      else
      {
        int v14 = v5;
        char v9 = &v14;
      }
      id v10 = v6;
      id v11 = v7;
      goto LABEL_10;
    }
    unint64_t v16 = v5;
    char v9 = &v16;
    id v10 = v6;
  }
  id v11 = v8;
LABEL_10:
  v9[1] = v10;
  v9[2] = v11;
  v9[3] = v4;
  v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

  return v12;
}

- (id)migratedTwoSmallWidgets:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallClockWidgetIcon];
  uint64_t v6 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallCalendarWidgetIcon];
  uint64_t v7 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumFirstSuggestionWidgetIcon];
  v8 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumSecondSuggestionWidgetIcon];
  char v9 = [v4 firstObject];
  id v10 = [v4 objectAtIndex:1];

  if ([(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v9])
  {
    if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v10]|| [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v10])
    {
      v59 = v5;
      v60 = v6;
      v61 = v7;
      v62 = v8;
      id v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v59;
    }
    else
    {
      [v6 setGridSizeClass:*MEMORY[0x1E4FA6530]];
      v55 = v5;
      v56 = v10;
      v57 = v6;
      v58 = v7;
      id v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v55;
    }
  }
  else
  {
    BOOL v13 = [(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v10];
    BOOL v14 = [(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v9];
    if (v13)
    {
      if (v14
        || [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v9])
      {
        v51 = v5;
        v52 = v6;
        v53 = v7;
        v54 = v8;
        id v11 = (void *)MEMORY[0x1E4F1C978];
        v12 = &v51;
      }
      else
      {
        [v6 setGridSizeClass:*MEMORY[0x1E4FA6530]];
        v47 = v5;
        v48 = v9;
        v49 = v6;
        v50 = v7;
        id v11 = (void *)MEMORY[0x1E4F1C978];
        v12 = &v47;
      }
    }
    else if (v14 {
           && ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v10])
    }
    {
      [v6 setGridSizeClass:*MEMORY[0x1E4FA6530]];
      v43 = v5;
      v44 = v10;
      v45 = v6;
      v46 = v7;
      id v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v43;
    }
    else if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v10]&& ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v9])
    {
      [v6 setGridSizeClass:*MEMORY[0x1E4FA6530]];
      v39 = v5;
      v40 = v9;
      v41 = v6;
      v42 = v7;
      id v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v39;
    }
    else if ([(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v9]&& ![(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v10])
    {
      [v6 setGridSizeClass:*MEMORY[0x1E4FA6530]];
      v35 = v5;
      uint64_t v36 = v10;
      v37 = v6;
      v38 = v8;
      id v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v35;
    }
    else if ([(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v10]&& ![(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v9])
    {
      [v6 setGridSizeClass:*MEMORY[0x1E4FA6530]];
      long long v31 = v5;
      long long v32 = v9;
      long long v33 = v6;
      v34 = v8;
      id v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v31;
    }
    else if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v9]&& [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v10])
    {
      long long v27 = v5;
      long long v28 = v6;
      long long v29 = v7;
      long long v30 = v8;
      id v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v27;
    }
    else
    {
      if (![(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v10]|| ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v9])
      {
        unint64_t v18 = v5;
        v19 = v6;
        v20 = v9;
        uint64_t v21 = v10;
        id v22 = v7;
        id v11 = (void *)MEMORY[0x1E4F1C978];
        v12 = &v18;
        uint64_t v15 = 5;
        goto LABEL_31;
      }
      uint64_t v23 = v5;
      uint64_t v24 = v6;
      id v25 = v8;
      long long v26 = v7;
      id v11 = (void *)MEMORY[0x1E4F1C978];
      v12 = &v23;
    }
  }
  uint64_t v15 = 4;
LABEL_31:
  objc_msgSend(v11, "arrayWithObjects:count:", v12, v15, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55,
    v56,
    v57,
    v58,
    v59,
    v60,
    v61,
    v62,
  unint64_t v16 = v63);

  return v16;
}

- (id)migratedTwoMediumWidgets:(id)a3
{
  v33[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallClockWidgetIcon];
  uint64_t v6 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallCalendarWidgetIcon];
  uint64_t v7 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumFirstSuggestionWidgetIcon];
  v8 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumSecondSuggestionWidgetIcon];
  char v9 = [v4 firstObject];
  id v10 = [v4 objectAtIndex:1];

  if ([(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v9])
  {
    if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v10])
    {
      [v8 setGridSizeClass:*MEMORY[0x1E4FA6560]];
      [v6 setGridSizeClass:*MEMORY[0x1E4FA6530]];
      v33[0] = v5;
      id v11 = (void **)v33;
      v12 = v8;
LABEL_4:
      BOOL v13 = v9;
LABEL_5:
      BOOL v14 = v7;
      goto LABEL_40;
    }
    BOOL v17 = [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v10];
    [v7 setGridSizeClass:*MEMORY[0x1E4FA6560]];
    [v6 setGridSizeClass:*MEMORY[0x1E4FA6530]];
    if (v17)
    {
      long long v32 = v5;
      id v11 = &v32;
      v12 = v7;
LABEL_11:
      BOOL v13 = v9;
LABEL_12:
      BOOL v14 = v8;
      goto LABEL_40;
    }
    long long v31 = v5;
    id v11 = &v31;
    goto LABEL_30;
  }
  BOOL v15 = [(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v10];
  BOOL v16 = [(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v9];
  if (!v15)
  {
    if (v16
      && ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v10])
    {
      long long v27 = v5;
      id v11 = &v27;
      v12 = v6;
      goto LABEL_28;
    }
    if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v10]&& ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v9])
    {
      long long v26 = v5;
      id v11 = &v26;
      v12 = v6;
      goto LABEL_4;
    }
    if (![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v9]|| [(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v10])
    {
      if ([(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v10]&& ![(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v9])
      {
        uint64_t v24 = v5;
        id v11 = &v24;
        v12 = v6;
        goto LABEL_11;
      }
      if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v9]&& [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v10])
      {
        uint64_t v23 = v5;
        id v11 = &v23;
        v12 = v6;
        BOOL v13 = v7;
        goto LABEL_12;
      }
      if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v10]&& [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v9])
      {
        id v22 = v5;
        id v11 = &v22;
        v12 = v6;
        BOOL v13 = v8;
        goto LABEL_5;
      }
      uint64_t v21 = v5;
      id v11 = &v21;
      v12 = v6;
      goto LABEL_31;
    }
    id v25 = v5;
    id v11 = &v25;
    v12 = v6;
LABEL_38:
    BOOL v13 = v8;
    goto LABEL_39;
  }
  if (!v16)
  {
    BOOL v18 = [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v9];
    [v7 setGridSizeClass:*MEMORY[0x1E4FA6560]];
    [v6 setGridSizeClass:*MEMORY[0x1E4FA6530]];
    if (!v18)
    {
      long long v28 = v5;
      id v11 = &v28;
LABEL_30:
      v12 = v7;
LABEL_31:
      BOOL v13 = v9;
      goto LABEL_39;
    }
    long long v29 = v5;
    id v11 = &v29;
    v12 = v7;
    goto LABEL_38;
  }
  [v8 setGridSizeClass:*MEMORY[0x1E4FA6560]];
  [v6 setGridSizeClass:*MEMORY[0x1E4FA6530]];
  long long v30 = v5;
  id v11 = &v30;
  v12 = v8;
LABEL_28:
  BOOL v13 = v7;
LABEL_39:
  BOOL v14 = v10;
LABEL_40:
  v11[1] = v12;
  void v11[2] = v13;
  v11[3] = v14;
  v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

  return v19;
}

- (id)migratedSmallAndMediumWidget:(id)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v22 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallClockWidgetIcon];
  uint64_t v5 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallCalendarWidgetIcon];
  uint64_t v6 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumFirstSuggestionWidgetIcon];
  uint64_t v7 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumSecondSuggestionWidgetIcon];
  v8 = [v4 firstObject];
  char v9 = [v8 gridSizeClass];
  id v10 = v9;
  uint64_t v11 = *MEMORY[0x1E4FA6560];
  if (v9 == (void *)*MEMORY[0x1E4FA6560])
  {
  }
  else
  {
    v12 = [v4 firstObject];
    BOOL v13 = [v12 gridSizeClass];
    int v14 = [v13 isEqualToString:v11];

    if (!v14)
    {
      BOOL v15 = [v4 objectAtIndex:1];
      uint64_t v16 = [v4 firstObject];
      goto LABEL_6;
    }
  }
  BOOL v15 = [v4 firstObject];
  uint64_t v16 = [v4 objectAtIndex:1];
LABEL_6:
  BOOL v17 = (void *)v16;
  if ([(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v15])
  {
    if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v17])
    {
      v27[0] = v22;
      BOOL v18 = (void **)v27;
LABEL_12:
      v19 = v7;
      goto LABEL_17;
    }
    long long v26 = v22;
    BOOL v18 = &v26;
  }
  else
  {
    if (![(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v17])
    {
      [v5 setGridSizeClass:*MEMORY[0x1E4FA6530]];
      uint64_t v23 = v22;
      BOOL v18 = &v23;
      v19 = v5;
      goto LABEL_17;
    }
    if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v15])
    {
      id v25 = v22;
      BOOL v18 = &v25;
      goto LABEL_12;
    }
    uint64_t v24 = v22;
    BOOL v18 = &v24;
  }
  v19 = v6;
LABEL_17:
  v18[1] = v15;
  v18[2] = v17;
  v18[3] = v19;
  v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

  return v20;
}

- (id)migratedThreeWidgets:(id)a3
{
  v76[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallClockWidgetIcon];
  v52 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallCalendarWidgetIcon];
  v51 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumFirstSuggestionWidgetIcon];
  v50 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumSecondSuggestionWidgetIcon];
  v8 = [v6 objectAtIndex:0];
  char v9 = [v8 gridSizeClass];
  id v10 = (void *)*MEMORY[0x1E4FA6530];
  v49 = (void *)*MEMORY[0x1E4FA6530];
  v53 = (void *)v7;
  if (v9 != (void *)*MEMORY[0x1E4FA6530])
  {
    id v4 = [v6 objectAtIndex:0];
    uint64_t v3 = [v4 gridSizeClass];
    if (![v3 isEqualToString:v10])
    {

LABEL_11:
      BOOL v18 = [v6 firstObject];
      v19 = [v6 objectAtIndex:1];
      uint64_t v20 = [v6 objectAtIndex:2];
      goto LABEL_12;
    }
  }
  uint64_t v11 = objc_msgSend(v6, "objectAtIndex:", 2, self);
  v12 = [v11 gridSizeClass];
  uint64_t v13 = *MEMORY[0x1E4FA6560];
  id v14 = v6;
  if (v12 == (void *)*MEMORY[0x1E4FA6560])
  {
    int v17 = 1;
  }
  else
  {
    BOOL v15 = [v6 objectAtIndex:2];
    uint64_t v16 = [v15 gridSizeClass];
    int v17 = [v16 isEqualToString:v13];
  }
  id v10 = v49;
  if (v9 == v49)
  {

    id v6 = v14;
    self = v48;
    if (!v17) {
      goto LABEL_11;
    }
  }
  else
  {

    id v6 = v14;
    self = v48;
    if ((v17 & 1) == 0) {
      goto LABEL_11;
    }
  }
  BOOL v18 = [v6 objectAtIndex:1];
  v19 = [v6 objectAtIndex:2];
  uint64_t v20 = [v6 firstObject];
LABEL_12:
  uint64_t v21 = (void *)v20;
  BOOL v22 = [(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v18]
     || [(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v19]
     || [(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v21];
  uint64_t v23 = [v21 gridSizeClass];
  if ((void *)v23 == v10)
  {

LABEL_23:
    long long v33 = SBLogWidgetDiscoverability();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v33, OS_LOG_TYPE_DEFAULT, "Builder logic small, small, medium widgets", buf, 2u);
    }

    if (!v22)
    {
      long long v29 = v52;
      v76[0] = v53;
      v76[1] = v52;
      v76[2] = v18;
      v76[3] = v19;
      v76[4] = v21;
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:5];
      long long v31 = v50;
      long long v30 = v51;
      goto LABEL_93;
    }
    if ([(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v18])
    {
      long long v31 = v50;
      long long v30 = v51;
      if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v19])
      {
        uint64_t v34 = *MEMORY[0x1E4FA6560];
        [v51 setGridSizeClass:*MEMORY[0x1E4FA6560]];
        [v50 setGridSizeClass:v34];
        v75[0] = v53;
        v75[1] = v18;
        v75[2] = v51;
        v75[3] = v50;
        v75[4] = v21;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:5];
        long long v29 = v52;
        goto LABEL_93;
      }
      long long v29 = v52;
      if ([(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v19])
      {
        uint64_t v42 = *MEMORY[0x1E4FA6560];
        [v51 setGridSizeClass:*MEMORY[0x1E4FA6560]];
        [v50 setGridSizeClass:v42];
        v74[0] = v53;
        v74[1] = v18;
        v74[2] = v50;
        v74[3] = v51;
        v74[4] = v21;
        uint64_t v36 = (void *)MEMORY[0x1E4F1C978];
        v37 = v74;
LABEL_87:
        uint64_t v44 = 5;
        goto LABEL_88;
      }
      [v52 setGridSizeClass:v49];
      v73[0] = v53;
      v73[1] = v19;
      v73[2] = v52;
      v73[3] = v21;
      uint64_t v36 = (void *)MEMORY[0x1E4F1C978];
      v37 = v73;
    }
    else
    {
      long long v31 = v50;
      long long v30 = v51;
      if ([(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v19])
      {
        long long v29 = v52;
        if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v18])
        {
          v72[0] = v53;
          v72[1] = v19;
          v72[2] = v51;
          v72[3] = v21;
          uint64_t v36 = (void *)MEMORY[0x1E4F1C978];
          v37 = v72;
        }
        else if ([(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v18])
        {
          v71[0] = v53;
          v71[1] = v19;
          v71[2] = v50;
          v71[3] = v21;
          uint64_t v36 = (void *)MEMORY[0x1E4F1C978];
          v37 = v71;
        }
        else
        {
          [v52 setGridSizeClass:v49];
          v70[0] = v53;
          v70[1] = v18;
          v70[2] = v52;
          v70[3] = v21;
          uint64_t v36 = (void *)MEMORY[0x1E4F1C978];
          v37 = v70;
        }
      }
      else
      {
        long long v29 = v52;
        if (![(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v21])
        {
          v35 = 0;
          goto LABEL_93;
        }
        if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v18]&& ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v19])
        {
          uint64_t v45 = *MEMORY[0x1E4FA6560];
          [v51 setGridSizeClass:*MEMORY[0x1E4FA6560]];
          [v50 setGridSizeClass:v45];
          v69[0] = v53;
          v69[1] = v51;
          v69[2] = v21;
          v69[3] = v19;
          v69[4] = v50;
          uint64_t v36 = (void *)MEMORY[0x1E4F1C978];
          v37 = v69;
          goto LABEL_87;
        }
        if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v19]&& ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v18])
        {
          uint64_t v46 = *MEMORY[0x1E4FA6560];
          [v51 setGridSizeClass:*MEMORY[0x1E4FA6560]];
          [v50 setGridSizeClass:v46];
          v68[0] = v53;
          v68[1] = v18;
          v68[2] = v21;
          v68[3] = v51;
          v68[4] = v50;
          uint64_t v36 = (void *)MEMORY[0x1E4F1C978];
          v37 = v68;
          goto LABEL_87;
        }
        if ((![(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v18]|| ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v19])&& (![(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v19]|| ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v18]))
        {
          [v51 setGridSizeClass:*MEMORY[0x1E4FA6560]];
          v66[0] = v53;
          v66[1] = v51;
          v66[2] = v18;
          v66[3] = v19;
          v66[4] = v21;
          uint64_t v36 = (void *)MEMORY[0x1E4F1C978];
          v37 = v66;
          goto LABEL_87;
        }
        [v51 setGridSizeClass:*MEMORY[0x1E4FA6560]];
        v67[0] = v53;
        v67[1] = v51;
        v67[2] = v21;
        v67[3] = v50;
        uint64_t v36 = (void *)MEMORY[0x1E4F1C978];
        v37 = v67;
      }
    }
    uint64_t v44 = 4;
LABEL_88:
    v35 = [v36 arrayWithObjects:v37 count:v44];
    goto LABEL_93;
  }
  uint64_t v24 = (void *)v23;
  id v25 = [v21 gridSizeClass];
  int v26 = [v25 isEqualToString:v10];

  if (v26) {
    goto LABEL_23;
  }
  long long v27 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v27, OS_LOG_TYPE_DEFAULT, "Builder logic small, small, small widgets", buf, 2u);
  }
  id v28 = v6;

  long long v30 = v51;
  long long v29 = v52;
  long long v31 = v50;
  if ([(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v19])
  {
    long long v32 = v18;
    BOOL v18 = v19;
  }
  else
  {
    BOOL v38 = [(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v21];
    if (v38) {
      v39 = v18;
    }
    else {
      v39 = v21;
    }
    if (v38) {
      BOOL v18 = v21;
    }
    uint64_t v21 = v39;
    long long v32 = v19;
  }
  if (![(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v18])
  {
    if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v18])
    {
      v61[0] = v53;
      v61[1] = v52;
      v61[2] = v32;
      v61[3] = v21;
      v61[4] = v51;
      v40 = (void *)MEMORY[0x1E4F1C978];
      v41 = v61;
    }
    else if ([(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v18])
    {
      v60[0] = v53;
      v60[1] = v52;
      v60[2] = v32;
      v60[3] = v21;
      v60[4] = v50;
      v40 = (void *)MEMORY[0x1E4F1C978];
      v41 = v60;
    }
    else if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v32])
    {
      v59[0] = v53;
      v59[1] = v52;
      v59[2] = v18;
      v59[3] = v21;
      v59[4] = v51;
      v40 = (void *)MEMORY[0x1E4F1C978];
      v41 = v59;
    }
    else if ([(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v32])
    {
      v58[0] = v53;
      v58[1] = v52;
      v58[2] = v18;
      v58[3] = v21;
      v58[4] = v50;
      v40 = (void *)MEMORY[0x1E4F1C978];
      v41 = v58;
    }
    else if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v21])
    {
      v57[0] = v53;
      v57[1] = v52;
      v57[2] = v18;
      v57[3] = v32;
      v57[4] = v51;
      v40 = (void *)MEMORY[0x1E4F1C978];
      v41 = v57;
    }
    else
    {
      if (![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v21])
      {
        [v51 setGridSizeClass:*MEMORY[0x1E4FA6560]];
        v55[0] = v53;
        v55[1] = v52;
        v55[2] = v18;
        v55[3] = v32;
        v55[4] = v21;
        v55[5] = v51;
        v40 = (void *)MEMORY[0x1E4F1C978];
        v41 = v55;
        uint64_t v43 = 6;
        goto LABEL_92;
      }
      v56[0] = v53;
      v56[1] = v52;
      v56[2] = v18;
      v56[3] = v32;
      v56[4] = v50;
      v40 = (void *)MEMORY[0x1E4F1C978];
      v41 = v56;
    }
    goto LABEL_91;
  }
  if ([(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v32]&& ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v21]|| [(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v21]&& ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v32])
  {
    [v50 setGridSizeClass:*MEMORY[0x1E4FA6560]];
    v65[0] = v53;
    v65[1] = v18;
    v65[2] = v32;
    v65[3] = v21;
    v65[4] = v50;
    v40 = (void *)MEMORY[0x1E4F1C978];
    v41 = v65;
    goto LABEL_91;
  }
  if (![(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v32]&& [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v21]|| ![(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v21]&& [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v32])
  {
    [v51 setGridSizeClass:*MEMORY[0x1E4FA6560]];
    v64[0] = v53;
    v64[1] = v18;
    v64[2] = v32;
    v64[3] = v21;
    v64[4] = v51;
    v40 = (void *)MEMORY[0x1E4F1C978];
    v41 = v64;
LABEL_91:
    uint64_t v43 = 5;
    goto LABEL_92;
  }
  if ((![(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v32]|| ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v21])&& (![(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v21]|| ![(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v32]))
  {
    v62[0] = v53;
    v62[1] = v18;
    v62[2] = v32;
    v62[3] = v21;
    v62[4] = v51;
    v40 = (void *)MEMORY[0x1E4F1C978];
    v41 = v62;
    goto LABEL_91;
  }
  v63[0] = v53;
  v63[1] = v18;
  v63[2] = v51;
  v63[3] = v50;
  v40 = (void *)MEMORY[0x1E4F1C978];
  v41 = v63;
  uint64_t v43 = 4;
LABEL_92:
  v35 = [v40 arrayWithObjects:v41 count:v43];
  v19 = v32;
  id v6 = v28;
LABEL_93:

  return v35;
}

- (id)migratedFourWidgets:(id)a3
{
  void v27[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallClockWidgetIcon];
  id v6 = [(SBWidgetOnboardingLayoutBuilder *)self defaultSmallCalendarWidgetIcon];
  uint64_t v7 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumFirstSuggestionWidgetIcon];
  uint64_t v24 = [(SBWidgetOnboardingLayoutBuilder *)self defaultMediumSecondSuggestionWidgetIcon];
  v8 = [v4 firstObject];
  char v9 = [v4 objectAtIndex:1];
  id v10 = [v4 objectAtIndex:2];
  uint64_t v11 = [v4 objectAtIndex:3];

  if ([(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v8]
    || [(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v9]
    || [(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v10])
  {
    int v12 = 0;
  }
  else
  {
    int v12 = ![(SBWidgetOnboardingLayoutBuilder *)self isCalendarWidgetIcon:v11];
  }
  BOOL v13 = [(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v8]|| [(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v9]|| [(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v10]|| [(SBWidgetOnboardingLayoutBuilder *)self isFirstSuggestionActiveWidgetIcon:v11];
  BOOL v14 = [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v8]|| [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v9]|| [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v10]|| [(SBWidgetOnboardingLayoutBuilder *)self isSecondSuggestionActiveWidgetIcon:v11];
  if (((v12 | v13) & 1) == 0)
  {
    [v7 setGridSizeClass:*MEMORY[0x1E4FA6560]];
    BOOL v15 = (void **)v27;
    uint64_t v16 = v8;
    v27[0] = v5;
    int v17 = v9;
    BOOL v18 = v10;
    v19 = v11;
    uint64_t v20 = v7;
    goto LABEL_17;
  }
  if ((v12 | v14))
  {
    BOOL v15 = &v25;
    uint64_t v16 = v6;
    id v25 = v5;
    int v17 = v8;
    BOOL v18 = v9;
    v19 = v10;
    uint64_t v20 = v11;
LABEL_17:
    uint64_t v21 = v24;
    goto LABEL_19;
  }
  uint64_t v21 = v24;
  [v24 setGridSizeClass:*MEMORY[0x1E4FA6560]];
  BOOL v15 = &v26;
  uint64_t v16 = v8;
  int v26 = v5;
  int v17 = v9;
  BOOL v18 = v10;
  v19 = v11;
  uint64_t v20 = v24;
LABEL_19:
  v15[1] = v16;
  v15[2] = v17;
  v15[3] = v18;
  v15[4] = v19;
  v15[5] = v20;
  BOOL v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

  return v22;
}

- (id)migratedDefaultWidgets:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  v72[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self->_pinnedWidgets;
  if (v3)
  {
    id v6 = [(SBWidgetOnboardingLayoutBuilder *)v4 defaultSmallClockWidgetIcon];
    uint64_t v7 = [(SBWidgetOnboardingLayoutBuilder *)v4 defaultSmallNotesWidgetIcon];
    v8 = [(SBWidgetOnboardingLayoutBuilder *)v4 defaultMediumCalendarWidgetIcon];
    char v9 = [(SBWidgetOnboardingLayoutBuilder *)v4 defaultLargeFirstSuggestionWidgetIcon];
    id v10 = [(SBWidgetOnboardingLayoutBuilder *)v4 defaultLargeSecondSuggestionWidgetIcon];
    v72[0] = v6;
    v72[1] = v7;
    v72[2] = v9;
    v72[3] = v10;
    void v72[4] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:5];
    int v12 = SBLogWidgetDiscoverability();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "Builder logic 0", buf, 2u);
    }

LABEL_5:
LABEL_6:

    goto LABEL_52;
  }
  BOOL v13 = v5;
  if ([(NSArray *)v5 count] != 1)
  {
    if ([(NSArray *)v13 count] != 2)
    {
      if ([(NSArray *)v13 count] == 3)
      {
        uint64_t v11 = [(SBWidgetOnboardingLayoutBuilder *)v4 migratedThreeWidgets:v13];
        id v6 = SBLogWidgetDiscoverability();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_52;
        }
        *(_WORD *)buf = 0;
        BOOL v38 = "Builder logic three widgets";
      }
      else
      {
        if ([(NSArray *)v13 count] != 4)
        {
          id v6 = [(SBWidgetOnboardingLayoutBuilder *)v4 defaultSmallClockWidgetIcon];
          uint64_t v7 = [(SBWidgetOnboardingLayoutBuilder *)v4 defaultSmallCalendarWidgetIcon];
          v8 = [(SBWidgetOnboardingLayoutBuilder *)v4 defaultMediumFirstSuggestionWidgetIcon];
          char v9 = [(SBWidgetOnboardingLayoutBuilder *)v4 defaultMediumSecondSuggestionWidgetIcon];
          v71[0] = v6;
          v71[1] = v7;
          v71[2] = v8;
          v71[3] = v9;
          uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:4];
          uint64_t v45 = SBLogWidgetDiscoverability();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v45, OS_LOG_TYPE_DEFAULT, "Builder logic other", buf, 2u);
          }

          goto LABEL_5;
        }
        uint64_t v11 = [(SBWidgetOnboardingLayoutBuilder *)v4 migratedFourWidgets:v13];
        id v6 = SBLogWidgetDiscoverability();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_52;
        }
        *(_WORD *)buf = 0;
        BOOL v38 = "Builder logic four widgets";
      }
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
      goto LABEL_52;
    }
    long long v30 = v4;
    id v6 = [(NSArray *)v13 firstObject];
    uint64_t v7 = [(NSArray *)v13 objectAtIndex:1];
    long long v31 = [v6 gridSizeClass];
    uint64_t v32 = [v7 gridSizeClass];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      long long v33 = (void *)v32;
      uint64_t v34 = [v6 gridSizeClass];
      v35 = [v7 gridSizeClass];
      int v36 = [v34 isEqualToString:v35];

      if (!v36)
      {
        id v4 = v30;
        uint64_t v11 = [(SBWidgetOnboardingLayoutBuilder *)v30 migratedSmallAndMediumWidget:v13];
        v8 = SBLogWidgetDiscoverability();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_6;
        }
        *(_WORD *)buf = 0;
        v37 = "Builder logic one small, one medium";
LABEL_39:
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
        goto LABEL_6;
      }
    }
    v40 = [v6 gridSizeClass];
    v41 = v40;
    uint64_t v42 = *MEMORY[0x1E4FA6560];
    if (v40 == (void *)*MEMORY[0x1E4FA6560])
    {
    }
    else
    {
      uint64_t v43 = [v6 gridSizeClass];
      int v44 = [v43 isEqualToString:v42];

      if (!v44)
      {
        id v4 = v30;
        uint64_t v11 = [(SBWidgetOnboardingLayoutBuilder *)v30 migratedTwoMediumWidgets:v13];
        v8 = SBLogWidgetDiscoverability();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_6;
        }
        *(_WORD *)buf = 0;
        v37 = "Builder logic two mediums";
        goto LABEL_39;
      }
    }
    id v4 = v30;
    uint64_t v11 = [(SBWidgetOnboardingLayoutBuilder *)v30 migratedTwoSmallWidgets:v13];
    v8 = SBLogWidgetDiscoverability();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    v37 = "Builder logic two smalls";
    goto LABEL_39;
  }
  BOOL v14 = v4;
  id v6 = [(NSArray *)v13 firstObject];
  BOOL v15 = [v6 gridSizeClass];
  uint64_t v16 = v15;
  uint64_t v17 = *MEMORY[0x1E4FA6528];
  if (v15 == (void *)*MEMORY[0x1E4FA6528])
  {
  }
  else
  {
    BOOL v18 = [v6 gridSizeClass];
    int v19 = [v18 isEqualToString:v17];

    if (!v19)
    {
      uint64_t v20 = [v6 gridSizeClass];
      uint64_t v21 = v20;
      uint64_t v22 = *MEMORY[0x1E4FA6530];
      if (v20 == (void *)*MEMORY[0x1E4FA6530])
      {
      }
      else
      {
        uint64_t v23 = [v6 gridSizeClass];
        int v24 = [v23 isEqualToString:v22];

        if (!v24)
        {
          id v25 = [v6 gridSizeClass];
          int v26 = v25;
          uint64_t v27 = *MEMORY[0x1E4FA6560];
          if (v25 == (void *)*MEMORY[0x1E4FA6560])
          {
          }
          else
          {
            id v28 = [v6 gridSizeClass];
            int v29 = [v28 isEqualToString:v27];

            if (!v29)
            {
              uint64_t v11 = 0;
              id v4 = v14;
              goto LABEL_52;
            }
          }
          v48 = SBLogWidgetDiscoverability();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v48, OS_LOG_TYPE_DEFAULT, "Builder logic one small", buf, 2u);
          }

          id v4 = v14;
          uint64_t v47 = [(SBWidgetOnboardingLayoutBuilder *)v14 migratedOneSmallWidget:v6];
          goto LABEL_51;
        }
      }
      uint64_t v46 = SBLogWidgetDiscoverability();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v46, OS_LOG_TYPE_DEFAULT, "Builder logic one medium", buf, 2u);
      }

      id v4 = v14;
      uint64_t v47 = [(SBWidgetOnboardingLayoutBuilder *)v14 migratedOneMediumWidget:v6];
LABEL_51:
      uint64_t v11 = (void *)v47;
      goto LABEL_52;
    }
  }
  id v4 = v14;
  uint64_t v11 = [(SBWidgetOnboardingLayoutBuilder *)v14 migratedOneLargeWidget:v6];
  v39 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v39, OS_LOG_TYPE_DEFAULT, "Builder logic one large", buf, 2u);
  }

LABEL_52:
  v49 = SBLogWidgetDiscoverability();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v49, OS_LOG_TYPE_DEFAULT, "Builder logic CalendarWidgetMigrator starting...", buf, 2u);
  }

  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v11;
  uint64_t v51 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v66 != v53) {
          objc_enumerationMutation(obj);
        }
        v55 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        v56 = [v55 activeWidget];
        v57 = [v56 kind];
        if ([v57 isEqualToString:@"com.apple.CalendarWidget.CalendarWidget"])
        {
          v58 = [v55 gridSizeClass];
          v59 = v4;
          v60 = [(SBWidgetOnboardingLayoutBuilder *)v4 defaultCalendarWidgetIcon:v58];
          [v50 addObject:v60];

          v61 = SBLogWidgetDiscoverability();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D85BA000, v61, OS_LOG_TYPE_DEFAULT, "Builder logic: Upgrading calendar widget", buf, 2u);
          }

          id v4 = v59;
        }
        else
        {
          [v50 addObject:v55];
        }
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v52);
  }

  return v50;
}

- (NSArray)pinnedWidgets
{
  return self->_pinnedWidgets;
}

- (NSArray)suggestionWidgets
{
  return self->_suggestionWidgets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionWidgets, 0);
  objc_storeStrong((id *)&self->_pinnedWidgets, 0);
}

@end