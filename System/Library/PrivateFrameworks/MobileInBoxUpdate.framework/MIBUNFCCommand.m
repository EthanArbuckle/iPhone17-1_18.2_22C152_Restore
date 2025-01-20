@interface MIBUNFCCommand
- (BOOL)_deserializeConfigureNFC;
- (BOOL)_deserializeHeartbeat;
- (BOOL)_deserializeRetryAfter;
- (BOOL)_deserializeStartDiag;
- (BOOL)_deserializeStartUpdate;
- (BOOL)_deserializeTatsuPayload;
- (BOOL)_initWithAPDU:(id)a3;
- (BOOL)_initWithCommandCode:(int64_t)a3;
- (Class)getResponseClass;
- (MIBUNFCCommand)initWithAPDU:(id)a3;
- (MIBUNFCCommand)initWithCommandCode:(int64_t)a3 andPayload:(id)a4;
- (NSData)apdu;
- (NSData)serializedPayload;
- (NSMutableDictionary)mutablePayload;
- (id)_serializeConfigureNFC;
- (id)_serializeHeartbeat;
- (id)_serializeRetryAfter;
- (id)_serializeStartDiag;
- (id)_serializeStartUpdate;
- (id)_serializeTatsuPayload:(id)a3;
- (int64_t)code;
- (unsigned)cla;
- (unsigned)ins;
- (unsigned)p1;
- (unsigned)p2;
- (void)_deserializeConfigureNFC;
- (void)_deserializeHeartbeat;
- (void)_deserializeRetryAfter;
- (void)_deserializeTatsuPayload;
- (void)_serializeConfigureNFC;
- (void)_serializeHeartbeat;
- (void)_serializeRetryAfter;
- (void)setMutablePayload:(id)a3;
@end

@implementation MIBUNFCCommand

- (MIBUNFCCommand)initWithCommandCode:(int64_t)a3 andPayload:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MIBUNFCCommand;
  v7 = [(MIBUNFCCommand *)&v12 init];
  v8 = v7;
  if (v7
    && (v7->_code = a3,
        v9 = (void *)[v6 mutableCopy],
        [(MIBUNFCCommand *)v8 setMutablePayload:v9],
        v9,
        ![(MIBUNFCCommand *)v8 _initWithCommandCode:a3]))
  {
    v10 = 0;
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (MIBUNFCCommand)initWithAPDU:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MIBUNFCCommand;
  id v6 = [(MIBUNFCCommand *)&v11 init];
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_apdu, a3),
        v8 = objc_opt_new(),
        [(MIBUNFCCommand *)v7 setMutablePayload:v8],
        v8,
        ![(MIBUNFCCommand *)v7 _initWithAPDU:v5]))
  {
    v9 = 0;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (Class)getResponseClass
{
  objc_opt_class();
  [(MIBUNFCCommand *)self code];
  v3 = objc_opt_class();

  return (Class)v3;
}

- (BOOL)_initWithCommandCode:(int64_t)a3
{
  id v5 = objc_opt_new();
  self->_cla = 0;
  serializedPayload = self->_serializedPayload;
  self->_serializedPayload = 0;

  p_code = &self->_code;
  switch(self->_code)
  {
    case 1:
      *(_WORD *)&self->_ins = 458;
      self->_p2 = 0;
      goto LABEL_16;
    case 2:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 1;
      v8 = [(MIBUNFCCommand *)self _serializeStartUpdate];
      goto LABEL_19;
    case 3:
      *(_WORD *)&self->_ins = 458;
      unsigned __int8 v9 = 2;
      goto LABEL_15;
    case 4:
      *(_WORD *)&self->_ins = 1188;
      self->_p2 = 0;
      v10 = [(MIBUNFCCommand *)self mutablePayload];
      objc_super v11 = [v10 objectForKey:@"ApplicationID"];
      objc_super v12 = self->_serializedPayload;
      self->_serializedPayload = v11;

      goto LABEL_20;
    case 6:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 2;
      v8 = [(MIBUNFCCommand *)self _serializeRetryAfter];
      goto LABEL_19;
    case 7:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 3;
      v8 = [(MIBUNFCCommand *)self _serializeHeartbeat];
      goto LABEL_19;
    case 8:
      *(_WORD *)&self->_ins = 474;
      unsigned __int8 v9 = 4;
      goto LABEL_15;
    case 9:
      *(_WORD *)&self->_ins = 458;
      unsigned __int8 v9 = 3;
LABEL_15:
      self->_p2 = v9;
LABEL_16:
      v8 = (NSData *)objc_opt_new();
      goto LABEL_19;
    case 0xALL:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 5;
      v8 = [(MIBUNFCCommand *)self _serializeConfigureNFC];
      goto LABEL_19;
    case 0xBLL:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 6;
      v8 = [(MIBUNFCCommand *)self _serializeStartDiag];
LABEL_19:
      v10 = self->_serializedPayload;
      self->_serializedPayload = v8;
LABEL_20:

      v16 = self->_serializedPayload;
      if (v16)
      {
        int v24 = *(_DWORD *)&self->_cla;
        if ([(NSData *)v16 length])
        {
          NSUInteger v17 = [(NSData *)self->_serializedPayload length];
          __int16 v18 = [(NSData *)self->_serializedPayload length];
          if (v17 > 0xFF)
          {
            char v25 = 0;
            char v26 = HIBYTE(v18);
            char v27 = v18;
            v19 = v5;
            uint64_t v20 = 7;
          }
          else
          {
            char v25 = v18;
            v19 = v5;
            uint64_t v20 = 5;
          }
          [v19 appendBytes:&v24 length:v20];
          [v5 appendData:self->_serializedPayload];
        }
        else
        {
          [v5 appendBytes:&v24 length:4];
        }
        objc_storeStrong((id *)&self->_apdu, v5);
        BOOL v15 = 1;
      }
      else
      {
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_34_1);
        }
        v22 = MIBUConnObj;
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          [(MIBUNFCCommand *)p_code _initWithCommandCode:v23];
        }
LABEL_10:
        BOOL v15 = 0;
      }

      return v15;
    default:
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_9);
      }
      v13 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        [(MIBUNFCCommand *)a3 _initWithCommandCode:v14];
      }
      goto LABEL_10;
  }
}

