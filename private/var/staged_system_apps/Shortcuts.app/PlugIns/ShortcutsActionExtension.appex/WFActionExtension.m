@interface WFActionExtension
- (NSArray)contentItems;
- (NSExtensionContext)extensionContext;
- (WFWorkflowRunnerClient)runnerClient;
- (id)instantiateWorkflowFromSingleUseToken:(id)a3 error:(id *)a4;
- (int64_t)initializationResult;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)finishWithItems:(id)a3 error:(id)a4;
- (void)finishWithOutput:(id)a3 error:(id)a4 cancelled:(BOOL)a5;
- (void)processAndRunWorkflow:(id)a3;
- (void)runWorkflow:(id)a3 withInput:(id)a4 javaScriptRunners:(id)a5;
- (void)setContentItems:(id)a3;
- (void)setExtensionContext:(id)a3;
- (void)setInitializationResult:(int64_t)a3;
- (void)setRunnerClient:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation WFActionExtension

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_runnerClient, 0);

  objc_storeStrong((id *)&self->_extensionContext, 0);
}

- (void)setContentItems:(id)a3
{
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (void)setRunnerClient:(id)a3
{
}

- (WFWorkflowRunnerClient)runnerClient
{
  return self->_runnerClient;
}

- (void)setInitializationResult:(int64_t)a3
{
  self->_initializationResult = a3;
}

- (int64_t)initializationResult
{
  return self->_initializationResult;
}

- (void)setExtensionContext:(id)a3
{
}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000421C;
  block[3] = &unk_1000085D8;
  block[4] = self;
  id v9 = a5;
  BOOL v10 = a6;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)finishWithItems:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = v7;
    id v9 = [v7 userInfo];
    id v10 = [v9 mutableCopy];

    v11 = [v8 userInfo];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000044E0;
    v23[3] = &unk_1000084D0;
    id v24 = v10;
    id v12 = v10;
    [v11 enumerateKeysAndObjectsUsingBlock:v23];

    v13 = [v8 domain];
    v14 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, [v8 code], v12);
  }
  else
  {
    v14 = 0;
  }
  if ([v6 count])
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = sub_100004548;
    v21[4] = sub_100004574;
    v22 = &stru_100008510;
    v15 = [(WFActionExtension *)self extensionContext];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000457C;
    v20[3] = &unk_100008560;
    v20[4] = v21;
    [v15 completeRequestReturningItems:v6 completionHandler:v20];

    _Block_object_dispose(v21, 8);
    v16 = &stru_100008510;
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100004660;
    v17[3] = &unk_1000085B0;
    v17[4] = self;
    id v18 = v14;
    v19 = &stru_100008510;
    v16 = objc_retainBlock(v17);
    v16->invoke(v16, 0);
  }
}

- (void)finishWithOutput:(id)a3 error:(id)a4 cancelled:(BOOL)a5
{
  id v7 = a4;
  v8 = [a3 items];
  [v8 if_compactMap:&stru_1000084A8];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(WFActionExtension *)self finishWithItems:v9 error:v7];
}

- (void)runWorkflow:(id)a3 withInput:(id)a4 javaScriptRunners:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 effectiveInputClasses];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000049E8;
  v14[3] = &unk_100008468;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  [v10 generateCollectionByCoercingToItemClasses:v11 completionHandler:v14];
}

- (id)instantiateWorkflowFromSingleUseToken:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSUserDefaults systemShortcutsUserDefaults];
  id v7 = [v6 workflowIdentifierConsumingSingleUseToken:v5];

  if (v7)
  {
    id v8 = +[WFDatabase defaultDatabase];
    id v9 = [v8 referenceForWorkflowID:v7];
    if (v9)
    {
      id v10 = +[WFWorkflow workflowWithReference:v9 database:v8 error:a4];
    }
    else
    {
      v11 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        v14 = "-[WFActionExtension instantiateWorkflowFromSingleUseToken:error:]";
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Resolved single use token to workflow ID %@, but no workflow found in the database with that ID", (uint8_t *)&v13, 0x16u);
      }

      id v10 = 0;
    }
  }
  else
  {
    id v8 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      v14 = "-[WFActionExtension instantiateWorkflowFromSingleUseToken:error:]";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Given single use token %@ not found in user defaults", (uint8_t *)&v13, 0x16u);
    }
    id v10 = 0;
  }

  return v10;
}

