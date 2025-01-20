@interface SUScriptActivity
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)activityImageNameGiftAppStore;
- (NSString)activityImageNameGiftMusicStore;
- (NSString)activityImageNamePingAppStore;
- (NSString)activityImageNamePingMusicStore;
- (NSString)activityImageNameWishlistAppStore;
- (NSString)activityImageNameWishlistMusicStore;
- (NSString)activityTitle;
- (NSString)activityType;
- (WebScriptObject)actionFunction;
- (id)_className;
- (id)_nativeActivity;
- (id)scriptAttributeKeys;
- (void)_performActionFunctionWithItems:(id)a3;
- (void)dealloc;
- (void)setActionFunction:(id)a3;
- (void)setActivityImageWithName:(id)a3;
- (void)setActivityImageWithURL:(id)a3 scale:(id)a4;
- (void)setActivityTitle:(id)a3;
- (void)setActivityType:(id)a3;
@end

@implementation SUScriptActivity

- (void)dealloc
{
  [(SUScriptFunction *)self->_actionFunction setThisObject:0];

  v3.receiver = self;
  v3.super_class = (Class)SUScriptActivity;
  [(SUScriptObject *)&v3 dealloc];
}

- (WebScriptObject)actionFunction
{
  [(SUScriptObject *)self lock];
  objc_super v3 = [(SUScriptFunction *)self->_actionFunction scriptObject];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSString)activityTitle
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__47;
  v8 = __Block_byref_object_dispose__47;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __33__SUScriptActivity_activityTitle__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeActivity"), "activityTitle");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)activityType
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__47;
  v8 = __Block_byref_object_dispose__47;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __32__SUScriptActivity_activityType__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeActivity"), "activityType");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return @"iTunesActivity";
}

- (void)setActionFunction:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    int v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  int v6 = 1;
  if (!a3 || (isKindOfClass & 1) != 0)
  {
LABEL_7:
    [(SUScriptObject *)self lock];
    [(SUScriptFunction *)self->_actionFunction setThisObject:0];

    if (v6)
    {
      self->_actionFunction = 0;
    }
    else
    {
      v8 = [[SUScriptFunction alloc] initWithScriptObject:v5];
      self->_actionFunction = v8;
      [(SUScriptFunction *)v8 setThisObject:self];
    }
    [(SUScriptObject *)self unlock];
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = 0;
    id v5 = a3;
    goto LABEL_7;
  }
  uint64_t v9 = (void *)MEMORY[0x263F1FA90];

  [v9 throwException:@"Invalid argument"];
}

- (void)setActivityTitle:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __37__SUScriptActivity_setActivityTitle___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _nativeActivity];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setActivityTitle:v3];
}

- (void)setActivityType:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __36__SUScriptActivity_setActivityType___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _nativeActivity];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setActivityType:v3];
}

- (void)setActivityImageWithName:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __45__SUScriptActivity_setActivityImageWithName___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _nativeActivity];
  if (*(void *)(a1 + 40)) {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", *(void *)(a1 + 40), objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()));
  }
  else {
    uint64_t v3 = 0;
  }

  return [v2 setActivityImage:v3];
}

- (void)setActivityImageWithURL:(id)a3 scale:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || a4 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x263F1FA90];
    [v9 throwException:@"Invalid argument"];
  }
  else
  {
    if (a3 && (a3 = (id)[objc_alloc(NSURL) initWithString:a3]) != 0)
    {
      if (a4)
      {
        [a4 floatValue];
        double v8 = v7;
      }
      else
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
      }
      id v10 = [(SUScriptObject *)self newImageWithURL:a3 scale:v8];
    }
    else
    {
      id v10 = 0;
    }
    WebThreadRunOnMainThread();
  }
}

uint64_t __50__SUScriptActivity_setActivityImageWithURL_scale___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _nativeActivity];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setActivityImage:v3];
}

- (NSString)activityImageNameGiftAppStore
{
  return (NSString *)@"ShareSheetGift";
}

- (NSString)activityImageNameGiftMusicStore
{
  return (NSString *)@"ShareSheetGift";
}

- (NSString)activityImageNamePingAppStore
{
  return 0;
}

- (NSString)activityImageNamePingMusicStore
{
  return 0;
}

- (NSString)activityImageNameWishlistAppStore
{
  return (NSString *)@"ShareSheetWishList";
}

- (NSString)activityImageNameWishlistMusicStore
{
  return (NSString *)@"ShareSheetWishList";
}

- (id)_nativeActivity
{
  uint64_t v3 = [(SUScriptNativeObject *)[(SUScriptObject *)self nativeObject] object];
  if (!v3)
  {
    uint64_t v3 = objc_alloc_init(SUActivity);
    [(SUScriptObject *)self setNativeObject:+[SUScriptNativeObject objectWithNativeObject:v3]];
    uint64_t v4 = v3;
  }
  return v3;
}

- (void)_performActionFunctionWithItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(SUScriptObject *)self lock];
  id v5 = self->_actionFunction;
  [(SUScriptObject *)self unlock];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (!v7) {
      goto LABEL_18;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(a3);
        }
        id ImageURL = *(id *)(*((void *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_13;
            }
            goto LABEL_11;
          }
          id ImageURL = SUScriptObjectGetImageURL(ImageURL);
        }
        id ImageURL = (id)[ImageURL absoluteString];
LABEL_11:
        if (ImageURL) {
          [v6 addObject:ImageURL];
        }
LABEL_13:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v12 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = v12;
      if (!v12)
      {
LABEL_18:
        v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v6, 0);
        [(SUScriptFunction *)v5 callWithArguments:v13];

        return;
      }
    }
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_65, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptActivity;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_49, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptActivity;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptActivity;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_65 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_49 = (uint64_t)sel_setActivityImageWithName_;
    unk_2681B5670 = @"setNamedActivityImage";
    qword_2681B5678 = (uint64_t)sel_setActivityImageWithURL_scale_;
    unk_2681B5680 = @"setActivityImage";
    __KeyMapping_65 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"actionFunction", @"activityTitle", @"activityTitle", @"activityType", @"activityType", @"IMAGE_NAME_GIFT_APP_STORE", @"activityImageNameGiftAppStore", @"IMAGE_NAME_GIFT_MUSIC_STORE", @"activityImageNameGiftMusicStore", @"IMAGE_NAME_PING_APP_STORE", @"activityImageNamePingAppStore", @"IMAGE_NAME_PING_MUSIC_STORE", @"activityImageNamePingMusicStore", @"IMAGE_NAME_WISHLIST_APP_STORE", @"activityImageNameWishlistAppStore", @"IMAGE_NAME_WISHLIST_MUSIC_STORE", @"activityImageNameWishlistMusicStore",
                        0);
  }
}

@end