@interface ZhuGeArmory
- (BOOL)checkDependency:(id)a3 withError:(id *)a4;
- (BOOL)convertReturnValue:(id *)a3 ByItselfAndError:(id)a4 AndRevalues:(id)a5;
- (BOOL)updateChangeablePropertiesForKey:(id)a3 andOption:(id)a4 withError:(id *)a5;
- (BOOL)verifyDependencyWithError:(id *)a3;
- (Class)actionClass;
- (Class)configClass;
- (NSDictionary)config;
- (NSDictionary)option;
- (NSMutableArray)dependencyPath;
- (NSString)key;
- (ZhuGeArmoryHelperArmory)helper;
- (id)actForKey:(id)a3 andName:(id)a4 andConfig:(id)a5 andOptions:(id)a6 andPreferences:(id)a7 withError:(id *)a8;
- (id)convertReturnValue:(id)a3 toCase:(id)a4;
- (id)convertReturnValue:(id)a3 toFormat:(id)a4;
- (id)getKeyAndOptionFromDependency:(id)a3 withError:(id *)a4;
- (id)queryKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 withError:(id *)a6;
- (id)runForKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 withError:(id *)a6;
- (void)initData;
- (void)setDependencyPath:(id)a3;
@end

@implementation ZhuGeArmory

- (void)initData
{
  self->_configClass = (Class)objc_opt_class();
  self->_actionClass = (Class)objc_opt_class();
  v3 = [ZhuGeArmoryHelperArmory alloc];
  id v6 = [(objc_class *)self->_configClass getConfig];
  v4 = [(ZhuGeArmoryHelperArmory *)v3 initWithRawConfig:v6];
  helper = self->_helper;
  self->_helper = v4;
}

- (BOOL)updateChangeablePropertiesForKey:(id)a3 andOption:(id)a4 withError:(id *)a5
{
  id v9 = a3;
  id v13 = a4;
  if (!a5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory updateChangeablePropertiesForKey:andOption:withError:]", 38, @"error p-pointer is nil!", v10, v11, v12, v32);
LABEL_12:
    BOOL v29 = 0;
    goto LABEL_13;
  }
  *a5 = 0;
  if (!v9)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory updateChangeablePropertiesForKey:andOption:withError:]", 44, @"key pointer is nil!", v10, v11, v12, v32);
    [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    BOOL v29 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_storeStrong((id *)&self->_key, a3);
  objc_storeStrong((id *)&self->_option, a4);
  v14 = [(ZhuGeArmory *)self helper];
  key = self->_key;
  id v33 = 0;
  v16 = [v14 getConfigOfKey:key withError:&v33];
  id v17 = v33;
  config = self->_config;
  self->_config = v16;

  if (!self->_config)
  {
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory updateChangeablePropertiesForKey:andOption:withError:]", 55, @"Failed to update config for key \"%@\"!", v19, v20, v21, (uint64_t)v9);
    id v30 = v17;
    *a5 = v30;

    goto LABEL_12;
  }
  if (isZhuGeInRestoreOS())
  {
    uint64_t v25 = [(NSDictionary *)self->_config objectForKeyedSubscript:@"SUPPORT_RESTOREOS"];
    if (v25)
    {
      v26 = (void *)v25;
      v27 = [(NSDictionary *)self->_config objectForKeyedSubscript:@"SUPPORT_RESTOREOS"];
      char v28 = [v27 BOOLValue];

      if ((v28 & 1) == 0)
      {
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory updateChangeablePropertiesForKey:andOption:withError:]", 64, @"Key \"%@\" isn't supported in restoreos!", v22, v23, v24, (uint64_t)v9);
        *a5 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:40 underlyingError:0];

        goto LABEL_12;
      }
    }
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory updateChangeablePropertiesForKey:andOption:withError:]", 70, @"Properties of key \"%@\" is: %@", v22, v23, v24, (uint64_t)v9);

  BOOL v29 = 1;
LABEL_13:

  return v29;
}

- (BOOL)convertReturnValue:(id *)a3 ByItselfAndError:(id)a4 AndRevalues:(id)a5
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v12 = v8;
  v78 = a3;
  if (!a3)
  {
    v64 = @"returnValue p-pointer is nil!";
    uint64_t v65 = 91;
LABEL_66:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]", v65, v64, v9, v10, v11, v71);
    BOOL v66 = 0;
    goto LABEL_71;
  }
  if (!v8)
  {
    v64 = @"revalues pointer is nil!";
    uint64_t v65 = 96;
    goto LABEL_66;
  }
  v74 = v7;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v72 = v8;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v84 objects:v89 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    char v73 = 0;
    uint64_t v16 = *(void *)v85;
    uint64_t v77 = *(void *)v85;
LABEL_5:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v85 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void *)(*((void *)&v84 + 1) + 8 * v17);
      uint64_t v19 = [v13 objectForKeyedSubscript:v18];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 104, @"Config of revalue \"%@\" is not a dictionary", v21, v22, v23, v18);
LABEL_61:
      if (++v17 == v15)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v84 objects:v89 count:16];
        if (v15) {
          goto LABEL_5;
        }
        goto LABEL_69;
      }
    }
    uint64_t v24 = [v13 objectForKeyedSubscript:v18];
    uint64_t v25 = [v24 objectForKeyedSubscript:@"RETURN_REVALUE_ERROR"];
    if (isObjectNilOrZhuGeNull(v25))
    {
    }
    else
    {
      v26 = [v24 objectForKeyedSubscript:@"RETURN_REVALUE_ERROR"];
      objc_opt_class();
      char v27 = objc_opt_isKindOfClass();

      if ((v27 & 1) == 0)
      {
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 111, @"Error config of revalue \"%@\" is not an array", v28, v29, v30, v18);

        goto LABEL_60;
      }
    }
    uint64_t v31 = v15;
    v79 = [v24 objectForKeyedSubscript:@"RETURN_REVALUE_ERROR"];
    uint64_t v32 = [v24 objectForKeyedSubscript:@"RETURN_REVALUE_VALUE"];
    if (isObjectNilOrZhuGeNull(v32))
    {

      goto LABEL_16;
    }
    id v33 = [v24 objectForKeyedSubscript:@"RETURN_REVALUE_VALUE"];
    objc_opt_class();
    char v34 = objc_opt_isKindOfClass();

    if (v34)
    {
LABEL_16:
      v38 = [v24 objectForKeyedSubscript:@"RETURN_REVALUE_VALUE"];
      v39 = [v24 objectForKeyedSubscript:@"RETURN_REVALUE_OUTCOME"];
      if (isObjectNilOrZhuGeNull(v39))
      {

LABEL_21:
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 125, @"Outcome config of revalue \"%@\" is invalid!", v40, v41, v42, v18);
        int v46 = 8;
        uint64_t v15 = v31;
        goto LABEL_59;
      }
      v43 = [v24 objectForKeyedSubscript:@"RETURN_REVALUE_OUTCOME"];
      objc_opt_class();
      char v44 = objc_opt_isKindOfClass();

      if ((v44 & 1) == 0) {
        goto LABEL_21;
      }
      v76 = [v24 objectForKeyedSubscript:@"RETURN_REVALUE_OUTCOME"];
      BOOL v45 = (isObjectNilOrZhuGeNull(v79) & 1) != 0 || [v79 count] == 0;
      uint64_t v15 = v31;
      if (isObjectNilOrZhuGeNull(v38))
      {
        BOOL v50 = 1;
        if (!v45) {
          goto LABEL_27;
        }
      }
      else
      {
        BOOL v50 = [v38 count] == 0;
        if (!v45)
        {
LABEL_27:
          v51 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v74, "code"));
          int v52 = [v79 containsObject:v51];

          if (!v50)
          {
LABEL_28:
            int v75 = v52;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            id v53 = v38;
            uint64_t v54 = [v53 countByEnumeratingWithState:&v80 objects:v88 count:16];
            if (v54)
            {
              uint64_t v55 = v54;
              uint64_t v56 = *(void *)v81;
              while (2)
              {
                for (uint64_t i = 0; i != v55; ++i)
                {
                  if (*(void *)v81 != v56) {
                    objc_enumerationMutation(v53);
                  }
                  if [*(id *)(*((void *)&v80 + 1) + 8 * i) isEqualToString:@"ALL_ZERO"]&& (isObjectValidAndAllZero(*v78))
                  {
                    int v58 = 1;
                    goto LABEL_42;
                  }
                }
                uint64_t v55 = [v53 countByEnumeratingWithState:&v80 objects:v88 count:16];
                if (v55) {
                  continue;
                }
                break;
              }
            }
            int v58 = 0;
LABEL_42:

            uint64_t v15 = v31;
            int v52 = v75;
LABEL_43:
            if ((v52 & v58) == 1)
            {
              ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 154, @"Revalue \"%@\" criteria are matched", v47, v48, v49, v18);
              if ([v76 isEqualToString:@"NIL"])
              {
                *v78 = 0;
LABEL_55:
                char v73 = 1;
                int v46 = 4;
LABEL_58:

LABEL_59:
                if (v46 != 8)
                {

                  BOOL v66 = v73 & 1;
                  goto LABEL_70;
                }
                goto LABEL_60;
              }
              if ([v76 isEqualToString:@"EMPTY_STRING"])
              {
                v59 = v78;
                v60 = &stru_270DCA1F8;
LABEL_54:
                void *v59 = v60;
                goto LABEL_55;
              }
              if ([v76 isEqualToString:@"EMPTY_ARRAY"])
              {
                v59 = v78;
                v60 = (__CFString *)MEMORY[0x263EFFA68];
                goto LABEL_54;
              }
              if ([v76 isEqualToString:@"EMPTY_DICTIONARY"])
              {
                v59 = v78;
                v60 = (__CFString *)MEMORY[0x263EFFA78];
                goto LABEL_54;
              }
              if ([v76 isEqualToString:@"ZERO_NUMBER"])
              {
                v59 = v78;
                v60 = (__CFString *)&unk_270DD2BC8;
                goto LABEL_54;
              }
              ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 186, @"Outcome config of revalue \"%@\" is unsupported!", v61, v62, v63, v18);
            }
            int v46 = 8;
            goto LABEL_58;
          }
