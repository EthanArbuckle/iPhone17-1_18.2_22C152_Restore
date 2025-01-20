@interface NIAcwgM4Msg
+ (BOOL)supportsSecureCoding;
+ (id)fromStruct:(AcwgM4MsgStruct *)a3;
- (AcwgM4MsgStruct)toStruct;
- (NIAcwgM4Msg)initWithCoder:(id)a3;
- (NIAcwgM4Msg)initWithStsIndex0:(unsigned int)a3 uwbTime0:(unint64_t)a4 hopKey:(unsigned int)a5 selectedSyncCodeIndex:(unsigned __int8)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)uwbTime0;
- (unsigned)hopKey;
- (unsigned)selectedSyncCodeIndex;
- (unsigned)stsIndex0;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NIAcwgM4Msg

- (NIAcwgM4Msg)initWithStsIndex0:(unsigned int)a3 uwbTime0:(unint64_t)a4 hopKey:(unsigned int)a5 selectedSyncCodeIndex:(unsigned __int8)a6
{
  v11.receiver = self;
  v11.super_class = (Class)NIAcwgM4Msg;
  result = [(NIAcwgM4Msg *)&v11 init];
  if (result)
  {
    result->_uwbTime0 = a4;
    result->_stsIndex0 = a3;
    result->_hopKey = a5;
    result->_selectedSyncCodeIndex = a6;
  }
  return result;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@:\n", v4];

  [v5 appendFormat:@"stsIndex0:%u\n", self->_stsIndex0];
  [v5 appendFormat:@"uwbTime0:%llu\n", self->_uwbTime0];
  [v5 appendFormat:@"hopKey:%u\n", self->_hopKey];
  [v5 appendFormat:@"selectedSyncCodeIndex:%u>", self->_selectedSyncCodeIndex];

  return v5;
}

- (AcwgM4MsgStruct)toStruct
{
  unint64_t v3 = *(void *)&self[1].var0;
  unsigned int var2 = self->var2;
  unsigned __int8 var1 = self->var1;
  retstr->var0 = HIDWORD(self->var1);
  retstr->unsigned __int8 var1 = v3;
  retstr->unsigned int var2 = var2;
  retstr->var3 = var1;
  return self;
}

+ (id)fromStruct:(AcwgM4MsgStruct *)a3
{
  id v3 = [objc_alloc((Class)a1) initWithStsIndex0:a3->var0 uwbTime0:a3->var1 hopKey:a3->var2 selectedSyncCodeIndex:a3->var3];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  unint64_t uwbTime0 = self->_uwbTime0;
  uint64_t stsIndex0 = self->_stsIndex0;
  uint64_t hopKey = self->_hopKey;
  uint64_t selectedSyncCodeIndex = self->_selectedSyncCodeIndex;

  return [v4 initWithStsIndex0:stsIndex0 uwbTime0:uwbTime0 hopKey:hopKey selectedSyncCodeIndex:selectedSyncCodeIndex];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_stsIndex0 forKey:@"stsIndex0"];
  [v4 encodeInt64:self->_uwbTime0 forKey:@"uwbTime0"];
  [v4 encodeInt64:self->_hopKey forKey:@"hopKey"];
  [v4 encodeInt:self->_selectedSyncCodeIndex forKey:@"selectedSyncCodeIndex"];
}

- (NIAcwgM4Msg)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self)
  {
    self->_uint64_t stsIndex0 = [v4 decodeInt64ForKey:@"stsIndex0"];
    self->_unint64_t uwbTime0 = (unint64_t)[v5 decodeInt64ForKey:@"uwbTime0"];
    self->_uint64_t hopKey = [v5 decodeInt64ForKey:@"hopKey"];
    self->_uint64_t selectedSyncCodeIndex = [v5 decodeIntForKey:@"selectedSyncCodeIndex"];
  }

  return self;
}

- (unsigned)stsIndex0
{
  return self->_stsIndex0;
}

- (unint64_t)uwbTime0
{
  return self->_uwbTime0;
}

- (unsigned)hopKey
{
  return self->_hopKey;
}

- (unsigned)selectedSyncCodeIndex
{
  return self->_selectedSyncCodeIndex;
}

@end