@interface NFTLV
+ (id)TLVSsWithBytes:(const void *)a3 length:(unint64_t)a4 requireDefiniteEncoding:(BOOL)a5;
+ (id)TLVWithData:(id)a3;
+ (id)TLVWithTag:(unsigned int)a3 children:(id)a4;
+ (id)TLVWithTag:(unsigned int)a3 fromData:(id)a4;
+ (id)TLVWithTag:(unsigned int)a3 unsignedChar:(unsigned __int8)a4;
+ (id)TLVWithTag:(unsigned int)a3 unsignedLongValue:(unsigned int)a4;
+ (id)TLVWithTag:(unsigned int)a3 unsignedShort:(unsigned __int16)a4;
+ (id)TLVWithTag:(unsigned int)a3 value:(id)a4;
+ (id)TLVsWithData:(id)a3;
+ (id)TLVsWithData:(id)a3 requireDefiniteEncoding:(BOOL)a4;
+ (id)_intToData:(unsigned int)a3;
+ (id)_parseTLVs:(const char *)a3 end:(const char *)a4 simple:(BOOL)a5 definite:(BOOL)a6;
+ (id)simpleTLVsWithData:(id)a3;
+ (id)simpleTLVsWithTag:(unsigned int)a3 fromData:(id)a4;
- (NSArray)children;
- (NSData)value;
- (id)asMutableData;
- (id)childWithTag:(unsigned int)a3;
- (id)childrenWithTag:(unsigned int)a3;
- (id)description;
- (id)valueAsHexString;
- (id)valueAsString;
- (unint64_t)valueAsUnsignedLongLong;
- (unsigned)tag;
- (unsigned)valueAsUnsignedLong;
- (unsigned)valueAsUnsignedShort;
@end

@implementation NFTLV

+ (id)TLVsWithData:(id)a3
{
  id v4 = a3;
  uint64_t v8 = [v4 bytes];
  uint64_t v5 = [v4 length];

  v6 = [a1 _parseTLVs:&v8 end:v8 + v5 simple:0 definite:0];

  return v6;
}

+ (id)TLVsWithData:(id)a3 requireDefiniteEncoding:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v10 = [v6 bytes];
  uint64_t v7 = [v6 length];

  uint64_t v8 = [a1 _parseTLVs:&v10 end:v10 + v7 simple:0 definite:v4];

  return v8;
}

+ (id)simpleTLVsWithData:(id)a3
{
  id v4 = a3;
  uint64_t v8 = [v4 bytes];
  uint64_t v5 = [v4 length];

  id v6 = [a1 _parseTLVs:&v8 end:v8 + v5 simple:1 definite:0];

  return v6;
}

+ (id)TLVSsWithBytes:(const void *)a3 length:(unint64_t)a4 requireDefiniteEncoding:(BOOL)a5
{
  uint64_t v7 = a3;
  uint64_t v5 = [a1 _parseTLVs:&v7 end:(char *)a3 + a4 simple:0 definite:a5];

  return v5;
}

+ (id)TLVWithData:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 TLVsWithData:a3];
  if (![v5 count])
  {
    v18 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v20 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v20)
      {
        Class = object_getClass(a1);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        uint64_t v24 = 45;
        if (isMetaClass) {
          uint64_t v24 = 43;
        }
        v20(3, "%c[%{public}s %{public}s]:%i No TLV detected", v24, ClassName, Name, 58);
        v18 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v25 = dispatch_get_specific(v18);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v14 = (id)_NFSharedLogClient[(void)v25];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      v26 = object_getClass(a1);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v33 = v27;
      __int16 v34 = 2082;
      v35 = object_getClassName(a1);
      __int16 v36 = 2082;
      v37 = sel_getName(a2);
      __int16 v38 = 1024;
      int v39 = 58;
      v17 = "%c[%{public}s %{public}s]:%i No TLV detected";
      goto LABEL_27;
    }