LABEL_40:
          int v58 = 1;
          goto LABEL_43;
        }
      }
      int v52 = 1;
      if (!v50) {
        goto LABEL_28;
      }
      goto LABEL_40;
    }
    ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 118, @"Value config of revalue \"%@\" is not an array", v35, v36, v37, v18);

    uint64_t v15 = v31;
LABEL_60:
    uint64_t v16 = v77;
    goto LABEL_61;
  }
  char v73 = 0;
LABEL_69:

  BOOL v66 = v73 & 1;
  ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory convertReturnValue:ByItselfAndError:AndRevalues:]", 190, @"Wasn't successful to find a matched revalue pattern!", v67, v68, v69, v71);
LABEL_70:
  uint64_t v12 = v72;
  id v7 = v74;
LABEL_71:

  return v66;
}

- (id)convertReturnValue:(id)a3 toFormat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = v6;
  if (!v5)
  {
    uint64_t v11 = @"returnValue pointer is nil!";
    uint64_t v12 = 204;
    goto LABEL_7;
  }
  if (!v6)
  {
    uint64_t v11 = @"format pointer is nil!";
    uint64_t v12 = 209;
    goto LABEL_7;
  }
  if (isObjectNSStringAndZhuGeNull(v6))
  {
    uint64_t v11 = @"format is invalid!";
    uint64_t v12 = 214;
LABEL_7:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory convertReturnValue:toFormat:]", v12, v11, v7, v8, v9, v37);
LABEL_8:
    id v13 = 0;
    goto LABEL_9;
  }
  if ([v10 isEqualToString:@"STRING"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [NSString stringFromData:v5];
LABEL_61:
      id v13 = (void *)v15;
      goto LABEL_9;
    }
  }
  if ([v10 isEqualToString:@"STRING_VISIBLE"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [NSString visibleStringFromData:v5];
      goto LABEL_61;
    }
  }
  if ([v10 isEqualToString:@"STRING_HEX"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [NSString hexStringFromData:v5];
      goto LABEL_61;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%x", objc_msgSend(v5, "intValue"));
      uint64_t v15 = LABEL_42:;
      goto LABEL_61;
    }
  }
  if ([v10 isEqualToString:@"STRING_MAC_ADDR"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [NSString macAddressStringFromData:v5];
      goto LABEL_61;
    }
  }
  if ([v10 isEqualToString:@"STRING_MAC_ADDR_SYSCFG_6BYTE"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [NSString macAddressStringFromSysconfigDataSixByte:v5];
      goto LABEL_61;
    }
  }
  if ([v10 isEqualToString:@"STRING_UUID_WITHOUT_DASH"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v5 stringByRemovingCharactersInString:@"-"];
      goto LABEL_61;
    }
  }
  if ([v10 isEqualToString:@"STRING_TRIM_SIZE_UNIT_CHARS"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v5 stringByTrimmingCharactersInString:@" KkMmGgTtBb"];
      goto LABEL_61;
    }
  }
  if ([v10 isEqualToString:@"STRING_SIZE_GB"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = NSString;
      unint64_t v17 = [v5 unsignedLongLongValue] / 0x3B9ACA00uLL;
LABEL_41:
      objc_msgSend(v16, "stringWithFormat:", @"%llu", v17);
      goto LABEL_42;
    }
  }
  if ([v10 isEqualToString:@"STRING_SIZE_GIB"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = NSString;
      unint64_t v17 = (unint64_t)[v5 unsignedLongLongValue] >> 30;
      goto LABEL_41;
    }
  }
  if ([v10 isEqualToString:@"ARRAY_GRAPHIC_INFO"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [MEMORY[0x263EFF8C0] graphicInfoArrayFromArray:v5];
      goto LABEL_61;
    }
  }
  if ([v10 isEqualToString:@"NUMBER_SINT32"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = NSNumber;
      id v19 = v5;
      uint64_t v20 = 4;
LABEL_52:
      uint64_t v21 = 1;
LABEL_60:
      uint64_t v15 = [v18 integerFromData:v19 size:v20 truncate:0 isSigned:v21 needSwap:0];
      goto LABEL_61;
    }
  }
  if ([v10 isEqualToString:@"NUMBER_SINT64"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = NSNumber;
      id v19 = v5;
      uint64_t v20 = 8;
      goto LABEL_52;
    }
  }
  if ([v10 isEqualToString:@"NUMBER_UINT32"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = NSNumber;
      id v19 = v5;
      uint64_t v20 = 4;
LABEL_59:
      uint64_t v21 = 0;
      goto LABEL_60;
    }
  }
  if ([v10 isEqualToString:@"NUMBER_UINT64"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = NSNumber;
      id v19 = v5;
      uint64_t v20 = 8;
      goto LABEL_59;
    }
  }
  if (![v10 isEqualToString:@"NUMBER_TRIM_SIZE_UNIT_CHARS"]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ([v10 isEqualToString:@"NUMBER_SIZE_GB"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = NSNumber;
        unint64_t v25 = [v5 unsignedLongLongValue] / 0x3B9ACA00uLL;
LABEL_73:
        uint64_t v15 = [v24 numberWithUnsignedLongLong:v25];
        goto LABEL_61;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = objc_alloc_init(MEMORY[0x263F08A30]);
        v26 = NSNumber;
        uint64_t v23 = [v5 stringByTrimmingCharactersInString:@" KkMmGgTtBb"];
        char v27 = [v22 numberFromString:v23];
        unint64_t v28 = [v27 unsignedLongLongValue] / 0x3B9ACA00uLL;
LABEL_76:
        id v13 = [v26 numberWithUnsignedLongLong:v28];

        goto LABEL_77;
      }
    }
    if ([v10 isEqualToString:@"NUMBER_SIZE_GIB"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v24 = NSNumber;
        unint64_t v25 = (unint64_t)[v5 unsignedLongLongValue] >> 30;
        goto LABEL_73;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = objc_alloc_init(MEMORY[0x263F08A30]);
        v26 = NSNumber;
        uint64_t v23 = [v5 stringByTrimmingCharactersInString:@" KkMmGgTtBb"];
        char v27 = [v22 numberFromString:v23];
        unint64_t v28 = (unint64_t)[v27 unsignedLongLongValue] >> 30;
        goto LABEL_76;
      }
    }
    if ([v10 isEqualToString:@"BOOL_POSITIVE"])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v30 = NSNumber;
      if (isKindOfClass)
      {
        id v31 = v5;
        uint64_t v32 = 0;
LABEL_86:
        uint64_t v15 = [v30 BOOLFromData:v31 needNegate:v32];
        goto LABEL_61;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
        goto LABEL_61;
      }
    }
    if ([v10 isEqualToString:@"BOOL_NEGATIVE"])
    {
      objc_opt_class();
      char v33 = objc_opt_isKindOfClass();
      uint64_t v30 = NSNumber;
      if (v33)
      {
        id v31 = v5;
        uint64_t v32 = 1;
        goto LABEL_86;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "BOOLValue") ^ 1);
        goto LABEL_61;
      }
    }
    objc_opt_class();
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory convertReturnValue:toFormat:]", 385, @"Format \"%@\" and class \"%@\" mismatched!", v34, v35, v36, (uint64_t)v10);
    goto LABEL_8;
  }
  id v22 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v23 = [v5 stringByTrimmingCharactersInString:@" KkMmGgTtBb"];
  id v13 = [v22 numberFromString:v23];
