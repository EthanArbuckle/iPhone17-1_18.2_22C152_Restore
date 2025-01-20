@interface NFAccessoryTagI2CBridge
- (BOOL)_bridgeType0WritePollForSystemReadyWithTimeout:(double)a3 beforeWrite:(BOOL)a4 outError:(id *)a5;
- (BOOL)selected;
- (NFAccessoryTagI2CBridge)init;
- (NFAccessoryTagI2CBridge)initWithDelegate:(id)a3;
- (NFAccessoryTagI2CBridge)initWithType:(int64_t)a3 delegate:(id)a4;
- (NSData)tagUUID;
- (id)_bridgeType0ReadMultipleSRAMPagesWithBuffer:(id)a3;
- (id)_bridgeType0WriteOneSRAMPage:(id)a3 fragmentationSupport:(BOOL)a4 isLastPage:(BOOL)a5;
- (id)_bridgeType0WritePollForCompletionWithTimeout:(double)a3;
- (id)_readFromBridgeType0:(id *)a3 fragmentationSupport:(BOOL)a4;
- (id)_selectTagType0;
- (id)_type0GetSystemInfo:(id *)a3;
- (id)_type0ReadConfigRange:(_NSRange)a3 data:(id *)a4;
- (id)_type0ReadConfigReg:(unsigned __int8)a3 data:(id *)a4;
- (id)_type0ReadSRAM:(unsigned __int8)a3 numOfBlocks:(unsigned __int8)a4 data:(id *)a5;
- (id)_type0WriteConfigReg:(unsigned __int8)a3 data:(id)a4;
- (id)_type0WriteSRAM:(unsigned __int8)a3 data:(id)a4;
- (id)_writeToBridgeType0:(id)a3 fragmentationSupport:(BOOL)a4;
- (id)readFromBridge:(id)a3 fragmentationSupport:(BOOL)a4 response:(id *)a5;
- (id)selectTag;
- (id)writeToBridge:(id)a3 fragmentationSupport:(BOOL)a4 response:(id *)a5;
- (int)transactionCounter;
- (int64_t)type;
- (void)_bridgeType0CreateAccessoryHeaderWithBuffer:(id)a3 pageLength:(unint64_t)a4 isLastPage:(BOOL)a5;
- (void)setSelected:(BOOL)a3;
- (void)setTagUUID:(id)a3;
- (void)setTransactionCounter:(int)a3;
@end

@implementation NFAccessoryTagI2CBridge

- (NFAccessoryTagI2CBridge)init
{
  return 0;
}

- (NFAccessoryTagI2CBridge)initWithDelegate:(id)a3
{
  return [(NFAccessoryTagI2CBridge *)self initWithType:0 delegate:a3];
}

- (NFAccessoryTagI2CBridge)initWithType:(int64_t)a3 delegate:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NFAccessoryTagI2CBridge;
  result = [(NFAccessoryTag *)&v6 initWithDelegate:a4];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (id)selectTag
{
  if (self->_type)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
    v3 = (void *)[v2 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:0 userInfo:0];
  }
  else
  {
    v3 = [(NFAccessoryTagI2CBridge *)self _selectTagType0];
  }

  return v3;
}

- (id)writeToBridge:(id)a3 fragmentationSupport:(BOOL)a4 response:(id *)a5
{
  if (self->_type)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    objc_super v6 = (void *)[v5 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:0 userInfo:0];
  }
  else
  {
    *a5 = 0;
    objc_super v6 = [(NFAccessoryTagI2CBridge *)self _writeToBridgeType0:a3 fragmentationSupport:a4];
  }

  return v6;
}

- (id)readFromBridge:(id)a3 fragmentationSupport:(BOOL)a4 response:(id *)a5
{
  if (self->_type)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    objc_super v6 = (void *)[v5 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:0 userInfo:0];
  }
  else
  {
    objc_super v6 = [(NFAccessoryTagI2CBridge *)self _readFromBridgeType0:a5 fragmentationSupport:a4];
  }

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)tagUUID
{
  return self->_tagUUID;
}