void __39__MIBUNFCCommand__initWithCommandCode___block_invoke()
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

void __39__MIBUNFCCommand__initWithCommandCode___block_invoke_32()
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

- (BOOL)_initWithAPDU:(id)a3
{
  id v4 = a3;
  self->_code = 0;
  serializedPayload = self->_serializedPayload;
  self->_serializedPayload = 0;

  if ((unint64_t)[v4 length] <= 3)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_36_0);
    }
    char v26 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _initWithAPDU:](v26, v4);
    }
    goto LABEL_82;
  }
  id v6 = v4;
  uint64_t v7 = (unsigned __int8 *)[v6 bytes];
  int v8 = *v7;
  if (*v7)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_39_1);
    }
    char v27 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _initWithAPDU:]0(v8, v27);
    }
    goto LABEL_82;
  }
  uint64_t v9 = v7;
  int v10 = v7[1];
  int v11 = v7[2];
  int v12 = v7[3];
  if ([v6 length] == 4)
  {
LABEL_6:
    BOOL v15 = (NSData *)objc_opt_new();
    goto LABEL_13;
  }
  uint64_t v13 = [v6 length];
  unsigned int v14 = v9[4];
  if (v13 == 5)
  {
    if (v9[4])
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_42);
      }
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        -[MIBUNFCCommand _initWithAPDU:].cold.7();
      }
      goto LABEL_82;
    }
    goto LABEL_6;
  }
  if (v9[4])
  {
    uint64_t v16 = 5;
  }
  else
  {
    if ((unint64_t)[v6 length] <= 6)
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_45_0);
      }
      v29 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        -[MIBUNFCCommand _initWithAPDU:].cold.8(v29, v6);
      }
      goto LABEL_82;
    }
    unsigned int v14 = bswap32(*(unsigned __int16 *)(v9 + 5)) >> 16;
    uint64_t v16 = 7;
  }
  uint64_t v17 = v14;
  if (v16 + (unint64_t)v14 > [v6 length])
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_48_0);
    }
    v28 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      [(MIBUNFCCommand *)v17 _initWithAPDU:v6];
    }
    goto LABEL_82;
  }
  objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v6, "bytes") + v16, v17, 0);
  BOOL v15 = (NSData *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  __int16 v18 = self->_serializedPayload;
  self->_serializedPayload = v15;

  BOOL v19 = 1;
  if (v10 > 201)
  {
    if (v10 == 202)
    {
      if (v11 == 1 && !v12)
      {
        BOOL v19 = 1;
        self->_code = 1;
        goto LABEL_59;
      }
      if (v11 == 1 && v12 == 2)
      {
        int64_t v24 = 3;
      }
      else
      {
        BOOL v19 = 1;
        if (v11 != 1 || v12 != 3) {
          goto LABEL_59;
        }
        int64_t v24 = 9;
      }
    }
    else
    {
      if (v10 != 218) {
        goto LABEL_59;
      }
      if (v11 == 1 && v12 == 1)
      {
        self->_code = 2;
        if ([(MIBUNFCCommand *)self _deserializeStartUpdate]) {
          goto LABEL_58;
        }
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_51_0);
        }
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          -[MIBUNFCCommand _initWithAPDU:]();
        }
        goto LABEL_82;
      }
      if (v11 == 1 && v12 == 2)
      {
        self->_code = 6;
        if ([(MIBUNFCCommand *)self _deserializeRetryAfter]) {
          goto LABEL_58;
        }
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_54_0);
        }
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          -[MIBUNFCCommand _initWithAPDU:]();
        }
        goto LABEL_82;
      }
      if (v11 == 1 && v12 == 3)
      {
        self->_code = 7;
        if ([(MIBUNFCCommand *)self _deserializeHeartbeat]) {
          goto LABEL_58;
        }
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_57);
        }
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          -[MIBUNFCCommand _initWithAPDU:].cold.4();
        }
        goto LABEL_82;
      }
      if (v11 != 1 || v12 != 4)
      {
        if (v11 == 1 && v12 == 5)
        {
          self->_code = 10;
          if ([(MIBUNFCCommand *)self _deserializeConfigureNFC]) {
            goto LABEL_58;
          }
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_60);
          }
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            -[MIBUNFCCommand _initWithAPDU:].cold.5();
          }
        }
        else
        {
          BOOL v19 = 1;
          if (v11 != 1 || v12 != 6) {
            goto LABEL_59;
          }
          self->_code = 11;
          if ([(MIBUNFCCommand *)self _deserializeStartDiag]) {
            goto LABEL_58;
          }
          if (MIBUOnceToken != -1) {
            dispatch_once(&MIBUOnceToken, &__block_literal_global_63);
          }
          if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
            -[MIBUNFCCommand _initWithAPDU:].cold.6();
          }
        }