LABEL_77:

LABEL_9:
  return v13;
}

- (id)convertReturnValue:(id)a3 toCase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = v6;
  if (v5)
  {
    if (v6)
    {
      if (!isObjectNSStringAndZhuGeNull(v6))
      {
        if ([v10 isEqualToString:@"STRING_UPPERCASE"]
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v13 = [MEMORY[0x263EFF960] currentLocale];
          uint64_t v14 = [v5 uppercaseStringWithLocale:v13];
        }
        else
        {
          if (![v10 isEqualToString:@"STRING_LOWERCASE"]
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            uint64_t v11 = @"Case \"%@\" and class \"%@\" mismatched!";
            uint64_t v17 = (uint64_t)v10;
            uint64_t v12 = 425;
            goto LABEL_15;
          }
          id v13 = [MEMORY[0x263EFF960] currentLocale];
          uint64_t v14 = [v5 lowercaseStringWithLocale:v13];
        }
        uint64_t v15 = (void *)v14;

        goto LABEL_16;
      }
      uint64_t v11 = @"caseType is invalid!";
      uint64_t v12 = 408;
    }
    else
    {
      uint64_t v11 = @"caseType pointer is nil!";
      uint64_t v12 = 403;
    }
  }
  else
  {
    uint64_t v11 = @"returnValue pointer is nil!";
    uint64_t v12 = 398;
  }
LABEL_15:
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory convertReturnValue:toCase:]", v12, v11, v7, v8, v9, v17);
  uint64_t v15 = 0;
LABEL_16:

  return v15;
}

- (id)getKeyAndOptionFromDependency:(id)a3 withError:(id *)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v9 = v5;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory getKeyAndOptionFromDependency:withError:]", 450, @"error p-pointer is nil!", v6, v7, v8, v25);
    id v11 = 0;
    uint64_t v14 = 0;
    uint64_t v10 = 0;
    uint64_t v12 = 0;
    uint64_t v15 = 0;
    id v13 = 0;
    goto LABEL_13;
  }
  *a4 = 0;
  if (!v5)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory getKeyAndOptionFromDependency:withError:]", 456, @"dependency pointer is nil!", v6, v7, v8, v25);
    id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v11 = 0;
    uint64_t v14 = 0;
    uint64_t v10 = 0;
LABEL_11:
    uint64_t v12 = 0;
    uint64_t v15 = 0;
    id v13 = 0;
    goto LABEL_12;
  }
  uint64_t v10 = [v5 componentsSeparatedByString:@"{"];
  if ([v10 count] == 1)
  {
    id v11 = v9;
    uint64_t v12 = 0;
    id v13 = 0;
    uint64_t v14 = @"ZHUGE_NULL";
LABEL_9:
    id v27 = v11;
    v28[0] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    goto LABEL_13;
  }
  if ([v10 count] != 2)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory getKeyAndOptionFromDependency:withError:]", 477, @"dependency \"%@\" format is wrong!", v17, v18, v19, (uint64_t)v9);
    id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:59 underlyingError:0];
    id v11 = 0;
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  id v11 = [v10 firstObject];
  uint64_t v20 = [v9 stringByReplacingOccurrencesOfString:v11 withString:&stru_270DCA1F8];
  uint64_t v12 = [v20 dataUsingEncoding:4];
  id v26 = 0;
  uint64_t v14 = [MEMORY[0x263F08900] JSONObjectWithData:v12 options:1 error:&v26];
  id v13 = v26;

  if (v14) {
    goto LABEL_9;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory getKeyAndOptionFromDependency:withError:]", 472, @"dependency \"%@\" doesn't contain a valid JSON string!", v21, v22, v23, (uint64_t)v9);
  id v16 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:27 underlyingError:v13];
  uint64_t v15 = 0;
LABEL_12:
  *a4 = v16;
LABEL_13:

  return v15;
}

- (BOOL)checkDependency:(id)a3 withError:(id *)a4
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v10 = v6;
  if (!a4)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory checkDependency:withError:]", 500, @"error p-pointer is nil!", v7, v8, v9, v73);
    BOOL v14 = 0;
    goto LABEL_36;
  }
  *a4 = 0;
  if (isObjectNilOrZhuGeNull(v6))
  {
    id v11 = (void *)MEMORY[0x263EFF980];
    uint64_t v12 = [(ZhuGeArmory *)self key];
    id v13 = [v11 arrayWithObject:v12];
    [(ZhuGeArmory *)self setDependencyPath:v13];

    BOOL v14 = 1;
    goto LABEL_36;
  }
  uint64_t v15 = [(ZhuGeArmory *)self key];
  int v16 = [v10 containsObject:v15];

  if (v16)
  {
    uint64_t v17 = [(ZhuGeArmory *)self key];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory checkDependency:withError:]", 513, @"Key \"%@\" dependency got deadloop", v18, v19, v20, (uint64_t)v17);

    [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:28 underlyingError:0];
    BOOL v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = v10;
  uint64_t v80 = [obj countByEnumeratingWithState:&v87 objects:v91 count:16];
  if (!v80)
  {
    BOOL v14 = 1;
    goto LABEL_35;
  }
  uint64_t v77 = a4;
  v78 = v10;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  id v26 = 0;
  id v27 = 0;
  uint64_t v81 = *(void *)v88;
  long long v82 = 0;
  while (2)
  {
    uint64_t v28 = 0;
    uint64_t v29 = v24;
    uint64_t v30 = v25;
    id v31 = v26;
    do
    {
      if (*(void *)v88 != v81) {
        objc_enumerationMutation(obj);
      }
      uint64_t v32 = *(void *)(*((void *)&v87 + 1) + 8 * v28);
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory checkDependency:withError:]", 520, @"Checking dependency \"%@\"", v21, v22, v23, v32);
      char v33 = [(ZhuGeArmory *)self dependencyPath];
      int v34 = [v33 containsObject:v32];

      if (v34)
      {
        v74 = [(ZhuGeArmory *)self key];
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory checkDependency:withError:]", 523, @"Duplicated dependency \"%@\" for key \"%@\"", v53, v54, v55, v32);

        *uint64_t v77 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:28 underlyingError:0];

        BOOL v14 = 0;
        id v26 = v31;
        id v31 = v82;
        uint64_t v25 = v30;
        goto LABEL_34;
      }
      id v86 = v27;
      uint64_t v24 = [(ZhuGeArmory *)self getKeyAndOptionFromDependency:v32 withError:&v86];
      id v35 = v86;

      if (!v24)
      {
        int v75 = [(ZhuGeArmory *)self key];
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory checkDependency:withError:]", 530, @"Failed to resolve dependency \"%@\" for key \"%@\"!", v56, v57, v58, v32);

        id v26 = v35;
        BOOL v14 = 0;
        *uint64_t v77 = v26;
        uint64_t v29 = v30;
        uint64_t v25 = v82;
        goto LABEL_34;
      }
      uint64_t v36 = [v24 allKeys];
      uint64_t v25 = [v36 firstObject];

      uint64_t v37 = [v24 allValues];
      v38 = [v37 firstObject];

      if (isObjectNilOrZhuGeNull(v38))
      {

        v38 = 0;
      }
      id v85 = v35;
      v39 = [(ZhuGeArmory *)self runForKey:v25 andOptions:v38 andPreferences:0 withError:&v85];
      id v40 = v85;

      if (!v39)
      {
        v76 = [(ZhuGeArmory *)self key];
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory checkDependency:withError:]", 542, @"Failed to run for dependency \"%@\" for key \"%@\"", v59, v60, v61, v32);

        id v62 = v40;
        *uint64_t v77 = v62;

        BOOL v14 = 0;
        id v26 = v31;
        id v31 = v38;
        goto LABEL_33;
      }
      long long v82 = v38;
      uint64_t v41 = [(ZhuGeArmory *)self dependencyPath];
      [v41 addObject:v32];

      uint64_t v42 = [(ZhuGeArmory *)self helper];
      id v84 = v40;
      id v26 = [v42 getConfigOfKey:v25 withError:&v84];
      id v43 = v84;

      if (!v26)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory checkDependency:withError:]", 552, @"Failed to get config for dependency \"%@\"!", v44, v45, v46, v32);
        id v26 = v43;
        BOOL v14 = 0;
        *uint64_t v77 = v26;
        goto LABEL_32;
      }
      uint64_t v47 = [v26 objectForKeyedSubscript:@"DEPENDENCY"];
      char v48 = isObjectNilOrZhuGeNull(v47);

      if ((v48 & 1) == 0)
      {
        uint64_t v49 = [v26 objectForKeyedSubscript:@"DEPENDENCY"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          uint64_t v68 = [(ZhuGeArmory *)self key];
          ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory checkDependency:withError:]", 559, @"Dependency \"%@\" defines a non-array dependency", v69, v70, v71, (uint64_t)v68);

          *uint64_t v77 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:9 underlyingError:0];

          goto LABEL_31;
        }
      }
      v51 = [v26 objectForKeyedSubscript:@"DEPENDENCY"];
      id v83 = v43;
      BOOL v52 = [(ZhuGeArmory *)self checkDependency:v51 withError:&v83];
      id v27 = v83;

      if (!v52)
      {
        uint64_t v63 = [(ZhuGeArmory *)self key];
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory checkDependency:withError:]", 566, @"Failed to verify for key \"%@\" in dependency \"%@\"", v64, v65, v66, (uint64_t)v63);

        id v67 = v27;
        *uint64_t v77 = v67;

