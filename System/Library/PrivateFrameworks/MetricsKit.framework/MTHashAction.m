@interface MTHashAction
- (MTHashAction)initWithField:(id)a3 configDictionary:(id)a4;
- (MTIDScheme)scheme;
- (id)hashOf:(id)a3 userId:(id)a4;
- (id)performAction:(id)a3 context:(id)a4;
- (void)setScheme:(id)a3;
@end

@implementation MTHashAction

- (MTHashAction)initWithField:(id)a3 configDictionary:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MTHashAction;
  v7 = [(MTTreatmentAction *)&v16 initWithField:a3 configDictionary:v6];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"scheme"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v8 objectForKeyedSubscript:@"namespace"];
      if (v9)
      {
LABEL_7:
        v14 = [[MTIDScheme alloc] initWithNamespace:v9 options:v8];
        [(MTHashAction *)v7 setScheme:v14];

        goto LABEL_8;
      }
    }
    else
    {

      v8 = 0;
    }
    v10 = NSString;
    v11 = +[MTFrameworkEnvironment sharedEnvironment];
    v12 = [v11 hostProcessBundleIdentifier];
    v13 = [(MTTreatmentAction *)v7 field];
    v9 = [v10 stringWithFormat:@"%@.%lx", v12, objc_msgSend(v13, "hash")];

    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (id)hashOf:(id)a3 userId:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[MTFrameworkEnvironment sharedEnvironment];
  v9 = [v8 secretStore];

  v10 = [(MTHashAction *)self scheme];
  v24 = @"syncWaitTime";
  v25[0] = &unk_26C96FE68;
  v11 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  v12 = [v9 secretForScheme:v10 options:v11];
  id v21 = 0;
  v13 = [v12 resultWithTimeout:&v21 error:5.0];
  id v14 = v21;

  if (v13)
  {
    v15 = NSString;
    objc_super v16 = [v13 value];
    v17 = [v15 stringWithFormat:@"%@\n%@\n%@", v6, v16, v7];

    v18 = [v17 mt_SHA1Base62String];
  }
  else
  {
    v17 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = [(MTHashAction *)self scheme];
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_impl(&dword_218211000, v17, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to retrieve secret salt for scheme %@", buf, 0xCu);
    }
    v18 = 0;
  }

  return v18;
}

- (id)performAction:(id)a3 context:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTHashAction;
  id v7 = [(MTTreatmentAction *)&v14 performAction:a3 context:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v7 stringValue];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_7;
      }
    }
    uint64_t v8 = [v7 description];
  }
  v9 = (void *)v8;

  id v7 = v9;
LABEL_7:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v6 metrics];
    v11 = [v10 objectForKey:@"userId"];

    v12 = [(MTHashAction *)self hashOf:v7 userId:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MTIDScheme)scheme
{
  return self->_scheme;
}

- (void)setScheme:(id)a3
{
}

- (void).cxx_destruct
{
}

@end