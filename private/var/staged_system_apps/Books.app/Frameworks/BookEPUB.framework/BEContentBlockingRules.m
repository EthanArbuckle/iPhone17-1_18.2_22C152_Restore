@interface BEContentBlockingRules
+ (BEContentBlockingRules)sharedInstance;
- (BEContentBlockingRules)init;
- (NSMutableDictionary)cachedRules;
- (void)applyContentBlockingRule:(unint64_t)a3 toWebView:(id)a4 completion:(id)a5;
- (void)setCachedRules:(id)a3;
@end

@implementation BEContentBlockingRules

+ (BEContentBlockingRules)sharedInstance
{
  if (qword_409A98 != -1) {
    dispatch_once(&qword_409A98, &stru_3C0030);
  }
  v2 = (void *)qword_409A90;

  return (BEContentBlockingRules *)v2;
}

- (BEContentBlockingRules)init
{
  v6.receiver = self;
  v6.super_class = (Class)BEContentBlockingRules;
  v2 = [(BEContentBlockingRules *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedRules = v2->_cachedRules;
    v2->_cachedRules = v3;
  }
  return v2;
}

- (void)applyContentBlockingRule:(unint64_t)a3 toWebView:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (objc_msgSend(v8, "be_appliedContentBlockingRule") == (id)a3)
  {
    id v10 = objc_retainBlock(v9);
    v11 = v10;
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
  else
  {
    v12 = +[NSFileManager defaultManager];
    v13 = [v12 URLsForDirectory:13 inDomains:1];

    id v14 = objc_alloc_init((Class)NSMutableArray);
    [v14 addObject:@"BEContentRuleLists"];
    v15 = +[UIDevice currentDevice];
    v16 = [v15 systemVersion];
    [v14 addObject:v16];

    if (BEIsInternalInstall())
    {
      v17 = +[UIDevice currentDevice];
      v18 = [v17 buildVersion];
      [v14 addObject:v18];
    }
    v19 = [v14 componentsJoinedByString:@"_"];

    v20 = [v13 lastObject];
    v21 = [v20 URLByAppendingPathComponent:v19];

    v22 = +[WKContentRuleListStore storeWithURL:v21];

    if (a3 >= 3)
    {
      v24 = _BookEPUBLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = +[NSNumber numberWithUnsignedInteger:a3];
        *(_DWORD *)buf = 138412290;
        v43 = v25;
        _os_log_impl(&def_7BFC0, v24, OS_LOG_TYPE_ERROR, "Unsupported content blocking rule '%@'", buf, 0xCu);
      }
      CFStringRef v23 = @"RemoteContentBlocked";
    }
    else
    {
      CFStringRef v23 = off_3C00A0[a3];
    }
    v26 = [v8 configuration];
    v27 = [v26 userContentController];

    objc_initWeak((id *)buf, self);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_655C;
    v36[3] = &unk_3C0058;
    id v28 = v27;
    id v37 = v28;
    id v38 = v8;
    v41[1] = (id)a3;
    objc_copyWeak(v41, (id *)buf);
    v39 = (__CFString *)v23;
    id v40 = v9;
    v29 = objc_retainBlock(v36);
    v30 = [(NSMutableDictionary *)self->_cachedRules objectForKeyedSubscript:v23];
    if (v30)
    {
      ((void (*)(void *, void *, void))v29[2])(v29, v30, 0);
    }
    else
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_66AC;
      v31[3] = &unk_3C0080;
      v34 = v29;
      unint64_t v35 = a3;
      id v32 = v22;
      v33 = (__CFString *)v23;
      [v32 lookUpContentRuleListForIdentifier:v23 completionHandler:v31];
    }
    objc_destroyWeak(v41);

    objc_destroyWeak((id *)buf);
  }
}

- (NSMutableDictionary)cachedRules
{
  return self->_cachedRules;
}

- (void)setCachedRules:(id)a3
{
}

- (void).cxx_destruct
{
}

@end