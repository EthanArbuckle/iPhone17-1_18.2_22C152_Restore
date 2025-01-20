@interface PDControllerType5
+ (id)createForDecode;
+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4;
- (NSDictionary)registerConfigs;
- (PDControllerType5)initWithAddress:(unsigned __int8)a3 userClient:(id)a4;
- (id)readFullVersion;
- (id)registerFormatter8ByteVersionWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterADCResultsWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterBootFlagsWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterCFDebugConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterCFSOPUVDMEnumWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterCFVIDConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterCFVIDStatusWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterFWStateConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterGenericWithBuffer:(void *)a3 andLength:(unint64_t)a4 andConfig:(id)a5;
- (id)registerFormatterIOConfig1WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterIOConfig2WithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterIntEventWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterIntMaskClearWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterLDCMConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterLDCMStatusWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterMuxStateWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterPD3EMIntMaskWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterPersParamsWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterPowerSwitchStateWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterSecondaryMUXInitWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterSystemConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterTBTRetimerDataWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterTXEPRSourceCapWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterUSBConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (id)registerFormatterWakeEventMaskWithBuffer:(void *)a3 andLength:(unint64_t)a4;
- (int)printAllDPMrSubcommands;
- (int)printDBStateHistory;
- (int)printTBRrIfIntelRetimerPresent;
- (void)buildRegDecodes;
- (void)setDPMrConfigs;
- (void)setRegisterConfigs:(id)a3;
@end

@implementation PDControllerType5

+ (id)createWithDeviceAddress:(unsigned __int8)a3 userClient:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithAddress:v4 userClient:v6];

  return v7;
}

+ (id)createForDecode
{
  return 0;
}

- (PDControllerType5)initWithAddress:(unsigned __int8)a3 userClient:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PDControllerType5;
  return [(PDControllerType4 *)&v5 initWithAddress:a3 userClient:a4];
}

- (id)registerFormatter8ByteVersionWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  id v7 = +[NSMutableArray array];
  v8 = [(PDController *)self registerFormatterHexDumpWithBuffer:a3 andLength:a4];
  [v7 addObjectsFromArray:v8];
  if (a4 == 8)
  {
    +[NSString stringWithFormat:@"%llX.%llX.%llX.%lld.%02lld", *(void *)a3 >> 20, (*(void *)a3 >> 8) & 0xFFFLL, *(void *)a3, BYTE4(*(void *)a3), ((unsigned __int16)WORD2(*(void *)a3) >> 8)];
  }
  else if (a4 == 4)
  {
    [v7 addObject:@"Warning: Unexpected 4-byte version register"];
    +[NSString stringWithFormat:@"%X.%X.%X (Unknown Customer Version)", *(_DWORD *)a3 >> 20, (*(_DWORD *)a3 >> 8) & 0xFFF, *(_DWORD *)a3, v13, v14];
  }
  else
  {
    +[NSString stringWithFormat:@"ERROR: Unexpected length %lld", a4, v11, v12, v13, v14];
  v9 = };
  [v7 addObject:v9];

  return v7;
}

- (int)printTBRrIfIntelRetimerPresent
{
  unint64_t v7 = 0;
  int result = [(PDController *)self registerRead:v8 ofLength:64 atAddress:42 andOutReadLength:&v7];
  if (!result)
  {
    int result = -536870160;
    if (v7 >= 8)
    {
      if ((v9 & 0xF) != 0 && (v9 & 0xF) != 14)
      {
        char v6 = 4;
        __int16 v5 = 48;
        return [(PDController *)self printCommand:1413632626 withWriteData:&v5 withWriteLength:3];
      }
    }
    else
    {
      return -536870212;
    }
  }
  return result;
}

- (int)printAllDPMrSubcommands
{
  uint64_t v27 = 0;
  v3 = (char *)malloc_type_malloc(0x40uLL, 0x9AE08903uLL);
  if (v3)
  {
    uint64_t v4 = v3;
    [(PDController *)self registerRead:v3 ofLength:64 atAddress:42 andOutReadLength:&v27];
    int v22 = *(unsigned __int16 *)(v4 + 5);
    free(v4);
  }
  else
  {
    int v22 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(PDControllerType4 *)self dpmrConfigs];
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v8);
        v10 = [(PDControllerType4 *)self dpmrConfigs];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];
        uint64_t v12 = [v11 objectForKeyedSubscript:@"mask"];
        unsigned int v13 = [v12 unsignedIntegerValue];

        uint64_t v14 = [(PDControllerType4 *)self dpmrConfigs];
        v15 = [v14 objectForKeyedSubscript:v9];
        v16 = [v15 objectForKeyedSubscript:@"match"];
        unsigned __int16 v17 = (unsigned __int16)[v16 unsignedIntegerValue];

        if ((v22 & v13) == v17)
        {
          v18 = [(PDControllerType4 *)self dpmrConfigs];
          v19 = [v18 objectForKeyedSubscript:v9];
          [(PDControllerType4 *)self printDPMrSubCommand:v9 withDeviceConfig:v19];
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  return 0;
}

