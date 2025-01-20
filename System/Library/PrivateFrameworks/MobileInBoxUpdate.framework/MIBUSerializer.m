@interface MIBUSerializer
- (BOOL)_serializeError:(id)a3 withErrorCodeTag:(id)a4 errorDomainTag:(id)a5 errorDescriptionTag:(id)a6;
- (BOOL)serialize:(id)a3 withValue:(id)a4;
- (BOOL)serializeOperationError:(id)a3;
- (BOOL)serializeResponseError:(id)a3;
- (MIBUSerializer)init;
- (NSMutableData)data;
- (id)_serializeValue:(id)a3 forTag:(id)a4;
- (void)setData:(id)a3;
@end

@implementation MIBUSerializer

- (MIBUSerializer)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUSerializer;
  v2 = [(MIBUSerializer *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(MIBUSerializer *)v2 setData:v3];
  }
  return v2;
}

- (BOOL)serialize:(id)a3 withValue:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  id v29 = (id)objc_opt_new();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  id v8 = v7;
  id v23 = v8;
  objc_initWeak(&location, self);
  uint64_t v9 = [v6 count];
  BOOL v10 = v9 == [v8 count];
  if (v10)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __38__MIBUSerializer_serialize_withValue___block_invoke_3;
    v17 = &unk_264B969E0;
    objc_copyWeak(&v20, &location);
    v18 = v22;
    v19 = &v24;
    [v6 enumerateObjectsUsingBlock:&v14];
    objc_destroyWeak(&v20);
    v11 = (void *)v25[5];
    if (!v11 || !objc_msgSend(v11, "length", v14, v15, v16, v17))
    {
      BOOL v10 = 0;
      goto LABEL_7;
    }
    v12 = [(MIBUSerializer *)self data];
    [v12 appendData:v25[5]];
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_8);
    }
    v12 = (id)MIBUConnObj;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MIBUSerializer serialize:withValue:](buf, [v8 count], objc_msgSend(v6, "count"), v12);
    }
  }

LABEL_7:
  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(&v24, 8);
  return v10;
}

void __38__MIBUSerializer_serialize_withValue___block_invoke()
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

void __38__MIBUSerializer_serialize_withValue___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = (void *)MEMORY[0x230FC44A0]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndex:a3];
  if (v10)
  {
    if (WeakRetained)
    {
      uint64_t v11 = [WeakRetained _serializeValue:v10 forTag:v7];
      if (v11)
      {
        v12 = (void *)v11;
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendData:v11];
LABEL_5:

        goto LABEL_6;
      }
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_8_0);
      }
      v21 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        __38__MIBUSerializer_serialize_withValue___block_invoke_3_cold_2(v21, v7, (uint64_t)v10);
      }
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_5_2);
      }
      v13 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        __38__MIBUSerializer_serialize_withValue___block_invoke_3_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    *a4 = 1;
    uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = 0;
    goto LABEL_5;
  }
LABEL_6:
}

void __38__MIBUSerializer_serialize_withValue___block_invoke_2()
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

void __38__MIBUSerializer_serialize_withValue___block_invoke_6()
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

- (BOOL)serializeResponseError:(id)a3
{
  return [(MIBUSerializer *)self _serializeError:a3 withErrorCodeTag:&unk_26E53E9A0 errorDomainTag:&unk_26E53E9B8 errorDescriptionTag:&unk_26E53E9D0];
}

- (BOOL)serializeOperationError:(id)a3
{
  return [(MIBUSerializer *)self _serializeError:a3 withErrorCodeTag:&unk_26E53E9E8 errorDomainTag:&unk_26E53EA00 errorDescriptionTag:&unk_26E53EA18];
}

- (id)_serializeValue:(id)a3 forTag:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v25[4] = 0;
  *(_DWORD *)v25 = [v6 charValue];
  uint64_t v7 = +[MIBUSerializationUtil typeForTag:v6];
  if (v7)
  {
    uint64_t v8 = +[MIBUSerializationUtil maxLengthForTag:v6];
    if (v8)
    {
      switch([v7 unsignedIntValue])
      {
        case 1u:
        case 3u:
        case 4u:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = v5;
            uint64_t v10 = [v9 longLongValue];
            goto LABEL_20;
          }
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_24_0);
          }
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            goto LABEL_52;
          }
          goto LABEL_10;
        case 2u:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = v5;
            [v9 doubleValue];
            *(void *)buf = v14;
            goto LABEL_21;
          }
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_28_0);
          }
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            goto LABEL_52;
          }
          goto LABEL_10;
        case 5u:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = [v5 dataUsingEncoding:4];
            goto LABEL_17;
          }
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_32);
          }
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            -[MIBUSerializer _serializeValue:forTag:].cold.4();
          }
          goto LABEL_10;
        case 6u:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (MIBUOnceToken != -1) {
              dispatch_once(&MIBUOnceToken, &__block_literal_global_35);
            }
            if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
              -[MIBUSerializer _serializeValue:forTag:].cold.5();
            }
            goto LABEL_10;
          }
          id v15 = v5;