LABEL_33:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    id v6 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    uint64_t v7 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v7 < 4)
    {
      uint64_t v8 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v7);
      if (v8)
      {
        v9 = object_getClass(a1);
        BOOL v10 = class_isMetaClass(v9);
        v11 = object_getClassName(a1);
        v30 = sel_getName(a2);
        uint64_t v12 = 45;
        if (v10) {
          uint64_t v12 = 43;
        }
        v8(3, "%c[%{public}s %{public}s]:%i More than one TLV detected", v12, v11, v30, 63);
        id v6 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v13 = dispatch_get_specific(v6);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v14 = (id)_NFSharedLogClient[(void)v13];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      v15 = object_getClass(a1);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v33 = v16;
      __int16 v34 = 2082;
      v35 = object_getClassName(a1);
      __int16 v36 = 2082;
      v37 = sel_getName(a2);
      __int16 v38 = 1024;
      int v39 = 63;
      v17 = "%c[%{public}s %{public}s]:%i More than one TLV detected";
LABEL_27:
      _os_log_impl(&dword_1CA51A000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x22u);
LABEL_28:

      v28 = 0;
      goto LABEL_30;
    }
    goto LABEL_33;
  }
  v28 = [v5 lastObject];
LABEL_30:

  return v28;
}

+ (id)TLVWithTag:(unsigned int)a3 fromData:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = +[NFTLV TLVsWithData:](NFTLV, "TLVsWithData:", a4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 tag] == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

+ (id)simpleTLVsWithTag:(unsigned int)a3 fromData:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = +[NFTLV simpleTLVsWithData:](NFTLV, "simpleTLVsWithData:", v5, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 tag] == a3) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)TLVWithTag:(unsigned int)a3 children:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  *(_DWORD *)(v7 + 8) = a3;
  objc_storeStrong((id *)(v7 + 24), a4);
  *(void *)(v7 + 32) = 8;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        *(void *)(v7 + 32) += *(void *)(*(void *)(*((void *)&v14 + 1) + 8 * i) + 32);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return (id)v7;
}

+ (id)TLVWithTag:(unsigned int)a3 value:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  *(_DWORD *)(v6 + 8) = a3;
  uint64_t v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;
  id v8 = v5;

  uint64_t v9 = [v8 length];
  *(void *)(v6 + 32) = v9 + 8;

  return (id)v6;
}

+ (id)TLVWithTag:(unsigned int)a3 unsignedChar:(unsigned __int8)a4
{
  uint64_t v4 = *(void *)&a3;
  unsigned __int8 v8 = a4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v8 length:1];
  uint64_t v6 = +[NFTLV TLVWithTag:v4 value:v5];

  return v6;
}

+ (id)TLVWithTag:(unsigned int)a3 unsignedShort:(unsigned __int16)a4
{
  uint64_t v4 = *(void *)&a3;
  unsigned __int16 v8 = a4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v8 length:2];
  uint64_t v6 = +[NFTLV TLVWithTag:v4 value:v5];

  return v6;
}

+ (id)TLVWithTag:(unsigned int)a3 unsignedLongValue:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  unsigned int v8 = a4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v8 length:4];
  uint64_t v6 = +[NFTLV TLVWithTag:v4 value:v5];

  return v6;
}

- (id)description
{
  children = self->_children;
  id v4 = [NSString alloc];
  id v5 = v4;
  if (children)
  {
    v16.receiver = self;
    v16.super_class = (Class)NFTLV;
    uint64_t v6 = [(NFTLV *)&v16 description];
    uint64_t tag = self->_tag;
    unsigned int v8 = [(NFTLV *)self children];
    uint64_t v9 = [v5 initWithFormat:@"%@ %02x : %@", v6, tag, v8, v13];
  }
  else
  {
    uint64_t v6 = (void *)[v4 initWithData:self->_value encoding:1];
    id v10 = [NSString alloc];
    if (v6)
    {
      v15.receiver = self;
      v15.super_class = (Class)NFTLV;
      unsigned int v8 = [(NFTLV *)&v15 description];
      uint64_t v9 = [v10 initWithFormat:@"%@ %02x = %@ \"%@\"", v8, self->_tag, self->_value, v6];
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)NFTLV;
      unsigned int v8 = [(NFTLV *)&v14 description];
      uint64_t v9 = [v10 initWithFormat:@"%@ %02x = %@", v8, self->_tag, self->_value, v13];
    }
  }
  uint64_t v11 = (void *)v9;

  return v11;
}

- (unsigned)tag
{
  return self->_tag;
}

- (NSData)value
{
  return self->_value;
}

