@interface PLMAVBBMetricUtility
+ (BOOL)isInvalidMetricIdTag:(id)a3 forClass:(Class)a4;
+ (id)convertToStringData:(id)a3;
@end

@implementation PLMAVBBMetricUtility

+ (id)convertToStringData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:2 * v4];
  id v6 = v3;
  uint64_t v7 = [v6 bytes];
  if (v4)
  {
    v8 = (unsigned __int8 *)v7;
    do
    {
      unsigned int v9 = *v8++;
      objc_msgSend(v5, "appendFormat:", @"%02x", v9);
      --v4;
    }
    while (v4);
  }

  return v5;
}

+ (BOOL)isInvalidMetricIdTag:(id)a3 forClass:(Class)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EBD5B5F0 != -1) {
    dispatch_once(&qword_1EBD5B5F0, block);
  }
  uint64_t v7 = [(id)qword_1EBD5B5E8 objectForKey:v6];
  if (v7)
  {
    v8 = (void *)v7;
    unsigned int v9 = NSStringFromClass(a4);
    v10 = [(id)qword_1EBD5B5E8 objectForKey:v6];
    uint64_t v11 = [v9 compare:v10];

    if (!v11)
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_21;
      }
      uint64_t v22 = objc_opt_class();
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_108;
      v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v29[4] = v22;
      if (qword_1EBD5B600 != -1) {
        dispatch_once(&qword_1EBD5B600, v29);
      }
      if (!byte_1EBD5B5E1)
      {
LABEL_21:
        BOOL v21 = 1;
        goto LABEL_22;
      }
      v15 = [NSString stringWithFormat:@"*** invalid metricId tag ***"];
      v23 = (void *)MEMORY[0x1E4F929B8];
      v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetricUtility.m"];
      v25 = [v24 lastPathComponent];
      v26 = [NSString stringWithUTF8String:"+[PLMAVBBMetricUtility isInvalidMetricIdTag:forClass:]"];
      [v23 logMessage:v15 fromFile:v25 fromFunction:v26 fromLineNumber:77];

      v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v15;
        _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      BOOL v21 = 1;
      goto LABEL_20;
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_114;
    v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v28[4] = v12;
    if (qword_1EBD5B608 != -1) {
      dispatch_once(&qword_1EBD5B608, v28);
    }
    if (byte_1EBD5B5E2)
    {
      v13 = NSString;
      v14 = NSStringFromClass(a4);
      v15 = [v13 stringWithFormat:@"supported metricId tag: %@ for class: %@", v6, v14];

      v16 = (void *)MEMORY[0x1E4F929B8];
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetricUtility.m"];
      v18 = [v17 lastPathComponent];
      v19 = [NSString stringWithUTF8String:"+[PLMAVBBMetricUtility isInvalidMetricIdTag:forClass:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:81];

      v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v15;
        _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      BOOL v21 = 0;
LABEL_20:

      goto LABEL_22;
    }
  }
  BOOL v21 = 0;
LABEL_22:

  return v21;
}

