@interface CLPOutdoorEstimatorLogEntryNotification
+ (BOOL)supportsSecureCoding;
- (CLPOutdoorEstimatorLogEntryNotification)init;
- (CLPOutdoorEstimatorLogEntryNotification)initWithCoder:(id)a3;
- (CLPOutdoorEstimatorLogEntryNotification)initWithSerializedOutdoorEstimatorLogEntry:()basic_string<char;
- (basic_string<char,)serializedOutdoorEstimatorLogEntry;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLPOutdoorEstimatorLogEntryNotification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLPOutdoorEstimatorLogEntryNotification)init
{
  return 0;
}

- (CLPOutdoorEstimatorLogEntryNotification)initWithSerializedOutdoorEstimatorLogEntry:()basic_string<char
{
  v8.receiver = self;
  v8.super_class = (Class)CLPOutdoorEstimatorLogEntryNotification;
  v4 = [(CLPOutdoorEstimatorLogEntryNotification *)&v8 init];
  v5 = (CLPOutdoorEstimatorLogEntryNotification *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)(v4 + 8), (const std::string *)a3);
    v6 = v5;
  }

  return v5;
}

- (CLPOutdoorEstimatorLogEntryNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CLPOutdoorEstimatorLogEntryNotification;
  v5 = [(CLPOutdoorEstimatorLogEntryNotification *)&v19 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outdoorEstimatorLogEntry"];
    id v7 = [v6 bytes];
    unint64_t v8 = (unint64_t)[v6 length];
    size_t v9 = v8;
    if (v8 >= 0x7FFFFFFFFFFFFFF8) {
      sub_1000A6968();
    }
    if (v8 >= 0x17)
    {
      uint64_t v15 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17) {
        uint64_t v15 = v8 | 7;
      }
      uint64_t v16 = v15 + 1;
      p_dst = (long long *)operator new(v15 + 1);
      *((void *)&__dst + 1) = v9;
      unint64_t v18 = v16 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
    }
    else
    {
      HIBYTE(v18) = v8;
      p_dst = &__dst;
      if (!v8)
      {
        LOBYTE(__dst) = 0;
        p_serializedOutdoorEstimatorLogEntry = &v5->_serializedOutdoorEstimatorLogEntry;
        if ((*((char *)&v5->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
        {
LABEL_6:
          long long v12 = __dst;
          *((void *)&p_serializedOutdoorEstimatorLogEntry->__r_.__value_.var0.var1 + 2) = v18;
          *(_OWORD *)p_serializedOutdoorEstimatorLogEntry->__r_.__value_.var0.var0.__data_ = v12;
          v13 = v5;

          goto LABEL_7;
        }
LABEL_12:
        operator delete(p_serializedOutdoorEstimatorLogEntry->__r_.__value_.var0.var1.__data_);
        goto LABEL_6;
      }
    }
    memmove(p_dst, v7, v9);
    *((unsigned char *)p_dst + v9) = 0;
    p_serializedOutdoorEstimatorLogEntry = &v5->_serializedOutdoorEstimatorLogEntry;
    if ((*((char *)&v5->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_7:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  if (*((char *)&self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1.__data_;
    unint64_t size = self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1.__size_;
  }
  else
  {
    data = &self->_serializedOutdoorEstimatorLogEntry;
    unint64_t size = *((unsigned __int8 *)&self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23);
  }
  id v6 = +[NSData dataWithBytes:data length:size];
  [v7 encodeObject:v6 forKey:@"outdoorEstimatorLogEntry"];
}

- (basic_string<char,)serializedOutdoorEstimatorLogEntry
{
  if (*((char *)&result->__r_.var1 + 3) < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1000559FC(retstr, (void *)result->__r_.__value_.var0.var1.__size_, *((void *)&result->__r_.__value_.var0.var1+ 2));
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.__value_.var0.var1.__size_;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = *(void *)&result->__r_.var0;
  return result;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_serializedOutdoorEstimatorLogEntry.__r_.__value_.var0.var1.__data_);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0uLL;
  *((void *)self + 3) = 0;
  return self;
}

@end