LABEL_82:
        BOOL v19 = 0;
        goto LABEL_59;
      }
      int64_t v24 = 8;
    }
    self->_code = v24;
    goto LABEL_58;
  }
  if (v10 == 164)
  {
    BOOL v19 = 1;
    if (v11 == 4 && !v12)
    {
      self->_code = 4;
      uint64_t v20 = [(MIBUNFCCommand *)self mutablePayload];
      v21 = v20;
      v22 = self->_serializedPayload;
      uint64_t v23 = @"ApplicationID";
      goto LABEL_30;
    }
  }
  else if (v10 == 194)
  {
    if (!(v11 | v12))
    {
      self->_code = 5;
      uint64_t v20 = [(MIBUNFCCommand *)self mutablePayload];
      v21 = v20;
      v22 = self->_serializedPayload;
      uint64_t v23 = @"EvelopedAPDU";
LABEL_30:
      [v20 setObject:v22 forKey:v23];
    }
LABEL_58:
    BOOL v19 = 1;
  }
LABEL_59:

  return v19;
}

void __32__MIBUNFCCommand__initWithAPDU___block_invoke()
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

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_37()
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

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_40()
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

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_43()
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

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_46()
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

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_49()
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

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_52()
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

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_55()
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

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_58()
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

void __32__MIBUNFCCommand__initWithAPDU___block_invoke_61()
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

- (id)_serializeStartUpdate
{
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_65);
  }
  uint64_t v3 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2309BC000, v3, OS_LOG_TYPE_DEFAULT, "Serializing startUpdate command", v7, 2u);
  }
  uint64_t v4 = [(MIBUNFCCommand *)self payload];
  uint64_t v5 = [(MIBUNFCCommand *)self _serializeTatsuPayload:v4];

  return v5;
}

void __39__MIBUNFCCommand__serializeStartUpdate__block_invoke()
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