- (id)registerFormatterGenericWithBuffer:(void *)a3 andLength:(unint64_t)a4 andConfig:(id)a5
{
  id v8 = a5;
  uint64_t v9 = +[NSMutableArray array];
  v68 = self;
  v10 = [(PDController *)self registerFormatterHexDumpWithBuffer:a3 andLength:a4];
  [v9 addObjectsFromArray:v10];
  uint64_t v11 = [v8 objectForKeyedSubscript:@"length"];
  id v12 = [v11 unsignedIntegerValue];

  if ((unint64_t)v12 > a4)
  {
    unsigned int v13 = +[NSString stringWithFormat:@"ERROR: length %lld < %lu", a4, v12];
    [v9 addObject:v13];

    goto LABEL_67;
  }
  unint64_t v71 = a4;
  if ((unint64_t)v12 < a4)
  {
    uint64_t v14 = +[NSString stringWithFormat:@"ERROR: length %lld > %lu, register may not be decoded correctly", a4, v12];
    [v9 addObject:v14];
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v67 = v8;
  id obj = [v8 objectForKeyedSubscript:@"fields"];
  id v15 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v73 = *(void *)v76;
    CFStringRef v17 = @"%02X";
    v69 = v9;
    v70 = (unsigned __int8 *)a3;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v76 != v73) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v18);
        uint64_t v20 = [v19 objectForKeyedSubscript:@"bit_length"];
        if (!v20) {
          goto LABEL_18;
        }
        v21 = (void *)v20;
        CFStringRef v22 = v17;
        uint64_t v23 = [v19 objectForKeyedSubscript:@"byte_offset"];
        if (!v23)
        {

LABEL_18:
          v30 = +[NSString stringWithFormat:@"Error, illegal field %@", v19];
          [v9 addObject:v30];
          goto LABEL_19;
        }
        long long v24 = (void *)v23;
        long long v25 = [v19 objectForKeyedSubscript:@"name"];

        CFStringRef v17 = v22;
        if (!v25) {
          goto LABEL_18;
        }
        long long v26 = [v19 objectForKeyedSubscript:@"bit_length"];
        id v27 = [v26 unsignedCharValue];

        v28 = [v19 objectForKeyedSubscript:@"byte_offset"];
        unsigned int v29 = [v28 unsignedCharValue];

        v30 = [v19 objectForKeyedSubscript:@"name"];
        if (v29 >= v71)
        {
          +[NSString stringWithFormat:@"Error, byte offset too large (%x)", v29, v64, v65, v66];
          v32 = LABEL_22:;
          [v9 addObject:v32];
          goto LABEL_23;
        }
        if (v27 >= 0x21)
        {
          unint64_t v31 = v29 + ((v27 + 7) >> 3);
          if (v31 > v71)
          {
            +[NSString stringWithFormat:@"Error, byte_offset + byte_length too large (error in field \"%@\", offset=%d, byte_length=%d actual_length=%d)", v30, v29, (v27 + 7) >> 3, v27];
            goto LABEL_22;
          }
          v32 = +[NSMutableString stringWithUTF8String:"0x"];
          unsigned int v44 = v31 - 1;
          if (v44 >= v29)
          {
            do
              [v32 appendFormat:v22, v70[(unsigned __int16)v44--]];
            while (v29 <= (unsigned __int16)v44);
          }
          v45 = [(PDControllerType4 *)v68 stringForTitle:v30 valueString:v32];
          [v9 addObject:v45];

LABEL_23:
          CFStringRef v17 = v22;
          goto LABEL_19;
        }
        unint64_t v74 = *(void *)&v70[v29];
        v33 = [v19 objectForKeyedSubscript:@"bit_shift"];

        if (v33)
        {
          v34 = [v19 objectForKeyedSubscript:@"bit_shift"];
          unsigned __int8 v35 = [v34 unsignedIntegerValue];
          v74 >>= v35;
        }
        v74 &= ~(-1 << (char)v27);
        v36 = [v19 objectForKeyedSubscript:@"show_only_when_nonzero"];

        if (!v36
          || ([v19 objectForKeyedSubscript:@"show_only_when_nonzero"],
              v37 = objc_claimAutoreleasedReturnValue(),
              unsigned int v38 = [v37 BOOLValue],
              unint64_t v39 = v74,
              v37,
              !v38)
          || v39)
        {
          v40 = [v19 objectForKeyedSubscript:@"values"];

          if (v40)
          {
            uint64_t v41 = v74;
            v42 = [v19 objectForKeyedSubscript:@"values"];
            uint64_t v43 = [(PDControllerType4 *)v68 stringForTitle:v30 value:v41 table:v42];
          }
          else
          {
            if (v27 > 4)
            {
              if (v27 > 8)
              {
                if (v27 > 0x10)
                {
                  if (v27 > 0x18) {
                    +[NSString stringWithFormat:@"0x%08llX", v74];
                  }
                  else {
                    +[NSString stringWithFormat:@"0x%06X", v74];
                  }
                }
                else
                {
                  +[NSString stringWithFormat:@"0x%04X", (unsigned __int16)v74];
                }
              }
              else
              {
                +[NSString stringWithFormat:@"0x%02X", v74];
              }
            }
            else
            {
              +[NSString stringWithFormat:@"0x%X", v74];
            v42 = };
            uint64_t v43 = [(PDControllerType4 *)v68 stringForTitle:v30 valueString:v42];
          }
          v46 = (void *)v43;

          v47 = [v19 objectForKeyedSubscript:@"formatter"];

          if (v47)
          {
            [v69 addObject:v46];
            v48 = [v19 objectForKeyedSubscript:@"formatter"];
            v49 = ((void (**)(void, unint64_t *))v48)[2](v48, &v74);
            [v69 addObjectsFromArray:v49];

LABEL_63:
            goto LABEL_64;
          }
          v50 = [v19 objectForKeyedSubscript:@"unit"];

          if (v50)
          {
            v51 = [v19 objectForKeyedSubscript:@"signed"];

            if (v51)
            {
              if (v27 == 16)
              {
                int v52 = (__int16)v74;
LABEL_55:
                float v57 = (float)v52;
              }
              else
              {
                if (v27 == 8)
                {
                  int v52 = (char)v74;
                  goto LABEL_55;
                }
                float v57 = (float)(int)v74;
              }
            }
            else
            {
              float v57 = (float)v74;
            }
            v58 = [v19 objectForKeyedSubscript:@"unit"];
            [v58 floatValue];
            float v60 = v59;

            v61 = [v19 objectForKeyedSubscript:@"unit_str"];
            if (v61)
            {
              v54 = [v19 objectForKeyedSubscript:@"unit_str"];
            }
            else
            {
              v54 = &stru_1000186C8;
            }

            uint64_t v56 = +[NSString stringWithFormat:@"%@ [%0.3f %@]", v46, (float)(v60 * v57), v54];
LABEL_61:

            v46 = (void *)v56;
          }
          else
          {
            v53 = [v19 objectForKeyedSubscript:@"formula"];

            if (v53)
            {
              v54 = [v19 objectForKeyedSubscript:@"formula"];
              uint64_t v55 = ((void (*)(__CFString *, unint64_t *))v54->data)(v54, &v74);
              uint64_t v56 = +[NSString stringWithFormat:@"%@ [%@]", v46, v55];

              v46 = (void *)v55;
              goto LABEL_61;
            }
          }
          [v69 addObject:v46];
          goto LABEL_63;
        }
LABEL_64:
        CFStringRef v17 = v22;
        uint64_t v9 = v69;
LABEL_19:

        v18 = (char *)v18 + 1;
      }
      while (v18 != v16);
      id v62 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
      id v16 = v62;
    }
    while (v62);
  }

  id v8 = v67;
LABEL_67:

  return v9;
}

- (id)registerFormatterIntEventWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AA18];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AA18];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CAE8;
  }

  return v11;
}

- (id)registerFormatterIntMaskClearWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AA30];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AA30];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CB00;
  }

  return v11;
}

- (id)registerFormatterWakeEventMaskWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AA48];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AA48];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CB18;
  }

  return v11;
}

- (id)registerFormatterUSBConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AA60];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AA60];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CB30;
  }

  return v11;
}

- (id)registerFormatterIOConfig1WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AA78];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AA78];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CB48;
  }

  return v11;
}

- (id)registerFormatterIOConfig2WithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AA90];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AA90];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CB60;
  }

  return v11;
}

- (id)registerFormatterPD3EMIntMaskWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AAA8];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AAA8];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CB78;
  }

  return v11;
}

- (id)registerFormatterPersParamsWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AAC0];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AAC0];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CB90;
  }

  return v11;
}

- (id)registerFormatterBootFlagsWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AAD8];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AAD8];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CBA8;
  }

  return v11;
}

- (id)registerFormatterCFVIDStatusWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AAF0];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AAF0];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CBC0;
  }

  return v11;
}

- (id)registerFormatterPowerSwitchStateWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = +[NSMutableArray array];
  id v8 = [(PDController *)self registerFormatterHexDumpWithBuffer:a3 andLength:a4];
  [v7 addObjectsFromArray:v8];
  if (a4 == 44 || a4 == 20)
  {
    v15.receiver = self;
    v15.super_class = (Class)PDControllerType5;
    uint64_t v9 = [(PDControllerType5 *)&v15 registerFormatterPowerSwitchStateWithBuffer:a3 andLength:a4];
  }
  else
  {
    v10 = [(PDControllerType5 *)self registerConfigs];
    uint64_t v11 = [v10 objectForKeyedSubscript:&off_10001AB08];

    if (v11)
    {
      id v12 = [(PDControllerType5 *)self registerConfigs];
      unsigned int v13 = [v12 objectForKeyedSubscript:&off_10001AB08];
      uint64_t v9 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v13];
    }
    else
    {
      uint64_t v9 = &off_10001CBD8;
    }
  }

  return v9;
}

