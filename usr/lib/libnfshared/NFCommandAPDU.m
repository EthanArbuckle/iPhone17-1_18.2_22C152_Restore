@interface NFCommandAPDU
+ (id)appendExpectedLength:(unsigned __int16)a3 usingExtendedLength:(BOOL)a4 toAPDU:(id)a5;
+ (id)buildAPDUHeaderWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 len:(unsigned int)a7 useExtendedLength:(BOOL)a8;
- (BOOL)isGetMoreVasDataCommand;
- (BOOL)isGetVasDataCommand;
- (BOOL)isSecureMessaging;
- (BOOL)isSelectByDFNameCommand;
- (BOOL)isSelectCommand;
- (BOOL)isSendCertificateCommand;
- (NFCommandAPDU)initWithBytes:(const char *)a3 length:(unint64_t)a4;
- (NFCommandAPDU)initWithData:(id)a3;
- (NFCommandAPDU)initWithData:(id)a3 uniformLengthCheck:(BOOL)a4;
- (NSData)payload;
- (const)payloadBytes;
- (id)description;
- (unsigned)clss;
- (unsigned)instruction;
- (unsigned)lengthExpected;
- (unsigned)p1;
- (unsigned)p2;
- (unsigned)payloadLength;
@end

@implementation NFCommandAPDU

- (unsigned)clss
{
  return self->_class;
}

- (unsigned)instruction
{
  return self->_instruction;
}

- (unsigned)p1
{
  return self->_p1;
}

- (unsigned)p2
{
  return self->_p2;
}

- (unsigned)payloadLength
{
  return self->_payloadRange.length;
}

- (unsigned)lengthExpected
{
  return self->_lengthExpected;
}

- (const)payloadBytes
{
  return (const char *)([(NSData *)self->_data bytes] + self->_payloadRange.location);
}

- (NSData)payload
{
  return -[NSData subdataWithRange:](self->_data, "subdataWithRange:", self->_payloadRange.location, self->_payloadRange.length);
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)NFCommandAPDU;
  v4 = [(NFCommandAPDU *)&v8 description];
  v5 = [(NSData *)self->_data NF_asHexString];
  v6 = (void *)[v3 initWithFormat:@"%@ { %@ }", v4, v5];

  return v6;
}

- (NFCommandAPDU)initWithBytes:(const char *)a3 length:(unint64_t)a4
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a4];
  v6 = [(NFCommandAPDU *)self initWithData:v5];

  return v6;
}

- (NFCommandAPDU)initWithData:(id)a3
{
  return [(NFCommandAPDU *)self initWithData:a3 uniformLengthCheck:1];
}

