@interface _UIActivityItemMapping
+ (BOOL)_canLoadMetadataForActivityItem:(id)a3;
+ (id)_activeActivityViewControllers;
+ (id)_activityViewControllerForActivityItem:(id)a3;
+ (id)_attachmentNameForActivityItem:(id)a3 activityType:(id)a4;
+ (id)_dataTypeIdentifierForActivityItem:(id)a3 activityType:(id)a4;
+ (id)_itemProviderForActivityItem:(id)a3 typeIdentifier:(id)a4 thumbnailSize:(CGSize)a5 activityType:(id)a6;
+ (id)_loadMetadataForActivityItem:(id)a3 activityViewController:(id)a4;
+ (id)_openURLAnnotationForActivityItem:(id)a3 activityType:(id)a4;
+ (id)_originalActivityItemForActivityItem:(id)a3;
+ (id)_subjectForActivityItem:(id)a3 activityType:(id)a4;
+ (id)_thumbnailImageDataForActivityItem:(id)a3 thumbnailSize:(CGSize)a4 activityType:(id)a5;
+ (id)_thumbnailImageForActivityItem:(id)a3 thumbnailSize:(CGSize)a4 activityType:(id)a5;
+ (void)_addActivityItem:(id)a3 activityViewController:(id)a4 originalActivityItem:(id)a5;
+ (void)_addToActiveActivityViewControllers:(id)a3;
+ (void)_clearActivityItems:(id)a3;
+ (void)_removeFromActiveActivityViewControllers:(id)a3;
+ (void)initialize;
@end

@implementation _UIActivityItemMapping

+ (void)_addToActiveActivityViewControllers:(id)a3
{
  uint64_t v3 = _addToActiveActivityViewControllers__onceToken;
  id v4 = a3;
  id v6 = v4;
  if (v3 == -1)
  {
    id v5 = v4;
  }
  else
  {
    dispatch_once(&_addToActiveActivityViewControllers__onceToken, &__block_literal_global_35);
    id v5 = v6;
  }
  [(id)_activeActivityViewControllers addObject:v5];
}

+ (void)_removeFromActiveActivityViewControllers:(id)a3
{
}

+ (id)_activeActivityViewControllers
{
  return (id)[(id)_activeActivityViewControllers allObjects];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:517 capacity:1];
    uint64_t v3 = (void *)__activityViewControllers;
    __activityViewControllers = v2;

    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:1];
    uint64_t v5 = __originalItems;
    __originalItems = v4;
    MEMORY[0x1F41817F8](v4, v5);
  }
}

+ (void)_addActivityItem:(id)a3 activityViewController:(id)a4 originalActivityItem:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0
      && (objc_opt_respondsToSelector() & 1) == 0
      && ![v8 conformsToProtocol:&unk_1EF3A5318])
    {
      goto LABEL_16;
    }
LABEL_15:
    [(id)__activityViewControllers setObject:v7 forKey:v9];
    [(id)__originalItems setObject:v8 forKey:v9];
    goto LABEL_16;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0
    || ([v9 conformsToProtocol:&unk_1EF3A5318] & 1) != 0)
  {
    goto LABEL_15;
  }
LABEL_16:
}

+ (void)_clearActivityItems:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = (id)__originalItems;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v11 = [(id)__activityViewControllers objectForKey:v10];
        int v12 = [v11 isEqual:v3];
        if (v11) {
          BOOL v13 = v12 == 0;
        }
        else {
          BOOL v13 = 0;
        }
        if (!v13) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v20 + 1) + 8 * j);
        objc_msgSend((id)__activityViewControllers, "removeObjectForKey:", v19, (void)v20);
        [(id)__originalItems removeObjectForKey:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }
}

+ (id)_originalActivityItemForActivityItem:(id)a3
{
  return (id)[(id)__originalItems objectForKey:a3];
}

+ (id)_activityViewControllerForActivityItem:(id)a3
{
  return (id)[(id)__activityViewControllers objectForKey:a3];
}

