@interface PCSFollowupController
+ (BOOL)postEDPStateRepair:(id *)a3;
@end

@implementation PCSFollowupController

+ (BOOL)postEDPStateRepair:(id *)a3
{
  getCDPFollowUpContextClass();
  if (objc_opt_respondsToSelector())
  {
    v4 = [getCDPFollowUpContextClass() contextForCDPEDPStateRepair];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v5 = (void *)getCDPFollowUpControllerClass_softClass;
    uint64_t v30 = getCDPFollowUpControllerClass_softClass;
    if (!getCDPFollowUpControllerClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      v24 = __getCDPFollowUpControllerClass_block_invoke;
      v25 = &unk_1E5E6DDF8;
      v26 = &v27;
      __getCDPFollowUpControllerClass_block_invoke((uint64_t)buf);
      v5 = (void *)v28[3];
    }
    v6 = v5;
    _Block_object_dispose(&v27, 8);
    id v7 = objc_alloc_init(v6);
    id v21 = 0;
    int v8 = [v7 postFollowUpWithContext:v4 error:&v21];
    id v9 = v21;
    v10 = pcsLogObjForScope("cfu-repair");
    v11 = v10;
    if (!v8 || v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[PCSFollowupController postEDPStateRepair:]();
      }

      if (a3) {
        *a3 = v9;
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ACF98000, v11, OS_LOG_TYPE_DEFAULT, "Succssfully posted CDP EDP Repair CFU", buf, 2u);
      }
    }
  }
  else
  {
    v12 = pcsLogObjForScope("cfu-repair");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[PCSFollowupController postEDPStateRepair:]();
    }

    if (a3)
    {
      PCSErrorCreate(227, @"selector contextForCDPEDPStateRepair is not available", v13, v14, v15, v16, v17, v18, v20);
      LOBYTE(v8) = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

+ (void)postEDPStateRepair:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ACF98000, v0, v1, "Failed to post CDP EDP Repair: %@", v2, v3, v4, v5, v6);
}

+ (void)postEDPStateRepair:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1ACF98000, v0, v1, "selector contextForCDPEDPStateRepair not available", v2, v3, v4, v5, v6);
}

@end