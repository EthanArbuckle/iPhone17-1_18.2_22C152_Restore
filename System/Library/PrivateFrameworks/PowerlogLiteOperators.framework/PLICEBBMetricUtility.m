@interface PLICEBBMetricUtility
+ (BOOL)isInvalidMetricIdTag:(id)a3 forClass:(Class)a4;
+ (id)convertToStringData:(id)a3;
@end

@implementation PLICEBBMetricUtility

+ (BOOL)isInvalidMetricIdTag:(id)a3 forClass:(Class)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EBD5C490 != -1) {
    dispatch_once(&qword_1EBD5C490, block);
  }
  uint64_t v7 = [(id)qword_1EBD5C488 objectForKey:v6];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = NSStringFromClass(a4);
    v10 = [(id)qword_1EBD5C488 objectForKey:v6];
    uint64_t v11 = [v9 compare:v10];

    if (!v11)
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_21;
      }
      uint64_t v22 = objc_opt_class();
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_130;
      v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v29[4] = v22;
      if (qword_1EBD5C4A0 != -1) {
        dispatch_once(&qword_1EBD5C4A0, v29);
      }
      if (!byte_1EBD5C481)
      {
LABEL_21:
        BOOL v21 = 1;
        goto LABEL_22;
      }
      v15 = [NSString stringWithFormat:@"*** invalid metricId tag ***"];
      v23 = (void *)MEMORY[0x1E4F929B8];
      v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetricUtility.m"];
      v25 = [v24 lastPathComponent];
      v26 = [NSString stringWithUTF8String:"+[PLICEBBMetricUtility isInvalidMetricIdTag:forClass:]"];
      [v23 logMessage:v15 fromFile:v25 fromFunction:v26 fromLineNumber:74];

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
    v28[2] = __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_136;
    v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v28[4] = v12;
    if (qword_1EBD5C4A8 != -1) {
      dispatch_once(&qword_1EBD5C4A8, v28);
    }
    if (byte_1EBD5C482)
    {
      v13 = NSString;
      v14 = NSStringFromClass(a4);
      v15 = [v13 stringWithFormat:@"supported metricId tag: %@ for class: %@", v6, v14];

      v16 = (void *)MEMORY[0x1E4F929B8];
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetricUtility.m"];
      v18 = [v17 lastPathComponent];
      v19 = [NSString stringWithUTF8String:"+[PLICEBBMetricUtility isInvalidMetricIdTag:forClass:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:78];

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

void __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke()
{
  v17[39] = *MEMORY[0x1E4F143B8];
  v16[0] = &unk_1F29E6FB8;
  v16[1] = &unk_1F29E6FD0;
  v17[0] = @"KCellularPerClientProfileTriggerCount";
  v17[1] = @"KCellularProtocolStackHist";
  v16[2] = &unk_1F29E6FE8;
  v16[3] = &unk_1F29E7000;
  v17[2] = @"KCellularPeripheralStats";
  v17[3] = @"KCellularProtocolStackHist";
  v16[4] = &unk_1F29E7018;
  v16[5] = &unk_1F29E7030;
  v17[4] = @"KCellularProtocolStackHist";
  v17[5] = @"KCellularProtocolStackHist";
  v16[6] = &unk_1F29E7048;
  v16[7] = &unk_1F29E7060;
  v17[6] = @"KCellularProtocolStackHist";
  v17[7] = @"KCellularLteFwDuplexMode";
  v16[8] = &unk_1F29E7078;
  v16[9] = &unk_1F29E7090;
  v17[8] = @"KCellularRrcModeHist";
  v17[9] = @"KCellularRrcModeHist";
  v16[10] = &unk_1F29E70A8;
  v16[11] = &unk_1F29E70C0;
  v17[10] = @"KCellularRrcModeHist";
  v17[11] = @"KCellularProtocolStackHist";
  v16[12] = &unk_1F29E70D8;
  v16[13] = &unk_1F29E70F0;
  v17[12] = @"KCellularProtocolStackHist";
  v17[13] = @"KCellularProtocolStackHist";
  v16[14] = &unk_1F29E7108;
  v16[15] = &unk_1F29E7120;
  v17[14] = @"KCellularProtocolStackHist";
  v17[15] = @"KCellularLteComponentCarrierInfo";
  v16[16] = &unk_1F29E7138;
  v16[17] = &unk_1F29E7150;
  v17[16] = @"KCellularProtocolStackHist";
  v17[17] = @"KCellularProtocolStackHist";
  v16[18] = &unk_1F29E7168;
  v16[19] = &unk_1F29E7180;
  v17[18] = @"KCellularProtocolStackHist";
  v17[19] = @"KCellularProtocolStackHist";
  v16[20] = &unk_1F29E7198;
  v16[21] = &unk_1F29E71B0;
  v17[20] = @"KCellularLteCdrxConfig";
  v17[21] = @"kCellularLteRadioLinkFailure";
  v16[22] = &unk_1F29E71C8;
  v16[23] = &unk_1F29E71E0;
  v17[22] = @"KCellularProtocolStackHist";
  v17[23] = @"KCellularCellPlmnSearchCount";
  v16[24] = &unk_1F29E71F8;
  v16[25] = &unk_1F29E7210;
  v17[24] = @"KCellularProtocolStackHist";
  v17[25] = @"KCellularProtocolStackPowerState";
  v16[26] = &unk_1F29E7228;
  v16[27] = &unk_1F29E7240;
  v17[26] = @"KCellularServingCellLost";
  v17[27] = @"KCellularWcdmaCpcStat";
  v16[28] = &unk_1F29E7258;
  v16[29] = &unk_1F29E7270;
  v17[28] = @"KCellularRrcModeHist";
  v17[29] = @"KCellularRrcModeHist";
  v16[30] = &unk_1F29E7288;
  v16[31] = &unk_1F29E72A0;
  v17[30] = @"KCellularRrcModeHist";
  v17[31] = @"KCellularRrcModeHist";
  v16[32] = &unk_1F29E72B8;
  v16[33] = &unk_1F29E72D0;
  v17[32] = @"KCellularRrcModeHist";
  v17[33] = @"KCellularProtocolStackHist";
  v16[34] = &unk_1F29E72E8;
  v16[35] = &unk_1F29E7300;
  v17[34] = @"KCellularProtocolStackHist";
  v17[35] = @"KCellularProtocolStackHist";
  v16[36] = &unk_1F29E7318;
  v16[37] = &unk_1F29E7330;
  v17[36] = @"KCellularProtocolStackHist";
  v17[37] = @"KCellularProtocolStackHist";
  v16[38] = &unk_1F29E7348;
  v17[38] = @"KCellularProtocolStackHist";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:39];
  v1 = (void *)qword_1EBD5C488;
  qword_1EBD5C488 = v0;

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_121;
    uint64_t v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v13 = v2;
    if (qword_1EBD5C498 != -1) {
      dispatch_once(&qword_1EBD5C498, &block);
    }
    if (_MergedGlobals_106)
    {
      v3 = [NSString stringWithFormat:@"%@", qword_1EBD5C488, block, v10, v11, v12, v13];
      v4 = (void *)MEMORY[0x1E4F929B8];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetricUtility.m"];
      id v6 = [v5 lastPathComponent];
      uint64_t v7 = [NSString stringWithUTF8String:"+[PLICEBBMetricUtility isInvalidMetricIdTag:forClass:]_block_invoke_2"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:70];

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

uint64_t __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_121(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_106 = result;
  return result;
}

uint64_t __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_130(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C481 = result;
  return result;
}

uint64_t __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_136(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C482 = result;
  return result;
}

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

@end