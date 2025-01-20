@interface WFIsolatedShortcutRunner
- (WFIsolatedShortcutRunner)init;
- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5;
- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4;
- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4;
- (void)injectResolvedContent:(id)a3 asVariableWithName:(id)a4 completionHandler:(id)a5;
- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6;
- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4;
- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5;
- (void)runToolWithInvocation:(id)a3;
@end

@implementation WFIsolatedShortcutRunner

- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFIsolatedShortcutRunner *)self stateMachine];
  [v8 handlingRequestStateWithReason:@"incoming ToolKit indexing request"];

  v9 = +[WFShortcutRunnerSandboxExtensionManager sharedManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006C23C;
  v12[3] = &unk_10007F150;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [v9 requestSandboxExtensionForToolKitIndexingWithCompletionHandler:v12];
}

- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFIsolatedShortcutRunner *)self workflowController];
  +[WFToolKitHelper fetchToolInvocationSummaryForInvocation:v7 variableSource:v8 completionBlock:v6];
}

- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006C70C;
  v8[3] = &unk_10007F060;
  id v9 = a5;
  id v7 = v9;
  +[WFToolKitHelper resolveDeferredValueForEncodedStorage:a3 encodedExpectedType:a4 completionBlock:v8];
}

- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006C868;
  v6[3] = &unk_10007F060;
  id v7 = a4;
  id v5 = v7;
  +[WFToolKitHelper produceEncodedDisplayRepresentationForRequest:a3 completionBlock:v6];
}

- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void, id))a6;
  switch(+[WFToolKitHelper valueSetTypeForDefinition:v12])
  {
    case 0:
      v15 = +[NSAssertionHandler currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"WFIsolatedShortcutRunner.m" lineNumber:96 description:@"Can't parse value set definition"];

      goto LABEL_3;
    case 1:
LABEL_3:
      id v74 = 0;
      v16 = +[WFToolKitHelper decodeDynamicEnumerationDefinition:v12 error:&v74];
      id v17 = v74;
      if (!v16)
      {
        v14[2](v14, 0, v17);
        goto LABEL_37;
      }
      id v73 = v17;
      v18 = +[WFToolKitHelper createActionFromEncodedToolInvocation:v13 error:&v73];
      id v19 = v73;

      if (!v18)
      {
        NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
        CFStringRef v86 = @"Action backing this tool not found.";
        +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        v34 = v33 = v19;
        id v17 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v34];

        v14[2](v14, 0, v17);
        goto LABEL_36;
      }
      v58 = v19;
      v20 = [v16 parameterKey];
      v21 = [v18 parameterForKey:v20];

      v60 = v21;
      if (!v21)
      {
        NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
        v35 = [v16 parameterKey];
        v36 = +[NSString stringWithFormat:@"Parameter %@ not found.", v35];
        v84 = v36;
        v37 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        id v17 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v37];

        v14[2](v14, 0, v17);
        goto LABEL_35;
      }
      id v22 = v21;
      unsigned int v23 = [v22 conformsToProtocol:&OBJC_PROTOCOL___WFParameterValuePickable];
      char v24 = v23;
      if (v23) {
        v25 = v22;
      }
      else {
        v25 = 0;
      }
      id v56 = v25;

      if ((v24 & 1) == 0)
      {
        NSErrorUserInfoKey v81 = NSLocalizedDescriptionKey;
        v38 = [v16 parameterKey];
        v39 = +[NSString stringWithFormat:@"Parameter %@ is not enumerable: %@.", v38, objc_opt_class()];
        v82 = v39;
        v40 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        id v17 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v40];

LABEL_23:
        v14[2](v14, 0, v17);
        goto LABEL_34;
      }
      if (v11)
      {
        id v72 = v58;
        v26 = +[WFToolKitHelper decodeSearchStringInEncodedQuery:v11 error:&v72];
        id v17 = v72;

        if (!v26) {
          goto LABEL_23;
        }
      }
      else
      {
        v26 = 0;
        id v17 = v58;
      }
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_10006D270;
      v68[3] = &unk_10007F088;
      v71 = v14;
      id v69 = v22;
      id v70 = v18;
      objc_msgSend(v69, "wf_loadStatesWithSearchTerm:completionHandler:", v26, v68);

LABEL_34:
LABEL_35:

LABEL_36:
LABEL_37:

