@interface RBSMacAppProcessIdentity
- (id)_initMacAppWithInfo:(id)a3 auid:(unsigned int)a4 uuid:(id)a5;
- (id)_initMacAppWithLabel:(id)a3 bundleID:(id)a4 personaString:(id)a5 auid:(unsigned int)a6 platform:(int)a7;
@end

@implementation RBSMacAppProcessIdentity

- (id)_initMacAppWithLabel:(id)a3 bundleID:(id)a4 personaString:(id)a5 auid:(unsigned int)a6 platform:(int)a7
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __assert_rtn("-[RBSMacAppProcessIdentity _initMacAppWithLabel:bundleID:personaString:auid:platform:]", "RBSProcessIdentity+App.m", 484, "false");
}

- (id)_initMacAppWithInfo:(id)a3 auid:(unsigned int)a4 uuid:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  __assert_rtn("-[RBSMacAppProcessIdentity _initMacAppWithInfo:auid:uuid:]", "RBSProcessIdentity+App.m", 489, "false");
}

@end