- (void)setTagUUID:(id)a3
{
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (int)transactionCounter
{
  return self->_transactionCounter;
}

- (void)setTransactionCounter:(int)a3
{
  self->_transactionCounter = a3;
}

- (void).cxx_destruct
{
}

- (id)_selectTagType0
{
  uint64_t v3 = [(NFAccessoryTagI2CBridge *)self tagUUID];
  if (v3
    && (v4 = (void *)v3,
        [(NFAccessoryTagI2CBridge *)self tagUUID],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        v6 != 8))
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    v11 = (void *)[v13 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:1 userInfo:0];
  }
  else
  {
    __int16 v18 = 9506;
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&v18 length:2];
    v8 = [(NFAccessoryTagI2CBridge *)self tagUUID];
    [v7 appendData:v8];

    v9 = NFSharedSignpostLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA51A000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_select", (const char *)&unk_1CA5493FD, buf, 2u);
    }

    v10 = [(NFAccessoryTag *)self delegate];
    id v16 = 0;
    v11 = [v10 transceive:v7 response:&v16 maxTimeout:2.0];
    id v12 = v16;

    if (!v11)
    {
      if (*(unsigned char *)[v12 bytes])
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
        v11 = (void *)[v14 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:4 userInfo:0];
      }
      else
      {
        [(NFAccessoryTagI2CBridge *)self setSelected:1];
        [(NFAccessoryTagI2CBridge *)self setTransactionCounter:1];
        v11 = 0;
      }
    }
  }

  return v11;
}

- (BOOL)_bridgeType0WritePollForSystemReadyWithTimeout:(double)a3 beforeWrite:(BOOL)a4 outError:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v8 = [MEMORY[0x1E4F1C9C8] now];
  v9 = NFSharedSignpostLog();
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 67240192;
    int v31 = v5;
    _os_signpost_emit_with_name_impl(&dword_1CA51A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_pollForSystemReady", "beforeWrite=%{public,signpost.description:attribute}d", buf, 8u);
  }

  char v10 = 0;
  BOOL v11 = 0;
  while (1)
  {
    if (v11)
    {
      BOOL v11 = 1;
LABEL_20:
      v26 = NFSharedSignpostLog();
      if (os_signpost_enabled(v26))
      {
        *(_DWORD *)buf = 67240192;
        int v31 = v10 & 1;
        _os_signpost_emit_with_name_impl(&dword_1CA51A000, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_pollForSystemReady", "timeout=%{public,signpost.description:attribute}d", buf, 8u);
      }
      id v13 = 0;
      goto LABEL_26;
    }
    id v12 = (void *)MEMORY[0x1CB7976C0]();
    id v29 = 0;
    id v13 = -[NFAccessoryTagI2CBridge _type0ReadConfigRange:data:](self, "_type0ReadConfigRange:data:", 160, 2, &v29);
    id v14 = v29;
    v15 = v14;
    if (v13) {
      break;
    }
    id v16 = [v14 subdataWithRange:0, 4];
    [v15 subdataWithRange:NSMakeRange(4, 4)];
    id v17 = objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 bytes];
    id v19 = v16;
    v20 = (unsigned __int8 *)[v19 bytes];
    int v21 = *(unsigned char *)(v18 + 1) & 0xE;
    if (v5)
    {
      if (v21 == 10 && (~*v20 & 7) == 0) {
        goto LABEL_13;
      }
    }
    else if (v21 == 10 && (*v20 & 0x27) == 0x23 && (v20[1] & 2) == 0)
    {
LABEL_13:
      BOOL v11 = 1;
LABEL_16:
      char v25 = 1;
      goto LABEL_17;
    }
    v22 = [MEMORY[0x1E4F1C9C8] now];
    [v8 timeIntervalSinceDate:v22];
    double v24 = v23;

    BOOL v11 = 0;
    if (v24 <= a3) {
      goto LABEL_16;
    }
    char v25 = 0;
    char v10 = 1;
LABEL_17:

    if ((v25 & 1) == 0) {
      goto LABEL_20;
    }
  }

  v26 = NFSharedSignpostLog();
  if (os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA51A000, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_pollForSystemReady", "ReadConfigError", buf, 2u);
  }
  BOOL v11 = 0;
LABEL_26:

  if (a5) {
    *a5 = v13;
  }

  return v11;
}

- (void)_bridgeType0CreateAccessoryHeaderWithBuffer:(id)a3 pageLength:(unint64_t)a4 isLastPage:(BOOL)a5
{
  char v9 = a4;
  id v7 = a3;
  __int16 v10 = [(NFAccessoryTagI2CBridge *)self transactionCounter];
  BOOL v11 = a5;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v9 length:4];
  [v7 appendData:v8];
}