- (id)valueAsString
{
  if (self->_value) {
    v2 = (void *)[[NSString alloc] initWithData:self->_value encoding:1];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)valueAsHexString
{
  return [(NSData *)self->_value NF_asHexString];
}

- (unsigned)valueAsUnsignedLong
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  value = self->_value;
  if (!value) {
    return 0;
  }
  if ([(NSData *)value length] >= 5)
  {
    id v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    uint64_t v7 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v7)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Value too large: %{public}@", v12, ClassName, Name, 166, self->_value);
      id v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    uint64_t v13 = dispatch_get_specific(v5);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    objc_super v14 = (id)_NFSharedLogClient[(void)v13];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_super v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      long long v17 = object_getClassName(self);
      uint64_t v18 = sel_getName(a2);
      uint64_t v19 = self->_value;
      *(_DWORD *)buf = 67110146;
      int v25 = v16;
      __int16 v26 = 2082;
      int v27 = v17;
      __int16 v28 = 2082;
      v29 = v18;
      __int16 v30 = 1024;
      int v31 = 166;
      __int16 v32 = 2114;
      int v33 = v19;
      _os_log_impl(&dword_1CA51A000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Value too large: %{public}@", buf, 0x2Cu);
    }

    return 0;
  }
  v20 = [(NSData *)self->_value bytes];
  if (![(NSData *)self->_value length]) {
    return 0;
  }
  unint64_t v21 = 0;
  unsigned int v22 = 0;
  do
    unsigned int v22 = v20[v21++] | (v22 << 8);
  while ([(NSData *)self->_value length] > v21);
  return v22;
}

- (unsigned)valueAsUnsignedShort
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  value = self->_value;
  if (!value) {
    return 0;
  }
  if ([(NSData *)value length] >= 3)
  {
    id v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    uint64_t v7 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v7)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Value too large: %{public}@", v12, ClassName, Name, 183, self->_value);
      id v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    uint64_t v13 = dispatch_get_specific(v5);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    objc_super v14 = (id)_NFSharedLogClient[(void)v13];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_super v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      long long v17 = object_getClassName(self);
      uint64_t v18 = sel_getName(a2);
      uint64_t v19 = self->_value;
      *(_DWORD *)buf = 67110146;
      int v25 = v16;
      __int16 v26 = 2082;
      int v27 = v17;
      __int16 v28 = 2082;
      v29 = v18;
      __int16 v30 = 1024;
      int v31 = 183;
      __int16 v32 = 2114;
      int v33 = v19;
      _os_log_impl(&dword_1CA51A000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Value too large: %{public}@", buf, 0x2Cu);
    }

    return 0;
  }
  v20 = [(NSData *)self->_value bytes];
  if (![(NSData *)self->_value length]) {
    return 0;
  }
  unint64_t v21 = 0;
  unsigned __int16 v22 = 0;
  do
    unsigned __int16 v22 = v20[v21++] | (unsigned __int16)(v22 << 8);
  while ([(NSData *)self->_value length] > v21);
  return v22;
}

- (unint64_t)valueAsUnsignedLongLong
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  value = self->_value;
  if (!value) {
    return 0;
  }
  if ([(NSData *)value length] >= 9)
  {
    id v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    uint64_t v7 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v7)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i Value too large: %{public}@", v12, ClassName, Name, 201, self->_value);
      id v5 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    uint64_t v13 = dispatch_get_specific(v5);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    objc_super v14 = (id)_NFSharedLogClient[(void)v13];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_super v15 = object_getClass(self);
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      long long v17 = object_getClassName(self);
      uint64_t v18 = sel_getName(a2);
      uint64_t v19 = self->_value;
      *(_DWORD *)buf = 67110146;
      int v25 = v16;
      __int16 v26 = 2082;
      int v27 = v17;
      __int16 v28 = 2082;
      v29 = v18;
      __int16 v30 = 1024;
      int v31 = 201;
      __int16 v32 = 2114;
      int v33 = v19;
      _os_log_impl(&dword_1CA51A000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Value too large: %{public}@", buf, 0x2Cu);
    }

    return 0;
  }
  v20 = [(NSData *)self->_value bytes];
  if (![(NSData *)self->_value length]) {
    return 0;
  }
  unint64_t v21 = 0;
  unint64_t v22 = 0;
  do
    unint64_t v22 = v20[v21++] | (v22 << 8);
  while ([(NSData *)self->_value length] > v21);
  return v22;
}

