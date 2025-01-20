@interface SUScriptMediaPropertyPredicate
+ (id)webScriptNameForKeyName:(id)a3;
+ (void)initialize;
- (MPMediaPropertyPredicate)nativePredicate;
- (NSString)comparisonType;
- (NSString)property;
- (SUScriptMediaPropertyPredicate)initWithProperty:(id)a3 value:(id)a4 comparisonType:(id)a5;
- (id)_className;
- (id)_playlistAttributesForScriptArray:(id)a3;
- (id)scriptAttributeKeys;
- (id)value;
- (void)dealloc;
@end

@implementation SUScriptMediaPropertyPredicate

- (SUScriptMediaPropertyPredicate)initWithProperty:(id)a3 value:(id)a4 comparisonType:(id)a5
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a5 = 0;
  }
  v7 = [(SUScriptObject *)self init];
  if (v7)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0) {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    }
    if (a5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([a5 isEqualToString:@"equals"]) {
          goto LABEL_10;
        }
        if ([a5 isEqualToString:@"contains"])
        {
          if (isKindOfClass) {
            goto LABEL_11;
          }
          goto LABEL_18;
        }
        v9 = @"Unknown comparison type";
      }
      else
      {
        v9 = @"Invalid argument";
      }
      [MEMORY[0x263F1FA90] throwException:v9];
      goto LABEL_18;
    }
LABEL_10:
    if (isKindOfClass)
    {
LABEL_11:
      WebThreadRunOnMainThread();
      return v7;
    }
LABEL_18:

    return 0;
  }
  return v7;
}

uint64_t __72__SUScriptMediaPropertyPredicate_initWithProperty_value_comparisonType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if ([*(id *)(a1 + 40) isEqualToString:*MEMORY[0x263F11480]]) {
    uint64_t v2 = [*(id *)(a1 + 48) _playlistAttributesForScriptArray:*(void *)(a1 + 32)];
  }
  uint64_t result = [MEMORY[0x263F11E60] predicateWithValue:v2 forProperty:*(void *)(a1 + 56) comparisonType:*(void *)(a1 + 64)];
  if (result)
  {
    v4 = *(void **)(a1 + 48);
    v5 = +[SUScriptNativeObject objectWithNativeObject:result];
    return [v4 setNativeObject:v5];
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaPropertyPredicate;
  [(SUScriptObject *)&v3 dealloc];
}

- (MPMediaPropertyPredicate)nativePredicate
{
  uint64_t v2 = [(SUScriptObject *)self nativeObject];

  return (MPMediaPropertyPredicate *)[(SUScriptNativeObject *)v2 object];
}

- (id)_className
{
  return @"iTunesMediaPropertyPredicate";
}

- (NSString)comparisonType
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__24;
  v12 = __Block_byref_object_dispose__24;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  uint64_t v2 = (void *)v9[5];
  if (v2) {
    objc_super v3 = v2;
  }
  else {
    objc_super v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __48__SUScriptMediaPropertyPredicate_comparisonType__block_invoke, &unk_264812E48, self, &v8);
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __48__SUScriptMediaPropertyPredicate_comparisonType__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "comparisonType");
  if (result == 1)
  {
    objc_super v3 = @"contains";
  }
  else
  {
    if (result) {
      return result;
    }
    objc_super v3 = @"equals";
  }
  uint64_t result = [[NSString alloc] initWithString:v3];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)property
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__24;
  v12 = __Block_byref_object_dispose__24;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  uint64_t v2 = (void *)v9[5];
  if (v2) {
    objc_super v3 = v2;
  }
  else {
    objc_super v3 = (NSString *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __42__SUScriptMediaPropertyPredicate_property__block_invoke, &unk_264812E48, self, &v8);
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __42__SUScriptMediaPropertyPredicate_property__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "property");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)value
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__24;
  v12 = __Block_byref_object_dispose__24;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  uint64_t v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __39__SUScriptMediaPropertyPredicate_value__block_invoke, &unk_264812E48, self, &v8);
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __39__SUScriptMediaPropertyPredicate_value__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeObject"), "object"), "value");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_playlistAttributesForScriptArray:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = [a3 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
  if (!v4) {
    return 0;
  }
  v5 = (void *)v4;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", +[SUScriptMediaPlaylist nativePlaylistAttributesForScriptPlaylistAttributes:](SUScriptMediaPlaylist, "nativePlaylistAttributesForScriptPlaylistAttributes:", v4));

  return v6;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_37, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaPropertyPredicate;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaPropertyPredicate;
  uint64_t v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_37 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    __KeyMapping_37 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"comparisonType", @"property", @"property", @"value", @"value", 0);
  }
}

@end