- (id)registerFormatterADCResultsWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AB20];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AB20];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CBF0;
  }

  return v11;
}

- (id)registerFormatterMuxStateWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFBLL) == 8)
  {
    v13.receiver = self;
    v13.super_class = (Class)PDControllerType5;
    uint64_t v7 = [(PDControllerType5 *)&v13 registerFormatterMuxStateWithBuffer:a3 andLength:a4];
  }
  else
  {
    id v8 = [(PDControllerType5 *)self registerConfigs];
    uint64_t v9 = [v8 objectForKeyedSubscript:&off_10001AB38];

    if (v9)
    {
      v10 = [(PDControllerType5 *)self registerConfigs];
      uint64_t v11 = [v10 objectForKeyedSubscript:&off_10001AB38];
      uint64_t v7 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v11];
    }
    else
    {
      uint64_t v7 = &off_10001CC08;
    }
  }

  return v7;
}

- (id)registerFormatterLDCMConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AB50];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AB50];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CC20;
  }

  return v11;
}

- (id)registerFormatterLDCMStatusWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AB68];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AB68];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CC38;
  }

  return v11;
}

- (id)registerFormatterFWStateConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AB80];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AB80];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CC50;
  }

  return v11;
}

- (id)registerFormatterSystemConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001AB98];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001AB98];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CC68;
  }

  return v11;
}

- (id)registerFormatterCFSOPUVDMEnumWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001ABB0];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001ABB0];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CC80;
  }

  return v11;
}

- (id)registerFormatterTXEPRSourceCapWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001ABC8];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001ABC8];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CC98;
  }

  return v11;
}

- (id)registerFormatterTBTRetimerDataWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = [(PDControllerType5 *)self registerConfigs];
  id v8 = [v7 objectForKeyedSubscript:&off_10001ABE0];

  if (v8)
  {
    uint64_t v9 = [(PDControllerType5 *)self registerConfigs];
    v10 = [v9 objectForKeyedSubscript:&off_10001ABE0];
    uint64_t v11 = [(PDControllerType5 *)self registerFormatterGenericWithBuffer:a3 andLength:a4 andConfig:v10];
  }
  else
  {
    uint64_t v11 = &off_10001CCB0;
  }

  return v11;
}

- (id)readFullVersion
{
  unint64_t v11 = 0;
  v3 = (uint64_t *)malloc_type_malloc(0x40uLL, 0x391A0DB7uLL);
  if (!v3) {
    goto LABEL_5;
  }
  uint64_t v4 = v3;
  unsigned int v5 = [(PDController *)self registerRead:v3 ofLength:64 atAddress:15 andOutReadLength:&v11];
  id v6 = &stru_1000186C8;
  if (!v5 && v11 <= 8)
  {
    uint64_t v7 = *v4;
    char v10 = 0;
    uint64_t v9 = 0;
    if ([(PDController *)self registerRead:&v10 ofLength:1 atAddress:44 andOutReadLength:&v9])
    {
LABEL_5:
      id v6 = &stru_1000186C8;
      goto LABEL_6;
    }
    id v6 = +[NSString stringWithFormat:@"%X.%X.%X.%d.%d", v7 >> 20, (v7 >> 8) & 0xFFF, v7, BYTE4(v7), BYTE5(v7)];
  }
LABEL_6:

  return v6;
}

- (id)registerFormatterCFVIDConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  v16.receiver = self;
  v16.super_class = (Class)PDControllerType5;
  unsigned int v5 = [(PDControllerType5 *)&v16 registerFormatterCFVIDConfigWithBuffer:a3 andLength:a4];
  id v6 = [v5 mutableCopy];

  if ([v6 count])
  {
    for (unint64_t i = 0; (unint64_t)[v6 count] > i; ++i)
    {
      id v8 = [v6 objectAtIndex:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v6 objectAtIndex:i];
        unsigned int v10 = [v9 containsString:@"DFUfSetDBF"];

        if (v10)
        {
          unint64_t v11 = [v6 objectAtIndex:i];
          unsigned int v12 = [v11 containsString:@"0x1"];

          if (v12) {
            CFStringRef v13 = @"DFUf entry sets No-VIN flag. (0x1)";
          }
          else {
            CFStringRef v13 = @"DFUf does not affect No-VIN flag. (0x0)";
          }
          uint64_t v14 = [(PDControllerType4 *)self stringForTitle:@"DFUfSetNVF" valueString:v13];
          [v6 replaceObjectAtIndex:i withObject:v14];

          break;
        }
      }
      else
      {
      }
    }
  }

  return v6;
}

- (id)registerFormatterCFDebugConfigWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = +[NSMutableArray array];
  v97 = self;
  id v8 = [(PDController *)self registerFormatterHexDumpWithBuffer:a3 andLength:a4];
  [v7 addObjectsFromArray:v8];
  if (a4 < 0x41)
  {
    if (a4 != 64)
    {
      long long v77 = +[NSString stringWithFormat:@"ERROR: length %lld < 64", a4];
      [v7 addObject:v77];

      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v9 = +[NSString stringWithFormat:@"ERROR: Unexpected length, may not be decoded properly."];
    [v7 addObject:v9];
  }
  v88 = v8;
  v109[0] = &off_10001ABF8;
  v109[1] = &off_10001AC10;
  v110[0] = @"Reboot Ace (equivalent to 'Gaid' 4CC). (0x00)";
  v110[1] = @"RESET_REQ. (0x01)";
  v109[2] = &off_10001AC28;
  v109[3] = &off_10001AC40;
  v110[2] = @"DFU_REQ. (0x02)";
  v110[3] = @"DBG_EN. (0x03)";
  v109[4] = &off_10001AC58;
  v110[4] = @"DFU Ace (0x04)";
  v94 = +[NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:5];
  v107[0] = &off_10001AC10;
  v107[1] = &off_10001AC28;
  v108[0] = @"Action. (0x01)";
  v108[1] = @"SWD. (0x02)";
  v107[2] = &off_10001AC40;
  v107[3] = &off_10001AC58;
  v108[2] = @"UART. (0x03)";
  v108[3] = @"DigitalIO. (0x04)";
  v107[4] = &off_10001AC70;
  v107[5] = &off_10001AC88;
  v108[4] = @"DCI-BSSB. (0x05)";
  v108[5] = @"USB. (0x06)";
  v107[6] = &off_10001ACA0;
  v107[7] = &off_10001ACB8;
  v108[6] = @"DCI-DbC. (0x07)";
  v108[7] = @"I2C. (0x08)";
  v107[8] = &off_10001ACD0;
  v107[9] = &off_10001ACE8;
  v108[8] = @"DisplayPort. (0x09)";
  v108[9] = @"AID. (0x0A)";
  v107[10] = &off_10001AD00;
  v107[11] = &off_10001AD18;
  v108[10] = @"AnalogIO. (0x0B)";
  v108[11] = @"2Wire-BSSB. (0x0C)";
  v107[12] = &off_10001AD30;
  v107[13] = &off_10001AD48;
  v108[12] = @"2Wire-MADI. (0x0D)";
  v108[13] = @"KIS (USB). (0x46)";
  v90 = +[NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:14];
  v105[0] = &off_10001ABF8;
  v105[1] = &off_10001AC10;
  v106[0] = @"Ace AUX. (0x00)";
  v106[1] = @"Ace USB_RP1. (0x01)";
  v105[2] = &off_10001AC28;
  v105[3] = &off_10001AC40;
  v106[2] = @"Ace USB_RP2. (0x02)";
  v106[3] = @"Ace USB_RP3. (0x03)";
  v105[4] = &off_10001AC58;
  v105[5] = &off_10001AC70;
  v106[4] = @"USB3 Normal Mode. (0x04)";
  v106[5] = @"Ace Internal SWD. (0x05)";
  v106[6] = @"Ace DEBUG0/1 (Analog). (0x06)";
  v106[7] = @"Ace DEBUG2/3 (Analog). (0x07)";
  v106[8] = @"Ace DEBUG4/5 (Analog). (0x08)";
  v106[9] = @"Ace DEBUG6/7 (Analog). (0x09)";
  v106[10] = @"Ace Internal UART. (0x0A)";
  v106[11] = @"Ace I2C1. (0x0B)";
  v105[12] = &off_10001AD18;
  v105[13] = &off_10001AD60;
  v106[12] = @"Ace I2C2/SPMI. (0x0C)";
  v106[13] = @"Debug MUX DCI. (0x12)";
  v105[14] = &off_10001AD78;
  v105[15] = &off_10001AA18;
  v106[14] = @"Debug MUX SWD. (0x13)";
  v106[15] = @"Debug MUX UART/DM2 USB. (0x14)";
  v105[16] = &off_10001AD90;
  v105[17] = &off_10001AA30;
  v106[16] = @"Ace Debug Serial Output. (0x15)";
  v106[17] = @"Ace DEBUG0-3 DCI. (0x16)";
  v105[18] = &off_10001ADA8;
  v105[19] = &off_10001ADC0;
  v106[18] = @"Ace DEBUG4-7 DCI. (0x17)";
  v106[19] = @"Ace DEBUG0/1 (Digital). (0x18)";
  v105[20] = &off_10001ADD8;
  v105[21] = &off_10001ADF0;
  v106[20] = @"Ace DEBUG2/3 (Digital). (0x19)";
  v106[21] = @"Ace DEBUG4/5 (Digital). (0x1A)";
  v105[22] = &off_10001AE08;
  v105[23] = &off_10001AE20;
  v106[22] = @"Ace DEBUG6/7 (Digital). (0x1B)";
  v106[23] = @"Ace DEBUG0/1 (Digital). (0x1C)";
  v105[6] = &off_10001AC88;
  v105[7] = &off_10001ACA0;
  v105[24] = &off_10001AE38;
  v105[25] = &off_10001AE50;
  v105[8] = &off_10001ACB8;
  v105[9] = &off_10001ACD0;
  v106[24] = @"Ace DEBUG2/3 (Digital). (0x1D)";
  v106[25] = @"Ace DEBUG4/5 (Digital). (0x1E)";
  v105[10] = &off_10001ACE8;
  v105[11] = &off_10001AD00;
  v105[26] = &off_10001AE68;
  v106[26] = @"Ace DEBUG6/7 (Digital). (0x1F)";
  v89 = +[NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:27];
  v104[0] = @"SMC. (0x01)";
  v104[1] = @"PCH/MCP. (0x02)";
  v103[0] = &off_10001AC10;
  v103[1] = &off_10001AC28;
  v104[2] = @"PDMicro1. (0x03)";
  v104[3] = @"Mojo. (0x04)";
  v103[2] = &off_10001AC40;
  v103[3] = &off_10001AC58;
  v103[4] = &off_10001AC70;
  v103[5] = &off_10001AC88;
  v104[4] = @"PMU. (0x05)";
  v104[5] = @"SoC. (0x06)";
  v103[6] = &off_10001ACA0;
  v103[7] = &off_10001ACB8;
  v104[6] = @"Baseband. (0x07)";
  v104[7] = @"SSD. (0x08)";
  v103[8] = &off_10001ACD0;
  v103[9] = &off_10001ACE8;
  v104[8] = @"PDMicro2. (0x09)";
  v104[9] = @"HID. (0x0A)";
  v103[10] = &off_10001AD00;
  v103[11] = &off_10001AD18;
  v104[10] = @"KIS. (0x0B)";
  v104[11] = @"MCU. (0x0C)";
  v103[12] = &off_10001AD30;
  v103[13] = &off_10001AE80;
  v104[12] = @"Tristar+KIS Magic. (0x0D)";
  v104[13] = @"Fan_01. (0x0E)";
  v103[14] = &off_10001AE98;
  v103[15] = &off_10001AEB0;
  v104[14] = @"Fan_23. (0x0F)";
  v104[15] = @"Camera. (0x10)";
  v103[16] = &off_10001AEC8;
  v104[16] = @"LDCM. (0x11)";
  v91 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:17];
  v102[0] = @"Pairs. (0x01)";
  v102[1] = @"Voltage. (0x02)";
  v101[0] = &off_10001AC10;
  v101[1] = &off_10001AC28;
  v101[2] = &off_10001AC40;
  v101[3] = &off_10001AC58;
  v102[2] = @"Clock/MHz. (0x03)";
  v102[3] = @"Clock/Multiplier. (0x04)";
  v101[4] = &off_10001AC70;
  v101[5] = &off_10001AEE0;
  v102[4] = @"Orientation. (0x05)";
  v102[5] = @"Options/[Signal]. (0x80)";
  v101[6] = &off_10001AEF8;
  v102[6] = @"Options/UART. (0x81)";
  v93 = +[NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:7];
  uint64_t v10 = 0;
  unsigned __int8 v11 = 1;
  while (2)
  {
    uint64_t v12 = 0;
    uint64_t v98 = v11;
    uint64_t v92 = (int)v10;
    if ((int)v10 <= 64) {
      uint64_t v13 = 64;
    }
    else {
      uint64_t v13 = v10;
    }
    v95 = (char *)a3 + (int)v10;
    uint64_t v96 = v13 - (int)v10;
    uint64_t v14 = v10 << 32;
    do
    {
      if (v96 == v12) {
        goto LABEL_33;
      }
      uint64_t v15 = v95[v12];
      if (!v95[v12])
      {
        long long v75 = +[NSString stringWithFormat:@"0x%X (byte 0x%X)", 0, v12 + v92 + 1];
        long long v76 = [(PDControllerType4 *)v97 stringForTitle:@"Terminator Record" valueString:v75];
        [v7 addObject:v76];

        goto LABEL_32;
      }
      objc_super v16 = +[NSString stringWithFormat:@"DC Record #%u Header", v98];
      CFStringRef v17 = +[NSString stringWithFormat:@"0x%02X", v15];
      v18 = [(PDControllerType4 *)v97 stringForTitle:v16 valueString:v17];
      [v7 addObject:v18];

      v99[0] = &off_10001ABF8;
      v99[1] = &off_10001AC10;
      v100[0] = @"Record Invalid. (0x0)";
      v100[1] = @"Ace Internal DC Record. (0x1)";
      v99[2] = &off_10001AC28;
      v99[3] = &off_10001AC40;
      v100[2] = @"Action DC Record. (0x02)";
      v100[3] = @"Signal DC Record. (0x03)";
      v19 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:4];
      unsigned int v20 = v15 >> 6;
      v21 = [(PDControllerType4 *)v97 stringForTitle:@"  DCRecordType" value:v15 >> 6 table:v19];
      [v7 addObject:v21];

      CFStringRef v22 = +[NSString stringWithFormat:@"0x%02X (byte 0x%02X)", v15 & 0x3F, (v15 & 0x3F) + 1];
      uint64_t v23 = [(PDControllerType4 *)v97 stringForTitle:@"  DCRecordEnd" valueString:v22];
      [v7 addObject:v23];

      ++v12;
      v14 += (uint64_t)&_mh_execute_header;
    }
    while ((v15 & 0x3F) == 0);
    if ((int)v92 - 1 + (int)v12 < 63)
    {
      int v24 = v12 + v92;
      switch(v20)
      {
        case 2u:
          uint64_t v25 = *((unsigned __int8 *)a3 + (v14 >> 32));
          long long v26 = +[NSString stringWithFormat:@"DC Record #%u Action DC Record", v98];
          id v27 = +[NSString stringWithFormat:@"0x%02X", v25];
          v28 = [(PDControllerType4 *)v97 stringForTitle:v26 valueString:v27];
          [v7 addObject:v28];

          unsigned int v29 = [(PDControllerType4 *)v97 stringForTitle:@"  ActionTarget" value:v25 table:v91];
          [v7 addObject:v29];

          if ((int)v92 - 1 + (int)v12 < 62)
          {
            LODWORD(v30) = 0;
            uint64_t v31 = 1431655766 * (int)((v15 & 0x3F) - v92 - v12);
            int v32 = (BYTE4(v31) + (v31 < 0));
            uint64_t v10 = v24 + 1;
            while (v32 != v30)
            {
              unsigned int v33 = *(_DWORD *)((char *)a3 + v10);
              uint64_t v30 = (v30 + 1);
              v34 = +[NSString stringWithFormat:@"DC Record #%u Action EDC Record #%d", v98, v30];
              unsigned __int8 v35 = +[NSString stringWithFormat:@"0x%06X", v33 & 0xFFFFFF];
              v36 = [(PDControllerType4 *)v97 stringForTitle:v34 valueString:v35];
              [v7 addObject:v36];

              v37 = [(PDControllerType4 *)v97 stringForTitle:@"  AceAction" value:(v33 >> 18) & 0xF table:v94];
              [v7 addObject:v37];

              unsigned int v38 = +[NSString stringWithFormat:@"0x%02X", BYTE1(v33)];
              unint64_t v39 = [(PDControllerType4 *)v97 stringForTitle:@"  ActionValue" valueString:v38];
              [v7 addObject:v39];

              v40 = +[NSString stringWithFormat:@"0x%02X", v33];
              uint64_t v41 = [(PDControllerType4 *)v97 stringForTitle:@"  ActionTag" valueString:v40];
              [v7 addObject:v41];

              uint64_t v42 = v10 + 3;
              BOOL v43 = v10 < 61;
              v10 += 3;
              if (!v43)
              {
LABEL_29:
                unint64_t v74 = +[NSString stringWithFormat:@"ERROR: The record overflows the register buffer. Stop decoding."];
                [v7 addObject:v74];

                uint64_t v10 = v42;
                goto LABEL_30;
              }
            }
            goto LABEL_30;
          }
          break;
        case 3u:
          unint64_t v44 = *(unsigned int *)((char *)a3 + (v14 >> 32));
          v45 = +[NSString stringWithFormat:@"DC Record #%u Signal DC Record", v98];
          v46 = +[NSString stringWithFormat:@"0x%08X", v44];
          v47 = [(PDControllerType4 *)v97 stringForTitle:v45 valueString:v46];
          [v7 addObject:v47];

          v48 = [(PDControllerType5 *)v97 decodeSingleBit:(v44 >> 31) & 1 title:@"  SignalPairs_Single" arg0:@"All specified pairs used. (0x0)" arg1:@"Single pair used. (0x1)"];
          [v7 addObjectsFromArray:v48];

          v49 = [(PDControllerType5 *)v97 decodeSingleBit:v44 >> 30 title:@"  SignalPairs_RX2" arg0:@"Not used. (0x0)" arg1:@"Used. (0x1)"];
          [v7 addObjectsFromArray:v49];

          v50 = [(PDControllerType5 *)v97 decodeSingleBit:v44 >> 29 title:@"  SignalPairs_RX1" arg0:@"Not used. (0x0)" arg1:@"Used. (0x1)"];
          [v7 addObjectsFromArray:v50];

          v51 = [(PDControllerType5 *)v97 decodeSingleBit:v44 >> 28 title:@"  SignalPairs_TX2" arg0:@"Not used. (0x0)" arg1:@"Used. (0x1)"];
          [v7 addObjectsFromArray:v51];

          int v52 = [(PDControllerType5 *)v97 decodeSingleBit:v44 >> 27 title:@"  SignalPairs_TX1" arg0:@"Not used. (0x0)" arg1:@"Used. (0x1)"];
          [v7 addObjectsFromArray:v52];

          v53 = [(PDControllerType5 *)v97 decodeSingleBit:v44 >> 26 title:@"  SignalPairs_SBU" arg0:@"Not used. (0x0)" arg1:@"Used. (0x1)"];
          [v7 addObjectsFromArray:v53];

          v54 = [(PDControllerType5 *)v97 decodeSingleBit:v44 >> 25 title:@"  SignalPairs_Mission" arg0:@"Not used. (0x0)" arg1:@"Used. (0x1)"];
          [v7 addObjectsFromArray:v54];

          uint64_t v55 = [(PDControllerType5 *)v97 decodeSingleBit:BYTE3(v44) title:@"  SignalPairs_Debug" arg0:@"Not used. (0x0)" arg1:@"Used. (0x1)"];
          [v7 addObjectsFromArray:v55];

          uint64_t v56 = [(PDControllerType5 *)v97 decodeSingleBit:(v44 >> 23) title:@"  InsertTagVoltageVDDIO" arg0:@"Do not insert 0x02 0xVV (Voltage) tag. (0x0)" arg1:@"Insert 0x02 0xVV (Voltage) tag after Pairs tag. (0x1)"];
          [v7 addObjectsFromArray:v56];

          float v57 = [(PDControllerType5 *)v97 decodeSingleBit:(v44 >> 22) title:@"  FirstTagBeforePairs" arg0:@"Do not place first EDC Record before Pairs tag. (0x0)" arg1:@"Place first EDC Record before Pairs tag. (0x1)"];
          [v7 addObjectsFromArray:v57];

          v58 = [(PDControllerType5 *)v97 decodeSingleBit:(v44 >> 21) title:@"  InsertTagVoltage3.3V" arg0:@"Do not insert 0x02 0x21 (Voltage: 3.3V) tag. (0x0)" arg1:@"Insert 0x02 0x21 (Voltage: 3.3V) tag after Pairs tag. (0x1)"];
          [v7 addObjectsFromArray:v58];

          float v59 = [(PDControllerType4 *)v97 stringForTitle:@"  AceSignal" value:WORD1(v44) & 0x1F table:v89];
          [v7 addObject:v59];

          float v60 = [(PDControllerType4 *)v97 stringForTitle:@"  SignalTarget" value:BYTE1(v44) table:v91];
          [v7 addObject:v60];

          v61 = [(PDControllerType4 *)v97 stringForTitle:@"  Signal" value:v44 table:v90];
          [v7 addObject:v61];

          if ((int)v92 - 1 + (int)v12 < 59)
          {
            uint64_t v62 = 0;
            int v63 = (v15 & 0x3F) - v92 - v12;
            int v64 = v63 - 3;
            LODWORD(v65) = v63 - 2;
            if (v64 >= 0) {
              unint64_t v65 = v64;
            }
            else {
              unint64_t v65 = v65;
            }
            uint64_t v10 = (int)v12 + (int)v92 + 4;
            int v66 = (v65 >> 1);
            while (v66 != v62)
            {
              uint64_t v67 = *(unsigned __int16 *)((char *)a3 + v10);
              v68 = +[NSString stringWithFormat:@"DC Record #%u Signal EDC Record #%d", v98, ++v62];
              v69 = +[NSString stringWithFormat:@"0x%04X", v67];
              v70 = [(PDControllerType4 *)v97 stringForTitle:v68 valueString:v69];
              [v7 addObject:v70];

              unint64_t v71 = +[NSString stringWithFormat:@"0x%02X", v67 >> 8];
              v72 = [(PDControllerType4 *)v97 stringForTitle:@"  SignalValue" valueString:v71];
              [v7 addObject:v72];

              uint64_t v73 = [(PDControllerType4 *)v97 stringForTitle:@"  SignalTag" value:v67 table:v93];
              [v7 addObject:v73];

              uint64_t v42 = v10 + 2;
              BOOL v43 = v10 < 62;
              v10 += 2;
              if (!v43) {
                goto LABEL_29;
              }
            }
            goto LABEL_30;
          }
          break;
        case 1u:
          uint64_t v79 = *((unsigned __int8 *)a3 + (v14 >> 32));
          v80 = +[NSString stringWithFormat:@"DC Record #%u Internal DC Record", v98];
          v81 = +[NSString stringWithFormat:@"0x%02X", v79];
          v82 = [(PDControllerType4 *)v97 stringForTitle:v80 valueString:v81];
          [v7 addObject:v82];

          v83 = [(PDControllerType5 *)v97 decodeSingleBit:v79 >> 7 title:@"  OfferRESET" arg0:@"No PortMicro Action entry for reset shall be advertised. (0x0)" arg1:@"PortMicro Action entry for reset shall be advertised. (0x1)"];
          [v7 addObjectsFromArray:v83];

          v84 = [(PDControllerType5 *)v97 decodeSingleBit:v79 >> 6 title:@"  OfferAceDFU" arg0:@"No PortMicro Action entry for DFU shall be advertised. (0x0)" arg1:@"PortMicro DFU entry for reset shall be advertised. (0x1)"];
          [v7 addObjectsFromArray:v84];

          v85 = [(PDControllerType5 *)v97 decodeSingleBit:v79 >> 3 title:@"  OfferI2C2SPMI" arg0:@"No PortMicro I2C/SPMI entry for I2C2 and SPMI shall be advertised. (0x0)" arg1:@"PortMicro I2C or SPMI entry for I2C2 or SPMI shall be advertised. (0x1)"];
          [v7 addObjectsFromArray:v85];

          v86 = [(PDControllerType5 *)v97 decodeSingleBit:v79 >> 2 title:@"  OfferI2C1" arg0:@"No PortMicro I2C entry for I2C1 shall be advertised. (0x0)" arg1:@"PortMicro I2C entry for I2C1 shall be advertised. (0x1)"];
          [v7 addObjectsFromArray:v86];

          v87 = [(PDControllerType5 *)v97 decodeSingleBit:v79 >> 1 title:@"  OfferDebugSerial" arg0:@"No PortMicro UART entry shall be advertised. (0x0)" arg1:@"PortMicro UART entry shall be advertised. (0x1)"];
          [v7 addObjectsFromArray:v87];

          long long v75 = [(PDControllerType5 *)v97 decodeSingleBit:v79 title:@"  OfferSWD" arg0:@"No PortMicro SWD entry shall be advertised. (0x0)" arg1:@"PortMicro SWD entry shall be advertised. (0x1)"];
          [v7 addObjectsFromArray:v75];
          goto LABEL_32;
        default:
          uint64_t v10 = v92 + v12;
LABEL_30:
          unsigned __int8 v11 = v98 + 1;
          continue;
      }
    }
    break;
  }
  long long v75 = +[NSString stringWithFormat:@"ERROR: The record overflows the register buffer. Stop decoding."];
  [v7 addObject:v75];
