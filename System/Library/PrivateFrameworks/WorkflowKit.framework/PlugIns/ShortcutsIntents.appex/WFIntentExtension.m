@interface WFIntentExtension
- (WFIntentExtension)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation WFIntentExtension

- (id)handlerForIntent:(id)a3
{
  id v3 = a3;
  if (qword_10000E370 != -1) {
    dispatch_once(&qword_10000E370, &stru_1000083D0);
  }
  v4 = (void *)qword_10000E368;
  v5 = [v3 identifier];
  v6 = [v4 objectForKeyedSubscript:v5];

  v7 = (void *)qword_10000E368;
  if (v6)
  {
    v8 = [v3 identifier];
    id v9 = [v7 objectForKeyedSubscript:v8];
  }
  else
  {
    [(id)qword_10000E368 removeAllObjects];
    v10 = (void *)qword_10000E368;
    v8 = [v3 identifier];
    if ([v3 _type] == (id)2)
    {
      v11 = [v3 _codableDescription];
      v12 = [v11 typeName];

      +[NSString stringWithFormat:@"WF%@IntentHandler", v12];
    }
    else
    {
      v13 = [v3 _intentInstanceDescription];
      v12 = [v13 name];

      +[NSString stringWithFormat:@"WF%@Handler", v12];
    }
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();

    id v9 = objc_alloc_init(NSClassFromString(v14));
    [v10 setObject:v9 forKeyedSubscript:v8];
  }

  return v9;
}

- (WFIntentExtension)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFIntentExtension;
  v2 = [(WFIntentExtension *)&v7 init];
  if (v2)
  {
    id v3 = +[WFApplicationContext sharedContext];
    v4 = objc_opt_new();
    [v3 setProvider:v4];

    +[WFInitialization initializeProcessWithDatabase:1];
    v5 = v2;
  }

  return v2;
}

@end