LABEL_31:
        BOOL v14 = 0;
        goto LABEL_32;
      }
      ++v28;
      uint64_t v29 = v24;
      uint64_t v30 = v25;
      id v31 = v26;
    }
    while (v80 != v28);
    uint64_t v80 = [obj countByEnumeratingWithState:&v87 objects:v91 count:16];
    if (v80) {
      continue;
    }
    break;
  }

  BOOL v14 = 1;
LABEL_32:
  id v31 = v82;
LABEL_33:
  uint64_t v29 = v24;
LABEL_34:

  uint64_t v10 = v78;
LABEL_35:

LABEL_36:
  return v14;
}

- (BOOL)verifyDependencyWithError:(id *)a3
{
  if (!a3)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory verifyDependencyWithError:]", 585, @"error p-pointer is nil!", v3, v4, v5, v33);
    id v20 = 0;
    BOOL v21 = 0;
    goto LABEL_10;
  }
  *a3 = 0;
  uint64_t v8 = (void *)MEMORY[0x263EFF980];
  uint64_t v9 = [(ZhuGeArmory *)self key];
  uint64_t v10 = [v8 arrayWithObject:v9];
  [(ZhuGeArmory *)self setDependencyPath:v10];

  id v11 = [(ZhuGeArmory *)self config];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"DEPENDENCY"];
  char v13 = isObjectNilOrZhuGeNull(v12);

  if ((v13 & 1) == 0)
  {
    BOOL v14 = [(ZhuGeArmory *)self config];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"DEPENDENCY"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v28 = [(ZhuGeArmory *)self key];
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory verifyDependencyWithError:]", 595, @"Key \"%@\" defines a non-array dependency", v29, v30, v31, (uint64_t)v28);

      id v27 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:9 underlyingError:0];
      id v20 = 0;
      goto LABEL_9;
    }
  }
  uint64_t v17 = [(ZhuGeArmory *)self config];
  uint64_t v18 = [v17 objectForKeyedSubscript:@"DEPENDENCY"];
  id v35 = 0;
  BOOL v19 = [(ZhuGeArmory *)self checkDependency:v18 withError:&v35];
  id v20 = v35;

  if (!v19)
  {
    uint64_t v22 = [(ZhuGeArmory *)self key];
    uint64_t v23 = [(ZhuGeArmory *)self dependencyPath];
    int v34 = [v23 componentsJoinedByString:@"-->"];
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory verifyDependencyWithError:]", 602, @"Failed to check dependency for key \"%@\" in path \"%@\"", v24, v25, v26, (uint64_t)v22);

    id v27 = v20;
    id v20 = v27;
LABEL_9:
    BOOL v21 = 0;
    *a3 = v27;
    goto LABEL_10;
  }
  BOOL v21 = 1;
LABEL_10:

  return v21;
}

- (id)actForKey:(id)a3 andName:(id)a4 andConfig:(id)a5 andOptions:(id)a6 andPreferences:(id)a7 withError:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v233 = a7;
  v231 = v15;
  v239 = v14;
  v232 = v16;
  v230 = v17;
  if (!a8)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 648, @"error p-pointer is nil!", v18, v19, v20, v203);
    v234 = 0;
    uint64_t v23 = 0;
    v237 = 0;
    v226 = 0;
    v228 = 0;
    id v14 = 0;
    uint64_t v24 = 0;
    v235 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    id v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
LABEL_7:
    uint64_t v31 = &unk_270DD2BE0;
    uint64_t v32 = &unk_270DD2BE0;
    goto LABEL_18;
  }
  *a8 = 0;
  if (!v14)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 654, @"key pointer is nil!", v18, v19, v20, v203);
    id v30 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    v234 = 0;
    uint64_t v23 = 0;
    v237 = 0;
    v226 = 0;
    v228 = 0;
    uint64_t v24 = 0;
    v235 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    id v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    *a8 = v30;
    a8 = 0;
    goto LABEL_7;
  }
  id v21 = [(ZhuGeArmory *)self key];

  if (v21 == v14)
  {
    uint64_t v22 = [(ZhuGeArmory *)self option];
  }
  else
  {
    uint64_t v22 = (id *)v17;
  }
  v225 = v22;
  uint64_t v26 = [v16 objectForKeyedSubscript:@"ACTION_METHOD"];

  if (!v26)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 667, @"Key \"%@\" doesn't define method for action \"%@\"", v33, v34, v35, (uint64_t)v14);
    id v42 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:29 underlyingError:0];
    v234 = 0;
    uint64_t v23 = 0;
    v237 = 0;
    v226 = 0;
    v228 = 0;
    id v14 = 0;
    uint64_t v24 = 0;
    v235 = 0;
    uint64_t v25 = 0;
    id v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
LABEL_17:
    *a8 = v42;
    uint64_t v31 = &unk_270DD2BE0;
    uint64_t v32 = &unk_270DD2BE0;
    a8 = v225;
    goto LABEL_18;
  }
  uint64_t v29 = [v16 objectForKeyedSubscript:@"ACTION_METHOD"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 675, @"Key \"%@\" defines a non-string method for action \"%@\"", v36, v37, v38, (uint64_t)v14);
    goto LABEL_15;
  }
  if (isObjectNSStringAndZhuGeNull(v29))
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 681, @"Key \"%@\" defines a empty method for action \"%@\"", v39, v40, v41, (uint64_t)v14);
LABEL_15:
    id v42 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:9 underlyingError:0];
    v234 = 0;
    uint64_t v23 = 0;
    v237 = 0;
    v226 = 0;
    v228 = 0;
    id v14 = 0;
    uint64_t v24 = 0;
    v235 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
LABEL_16:
    id v27 = 0;
    uint64_t v28 = 0;
    goto LABEL_17;
  }
  uint64_t v26 = [v16 objectForKeyedSubscript:@"ACTION_ARGUMENT"];

  if (!v26)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 688, @"Key \"%@\" doesn't define argument for action \"%@\"", v44, v45, v46, (uint64_t)v14);
    id v42 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:29 underlyingError:0];
    v234 = 0;
    uint64_t v23 = 0;
    v237 = 0;
    v226 = 0;
    v228 = 0;
    id v14 = 0;
    uint64_t v24 = 0;
    v235 = 0;
    uint64_t v25 = 0;
    goto LABEL_16;
  }
  uint64_t v47 = [v16 objectForKeyedSubscript:@"ACTION_ARGUMENT"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 694, @"Key \"%@\" defines a non-array argument for action \"%@\"", v49, v50, v51, (uint64_t)v14);
    goto LABEL_15;
  }
  uint64_t v28 = [v16 objectForKeyedSubscript:@"ACTION_ARGUMENT"];
  SEL v52 = NSSelectorFromString((NSString *)v29);
  id v27 = [(objc_class *)[(ZhuGeArmory *)self actionClass] methodSignatureForSelector:v52];
  if (!v27)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 705, @"Method \"%@\" of key \"%@\" doesn't exist!", v53, v54, v55, (uint64_t)v29);
    v95 = (void *)MEMORY[0x263F087E8];
    uint64_t v96 = 35;
