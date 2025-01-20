@interface MIBUDeserializer
- (BOOL)_deserializeError:(id *)a3 withErrorCodeTag:(id)a4 errorDomainTag:(id)a5 errorDescriptionTag:(id)a6;
- (BOOL)_deserializeNextTag:(id *)a3 withData:(id *)a4;
- (BOOL)deserializeOperationError:(id *)a3;
- (BOOL)deserializeResponseError:(id *)a3;
- (MIBUDeserializer)initWithData:(id)a3;
- (NSData)data;
- (NSDictionary)tagValDict;
- (id)_valueForTag:(id)a3 withData:(id)a4;
- (id)deserialize;
- (unint64_t)pos;
- (void)setData:(id)a3;
- (void)setPos:(unint64_t)a3;
- (void)setTagValDict:(id)a3;
@end

@implementation MIBUDeserializer

- (MIBUDeserializer)initWithData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MIBUDeserializer;
  v5 = [(MIBUDeserializer *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MIBUDeserializer *)v5 setData:v4];
    [(MIBUDeserializer *)v6 setPos:0];
    [(MIBUDeserializer *)v6 setTagValDict:0];
  }

  return v6;
}

- (id)deserialize
{
  v3 = [(MIBUDeserializer *)self tagValDict];

  if (v3)
  {
    id v4 = [(MIBUDeserializer *)self tagValDict];
  }
  else
  {
    v5 = objc_opt_new();
    id v6 = 0;
    id v7 = 0;
    do
    {
      objc_super v8 = v7;
      v9 = v6;
      id v13 = v6;
      id v14 = v7;
      BOOL v10 = [(MIBUDeserializer *)self _deserializeNextTag:&v14 withData:&v13];
      id v7 = v14;

      id v6 = v13;
      if (!v10)
      {

        id v4 = 0;
        goto LABEL_14;
      }
      if (v6 && v7)
      {
        v11 = [(MIBUDeserializer *)self _valueForTag:v7 withData:v6];
        if (v11) {
          [v5 setObject:v11 forKey:v7];
        }
      }
    }
    while (v7);
    if ([v5 count]) {
      [(MIBUDeserializer *)self setTagValDict:v5];
    }
    id v4 = v5;
LABEL_14:
  }

  return v4;
}

- (BOOL)deserializeResponseError:(id *)a3
{
  return [(MIBUDeserializer *)self _deserializeError:a3 withErrorCodeTag:&unk_26E53E928 errorDomainTag:&unk_26E53E928 errorDescriptionTag:&unk_26E53E940];
}

- (BOOL)deserializeOperationError:(id *)a3
{
  return [(MIBUDeserializer *)self _deserializeError:a3 withErrorCodeTag:&unk_26E53E958 errorDomainTag:&unk_26E53E970 errorDescriptionTag:&unk_26E53E988];
}

