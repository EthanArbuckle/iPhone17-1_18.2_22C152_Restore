@interface VUIJSObject
- (NSMutableDictionary)managedProperties;
- (VUIAppContext)appContext;
- (VUIJSObject)init;
- (VUIJSObject)initWithAppContext:(id)a3;
- (id)invokeMethod:(id)a3 withArguments:(id)a4;
- (id)jsValueForProperty:(id)a3;
- (void)setJSValue:(id)a3 forProperty:(id)a4;
- (void)setManagedProperties:(id)a3;
@end

@implementation VUIJSObject

- (void)setJSValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[VUIJSThreadUtils isVideosUICoreJSThread])
  {
    v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[VUIJSObject setJSValue:forProperty:]();
    }
  }
  v9 = [(VUIJSObject *)self appContext];
  v10 = [(VUIJSObject *)self managedProperties];
  v11 = [v10 objectForKey:v7];

  if (v11)
  {
    v12 = [v9 jsContext];
    v13 = [v12 virtualMachine];
    [v13 removeManagedReference:v11 withOwner:self];

    v14 = [(VUIJSObject *)self managedProperties];
    [v14 removeObjectForKey:v7];
  }
  if (v6)
  {
    v15 = [(VUIJSObject *)self managedProperties];

    if (!v15)
    {
      v16 = [MEMORY[0x1E4F1CA60] dictionary];
      [(VUIJSObject *)self setManagedProperties:v16];
    }
    v17 = [MEMORY[0x1E4F30928] managedValueWithValue:v6];
    v18 = [v9 jsContext];
    v19 = [v18 virtualMachine];
    [v19 addManagedReference:v17 withOwner:self];

    v20 = [(VUIJSObject *)self managedProperties];
    [v20 setObject:v17 forKey:v7];
  }
}

- (NSMutableDictionary)managedProperties
{
  return self->_managedProperties;
}

- (VUIAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (VUIAppContext *)WeakRetained;
}

- (void)setManagedProperties:(id)a3
{
}

- (VUIJSObject)initWithAppContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIJSObject;
  v5 = [(VUIJSObject *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_appContext, v4);
  }

  return v6;
}

- (id)jsValueForProperty:(id)a3
{
  id v4 = a3;
  if (!+[VUIJSThreadUtils isVideosUICoreJSThread])
  {
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[VUIJSObject jsValueForProperty:]();
    }
  }
  id v6 = [(VUIJSObject *)self managedProperties];
  id v7 = [v6 objectForKey:v4];
  objc_super v8 = [v7 value];

  return v8;
}

- (id)invokeMethod:(id)a3 withArguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!+[VUIJSThreadUtils isVideosUICoreJSThread])
  {
    objc_super v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[VUIJSObject invokeMethod:withArguments:]();
    }
  }
  v9 = [(VUIJSObject *)self appContext];
  v10 = (void *)MEMORY[0x1E4F30938];
  v11 = [v9 jsContext];
  v12 = [v10 valueWithObject:self inContext:v11];

  if ([v12 hasProperty:v6])
  {
    v13 = [v12 invokeMethod:v6 withArguments:v7];
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F30938];
    v15 = [NSString stringWithFormat:@"invokeMethod: failed - Method [%@] not defined in [%@]", v6, objc_opt_class()];
    v16 = [v9 jsContext];
    v13 = [v14 valueWithNewErrorFromMessage:v15 inContext:v16];
  }
  return v13;
}

- (VUIJSObject)init
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedProperties, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

- (void)setJSValue:forProperty:.cold.1()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_13(&dword_1E2BD7000, v0, v1, "VUIJSObject::<%p> setJSValue in nonJS thread: %@");
}

- (void)jsValueForProperty:.cold.1()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_13(&dword_1E2BD7000, v0, v1, "VUIJSObject::<%p> jsValueForProperty in nonJS thread: %@");
}

- (void)invokeMethod:withArguments:.cold.1()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_13(&dword_1E2BD7000, v0, v1, "VUIJSObject::<%p> invokeMethod in nonJS thread: %@");
}

@end