LABEL_62:
    id v42 = [v95 errorWithZhuGeErrorCode:v96 underlyingError:0];
    v234 = 0;
    uint64_t v23 = 0;
    v237 = 0;
    v226 = 0;
    v228 = 0;
    id v14 = 0;
    uint64_t v24 = 0;
    v235 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    goto LABEL_17;
  }
  uint64_t v56 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v27];
  if (!v56)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 712, @"Failed to get invocation method \"%@\" for key \"%@\"", v57, v58, v59, (uint64_t)v29);
    v95 = (void *)MEMORY[0x263F087E8];
    uint64_t v96 = 33;
    goto LABEL_62;
  }
  uint64_t v60 = (void *)v56;
  [(objc_class *)[(ZhuGeArmory *)self actionClass] setKey:v14];
  objc_msgSend(v60, "setTarget:", -[ZhuGeArmory actionClass](self, "actionClass"));
  v224 = v60;
  [v60 setSelector:v52];
  v219 = v27;
  uint64_t v61 = [v27 numberOfArguments] - 1;
  uint64_t v62 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v28, "count"));
  uint64_t v229 = v61;
  v220 = v29;
  v223 = (void *)v62;
  if (v61 < 3)
  {
    v94 = (void *)v62;
    v222 = 0;
    id v210 = 0;
    uint64_t v229 = 2;
  }
  else
  {
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    uint64_t v65 = 2;
    v221 = v28;
    do
    {
      if ([v28 count] <= (unint64_t)(v65 - 2))
      {
        uint64_t v66 = 0;
      }
      else
      {
        objc_msgSend(v28, "objectAtIndexedSubscript:");
        uint64_t v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v251 = v66;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([(__CFString *)v251 isEqualToString:@"$option"])
        {
          id v67 = v225;
          uint64_t v68 = v251;
          v251 = (__CFString *)v67;
          goto LABEL_51;
        }
        int v69 = isObjectNSStringAndZhuGeNull(v251);
        uint64_t v68 = v251;
        if (v69)
        {
          v251 = 0;
          goto LABEL_51;
        }
        if ([(__CFString *)v251 rangeOfString:@"$subkey"] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v70 = [(ZhuGeArmory *)self helper];
          id v250 = v63;
          uint64_t v71 = [v70 getSubkeyOfKey:v14 withError:&v250];
          id v210 = v250;

          id v72 = v71;
          v222 = v71;
          if (v71)
          {
            if ((isObjectNSStringAndZhuGeNull(v71) & 1) == 0 && [v71 count])
            {
              uint64_t v68 = [(__CFString *)v251 componentsSeparatedByString:@"$subkey"];
              if ((unint64_t)[v68 count] < 2) {
                goto LABEL_50;
              }
              char v238 = 0;
              unint64_t v79 = 1;
              while (1)
              {
                uint64_t v80 = [v68 objectAtIndexedSubscript:v79];
                uint64_t v81 = [v80 intValue];

                if ([v72 count] < (unint64_t)((int)v81 + 1)) {
                  break;
                }
                if (v81
                  || ([v68 objectAtIndexedSubscript:v79],
                      long long v82 = objc_claimAutoreleasedReturnValue(),
                      int v83 = [v82 hasPrefix:@"0"],
                      v82,
                      v83))
                {
                  id v84 = objc_msgSend(NSString, "stringWithFormat:", @"%s%d", "$subkey", v81);
                  id v85 = v251;
                  id v86 = [v222 objectAtIndexedSubscript:(int)v81];
                  long long v87 = [(__CFString *)v85 stringByReplacingOccurrencesOfString:v84 withString:v86];
                  long long v88 = v251;
                  v251 = v87;
                }
                else
                {
                  char v238 = 1;
                }
                ++v79;
                id v72 = v222;
                if ([v68 count] <= v79)
                {
                  if (v238)
                  {
                    long long v89 = v251;
                    long long v90 = [v222 objectAtIndexedSubscript:0];
                    v91 = [(__CFString *)v89 stringByReplacingOccurrencesOfString:@"$subkey" withString:v90];
                    uint64_t v92 = v251;
                    v251 = v91;
                  }
LABEL_50:
                  uint64_t v64 = v72;
                  uint64_t v63 = v210;
LABEL_51:

                  goto LABEL_52;
                }
              }
              v128 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v72, "count"));
              v206 = [NSNumber numberWithInt:(v81 + 1)];
              ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 773, @"Flexible key \"%@\" only has %@ subkeys while requring %@ subkeys!", v129, v130, v131, (uint64_t)v14);

              *a8 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:17 underlyingError:0];

LABEL_100:
              v234 = 0;
              v237 = 0;
              v226 = 0;
              v228 = 0;
              id v14 = 0;
              v235 = 0;
              uint64_t v31 = &unk_270DD2BE0;
              uint64_t v32 = &unk_270DD2BE0;
LABEL_101:
              a8 = v225;
              uint64_t v29 = v220;
LABEL_102:
              uint64_t v28 = v221;
LABEL_103:
              id v27 = v219;
              uint64_t v26 = v224;
              goto LABEL_151;
            }
            ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 761, @"Flexible key \"%@\" is missing subkey(s)!", v76, v77, v78, (uint64_t)v14);
            id v144 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:17 underlyingError:0];
          }
          else
          {
            ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 755, @"Flexible key \"%@\" got a nil subkey!", v73, v74, v75, (uint64_t)v14);
            id v144 = v210;
          }
          *a8 = v144;
          goto LABEL_100;
        }
LABEL_52:
        uint64_t v28 = v221;
      }
      if (v251) {
        v93 = v251;
      }
      else {
        v93 = @"ZHUGE_NULL";
      }
      [v223 addObject:v93];
      [v224 setArgument:&v251 atIndex:v65];

      ++v65;
    }
    while (v65 != v61);
    v222 = v64;
    id v210 = v63;
    id v16 = v232;
    uint64_t v29 = v220;
    v94 = v223;
  }
  v97 = [v94 componentsJoinedByString:@", "];
  v204 = [v97 stringByReplacingOccurrencesOfString:@"ZHUGE_NULL" withString:@"nil"];
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 800, @"Arguments were set for key \"%@\": (%@)", v98, v99, v100, (uint64_t)v14);

  v101 = [v233 objectForKeyedSubscript:@"Timeout"];

  if (v101)
  {
    v102 = [v233 objectForKeyedSubscript:@"Timeout"];
    objc_opt_class();
    char v103 = objc_opt_isKindOfClass();

    if ((v103 & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 806, @"Preference of key \"%@\" has a non-number timeout!", v104, v105, v106, (uint64_t)v14);
      [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:9 underlyingError:0];
      v234 = 0;
      v237 = 0;
      v226 = 0;
      v228 = 0;
      id v14 = 0;
      v235 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = v94;
      uint64_t v31 = &unk_270DD2BE0;
      uint64_t v32 = &unk_270DD2BE0;
      uint64_t v26 = v224;
      a8 = v225;
      id v27 = v219;
      goto LABEL_152;
    }
    uint64_t v107 = [v233 objectForKeyedSubscript:@"Timeout"];
  }
  else
  {
    uint64_t v107 = 0;
  }
  v108 = [v233 objectForKeyedSubscript:@"RetryNumber"];

  v234 = (void *)v107;
  if (v108)
  {
    v109 = [v233 objectForKeyedSubscript:@"RetryNumber"];
    objc_opt_class();
    char v110 = objc_opt_isKindOfClass();

    if ((v110 & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 817, @"Preference of key \"%@\" has a non-number retry number!", v111, v112, v113, (uint64_t)v14);
      [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:9 underlyingError:0];
      v237 = 0;
      v226 = 0;
      v228 = 0;
      id v14 = 0;
      v235 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = &unk_270DD2BE0;
      uint64_t v32 = &unk_270DD2BE0;
      a8 = v225;
      uint64_t v29 = v220;
      goto LABEL_103;
    }
    uint64_t v31 = [v233 objectForKeyedSubscript:@"RetryNumber"];
    if (([v31 intValue] & 0x80000000) != 0) {
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 824, @"Preference of key \"%@\" has an invalid retry number: %@!", v114, v115, v116, (uint64_t)v14);
    }
  }
  else
  {
    uint64_t v31 = &unk_270DD2BE0;
  }
  v117 = [v233 objectForKeyedSubscript:@"RetryInterval"];

  v221 = v28;
  if (v117)
  {
    v118 = [v233 objectForKeyedSubscript:@"RetryInterval"];
    objc_opt_class();
    char v119 = objc_opt_isKindOfClass();

    if ((v119 & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 831, @"Preference of key \"%@\" has a non-number retry interval!", v120, v121, v122, (uint64_t)v14);
      [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:9 underlyingError:0];
      v237 = 0;
      v226 = 0;
      v228 = 0;
      id v14 = 0;
      v235 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = &unk_270DD2BE0;
      goto LABEL_101;
    }
    v123 = [v233 objectForKeyedSubscript:@"RetryInterval"];
    v127 = v234;
    if (([v123 intValue] & 0x80000000) != 0) {
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 838, @"Preference of key \"%@\" has an invalid retry interval: %@!", v124, v125, v126, (uint64_t)v14);
    }
  }
  else
  {
    v123 = &unk_270DD2BE0;
    v127 = v234;
  }
  if (!v127)
  {
    v132 = [v16 objectForKeyedSubscript:@"ACTION_TIMEOUT"];
    uint64_t v133 = isObjectNilOrZhuGeNull(v132);

    if (v133)
    {
      v127 = 0;
    }
    else
    {
      v134 = [v16 objectForKeyedSubscript:@"ACTION_TIMEOUT"];
      objc_opt_class();
      char v135 = objc_opt_isKindOfClass();

      if ((v135 & 1) == 0)
      {
        uint64_t v29 = v220;
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 848, @"Method \"%@\" of key \"%@\" has a non-number timeout", v136, v137, v138, (uint64_t)v220);
        [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:9 underlyingError:0];
        uint64_t v32 = v123;
        v234 = 0;
        v237 = 0;
        v226 = 0;
        v228 = 0;
        id v14 = 0;
        v235 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        a8 = v225;
        goto LABEL_102;
      }
      v127 = [v16 objectForKeyedSubscript:@"ACTION_TIMEOUT"];
    }
  }
  v139 = [v16 objectForKeyedSubscript:@"ACTION_RETRY"];
  if (isObjectNilOrZhuGeNull(v139))
  {
    v140 = v31;
    goto LABEL_114;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v32 = v123;
    v234 = v127;
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 864, @"Method \"%@\" of key \"%@\" has a non-dictionary retry!", v141, v142, v143, (uint64_t)v220);
    goto LABEL_93;
  }
  if (([v31 intValue] & 0x80000000) != 0)
  {
    v234 = v127;
    v145 = [v139 objectForKeyedSubscript:@"ACTION_RETRY_NUMBER"];
    char v146 = isObjectNilOrZhuGeNull(v145);

    if (v146)
    {
      v140 = v31;
      v127 = v234;
    }
    else
    {
      uint64_t v32 = v123;
      v147 = [v139 objectForKeyedSubscript:@"ACTION_RETRY_NUMBER"];
      objc_opt_class();
      char v148 = objc_opt_isKindOfClass();

      if ((v148 & 1) == 0)
      {
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 873, @"Method \"%@\" of key \"%@\" has a non-number retry number", v149, v150, v151, (uint64_t)v220);
        goto LABEL_93;
      }
      v152 = [v139 objectForKeyedSubscript:@"ACTION_RETRY_NUMBER"];

      v140 = v152;
      if (([v152 intValue] & 0x80000000) != 0) {
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 880, @"Configuration of key \"%@\" has an invalid retry number: %@!", v153, v154, v155, (uint64_t)v14);
      }
      v127 = v234;
    }
  }
  else
  {
    v140 = v31;
  }
  if (([v123 intValue] & 0x80000000) == 0) {
    goto LABEL_114;
  }
  v234 = v127;
  v156 = [v139 objectForKeyedSubscript:@"ACTION_RETRY_INTERVAL"];
  char v157 = isObjectNilOrZhuGeNull(v156);

  if ((v157 & 1) == 0)
  {
    uint64_t v32 = v123;
    v158 = [v139 objectForKeyedSubscript:@"ACTION_RETRY_INTERVAL"];
    objc_opt_class();
    char v159 = objc_opt_isKindOfClass();

    if (v159)
    {
      v163 = [v139 objectForKeyedSubscript:@"ACTION_RETRY_INTERVAL"];

      v123 = v163;
      if (([v163 intValue] & 0x80000000) != 0) {
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 896, @"Configuration of key \"%@\" has an invalid retry interval: %@!", v164, v165, v166, (uint64_t)v239);
      }
      goto LABEL_113;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 889, @"Method \"%@\" of key \"%@\" has a non-number retry interval", v160, v161, v162, (uint64_t)v220);
    uint64_t v31 = v140;
