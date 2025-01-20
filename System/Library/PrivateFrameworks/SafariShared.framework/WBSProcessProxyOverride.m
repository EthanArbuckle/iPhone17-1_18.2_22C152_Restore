@interface WBSProcessProxyOverride
+ (void)overrideSystemHTTPProxy:(id)a3 HTTPSProxy:(id)a4;
+ (void)overrideSystemProxiesIfNeeded:(id)a3;
@end

@implementation WBSProcessProxyOverride

+ (void)overrideSystemProxiesIfNeeded:(id)a3
{
  id v5 = a3;
  v3 = [v5 stringForKey:@"DebugHTTPProxy"];
  if (!v3)
  {
    v3 = [v5 stringForKey:@"WebKit2HTTPProxy"];
  }
  v4 = [v5 stringForKey:@"DebugHTTPSProxy"];
  if (!v4)
  {
    v4 = [v5 stringForKey:@"WebKit2HTTPSProxy"];
  }
  +[WBSProcessProxyOverride overrideSystemHTTPProxy:v3 HTTPSProxy:v4];
}

+ (void)overrideSystemHTTPProxy:(id)a3 HTTPSProxy:(id)a4
{
  unint64_t v13 = (unint64_t)a3;
  unint64_t v5 = (unint64_t)a4;
  if (v13 | v5)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v13)
    {
      v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithDataAsString:", v13);
      v8 = [v7 host];
      if (v8)
      {
        [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F190C0]];
        v9 = [v7 port];
        if (v9) {
          [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F190C8]];
        }
      }
      else
      {
        NSLog(&cfstr_MalformedHttpP.isa, v13);
      }
    }
    if (v5)
    {
      v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithDataAsString:", v5);
      v11 = [v10 host];
      if (v11)
      {
        [v6 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F190D8]];
        v12 = [v10 port];
        if (v12) {
          [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F190E0]];
        }
      }
      else
      {
        NSLog(&cfstr_MalformedHttps.isa, v5);
      }
    }
    if ([v6 count]) {
      _CFNetworkSetOverrideSystemProxySettings();
    }
  }
}

@end