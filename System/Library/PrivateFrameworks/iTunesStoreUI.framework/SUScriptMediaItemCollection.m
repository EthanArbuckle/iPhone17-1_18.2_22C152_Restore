@interface SUScriptMediaItemCollection
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (MPMediaItemCollection)nativeCollection;
- (NSArray)items;
- (NSArray)mediaTypes;
- (SUScriptMediaItem)representativeItem;
- (SUScriptMediaItemCollection)initWithItems:(id)a3;
- (id)_className;
- (id)scriptAttributeKeys;
- (int64_t)count;
- (void)_beginWatchingLibraryIfNecessary;
- (void)_libraryChangedNotification:(id)a3;
- (void)dealloc;
@end

@implementation SUScriptMediaItemCollection

- (SUScriptMediaItemCollection)initWithItems:(id)a3
{
  v4 = [(SUScriptObject *)self init];
  if (v4)
  {
    if (!a3
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (a3 = (id)[a3 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()]) != 0)
    {
      WebThreadRunOnMainThread();
    }
    else
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];

      a3 = 0;
      v4 = 0;
    }
  }
  return v4;
}

void __45__SUScriptMediaItemCollection_initWithItems___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) nativeItem];
        if (v8) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  uint64_t v9 = [objc_alloc(MEMORY[0x263F11E18]) initWithItems:v2];
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(*(id *)(a1 + 40), "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v9));
  }
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F11418] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaItemCollection;
  [(SUScriptObject *)&v4 dealloc];
}

- (MPMediaItemCollection)nativeCollection
{
  id v2 = [(SUScriptObject *)self nativeObject];

  return (MPMediaItemCollection *)[(SUScriptNativeObject *)v2 object];
}

- (id)_className
{
  return @"iTunesMediaItemCollection";
}

- (int64_t)count
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  int64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __36__SUScriptMediaItemCollection_count__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "count");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSArray)items
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__23;
  long long v12 = __Block_byref_object_dispose__23;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  int64_t v2 = (void *)v9[5];
  if (v2) {
    v3 = v2;
  }
  else {
    v3 = (NSArray *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __36__SUScriptMediaItemCollection_items__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __36__SUScriptMediaItemCollection_items__block_invoke(uint64_t result)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(result + 32) + 72);
  if (!*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x263EFF980]);
    int64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "nativeObject"), "object"), "items");
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
          uint64_t v8 = objc_alloc_init(SUScriptMediaItem);
          [(SUScriptObject *)v8 setNativeObject:+[SUScriptNativeObject objectWithNativeObject:v7]];
          [*(id *)(*(void *)(*(void *)(v1 + 40) + 8) + 40) addObject:v8];

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
    *(void *)(*(void *)(v1 + 32) + 72) = *(id *)(*(void *)(*(void *)(v1 + 40) + 8) + 40);
    [*(id *)(v1 + 32) checkInScriptObjects:*(void *)(*(void *)(*(void *)(v1 + 40) + 8) + 40)];
    return [*(id *)(v1 + 32) _beginWatchingLibraryIfNecessary];
  }
  return result;
}

- (NSArray)mediaTypes
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  WebThreadRunOnMainThread();
  return (NSArray *)v2;
}

uint64_t __41__SUScriptMediaItemCollection_mediaTypes__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "mediaTypes");
  if (result > 254)
  {
    if (result == 65280)
    {
      uint64_t v3 = @"any-video";
      goto LABEL_23;
    }
    if (result == 255)
    {
      uint64_t v3 = @"any-audio";
      goto LABEL_23;
    }
  }
  else
  {
    if (result == -1)
    {
      uint64_t v3 = @"any";
      goto LABEL_23;
    }
    if (result == 4)
    {
      uint64_t v3 = @"audiobook";
      goto LABEL_23;
    }
  }
  if (result)
  {
    uint64_t v3 = @"music";
  }
  else if ((result & 2) != 0)
  {
    uint64_t v3 = @"podcast";
  }
  else if ((result & 0x100) != 0)
  {
    uint64_t v3 = @"movie";
  }
  else if ((result & 0x200) != 0)
  {
    uint64_t v3 = @"tv-show";
  }
  else if ((result & 0x400) != 0)
  {
    uint64_t v3 = @"video-podcast";
  }
  else
  {
    if ((result & 0x800) == 0) {
      return result;
    }
    uint64_t v3 = @"music-video";
  }
LABEL_23:
  uint64_t v4 = *(void **)(a1 + 40);

  return [v4 addObject:v3];
}

- (SUScriptMediaItem)representativeItem
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__23;
  long long v12 = __Block_byref_object_dispose__23;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  id v2 = (void *)v9[5];
  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = (SUScriptMediaItem *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __49__SUScriptMediaItemCollection_representativeItem__block_invoke, &unk_264812E48, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __49__SUScriptMediaItemCollection_representativeItem__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2[10])
  {
    uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "nativeObject"), "object"), "representativeItem");
    if (v3)
    {
      uint64_t v4 = v3;
      *(void *)(*(void *)(a1 + 32) + 80) = objc_alloc_init(SUScriptMediaItem);
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v4));
      [*(id *)(a1 + 32) checkInScriptObject:*(void *)(*(void *)(a1 + 32) + 80)];
      [*(id *)(a1 + 32) _beginWatchingLibraryIfNecessary];
    }
  }
  id result = *(id *)(*(void *)(a1 + 32) + 80);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_libraryChangedNotification:(id)a3
{
  self->_items = 0;
  self->_representativeItem = 0;
}

- (void)_beginWatchingLibraryIfNecessary
{
  if (!self->_watchingLibrary)
  {
    uint64_t v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    self->_watchingLibrary = 1;
    uint64_t v4 = *MEMORY[0x263F11418];
    [v3 addObserver:self selector:sel__libraryChangedNotification_ name:v4 object:0];
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_36, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaItemCollection;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaItemCollection;
  id v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_36 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_36 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"count", @"items", @"items", @"mediaTypes", @"mediaTypes", @"representativeItem", @"representativeItem", 0);
  }
}

@end