+ (BOOL)_canLoadMetadataForActivityItem:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (id)_loadMetadataForActivityItem:(id)a3 activityViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v5 activityViewControllerLinkPresentationMetadata:v6];
LABEL_5:
    id v8 = (id)v7;
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v5 activityViewControllerLinkMetadata:v6];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_alloc_init((Class)getLPLinkMetadataClass());
    [v8 setSummary:v5];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v11 = (void *)getLPImageClass_softClass;
    uint64_t v20 = getLPImageClass_softClass;
    if (!getLPImageClass_softClass)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __getLPImageClass_block_invoke;
      v16[3] = &unk_1E5A216E8;
      v16[4] = &v17;
      __getLPImageClass_block_invoke((uint64_t)v16);
      v11 = (void *)v18[3];
    }
    int v12 = v11;
    _Block_object_dispose(&v17, 8);
    id v13 = [v12 alloc];
    id v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"text.cursor"];
    uint64_t v15 = (void *)[v13 initWithPlatformImage:v14];
    [v8 setIcon:v15];
  }
  else
  {
    id v8 = 0;
  }
LABEL_6:
  getLPLinkMetadataClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

+ (id)_itemProviderForActivityItem:(id)a3 typeIdentifier:(id)a4 thumbnailSize:(CGSize)a5 activityType:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v11 = a3;
  int v12 = (__CFString *)a4;
  id v13 = a6;
  if ([v11 conformsToProtocol:&unk_1EF36B550])
  {
    id v14 = v11;
    if (v14) {
      goto LABEL_5;
    }
  }
  id v14 = [(id)__originalItems objectForKey:v11];
  if (([v14 conformsToProtocol:&unk_1EF36B550] & 1) == 0)
  {

    goto LABEL_8;
  }
  if (!v14)
  {
LABEL_8:
    id v32 = a1;
    id v33 = v13;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __97___UIActivityItemMapping__itemProviderForActivityItem_typeIdentifier_thumbnailSize_activityType___block_invoke_2;
    v39[3] = &unk_1E5A22768;
    uint64_t v17 = &v40;
    id v18 = v11;
    id v40 = v18;
    uint64_t v15 = (void *)MEMORY[0x1A6229A90](v39);
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithItem:v18 typeIdentifier:v12];
    id v14 = 0;
    char v19 = 1;
    goto LABEL_14;
  }
LABEL_5:
  if ([v14 conformsToProtocol:&unk_1EF3A5318])
  {
    uint64_t v15 = [a1 _activityViewControllerForActivityItem:v11];
    uint64_t v16 = [v14 activityViewControllerApplicationExtensionItem:v15];
    goto LABEL_28;
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __97___UIActivityItemMapping__itemProviderForActivityItem_typeIdentifier_thumbnailSize_activityType___block_invoke;
  v41[3] = &unk_1E5A23230;
  uint64_t v17 = &v42;
  id v14 = v14;
  id v42 = v14;
  id v32 = a1;
  id v45 = a1;
  id v20 = v11;
  id v43 = v20;
  id v21 = v13;
  id v44 = v21;
  uint64_t v15 = (void *)MEMORY[0x1A6229A90](v41);
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithItem:0 typeIdentifier:0];
  [v16 registerItemForTypeIdentifier:v12 loadHandler:v15];
  if (objc_opt_respondsToSelector())
  {
    long long v22 = [v32 _activityViewControllerForActivityItem:v20];
    long long v23 = [v14 activityViewController:v22 attachmentNameForActivityType:v21];

    if ([v23 length]) {
      [v16 setSuggestedName:v23];
    }
  }
  id v33 = v13;

  char v19 = 0;
LABEL_14:

  long long v24 = (void *)*MEMORY[0x1E4F226F8];
  int v25 = UTTypeConformsTo(v12, (CFStringRef)*MEMORY[0x1E4F226F8]);
  id v26 = v24;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v25)
  {
    if ((v19 & 1) == 0)
    {
      v28 = [v32 _activityViewControllerForActivityItem:v11];
      v29 = [v14 activityViewControllerPlaceholderItem:v28];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !v25)
      {
        if ([v29 isFileURL])
        {
          id v30 = (id)*MEMORY[0x1E4F225B8];

          id v26 = v30;
        }
        objc_msgSend(v16, "registerItemForTypeIdentifier:loadHandler:", v26, v15, v32);
      }
    }
    id v13 = v33;
  }
  else
  {
    if ([v11 isFileURL])
    {
      id v27 = (id)*MEMORY[0x1E4F225B8];

      id v26 = v27;
    }
    id v13 = v33;
    objc_msgSend(v16, "registerItemForTypeIdentifier:loadHandler:", v26, v15, v32);
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __97___UIActivityItemMapping__itemProviderForActivityItem_typeIdentifier_thumbnailSize_activityType___block_invoke_3;
  v34[3] = &unk_1E5A23258;
  id v35 = v11;
  CGFloat v37 = width;
  CGFloat v38 = height;
  id v36 = v13;
  [v16 setPreviewImageHandler:v34];

LABEL_28:
  return v16;
}

