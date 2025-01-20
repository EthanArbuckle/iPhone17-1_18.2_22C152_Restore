@interface SUScriptMediaPlaylist
+ (id)scriptPlaylistAttributesForNativePlaylistAttributes:(unint64_t)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (unint64_t)nativePlaylistAttributesForScriptPlaylistAttributes:(id)a3;
+ (void)initialize;
- (MPMediaPlaylist)nativePlaylist;
- (id)_className;
- (id)valueForProperty:(id)a3;
@end

@implementation SUScriptMediaPlaylist

+ (unint64_t)nativePlaylistAttributesForScriptPlaylistAttributes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(a3);
      }
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
      do
      {
        if ([(id)__MediaPlaylistAttributeMapping[v9 + 1] isEqual:v10]) {
          v6 |= __MediaPlaylistAttributeMapping[v9];
        }
        v9 += 2;
      }
      while (v9 != 8);
    }
    uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);
  return v6;
}

+ (id)scriptPlaylistAttributesForNativePlaylistAttributes:(unint64_t)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = __MediaPlaylistAttributeMapping[v5];
    if (v6 == a3) {
      break;
    }
    if ((v6 & a3) != 0) {
      [v4 addObject:__MediaPlaylistAttributeMapping[v5 + 1]];
    }
    v5 += 2;
    if (v5 == 8) {
      return v4;
    }
  }
  [v4 removeAllObjects];
  [v4 addObject:__MediaPlaylistAttributeMapping[v5 + 1]];
  return v4;
}

- (MPMediaPlaylist)nativePlaylist
{
  v2 = [(SUScriptObject *)self nativeObject];

  return (MPMediaPlaylist *)[(SUScriptNativeObject *)v2 object];
}

- (id)valueForProperty:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__25;
  v31 = __Block_byref_object_dispose__25;
  uint64_t v32 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    goto LABEL_16;
  }
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __42__SUScriptMediaPlaylist_valueForProperty___block_invoke;
  v23 = &unk_264813BA0;
  id v25 = a3;
  v26 = &v27;
  v24 = self;
  WebThreadRunOnMainThread();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(MEMORY[0x263F1FA90], "throwException:", objc_msgSend((id)v28[5], "reason"));

    id v5 = 0;
  }
  else if ([a3 isEqualToString:@"attributes"])
  {
    id v5 = (id)objc_msgSend((id)objc_opt_class(), "scriptPlaylistAttributesForNativePlaylistAttributes:", objc_msgSend((id)v28[5], "integerValue"));
  }
  else
  {
    if (![a3 isEqualToString:@"seed-items"]) {
      goto LABEL_16;
    }
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = (void *)v28[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v11 = objc_alloc_init(SUScriptMediaItem);
          [(SUScriptObject *)v11 setNativeObject:+[SUScriptNativeObject objectWithNativeObject:v10]];
          [(SUScriptObject *)self checkInScriptObject:v11];
          [v5 addObject:v11];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v33 count:16];
      }
      while (v7);
    }
  }
  v28[5] = (uint64_t)v5;
LABEL_16:
  long long v12 = (void *)v28[5];
  if (v12) {
    id v13 = v12;
  }
  else {
    id v13 = (id)[MEMORY[0x263EFF9D0] null];
  }
  long long v14 = v13;
  _Block_object_dispose(&v27, 8);
  return v14;
}

id __42__SUScriptMediaPlaylist_valueForProperty___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "valueForProperty:", *(void *)(a1 + 40));
  v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return v2;
}

- (id)_className
{
  return @"iTunesMediaPlaylist";
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_31, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaPlaylist;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_31 = (uint64_t)sel_valueForProperty_;
    *(void *)algn_2681B5048 = @"valueForProperty";
  }
}

@end