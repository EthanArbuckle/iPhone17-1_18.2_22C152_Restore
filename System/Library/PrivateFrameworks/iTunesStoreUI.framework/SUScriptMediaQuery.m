@interface SUScriptMediaQuery
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (MPMediaQuery)nativeQuery;
- (NSArray)collections;
- (NSArray)items;
- (NSString)comparisonTypeContains;
- (NSString)comparisonTypeEquals;
- (NSString)groupingType;
- (NSString)groupingTypeAlbum;
- (NSString)groupingTypeAlbumArtist;
- (NSString)groupingTypeArtist;
- (NSString)groupingTypeComposer;
- (NSString)groupingTypeGenre;
- (NSString)groupingTypePlaylist;
- (NSString)groupingTypePodcastTitle;
- (NSString)groupingTypeTitle;
- (id)_className;
- (id)canFilterByProperty:(id)a3;
- (id)filterPredicates;
- (id)makeFilterPredicateWithProperty:(id)a3 value:(id)a4 comparisonType:(id)a5;
- (id)scriptAttributeKeys;
- (void)_beginWatchingLibraryIfNecessary;
- (void)_resetCaches;
- (void)addFilterPredicate:(id)a3;
- (void)dealloc;
- (void)removeFilterPredicate:(id)a3;
- (void)setFilterPredicates:(id)a3;
- (void)setGroupingType:(id)a3;
@end

@implementation SUScriptMediaQuery

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F11418] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaQuery;
  [(SUScriptObject *)&v4 dealloc];
}

- (MPMediaQuery)nativeQuery
{
  v2 = [(SUScriptObject *)self nativeObject];

  return (MPMediaQuery *)[(SUScriptNativeObject *)v2 object];
}

- (void)addFilterPredicate:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __41__SUScriptMediaQuery_addFilterPredicate___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) nativePredicate];
  if (result)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "nativeObject"), "object"), "addFilterPredicate:", result);
    v3 = *(void **)(a1 + 40);
    return [v3 _resetCaches];
  }
  return result;
}

- (id)canFilterByProperty:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    WebThreadRunOnMainThread();
  }
  else {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  if (*((unsigned char *)v7 + 24)) {
    v3 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    v3 = (void **)MEMORY[0x263EFFB38];
  }
  objc_super v4 = *v3;
  _Block_object_dispose(&v6, 8);
  return v4;
}

uint64_t __42__SUScriptMediaQuery_canFilterByProperty___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x263F11E08] canFilterByProperty:*(void *)(a1 + 32)]) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = [MEMORY[0x263F11E50] canFilterByProperty:*(void *)(a1 + 32)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)makeFilterPredicateWithProperty:(id)a3 value:(id)a4 comparisonType:(id)a5
{
  v5 = [[SUScriptMediaPropertyPredicate alloc] initWithProperty:a3 value:a4 comparisonType:a5];

  return v5;
}

- (void)removeFilterPredicate:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __44__SUScriptMediaQuery_removeFilterPredicate___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) nativePredicate];
  if (result)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "nativeObject"), "object"), "removeFilterPredicate:", result);
    v3 = *(void **)(a1 + 40);
    return [v3 _resetCaches];
  }
  return result;
}

- (id)_className
{
  return @"iTunesMediaQuery";
}

- (NSArray)collections
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__22;
  v12 = __Block_byref_object_dispose__22;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2) {
    v3 = v2;
  }
  else {
    v3 = (NSArray *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __33__SUScriptMediaQuery_collections__block_invoke, &unk_264812E70, self, &v8);
  }
  objc_super v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __33__SUScriptMediaQuery_collections__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id result = *(id *)(*(void *)(a1 + 32) + 72);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x263EFF980]);
    v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "collections");
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id obj = v3;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            char v9 = off_264811590;
          }
          else {
            char v9 = off_264811550;
          }
          id v10 = objc_alloc_init(*v9);
          objc_msgSend(v10, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", v8));
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
    *(void *)(*(void *)(a1 + 32) + 72) = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [*(id *)(a1 + 32) checkInScriptObjects:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    return (id)[*(id *)(a1 + 32) _beginWatchingLibraryIfNecessary];
  }
  return result;
}

- (id)filterPredicates
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__22;
  long long v12 = __Block_byref_object_dispose__22;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __38__SUScriptMediaQuery_filterPredicates__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __38__SUScriptMediaQuery_filterPredicates__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id result = *(id *)(*(void *)(a1 + 32) + 80);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x263EFF980]);
    id v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "filterPredicates");
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          char v9 = objc_alloc_init(SUScriptMediaPropertyPredicate);
          [(SUScriptObject *)v9 setNativeObject:+[SUScriptNativeObject objectWithNativeObject:v8]];
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
    *(void *)(*(void *)(a1 + 32) + 80) = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return (id)[*(id *)(a1 + 32) checkInScriptObjects:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  return result;
}