- (id)_bridgeType0WritePollForCompletionWithTimeout:(double)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v6 = NFSharedSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA51A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_pollForWriteComplete", (const char *)&unk_1CA5493FD, buf, 2u);
  }

  while (1)
  {
    id v7 = (void *)MEMORY[0x1CB7976C0]();
    id v22 = 0;
    v8 = [(NFAccessoryTagI2CBridge *)self _type0ReadConfigReg:160 data:&v22];
    id v9 = v22;
    if (v8)
    {

      id v17 = NFSharedSignpostLog();
      if (!os_signpost_enabled(v17)) {
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      uint64_t v18 = "error";
      id v19 = v17;
      uint32_t v20 = 2;
      goto LABEL_14;
    }
    id v10 = v9;
    BOOL v11 = (unsigned char *)[v10 bytes];
    if ((*v11 & 0x20) == 0 && (v11[1] & 2) == 0) {
      break;
    }
    id v12 = [MEMORY[0x1E4F1C9C8] now];
    [v5 timeIntervalSinceDate:v12];
    double v14 = v13;

    if (v14 > a3)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      v8 = (void *)[v15 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:5 userInfo:0];
      int v16 = 0;
      goto LABEL_12;
    }
  }

  v8 = 0;
  int v16 = 1;
LABEL_12:
  id v17 = NFSharedSignpostLog();
  if (!os_signpost_enabled(v17)) {
    goto LABEL_15;
  }
  *(_DWORD *)buf = 67240192;
  int v24 = v16;
  uint64_t v18 = "systemReady=%{public,signpost.description:attribute}d";
  id v19 = v17;
  uint32_t v20 = 8;
LABEL_14:
  _os_signpost_emit_with_name_impl(&dword_1CA51A000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_pollForWriteComplete", v18, buf, v20);
LABEL_15:

  return v8;
}