- (NSArray)children
{
  return self->_children;
}

- (id)childrenWithTag:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(NFTLV *)self children];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 tag] == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)childWithTag:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NFTLV *)self children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 tag] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (id)_intToData:(unsigned int)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:4];
  uint64_t v5 = v4;
  char v9 = 0;
  if (a3)
  {
    int v6 = 4;
    if (HIBYTE(a3)) {
      goto LABEL_14;
    }
    do
    {
      unsigned int v7 = HIWORD(a3);
      a3 <<= 8;
      --v6;
    }
    while (!v7 && v6);
    if (v6)
    {
LABEL_14:
      do
      {
        char v9 = HIBYTE(a3);
        [v5 appendBytes:&v9 length:1];
        a3 <<= 8;
        --v6;
      }
      while (v6);
    }
  }
  else
  {
    [v4 appendBytes:&v9 length:1];
  }

  return v5;
}

- (id)asMutableData
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:self->_worseCaseSizeAsData];
  id v4 = +[NFTLV _intToData:self->_tag];
  [v3 appendData:v4];

  uint64_t v5 = self->_value;
  if (!v5)
  {
    if (self->_children)
    {
      uint64_t v5 = (NSData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:self->_worseCaseSizeAsData];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      int v6 = self->_children;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) asData];
            [(NSData *)v5 appendData:v11];
          }
          uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v8);
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  uint64_t v12 = [(NSData *)v5 length];
  long long v13 = +[NFTLV _intToData:v12];
  long long v14 = v13;
  if (v12 >= 0x80)
  {
    char v16 = [v13 length] | 0x80;
    [v3 appendBytes:&v16 length:1];
  }
  [v3 appendData:v14];
  if (v5) {
    [v3 appendData:v5];
  }

  return v3;
}

+ (id)_parseTLVs:(const char *)a3 end:(const char *)a4 simple:(BOOL)a5 definite:(BOOL)a6
{
  BOOL v192 = a6;
  BOOL v193 = a5;
  uint64_t v211 = *MEMORY[0x1E4F143B8];
  v191 = *a3;
  uint64_t v9 = objc_opt_new();
  id v10 = *a3;
  if (*a3 < a4)
  {
    while (1)
    {
      uint64_t v11 = v10 + 1;
      *a3 = v10 + 1;
      uint64_t v12 = *(unsigned __int8 *)v10;
      if (v193)
      {
        if (v11 >= a4)
        {
          v124 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)specific >= 4) {
            goto LABEL_186;
          }
          v126 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
          if (v126)
          {
            Class = object_getClass(a1);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(a1);
            Name = sel_getName(a2);
            uint64_t v129 = 45;
            if (isMetaClass) {
              uint64_t v129 = 43;
            }
            v126(3, "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x", v129, ClassName, Name, 321, v12);
            v124 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v130 = dispatch_get_specific(v124);
          if (NFSharedLogInitialize_onceToken != -1) {
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          }
          v78 = (id)_NFSharedLogClient[(void)v130];
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            v131 = object_getClass(a1);
            if (class_isMetaClass(v131)) {
              int v132 = 43;
            }
            else {
              int v132 = 45;
            }
            v133 = object_getClassName(a1);
            v134 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v196 = v132;
            __int16 v197 = 2082;
            v198 = v133;
            __int16 v199 = 2082;
            v200 = v134;
            __int16 v201 = 1024;
            int v202 = 321;
            __int16 v203 = 1024;
            int v204 = v12;
            v83 = "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x";
            goto LABEL_152;
          }
          goto LABEL_154;
        }
        long long v13 = v10 + 2;
        *a3 = v10 + 2;
        uint64_t v14 = *((unsigned __int8 *)v10 + 1);
        if (v14 != 255) {
          goto LABEL_9;
        }
        LODWORD(v14) = 0;
        char v15 = 1;
        do
        {
          if (v13 >= a4)
          {
            v86 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            v87 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            if ((unint64_t)v87 >= 4) {
              goto LABEL_186;
            }
            v88 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v87);
            if (v88)
            {
              v89 = object_getClass(a1);
              BOOL v90 = class_isMetaClass(v89);
              v176 = object_getClassName(a1);
              v182 = sel_getName(a2);
              uint64_t v91 = 45;
              if (v90) {
                uint64_t v91 = 43;
              }
              v88(3, "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x", v91, v176, v182, 327, v12);
              v86 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            }
            v92 = dispatch_get_specific(v86);
            if (NFSharedLogInitialize_onceToken != -1) {
              dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
            }
            v78 = (id)_NFSharedLogClient[(void)v92];
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              v93 = object_getClass(a1);
              if (class_isMetaClass(v93)) {
                int v94 = 43;
              }
              else {
                int v94 = 45;
              }
              v95 = object_getClassName(a1);
              v96 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v196 = v94;
              __int16 v197 = 2082;
              v198 = v95;
              __int16 v199 = 2082;
              v200 = v96;
              __int16 v201 = 1024;
              int v202 = 327;
              __int16 v203 = 1024;
              int v204 = v12;
              v83 = "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x";
              goto LABEL_152;
            }
            goto LABEL_154;
          }
          char v16 = v15;
          char v15 = 0;
          long long v17 = v13 + 1;
          *a3 = v13 + 1;
          uint64_t v14 = *(unsigned __int8 *)v13++ | (v14 << 8);
        }
        while ((v16 & 1) != 0);
        long long v13 = v17;