- (id)_serializeRetryAfter
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MIBUNFCCommand *)self payload];
  uint64_t v5 = [v4 objectForKey:@"RetryAfter"];

  if (v5)
  {
    v13[0] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    char v7 = [v3 serialize:&unk_26E53EB80 withValue:v6];

    if (v7)
    {
      uint64_t v8 = [v3 serializedData];
      goto LABEL_4;
    }
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_73_0);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _serializeRetryAfter]();
    }
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_68);
    }
    int v10 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      [(MIBUNFCCommand *)v10 _serializeRetryAfter];
    }
  }
  uint64_t v8 = 0;
LABEL_4:

  return v8;
}

void __38__MIBUNFCCommand__serializeRetryAfter__block_invoke()
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

void __38__MIBUNFCCommand__serializeRetryAfter__block_invoke_71()
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

- (id)_serializeHeartbeat
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MIBUNFCCommand *)self payload];
  uint64_t v5 = [v4 objectForKey:@"HeartbeatPeriod"];

  if (v5)
  {
    uint64_t v6 = [(MIBUNFCCommand *)self payload];
    uint64_t v7 = [v6 objectForKey:@"HeartbeatTimeout"];

    v18[0] = v5;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    char v9 = [v3 serialize:&unk_26E53EB98 withValue:v8];

    if (v9)
    {
      uint64_t v17 = v7;
      int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
      char v11 = [v3 serialize:&unk_26E53EBB0 withValue:v10];

      if (v11)
      {
        uint64_t v12 = [v3 serializedData];

        goto LABEL_5;
      }
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_94_0);
      }
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        -[MIBUNFCCommand _serializeHeartbeat]();
      }
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_86);
      }
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        -[MIBUNFCCommand _serializeHeartbeat]();
      }
    }
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_75);
    }
    unsigned int v14 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      [(MIBUNFCCommand *)v14 _serializeHeartbeat];
    }
  }
  uint64_t v12 = 0;
LABEL_5:

  return v12;
}

void __37__MIBUNFCCommand__serializeHeartbeat__block_invoke()
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

void __37__MIBUNFCCommand__serializeHeartbeat__block_invoke_84()
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

void __37__MIBUNFCCommand__serializeHeartbeat__block_invoke_92()
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

- (id)_serializeConfigureNFC
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(MIBUNFCCommand *)self payload];
  uint64_t v5 = [v4 objectForKey:@"NFCInactivityTimeout"];

  if (v5)
  {
    v13[0] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    char v7 = [v3 serialize:&unk_26E53EBC8 withValue:v6];

    if (v7)
    {
      uint64_t v8 = [v3 serializedData];
      goto LABEL_4;
    }
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_104);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _serializeConfigureNFC]();
    }
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_96);
    }
    int v10 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      [(MIBUNFCCommand *)v10 _serializeConfigureNFC];
    }
  }
  uint64_t v8 = 0;
LABEL_4:

  return v8;
}

void __40__MIBUNFCCommand__serializeConfigureNFC__block_invoke()
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

void __40__MIBUNFCCommand__serializeConfigureNFC__block_invoke_102()
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

- (id)_serializeStartDiag
{
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_106);
  }
  uint64_t v3 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2309BC000, v3, OS_LOG_TYPE_DEFAULT, "Serializing startDiag command", v7, 2u);
  }
  uint64_t v4 = [(MIBUNFCCommand *)self payload];
  uint64_t v5 = [(MIBUNFCCommand *)self _serializeTatsuPayload:v4];

  return v5;
}

void __37__MIBUNFCCommand__serializeStartDiag__block_invoke()
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

- (id)_serializeTatsuPayload:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v3 objectForKey:@"TatsuTicket"];
  uint64_t v6 = [v3 objectForKey:@"TimeStamp"];

  if (v6)
  {
    if (v5)
    {
      v20[0] = v5;
      uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
      char v8 = [v4 serialize:&unk_26E53EBE0 withValue:v7];

      if (v8)
      {
        BOOL v19 = v6;
        uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
        char v10 = [v4 serialize:&unk_26E53EBF8 withValue:v9];

        if (v10)
        {
          uint64_t v11 = [v4 serializedData];
          goto LABEL_6;
        }
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_127);
        }
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          -[MIBUNFCCommand _serializeTatsuPayload:]();
        }
      }
      else
      {
        if (MIBUOnceToken != -1) {
          dispatch_once(&MIBUOnceToken, &__block_literal_global_119);
        }
        if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
          -[MIBUNFCCommand _serializeTatsuPayload:].cold.4();
        }
      }
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_111_0);
      }
      uint64_t v16 = MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        [(MIBUNFCCommand *)v16 _serializeTatsuPayload:v18];
      }
    }
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_108);
    }
    uint64_t v13 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      [(MIBUNFCCommand *)v13 _serializeTatsuPayload:v15];
    }
  }
  uint64_t v11 = 0;