- (id)_bridgeType0WriteOneSRAMPage:(id)a3 fragmentationSupport:(BOOL)a4 isLastPage:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_opt_new();
  if (v6) {
    -[NFAccessoryTagI2CBridge _bridgeType0CreateAccessoryHeaderWithBuffer:pageLength:isLastPage:](self, "_bridgeType0CreateAccessoryHeaderWithBuffer:pageLength:isLastPage:", v9, [v8 length], v5);
  }
  [v9 appendData:v8];
  uint64_t v10 = [v9 length] & 3;
  if (v10)
  {
    BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 - v10];
    [v9 appendData:v11];
  }
  id v12 = NFSharedSignpostLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA51A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write1SRAMPage", (const char *)&unk_1CA5493FD, buf, 2u);
  }

  unint64_t v13 = [v9 length];
  if (v13 < 0xFC)
  {
    uint64_t v18 = [(NFAccessoryTagI2CBridge *)self _type0WriteSRAM:1 data:v9];
    if (v18)
    {
      int v16 = (void *)v18;
      id v17 = NFSharedSignpostLog();
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        goto LABEL_21;
      }
LABEL_22:

      goto LABEL_23;
    }
  }
  else
  {
    unint64_t v14 = v13;
    id v15 = [v9 subdataWithRange:0, 248];
    int v16 = [(NFAccessoryTagI2CBridge *)self _type0WriteSRAM:1 data:v15];

    if (v16)
    {
      id v17 = NFSharedSignpostLog();
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
LABEL_21:
        _os_signpost_emit_with_name_impl(&dword_1CA51A000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write1SRAMPage", "error", buf, 2u);
        goto LABEL_22;
      }
      goto LABEL_22;
    }
    id v19 = [v9 subdataWithRange:248, (v14 & 0xFFFFFFFFFFFFFFFCLL) - 248];
    int v16 = [(NFAccessoryTagI2CBridge *)self _type0WriteSRAM:63 data:v19];

    if (v16)
    {
      id v17 = NFSharedSignpostLog();
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  if ((unint64_t)[v9 length] <= 0xFC)
  {
    int v23 = -272716322;
    uint32_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v23 length:4];
    int v16 = [(NFAccessoryTagI2CBridge *)self _type0WriteSRAM:63 data:v20];

    if (v16)
    {
      id v17 = NFSharedSignpostLog();
      if (os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  id v22 = NFSharedSignpostLog();
  if (os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 67240192;
    BOOL v25 = v5;
    _os_signpost_emit_with_name_impl(&dword_1CA51A000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write1SRAMPage", "isLastPage=%{public,signpost.description:attribute}d", buf, 8u);
  }

  int v16 = [(NFAccessoryTagI2CBridge *)self _bridgeType0WritePollForCompletionWithTimeout:0.5];
LABEL_23:

  return v16;
}

- (id)_writeToBridgeType0:(id)a3 fragmentationSupport:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = [v7 length];
  unint64_t v9 = v8;
  if (v4) {
    unint64_t v10 = 248;
  }
  else {
    unint64_t v10 = 256;
  }
  if (v8 % v10) {
    uint64_t v11 = v8 / v10 + 1;
  }
  else {
    uint64_t v11 = v8 / v10;
  }
  id v12 = NFSharedSignpostLog();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA51A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write", (const char *)&unk_1CA5493FD, buf, 2u);
  }

  if (v11)
  {
    uint64_t v13 = 0;
    while (1)
    {
      id v39 = 0;
      BOOL v14 = [(NFAccessoryTagI2CBridge *)self _bridgeType0WritePollForSystemReadyWithTimeout:1 beforeWrite:&v39 outError:0.5];
      id v15 = v39;
      if (v15)
      {
        uint64_t v18 = v15;
        int v21 = NFSharedSignpostLog();
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
          goto LABEL_43;
        }
LABEL_44:

        goto LABEL_45;
      }
      if (!v14) {
        break;
      }
      if (v9 >= v10) {
        unint64_t v16 = v10;
      }
      else {
        unint64_t v16 = v9;
      }
      id v17 = [v7 subdataWithRange:v13, v16];
      uint64_t v18 = [(NFAccessoryTagI2CBridge *)self _bridgeType0WriteOneSRAMPage:v17 fragmentationSupport:v4 isLastPage:v9 <= v10];

      if (v18)
      {
        int v21 = NFSharedSignpostLog();
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
LABEL_43:
          _os_signpost_emit_with_name_impl(&dword_1CA51A000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write", "error", buf, 2u);
        }
        goto LABEL_44;
      }
      if (v9 >= v10) {
        v9 -= v10;
      }
      else {
        unint64_t v9 = 0;
      }
      v13 += v10;
      if (!--v11) {
        goto LABEL_21;
      }
    }
    id v22 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    int v24 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v24)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v28 = 45;
      if (isMetaClass) {
        uint64_t v28 = 43;
      }
      v24(6, "%c[%{public}s %{public}s]:%i System not ready.  Abort", v28, ClassName, Name, 297);
      id v22 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    id v29 = dispatch_get_specific(v22);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v30 = (id)_NFSharedLogClient[(void)v29];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = object_getClass(self);
      if (class_isMetaClass(v31)) {
        int v32 = 43;
      }
      else {
        int v32 = 45;
      }
      v33 = object_getClassName(self);
      v34 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v41 = v32;
      *(_WORD *)&v41[4] = 2082;
      *(void *)&v41[6] = v33;
      __int16 v42 = 2082;
      v43 = v34;
      __int16 v44 = 1024;
      int v45 = 297;
      _os_log_impl(&dword_1CA51A000, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i System not ready.  Abort", buf, 0x22u);
    }

    v35 = NFSharedSignpostLog();
    if (os_signpost_enabled(v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA51A000, v35, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write", "systemNotReady", buf, 2u);
    }

    id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v18 = (void *)[v36 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:5 userInfo:0];
  }
  else
  {
LABEL_21:
    id v19 = NFSharedSignpostLog();
    if (os_signpost_enabled(v19))
    {
      uint64_t v20 = [v7 length];
      *(_DWORD *)buf = 134349056;
      *(void *)v41 = v20;
      _os_signpost_emit_with_name_impl(&dword_1CA51A000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_write", "totalLen=%{public,signpost.description:attribute}lu", buf, 0xCu);
    }

    [(NFAccessoryTagI2CBridge *)self setTransactionCounter:[(NFAccessoryTagI2CBridge *)self transactionCounter] + 1];
    uint64_t v18 = 0;
  }
LABEL_45:

  return v18;
}

- (id)_bridgeType0ReadMultipleSRAMPagesWithBuffer:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = 0;
  while (1)
  {
    id v47 = v5;
    BOOL v6 = [(NFAccessoryTagI2CBridge *)self _bridgeType0WritePollForSystemReadyWithTimeout:0 beforeWrite:&v47 outError:0.5];
    id v7 = v47;

    if (v7) {
      goto LABEL_41;
    }
    if (!v6) {
      break;
    }
    unint64_t v8 = NFSharedSignpostLog();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA51A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read1SRAMPage", (const char *)&unk_1CA5493FD, buf, 2u);
    }

    id v46 = 0;
    id v7 = [(NFAccessoryTagI2CBridge *)self _type0ReadSRAM:1 numOfBlocks:4 data:&v46];
    id v9 = v46;
    id v10 = v9;
    if (v7)
    {
      v37 = NFSharedSignpostLog();
      if (os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA51A000, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read1SRAMPage", "error", buf, 2u);
      }

      goto LABEL_40;
    }
    id v10 = v9;
    uint64_t v11 = (unsigned __int8 *)[v10 bytes];
    unsigned int v12 = *v11;
    if (v12 >= 0xF9)
    {
      v38 = NFSharedSignpostLog();
      if (os_signpost_enabled(v38))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA51A000, v38, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read1SRAMPage", "error", buf, 2u);
      }

      id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v7 = (id)[v39 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:4 userInfo:0];
      goto LABEL_40;
    }
    unsigned __int8 v13 = v11[3];
    if (v12 < 0xD)
    {
      id v19 = [v10 subdataWithRange:4];
      [v4 appendData:v19];

      id v17 = v10;
LABEL_13:
      id v44 = v17;
      BOOL v5 = [(NFAccessoryTagI2CBridge *)self _type0ReadSRAM:63 numOfBlocks:1 data:&v44];
      id v20 = v44;

      id v17 = v20;
      goto LABEL_14;
    }
    uint64_t v14 = v12 - 12;
    id v15 = [v10 subdataWithRange:4, 12];
    [v4 appendData:v15];

    unsigned int v16 = vcvtpd_s64_f64((double)(int)v14 * 0.25);
    id v45 = v10;
    id v7 = [(NFAccessoryTagI2CBridge *)self _type0ReadSRAM:5 numOfBlocks:v16 data:&v45];
    id v17 = v45;

    if (v7)
    {
      v40 = NFSharedSignpostLog();
      if (os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA51A000, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read1SRAMPage", "error", buf, 2u);
      }

      id v10 = v17;
LABEL_40:

      goto LABEL_41;
    }
    uint64_t v18 = [v17 subdataWithRange:0, v14];
    [v4 appendData:v18];

    BOOL v5 = 0;
    if ((v16 & 0xFFFFFFFE) != 0x3A) {
      goto LABEL_13;
    }
LABEL_14:
    int v21 = v13 & 1;
    id v22 = NFSharedSignpostLog();
    if (os_signpost_enabled(v22))
    {
      *(_DWORD *)buf = 67240192;
      int v49 = v21;
      _os_signpost_emit_with_name_impl(&dword_1CA51A000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read1SRAMPage", "isLastPage=%{public,signpost.description:attribute}d", buf, 8u);
    }

    if (v21)
    {

      id v7 = 0;
      goto LABEL_41;
    }
  }
  int v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4) {
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  BOOL v25 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
  if (v25)
  {
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v29 = 45;
    if (isMetaClass) {
      uint64_t v29 = 43;
    }
    v25(3, "%c[%{public}s %{public}s]:%i System not ready.  Abort", v29, ClassName, Name, 341);
    int v23 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v30 = dispatch_get_specific(v23);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  int v31 = (id)_NFSharedLogClient[(void)v30];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    int v32 = object_getClass(self);
    if (class_isMetaClass(v32)) {
      int v33 = 43;
    }
    else {
      int v33 = 45;
    }
    v34 = object_getClassName(self);
    v35 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v49 = v33;
    __int16 v50 = 2082;
    v51 = v34;
    __int16 v52 = 2082;
    v53 = v35;
    __int16 v54 = 1024;
    int v55 = 341;
    _os_log_impl(&dword_1CA51A000, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i System not ready.  Abort", buf, 0x22u);
  }

  id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v7 = (id)[v36 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:5 userInfo:0];
LABEL_41:

  return v7;
}

- (id)_readFromBridgeType0:(id *)a3 fragmentationSupport:(BOOL)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = NFSharedSignpostLog();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA51A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read", (const char *)&unk_1CA5493FD, buf, 2u);
  }

  if (a4)
  {
    id v9 = objc_opt_new();
    id v10 = [(NFAccessoryTagI2CBridge *)self _bridgeType0ReadMultipleSRAMPagesWithBuffer:v9];
    if (v10)
    {
      uint64_t v11 = NFSharedSignpostLog();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        unsigned int v12 = "error";
        unsigned __int8 v13 = v11;
        uint32_t v14 = 2;
LABEL_13:
        _os_signpost_emit_with_name_impl(&dword_1CA51A000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read", v12, buf, v14);
      }
    }
    else
    {
      *a3 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:v9];
      uint64_t v11 = NFSharedSignpostLog();
      if (os_signpost_enabled(v11))
      {
        uint64_t v20 = [v9 length];
        *(_DWORD *)buf = 134349056;
        *(void *)id v47 = v20;
        unsigned int v12 = "totalLen=%{public,signpost.description:attribute}lu";
        unsigned __int8 v13 = v11;
        uint32_t v14 = 12;
        goto LABEL_13;
      }
    }

    id v21 = v10;
    goto LABEL_37;
  }
  id v45 = 0;
  BOOL v15 = [(NFAccessoryTagI2CBridge *)self _bridgeType0WritePollForSystemReadyWithTimeout:0 beforeWrite:&v45 outError:0.5];
  id v16 = v45;
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = NFSharedSignpostLog();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA51A000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read", "error", buf, 2u);
    }

    id v19 = v17;
    goto LABEL_36;
  }
  if (!v15)
  {
    uint64_t v26 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    uint64_t v28 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v28)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v32 = 45;
      if (isMetaClass) {
        uint64_t v32 = 43;
      }
      v28(3, "%c[%{public}s %{public}s]:%i System not ready.  Abort", v32, ClassName, Name, 425);
      uint64_t v26 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    int v33 = dispatch_get_specific(v26);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v34 = (id)_NFSharedLogClient[(void)v33];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v35 = object_getClass(self);
      if (class_isMetaClass(v35)) {
        int v36 = 43;
      }
      else {
        int v36 = 45;
      }
      v37 = object_getClassName(self);
      v38 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)id v47 = v36;
      *(_WORD *)&v47[4] = 2082;
      *(void *)&v47[6] = v37;
      __int16 v48 = 2082;
      int v49 = v38;
      __int16 v50 = 1024;
      int v51 = 425;
      _os_log_impl(&dword_1CA51A000, v34, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i System not ready.  Abort", buf, 0x22u);
    }

    id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v22 = (void *)[v39 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:5 userInfo:0];
    int v23 = NFSharedSignpostLog();
    if (!os_signpost_enabled(v23)) {
      goto LABEL_35;
    }
    *(_WORD *)buf = 0;
    BOOL v25 = "systemNotReady";
    goto LABEL_33;
  }
  id v22 = [(NFAccessoryTagI2CBridge *)self _type0ReadSRAM:0 numOfBlocks:64 data:a3];
  int v23 = NFSharedSignpostLog();
  BOOL v24 = os_signpost_enabled(v23);
  if (!v22)
  {
    if (!v24) {
      goto LABEL_35;
    }
    uint64_t v43 = [*a3 length];
    *(_DWORD *)buf = 134349056;
    *(void *)id v47 = v43;
    BOOL v25 = "totalLen=%{public,signpost.description:attribute}lu";
    v40 = v23;
    uint32_t v41 = 12;
    goto LABEL_34;
  }
  if (v24)
  {
    *(_WORD *)buf = 0;
    BOOL v25 = "error";
LABEL_33:
    v40 = v23;
    uint32_t v41 = 2;
LABEL_34:
    _os_signpost_emit_with_name_impl(&dword_1CA51A000, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "transceiveToI2c_read", v25, buf, v41);
  }
