@interface TILexiconDataHandler
- (BOOL)checkEntitlementForAddEntryStringWithAuditToken:(id *)a3;
- (BOOL)validateBundlePath:(id)a3;
- (NSString)bundleID;
- (void)addContact:(id)a3 toEntries:(id)a4 usingTokenizer:(id)a5;
- (void)addEntryString:(id)a3 forRecentInputIdentifier:(id)a4;
- (void)finishRequestWithEntries:(id)a3 completion:(id)a4;
- (void)requestLexiconForRecentInputIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestLexiconFromBundlePath:(id)a3 completionHandler:(id)a4;
- (void)requestRemovalOfLexiconForRecentInputIdentifier:(id)a3;
- (void)setBundleID:(id)a3;
@end

@implementation TILexiconDataHandler

- (BOOL)validateBundlePath:(id)a3
{
  v4 = +[NSBundle bundleWithPath:a3];
  uint64_t v5 = [v4 bundleIdentifier];
  if (v5
    && (v6 = (void *)v5,
        [v4 bundleIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isEqualToString:self->_bundleID],
        v7,
        v6,
        v8))
  {
    v9 = [v4 infoDictionary];
    v10 = [v9 objectForKey:@"CFBundlePackageType"];

    if ([v10 isEqualToString:@"XPC!"])
    {
      v11 = [v4 infoDictionary];
      v12 = [v11 objectForKey:@"NSExtension"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [v12 objectForKey:@"NSExtensionPointIdentifier"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          unsigned __int8 v14 = [v13 isEqualToString:@"com.apple.keyboard-service"];
        }
        else {
          unsigned __int8 v14 = 0;
        }
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (void)finishRequestWithEntries:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(id, void *))a4;
  if (v5)
  {
    v11 = v5;
    id v6 = [a3 mutableCopy];
    id v7 = [v6 count];
    if (v7)
    {
      unint64_t v8 = (unint64_t)v7;
      uint64_t v9 = 0;
      do
      {
        [v6 exchangeObjectAtIndex:v9 withObjectAtIndex:arc4random() % v8 + v9];
        ++v9;
        --v8;
      }
      while (v8);
    }
    v10 = +[TILexicon lexiconWithEntries:v6];
    v11[2](v11, v10);

    uint64_t v5 = v11;
  }
}

- (void)addContact:(id)a3 toEntries:(id)a4 usingTokenizer:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 flatten];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned __int8 v14 = [v8 allTokensForString:*(void *)(*((void *)&v17 + 1) + 8 * (void)v13)];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10000B6C8;
        v15[3] = &unk_10001CA40;
        id v16 = v7;
        [v14 enumerateObjectsUsingBlock:v15];

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)requestLexiconFromBundlePath:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if ([(TILexiconDataHandler *)self validateBundlePath:a3])
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_10000B874;
    v11[4] = sub_10000B884;
    id v12 = objc_alloc_init((Class)NSMutableArray);
    id v7 = +[TITransientLexiconManager sharedInstance];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000B88C;
    v8[3] = &unk_10001CA90;
    v8[4] = self;
    id v10 = v11;
    id v9 = v6;
    [v7 getOnce:v8];

    _Block_object_dispose(v11, 8);
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)requestLexiconForRecentInputIdentifier:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  uint64_t v5 = (void (**)(id, void *))a4;
  if (+[TIRecentInputs identifierIsSystemIdentifier:v8])
  {
    id v6 = +[TIKeyboardInputManager recentsFilePathForIdentifier:v8];
    id v7 = +[TIRecentInputs recentInputAtPath:v6];

    v5[2](v5, v7);
  }
  else
  {
    v5[2](v5, 0);
  }
}

- (void)requestRemovalOfLexiconForRecentInputIdentifier:(id)a3
{
  id v5 = a3;
  if (+[TIRecentInputs identifierIsSystemIdentifier:](TIRecentInputs, "identifierIsSystemIdentifier:"))
  {
    v3 = +[TIKeyboardInputManager recentsFilePathForIdentifier:v5];
    v4 = +[NSFileManager defaultManager];
    [v4 removeItemAtPath:v3 error:0];
  }
}

- (BOOL)checkEntitlementForAddEntryStringWithAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0, &cf);
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  *(void *)cf.val = 0;
  CFBooleanRef v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, @"com.apple.TextInput.lexicon-source", (CFErrorRef *)&cf);
  if (v6)
  {
    CFBooleanRef v7 = v6;
    CFTypeID v8 = CFGetTypeID(v6);
    BOOL v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
    CFRelease(v7);
  }
  else
  {
    if (*(void *)cf.val)
    {
      if (TICanLogMessageAtLevel())
      {
        id v10 = TIOSLogFacility();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1000111C4(&cf, v10);
        }
      }
      CFRelease(*(CFTypeRef *)cf.val);
    }
    BOOL v9 = 0;
  }
  CFRelease(v5);
  return v9;
}

- (void)addEntryString:(id)a3 forRecentInputIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[TIRecentInputs identifierIsSystemIdentifier:v7])
  {
    CFTypeID v8 = +[NSXPCConnection currentConnection];
    BOOL v9 = v8;
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(v12, 0, sizeof(v12));
    }
    unsigned int v10 = [(TILexiconDataHandler *)self checkEntitlementForAddEntryStringWithAuditToken:v12];

    if (v10)
    {
      id v11 = +[TIKeyboardInputManager recentsFilePathForIdentifier:v7];
      +[TIRecentInputs storeInput:v6 forSystemIdentifier:v7 atPath:v11];
    }
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end