LABEL_9:
        uint64_t v18 = v12;
        if (v12) {
          goto LABEL_48;
        }
LABEL_34:
        if (v14)
        {
          v37 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          __int16 v38 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v38 < 4)
          {
            int v39 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v38);
            if (v39)
            {
              uint64_t v40 = object_getClass(a1);
              BOOL v41 = class_isMetaClass(v40);
              v174 = object_getClassName(a1);
              v179 = sel_getName(a2);
              uint64_t v42 = 45;
              if (v41) {
                uint64_t v42 = 43;
              }
              v39(4, "%c[%{public}s %{public}s]:%i Unexpected %u len on tag 0", v42, v174, v179, 385, v14);
              v37 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            }
            v43 = dispatch_get_specific(v37);
            if (NFSharedLogInitialize_onceToken != -1) {
              dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
            }
            v44 = (id)_NFSharedLogClient[(void)v43];
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v45 = object_getClass(a1);
              if (class_isMetaClass(v45)) {
                int v46 = 43;
              }
              else {
                int v46 = 45;
              }
              v47 = object_getClassName(a1);
              v48 = sel_getName(a2);
              *(_DWORD *)buf = 67110146;
              int v196 = v46;
              __int16 v197 = 2082;
              v198 = v47;
              __int16 v199 = 2082;
              v200 = v48;
              __int16 v201 = 1024;
              int v202 = 385;
              __int16 v203 = 1024;
              int v204 = v14;
              _os_log_impl(&dword_1CA51A000, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected %u len on tag 0", buf, 0x28u);
            }

            uint64_t v18 = 0;
            long long v13 = *a3;
            goto LABEL_48;
          }