LABEL_35:

  id v19 = v22;
LABEL_36:
  id v21 = v19;
LABEL_37:

  return v21;
}

- (id)_type0ReadConfigReg:(unsigned __int8)a3 data:(id *)a4
{
  return -[NFAccessoryTagI2CBridge _type0ReadConfigRange:data:](self, "_type0ReadConfigRange:data:", a3, 1, a4);
}

- (id)_type0ReadConfigRange:(_NSRange)a3 data:(id *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = [(NFAccessoryTagI2CBridge *)self tagUUID];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [(NFAccessoryTagI2CBridge *)self tagUUID];
    uint64_t v11 = [v10 length];

    if (v11 != 8)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v14 = NFAccessoryTagI2CBridgeErrorDomain;
      uint64_t v15 = 1;
      goto LABEL_10;
    }
  }
  if (location > 0xFF || length > 0x100 || !length)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = NFAccessoryTagI2CBridgeErrorDomain;
    uint64_t v15 = 2;
LABEL_10:
    id v16 = (void *)[v13 initWithDomain:v14 code:v15 userInfo:0];
    goto LABEL_22;
  }
  char v31 = 4;
  __int16 v30 = -16382;
  if ([(NFAccessoryTagI2CBridge *)self selected])
  {
    char v12 = 18;
  }
  else
  {
    id v17 = [(NFAccessoryTagI2CBridge *)self tagUUID];

    if (!v17) {
      goto LABEL_14;
    }
    char v12 = 34;
  }
  LOBYTE(v30) = v12;