LABEL_17:
          v12 = v15;
          goto LABEL_22;
        case 7u:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (MIBUOnceToken != -1) {
              dispatch_once(&MIBUOnceToken, &__block_literal_global_38);
            }
            if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
LABEL_52:
            }
              -[MIBUSerializer _serializeValue:forTag:]();
            goto LABEL_10;
          }
          id v9 = v5;
          uint64_t v10 = [v9 unsignedLongLongValue];
LABEL_20:
          *(void *)buf = v10;
LABEL_21:
          v12 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", buf, objc_msgSend(v8, "unsignedIntValue"));

LABEL_22:
          *(_DWORD *)&v25[1] = [v12 length];
          if ([v8 unsignedIntValue] < *(_DWORD *)&v25[1])
          {
            if (MIBUOnceToken != -1) {
              dispatch_once(&MIBUOnceToken, &__block_literal_global_44_0);
            }
            uint64_t v16 = (void *)MIBUConnObj;
            if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
            {
              v21 = v16;
              int v22 = [v6 charValue];
              uint64_t v23 = [v12 length];
              int v24 = [v8 unsignedIntValue];
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)&buf[4] = v22;
              __int16 v27 = 2114;
              v28 = v12;
              __int16 v29 = 2048;
              uint64_t v30 = v23;
              __int16 v31 = 1024;
              int v32 = v24;
              _os_log_error_impl(&dword_2309BC000, v21, OS_LOG_TYPE_ERROR, "Truncating tag 0x%X - %{public}@ with data length %ld to %d", buf, 0x22u);
            }
            uint64_t v17 = (void *)MEMORY[0x263EFF8F8];
            id v18 = v12;
            v12 = objc_msgSend(v17, "dataWithBytes:length:", objc_msgSend(v18, "bytes"), objc_msgSend(v8, "unsignedIntValue"));

            *(_DWORD *)&v25[1] = [v12 length];
          }
          v13 = objc_opt_new();
          [v13 appendBytes:v25 length:1];
          [v13 appendBytes:&v25[1] length:4];
          [v13 appendData:v12];
          break;
        default:
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_41);
          }
          uint64_t v11 = (void *)MIBUConnObj;
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            -[MIBUSerializer _serializeValue:forTag:](v11, v7);
          }
          goto LABEL_10;
      }
    }
    else
    {
LABEL_10:
      v12 = 0;
      v13 = 0;
    }
  }
  else
  {
    v12 = 0;
    v13 = 0;
    uint64_t v8 = 0;
  }
  id v19 = v13;

  return v19;
}

void __41__MIBUSerializer__serializeValue_forTag___block_invoke()
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

void __41__MIBUSerializer__serializeValue_forTag___block_invoke_26()
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

void __41__MIBUSerializer__serializeValue_forTag___block_invoke_30()
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

void __41__MIBUSerializer__serializeValue_forTag___block_invoke_33()
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

void __41__MIBUSerializer__serializeValue_forTag___block_invoke_36()
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

void __41__MIBUSerializer__serializeValue_forTag___block_invoke_39()
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

void __41__MIBUSerializer__serializeValue_forTag___block_invoke_42()
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