- (BOOL)_deserializeNextTag:(id *)a3 withData:(id *)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  unsigned __int8 v44 = 0;
  unsigned int v43 = 0;
  unint64_t v7 = [(MIBUDeserializer *)self pos];
  objc_super v8 = [(MIBUDeserializer *)self data];
  uint64_t v9 = [v8 length];

  if (v7 == v9)
  {
LABEL_19:
    v18 = 0;
    v16 = 0;
    v26 = 0;
    goto LABEL_10;
  }
  unint64_t v10 = v7 + 5;
  v11 = [(MIBUDeserializer *)self data];
  unint64_t v12 = [v11 length];

  if (v7 + 5 >= v12)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_7);
    }
    v29 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      v31 = [(MIBUDeserializer *)self data];
      v32 = [(MIBUDeserializer *)self data];
      *(_DWORD *)buf = 138543874;
      *(void *)v46 = v31;
      *(_WORD *)&v46[8] = 2048;
      *(void *)&v46[10] = v7;
      *(_WORD *)&v46[18] = 2048;
      *(void *)&v46[20] = [v32 length];
      _os_log_impl(&dword_2309BC000, v30, OS_LOG_TYPE_DEFAULT, "Warning: Data %{public}@ Terminating deserialization at %lu for data length: %lu", buf, 0x20u);
    }
    goto LABEL_19;
  }
  unint64_t v13 = v7 + 1;
  id v14 = [(MIBUDeserializer *)self data];
  objc_msgSend(v14, "getBytes:range:", &v44, v7, 1);

  v15 = [(MIBUDeserializer *)self data];
  objc_msgSend(v15, "getBytes:range:", &v43, v13, 4);

  v16 = [NSNumber numberWithUnsignedChar:v44];
  v17 = +[MIBUSerializationUtil maxLengthForTag:v16];
  if (v17)
  {
    v18 = v17;
    unsigned int v19 = v43;
    if (v19 > [v17 unsignedIntValue])
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_19);
      }
      v34 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      {
        v35 = v34;
        int v36 = [v16 charValue];
        unsigned int v37 = v43;
        int v38 = [v18 unsignedIntValue];
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v46 = v36;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v37;
        *(_WORD *)&v46[10] = 1024;
        *(_DWORD *)&v46[12] = v38;
        _os_log_error_impl(&dword_2309BC000, v35, OS_LOG_TYPE_ERROR, "0x%X field len: %u is > expected len: %u", buf, 0x14u);
      }
    }
    else
    {
      unint64_t v20 = v10 + v43;
      v21 = [(MIBUDeserializer *)self data];
      unint64_t v22 = [v21 length];

      if (v20 <= v22)
      {
        if (v43)
        {
          v23 = (void *)MEMORY[0x263EFF8F8];
          id v24 = [(MIBUDeserializer *)self data];
          uint64_t v25 = [v24 bytes];
          v26 = [v23 dataWithBytesNoCopy:v25 + v10 length:v43 freeWhenDone:0];

          v10 += v43;
        }
        else
        {
          v26 = 0;
        }
        [(MIBUDeserializer *)self setPos:v10];
LABEL_10:
        BOOL v27 = 1;
        if (!a3) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_22);
      }
      v39 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      {
        unsigned int v40 = v43;
        v41 = v39;
        v42 = [(MIBUDeserializer *)self data];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v46 = v40;
        *(_WORD *)&v46[4] = 2048;
        *(void *)&v46[6] = v10;
        *(_WORD *)&v46[14] = 2114;
        *(void *)&v46[16] = v42;
        _os_log_error_impl(&dword_2309BC000, v41, OS_LOG_TYPE_ERROR, "Failed to deserialize %u bytes data at %lu; data %{public}@ too short",
          buf,
          0x1Cu);
      }
    }
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_16_0);
    }
    v33 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeserializer _deserializeNextTag:withData:](v33, v16);
    }
    v18 = 0;
  }
  v26 = 0;
  BOOL v27 = 0;
  if (a3) {
LABEL_11:
  }
    *a3 = v16;
LABEL_12:
  if (a4) {
    *a4 = v26;
  }

  return v27;
}

void __49__MIBUDeserializer__deserializeNextTag_withData___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __49__MIBUDeserializer__deserializeNextTag_withData___block_invoke_14()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __49__MIBUDeserializer__deserializeNextTag_withData___block_invoke_17()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __49__MIBUDeserializer__deserializeNextTag_withData___block_invoke_20()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (id)_valueForTag:(id)a3 withData:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[MIBUSerializationUtil typeForTag:v6];
  uint64_t v8 = +[MIBUSerializationUtil maxLengthForTag:v6];

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    switch([v7 unsignedIntValue])
    {
      case 1u:
      case 3u:
      case 4u:
        unsigned int v10 = [v8 unsignedIntValue];
        if (!v5 || (unsigned int v11 = v10, ![v5 length]))
        {
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_25);
          }
          unint64_t v20 = MIBUConnObj;
          if (!os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            break;
          }
          goto LABEL_35;
        }
        if (v11 - 9 <= 0xFFFFFFF7)
        {
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_28);
          }
          if (!os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            break;
          }
          goto LABEL_59;
        }
        if ([v5 length] == v11)
        {
          double v34 = 0.0;
          objc_msgSend(v5, "getBytes:range:", &v34, 0, v11);
          id v12 = [NSNumber numberWithLongLong:*(void *)&v34];
          goto LABEL_28;
        }
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_31_0);
        }
        if (!os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          break;
        }
        goto LABEL_67;
      case 2u:
        unsigned int v15 = [v8 unsignedIntValue];
        if (!v5 || (unsigned int v16 = v15, ![v5 length]))
        {
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_34_0);
          }
          unint64_t v20 = MIBUConnObj;
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
LABEL_35:
          }
            -[MIBUDeserializer _valueForTag:withData:]((uint64_t)v5, v20, v21, v22, v23, v24, v25, v26);
          break;
        }
        if (v16 - 9 <= 0xFFFFFFF7)
        {
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_37_0);
          }
          if (!os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            break;
          }
          goto LABEL_59;
        }
        if ([v5 length] == v16)
        {
          double v34 = 0.0;
          objc_msgSend(v5, "getBytes:range:", &v34, 0, v16);
          id v12 = [NSNumber numberWithDouble:v34];
          goto LABEL_28;
        }
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_40_0);
        }
        if (!os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          break;
        }
        goto LABEL_67;
      case 5u:
        id v12 = (id)[[NSString alloc] initWithData:v5 encoding:4];
        goto LABEL_28;
      case 6u:
        id v12 = v5;
        goto LABEL_28;
      case 7u:
        unsigned int v17 = [v8 unsignedIntValue];
        if (!v5 || (unsigned int v18 = v17, ![v5 length]))
        {
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_44);
          }
          BOOL v27 = MIBUConnObj;
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            -[MIBUDeserializer _valueForTag:withData:].cold.8((uint64_t)v5, v27, v28, v29, v30, v31, v32, v33);
          }
          break;
        }
        if (v18 - 9 <= 0xFFFFFFF7)
        {
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_47);
          }
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
LABEL_59:
          }
            -[MIBUDeserializer _valueForTag:withData:]();
        }
        else
        {
          if ([v5 length] == v18)
          {
            double v34 = 0.0;
            objc_msgSend(v5, "getBytes:range:", &v34, 0, v18);
            id v12 = [NSNumber numberWithUnsignedLongLong:*(void *)&v34];
LABEL_28:
            id v14 = v12;
            goto LABEL_29;
          }
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_50);
          }
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
LABEL_67:
          }
            -[MIBUDeserializer _valueForTag:withData:].cold.4();
        }
        break;
      default:
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_53);
        }
        unint64_t v13 = (void *)MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          -[MIBUDeserializer _valueForTag:withData:](v13, v7);
        }
        break;
    }
  }
  id v14 = 0;