LABEL_14:
  v29[0] = location;
  v29[1] = length - 1;
  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&v30 length:3];
  uint64_t v19 = [(NFAccessoryTagI2CBridge *)self tagUUID];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    BOOL v21 = [(NFAccessoryTagI2CBridge *)self selected];

    if (!v21)
    {
      id v22 = [(NFAccessoryTagI2CBridge *)self tagUUID];
      [v18 appendData:v22];
    }
  }
  [v18 appendBytes:v29 length:2];
  int v23 = [(NFAccessoryTag *)self delegate];
  id v28 = 0;
  id v16 = [v23 transceive:v18 response:&v28 maxTimeout:2.0];
  id v24 = v28;

  if (!v16)
  {
    id v25 = v24;
    if (*(unsigned char *)[v25 bytes])
    {
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v16 = (void *)[v26 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:4 userInfo:0];
    }
    else
    {
      [v25 subdataWithRange:1, [v25 length] - 1];
      id v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_22:

  return v16;
}

- (id)_type0WriteConfigReg:(unsigned __int8)a3 data:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NFAccessoryTagI2CBridge *)self tagUUID];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [(NFAccessoryTagI2CBridge *)self tagUUID];
    uint64_t v10 = [v9 length];

    if (v10 != 8)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v13 = NFAccessoryTagI2CBridgeErrorDomain;
      uint64_t v14 = 1;
      goto LABEL_8;
    }
  }
  if ([v6 length] != 4)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v13 = NFAccessoryTagI2CBridgeErrorDomain;
    uint64_t v14 = 2;