- (BOOL)_serializeError:(id)a3 withErrorCodeTag:(id)a4 errorDomainTag:(id)a5 errorDescriptionTag:(id)a6
{
  v46[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x230FC44A0]();
  id v15 = [(MIBUSerializer *)self data];
  v43 = (void *)[v15 copy];

  uint64_t v16 = [v10 description];
  if (v16)
  {
    uint64_t v17 = [v10 description];
  }
  else
  {
    uint64_t v17 = &stru_26E53AE78;
  }

  v42 = v17;
  if (!v10)
  {
    v46[0] = v11;
    BOOL v28 = 1;
    __int16 v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];
    BOOL v30 = [(MIBUSerializer *)self serialize:v29 withValue:&unk_26E53EB68];

    int v22 = self;
    if (v30) {
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v18 = [v10 domain];

  if (!v18)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_51);
    }
    uint64_t v33 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUSerializer _serializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:](v33, v34, v35, v36, v37, v38, v39, v40);
    }
    goto LABEL_18;
  }
  v45[0] = v11;
  v45[1] = v12;
  v45[2] = v13;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
  v41 = v14;
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "code"));
  v44[0] = v20;
  v21 = [v10 domain];
  v44[1] = v21;
  v44[2] = v17;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:3];
  int v22 = self;
  id v23 = v11;
  id v24 = v13;
  uint64_t v26 = v25 = v12;
  BOOL v27 = [(MIBUSerializer *)v22 serialize:v19 withValue:v26];

  id v12 = v25;
  id v13 = v24;
  id v11 = v23;

  uint64_t v14 = v41;
  if (!v27)
  {
LABEL_10:
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_54);
    }
    self = v22;
    int v32 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUSerializer _serializeError:withErrorCodeTag:errorDomainTag:errorDescriptionTag:]((uint64_t)v10, v32);
    }
LABEL_18:
    [(MIBUSerializer *)self setData:v43];
    BOOL v28 = 0;
    goto LABEL_9;
  }
  BOOL v28 = 1;
LABEL_9:

  return v28;
}

void __86__MIBUSerializer__serializeError_withErrorCodeTag_errorDomainTag_errorDescriptionTag___block_invoke()
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

void __86__MIBUSerializer__serializeError_withErrorCodeTag_errorDomainTag_errorDescriptionTag___block_invoke_52()
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

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)serialize:(uint64_t)a3 withValue:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = a3;
  _os_log_error_impl(&dword_2309BC000, log, OS_LOG_TYPE_ERROR, "Serialization tag list size %lu != data list size %lu", buf, 0x16u);
}

void __38__MIBUSerializer_serialize_withValue___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __38__MIBUSerializer_serialize_withValue___block_invoke_3_cold_2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  v6[0] = 67109378;
  v6[1] = [a2 charValue];
  __int16 v7 = 2114;
  uint64_t v8 = a3;
  _os_log_error_impl(&dword_2309BC000, v5, OS_LOG_TYPE_ERROR, "Failed to serialize tag 0x%X with value %{public}@, skip serialization", (uint8_t *)v6, 0x12u);
}

- (void)_serializeValue:(void *)a1 forTag:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 unsignedIntValue];
  _os_log_error_impl(&dword_2309BC000, v3, OS_LOG_TYPE_ERROR, "Unrecognized serialization data type: 0x%X", (uint8_t *)v4, 8u);
}

- (void)_serializeValue:forTag:.cold.2()
{
  OUTLINED_FUNCTION_6_1();
  id v3 = v2;
  OUTLINED_FUNCTION_5_0();
  id v4 = (id)OUTLINED_FUNCTION_4_1();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_3_0();
  id v6 = OUTLINED_FUNCTION_1_2(v5);
  OUTLINED_FUNCTION_2_1(&dword_2309BC000, v7, v8, "Tag 0x%X - class %{public}@ != %{public}@", v9, v10, v11, v12, v13);
}

- (void)_serializeValue:forTag:.cold.4()
{
  OUTLINED_FUNCTION_6_1();
  id v3 = v2;
  OUTLINED_FUNCTION_5_0();
  id v4 = (id)OUTLINED_FUNCTION_4_1();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_3_0();
  id v6 = OUTLINED_FUNCTION_1_2(v5);
  OUTLINED_FUNCTION_2_1(&dword_2309BC000, v7, v8, "Tag 0x%X - class %{public}@ != %{public}@", v9, v10, v11, v12, v13);
}

- (void)_serializeValue:forTag:.cold.5()
{
  OUTLINED_FUNCTION_6_1();
  id v3 = v2;
  OUTLINED_FUNCTION_5_0();
  id v4 = (id)OUTLINED_FUNCTION_4_1();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_3_0();
  id v6 = OUTLINED_FUNCTION_1_2(v5);
  OUTLINED_FUNCTION_2_1(&dword_2309BC000, v7, v8, "Tag 0x%X - class %{public}@ != %{public}@", v9, v10, v11, v12, v13);
}

- (void)_serializeError:(uint64_t)a1 withErrorCodeTag:(NSObject *)a2 errorDomainTag:errorDescriptionTag:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2309BC000, a2, OS_LOG_TYPE_ERROR, "Failed to serialize error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_serializeError:(uint64_t)a3 withErrorCodeTag:(uint64_t)a4 errorDomainTag:(uint64_t)a5 errorDescriptionTag:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end