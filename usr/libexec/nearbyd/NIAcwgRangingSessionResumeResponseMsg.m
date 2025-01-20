@interface NIAcwgRangingSessionResumeResponseMsg
+ (BOOL)supportsSecureCoding;
+ (id)fromStruct:(AcwgRangingSessionResumeResponseMsgStruct)a3;
- (NIAcwgRangingSessionResumeResponseMsg)initWithCoder:(id)a3;
- (NIAcwgRangingSessionResumeResponseMsg)initWithStsIndex0:(unsigned int)a3 uwbTime0:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)uwbTime0;
- (unsigned)stsIndex0;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NIAcwgRangingSessionResumeResponseMsg

- (NIAcwgRangingSessionResumeResponseMsg)initWithStsIndex0:(unsigned int)a3 uwbTime0:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NIAcwgRangingSessionResumeResponseMsg;
  result = [(NIAcwgRangingSessionResumeResponseMsg *)&v7 init];
  if (result)
  {
    result->_stsIndex0 = a3;
    result->_uwbTime0 = a4;
  }
  return result;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@:\n", v4];

  [v5 appendFormat:@"stsIndex0:%u\n", self->_stsIndex0];
  [v5 appendFormat:@"uwbTime0:%llu>", self->_uwbTime0];

  return v5;
}

+ (id)fromStruct:(AcwgRangingSessionResumeResponseMsgStruct)a3
{
  id v3 = [objc_alloc((Class)a1) initWithStsIndex0:*(void *)&a3.var0 uwbTime0:a3.var1];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t stsIndex0 = self->_stsIndex0;
  unint64_t uwbTime0 = self->_uwbTime0;

  return [v4 initWithStsIndex0:stsIndex0 uwbTime0:uwbTime0];
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
}

- (NIAcwgRangingSessionResumeResponseMsg)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self)
  {
    self->_uint64_t stsIndex0 = [v4 decodeInt64ForKey:@"stsIndex0"];
    self->_unint64_t uwbTime0 = (unint64_t)[v5 decodeInt64ForKey:@"uwbTime0"];
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

@end