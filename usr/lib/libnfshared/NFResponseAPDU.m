@interface NFResponseAPDU
+ (id)responseWithData:(id)a3;
- (NFResponseAPDU)initWithData:(id)a3;
- (NSData)data;
- (NSData)response;
- (unsigned)decodeUnderlyingAppletError:(id *)a3;
- (unsigned)status;
@end

@implementation NFResponseAPDU

+ (id)responseWithData:(id)a3
{
  id v3 = a3;
  v4 = [[NFResponseAPDU alloc] initWithData:v3];

  return v4;
}

- (NFResponseAPDU)initWithData:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NFResponseAPDU;
  v5 = [(NFResponseAPDU *)&v12 init];
  if (v5)
  {
    __int16 v11 = 0;
    int v6 = [v4 length];
    if ((v6 & 0xFFFFFFFE) != 0)
    {
      int v7 = v6;
      [v4 getBytes:((char *)&v11 + 1) range:(v6 - 2), 1];
      [v4 getBytes:&v11 range:(v7 - 1), 1];
      v5->_status = v11 | (HIBYTE(v11) << 8);
      if ([v4 isMemberOfClass:objc_opt_class()]) {
        v8 = (NSData *)v4;
      }
      else {
        v8 = (NSData *)[v4 copy];
      }
      data = v5->_data;
      v5->_data = v8;
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (NSData)response
{
  data = self->_data;
  uint64_t v3 = [(NSData *)data length] - 2;

  return -[NSData subdataWithRange:](data, "subdataWithRange:", 0, v3);
}

- (unsigned)decodeUnderlyingAppletError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unsigned __int16 status = self->_status;
  unsigned __int8 v24 = 0;
  if ([(NSData *)self->_data length] >= 9 && (self->_status & 0xFFF0) == 0x69F0)
  {
    __int16 v25 = 0;
    -[NSData getBytes:range:](self->_data, "getBytes:range:", (char *)&v25 + 1, [(NSData *)self->_data length] - 4, 1);
    -[NSData getBytes:range:](self->_data, "getBytes:range:", &v25, [(NSData *)self->_data length] - 3, 1);
    unsigned __int16 status = v25 | (HIBYTE(v25) << 8);
    -[NSData getBytes:range:](self->_data, "getBytes:range:", &v24, 0, 1);
    if (v24 - 4 > 0xC || (uint64_t v7 = v24 + 5, v7 != [(NSData *)self->_data length]))
    {
      v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4) {
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      }
      __int16 v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v11)
      {
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v16 = 45;
        if (isMetaClass) {
          uint64_t v16 = 43;
        }
        v11(3, "%c[%{public}s %{public}s]:%i Invalid extended response length : %{public}@", v16, ClassName, Name, 73, self->_data);
        v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v17 = dispatch_get_specific(v9);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v8 = (id)_NFSharedLogClient[(void)v17];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v18 = object_getClass(self);
        if (class_isMetaClass(v18)) {
          int v19 = 43;
        }
        else {
          int v19 = 45;
        }
        v20 = object_getClassName(self);
        v21 = sel_getName(a2);
        data = self->_data;
        *(_DWORD *)buf = 67110146;
        int v27 = v19;
        __int16 v28 = 2082;
        v29 = v20;
        __int16 v30 = 2082;
        v31 = v21;
        __int16 v32 = 1024;
        int v33 = 73;
        __int16 v34 = 2114;
        v35 = data;
        _os_log_impl(&dword_1CA51A000, v8, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid extended response length : %{public}@", buf, 0x2Cu);
      }
      goto LABEL_19;
    }
    if (a3)
    {
      v8 = -[NSData subdataWithRange:](self->_data, "subdataWithRange:", 1, v24);
      *a3 = [v8 NF_asHexString];
LABEL_19:
    }
  }
  return status;
}

- (unsigned)status
{
  return self->_status;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end