LABEL_32:

LABEL_33:
  id v8 = v88;
LABEL_35:

  return v7;
}

- (id)registerFormatterSecondaryMUXInitWithBuffer:(void *)a3 andLength:(unint64_t)a4
{
  uint64_t v7 = +[NSMutableArray array];
  id v8 = [(PDController *)self registerFormatterHexDumpWithBuffer:a3 andLength:a4];
  [v7 addObjectsFromArray:v8];
  if (a4 < 0x41)
  {
    if (a4 != 64)
    {
      objc_super v16 = +[NSString stringWithFormat:@"ERROR: length %lld < 64", a4];
      [v7 addObject:v16];
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v9 = +[NSString stringWithFormat:@"ERROR: Unexpected length, may not be decoded properly."];
    [v7 addObject:v9];
  }
  int v52 = v8;
  unsigned int v10 = *((unsigned __int8 *)a3 + 1);
  int v55 = v10 & 0x40;
  unsigned int v11 = v10 & 0x20;
  int v12 = (v10 >> 6) & 1;
  uint64_t v13 = +[NSString stringWithFormat:@"if ( I2CDataMux != 01110b)"];
  [v7 addObject:v13];

  unsigned __int8 v14 = 0;
  int v53 = 62 - (v12 + (v11 >> 5));
  unsigned int v54 = v11;
  int v15 = 2;
  objc_super v16 = &stru_1000186C8;
  do
  {
    CFStringRef v17 = +[NSString stringWithFormat:@"  Initialization Record %d", v14];
    [v7 addObject:v17];

    uint64_t v18 = v15;
    uint64_t v19 = *((unsigned __int8 *)a3 + v15);
    if (v54)
    {
      unsigned int v20 = +[NSString stringWithFormat:@"0x%04X", v19 | (*((unsigned __int8 *)a3 + v15 + 1) << 8)];
      unsigned int v21 = 2;
    }
    else
    {
      unsigned int v20 = +[NSString stringWithFormat:@"0x%02X", v19];
      unsigned int v21 = 1;
    }
    uint64_t v22 = v14;

    uint64_t v23 = v18 + v21;
    int v24 = +[NSString stringWithFormat:@"    SecondaryMUXInit%dSubaddr", v22];
    uint64_t v25 = [(PDControllerType4 *)self stringForTitle:v24 valueString:v20];
    [v7 addObject:v25];

    uint64_t v26 = *((unsigned __int8 *)a3 + v23);
    if (v55)
    {
      objc_super v16 = +[NSString stringWithFormat:@"0x%04X", v26 | (*((unsigned __int8 *)a3 + (int)v23 + 1) << 8)];
      int v27 = 2;
    }
    else
    {
      objc_super v16 = +[NSString stringWithFormat:@"0x%02X", v26];
      int v27 = 1;
    }

    int v15 = v23 + v27;
    v28 = +[NSString stringWithFormat:@"    SecondaryMUXInit%dData", v22];
    unsigned int v29 = [(PDControllerType4 *)self stringForTitle:v28 valueString:v16];
    [v7 addObject:v29];

    unsigned __int8 v14 = v22 + 1;
  }
  while (v15 <= v53);
  unsigned int v30 = *((unsigned __int8 *)a3 + 1);
  uint64_t v31 = [(PDControllerType5 *)self decodeSingleBit:v30 >> 7 title:@"  SecondaryMUXInitEveryConnect" arg0:@"Initialization only needs to be performed once. (0x0)" arg1:@"Initialization must be performed every time the MUX is 'activated'. (0x1)"];
  [v7 addObjectsFromArray:v31];

  int v32 = [(PDControllerType5 *)self decodeSingleBit:v30 >> 6 title:@"  SecondaryMUXData16bit" arg0:@"Data Records are 1 byte each. (0x0)" arg1:@"Data Records are 2 bytes each. (0x1)"];
  [v7 addObjectsFromArray:v32];

  unsigned int v33 = [(PDControllerType5 *)self decodeSingleBit:v30 >> 5 title:@"  SecondaryMUXSubaddr16bit" arg0:@"Subaddress Records are 1 byte each. (0x0)" arg1:@"Subaddress Records are 2 bytes each. (0x1)"];
  [v7 addObjectsFromArray:v33];

  v34 = +[NSString stringWithFormat:@"0x%02X", v30 & 0x1F];
  unsigned __int8 v35 = [(PDControllerType4 *)self stringForTitle:@"  SecondaryMUXNumEntries" valueString:v34];
  [v7 addObject:v35];

  v36 = +[NSString stringWithFormat:@"if ( I2CDataMux == 01110b)"];
  [v7 addObject:v36];

  for (uint64_t i = 63; i != 1; --i)
  {
    uint64_t v38 = *((unsigned __int8 *)a3 + i);
    unint64_t v39 = +[NSString stringWithFormat:@"  SecondaryMUXInitByte%d", i - 2];
    v40 = +[NSString stringWithFormat:@"0x%02X", v38];
    uint64_t v41 = [(PDControllerType4 *)self stringForTitle:v39 valueString:v40];
    [v7 addObject:v41];
  }
  unsigned int v42 = *((unsigned __int8 *)a3 + 1);
  BOOL v43 = [(PDControllerType5 *)self decodeSingleBit:v42 >> 7 title:@"  SecondaryMUXInitEveryConnect" arg0:@"Initialization only needs to be performed once. (0x0)" arg1:@"Initialization must be performed every time the MUX is 'activated'. (0x1)"];
  [v7 addObjectsFromArray:v43];

  unint64_t v44 = [(PDControllerType5 *)self decodeSingleBit:v42 >> 6 title:@"  SecondaryMUXUseStringTable" arg0:@"SecondaryMUXNumBytes contains the number of SecondaryMUXInitByte bytes. (0x0)" arg1:@"SecondaryMUXNumBytes contains an index to the String Table. (0x1)"];
  [v7 addObjectsFromArray:v44];

  v45 = +[NSString stringWithFormat:@"0x%02X", v42 & 0x3F];
  v46 = [(PDControllerType4 *)self stringForTitle:@"  SecondaryMUXNumEntries" valueString:v45];
  [v7 addObject:v46];

  uint64_t v47 = *(unsigned __int8 *)a3;
  v48 = +[NSString stringWithFormat:@"I2C addr = 0x%02X", v47 >> 1];
  v49 = [(PDControllerType4 *)self stringForTitle:@"SecondaryMUXAddr" valueString:v48];
  [v7 addObject:v49];

  v50 = [(PDControllerType5 *)self decodeSingleBit:v47 title:@"SecondaryMUXValid" arg0:@"Register Invalid. (0x0)" arg1:@"Register Valid. (0x1)"];
  [v7 addObjectsFromArray:v50];

  id v8 = v52;
LABEL_16:

  return v7;
}

- (void)buildRegDecodes
{
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005380;
  v6[3] = &unk_1000182C8;
  objc_copyWeak(&v7, &location);
  v3 = objc_retainBlock(v6);
  uint64_t v4 = *(NSDictionary **)((char *)&self->super._dpmrConfigs + 2);
  *(NSDictionary **)((char *)&self->super._dpmrConfigs + 2) = v3;

  unsigned int v5 = *(id *)((char *)&self->_policy_handler + 2);
  *(id *)((char *)&self->_policy_handler + 2) = &stru_100018308;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setDPMrConfigs
{
  v46.receiver = self;
  v46.super_class = (Class)PDControllerType5;
  [(PDControllerType4 *)&v46 setDPMrConfigs];
  v3 = [(PDControllerType4 *)self dpmrConfigs];
  uint64_t v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];

  uint64_t v5 = [v4 objectForKeyedSubscript:@"LRD1"];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v4 objectForKeyedSubscript:@"LRD1"];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"mask"];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      unsigned int v10 = [v4 objectForKeyedSubscript:@"LRD1"];
      unsigned int v11 = [v10 objectForKeyedSubscript:@"match"];

      if (!v11) {
        goto LABEL_6;
      }
      int v12 = [v4 objectForKeyedSubscript:@"LRD1"];
      id v6 = +[NSMutableDictionary dictionaryWithDictionary:v12];

      [v6 setObject:&off_10001AF10 forKeyedSubscript:@"mask"];
      [v6 setObject:&off_10001AF28 forKeyedSubscript:@"match"];
      id v7 = +[NSDictionary dictionaryWithDictionary:v6];
      [v4 setObject:v7 forKeyedSubscript:@"LRD1"];
    }
  }
