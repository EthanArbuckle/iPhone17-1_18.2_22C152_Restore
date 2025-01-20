@interface RBSBaseMemoryGrant(RBProcessState)
- (uint64_t)isValidForContext:()RBProcessState withError:;
- (void)applyToProcessState:()RBProcessState attributePath:context:;
@end

@implementation RBSBaseMemoryGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x263F64420], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  int v9 = [v7 memoryLimit];
  v10 = [v8 target];
  uint64_t v11 = [v10 process];
  if (v11)
  {
    v12 = v11;

LABEL_4:
    v14 = [v12 memoryLimits];
    unsigned __int8 v28 = [a1 strength];
    v15 = [a1 category];
    uint64_t v16 = [v14 memoryLimitForCategory:v15 strength:&v28];

    if (v9 == v16)
    {
      unsigned int v17 = v28;
      unsigned int v18 = [v7 memoryLimitStrength];
      if (v17 <= v18) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = v17;
      }
      [v7 setMemoryLimitStrength:v19];
    }
    else if (v9 < (int)v16)
    {
      v20 = [a1 category];
      [v7 setMemoryLimitCategory:v20];

      [v7 setMemoryLimitStrength:v28];
      [v7 setMemoryLimit:v16];
    }
    v21 = rbs_assertion_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v27 = [a1 category];
      int v24 = [v7 memoryLimit];
      v25 = [v8 assertion];
      v26 = [v25 identifier];
      *(_DWORD *)buf = 138413570;
      v30 = v12;
      __int16 v31 = 1024;
      int v32 = v9;
      __int16 v33 = 1024;
      int v34 = v16;
      __int16 v35 = 2112;
      v36 = v27;
      __int16 v37 = 1024;
      int v38 = v24;
      __int16 v39 = 2112;
      v40 = v26;
      _os_log_debug_impl(&dword_226AB3000, v21, OS_LOG_TYPE_DEBUG, "%@: StateLimit %d, attributeLimit %d(%@) -> %d (%@)", buf, 0x32u);
    }
    goto LABEL_14;
  }
  v13 = [v8 assertion];
  v12 = objc_msgSend(v13, "lock_targetProcessForAbstract");

  if (v12) {
    goto LABEL_4;
  }
  v12 = rbs_assertion_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v22 = [v8 assertion];
    v23 = [v22 identifier];
    *(_DWORD *)buf = 138412290;
    v30 = v23;
    _os_log_impl(&dword_226AB3000, v12, OS_LOG_TYPE_INFO, "applying Base Memory Grant to process state without concrete target (%@)", buf, 0xCu);
  }
LABEL_14:
}

@end