void __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke()
{
  v17[40] = *MEMORY[0x1E4F143B8];
  v16[0] = &unk_1F29E1828;
  v16[1] = &unk_1F29E1840;
  v17[0] = @"cellularPowerLogProfileTriggerCount";
  v17[1] = @"CellularPowerLogHistogram";
  v16[2] = &unk_1F29E1858;
  v16[3] = &unk_1F29E1870;
  v17[2] = @"CellularPowerLogHistogram";
  v17[3] = @"CellularPowerLogHistogram";
  v16[4] = &unk_1F29E1888;
  v16[5] = &unk_1F29E18A0;
  v17[4] = @"CellularPowerLogHistogram";
  v17[5] = @"CellularPowerLogHistogram";
  v16[6] = &unk_1F29E18B8;
  v16[7] = &unk_1F29E18D0;
  v17[6] = @"CellularPowerLogHistogram";
  v17[7] = @"CellularPowerLogHistogram";
  v16[8] = &unk_1F29E18E8;
  v16[9] = &unk_1F29E1900;
  v17[8] = @"CellularPowerLogLTECarrierComponentInfo";
  v17[9] = @"CellularPowerLogHistogram";
  v16[10] = &unk_1F29E1918;
  v16[11] = &unk_1F29E1930;
  v17[10] = @"CellularPowerLogHistogram";
  v17[11] = @"CellularPowerLogHistogram";
  v16[12] = &unk_1F29E1948;
  v16[13] = &unk_1F29E1960;
  v17[12] = @"CellularPowerLogHistogram";
  v17[13] = @"CellularPowerLogHistogram";
  v16[14] = &unk_1F29E1978;
  v16[15] = &unk_1F29E1990;
  v17[14] = @"CellularPowerLogHistogram";
  v17[15] = @"CellularPowerLogHistogram";
  v16[16] = &unk_1F29E19A8;
  v16[17] = &unk_1F29E19C0;
  v17[16] = @"CellularPowerLogHistogram";
  v17[17] = @"CellularPowerLogHistogram";
  v16[18] = &unk_1F29E19D8;
  v16[19] = &unk_1F29E19F0;
  v17[18] = @"CellularPowerLogHistogram";
  v17[19] = @"CellularPowerLogHistogram";
  v16[20] = &unk_1F29E1A08;
  v16[21] = &unk_1F29E1A20;
  v17[20] = @"CellularPowerLogHistogram";
  v17[21] = @"CellularPowerLogHistogram";
  v16[22] = &unk_1F29E1A38;
  v16[23] = &unk_1F29E1A50;
  v17[22] = @"CellularPowerLogHistogram";
  v17[23] = @"CellularPowerLogHistogram";
  v16[24] = &unk_1F29E1A68;
  v16[25] = &unk_1F29E1A80;
  v17[24] = @"CellularPowerLogNRCarrierComponentInfo";
  v17[25] = @"CellularPowerLogHistogram";
  v16[26] = &unk_1F29E1A98;
  v16[27] = &unk_1F29E1AB0;
  v17[26] = @"CellularPowerLogHistogram";
  v17[27] = @"CellularPowerLogHistogram";
  v16[28] = &unk_1F29E1AC8;
  v16[29] = &unk_1F29E1AE0;
  v17[28] = @"CellularPowerLogHistogram";
  v17[29] = @"CellularPowerLogHistogram";
  v16[30] = &unk_1F29E1AF8;
  v16[31] = &unk_1F29E1B10;
  v17[30] = @"CellularPowerLogHistogram";
  v17[31] = @"CellularPowerLogHistogram";
  v16[32] = &unk_1F29E1B28;
  v16[33] = &unk_1F29E1B40;
  v17[32] = @"CellularPowerLogHistogram";
  v17[33] = @"CellularPowerLogHistogram";
  v16[34] = &unk_1F29E1B58;
  v16[35] = &unk_1F29E1B70;
  v17[34] = @"CellularPowerLogHistogram";
  v17[35] = @"CellularPowerLogNRCarrierComponentInfo";
  v16[36] = &unk_1F29E1B88;
  v16[37] = &unk_1F29E1BA0;
  v17[36] = @"CellularPowerLogHistogram";
  v17[37] = @"CellularPowerLogHistogram";
  v16[38] = &unk_1F29E1BB8;
  v16[39] = &unk_1F29E1BD0;
  v17[38] = @"CellularPowerLogHistogram";
  v17[39] = @"CellularPowerLogHistogram";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:40];
  v1 = (void *)qword_1EBD5B5E8;
  qword_1EBD5B5E8 = v0;

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_99;
    uint64_t v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v13 = v2;
    if (qword_1EBD5B5F8 != -1) {
      dispatch_once(&qword_1EBD5B5F8, &block);
    }
    if (_MergedGlobals_78)
    {
      id v3 = [NSString stringWithFormat:@"%@", qword_1EBD5B5E8, block, v10, v11, v12, v13];
      uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetricUtility.m"];
      id v6 = [v5 lastPathComponent];
      uint64_t v7 = [NSString stringWithUTF8String:"+[PLMAVBBMetricUtility isInvalidMetricIdTag:forClass:]_block_invoke_2"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:73];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_99(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_78 = result;
  return result;
}

uint64_t __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_108(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B5E1 = result;
  return result;
}

uint64_t __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_114(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5B5E2 = result;
  return result;
}

@end