LABEL_6:
  uint64_t v13 = [v4 objectForKeyedSubscript:@"DPM1"];
  if (!v13) {
    goto LABEL_11;
  }
  unsigned __int8 v14 = (void *)v13;
  int v15 = [v4 objectForKeyedSubscript:@"DPM1"];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"mask"];
  if (v16)
  {
    CFStringRef v17 = (void *)v16;
    uint64_t v18 = [v4 objectForKeyedSubscript:@"DPM1"];
    uint64_t v19 = [v18 objectForKeyedSubscript:@"match"];

    if (!v19) {
      goto LABEL_11;
    }
    unsigned int v20 = [v4 objectForKeyedSubscript:@"DPM1"];
    unsigned __int8 v14 = +[NSMutableDictionary dictionaryWithDictionary:v20];

    [v14 setObject:&off_10001AE98 forKeyedSubscript:@"mask"];
    [v14 setObject:&off_10001AC28 forKeyedSubscript:@"match"];
    int v15 = +[NSDictionary dictionaryWithDictionary:v14];
    [v4 setObject:v15 forKeyedSubscript:@"DPM1"];
  }

LABEL_11:
  uint64_t v21 = [v4 objectForKeyedSubscript:@"DPM2"];
  if (!v21) {
    goto LABEL_16;
  }
  uint64_t v22 = (void *)v21;
  uint64_t v23 = [v4 objectForKeyedSubscript:@"DPM2"];
  uint64_t v24 = [v23 objectForKeyedSubscript:@"mask"];
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    uint64_t v26 = [v4 objectForKeyedSubscript:@"DPM2"];
    int v27 = [v26 objectForKeyedSubscript:@"match"];

    if (!v27) {
      goto LABEL_16;
    }
    v28 = [v4 objectForKeyedSubscript:@"DPM2"];
    uint64_t v22 = +[NSMutableDictionary dictionaryWithDictionary:v28];

    [v22 setObject:&off_10001AE98 forKeyedSubscript:@"mask"];
    [v22 setObject:&off_10001AC58 forKeyedSubscript:@"match"];
    uint64_t v23 = +[NSDictionary dictionaryWithDictionary:v22];
    [v4 setObject:v23 forKeyedSubscript:@"DPM2"];
  }