LABEL_186:
          __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
        }
        goto LABEL_156;
      }
      if ((~v12 & 0x1F) == 0)
      {
        unint64_t v19 = 1;
        int v20 = *(unsigned __int8 *)v10;
        while (1)
        {
          if (v19 >= 5)
          {
            unint64_t v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            uint64_t v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            if ((unint64_t)v22 >= 4) {
              goto LABEL_186;
            }
            v23 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v22);
            if (v23)
            {
              uint64_t v24 = object_getClass(a1);
              BOOL v25 = class_isMetaClass(v24);
              __int16 v26 = object_getClassName(a1);
              v178 = sel_getName(a2);
              uint64_t v27 = 45;
              if (v25) {
                uint64_t v27 = 43;
              }
              v23(3, "%c[%{public}s %{public}s]:%i Tag value overflows", v27, v26, v178, 342);
              unint64_t v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            }
            __int16 v28 = dispatch_get_specific(v21);
            if (NFSharedLogInitialize_onceToken != -1) {
              dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
            }
            v29 = (id)_NFSharedLogClient[(void)v28];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              __int16 v30 = object_getClass(a1);
              if (class_isMetaClass(v30)) {
                int v31 = 43;
              }
              else {
                int v31 = 45;
              }
              __int16 v32 = object_getClassName(a1);
              int v33 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v196 = v31;
              __int16 v197 = 2082;
              v198 = v32;
              __int16 v199 = 2082;
              v200 = v33;
              __int16 v201 = 1024;
              int v202 = 342;
              _os_log_impl(&dword_1CA51A000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Tag value overflows", buf, 0x22u);
            }

            uint64_t v11 = *a3;
          }
          if (v11 >= a4) {
            break;
          }
          uint64_t v34 = v11 + 1;
          *a3 = v11 + 1;
          int v35 = *v11;
          uint64_t v18 = *(unsigned __int8 *)v11 | (v20 << 8);
          ++v19;
          ++v11;
          int v20 = v18;
          if ((v35 & 0x80000000) == 0) {
            goto LABEL_31;
          }
        }
        v70 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v71 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v71 >= 4) {
          goto LABEL_186;
        }
        v72 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v71);
        if (v72)
        {
          v73 = object_getClass(a1);
          BOOL v74 = class_isMetaClass(v73);
          v75 = object_getClassName(a1);
          v181 = sel_getName(a2);
          uint64_t v76 = 45;
          if (v74) {
            uint64_t v76 = 43;
          }
          v72(3, "%c[%{public}s %{public}s]:%i Underflow", v76, v75, v181, 344);
          v70 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v77 = dispatch_get_specific(v70);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        v78 = (id)_NFSharedLogClient[(void)v77];
        if (!os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
          goto LABEL_154;
        }
        v79 = object_getClass(a1);
        if (class_isMetaClass(v79)) {
          int v80 = 43;
        }
        else {
          int v80 = 45;
        }
        v81 = object_getClassName(a1);
        v82 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v196 = v80;
        __int16 v197 = 2082;
        v198 = v81;
        __int16 v199 = 2082;
        v200 = v82;
        __int16 v201 = 1024;
        int v202 = 344;
        v83 = "%c[%{public}s %{public}s]:%i Underflow";
LABEL_90:
        v84 = v78;
        uint32_t v85 = 34;
        goto LABEL_153;
      }
      uint64_t v34 = v10 + 1;
      uint64_t v18 = v12;
LABEL_31:
      if (v34 >= a4) {
        break;
      }
      long long v13 = v34 + 1;
      *a3 = v34 + 1;
      int v36 = *v34;
      uint64_t v14 = v36;
      if (v36 < 0)
      {
        int v55 = v36 & 0x7F;
        if ((v14 & 0x7F) != 0)
        {
          LODWORD(v14) = 0;
          while (v13 < a4)
          {
            v56 = v13 + 1;
            *a3 = v13 + 1;
            uint64_t v14 = *(unsigned __int8 *)v13++ | (v14 << 8);
            if (!--v55)
            {
              long long v13 = v56;
              if (!v18) {
                goto LABEL_34;
              }
              goto LABEL_48;
            }
          }
          v97 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v98 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v98 >= 4) {
            goto LABEL_186;
          }
          v99 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v98);
          if (v99)
          {
            v100 = object_getClass(a1);
            BOOL v101 = class_isMetaClass(v100);
            v102 = object_getClassName(a1);
            v183 = sel_getName(a2);
            uint64_t v103 = 45;
            if (v101) {
              uint64_t v103 = 43;
            }
            v99(3, "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x", v103, v102, v183, 367, v18);
            v97 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v104 = dispatch_get_specific(v97);
          if (NFSharedLogInitialize_onceToken != -1) {
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          }
          v78 = (id)_NFSharedLogClient[(void)v104];
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            v105 = object_getClass(a1);
            if (class_isMetaClass(v105)) {
              int v106 = 43;
            }
            else {
              int v106 = 45;
            }
            v107 = object_getClassName(a1);
            v108 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v196 = v106;
            __int16 v197 = 2082;
            v198 = v107;
            __int16 v199 = 2082;
            v200 = v108;
            __int16 v201 = 1024;
            int v202 = 367;
            __int16 v203 = 1024;
            int v204 = v18;
            v83 = "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x";
            goto LABEL_152;
          }
          goto LABEL_154;
        }
        if (v18)
        {
          uint64_t v14 = 0;
          goto LABEL_48;
        }
        goto LABEL_156;
      }
      if (!v18) {
        goto LABEL_34;
      }
