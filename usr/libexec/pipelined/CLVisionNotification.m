@interface CLVisionNotification
+ (BOOL)supportsSecureCoding;
- (CLVisionNotification)init;
- (CLVisionNotification)initWithARSessionState:(unint64_t)a3;
- (CLVisionNotification)initWithCoder:(id)a3;
- (CLVisionNotification)initWithSerializedVIOEstimation:()basic_string<char;
- (CLVisionNotification)initWithSerializedVLLocalizationResult:()basic_string<char;
- (basic_string<char,)serializedVIOEstimation;
- (basic_string<char,)serializedVLLocalizationResult;
- (id).cxx_construct;
- (int)notificationType;
- (unint64_t)arSessionState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLVisionNotification

- (unint64_t)arSessionState
{
  return self->_arSessionState;
}

- (CLVisionNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CLVisionNotification;
  v5 = [(CLVisionNotification *)&v27 init];
  if (v5)
  {
    v5->_arSessionState = (int)[v4 decodeIntForKey:@"arSessionState"];
    v5->_notificationType = [v4 decodeIntForKey:@"notificationType"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vioEstimation"];
    id v7 = [v6 bytes];
    unint64_t v8 = (unint64_t)[v6 length];
    size_t v9 = v8;
    if (v8 > 0x7FFFFFFFFFFFFFF7) {
      sub_1000A6968();
    }
    if (v8 >= 0x17)
    {
      uint64_t v21 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17) {
        uint64_t v21 = v8 | 7;
      }
      uint64_t v22 = v21 + 1;
      p_dst = (long long *)operator new(v21 + 1);
      *((void *)&__dst + 1) = v9;
      unint64_t v26 = v22 | 0x8000000000000000;
      *(void *)&long long __dst = p_dst;
    }
    else
    {
      HIBYTE(v26) = v8;
      p_dst = &__dst;
      if (!v8)
      {
        LOBYTE(__dst) = 0;
        p_serializedVIOEstimation = &v5->_serializedVIOEstimation;
        if ((*((char *)&v5->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0) {
          goto LABEL_6;
        }
LABEL_16:
        operator delete(p_serializedVIOEstimation->__r_.__value_.var0.var1.__data_);
LABEL_6:
        *(_OWORD *)p_serializedVIOEstimation->__r_.__value_.var0.var0.__data_ = __dst;
        *((void *)&p_serializedVIOEstimation->__r_.__value_.var0.var1 + 2) = v26;
        v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vlLocalizationResult"];

        id v13 = v12;
        id v14 = [v13 bytes];
        unint64_t v15 = (unint64_t)[v13 length];
        size_t v16 = v15;
        if (v15 > 0x7FFFFFFFFFFFFFF7) {
          sub_1000A6968();
        }
        if (v15 >= 0x17)
        {
          uint64_t v23 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v15 | 7) != 0x17) {
            uint64_t v23 = v15 | 7;
          }
          uint64_t v24 = v23 + 1;
          v17 = (long long *)operator new(v23 + 1);
          *((void *)&__dst + 1) = v16;
          unint64_t v26 = v24 | 0x8000000000000000;
          *(void *)&long long __dst = v17;
        }
        else
        {
          HIBYTE(v26) = v15;
          v17 = &__dst;
          if (!v15)
          {
            LOBYTE(__dst) = 0;
            p_var0 = &v5->_serializedVIOEstimation.__r_.var0;
            if ((v5->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] & 0x80000000) == 0)
            {
LABEL_10:
              *(_OWORD *)p_var0 = __dst;
              *((void *)p_var0 + 2) = v26;
              v19 = v5;

              goto LABEL_11;
            }
LABEL_21:
            operator delete(*(void **)p_var0);
            goto LABEL_10;
          }
        }
        memmove(v17, v14, v16);
        *((unsigned char *)v17 + v16) = 0;
        p_var0 = &v5->_serializedVIOEstimation.__r_.var0;
        if ((v5->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] & 0x80000000) == 0) {
          goto LABEL_10;
        }
        goto LABEL_21;
      }
    }
    memmove(p_dst, v7, v9);
    *((unsigned char *)p_dst + v9) = 0;
    p_serializedVIOEstimation = &v5->_serializedVIOEstimation;
    if ((*((char *)&v5->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_11:

  return v5;
}

- (int)notificationType
{
  return self->_notificationType;
}

- (void).cxx_destruct
{
  if (self->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] < 0)
  {
    operator delete(*(void **)&self->_serializedVIOEstimation.__r_.var0);
    if ((*((char *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0) {
      return;
    }
  }
  else if ((*((char *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
  {
    return;
  }
  data = self->_serializedVIOEstimation.__r_.__value_.var0.var1.__data_;

  operator delete(data);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLVisionNotification)init
{
  return 0;
}

- (CLVisionNotification)initWithARSessionState:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLVisionNotification;
  id v4 = [(CLVisionNotification *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_arSessionState = a3;
    v4->_notificationType = 0;
    id v6 = v4;
  }

  return v5;
}

- (CLVisionNotification)initWithSerializedVIOEstimation:()basic_string<char
{
  v8.receiver = self;
  v8.super_class = (Class)CLVisionNotification;
  id v4 = [(CLVisionNotification *)&v8 init];
  v5 = (CLVisionNotification *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)v4 + 1, (const std::string *)a3);
    v5->_notificationType = 1;
    id v6 = v5;
  }

  return v5;
}

- (CLVisionNotification)initWithSerializedVLLocalizationResult:()basic_string<char
{
  v8.receiver = self;
  v8.super_class = (Class)CLVisionNotification;
  id v4 = [(CLVisionNotification *)&v8 init];
  v5 = (CLVisionNotification *)v4;
  if (v4)
  {
    std::string::operator=((std::string *)v4 + 2, (const std::string *)a3);
    v5->_notificationType = 2;
    id v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeInt:LODWORD(self->_arSessionState) forKey:@"arSessionState"];
  [v10 encodeInt:self->_notificationType forKey:@"notificationType"];
  if (*((char *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23) < 0)
  {
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)self->_serializedVIOEstimation.__r_.__value_.var0.var1.__data_;
    unint64_t size = self->_serializedVIOEstimation.__r_.__value_.var0.var1.__size_;
  }
  else
  {
    data = &self->_serializedVIOEstimation;
    unint64_t size = *((unsigned __int8 *)&self->_serializedVIOEstimation.__r_.__value_.var0.var1 + 23);
  }
  id v6 = +[NSData dataWithBytes:data length:size];
  [v10 encodeObject:v6 forKey:@"vioEstimation"];

  if (self->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7] < 0)
  {
    p_int64_t var0 = *(int **)&self->_serializedVIOEstimation.__r_.var0;
    int64_t var0 = self->_serializedVIOEstimation.var0;
  }
  else
  {
    p_int64_t var0 = &self->_serializedVIOEstimation.__r_.var0;
    int64_t var0 = self->_serializedVLLocalizationResult.__r_.__value_.var0.var0.__data_[7];
  }
  size_t v9 = +[NSData dataWithBytes:p_var0 length:var0];
  [v10 encodeObject:v9 forKey:@"vlLocalizationResult"];
}

- (basic_string<char,)serializedVIOEstimation
{
  if (result[1].__r_.__value_.var0.var0.__data_[7] < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1000559FC(retstr, *(void **)&result->__r_.var0, result->var0);
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.var0;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = result[1].__r_.__value_.var0.var1.__data_;
  return result;
}

- (basic_string<char,)serializedVLLocalizationResult
{
  if (*((char *)&result[1].__r_.var1 + 3) < 0) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_1000559FC(retstr, (void *)result[1].__r_.__value_.var0.var1.__size_, *((void *)&result[1].__r_.__value_.var0.var1+ 2));
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result[1].__r_.__value_.var0.var1.__size_;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = *(void *)&result[1].__r_.var0;
  return result;
}

@end