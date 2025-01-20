@interface SUScriptPassbookLibrary
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSArray)passes;
- (SUScriptPassbookLibrary)initWithPassLibrary:(id)a3;
- (id)_className;
- (id)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (id)scriptAttributeKeys;
- (void)dealloc;
@end

@implementation SUScriptPassbookLibrary

- (SUScriptPassbookLibrary)initWithPassLibrary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptPassbookLibrary;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    v4->_passLibrary = (PKPassLibrary *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptPassbookLibrary;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)passWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a4 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "defaultStore"), "accountWithUniqueIdentifier:", a4), "ITunesPassSerialNumber");
  }
  v7 = [(PKPassLibrary *)self->_passLibrary passWithPassTypeIdentifier:a3 serialNumber:a4];
  if (v7)
  {
    v7 = [[SUScriptPassbookPass alloc] initWithPass:v7];
    [(SUScriptObject *)self checkInScriptObject:v7];
  }

  return v7;
}

- (id)_className
{
  return @"iTunesPassbookLibrary";
}

- (NSArray)passes
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (NSArray *)[MEMORY[0x263EFF980] array];
  v4 = [(PKPassLibrary *)self->_passLibrary passes];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [[SUScriptPassbookPass alloc] initWithPass:*(void *)(*((void *)&v11 + 1) + 8 * v8)];
        [(NSArray *)v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(SUScriptObject *)self checkInScriptObjects:v3];
  return v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_43, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPassbookLibrary;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_34, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPassbookLibrary;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptPassbookLibrary;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_43 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_34 = (uint64_t)sel_passWithPassTypeIdentifier_serialNumber_;
    *(void *)algn_2681B5168 = @"getPass";
    __KeyMapping_43 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"passes", 0);
  }
}

@end