LABEL_93:
    *a8 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:9 underlyingError:0];

    v237 = 0;
    v226 = 0;
    v228 = 0;
    id v14 = 0;
    v235 = 0;
    goto LABEL_101;
  }
LABEL_113:
  v127 = v234;
LABEL_114:

  if (!v127 || ([v127 intValue] & 0x80000000) != 0)
  {

    v127 = &unk_270DD2BF8;
  }
  if (([v140 intValue] & 0x80000000) != 0)
  {

    v140 = &unk_270DD2BC8;
    BOOL v167 = 1;
  }
  else
  {
    BOOL v167 = (int)[v140 intValue] < 1;
  }
  BOOL v214 = v167;
  if (([v123 intValue] & 0x80000000) != 0)
  {

    v123 = &unk_270DD2C10;
  }
  uint64_t v168 = [v127 unsignedLongLongValue];
  v209 = v123;
  v169 = v127;
  if (v168 == -1) {
    dispatch_time_t timeout = -1;
  }
  else {
    dispatch_time_t timeout = dispatch_time(0, 1000000 * v168);
  }
  v170 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v237 = dispatch_queue_create("ZhuGe_Action_Retry_Serial_Queue", v170);

  uint64_t v31 = v140;
  v171 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", (int)(objc_msgSend(v140, "intValue") + 1));
  v172 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", (int)(objc_msgSend(v140, "intValue") + 1));
  v173 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", (int)(objc_msgSend(v140, "intValue") + 1));
  [v140 intValue];
  unint64_t v174 = 0;
  uint64_t v175 = MEMORY[0x263EFFA80];
  do
  {
    [v171 setObject:@"ZHUGE_NULL" atIndexedSubscript:v174];
    [v172 setObject:@"ZHUGE_NULL" atIndexedSubscript:v174];
    [v173 setObject:v175 atIndexedSubscript:v174++];
  }
  while (v174 <= (int)[v31 intValue]);
  v217 = v173;
  v215 = v172;
  [v31 intValue];
  uint64_t v176 = 0;
  uint64_t v216 = MEMORY[0x263EF8330];
  v234 = v169;
  v218 = v171;
  while (1)
  {
    block[0] = v216;
    block[1] = 3221225472;
    block[2] = __79__ZhuGeArmory_actForKey_andName_andConfig_andOptions_andPreferences_withError___block_invoke;
    block[3] = &unk_2655B0810;
    id v177 = v224;
    id v241 = v177;
    uint64_t v248 = v229;
    id v178 = v217;
    id v242 = v178;
    uint64_t v249 = v176;
    id v212 = v219;
    id v243 = v212;
    id v179 = v220;
    id v244 = v179;
    id v245 = v239;
    id v180 = v218;
    id v246 = v180;
    id v181 = v215;
    id v247 = v181;
    dispatch_block_t v182 = dispatch_block_create((dispatch_block_flags_t)0, block);
    dispatch_async(v237, v182);
    id v227 = v179;
    id v211 = v177;
    if (dispatch_block_wait(v182, timeout))
    {
      uint64_t v183 = v176;
      [v178 setObject:MEMORY[0x263EFFA88] atIndexedSubscript:v176];
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 984, @"%@ms timeout for method \"%@\" of key \"%@\"!", v184, v185, v186, (uint64_t)v234);
      [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:62 underlyingError:0];
      uint64_t v187 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_141;
    }
    id v236 = v178;
    uint64_t v188 = [v180 objectAtIndexedSubscript:v176];
    objc_opt_class();
    v189 = (void *)v188;
    char v190 = objc_opt_isKindOfClass();
    if (v190)
    {
      v207 = [v180 objectAtIndexedSubscript:v176];
      if ([v207 isEqualToString:@"ZHUGE_NULL"])
      {
        id v191 = v180;
        v192 = 0;
LABEL_134:

        goto LABEL_135;
      }
    }
    id v191 = v180;
    v192 = [v180 objectAtIndexedSubscript:v176];
    if (v190) {
      goto LABEL_134;
    }
LABEL_135:

    *a8 = v192;
    v193 = [v181 objectAtIndexedSubscript:v176];
    objc_opt_class();
    char v194 = objc_opt_isKindOfClass();
    id v178 = v236;
    if (v194)
    {
      v208 = [v181 objectAtIndexedSubscript:v176];
      if ([v208 isEqualToString:@"ZHUGE_NULL"])
      {
        uint64_t v183 = v176;
        uint64_t v187 = 0;
LABEL_139:

        goto LABEL_140;
      }
    }
    uint64_t v183 = v176;
    uint64_t v187 = [v181 objectAtIndexedSubscript:v176];
    if (v194) {
      goto LABEL_139;
    }
LABEL_140:

    id v180 = v191;
