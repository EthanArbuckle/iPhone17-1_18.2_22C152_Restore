@interface WFActionUserInterfaceListener
- (WFActionUserInterface)actionInterface;
- (WFActionUserInterfaceListener)initWithUserInterfaceType:(id)a3 actionClassName:(id)a4 classNamesByType:(id)a5;
- (WFActionUserInterfaceListener)initWithUserInterfaceType:(id)a3 actionClassName:(id)a4 classNamesByType:(id)a5 attribution:(id)a6;
@end

@implementation WFActionUserInterfaceListener

- (void).cxx_destruct
{
}

- (WFActionUserInterface)actionInterface
{
  return self->_actionInterface;
}

- (WFActionUserInterfaceListener)initWithUserInterfaceType:(id)a3 actionClassName:(id)a4 classNamesByType:(id)a5 attribution:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v10 = (NSString *)a3;
  v11 = (NSString *)a4;
  id v12 = a5;
  id v13 = a6;
  Class v14 = NSClassFromString(v11);
  if (v14)
  {
    v15 = [(objc_class *)v14 userInterfaceXPCInterface];
    v16 = [v12 objectForKeyedSubscript:v10];
    v17 = v16;
    if (v16)
    {
      v18 = NSClassFromString(v16);
      if (v18)
      {
        v19 = [[v18 alloc] initWithUserInterfaceType:v10 attribution:v13];
        v27.receiver = self;
        v27.super_class = (Class)WFActionUserInterfaceListener;
        v20 = [(WFSingleConnectionXPCListener *)&v27 initWithExportedObject:v19 exportedInterface:v15];
        self = v20;
        if (v20)
        {
          objc_storeStrong((id *)&v20->_actionInterface, v19);
          self = self;
          v21 = self;
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:
        v21 = 0;
        goto LABEL_15;
      }
      v19 = getWFDialogLogObject();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFActionUserInterfaceListener initWithUserInterfaceType:actionClassName:classNamesByType:attribution:]";
      __int16 v30 = 2114;
      v31 = v17;
      v22 = "%s No interface class found with name: %{public}@";
      v23 = v19;
      os_log_type_t v24 = OS_LOG_TYPE_FAULT;
      uint32_t v25 = 22;
    }
    else
    {
      v19 = getWFDialogLogObject();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136315650;
      v29 = "-[WFActionUserInterfaceListener initWithUserInterfaceType:actionClassName:classNamesByType:attribution:]";
      __int16 v30 = 2114;
      v31 = v10;
      __int16 v32 = 2114;
      v33 = v11;
      v22 = "%s No user interface of type %{public}@ for action: %{public}@";
      v23 = v19;
      os_log_type_t v24 = OS_LOG_TYPE_ERROR;
      uint32_t v25 = 32;
    }
    _os_log_impl(&dword_2352F5000, v23, v24, v22, buf, v25);
    goto LABEL_14;
  }
  v15 = getWFDialogLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[WFActionUserInterfaceListener initWithUserInterfaceType:actionClassName:classNamesByType:attribution:]";
    __int16 v30 = 2114;
    v31 = v11;
    _os_log_impl(&dword_2352F5000, v15, OS_LOG_TYPE_FAULT, "%s Action class not loaded: %{public}@", buf, 0x16u);
  }
  v21 = 0;
LABEL_16:

  return v21;
}

- (WFActionUserInterfaceListener)initWithUserInterfaceType:(id)a3 actionClassName:(id)a4 classNamesByType:(id)a5
{
  return [(WFActionUserInterfaceListener *)self initWithUserInterfaceType:a3 actionClassName:a4 classNamesByType:a5 attribution:0];
}

@end