LABEL_8:
    uint64_t v15 = (void *)[v12 initWithDomain:v13 code:v14 userInfo:0];
    goto LABEL_20;
  }
  char v29 = 4;
  __int16 v28 = -16126;
  if ([(NFAccessoryTagI2CBridge *)self selected])
  {
    char v11 = 18;
  }
  else
  {
    id v16 = [(NFAccessoryTagI2CBridge *)self tagUUID];

    if (!v16) {
      goto LABEL_12;
    }
    char v11 = 34;
  }
  LOBYTE(v28) = v11;
LABEL_12:
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&v28 length:3];
  uint64_t v18 = [(NFAccessoryTagI2CBridge *)self tagUUID];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    BOOL v20 = [(NFAccessoryTagI2CBridge *)self selected];

    if (!v20)
    {
      BOOL v21 = [(NFAccessoryTagI2CBridge *)self tagUUID];
      [v17 appendData:v21];
    }
  }
  unsigned __int8 v27 = a3;
  [v17 appendBytes:&v27 length:1];
  [v17 appendData:v6];
  id v22 = [(NFAccessoryTag *)self delegate];
  id v26 = 0;
  uint64_t v15 = [v22 transceive:v17 response:&v26 maxTimeout:2.0];
  id v23 = v26;

  if (!v15)
  {
    if (*(unsigned char *)[v23 bytes])
    {
      id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v15 = (void *)[v24 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:4 userInfo:0];
    }
    else
    {
      uint64_t v15 = 0;
    }
  }

LABEL_20:

  return v15;
}

- (id)_type0ReadSRAM:(unsigned __int8)a3 numOfBlocks:(unsigned __int8)a4 data:(id *)a5
{
  int v6 = a4;
  uint64_t v9 = [(NFAccessoryTagI2CBridge *)self tagUUID];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    char v11 = [(NFAccessoryTagI2CBridge *)self tagUUID];
    uint64_t v12 = [v11 length];

    if (v12 != 8)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v15 = NFAccessoryTagI2CBridgeErrorDomain;
      uint64_t v16 = 1;
LABEL_8:
      id v17 = (void *)[v14 initWithDomain:v15 code:v16 userInfo:0];
      goto LABEL_20;
    }
  }
  if (!v6)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = NFAccessoryTagI2CBridgeErrorDomain;
    uint64_t v16 = 2;
    goto LABEL_8;
  }
  char v32 = 4;
  __int16 v31 = -11774;
  if ([(NFAccessoryTagI2CBridge *)self selected])
  {
    char v13 = 18;
  }
  else
  {
    uint64_t v18 = [(NFAccessoryTagI2CBridge *)self tagUUID];

    if (!v18) {
      goto LABEL_12;
    }
    char v13 = 34;
  }
  LOBYTE(v31) = v13;