LABEL_16:
  uint64_t v29 = [v4 objectForKeyedSubscript:@"eUSBA"];
  if (!v29) {
    goto LABEL_21;
  }
  unsigned int v30 = (void *)v29;
  uint64_t v31 = [v4 objectForKeyedSubscript:@"eUSBA"];
  uint64_t v32 = [v31 objectForKeyedSubscript:@"mask"];
  if (v32)
  {
    unsigned int v33 = (void *)v32;
    v34 = [v4 objectForKeyedSubscript:@"eUSBA"];
    unsigned __int8 v35 = [v34 objectForKeyedSubscript:@"match"];

    if (!v35) {
      goto LABEL_21;
    }
    v36 = [v4 objectForKeyedSubscript:@"eUSBA"];
    unsigned int v30 = +[NSMutableDictionary dictionaryWithDictionary:v36];

    [v30 setObject:&off_10001AF40 forKeyedSubscript:@"mask"];
    [v30 setObject:&off_10001AF40 forKeyedSubscript:@"match"];
    uint64_t v31 = +[NSDictionary dictionaryWithDictionary:v30];
    [v4 setObject:v31 forKeyedSubscript:@"eUSBA"];
  }

LABEL_21:
  uint64_t v37 = [v4 objectForKeyedSubscript:@"USB4B"];
  if (v37)
  {
    uint64_t v38 = (void *)v37;
    unint64_t v39 = [v4 objectForKeyedSubscript:@"USB4B"];
    uint64_t v40 = [v39 objectForKeyedSubscript:@"mask"];
    if (!v40)
    {
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v41 = (void *)v40;
    unsigned int v42 = [v4 objectForKeyedSubscript:@"USB4B"];
    BOOL v43 = [v42 objectForKeyedSubscript:@"match"];

    if (v43)
    {
      unint64_t v44 = [v4 objectForKeyedSubscript:@"USB4B"];
      uint64_t v38 = +[NSMutableDictionary dictionaryWithDictionary:v44];

      [v38 setObject:&off_10001AE98 forKeyedSubscript:@"mask"];
      [v38 setObject:&off_10001AE80 forKeyedSubscript:@"match"];
      unint64_t v39 = +[NSDictionary dictionaryWithDictionary:v38];
      [v4 setObject:v39 forKeyedSubscript:@"USB4B"];
      goto LABEL_25;
    }
  }
LABEL_26:
  v45 = +[NSDictionary dictionaryWithDictionary:v4];
  [(PDControllerType4 *)self setDpmrConfigs:v45];
}