- (void)processAndRunWorkflow:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(WFActionExtension *)self contentItems];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004DE8;
  v7[3] = &unk_100008440;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 if_mapAsynchronously:&stru_100008418 completionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  [(WFActionExtension *)self setExtensionContext:v4];
  self->_initializationResult = (int64_t)+[WFInitialization initializeProcessWithDatabase:1];
  if (v4) {
    [v4 _extensionHostAuditToken];
  }
  else {
    memset(v49, 0, sizeof(v49));
  }
  v33 = v4;
  v31 = +[VCAccessSpecifier accessSpecifierForAuditToken:v49];
  v36 = [v31 associatedAppBundleIdentifier];
  id v5 = objc_opt_new();
  v37 = objc_opt_new();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v32 = self;
  id v6 = [(WFActionExtension *)self extensionContext];
  id v7 = [v6 inputItems];

  id obj = v7;
  id v38 = [v7 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v38)
  {
    v39 = 0;
    uint64_t v35 = *(void *)v46;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v10 = [v9 attributedTitle];
        v11 = [v9 attributedContentText];
        id v12 = [v9 attachments];
        NSLog(@"Started action extension with input: %@ %@ %@", v10, v11, v12);

        int v13 = +[WFNSExtensionItemContentItem itemWithObject:v9 sourceAppBundleIdentifier:v36];
        [v37 addObject:v13];
        v14 = [v9 userInfo];
        __int16 v15 = [v14 objectForKey:@"ActionExtensionWorkflowToken"];

        if (v15)
        {
          id v16 = v15;

          v39 = v16;
        }
        v17 = [v9 attachments];
        [v17 count];

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v18 = [v9 attachments];
        id v19 = [v18 countByEnumeratingWithState:&v41 objects:v56 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v42;
          do
          {
            for (j = 0; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v42 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = [*(id *)(*((void *)&v41 + 1) + 8 * (void)j) registeredTypeIdentifiers];
              [v5 addObjectsFromArray:v23];
            }
            id v20 = [v18 countByEnumeratingWithState:&v41 objects:v56 count:16];
          }
          while (v20);
        }

        [v9 attributedTitle];
        [v9 attributedContentText];
      }
      id v38 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v38);
  }
  else
  {
    v39 = 0;
  }

  [(WFActionExtension *)v32 setContentItems:v37];
  if ([v37 count])
  {
    id v40 = 0;
    id v24 = v39;
    v25 = [(WFActionExtension *)v32 instantiateWorkflowFromSingleUseToken:v39 error:&v40];
    id v26 = v40;
    if (v25)
    {
      [(WFActionExtension *)v32 processAndRunWorkflow:v25];

      goto LABEL_29;
    }
  }
  else
  {
    v54[0] = NSLocalizedFailureReasonErrorKey;
    v27 = sub_100005488(@"The app that opened this extension did not provide any input.");
    v55[0] = v27;
    v54[1] = NSLocalizedDescriptionKey;
    v28 = sub_100005488(@"Unfortunately, there is nothing Shortcuts can do about this it is due to a bug in the host app. We’d recommend contacting the maker of that app and letting them know of this problem.");;
    v55[1] = v28;
    v29 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
    id v26 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v29];

    id v24 = v39;
  }
  v30 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v51 = "-[WFActionExtension beginRequestWithExtensionContext:]";
    __int16 v52 = 2114;
    id v53 = v26;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s Failed to load requested shortcut in action extension: %{public}@", buf, 0x16u);
  }

  [(WFActionExtension *)v32 finishWithOutput:0 error:v26 cancelled:0];
LABEL_29:
}

@end