+ (id)_subjectForActivityItem:(id)a3 activityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [a1 _activityViewControllerForActivityItem:v6];
    id v9 = [v6 activityViewController:v8 subjectForActivityType:v7];
  }
  else
  {
    id v8 = [(id)__originalItems objectForKey:v6];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [a1 _activityViewControllerForActivityItem:v6];
      id v9 = [v8 activityViewController:v10 subjectForActivityType:v7];
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

+ (id)_dataTypeIdentifierForActivityItem:(id)a3 activityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [a1 _activityViewControllerForActivityItem:v6];
    id v9 = [v6 activityViewController:v8 dataTypeIdentifierForActivityType:v7];
  }
  else
  {
    id v8 = [(id)__originalItems objectForKey:v6];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [a1 _activityViewControllerForActivityItem:v6];
      id v9 = [v8 activityViewController:v10 dataTypeIdentifierForActivityType:v7];
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

+ (id)_thumbnailImageForActivityItem:(id)a3 thumbnailSize:(CGSize)a4 activityType:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  if (height <= 0.0)
  {
    int v12 = 0;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      id v11 = [a1 _activityViewControllerForActivityItem:v9];
      int v12 = objc_msgSend(v9, "activityViewController:thumbnailImageForActivityType:suggestedSize:", v11, v10, width, height);
    }
    else
    {
      id v11 = [(id)__originalItems objectForKey:v9];
      if (objc_opt_respondsToSelector())
      {
        id v13 = [a1 _activityViewControllerForActivityItem:v9];
        int v12 = objc_msgSend(v11, "activityViewController:thumbnailImageForActivityType:suggestedSize:", v13, v10, width, height);
      }
      else
      {
        int v12 = 0;
      }
    }
  }
  return v12;
}

+ (id)_thumbnailImageDataForActivityItem:(id)a3 thumbnailSize:(CGSize)a4 activityType:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  if (height <= 0.0)
  {
    int v12 = 0;
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      id v11 = [a1 _activityViewControllerForActivityItem:v9];
      int v12 = objc_msgSend(v9, "activityViewController:thumbnailImageDataForActivityType:suggestedSize:", v11, v10, width, height);
    }
    else
    {
      id v11 = [(id)__originalItems objectForKey:v9];
      if (objc_opt_respondsToSelector())
      {
        id v13 = [a1 _activityViewControllerForActivityItem:v9];
        int v12 = objc_msgSend(v11, "activityViewController:thumbnailImageDataForActivityType:suggestedSize:", v13, v10, width, height);
      }
      else
      {
        int v12 = 0;
      }
    }
  }
  return v12;
}

+ (id)_attachmentNameForActivityItem:(id)a3 activityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [a1 _activityViewControllerForActivityItem:v6];
    id v9 = [v6 activityViewController:v8 attachmentNameForActivityType:v7];
  }
  else
  {
    id v8 = [(id)__originalItems objectForKey:v6];
    if (objc_opt_respondsToSelector())
    {
      id v10 = [a1 _activityViewControllerForActivityItem:v6];
      id v9 = [v8 activityViewController:v10 attachmentNameForActivityType:v7];
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

+ (id)_openURLAnnotationForActivityItem:(id)a3 activityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [a1 _activityViewControllerForActivityItem:v6];
    id v9 = [v6 activityViewController:v8 openURLAnnotationForActivityType:v7];
  }
  else
  {
    id v8 = [(id)__originalItems objectForKey:v6];
    if (objc_opt_respondsToSelector())
    {
      id v10 = [a1 _activityViewControllerForActivityItem:v6];
      id v9 = [v8 activityViewController:v10 openURLAnnotationForActivityType:v7];
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

@end