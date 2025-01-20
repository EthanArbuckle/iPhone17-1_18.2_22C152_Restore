@interface WRWorkflowProviderAllWorkflows
- (WRWorkflowProviderAllWorkflows)initWithQueue:(id)a3 callback:(id)a4;
- (id)callback;
- (id)workflows;
- (void)handleSettingsChanged:(BOOL)a3;
- (void)setWorkflows:(void *)a1;
@end

@implementation WRWorkflowProviderAllWorkflows

- (WRWorkflowProviderAllWorkflows)initWithQueue:(id)a3 callback:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WRWorkflowProviderAllWorkflows;
  v7 = [(WRWorkflowProvider *)&v11 initWithQueue:a3];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x263E46C40](v6);
    id callback = v7->_callback;
    v7->_id callback = (id)v8;
  }
  return v7;
}

- (void)handleSettingsChanged:(BOOL)a3
{
  id v6 = +[WRWorkflow allWorkflows];
  if (a3
    || (!self ? (id v7 = 0) : (id v7 = objc_getProperty(self, v5, 24, 1)),
        uint64_t v8 = [v7 count],
        v8 != [v6 count]))
  {
LABEL_21:
    if (self)
    {
      objc_setProperty_atomic(self, v5, v6, 24);
      Property = objc_getProperty(self, v18, 16, 1);
    }
    else
    {
      Property = 0;
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __56__WRWorkflowProviderAllWorkflows_handleSettingsChanged___block_invoke;
    v20[3] = &unk_2655898C8;
    v20[4] = self;
    id v21 = v6;
    dispatch_async(Property, v20);
  }
  else
  {
    unint64_t v9 = 0;
    if (!self) {
      goto LABEL_15;
    }
LABEL_6:
    for (id i = objc_getProperty(self, v5, 24, 1); v9 < [i count]; id i = 0)
    {
      if (self) {
        id v12 = objc_getProperty(self, v11, 24, 1);
      }
      else {
        id v12 = 0;
      }
      v13 = [v12 objectAtIndexedSubscript:v9];
      uint64_t v14 = [v6 objectAtIndexedSubscript:v9];
      v15 = (void *)v14;
      if (v13
        && v14
        && (![v13 isEqual:v14]
         || ([v13 hasChangesRelativeTo:v15] & 1) != 0))
      {

        goto LABEL_21;
      }

      ++v9;
      if (self) {
        goto LABEL_6;
      }
LABEL_15:
      ;
    }
    int v16 = *__error();
    v17 = _wrlog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[WRWorkflowProviderAllWorkflows handleSettingsChanged:]();
    }

    *__error() = v16;
  }
}

- (id)workflows
{
  if (result) {
    return objc_getProperty(result, a2, 24, 1);
  }
  return result;
}

- (void)setWorkflows:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 24);
  }
}

uint64_t __56__WRWorkflowProviderAllWorkflows_handleSettingsChanged___block_invoke(uint64_t a1, const char *a2)
{
  Property = *(void **)(a1 + 32);
  if (Property) {
    Property = objc_getProperty(Property, a2, 32, 1);
  }
  v3 = (uint64_t (*)(void))Property[2];

  return v3();
}

- (id)callback
{
  if (result) {
    return objc_getProperty(result, a2, 32, 1);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);

  objc_storeStrong((id *)&self->_workflows, 0);
}

- (void)handleSettingsChanged:.cold.1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0(&dword_261964000, v0, v1, "No changes in any workflow after tasking notification", v2, v3, v4, v5, v6);
}

@end