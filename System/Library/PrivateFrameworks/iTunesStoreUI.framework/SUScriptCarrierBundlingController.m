@interface SUScriptCarrierBundlingController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)provisioningStyleAlways;
- (NSString)provisioningStyleNever;
- (NSString)provisioningStyleOnce;
- (NSString)statusEligible;
- (NSString)statusNeedsManualVerification;
- (NSString)statusNotEligible;
- (NSString)statusUnknown;
- (NSString)statusUnlinked;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)updateLastKnownStatus:(id)a3;
@end

@implementation SUScriptCarrierBundlingController

- (id)_className
{
  return @"iTunesCarrierBundling";
}

- (NSString)provisioningStyleAlways
{
  return (NSString *)@"always";
}

- (NSString)provisioningStyleNever
{
  return (NSString *)@"never";
}

- (NSString)provisioningStyleOnce
{
  return (NSString *)@"once";
}

- (NSString)statusEligible
{
  return (NSString *)@"eligible";
}

- (NSString)statusNeedsManualVerification
{
  return (NSString *)@"needsManualVerification";
}

- (NSString)statusNotEligible
{
  return (NSString *)@"notEligible";
}

- (NSString)statusUnknown
{
  return (NSString *)@"unknown";
}

- (NSString)statusUnlinked
{
  return (NSString *)@"unlinked";
}

- (void)updateLastKnownStatus:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_23, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptCarrierBundlingController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_18, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptCarrierBundlingController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptCarrierBundlingController;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_23 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_18 = (uint64_t)sel_updateLastKnownStatus_;
    *(void *)algn_2681B4BC8 = @"updateLastKnownStatus";
    __KeyMapping_23 = &unk_26DBD7C10;
  }
}

@end