LABEL_6:

  return v11;
}

void __41__MIBUNFCCommand__serializeTatsuPayload___block_invoke()
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

void __41__MIBUNFCCommand__serializeTatsuPayload___block_invoke_109()
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

void __41__MIBUNFCCommand__serializeTatsuPayload___block_invoke_117()
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

void __41__MIBUNFCCommand__serializeTatsuPayload___block_invoke_125()
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

- (BOOL)_deserializeStartUpdate
{
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_129);
  }
  uint64_t v3 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2309BC000, v3, OS_LOG_TYPE_DEFAULT, "Deserialize startUpdate command", v5, 2u);
  }
  return [(MIBUNFCCommand *)self _deserializeTatsuPayload];
}

void __41__MIBUNFCCommand__deserializeStartUpdate__block_invoke()
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

- (BOOL)_deserializeRetryAfter
{
  uint64_t v3 = [[MIBUDeserializer alloc] initWithData:self->_serializedPayload];
  uint64_t v4 = [(MIBUDeserializer *)v3 deserialize];

  if (!v4)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_132_0);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _initWithAPDU:]();
    }
    goto LABEL_20;
  }
  uint64_t v5 = [v4 objectForKey:&unk_26E53EA48];
  if (!v5)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_135);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _deserializeRetryAfter]();
    }
    goto LABEL_20;
  }
  uint64_t v6 = v5;
  [v5 doubleValue];
  if (v7 <= 0.0 || ([v6 doubleValue], v8 >= 300.0))
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_138_0);
    }
    uint64_t v12 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _deserializeRetryAfter](v12);
    }

LABEL_20:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = [(MIBUNFCCommand *)self mutablePayload];
  [v9 setObject:v6 forKey:@"RetryAfter"];

  BOOL v10 = 1;
LABEL_6:

  return v10;
}

void __40__MIBUNFCCommand__deserializeRetryAfter__block_invoke()
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

void __40__MIBUNFCCommand__deserializeRetryAfter__block_invoke_133()
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

void __40__MIBUNFCCommand__deserializeRetryAfter__block_invoke_136()
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

- (BOOL)_deserializeHeartbeat
{
  uint64_t v3 = [[MIBUDeserializer alloc] initWithData:self->_serializedPayload];
  uint64_t v4 = [(MIBUDeserializer *)v3 deserialize];

  if (!v4)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_140);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _initWithAPDU:].cold.4();
    }
    goto LABEL_32;
  }
  uint64_t v5 = [v4 objectForKey:&unk_26E53EA60];
  if (!v5)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_143);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _deserializeHeartbeat]();
    }
    goto LABEL_32;
  }
  uint64_t v6 = v5;
  [v5 doubleValue];
  if (v7 < 0.0 || ([v6 doubleValue], v8 >= 300.0))
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_146);
    }
    uint64_t v17 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _deserializeHeartbeat](v17);
    }
    goto LABEL_31;
  }
  uint64_t v9 = [v4 objectForKey:&unk_26E53EA78];
  if (!v9)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_149);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _deserializeHeartbeat].cold.4();
    }
    goto LABEL_31;
  }
  BOOL v10 = v9;
  [v9 doubleValue];
  if (v11 < 0.0 || ([v6 doubleValue], v12 >= 300.0))
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_152);
    }
    uint64_t v18 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _deserializeHeartbeat].cold.5(v18);
    }

LABEL_31:
LABEL_32:
    BOOL v15 = 0;
    goto LABEL_9;
  }
  uint64_t v13 = [(MIBUNFCCommand *)self mutablePayload];
  [v13 setObject:v6 forKey:@"HeartbeatPeriod"];

  uint64_t v14 = [(MIBUNFCCommand *)self mutablePayload];
  [v14 setObject:v10 forKey:@"HeartbeatTimeout"];

  BOOL v15 = 1;
