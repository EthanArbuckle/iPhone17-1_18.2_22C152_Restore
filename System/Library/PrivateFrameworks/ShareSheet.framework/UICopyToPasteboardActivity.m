@interface UICopyToPasteboardActivity
+ (unint64_t)_xpcAttributes;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)pasteboard;
- (int64_t)_defaultSortGroup;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation UICopyToPasteboardActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

- (int64_t)_defaultSortGroup
{
  return 1;
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.CopyToPasteboard";
}

- (id)activityTitle
{
  uint64_t v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"Copy[Activity]" value:@"Copy" table:@"Localizable"];

  return v3;
}

- (id)_systemImageName
{
  return @"doc.on.doc";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_UIActivityItemTypes() == 0x4000)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(MEMORY[0x1E4F9F6B8], "isSWYActivityItemProvider:", v9, (void)v12) & 1) != 0)
          {
            BOOL v10 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 1;
LABEL_14:
  }
  else
  {
    BOOL v10 = (_UIActivityItemTypes() & 0x9F) != 0;
  }

  return v10;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_UIActivityItemTypes() == 0x4000)
  {
    uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_18];
    uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

    uint64_t v7 = [(UICopyToPasteboardActivity *)self pasteboard];
    [v7 setItemProviders:v6];

    goto LABEL_49;
  }
  v35 = self;
  v8 = [MEMORY[0x1E4F1CA48] array];
  [MEMORY[0x1E4F1CA48] array];
  v37 = id v36 = v4;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
  unint64_t v11 = 0x1E4F28000uLL;
  if (!v10) {
    goto LABEL_39;
  }
  uint64_t v12 = v10;
  uint64_t v13 = *(void *)v45;
  CFStringRef inTagClass = (const __CFString *)*MEMORY[0x1E4F224F8];
  v38 = (void *)*MEMORY[0x1E4F22590];
  v40 = v8;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v45 != v13) {
        objc_enumerationMutation(v9);
      }
      long long v15 = *(void **)(*((void *)&v44 + 1) + 8 * v14);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ([v15 isFileURL] & 1) == 0)
      {
LABEL_19:
        id v19 = (id)[objc_alloc(*(Class *)(v11 + 3448)) initWithObject:v15];
        if (!v19) {
          goto LABEL_21;
        }
LABEL_20:
        [v8 addObject:v19];

        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 isFileURL])
      {
        id v16 = v15;
        uint64_t v17 = [v16 pathExtension];
        if (!v17
          || (PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(inTagClass, v17, 0)) == 0)
        {
          PreferredIdentifierForTag = v38;
        }
        id v19 = objc_alloc_init(*(Class *)(v11 + 3448));
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __55__UICopyToPasteboardActivity_prepareWithActivityItems___block_invoke_19;
        v42[3] = &unk_1E5A22968;
        id v43 = v16;
        id v20 = v16;
        [v19 registerFileRepresentationForTypeIdentifier:PreferredIdentifierForTag fileOptions:0 visibility:0 loadHandler:v42];
        v21 = [v20 lastPathComponent];
        [v19 setSuggestedName:v21];

        unint64_t v11 = 0x1E4F28000;
        v8 = v40;
LABEL_35:
        if (v19) {
          goto LABEL_20;
        }
        goto LABEL_21;
      }
      if ([v15 conformsToProtocol:&unk_1EF3A5198]) {
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [MEMORY[0x1E4FB1818] imageWithData:v15];
        if (v22) {
          id v19 = (id)[objc_alloc(*(Class *)(v11 + 3448)) initWithObject:v22];
        }
        else {
          id v19 = 0;
        }

        goto LABEL_35;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v37 addObject:v15];
        goto LABEL_21;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v15;
        v23 = +[SHSheetGroupActivity groupActivityType];
        int v24 = [v19 hasItemConformingToTypeIdentifier:v23];

        if (v24)
        {
          v25 = share_sheet_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0AD8000, v25, OS_LOG_TYPE_DEFAULT, "SharePlay: Filtering out GroupActivity provider from Copy action", buf, 2u);
          }

          unint64_t v11 = 0x1E4F28000;
          goto LABEL_21;
        }
        unint64_t v11 = 0x1E4F28000;
        goto LABEL_35;
      }
LABEL_21:
      ++v14;
    }
    while (v12 != v14);
    uint64_t v26 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
    uint64_t v12 = v26;
  }
  while (v26);
LABEL_39:

  if (![v8 count])
  {
    v27 = [v9 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v29 = [v9 firstObject];
      v30 = +[SHSheetGroupActivity groupActivityType];
      if ([v29 hasItemConformingToTypeIdentifier:v30])
      {
        v31 = [v29 registeredTypeIdentifiers];
        unint64_t v32 = [v31 count];

        if (v32 >= 2) {
          [v8 addObject:v29];
        }
      }
      else
      {
      }
    }
  }
  v33 = [(UICopyToPasteboardActivity *)v35 pasteboard];
  [v33 setItemProviders:v8];

  if ([v37 count])
  {
    v34 = [(UICopyToPasteboardActivity *)v35 pasteboard];
    [v34 addItems:v37];
  }
  id v4 = v36;
LABEL_49:
}

uint64_t __55__UICopyToPasteboardActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SHSheetGroupActivity groupActivityType];
  int v4 = [v2 hasItemConformingToTypeIdentifier:v3];

  if (v4)
  {
    uint64_t v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "SharePlay: Filtering out GroupActivity provider from Copy action", v7, 2u);
    }
  }
  return v4 ^ 1u;
}

uint64_t __55__UICopyToPasteboardActivity_prepareWithActivityItems___block_invoke_19(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (void)performActivity
{
}

- (id)pasteboard
{
  return (id)[MEMORY[0x1E4FB1A78] generalPasteboard];
}

@end