LABEL_48:
      if (a4 - v13 < v14)
      {
        v109 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v110 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v110 >= 4) {
          goto LABEL_186;
        }
        v111 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v110);
        if (v111)
        {
          v112 = object_getClass(a1);
          BOOL v113 = class_isMetaClass(v112);
          v114 = object_getClassName(a1);
          v115 = sel_getName(a2);
          uint64_t v116 = 43;
          if (!v113) {
            uint64_t v116 = 45;
          }
          v111(3, "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x len=%u have=%lu offset=%lu", v116, v114, v115, 390, v18, v14, a4 - *a3, *a3 - v191);
          v109 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v117 = dispatch_get_specific(v109);
        if (NFSharedLogInitialize_onceToken != -1) {
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        }
        v78 = (id)_NFSharedLogClient[(void)v117];
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        {
          v118 = object_getClass(a1);
          if (class_isMetaClass(v118)) {
            int v119 = 43;
          }
          else {
            int v119 = 45;
          }
          v120 = object_getClassName(a1);
          v121 = sel_getName(a2);
          int64_t v122 = a4 - *a3;
          v123 = (const char *)(*a3 - v191);
          *(_DWORD *)buf = 67110914;
          int v196 = v119;
          __int16 v197 = 2082;
          v198 = v120;
          __int16 v199 = 2082;
          v200 = v121;
          __int16 v201 = 1024;
          int v202 = 390;
          __int16 v203 = 1024;
          int v204 = v18;
          __int16 v205 = 1024;
          int v206 = v14;
          __int16 v207 = 2048;
          int64_t v208 = v122;
          __int16 v209 = 2048;
          v210 = v123;
          v83 = "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x len=%u have=%lu offset=%lu";
          v84 = v78;
          uint32_t v85 = 66;
          goto LABEL_153;
        }
        goto LABEL_154;
      }
      uint64_t v49 = v14;
      v50 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*a3 length:v14];
      if ((v12 & 0x20) != 0)
      {
        v52 = [a1 _parseTLVs:a3 end:&(*a3)[v49] simple:v193 definite:v192];
        if ([v52 count])
        {
          uint64_t v53 = +[NFTLV TLVWithTag:v18 children:v52];
          if (!v53)
          {
            v161 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            v162 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            if ((unint64_t)v162 >= 4) {
              goto LABEL_186;
            }
            v163 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v162);
            if (v163)
            {
              v164 = object_getClass(a1);
              BOOL v165 = class_isMetaClass(v164);
              v166 = object_getClassName(a1);
              v187 = sel_getName(a2);
              uint64_t v167 = 45;
              if (v165) {
                uint64_t v167 = 43;
              }
              v163(3, "%c[%{public}s %{public}s]:%i [NFTLV TLVWithTag:children:] failed!", v167, v166, v187, 410);
              v161 = kNFLOG_DISPATCH_SPECIFIC_KEY;
            }
            v168 = dispatch_get_specific(v161);
            if (NFSharedLogInitialize_onceToken != -1) {
              dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
            }
            v169 = (id)_NFSharedLogClient[(void)v168];
            if (os_log_type_enabled(v169, OS_LOG_TYPE_ERROR))
            {
              v170 = object_getClass(a1);
              if (class_isMetaClass(v170)) {
                int v171 = 43;
              }
              else {
                int v171 = 45;
              }
              v172 = object_getClassName(a1);
              v173 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v196 = v171;
              __int16 v197 = 2082;
              v198 = v172;
              __int16 v199 = 2082;
              v200 = v173;
              __int16 v201 = 1024;
              int v202 = 410;
              _os_log_impl(&dword_1CA51A000, v169, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i [NFTLV TLVWithTag:children:] failed!", buf, 0x22u);
            }

            goto LABEL_155;
          }
          v54 = (void *)v53;
          objc_storeStrong((id *)(v53 + 16), v50);
          [v9 addObject:v54];
        }
        else
        {
          v190 = v52;
          v57 = v9;
          v58 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v59 >= 4) {
            goto LABEL_186;
          }
          v60 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v59);
          if (v60)
          {
            v61 = object_getClass(a1);
            BOOL v188 = class_isMetaClass(v61);
            v175 = object_getClassName(a1);
            v180 = sel_getName(a2);
            uint64_t v62 = 45;
            if (v188) {
              uint64_t v62 = 43;
            }
            v60(4, "%c[%{public}s %{public}s]:%i Failed to recurse children of constructed (?) tag 0x%x, returning as simple", v62, v175, v180, 404, v18);
            v58 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v63 = dispatch_get_specific(v58);
          uint64_t v9 = v57;
          if (NFSharedLogInitialize_onceToken != -1) {
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          }
          v64 = (id)_NFSharedLogClient[(void)v63];
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            v65 = object_getClass(a1);
            if (class_isMetaClass(v65)) {
              int v66 = 43;
            }
            else {
              int v66 = 45;
            }
            int v189 = v66;
            v67 = object_getClassName(a1);
            v68 = sel_getName(a2);
            *(_DWORD *)buf = 67110146;
            int v196 = v189;
            __int16 v197 = 2082;
            v198 = v67;
            uint64_t v9 = v57;
            __int16 v199 = 2082;
            v200 = v68;
            __int16 v201 = 1024;
            int v202 = 404;
            __int16 v203 = 1024;
            int v204 = v18;
            _os_log_impl(&dword_1CA51A000, v64, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to recurse children of constructed (?) tag 0x%x, returning as simple", buf, 0x28u);
          }

          v69 = +[NFTLV TLVWithTag:v18 value:v50];
          [v9 addObject:v69];

          *a3 = &v13[v49];
          v52 = v190;
        }
      }
      else
      {
        v51 = +[NFTLV TLVWithTag:v18 value:v50];
        [v9 addObject:v51];

        *a3 += v49;
      }

      id v10 = *a3;
      if (*a3 >= a4) {
        goto LABEL_169;
      }
    }
    if (v18)
    {
      v135 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v136 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v136 >= 4) {
        goto LABEL_186;
      }
      v137 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v136);
      if (v137)
      {
        v138 = object_getClass(a1);
        BOOL v139 = class_isMetaClass(v138);
        v140 = object_getClassName(a1);
        v185 = sel_getName(a2);
        uint64_t v141 = 45;
        if (v139) {
          uint64_t v141 = 43;
        }
        v137(3, "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x", v141, v140, v185, 356, v18);
        v135 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v142 = dispatch_get_specific(v135);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v78 = (id)_NFSharedLogClient[(void)v142];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        v143 = object_getClass(a1);
        if (class_isMetaClass(v143)) {
          int v144 = 43;
        }
        else {
          int v144 = 45;
        }
        v145 = object_getClassName(a1);
        v146 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v196 = v144;
        __int16 v197 = 2082;
        v198 = v145;
        __int16 v199 = 2082;
        v200 = v146;
        __int16 v201 = 1024;
        int v202 = 356;
        __int16 v203 = 1024;
        int v204 = v18;
        v83 = "%c[%{public}s %{public}s]:%i Underflow: tag=0x%x";
LABEL_152:
        v84 = v78;
        uint32_t v85 = 40;
LABEL_153:
        _os_log_impl(&dword_1CA51A000, v84, OS_LOG_TYPE_ERROR, v83, buf, v85);
      }