- (int)printDBStateHistory
{
  v3 = (unsigned __int8 *)malloc_type_malloc(0x40uLL, 0xE13577B8uLL);
  uint64_t v4 = v3;
  if (v3)
  {
    *((_OWORD *)v3 + 2) = 0u;
    *((_OWORD *)v3 + 3) = 0u;
    *(_OWORD *)v3 = 0u;
    *((_OWORD *)v3 + 1) = 0u;
    __int16 v23 = 0;
    int v21 = 1145197420;
    char v22 = 1;
    LODWORD(v20) = 4194307;
    int v5 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v21, &v22, 0, v3, 0, v20, 10);
  }
  else
  {
    __int16 v23 = 0;
    int v21 = 1145197420;
    char v22 = 1;
    int v5 = -536870211;
  }
  id v6 = [(PDController *)self registerFormatterHexDumpWithBuffer:v4 andLength:18];
  id v7 = [v6 objectAtIndexedSubscript:0];
  [(PDController *)self printRegisterTitle:@"DBSl(0)" andDescription:v7];

  if (v5)
  {
    int v8 = 0;
  }
  else
  {
    int v8 = v4[3] | ((v4[4] & 7) << 8);
    uint64_t v9 = 1;
    do
    {
      char v22 = (16 * v9) | 1;
      LODWORD(v20) = 4194307;
      int v5 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v21, &v22, 0, v4, 0, v20, 10);
      unsigned int v10 = +[NSString stringWithFormat:@"DBSl(%u)", v9];
      unsigned int v11 = [(PDController *)self registerFormatterHexDumpWithBuffer:v4 andLength:64];
      int v12 = [v11 objectAtIndexedSubscript:0];
      [(PDController *)self printRegisterTitle:v10 andDescription:v12];

      if (v9 > 2) {
        break;
      }
      uint64_t v9 = (v9 + 1);
    }
    while (!v5);
  }
  uint64_t v13 = +[NSMutableArray array];
  if (v8)
  {
    int v14 = 0;
    do
    {
      ++v14;
      if (!v5)
      {
        char v22 = 1;
        __int16 v23 = v14 & 0x7FF;
        LODWORD(v20) = 4194307;
        int v5 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v21, &v22, 0, v4, 0, v20, 10);
        if (!v5)
        {
          int v15 = [(PDController *)self registerFormatterHexDumpWithBuffer:v4 andLength:64];
          [v13 addObjectsFromArray:v15];

          int v5 = 0;
        }
      }
    }
    while (v8 != v14);
  }
  char v22 = 0;
  if (v5
    || (LODWORD(v20) = 4194307,
        (int v5 = -[PDControllerType2 executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:](self, "executeIECSAtomicCommand:cmdBuffer:dataBuffer:extDataBuffer:returnDataBuffer:returnExtDataBuffer:inputDataLength:returnDataBufferLength:timeoutInSeconds:", 1, &v21, &v22, 0, v4, 0, v20, 10)) != 0))
  {
    if (v4) {
LABEL_18:
    }
      free(v4);
  }
  else
  {
    if ([v13 count])
    {
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = [v13 objectAtIndexedSubscript:v17];
        uint64_t v19 = +[NSString stringWithFormat:@"DBSl[%03X]", ++v17];
        [(PDController *)self printRegisterTitle:v19 andDescription:v18];
      }
      while ((unint64_t)[v13 count] > v17);
    }
    int v5 = 0;
    if (v4) {
      goto LABEL_18;
    }
  }

  return v5;
}

- (NSDictionary)registerConfigs
{
  return *(NSDictionary **)(&self->num_dbsl_blocks + 1);
}

- (void)setRegisterConfigs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->num_dbsl_blocks + 1), 0);
  objc_storeStrong((id *)((char *)&self->_policy_handler + 2), 0);

  objc_storeStrong((id *)((char *)&self->super._dpmrConfigs + 2), 0);
}

@end