LABEL_9:

  return v15;
}

void __39__MIBUNFCCommand__deserializeHeartbeat__block_invoke()
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

void __39__MIBUNFCCommand__deserializeHeartbeat__block_invoke_141()
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

void __39__MIBUNFCCommand__deserializeHeartbeat__block_invoke_144()
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

void __39__MIBUNFCCommand__deserializeHeartbeat__block_invoke_147()
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

void __39__MIBUNFCCommand__deserializeHeartbeat__block_invoke_150()
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

- (BOOL)_deserializeConfigureNFC
{
  uint64_t v3 = [[MIBUDeserializer alloc] initWithData:self->_serializedPayload];
  uint64_t v4 = [(MIBUDeserializer *)v3 deserialize];

  if (!v4)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_154);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _deserializeConfigureNFC]();
    }
    goto LABEL_19;
  }
  uint64_t v5 = [v4 objectForKey:&unk_26E53EA90];
  if (!v5)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_157);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _deserializeConfigureNFC]();
    }
    goto LABEL_19;
  }
  uint64_t v6 = v5;
  [v5 doubleValue];
  if (v7 < 0.0)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_160);
    }
    double v11 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _deserializeConfigureNFC](v11);
    }

LABEL_19:
    BOOL v9 = 0;
    goto LABEL_5;
  }
  uint64_t v8 = [(MIBUNFCCommand *)self mutablePayload];
  [v8 setObject:v6 forKey:@"NFCInactivityTimeout"];

  BOOL v9 = 1;
LABEL_5:

  return v9;
}

void __42__MIBUNFCCommand__deserializeConfigureNFC__block_invoke()
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

void __42__MIBUNFCCommand__deserializeConfigureNFC__block_invoke_155()
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

void __42__MIBUNFCCommand__deserializeConfigureNFC__block_invoke_158()
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

- (BOOL)_deserializeStartDiag
{
  if (MIBUOnceToken != -1) {
    dispatch_once(&MIBUOnceToken, &__block_literal_global_162);
  }
  uint64_t v3 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2309BC000, v3, OS_LOG_TYPE_DEFAULT, "Deserialize startDiag command", v5, 2u);
  }
  return [(MIBUNFCCommand *)self _deserializeTatsuPayload];
}

void __39__MIBUNFCCommand__deserializeStartDiag__block_invoke()
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

- (BOOL)_deserializeTatsuPayload
{
  uint64_t v3 = [[MIBUDeserializer alloc] initWithData:self->_serializedPayload];
  uint64_t v4 = [(MIBUDeserializer *)v3 deserialize];

  if (!v4)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_164);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _deserializeTatsuPayload]();
    }
    goto LABEL_19;
  }
  uint64_t v5 = [v4 objectForKey:&unk_26E53EAA8];
  if (!v5)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_167);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _deserializeTatsuPayload]();
    }
    goto LABEL_19;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [v4 objectForKey:&unk_26E53EAC0];
  if (!v7)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_170);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCCommand _deserializeTatsuPayload]();
    }

LABEL_19:
    BOOL v11 = 0;
    goto LABEL_5;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [(MIBUNFCCommand *)self mutablePayload];
  [v9 setObject:v6 forKey:@"TatsuTicket"];

  BOOL v10 = [(MIBUNFCCommand *)self mutablePayload];
  [v10 setObject:v8 forKey:@"TimeStamp"];

  BOOL v11 = 1;
LABEL_5:

  return v11;
}

void __42__MIBUNFCCommand__deserializeTatsuPayload__block_invoke()
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

void __42__MIBUNFCCommand__deserializeTatsuPayload__block_invoke_165()
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

void __42__MIBUNFCCommand__deserializeTatsuPayload__block_invoke_168()
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

- (int64_t)code
{
  return self->_code;
}

- (NSData)apdu
{
  return self->_apdu;
}

- (unsigned)cla
{
  return self->_cla;
}

- (unsigned)ins
{
  return self->_ins;
}

- (unsigned)p1
{
  return self->_p1;
}

- (unsigned)p2
{
  return self->_p2;
}

- (NSData)serializedPayload
{
  return self->_serializedPayload;
}

- (NSMutableDictionary)mutablePayload
{
  return self->_mutablePayload;
}