- (NFCommandAPDU)initWithData:(id)a3 uniformLengthCheck:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NFCommandAPDU;
  v7 = [(NFCommandAPDU *)&v27 init];
  if (!v7) {
    goto LABEL_36;
  }
  id v8 = v6;
  uint64_t v9 = [v8 bytes];
  id v10 = v8;
  uint64_t v11 = [v10 bytes];
  uint64_t v12 = [v10 length];
  if ((unint64_t)[v10 length] >= 4)
  {
    v14 = (unsigned __int8 *)(v11 + v12);
    v7->_class = *(unsigned char *)v9;
    v7->_instruction = *(unsigned char *)(v9 + 1);
    v7->_p1 = *(unsigned char *)(v9 + 2);
    v15 = (unsigned char *)(v9 + 4);
    v7->_p2 = *(unsigned char *)(v9 + 3);
    if ((unsigned __int8 *)(v9 + 4) == v14) {
      goto LABEL_36;
    }
    int v16 = *v15;
    BOOL v17 = *v15 == 0;
    if (*v15)
    {
      v18 = (unsigned __int8 *)(v9 + 5);
      unsigned int v19 = *v15;
      goto LABEL_7;
    }
    uint64_t v21 = v14 - v15;
    if (v21 == 1)
    {
      BOOL v17 = 0;
      unsigned int v19 = 0;
      v18 = (unsigned __int8 *)(v9 + 5);
      BOOL v20 = 1;
    }
    else
    {
      if (v21 <= 2) {
        goto LABEL_3;
      }
      v18 = (unsigned __int8 *)(v9 + 7);
      unsigned int v19 = __rev16(*(unsigned __int16 *)(v9 + 5));
      if (v19)
      {
LABEL_7:
        BOOL v20 = v16 != 0;
        if (v14 - v18 >= v19)
        {
          id v22 = v10;
          v7->_payloadRange.location = (NSUInteger)&v18[-[v22 bytes]];
          v7->_payloadRange.length = v19;
          objc_storeStrong((id *)&v7->_data, v22);
          v18 += v19;
        }
        else if (v14 - v18 > 0)
        {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
      BOOL v20 = 0;
      BOOL v17 = 1;
    }
LABEL_13:
    if (v18 == v14)
    {
      if (!v7->_data)
      {
        if (v17) {
          int v24 = 0x10000;
        }
        else {
          int v24 = 256;
        }
        if (v19) {
          int v24 = v19;
        }
        v7->_lengthExpected = v24;
      }
    }
    else
    {
      if (v14 - v18 == 2)
      {
        if (v20 && v4) {
          goto LABEL_3;
        }
        int v25 = *v18;
        v7->_lengthExpected = v25 << 8;
        if (v18[1] | (v25 << 8)) {
          int v23 = v18[1] | (v25 << 8);
        }
        else {
          int v23 = 0x10000;
        }
      }
      else
      {
        if (v14 - v18 != 1 || v17 && v4) {
          goto LABEL_3;
        }
        int v23 = *v18;
        if (!*v18) {
          int v23 = 256;
        }
      }
      v7->_lengthExpected = v23;
      if (v7->_payloadRange.length && !v7->_data) {
        goto LABEL_3;
      }
    }
LABEL_36:
    v13 = v7;
    goto LABEL_37;
  }
LABEL_3:
  v13 = 0;
LABEL_37:

  return v13;
}

- (BOOL)isSelectCommand
{
  return ![(NFCommandAPDU *)self clss] && [(NFCommandAPDU *)self instruction] == 164;
}

- (BOOL)isSecureMessaging
{
  unsigned __int8 v3 = [(NFCommandAPDU *)self clss];
  int v4 = [(NFCommandAPDU *)self clss];
  if ((v3 & 0x40) != 0) {
    int v5 = 32;
  }
  else {
    int v5 = 12;
  }
  return (v5 & v4) != 0;
}

- (BOOL)isSendCertificateCommand
{
  return [(NFCommandAPDU *)self clss] == 128 && [(NFCommandAPDU *)self instruction] == 216;
}

- (BOOL)isGetVasDataCommand
{
  return [(NFCommandAPDU *)self clss] == 128 && [(NFCommandAPDU *)self instruction] == 202;
}

- (BOOL)isGetMoreVasDataCommand
{
  return [(NFCommandAPDU *)self clss] == 128 && [(NFCommandAPDU *)self instruction] == 192;
}

- (BOOL)isSelectByDFNameCommand
{
  return ([(NFCommandAPDU *)self clss] & 0x80) == 0
      && [(NFCommandAPDU *)self instruction] == 164
      && [(NFCommandAPDU *)self p1] == 4;
}

+ (id)buildAPDUHeaderWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 len:(unsigned int)a7 useExtendedLength:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v9 = *(void *)&a7;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v46 = a3;
  unsigned __int8 v45 = a4;
  unsigned __int8 v44 = a5;
  unsigned __int8 v43 = a6;
  id v12 = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:a7 + 9];
  [v12 appendBytes:&v46 length:1];
  [v12 appendBytes:&v45 length:1];
  [v12 appendBytes:&v44 length:1];
  [v12 appendBytes:&v43 length:1];
  if (!v9 && !v8) {
    goto LABEL_10;
  }
  if (v9 <= 0xFF && !v8)
  {
LABEL_9:
    buf[0] = v9;
    [v12 appendBytes:buf length:1];
LABEL_10:
    id v12 = v12;
    v13 = v12;
    goto LABEL_11;
  }
  if (!WORD1(v9) && !v8)
  {
    buf[0] = 0;
LABEL_8:
    [v12 appendBytes:buf length:1];
    buf[0] = BYTE1(v9);
    [v12 appendBytes:buf length:1];
    goto LABEL_9;
  }
  if (BYTE3(v9))
  {
    v15 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      BOOL v17 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v17)
      {
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        uint64_t v20 = 45;
        if (isMetaClass) {
          uint64_t v20 = 43;
        }
        v17(3, "%c[%{public}s %{public}s]:%i Unsupported length 0x%X", v20, ClassName, Name, 287, v9);
        v15 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      uint64_t v21 = dispatch_get_specific(v15);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      id v22 = (id)_NFSharedLogClient[(void)v21];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        int v23 = object_getClass(a1);
        if (class_isMetaClass(v23)) {
          int v24 = 43;
        }
        else {
          int v24 = 45;
        }
        int v25 = object_getClassName(a1);
        v26 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v48 = v24;
        __int16 v49 = 2082;
        v50 = v25;
        __int16 v51 = 2082;
        v52 = v26;
        __int16 v53 = 1024;
        int v54 = 287;
        __int16 v55 = 1024;
        int v56 = v9;
        _os_log_impl(&dword_1CA51A000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unsupported length 0x%X", buf, 0x28u);
      }

      id v12 = 0;
      goto LABEL_10;
    }
    goto LABEL_43;
  }
  if (v8)
  {
    buf[0] = BYTE2(v9);
    goto LABEL_8;
  }
  objc_super v27 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v28 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v28 >= 4) {
LABEL_43:
  }
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  v29 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v28);
  if (v29)
  {
    v30 = object_getClass(a1);
    BOOL v31 = class_isMetaClass(v30);
    v32 = object_getClassName(a1);
    v42 = sel_getName(a2);
    uint64_t v33 = 45;
    if (v31) {
      uint64_t v33 = 43;
    }
    v29(3, "%c[%{public}s %{public}s]:%i Unexpected length did you mean to use extended length ?", v33, v32, v42, 275);
    objc_super v27 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v34 = dispatch_get_specific(v27);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  v35 = (id)_NFSharedLogClient[(void)v34];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v36 = object_getClass(a1);
    if (class_isMetaClass(v36)) {
      int v37 = 43;
    }
    else {
      int v37 = 45;
    }
    v38 = object_getClassName(a1);
    v39 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v48 = v37;
    __int16 v49 = 2082;
    v50 = v38;
    __int16 v51 = 2082;
    v52 = v39;
    __int16 v53 = 1024;
    int v54 = 275;
    _os_log_impl(&dword_1CA51A000, v35, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected length did you mean to use extended length ?", buf, 0x22u);
  }

  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)appendExpectedLength:(unsigned __int16)a3 usingExtendedLength:(BOOL)a4 toAPDU:(id)a5
{
  unsigned int v6 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = v9;
  if (v6 < 0x100 || a4)
  {
    if (a4)
    {
      buf[0] = BYTE1(v6);
      [v9 appendBytes:buf length:1];
    }
    buf[0] = v6;
    [v10 appendBytes:buf length:1];
    v28 = 0;
  }
  else
  {
    uint64_t v11 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    v13 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v13)
    {
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v13(3, "%c[%{public}s %{public}s]:%i Expected length is too large.", v17, ClassName, Name, 299);
      uint64_t v11 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v18 = dispatch_get_specific(v11);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    unsigned int v19 = (id)_NFSharedLogClient[(void)v18];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = object_getClass(a1);
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v34 = v21;
      __int16 v35 = 2082;
      v36 = object_getClassName(a1);
      __int16 v37 = 2082;
      v38 = sel_getName(a2);
      __int16 v39 = 1024;
      int v40 = 299;
      _os_log_impl(&dword_1CA51A000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Expected length is too large.", buf, 0x22u);
    }

    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    int v23 = [NSString stringWithUTF8String:"nfcd"];
    v31[0] = *MEMORY[0x1E4F28568];
    int v24 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v32[0] = v24;
    v32[1] = &unk_1F24D1E80;
    v31[1] = @"Line";
    v31[2] = @"Method";
    int v25 = [[NSString alloc] initWithFormat:@"%s", sel_getName(a2)];
    v32[2] = v25;
    v31[3] = *MEMORY[0x1E4F28228];
    v26 = [[NSString alloc] initWithFormat:@"%s:%d", sel_getName(a2), 300];
    v32[3] = v26;
    objc_super v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
    v28 = (void *)[v22 initWithDomain:v23 code:10 userInfo:v27];
  }

  return v28;
}

- (void).cxx_destruct
{
}

@end