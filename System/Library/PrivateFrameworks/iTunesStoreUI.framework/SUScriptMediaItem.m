@interface SUScriptMediaItem
+ (id)copyScriptMediaTypesForNativeMediaTypes:(unint64_t)a3;
+ (id)scriptMediaTypeForNativeMediaType:(unint64_t)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (unint64_t)nativeMediaTypesForScriptMediaTypes:(id)a3;
+ (void)initialize;
- (MPMediaItem)nativeItem;
- (id)_className;
- (id)imageURLWithWidth:(id)a3 height:(id)a4;
- (id)valueForProperty:(id)a3;
@end

@implementation SUScriptMediaItem

+ (id)copyScriptMediaTypesForNativeMediaTypes:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = __SUMediaTypeMapping[v5];
    if (v6 == a3) {
      break;
    }
    if ((v6 & a3) != 0) {
      [v4 addObject:__SUMediaTypeMapping[v5 + 1]];
    }
    v5 += 2;
    if (v5 == 20) {
      return v4;
    }
  }
  [v4 removeAllObjects];
  [v4 addObject:__SUMediaTypeMapping[v5 + 1]];
  return v4;
}

+ (unint64_t)nativeMediaTypesForScriptMediaTypes:(id)a3
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
      while (![(id)__SUMediaTypeMapping[v9 + 1] isEqualToString:v10])
      {
        v9 += 2;
        if (v9 == 20) {
          goto LABEL_11;
        }
      }
      v6 |= __SUMediaTypeMapping[v9];
LABEL_11:
      ;
    }
    uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);
  return v6;
}

+ (id)scriptMediaTypeForNativeMediaType:(unint64_t)a3
{
  uint64_t v3 = 0;
  while (__SUMediaTypeMapping[v3] != a3)
  {
    v3 += 2;
    if (v3 == 20) {
      return 0;
    }
  }
  return (id)__SUMediaTypeMapping[v3 + 1];
}

- (MPMediaItem)nativeItem
{
  v2 = [(SUScriptObject *)self nativeObject];

  return (MPMediaItem *)[(SUScriptNativeObject *)v2 object];
}

- (id)imageURLWithWidth:(id)a3 height:(id)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__21;
  long long v12 = __Block_byref_object_dispose__21;
  uint64_t v13 = 0;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector()) {
    WebThreadRunOnMainThread();
  }
  else {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  uint64_t v4 = (void *)v9[5];
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)[MEMORY[0x263EFF9D0] null];
  }
  unint64_t v6 = v5;
  _Block_object_dispose(&v8, 8);
  return v6;
}

uint64_t __46__SUScriptMediaItem_imageURLWithWidth_height___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object");
  uint64_t result = [v2 valueForProperty:*MEMORY[0x263F11368]];
  if (result)
  {
    uint64_t v4 = (void *)result;
    id v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "webFrame"), "dataSource");
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [[NSString alloc] initWithFormat:@"itms-api:media-image/%@-%ld-%ld.png", objc_msgSend(v4, "stringValue"), objc_msgSend(*(id *)(a1 + 40), "integerValue"), objc_msgSend(*(id *)(a1 + 48), "integerValue")];
    uint64_t v9 = [objc_alloc(NSURL) initWithString:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    if (![v5 subresourceForURL:v9])
    {
      unint64_t v6 = (void *)[v2 valueForProperty:*MEMORY[0x263F11248]];
      if (v6
        && (uint64_t v7 = UIImagePNGRepresentation((UIImage *)objc_msgSend(v6, "imageWithSize:", (double)objc_msgSend(*(id *)(a1 + 40), "integerValue"), (double)objc_msgSend(*(id *)(a1 + 48), "integerValue")))) != 0)
      {
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F1FA88]) initWithData:v7 URL:v9 MIMEType:@"image/png" textEncodingName:0 frameName:0];
        [v5 addSubresource:v8];
      }
      else
      {

        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = 0;
      }
    }
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (id)valueForProperty:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__21;
  v11 = __Block_byref_object_dispose__21;
  uint64_t v12 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WebThreadRunOnMainThread();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v4 = v8;
    if (isKindOfClass)
    {
      objc_msgSend(MEMORY[0x263F1FA90], "throwException:", objc_msgSend((id)v8[5], "reason"));

      uint64_t v4 = v8;
      v8[5] = 0;
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    uint64_t v4 = v8;
  }
  id v5 = (id)v4[5];
  if (!v5) {
    id v5 = (id)[MEMORY[0x263EFF9D0] null];
  }
  _Block_object_dispose(&v7, 8);
  return v5;
}

id __38__SUScriptMediaItem_valueForProperty___block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "valueForProperty:", *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return @"iTunesMediaItem";
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_29, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaItem;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_29 = (uint64_t)sel_imageURLWithWidth_height_;
    unk_2681B4FD0 = @"imageURLForSize";
    qword_2681B4FD8 = (uint64_t)sel_valueForProperty_;
    unk_2681B4FE0 = @"valueForProperty";
  }
}

@end