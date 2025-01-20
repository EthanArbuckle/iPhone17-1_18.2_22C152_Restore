@interface SUScriptActivityViewController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)activityTypeAddToReadingList;
- (NSString)activityTypeAssignToContact;
- (NSString)activityTypeCopyToPasteboard;
- (NSString)activityTypeMail;
- (NSString)activityTypeMessage;
- (NSString)activityTypePostToFacebook;
- (NSString)activityTypePostToFlickr;
- (NSString)activityTypePostToTwitter;
- (NSString)activityTypePostToVimeo;
- (NSString)activityTypePostToWeibo;
- (NSString)activityTypePrint;
- (NSString)activityTypeSaveToCameraRoll;
- (SUScriptActivityViewController)initWithScriptItemProviders:(id)a3 applicationActivities:(id)a4;
- (id)_className;
- (id)excludedActivityTypes;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (void)dealloc;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setTitle:(id)a3 forActivityType:(id)a4;
@end

@implementation SUScriptActivityViewController

- (SUScriptActivityViewController)initWithScriptItemProviders:(id)a3 applicationActivities:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SUScriptActivityViewController;
  v6 = [(SUScriptObject *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [a4 copy];
    v6->_applicationActivities = (NSArray *)v7;
    if (v7) {
      [(SUScriptObject *)v6 checkInScriptObjects:v7];
    }
    uint64_t v8 = [a3 copy];
    v6->_providers = (NSArray *)v8;
    if (v8) {
      [(SUScriptObject *)v6 checkInScriptObjects:v8];
    }
  }
  return v6;
}

- (void)dealloc
{
  if (self->_applicationActivities)
  {
    -[SUScriptObject checkOutScriptObjects:](self, "checkOutScriptObjects:");
    applicationActivities = self->_applicationActivities;
  }
  else
  {
    applicationActivities = 0;
  }

  if (self->_providers)
  {
    -[SUScriptObject checkOutScriptObjects:](self, "checkOutScriptObjects:");
    providers = self->_providers;
  }
  else
  {
    providers = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)SUScriptActivityViewController;
  [(SUScriptViewController *)&v5 dealloc];
}

- (id)newNativeViewController
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  applicationActivities = self->_applicationActivities;
  uint64_t v6 = [(NSArray *)applicationActivities countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(applicationActivities);
        }
        uint64_t v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) nativeActivity];
        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [(NSArray *)applicationActivities countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  providers = self->_providers;
  uint64_t v12 = [(NSArray *)providers countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(providers);
        }
        uint64_t v16 = [*(id *)(*((void *)&v19 + 1) + 8 * j) nativeActivityItemProvider];
        if (v16) {
          [v4 addObject:v16];
        }
      }
      uint64_t v13 = [(NSArray *)providers countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }
  v17 = [[SUActivityViewController alloc] initWithActivityItems:v4 applicationActivities:v3];

  return v17;
}

- (void)setTitle:(id)a3 forActivityType:(id)a4
{
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0
     || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
     || (isKindOfClass & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F1FA90];
    [v6 throwException:@"Invalid argument"];
  }
}

uint64_t __59__SUScriptActivityViewController_setTitle_forActivityType___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 setTitle:v3 forActivityType:v4];
}

- (id)_className
{
  return @"iTunesActivityViewController";
}

- (id)excludedActivityTypes
{
  uint64_t v4 = 0;
  objc_super v5 = &v4;
  uint64_t v6 = 0x3052000000;
  uint64_t v7 = __Block_byref_object_copy__46;
  uint64_t v8 = __Block_byref_object_dispose__46;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __55__SUScriptActivityViewController_excludedActivityTypes__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "excludedActivityTypes");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    uint64_t v7 = [(WebFrame *)[(SUScriptObject *)self webFrame] globalContext];
    if (v7)
    {
      uint64_t v8 = (void *)[v5 copyArrayOrDictionaryWithContext:v7];
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
LABEL_12:

          return;
        }
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    WebThreadRunOnMainThread();
    goto LABEL_12;
  }
  uint64_t v9 = (void *)MEMORY[0x263F1FA90];

  [v9 throwException:@"Invalid argument"];
}

uint64_t __59__SUScriptActivityViewController_setExcludedActivityTypes___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setExcludedActivityTypes:v3];
}

- (NSString)activityTypeAddToReadingList
{
  return (NSString *)*MEMORY[0x263F1CF98];
}

- (NSString)activityTypeAssignToContact
{
  return (NSString *)*MEMORY[0x263F1CFA8];
}

- (NSString)activityTypeCopyToPasteboard
{
  return (NSString *)*MEMORY[0x263F1CFB0];
}

- (NSString)activityTypeMail
{
  return (NSString *)*MEMORY[0x263F1CFB8];
}

- (NSString)activityTypeMessage
{
  return (NSString *)*MEMORY[0x263F1CFC8];
}

- (NSString)activityTypePostToFacebook
{
  return (NSString *)*MEMORY[0x263F1CFD8];
}

- (NSString)activityTypePostToFlickr
{
  return (NSString *)*MEMORY[0x263F1CFE0];
}

- (NSString)activityTypePostToTwitter
{
  return 0;
}

- (NSString)activityTypePostToVimeo
{
  return (NSString *)*MEMORY[0x263F1CFF8];
}

- (NSString)activityTypePostToWeibo
{
  return (NSString *)*MEMORY[0x263F1D000];
}

- (NSString)activityTypePrint
{
  return (NSString *)*MEMORY[0x263F1D008];
}

- (NSString)activityTypeSaveToCameraRoll
{
  return (NSString *)*MEMORY[0x263F1D010];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_61, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptActivityViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_47, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptActivityViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptActivityViewController;
  id v2 = [(SUScriptViewController *)&v4 scriptAttributeKeys];
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_61, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_47 = (uint64_t)sel_setTitle_forActivityType_;
    unk_2681B5600 = @"setActivityTitle";
    __KeyMapping_61 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"excludedActivityTypes", @"ACTIVITY_TYPE_ADD_TO_READING_LIST", @"activityTypeAddToReadingList", @"ACTIVITY_TYPE_ASSIGN_TO_CONTACT", @"activityTypeAssignToContact", @"ACTIVITY_TYPE_COPY_TO_PASTEBOARD", @"activityTypeCopyToPasteboard", @"ACTIVITY_TYPE_MAIL", @"activityTypeMail", @"ACTIVITY_TYPE_MESSAGE", @"activityTypeMessage", @"ACTIVITY_TYPE_POST_TO_FACEBOOK", @"activityTypePostToFacebook", @"ACTIVITY_TYPE_POST_TO_FLICKR", @"activityTypePostToFlickr", @"ACTIVITY_TYPE_POST_TO_TWITTER", @"activityTypePostToTwitter",
                        @"ACTIVITY_TYPE_POST_TO_VIMEO",
                        @"activityTypePostToVimeo",
                        @"ACTIVITY_TYPE_POST_TO_WEIBO",
                        @"activityTypePostToWeibo",
                        @"ACTIVITY_TYPE_PRINT",
                        @"activityTypePrint",
                        @"ACTIVITY_TYPE_SAVE_TO_CAMERA_ROLL",
                        @"activityTypeSaveToCameraRoll",
                        0);
  }
}

@end