LABEL_12:
  v30[0] = a3;
  v30[1] = v6 - 1;
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&v31 length:3];
  uint64_t v20 = [(NFAccessoryTagI2CBridge *)self tagUUID];
  if (v20)
  {
    BOOL v21 = (void *)v20;
    BOOL v22 = [(NFAccessoryTagI2CBridge *)self selected];

    if (!v22)
    {
      id v23 = [(NFAccessoryTagI2CBridge *)self tagUUID];
      [v19 appendData:v23];
    }
  }
  [v19 appendBytes:v30 length:2];
  id v24 = [(NFAccessoryTag *)self delegate];
  id v29 = 0;
  id v17 = [v24 transceive:v19 response:&v29 maxTimeout:2.0];
  id v25 = v29;

  if (!v17)
  {
    id v26 = v25;
    if (*(unsigned char *)[v26 bytes])
    {
      id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v17 = (void *)[v27 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:4 userInfo:0];
    }
    else
    {
      [v26 subdataWithRange:1, [v26 length] - 1];
      id v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_20:

  return v17;
}

- (id)_type0WriteSRAM:(unsigned __int8)a3 data:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NFAccessoryTagI2CBridge *)self tagUUID];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(NFAccessoryTagI2CBridge *)self tagUUID];
    uint64_t v10 = [v9 length];

    if (v10 != 8)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v12 = NFAccessoryTagI2CBridgeErrorDomain;
      uint64_t v13 = 1;
      goto LABEL_6;
    }
  }
  if (([v6 length] & 3) != 0 || !objc_msgSend(v6, "length"))
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = NFAccessoryTagI2CBridgeErrorDomain;
    uint64_t v13 = 2;
LABEL_6:
    id v14 = (void *)[v11 initWithDomain:v12 code:v13 userInfo:0];
    goto LABEL_7;
  }
  unint64_t v16 = (unint64_t)[v6 length] >> 2;
  char v31 = 4;
  __int16 v30 = -11518;
  if ([(NFAccessoryTagI2CBridge *)self selected])
  {
    char v17 = 18;
  }
  else
  {
    uint64_t v18 = [(NFAccessoryTagI2CBridge *)self tagUUID];

    if (!v18) {
      goto LABEL_16;
    }
    char v17 = 34;
  }
  LOBYTE(v30) = v17;
LABEL_16:
  char v19 = v16 - 1;
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&v30 length:3];
  uint64_t v21 = [(NFAccessoryTagI2CBridge *)self tagUUID];
  if (v21)
  {
    BOOL v22 = (void *)v21;
    BOOL v23 = [(NFAccessoryTagI2CBridge *)self selected];

    if (!v23)
    {
      id v24 = [(NFAccessoryTagI2CBridge *)self tagUUID];
      [v20 appendData:v24];
    }
  }
  v29[0] = a3;
  v29[1] = v19;
  [v20 appendBytes:v29 length:2];
  [v20 appendData:v6];
  id v25 = [(NFAccessoryTag *)self delegate];
  id v28 = 0;
  id v14 = [v25 transceive:v20 response:&v28 maxTimeout:2.0];
  id v26 = v28;

  if (!v14)
  {
    if (*(unsigned char *)[v26 bytes])
    {
      id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v14 = (void *)[v27 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:4 userInfo:0];
    }
    else
    {
      id v14 = 0;
    }
  }

LABEL_7:

  return v14;
}

- (id)_type0GetSystemInfo:(id *)a3
{
  uint64_t v5 = [(NFAccessoryTagI2CBridge *)self tagUUID];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(NFAccessoryTagI2CBridge *)self tagUUID];
    uint64_t v8 = [v7 length];

    if (v8 != 8)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      char v17 = (void *)[v20 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:1 userInfo:0];
      goto LABEL_17;
    }
  }
  char v25 = 4;
  __int16 v24 = -21758;
  if ([(NFAccessoryTagI2CBridge *)self selected])
  {
    char v9 = 18;
  }
  else
  {
    uint64_t v10 = [(NFAccessoryTagI2CBridge *)self tagUUID];

    if (!v10) {
      goto LABEL_8;
    }
    char v9 = 34;
  }
  LOBYTE(v24) = v9;
LABEL_8:
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&v24 length:3];
  uint64_t v12 = [(NFAccessoryTagI2CBridge *)self tagUUID];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    BOOL v14 = [(NFAccessoryTagI2CBridge *)self selected];

    if (!v14)
    {
      uint64_t v15 = [(NFAccessoryTagI2CBridge *)self tagUUID];
      [v11 appendData:v15];
    }
  }
  unint64_t v16 = [(NFAccessoryTag *)self delegate];
  id v23 = 0;
  char v17 = [v16 transceive:v11 response:&v23 maxTimeout:2.0];
  id v18 = v23;

  if (!v17)
  {
    id v19 = v18;
    if (*(unsigned char *)[v19 bytes])
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      char v17 = (void *)[v21 initWithDomain:NFAccessoryTagI2CBridgeErrorDomain code:4 userInfo:0];
    }
    else
    {
      [v19 subdataWithRange:1, [v19 length] - 1];
      char v17 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_17:

  return v17;
}

@end