LABEL_141:
    v235 = (void *)v187;
    if (v187) {
      int v195 = 1;
    }
    else {
      int v195 = v214;
    }
    if ((v195 & 1) == 0)
    {
      [NSNumber numberWithUnsignedInteger:v183];
      v205 = id v196 = v180;
      ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]", 1000, @"After %@ ms, retry %@/%@ times for method \"%@\" of key \"%@\"", v197, v198, v199, (uint64_t)v209);

      v200 = (void *)MEMORY[0x263F08B88];
      double v201 = (double)(int)[v209 intValue] * 0.001;
      v202 = v200;
      id v180 = v196;
      [v202 sleepForTimeInterval:v201];
    }

    if (v195) {
      break;
    }
    uint64_t v176 = v183 + 1;
    uint64_t v29 = v227;
    if (v183 + 1 > (unint64_t)(int)[v31 intValue])
    {
      v235 = 0;
      v228 = v181;
      uint64_t v32 = v209;
      id v14 = v178;
      uint64_t v26 = v211;
      id v27 = v212;
      goto LABEL_150;
    }
  }
  v228 = v181;
  uint64_t v32 = v209;
  id v14 = v178;
  uint64_t v26 = v211;
  id v27 = v212;
  uint64_t v29 = v227;
LABEL_150:
  a8 = v225;
  uint64_t v28 = v221;
  v226 = v180;
LABEL_151:
  uint64_t v25 = v223;
LABEL_152:
  uint64_t v23 = v222;
  uint64_t v24 = v210;
LABEL_18:

  return v235;
}

void __79__ZhuGeArmory_actForKey_andName_andConfig_andOptions_andPreferences_withError___block_invoke(uint64_t a1)
{
  id v11 = &v12;
  uint64_t v12 = 0;
  [*(id *)(a1 + 32) setArgument:&v11 atIndex:*(void *)(a1 + 88)];
  [*(id *)(a1 + 32) invoke];
  v2 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(a1 + 96)];
  char v3 = [v2 BOOLValue];

  if ((v3 & 1) == 0)
  {
    if ([*(id *)(a1 + 48) methodReturnLength])
    {
      uint64_t v10 = 0;
      [*(id *)(a1 + 32) getReturnValue:&v10];
      if (v10) {
        uint64_t v7 = v10;
      }
      else {
        uint64_t v7 = @"ZHUGE_NULL";
      }
      [*(id *)(a1 + 80) setObject:v7 atIndexedSubscript:*(void *)(a1 + 96)];
      if (v12) {
        uint64_t v8 = v12;
      }
      else {
        uint64_t v8 = @"ZHUGE_NULL";
      }
      [*(id *)(a1 + 72) setObject:v8 atIndexedSubscript:*(void *)(a1 + 96)];
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory actForKey:andName:andConfig:andOptions:andPreferences:withError:]_block_invoke", 962, @"Method \"%@\" of key \"%@\" doesn't return anything!", v4, v5, v6, *(void *)(a1 + 56));
      uint64_t v9 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:37 underlyingError:0];
      [*(id *)(a1 + 72) setObject:v9 atIndexedSubscript:*(void *)(a1 + 96)];
    }
  }
}

- (id)runForKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 withError:(id *)a6
{
  uint64_t v148 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v15 = a5;
  if (!a6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1021, @"error p-pointer is nil!", v12, v13, v14, v134);
    id v27 = 0;
    id v22 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    id v21 = 0;
    goto LABEL_43;
  }
  *a6 = 0;
  if (!v10)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1027, @"key pointer is nil!", v12, v13, v14, v134);
    id v26 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v27 = 0;
    id v22 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    id v21 = 0;
LABEL_22:
    *a6 = v26;
    goto LABEL_43;
  }
  id v16 = [(ZhuGeArmory *)self key];

  if (v16 == v10)
  {
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1033, @"Will invocate for key \"%@\"!", v17, v18, v19, (uint64_t)v10);
    id v21 = [(ZhuGeArmory *)self config];
    id v22 = 0;
  }
  else
  {
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1036, @"Will invocate for dependency \"%@\"!", v17, v18, v19, (uint64_t)v10);
    uint64_t v20 = [(ZhuGeArmory *)self helper];
    id v146 = 0;
    id v21 = [v20 getConfigOfKey:v10 withError:&v146];
    id v22 = v146;

    if (!v21)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1039, @"Failed to update config for key \"%@\"!", v23, v24, v25, (uint64_t)v10);
      id v26 = v22;
      id v22 = v26;
LABEL_21:
      id v27 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      goto LABEL_22;
    }
  }
  id v30 = [v21 objectForKeyedSubscript:@"PRIVILEGE"];
  char v31 = isObjectNilOrZhuGeNull(v30);

  if (v31)
  {
    uint64_t v137 = 0;
  }
  else
  {
    uint64_t v53 = [v21 objectForKeyedSubscript:@"PRIVILEGE"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1048, @"Key \"%@\" defines a non-array user privilege", v55, v56, v57, (uint64_t)v10);
      id v26 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:9 underlyingError:0];
      goto LABEL_21;
    }
    uint64_t v58 = NSString;
    uid_t v59 = getuid();
    uint64_t v60 = [v58 stringWithUTF8String:getpwuid(v59)->pw_name];
    uint64_t v61 = [v21 objectForKeyedSubscript:@"PRIVILEGE"];
    uint64_t v137 = (void *)v60;
    LOBYTE(v60) = [v61 containsObject:v60];

    if ((v60 & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1055, @"Current process priviledge is not allowed by Key \"%@\"", v62, v63, v64, (uint64_t)v10);
      uint64_t v65 = (void *)MEMORY[0x263F087E8];
      uint64_t v66 = 44;
LABEL_25:
      id v67 = [v65 errorWithZhuGeErrorCode:v66 underlyingError:0];
      id v27 = 0;
LABEL_42:
      uint64_t v28 = 0;
      *a6 = v67;
      uint64_t v29 = v137;
      goto LABEL_43;
    }
  }
  uint64_t v32 = [v21 objectForKeyedSubscript:@"ENTITLEMENT"];
  char v33 = isObjectNilOrZhuGeNull(v32);

  if ((v33 & 1) == 0)
  {
    uint64_t v34 = [v21 objectForKeyedSubscript:@"ENTITLEMENT"];
    objc_opt_class();
    char v35 = objc_opt_isKindOfClass();

    if ((v35 & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1064, @"Key \"%@\" defines a non-string access", v36, v37, v38, (uint64_t)v10);
      uint64_t v65 = (void *)MEMORY[0x263F087E8];
      uint64_t v66 = 9;
      goto LABEL_25;
    }
  }
  uint64_t v39 = [v21 objectForKeyedSubscript:@"ACTIONS"];

  if (!v39)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1074, @"Key \"%@\" doesn't define actions", v40, v41, v42, (uint64_t)v10);
    uint64_t v65 = (void *)MEMORY[0x263F087E8];
    uint64_t v66 = 29;
    goto LABEL_25;
  }
  id v43 = [v21 objectForKeyedSubscript:@"ACTIONS"];
  id v27 = [v43 objectForKeyedSubscript:@"ACTION_DEFAULT"];

  if (!v27)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1080, @"Key \"%@\" doesn't define the default action", v44, v45, v46, (uint64_t)v10);
    uint64_t v68 = (void *)MEMORY[0x263F087E8];
    uint64_t v69 = 29;