LABEL_29:

  return v14;
}

void __42__MIBUDeserializer__valueForTag_withData___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_26()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_29()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_32()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_35()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_38()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_42()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_45()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_48()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __42__MIBUDeserializer__valueForTag_withData___block_invoke_51()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (BOOL)_deserializeError:(id *)a3 withErrorCodeTag:(id)a4 errorDomainTag:(id)a5 errorDescriptionTag:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unint64_t v13 = objc_opt_new();
  id v14 = [(MIBUDeserializer *)self tagValDict];

  if (!v14)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_55_1);
    }
    uint64_t v24 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeserializer _deserializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
LABEL_18:
    unint64_t v20 = 0;
    unsigned int v18 = 0;
    unsigned int v16 = 0;
    BOOL v22 = 0;
    uint64_t v21 = 0;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  unsigned int v15 = [(MIBUDeserializer *)self tagValDict];
  unsigned int v16 = [v15 objectForKey:v10];

  if (!v16)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_58_0);
    }
    uint64_t v32 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUDeserializer _deserializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:](v32, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_18;
  }
  if ([v16 longValue])
  {
    unsigned int v17 = [(MIBUDeserializer *)self tagValDict];
    unsigned int v18 = [v17 objectForKey:v11];

    unsigned int v19 = [(MIBUDeserializer *)self tagValDict];
    unint64_t v20 = [v19 objectForKey:v12];

    if (v20) {
      [v13 setObject:v20 forKeyedSubscript:*MEMORY[0x263F08320]];
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v18, objc_msgSend(v16, "longValue"), v13);
  }
  else
  {
    unint64_t v20 = 0;
    unsigned int v18 = 0;
    uint64_t v21 = 0;
  }
  BOOL v22 = 1;
  if (a3) {
LABEL_8:
  }
    *a3 = v21;
LABEL_9:

  return v22;
}

void __90__MIBUDeserializer__deserializeError_withErrorCodeTag_errorDomainTag_errorDescriptionTag___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __90__MIBUDeserializer__deserializeError_withErrorCodeTag_errorDomainTag_errorDescriptionTag___block_invoke_56()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)pos
{
  return self->_pos;
}

- (void)setPos:(unint64_t)a3
{
  self->_pos = a3;
}

- (NSDictionary)tagValDict
{
  return self->_tagValDict;
}

- (void)setTagValDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagValDict, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)_deserializeNextTag:(void *)a1 withData:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 charValue];
  OUTLINED_FUNCTION_6_0(&dword_2309BC000, v4, v5, "Tag 0x%X is not recognized", v6, v7, v8, v9, 0);
}

- (void)_valueForTag:(void *)a1 withData:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 unsignedIntValue];
  OUTLINED_FUNCTION_6_0(&dword_2309BC000, v4, v5, "Unrecognized deserialization data type: 0x%X", v6, v7, v8, v9, 0);
}

- (void)_valueForTag:(uint64_t)a3 withData:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_valueForTag:withData:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(&dword_2309BC000, v0, v1, "Len of num to convert %u cannot be greater than %lu", v2, v3, v4, v5, v6);
}

- (void)_valueForTag:withData:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2309BC000, v0, v1, "Data %{public}@ does not have expected len %u");
}

- (void)_valueForTag:(uint64_t)a3 withData:(uint64_t)a4 .cold.8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_deserializeError:(uint64_t)a3 withErrorCodeTag:(uint64_t)a4 errorDomainTag:(uint64_t)a5 errorDescriptionTag:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_deserializeError:(uint64_t)a3 withErrorCodeTag:(uint64_t)a4 errorDomainTag:(uint64_t)a5 errorDescriptionTag:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end