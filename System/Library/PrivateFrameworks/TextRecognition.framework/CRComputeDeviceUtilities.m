@interface CRComputeDeviceUtilities
+ (id)allComputeDevices;
+ (id)computeDevices:(id)a3 ofTypes:(unint64_t)a4;
+ (int64_t)mlComputeUnitFromComputeDeviceType:(unint64_t)a3;
+ (unint64_t)computeDeviceTypeForOptions:(id)a3 mtlDevice:(id *)a4;
@end

@implementation CRComputeDeviceUtilities

+ (id)allComputeDevices
{
  if (qword_1EB58CC90 != -1) {
    dispatch_once(&qword_1EB58CC90, &__block_literal_global_27);
  }
  v2 = (void *)_MergedGlobals_27;
  return v2;
}

void __45__CRComputeDeviceUtilities_allComputeDevices__block_invoke()
{
  uint64_t v0 = MLAllComputeDevices();
  v1 = (void *)_MergedGlobals_27;
  _MergedGlobals_27 = v0;
}

+ (id)computeDevices:(id)a3 ofTypes:(unint64_t)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CRComputeDeviceUtilities_computeDevices_ofTypes___block_invoke;
  v8[3] = &__block_descriptor_40_e42_B32__0___MLComputeDeviceProtocol__8Q16_B24l;
  v8[4] = a4;
  id v4 = a3;
  v5 = [v4 indexesOfObjectsPassingTest:v8];
  v6 = [v4 objectsAtIndexes:v5];

  return v6;
}

BOOL __51__CRComputeDeviceUtilities_computeDevices_ofTypes___block_invoke(uint64_t a1, void *a2)
{
  return ([a2 _crComputeDeviceType] & ~*(void *)(a1 + 32)) == 0;
}

+ (unint64_t)computeDeviceTypeForOptions:(id)a3 mtlDevice:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"CRImageReaderRestrictToCPUKey"];
  unsigned int v7 = [v6 BOOLValue];

  v8 = [v5 objectForKeyedSubscript:@"CRImageReaderMTLDeviceKey"];

  if (v8)
  {
    v9 = [v5 objectForKeyedSubscript:@"CRImageReaderMTLDeviceKey"];
    uint64_t v10 = 2;
  }
  else
  {
    v9 = 0;
    uint64_t v10 = v7;
  }
  v11 = [v5 objectForKeyedSubscript:@"CRImageReaderComputeDeviceKey"];

  if (!v11)
  {
    unint64_t v14 = v10;
    if (!a4) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  v12 = [v5 objectForKeyedSubscript:@"CRImageReaderComputeDeviceKey"];
  uint64_t v13 = [v12 _crComputeDeviceType];
  unint64_t v14 = v13;
  if (v10) {
    BOOL v15 = v10 == v13;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    v16 = CROSLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      int v21 = 134218496;
      unint64_t v22 = v14;
      __int16 v23 = 2048;
      uint64_t v24 = v10;
      __int16 v25 = 2048;
      unint64_t v26 = v14;
      _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_FAULT, "Conflicting request configuration. %lu vs. %lu. Selecting %lu", (uint8_t *)&v21, 0x20u);
    }
  }
  if (v14 == 2)
  {
    uint64_t v17 = [v12 metalDevice];
    v18 = (void *)v17;
    if (v9 && (void *)v17 != v9)
    {
      v19 = CROSLogForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        int v21 = 138412802;
        unint64_t v22 = (unint64_t)v9;
        __int16 v23 = 2112;
        uint64_t v24 = (uint64_t)v18;
        __int16 v25 = 2112;
        unint64_t v26 = (unint64_t)v18;
        _os_log_impl(&dword_1DD733000, v19, OS_LOG_TYPE_FAULT, "Conflicting requested configuration. Metal device passed (%@) does not match computeDevice's device (%@). Using %@", (uint8_t *)&v21, 0x20u);
      }
    }
    v9 = v18;
  }

  if (a4)
  {
LABEL_22:
    if (v9) {
      *a4 = v9;
    }
  }
LABEL_24:

  return v14;
}

+ (int64_t)mlComputeUnitFromComputeDeviceType:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    return 2;
  }
  else {
    return a3 - 1;
  }
}

@end