LABEL_41:
    id v67 = [v68 errorWithZhuGeErrorCode:v69 underlyingError:0];
    goto LABEL_42;
  }
  v140 = self;
  uint64_t v47 = (void *)MEMORY[0x263EFF980];
  uint64_t v48 = [v21 objectForKeyedSubscript:@"ACTIONS"];
  uint64_t v49 = [(id)v48 allKeys];
  uint64_t v50 = [v47 arrayWithArray:v49];

  id obj = v50;
  [v50 removeObject:@"ACTION_SEQUENCE"];
  uint64_t v51 = [v21 objectForKeyedSubscript:@"ACTIONS"];
  SEL v52 = [v51 objectForKeyedSubscript:@"ACTION_SEQUENCE"];
  LOBYTE(v48) = isObjectNilOrZhuGeNull(v52);

  if (v48)
  {
    id v27 = v50;
  }
  else
  {
    uint64_t v70 = [v21 objectForKeyedSubscript:@"ACTIONS"];
    uint64_t v71 = [v70 objectForKeyedSubscript:@"ACTION_SEQUENCE"];
    objc_opt_class();
    char v72 = objc_opt_isKindOfClass();

    if ((v72 & 1) == 0)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1091, @"Key \"%@\" is defined action sequence with non-array", v73, v74, v75, (uint64_t)v10);
      [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:9 underlyingError:0];
      uint64_t v28 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_67;
    }
    uint64_t v76 = [v21 objectForKeyedSubscript:@"ACTIONS"];
    id v27 = [v76 objectForKeyedSubscript:@"ACTION_SEQUENCE"];
  }
  if (![v27 count])
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1100, @"Key \"%@\" is defined action sequence with no action item", v77, v78, v79, (uint64_t)v10);
    uint64_t v68 = (void *)MEMORY[0x263F087E8];
    uint64_t v69 = 37;
    goto LABEL_41;
  }
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id obj = v27;
  uint64_t v80 = [obj countByEnumeratingWithState:&v142 objects:v147 count:16];
  v139 = a6;
  if (v80)
  {
    uint64_t v81 = v80;
    id v135 = v22;
    id v82 = v15;
    id v83 = v11;
    uint64_t v84 = *(void *)v143;
LABEL_32:
    uint64_t v85 = 0;
    while (1)
    {
      if (*(void *)v143 != v84) {
        objc_enumerationMutation(obj);
      }
      uint64_t v86 = *(void *)(*((void *)&v142 + 1) + 8 * v85);
      long long v87 = [v21 objectForKeyedSubscript:@"ACTIONS"];
      long long v88 = [v87 objectForKeyedSubscript:v86];

      uint64_t v28 = [(ZhuGeArmory *)v140 actForKey:v10 andName:v86 andConfig:v88 andOptions:v83 andPreferences:v82 withError:v139];

      if (v28) {
        break;
      }
      if (v81 == ++v85)
      {
        uint64_t v81 = [obj countByEnumeratingWithState:&v142 objects:v147 count:16];
        if (v81) {
          goto LABEL_32;
        }
        uint64_t v28 = 0;
        break;
      }
    }
    id v11 = v83;
    id v15 = v82;
    id v22 = v135;
  }
  else
  {
    uint64_t v28 = 0;
  }

  long long v90 = [v21 objectForKeyedSubscript:@"RETURN"];
  char v91 = isObjectNilOrZhuGeNull(v90);

  if (v91) {
    goto LABEL_67;
  }
  uint64_t v92 = [v21 objectForKeyedSubscript:@"RETURN"];
  objc_opt_class();
  char v93 = objc_opt_isKindOfClass();

  if (v93)
  {
    v97 = [v21 objectForKeyedSubscript:@"RETURN"];
    uint64_t v98 = [v97 objectForKeyedSubscript:@"RETURN_REVALUES"];
    char v99 = isObjectNilOrZhuGeNull(v98);

    if ((v99 & 1) == 0)
    {
      uint64_t v100 = [v21 objectForKeyedSubscript:@"RETURN"];
      v101 = [v100 objectForKeyedSubscript:@"RETURN_REVALUES"];
      objc_opt_class();
      char v102 = objc_opt_isKindOfClass();

      if (v102)
      {
        ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1142, @"Key \"%@\" original value is %@, error is %@", v103, v104, v105, (uint64_t)v10);
        id v141 = v28;
        id v106 = *v139;
        uint64_t v107 = [v21 objectForKeyedSubscript:@"RETURN"];
        v108 = [v107 objectForKeyedSubscript:@"RETURN_REVALUES"];
        LOBYTE(v106) = [(ZhuGeArmory *)v140 convertReturnValue:&v141 ByItselfAndError:v106 AndRevalues:v108];
        id v136 = v141;

        if (v106)
        {
          id *v139 = 0;
          uint64_t v28 = v136;
          ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1152, @"Key \"%@\" revalued value is %@, error is %@", v109, v110, v111, (uint64_t)v10);
          a6 = v139;
          uint64_t v29 = v137;
          id v27 = obj;
          uint64_t v115 = v136;
          if (!v136)
          {
            ZhuGeLog(524800, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1155, @"Revalued key \"%@\" to nil intentionally!", v112, v113, v114, (uint64_t)v10);
            id v26 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:11 underlyingError:0];
            goto LABEL_22;
          }
          goto LABEL_59;
        }
        uint64_t v28 = v136;
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1147, @"Key \"%@\" is not converted, keep original value %@", v109, v110, v111, (uint64_t)v10);
      }
      else
      {
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1138, @"Config \"%@\" for key \"%@\" is not a dictionary", v103, v104, v105, @"RETURN_REVALUES");
      }
    }
    uint64_t v29 = v137;
    id v27 = obj;
    uint64_t v115 = v28;
    if (!v28) {
      goto LABEL_43;
    }
LABEL_59:
    uint64_t v116 = [v21 objectForKeyedSubscript:@"RETURN"];
    v117 = [v116 objectForKeyedSubscript:@"RETURN_FORMAT"];
    char v118 = isObjectNilOrZhuGeNull(v117);

    if (v118) {
      goto LABEL_61;
    }
    char v119 = [v21 objectForKeyedSubscript:@"RETURN"];
    uint64_t v120 = [v119 objectForKeyedSubscript:@"RETURN_FORMAT"];
    uint64_t v121 = [(ZhuGeArmory *)v140 convertReturnValue:v115 toFormat:v120];

    uint64_t v115 = (void *)v121;
    if (v121)
    {
LABEL_61:
      uint64_t v125 = [v21 objectForKeyedSubscript:@"RETURN"];
      uint64_t v126 = [v125 objectForKeyedSubscript:@"RETURN_CASE"];
      char v127 = isObjectNilOrZhuGeNull(v126);

      if (v127)
      {
        uint64_t v28 = v115;
        goto LABEL_67;
      }
      v128 = [v21 objectForKeyedSubscript:@"RETURN"];
      uint64_t v129 = [v128 objectForKeyedSubscript:@"RETURN_CASE"];
      uint64_t v28 = [(ZhuGeArmory *)v140 convertReturnValue:v115 toCase:v129];

      if (v28) {
        goto LABEL_67;
      }
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1179, @"Failed to convert case for key \"%@\"!", v130, v131, v132, (uint64_t)v10);
      id v133 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:10 underlyingError:0];
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1169, @"Failed to convert format for key \"%@\"!", v122, v123, v124, (uint64_t)v10);
      id v133 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:10 underlyingError:0];
      uint64_t v28 = 0;
    }
    id *v139 = v133;
    goto LABEL_67;
  }
  ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory runForKey:andOptions:andPreferences:withError:]", 1127, @"Config \"%@\" for key \"%@\" is not a dictionary", v94, v95, v96, @"RETURN");
LABEL_67:
  uint64_t v29 = v137;
  id v27 = obj;
LABEL_43:

  return v28;
}

- (id)queryKey:(id)a3 andOptions:(id)a4 andPreferences:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v15 = a5;
  if (!a6)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory queryKey:andOptions:andPreferences:withError:]", 1202, @"error p-pointer is nil!", v12, v13, v14, v35);
    id v27 = 0;
    id v28 = 0;
    goto LABEL_13;
  }
  *a6 = 0;
  if (v10)
  {
    ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory queryKey:andOptions:andPreferences:withError:]", 1213, @"Querying the key: %@", v12, v13, v14, (uint64_t)v10);
    id v38 = 0;
    BOOL v16 = [(ZhuGeArmory *)self updateChangeablePropertiesForKey:v10 andOption:v11 withError:&v38];
    id v17 = v38;
    id v21 = v17;
    if (v16)
    {
      id v37 = v17;
      BOOL v22 = [(ZhuGeArmory *)self verifyDependencyWithError:&v37];
      id v23 = v37;

      if (v22)
      {
        id v36 = v23;
        id v27 = [(ZhuGeArmory *)self runForKey:v10 andOptions:v11 andPreferences:v15 withError:&v36];
        id v28 = v36;

        if (v27) {
          goto LABEL_13;
        }
        ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory queryKey:andOptions:andPreferences:withError:]", 1234, @"Failed to act for key \"%@\"!", v29, v30, v31, (uint64_t)v10);
        id v32 = v28;
        id v28 = v32;
        goto LABEL_12;
      }
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory queryKey:andOptions:andPreferences:withError:]", 1224, @"Dependency of \"%@\" is not ready, error %@", v24, v25, v26, (uint64_t)v10);
      char v33 = v23;
    }
    else
    {
      ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory queryKey:andOptions:andPreferences:withError:]", 1218, @"Failed to update properties for key \"%@\", error %@!", v18, v19, v20, (uint64_t)v10);
      char v33 = v21;
    }
    id v32 = v33;
    id v28 = v32;
    id v27 = 0;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeArmory/ZhuGeArmory.m", "-[ZhuGeArmory queryKey:andOptions:andPreferences:withError:]", 1208, @"key pointer is nil!", v12, v13, v14, v35);
    id v32 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:45 underlyingError:0];
    id v27 = 0;
    id v28 = 0;
  }
LABEL_12:
  *a6 = v32;
LABEL_13:

  return v27;
}

- (ZhuGeArmoryHelperArmory)helper
{
  return (ZhuGeArmoryHelperArmory *)objc_getProperty(self, a2, 24, 1);
}

- (Class)configClass
{
  return self->_configClass;
}

- (Class)actionClass
{
  return self->_actionClass;
}

- (NSString)key
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)option
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableArray)dependencyPath
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDependencyPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependencyPath, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_option, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

@end