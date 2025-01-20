@interface WRWorkflowProviderSingleWorkflow
- (WRWorkflowProviderSingleWorkflow)initWithWorkflowName:(id)a3 queue:(id)a4 callback:(id)a5;
- (id)callback;
- (id)workflow;
- (id)workflowName;
- (void)handleSettingsChanged:(BOOL)a3;
- (void)setWorkflow:(void *)a1;
@end

@implementation WRWorkflowProviderSingleWorkflow

- (WRWorkflowProviderSingleWorkflow)initWithWorkflowName:(id)a3 queue:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WRWorkflowProviderSingleWorkflow;
  v10 = [(WRWorkflowProvider *)&v16 initWithQueue:a4];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    workflowName = v10->_workflowName;
    v10->_workflowName = (NSString *)v11;

    uint64_t v13 = MEMORY[0x263E46C40](v9);
    id callback = v10->_callback;
    v10->_id callback = (id)v13;
  }
  return v10;
}

- (void)handleSettingsChanged:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (self) {
    id Property = objc_getProperty(self, a2, 24, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v7 = +[WRWorkflow workflowWithName:Property];
  if (!v7)
  {
    if (self) {
      objc_getProperty(self, v6, 24, 1);
    }
    int v8 = *__error();
    id v9 = _wrlog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (self) {
        id v11 = objc_getProperty(self, v10, 24, 1);
      }
      else {
        id v11 = 0;
      }
      *(_DWORD *)buf = 138543362;
      id v24 = v11;
      _os_log_impl(&dword_261964000, v9, OS_LOG_TYPE_INFO, "%{public}@: No workflow with name", buf, 0xCu);
    }

    *__error() = v8;
  }
  if (a3)
  {
LABEL_26:
    if (!self)
    {
      v20 = 0;
      goto LABEL_28;
    }
LABEL_27:
    objc_setProperty_atomic(self, v6, (id)v7, 32);
    v20 = objc_getProperty(self, v19, 16, 1);
LABEL_28:
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __58__WRWorkflowProviderSingleWorkflow_handleSettingsChanged___block_invoke;
    v21[3] = &unk_2655898C8;
    v21[4] = self;
    id v22 = (id)v7;
    dispatch_async(v20, v21);

    goto LABEL_29;
  }
  if (self) {
    unint64_t v12 = (unint64_t)objc_getProperty(self, v6, 32, 1);
  }
  else {
    unint64_t v12 = 0;
  }
  if (!(v7 | v12)) {
    goto LABEL_29;
  }
  if (!self)
  {
    v15 = 0;
LABEL_25:

    goto LABEL_26;
  }
  id v13 = objc_getProperty(self, v6, 32, 1);
  v15 = v13;
  if (!v7 || !v13) {
    goto LABEL_25;
  }
  char v16 = objc_msgSend(objc_getProperty(self, v14, 32, 1), "hasChangesRelativeTo:", v7);

  if (v16) {
    goto LABEL_27;
  }
  objc_getProperty(self, v6, 24, 1);
  int v17 = *__error();
  _wrlog();
  v18 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG)) {
    -[WRWorkflowProviderSingleWorkflow handleSettingsChanged:](self, v18);
  }

  *__error() = v17;
LABEL_29:
}

- (id)workflowName
{
  if (result) {
    return objc_getProperty(result, a2, 24, 1);
  }
  return result;
}

- (id)workflow
{
  if (result) {
    return objc_getProperty(result, a2, 32, 1);
  }
  return result;
}

- (void)setWorkflow:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 32);
  }
}

uint64_t __58__WRWorkflowProviderSingleWorkflow_handleSettingsChanged___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(void **)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 40, 1);
  }
  v3 = (uint64_t (*)(void))Property[2];

  return v3();
}

- (id)callback
{
  if (result) {
    return objc_getProperty(result, a2, 40, 1);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_workflow, 0);

  objc_storeStrong((id *)&self->_workflowName, 0);
}

- (void)handleSettingsChanged:(void *)a1 .cold.1(void *a1, char *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  objc_getProperty(a1, a2, 24, 1);
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_261964000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "%{public}@: No changes after tasking notification", v3, 0xCu);
}

@end