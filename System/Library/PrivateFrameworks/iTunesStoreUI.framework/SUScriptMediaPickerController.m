@interface SUScriptMediaPickerController
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (BOOL)allowsPickingMultipleItems;
- (NSArray)mediaTypes;
- (NSString)prompt;
- (SUScriptMediaPickerController)initWithMediaTypes:(id)a3;
- (id)_className;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (void)setAllowsPickingMultipleItems:(BOOL)a3;
- (void)setNativeViewController:(id)a3;
- (void)setPrompt:(id)a3;
@end

@implementation SUScriptMediaPickerController

- (SUScriptMediaPickerController)initWithMediaTypes:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  v5 = [(SUScriptObject *)self init];
  if (v5)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3052000000;
    v13 = __Block_byref_object_copy__26;
    v14 = __Block_byref_object_dispose__26;
    uint64_t v15 = 0;
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (uint64_t v6 = [a3 copyArrayValueWithValidator:__SUMediaTypeValidator context:0],
            (v11[5] = v6) == 0))
      {
        [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];

        v5 = 0;
LABEL_11:

        _Block_object_dispose(&v10, 8);
        return v5;
      }
    }
    else
    {
      id v7 = +[SUScriptMediaItem scriptMediaTypeForNativeMediaType:-1];
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v7, 0);
      v11[5] = v8;
    }
    WebThreadRunOnMainThread();
    goto LABEL_11;
  }
  return v5;
}

void __52__SUScriptMediaPickerController_initWithMediaTypes___block_invoke(uint64_t a1)
{
  unint64_t v2 = +[SUScriptMediaItem nativeMediaTypesForScriptMediaTypes:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  id v3 = (id)[objc_alloc(MEMORY[0x263F11E48]) initWithMediaTypes:v2];
  [*(id *)(a1 + 32) setNativeViewController:v3];
}

- (id)newNativeViewController
{
  id v2 = objc_alloc(MEMORY[0x263F11E48]);

  return (id)[v2 initWithMediaTypes:-1];
}

- (void)setNativeViewController:(id)a3
{
  if (a3)
  {
    v4 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptMediaPickerNativeObject, "objectWithNativeObject:");
    [(SUScriptObject *)self setNativeObject:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUScriptMediaPickerController;
    -[SUScriptViewController setNativeViewController:](&v5, sel_setNativeViewController_);
  }
}

- (BOOL)allowsPickingMultipleItems
{
  uint64_t v4 = 0;
  objc_super v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __59__SUScriptMediaPickerController_allowsPickingMultipleItems__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "allowsPickingMultipleItems");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_className
{
  return @"iTunesMediaPickerController";
}

- (NSArray)mediaTypes
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__26;
  uint64_t v12 = __Block_byref_object_dispose__26;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  char v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (NSArray *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __43__SUScriptMediaPickerController_mediaTypes__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __43__SUScriptMediaPickerController_mediaTypes__block_invoke(uint64_t a1)
{
  id result = +[SUScriptMediaItem copyScriptMediaTypesForNativeMediaTypes:](SUScriptMediaItem, "copyScriptMediaTypesForNativeMediaTypes:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "mediaTypes"));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)prompt
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__26;
  uint64_t v12 = __Block_byref_object_dispose__26;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  char v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __39__SUScriptMediaPickerController_prompt__block_invoke, &unk_264812E70, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __39__SUScriptMediaPickerController_prompt__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "prompt");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
}

uint64_t __63__SUScriptMediaPickerController_setAllowsPickingMultipleItems___block_invoke(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);

  return [v2 setAllowsPickingMultipleItems:v3];
}

- (void)setPrompt:(id)a3
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
    objc_super v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __43__SUScriptMediaPickerController_setPrompt___block_invoke(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setPrompt:v3];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_38, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaPickerController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaPickerController;
  id v2 = [(SUScriptViewController *)&v4 scriptAttributeKeys];
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_38, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_38 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"allowsPickingMultipleItems", @"mediaTypes", @"mediaTypes", @"prompt", @"prompt", 0);
  }
}

@end