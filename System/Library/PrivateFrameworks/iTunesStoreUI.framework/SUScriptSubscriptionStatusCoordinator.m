@interface SUScriptSubscriptionStatusCoordinator
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (id)_className;
- (id)scriptAttributeKeys;
- (void)invalidateLastKnownStatus;
@end

@implementation SUScriptSubscriptionStatusCoordinator

- (id)_className
{
  return @"iTunesSubscriptionStatusCoordinator";
}

- (void)invalidateLastKnownStatus
{
  uint64_t v2 = [(objc_class *)getICUserIdentityClass() autoupdatingActiveAccount];
  v3 = (void *)[(objc_class *)getICMusicSubscriptionStatusMonitorClass() sharedMonitorForIdentity:v2];

  [v3 refreshSubscriptionStatus];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_1, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSubscriptionStatusCoordinator;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSubscriptionStatusCoordinator;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptSubscriptionStatusCoordinator;
  uint64_t v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_1 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping = (uint64_t)sel_invalidateLastKnownStatus;
    unk_2681B3C60 = @"invalidateLastKnownStatus";
    __KeyMapping_1 = (uint64_t)MEMORY[0x263EFFA78];
  }
}

@end