- (void)setMutablePayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePayload, 0);
  objc_storeStrong((id *)&self->_serializedPayload, 0);

  objc_storeStrong((id *)&self->_apdu, 0);
}

- (void)_initWithCommandCode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_4_2(&dword_2309BC000, a2, a3, "Unrecognized command code %ld; failed to initialize command object",
    (uint8_t *)&v3);
}

- (void)_initWithCommandCode:(uint64_t)a3 .cold.2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_4_2(&dword_2309BC000, a2, a3, "Failed to serialize payload dictionary for command: %ld", (uint8_t *)&v4);
}

- (void)_initWithAPDU:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_2_0(&dword_2309BC000, v4, v5, "APDU too short; length = %lu", v6, v7, v8, v9, 0);
}

- (void)_initWithAPDU:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize SU Start command", v2, v3, v4, v5, v6);
}

- (void)_initWithAPDU:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize RetryAfter command", v2, v3, v4, v5, v6);
}

- (void)_initWithAPDU:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize Heartbeat command", v2, v3, v4, v5, v6);
}

- (void)_initWithAPDU:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize ConfigureNFC command", v2, v3, v4, v5, v6);
}

- (void)_initWithAPDU:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize startDiag command", v2, v3, v4, v5, v6);
}

- (void)_initWithAPDU:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Only handling APDU command with Le=0x00", v2, v3, v4, v5, v6);
}

- (void)_initWithAPDU:(void *)a1 .cold.8(void *a1, void *a2)
{
  id v3 = a1;
  [a2 length];
  OUTLINED_FUNCTION_2_0(&dword_2309BC000, v4, v5, "APDU has 3 byte Lc field but length = %lu", v6, v7, v8, v9, 0);
}

- (void)_initWithAPDU:(void *)a3 .cold.9(unsigned __int16 a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = a1;
  uint64_t v5 = a2;
  v6[0] = 67109376;
  v6[1] = v4;
  __int16 v7 = 2048;
  uint64_t v8 = [a3 length];
  _os_log_error_impl(&dword_2309BC000, v5, OS_LOG_TYPE_ERROR, "APDU has Lc=%d; but APDU has length=%lu",
    (uint8_t *)v6,
    0x12u);
}

- (void)_initWithAPDU:(int)a1 .cold.10(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2309BC000, a2, OS_LOG_TYPE_ERROR, "Unsupported APDU CLA %x", (uint8_t *)v2, 8u);
}

- (void)_serializeRetryAfter
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_1(&dword_2309BC000, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_serializeHeartbeat
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_1(&dword_2309BC000, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_serializeConfigureNFC
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_1(&dword_2309BC000, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_serializeTatsuPayload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138543362;
  uint64_t v4 = @"TimeStamp";
  OUTLINED_FUNCTION_4_2(&dword_2309BC000, a1, a3, "Failed start tatsu ticket payload serialization; payload does not have %{public}@ key",
    (uint8_t *)&v3);
}

- (void)_serializeTatsuPayload:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138543362;
  uint64_t v4 = @"TatsuTicket";
  OUTLINED_FUNCTION_4_2(&dword_2309BC000, a1, a3, "Failed start tatsu ticket payload serialization; payload does not have %{public}@ key",
    (uint8_t *)&v3);
}

- (void)_serializeTatsuPayload:.cold.3()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_1(&dword_2309BC000, v0, v1, "Failed to serialize %{public}@ key with value: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_serializeTatsuPayload:.cold.4()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_5_1(&dword_2309BC000, v0, v1, "Failed to serialize %{public}@ key with data: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_deserializeRetryAfter
{
  id v2 = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_0(&dword_2309BC000, v3, v4, "Invalid RetryAfter time %lfs", v5, v6, v7, v8, v9);
}

- (void)_deserializeHeartbeat
{
  id v2 = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_0(&dword_2309BC000, v3, v4, "Invalid heartbeat timeout %lfs", v5, v6, v7, v8, v9);
}

- (void)_deserializeConfigureNFC
{
  id v2 = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_2_0(&dword_2309BC000, v3, v4, "Invalid nfcInactivity timeout %lfs", v5, v6, v7, v8, v9);
}

- (void)_deserializeTatsuPayload
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize timestamp from command APDU", v2, v3, v4, v5, v6);
}

@end