LABEL_154:

LABEL_155:
      id v147 = 0;
      goto LABEL_170;
    }
LABEL_156:
    if (v192)
    {
      v148 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v149 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v149 >= 4) {
        goto LABEL_186;
      }
      v150 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v149);
      if (v150)
      {
        v151 = object_getClass(a1);
        BOOL v152 = class_isMetaClass(v151);
        v153 = object_getClassName(a1);
        v186 = sel_getName(a2);
        uint64_t v154 = 45;
        if (v152) {
          uint64_t v154 = 43;
        }
        v150(3, "%c[%{public}s %{public}s]:%i Require definite encoding, but got zero tag and len", v154, v153, v186, 380);
        v148 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v155 = dispatch_get_specific(v148);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v78 = (id)_NFSharedLogClient[(void)v155];
      if (!os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
        goto LABEL_154;
      }
      v156 = object_getClass(a1);
      if (class_isMetaClass(v156)) {
        int v157 = 43;
      }
      else {
        int v157 = 45;
      }
      v158 = object_getClassName(a1);
      v159 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v196 = v157;
      __int16 v197 = 2082;
      v198 = v158;
      __int16 v199 = 2082;
      v200 = v159;
      __int16 v201 = 1024;
      int v202 = 380;
      v83 = "%c[%{public}s %{public}s]:%i Require definite encoding, but got zero tag and len";
      goto LABEL_90;
    }
  }
LABEL_169:
  id v147 = v9;
LABEL_170:

  return v147;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end