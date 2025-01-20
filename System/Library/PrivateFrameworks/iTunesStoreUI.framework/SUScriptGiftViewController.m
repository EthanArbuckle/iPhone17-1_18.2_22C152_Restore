@interface SUScriptGiftViewController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (id)_className;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (int64_t)giftCategoryApps;
- (int64_t)giftCategoryBooks;
- (int64_t)giftCategoryMedia;
- (void)setCreditGiftStyle:(int64_t)a3;
- (void)setProductGiftItem:(id)a3;
@end

@implementation SUScriptGiftViewController

- (id)newNativeViewController
{
  uint64_t v3 = ISUIMobileStoreUIFramework();
  id v4 = objc_alloc((Class)ISUIWeakLinkedClassForString(&cfstr_Suuigift.isa, v3));
  [(SUScriptObject *)self lock];
  if (self->_item) {
    uint64_t v5 = objc_msgSend(v4, "initWithItem:");
  }
  else {
    uint64_t v5 = [v4 initWithGiftCategory:self->_giftCategory];
  }
  v6 = (void *)v5;
  [(SUScriptObject *)self unlock];
  uint64_t v7 = ISUIMobileStoreUIFramework();
  v8 = objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(&cfstr_Suuigiftviewco.isa, v7)), "initWithGift:", v6);
  uint64_t v9 = ISUIMobileStoreUIFramework();
  objc_msgSend(v8, "setClientContext:", objc_msgSend(ISUIWeakLinkedClassForString(&cfstr_Suuiclientcont.isa, v9), "defaultContext"));

  return v8;
}

- (void)setCreditGiftStyle:(int64_t)a3
{
  [(SUScriptObject *)self lock];
  self->_giftCategory = a3;

  [(SUScriptObject *)self unlock];
}

- (void)setProductGiftItem:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0)
  {
    [(SUScriptObject *)self lock];

    self->_item = 0;
    [(SUScriptObject *)self unlock];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = (id)objc_msgSend(a3, "copyArrayOrDictionaryWithContext:", -[SUScriptObject copyJavaScriptContext](self, "copyJavaScriptContext"));
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = ISUIMobileStoreUIFramework();
        uint64_t v7 = (SUUIItem *)objc_msgSend(objc_alloc((Class)ISUIWeakLinkedClassForString(&cfstr_Suuiitem.isa, v6)), "initWithLookupDictionary:", v9);
        [(SUScriptObject *)self lock];

        self->_item = v7;
        [(SUScriptObject *)self unlock];
      }
    }
    else
    {
      v8 = (void *)MEMORY[0x263F1FA90];
      [v8 throwException:@"Invalid argument"];
    }
  }
}

- (id)_className
{
  return @"iTunesGiftViewController";
}

- (int64_t)giftCategoryApps
{
  return 0;
}

- (int64_t)giftCategoryBooks
{
  return 2;
}

- (int64_t)giftCategoryMedia
{
  return 1;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_80, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptGiftViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_60, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptGiftViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptGiftViewController;
  id v2 = [(SUScriptViewController *)&v4 scriptAttributeKeys];
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_80, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_60 = (uint64_t)sel_setCreditGiftStyle_;
    *(void *)algn_2681B5968 = @"setCreditGiftStyle";
    qword_2681B5970 = (uint64_t)sel_setProductGiftItem_;
    unk_2681B5978 = @"setProductGiftItem";
    __KeyMapping_80 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"GIFT_STYLE_APPS", @"giftCategoryApps", @"GIFT_STYLE_BOOKS", @"giftCategoryBooks", @"GIFT_STYLE_MEDIA", @"giftCategoryMedia", 0);
  }
}

@end