LABEL_42:
      return;
    case 2:
      id v67 = 0;
      v27 = +[WFToolKitHelper decodeContentPropertyPossibleValuesDefinition:v12 error:&v67];
      id v28 = v67;
      if (v27)
      {
        id v29 = [v27 contentItemClass];
        if (v29)
        {
          v30 = v29;
          char v31 = objc_opt_respondsToSelector();
          if (v31)
          {
            v32 = [v30 allProperties];
          }
          else
          {
            v32 = 0;
          }
          uint64_t v43 = objc_opt_class();
          v44 = sub_10006D378(v32, v43);
          if (v31) {

          }
          v61 = v44;
          if (v44)
          {
            v65[0] = _NSConcreteStackBlock;
            v65[1] = 3221225472;
            v65[2] = sub_10006D4A0;
            v65[3] = &unk_10007F0B0;
            id v45 = v27;
            id v66 = v45;
            v46 = objc_msgSend(v44, "if_firstObjectPassingTest:", v65);
            v47 = v46;
            if (v46)
            {
              v48 = [v46 possibleValues];
              v62[0] = _NSConcreteStackBlock;
              v62[1] = 3221225472;
              v62[2] = sub_10006D538;
              v62[3] = &unk_10007F0D8;
              id v63 = v47;
              v64 = v14;
              [v48 getValuesWithCompletionBlock:v62];
            }
            else
            {
              NSErrorUserInfoKey v75 = NSLocalizedDescriptionKey;
              v59 = [v45 propertyName];
              v57 = NSStringFromClass((Class)v30);
              v53 = +[NSString stringWithFormat:@"%@ is not a content property on %@", v59, v57];
              v76 = v53;
              v54 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
              uint64_t v55 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v54];

              v14[2](v14, 0, (id)v55);
              id v28 = (id)v55;
            }
          }
          else
          {
            NSErrorUserInfoKey v77 = NSLocalizedDescriptionKey;
            v49 = NSStringFromClass((Class)v30);
            v50 = +[NSString stringWithFormat:@"%@ is not a subclass of WFContentItem", v49];
            v78 = v50;
            v51 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
            uint64_t v52 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v51];

            v14[2](v14, 0, (id)v52);
            id v28 = (id)v52;
          }
        }
        else
        {
          NSErrorUserInfoKey v79 = NSLocalizedDescriptionKey;
          CFStringRef v80 = @"Content item class not found.";
          v41 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
          uint64_t v42 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:v41];

          v14[2](v14, 0, (id)v42);
          id v28 = (id)v42;
        }
      }
      else
      {
        v14[2](v14, 0, v28);
      }

      goto LABEL_42;
    case 3:
      +[WFToolKitHelper runLinkQuery:v11 valueSet:v12 completionBlock:v14];
      goto LABEL_42;
    default:
      goto LABEL_42;
  }
}

- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFIsolatedShortcutRunner *)self accessSpecifier];
  unsigned __int8 v12 = [v11 allowVariableInjection];

  if (v12)
  {
    id v19 = 0;
    id v13 = +[WFToolKitHelper produceVariableFromEncodedReference:v8 error:&v19];
    id v14 = v19;
    if (v13)
    {
      v15 = [(WFIsolatedShortcutRunner *)self workflowController];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10006D768;
      v16[3] = &unk_10007F038;
      id v18 = v10;
      id v17 = v9;
      [v13 retrieveContentCollectionWithVariableSource:v15 completionHandler:v16];
    }
    else
    {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v14);
    }
  }
  else
  {
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    CFStringRef v21 = @"You're not entitled to extract variables out of a workflow execution";
    id v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v13 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:v14];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
  }
}

- (void)injectResolvedContent:(id)a3 asVariableWithName:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    unsigned __int8 v12 = +[NSUUID UUID];
    id v11 = [v12 UUIDString];
  }
  id v13 = [objc_alloc((Class)WFUserDefinedVariable) initWithName:v11 variableProvider:0 aggrandizements:0];
  id v14 = [(WFIsolatedShortcutRunner *)self workflowController];
  v15 = [v13 name];
  unsigned __int8 v16 = [v14 setContent:v8 forVariableWithName:v15];

  if (v16)
  {
    id v17 = [v13 serializedRepresentation];
    id v18 = +[WFAnyPropertyListObject objectWithPropertyListObject:v17];
    v10[2](v10, v18, 0);
  }
  else
  {
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    CFStringRef v22 = @"Couldn't inject content to variable table";
    id v19 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    NSErrorUserInfoKey v20 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:88 userInfo:v19];
    ((void (**)(id, void *, void *))v10)[2](v10, 0, v20);
  }
}

- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(WFIsolatedShortcutRunner *)self accessSpecifier];
  unsigned __int8 v10 = [v9 allowVariableInjection];

  if (v10)
  {
    id v11 = [v7 variableContent];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v12 = [(WFIsolatedShortcutRunner *)self workflowController];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10006DBD0;
      v15[3] = &unk_10007F010;
      id v17 = v8;
      v15[4] = self;
      id v11 = v11;
      id v16 = v11;
      [v11 resolveWithVariableSource:v12 completionHandler:v15];
    }
    else
    {
      id v14 = +[NSAssertionHandler currentHandler];
      [v14 handleFailureInMethod:a2, self, @"WFIsolatedShortcutRunner.m", 50, @"Got contents that Shortcuts doesn't recognize: %@", v11 object file lineNumber description];
    }
  }
  else
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    CFStringRef v19 = @"You're not entitled to inject variables into a workflow execution";
    id v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v13 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:1 userInfo:v11];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v13);
  }
}

- (void)runToolWithInvocation:(id)a3
{
  id v8 = 0;
  id v5 = +[WFToolKitHelper createActionFromEncodedToolInvocation:a3 error:&v8];
  id v6 = v8;
  if (!v5)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WFIsolatedShortcutRunner.m", 30, @"Faulty encoded tool invocation: %@", v6 object file lineNumber description];
  }
  [(WFIsolatedShortcutRunner *)self stepWithAction:v5];
}

- (WFIsolatedShortcutRunner)init
{
  v3.receiver = self;
  v3.super_class = (Class)WFIsolatedShortcutRunner;
  return [(WFIsolatedShortcutRunner *)&v3 initWithProcessPolicy:0];
}

@end