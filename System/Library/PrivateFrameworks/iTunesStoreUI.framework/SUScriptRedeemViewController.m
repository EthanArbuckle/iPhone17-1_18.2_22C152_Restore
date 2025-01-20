@interface SUScriptRedeemViewController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)initialCode;
- (id)_className;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (int64_t)redeemCategoryApps;
- (int64_t)redeemCategoryBooks;
- (int64_t)redeemCategoryMedia;
- (void)setInitialCode:(id)a3;
- (void)setRedeemStyle:(int64_t)a3;
@end

@implementation SUScriptRedeemViewController

- (id)newNativeViewController
{
  uint64_t v3 = ISUIMobileStoreUIFramework();
  v4 = (objc_class *)ISUIWeakLinkedClassForString(&cfstr_Suuiredeemview.isa, v3);
  [(SUScriptObject *)self lock];
  v5 = (void *)[[v4 alloc] initWithRedeemCategory:self->_category];
  [v5 setInitialCode:self->_initialCode];
  [(SUScriptObject *)self unlock];
  uint64_t v6 = ISUIMobileStoreUIFramework();
  objc_msgSend(v5, "setClientContext:", objc_msgSend(ISUIWeakLinkedClassForString(&cfstr_Suuiclientcont.isa, v6), "defaultContext"));
  return v5;
}

- (void)setRedeemStyle:(int64_t)a3
{
  [(SUScriptObject *)self lock];
  self->_category = a3;

  [(SUScriptObject *)self unlock];
}

- (id)_className
{
  return @"iTunesRedeemViewController";
}

- (void)setInitialCode:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUScriptObject *)self lock];
    self->_initialCode = (NSString *)[a3 copy];
    [(SUScriptObject *)self unlock];
  }
  else
  {
    v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

- (NSString)initialCode
{
  return self->_initialCode;
}

- (int64_t)redeemCategoryApps
{
  return 0;
}

- (int64_t)redeemCategoryBooks
{
  return 2;
}

- (int64_t)redeemCategoryMedia
{
  return 1;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_82, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptRedeemViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_62, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptRedeemViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptRedeemViewController;
  id v2 = [(SUScriptViewController *)&v4 scriptAttributeKeys];
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_82, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_62 = (uint64_t)sel_setRedeemStyle_;
    *(void *)algn_2681B59B8 = @"setRedeemStyle";
    __KeyMapping_82 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"initialCode", @"REDEEM_STYLE_APPS", @"redeemCategoryApps", @"REDEEM_STYLE_BOOKS", @"redeemCategoryBooks", @"REDEEM_STYLE_MEDIA", @"redeemCategoryMedia", 0);
  }
}

@end