- (NSString)groupingType
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__22;
  long long v12 = __Block_byref_object_dispose__22;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __34__SUScriptMediaQuery_groupingType__block_invoke, &unk_264812E48, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

unint64_t __34__SUScriptMediaQuery_groupingType__block_invoke(uint64_t a1)
{
  unint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "groupingType");
  if (result <= 7)
  {
    unint64_t result = [[NSString alloc] initWithString:off_264813BC0[result]];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSArray)items
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__22;
  long long v12 = __Block_byref_object_dispose__22;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (NSArray *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __27__SUScriptMediaQuery_items__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __27__SUScriptMediaQuery_items__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id result = *(id *)(*(void *)(a1 + 32) + 88);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_alloc_init(MEMORY[0x263EFF980]);
    id v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "items");
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          char v9 = objc_alloc_init(SUScriptMediaItem);
          [(SUScriptObject *)v9 setNativeObject:+[SUScriptNativeObject objectWithNativeObject:v8]];
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
    *(void *)(*(void *)(a1 + 32) + 88) = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [*(id *)(a1 + 32) checkInScriptObjects:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    return (id)[*(id *)(a1 + 32) _beginWatchingLibraryIfNecessary];
  }
  return result;
}

- (void)setFilterPredicates:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      id v3 = 0;
      goto LABEL_7;
    }
    id v3 = (id)[v3 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
    if (!v3)
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      goto LABEL_7;
    }
  }
  WebThreadRunOnMainThread();
LABEL_7:
}

void __42__SUScriptMediaQuery_setFilterPredicates___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * i) nativePredicate];
        if (v8) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [*(id *)(a1 + 40) _resetCaches];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "nativeObject"), "object"), "setFilterPredicates:", v2);
}

- (void)setGroupingType:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    id v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __38__SUScriptMediaQuery_setGroupingType___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  if ([*(id *)(a1 + 40) isEqualToString:@"album"])
  {
    uint64_t v3 = 1;
  }
  else if ([*(id *)(a1 + 40) isEqualToString:@"album-artist"])
  {
    uint64_t v3 = 3;
  }
  else if ([*(id *)(a1 + 40) isEqualToString:@"artist"])
  {
    uint64_t v3 = 2;
  }
  else if ([*(id *)(a1 + 40) isEqualToString:@"composer"])
  {
    uint64_t v3 = 4;
  }
  else if ([*(id *)(a1 + 40) isEqualToString:@"genre"])
  {
    uint64_t v3 = 5;
  }
  else if ([*(id *)(a1 + 40) isEqualToString:@"playlist"])
  {
    uint64_t v3 = 6;
  }
  else if ([*(id *)(a1 + 40) isEqualToString:@"podcast-title"])
  {
    uint64_t v3 = 7;
  }
  else
  {
    if (![*(id *)(a1 + 40) isEqualToString:@"title"]) {
      goto LABEL_18;
    }
    uint64_t v3 = 0;
  }
  [v2 setGroupingType:v3];
LABEL_18:
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _resetCaches];
}

- (NSString)comparisonTypeContains
{
  return (NSString *)@"contains";
}

- (NSString)comparisonTypeEquals
{
  return (NSString *)@"equals";
}

- (NSString)groupingTypeAlbum
{
  return (NSString *)@"album";
}

- (NSString)groupingTypeAlbumArtist
{
  return (NSString *)@"album-artist";
}

- (NSString)groupingTypeArtist
{
  return (NSString *)@"artist";
}

- (NSString)groupingTypeComposer
{
  return (NSString *)@"composer";
}

- (NSString)groupingTypeGenre
{
  return (NSString *)@"genre";
}

- (NSString)groupingTypePlaylist
{
  return (NSString *)@"playlist";
}

- (NSString)groupingTypePodcastTitle
{
  return (NSString *)@"podcast-title";
}

- (NSString)groupingTypeTitle
{
  return (NSString *)@"title";
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

- (void)_resetCaches
{
  self->_collections = 0;
  self->_filterPredicates = 0;

  self->_items = 0;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_35, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaQuery;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_30, 4);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaQuery;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaQuery;
  id v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_35 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_30 = (uint64_t)sel_addFilterPredicate_;
    *(void *)algn_2681B4FF8 = @"addFilterPredicate";
    qword_2681B5000 = (uint64_t)sel_canFilterByProperty_;
    unk_2681B5008 = @"canFilterByProperty";
    qword_2681B5010 = (uint64_t)sel_makeFilterPredicateWithProperty_value_comparisonType_;
    unk_2681B5018 = @"createFilterPredicate";
    qword_2681B5020 = (uint64_t)sel_removeFilterPredicate_;
    unk_2681B5028 = @"removeFilterPredicate";
    __KeyMapping_35 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"collections", @"filterPredicates", @"filterPredicates", @"groupingType", @"groupingType", @"items", @"items", 0);
  }
}

@end