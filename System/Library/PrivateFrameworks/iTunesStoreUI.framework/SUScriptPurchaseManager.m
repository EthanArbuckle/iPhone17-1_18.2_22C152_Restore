@interface SUScriptPurchaseManager
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (SUScriptPurchaseManager)init;
- (id)_className;
- (id)isPurchasedItemIdentifier:(id)a3;
- (id)isPurchasingItemIdentifier:(id)a3;
- (void)_purchaseRequestsChangedNotification:(id)a3;
- (void)dealloc;
@end

@implementation SUScriptPurchaseManager

- (SUScriptPurchaseManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptPurchaseManager;
  v2 = [(SUScriptObject *)&v4 init];
  if (v2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__purchaseRequestsChangedNotification_, @"SSPurchaseRequestsChangedNotification", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"SSPurchaseRequestsChangedNotification", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptPurchaseManager;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)isPurchasedItemIdentifier:(id)a3
{
  uint64_t v4 = SSGetUnsignedLongLongFromValue();
  if (v4)
  {
    BOOL v5 = [(SUPurchaseManager *)[(SUClientInterface *)[(SUScriptObject *)self clientInterface] purchaseManager] itemIdentifierIsPurchased:v4];
    v6 = (id *)MEMORY[0x263EFFB40];
    if (!v5) {
      v6 = (id *)MEMORY[0x263EFFB38];
    }
  }
  else
  {
    v6 = (id *)MEMORY[0x263EFFB38];
  }
  return *v6;
}

- (id)isPurchasingItemIdentifier:(id)a3
{
  uint64_t v4 = SSGetUnsignedLongLongFromValue();
  if (v4)
  {
    BOOL v5 = [(SUPurchaseManager *)[(SUClientInterface *)[(SUScriptObject *)self clientInterface] purchaseManager] itemIdentifierIsPurchasing:v4];
    v6 = (id *)MEMORY[0x263EFFB40];
    if (!v5) {
      v6 = (id *)MEMORY[0x263EFFB38];
    }
  }
  else
  {
    v6 = (id *)MEMORY[0x263EFFB38];
  }
  return *v6;
}

- (id)_className
{
  return @"iTunesPurchaseManager";
}

- (void)_purchaseRequestsChangedNotification:(id)a3
{
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_44, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptPurchaseManager;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_44 = (uint64_t)sel_isPurchasedItemIdentifier_;
    *(void *)algn_2681B5558 = @"isPurchasedItemIdentifier";
    qword_2681B5560 = (uint64_t)sel_isPurchasingItemIdentifier_;
    unk_2681B5568 = @"isPurchasingItemIdentifier";
  }
}

@end