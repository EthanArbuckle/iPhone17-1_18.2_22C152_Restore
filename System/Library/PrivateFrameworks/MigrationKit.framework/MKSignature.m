@interface MKSignature
+ (id)identifier:(const char *)a3 length:(unint64_t)a4;
@end

@implementation MKSignature

+ (id)identifier:(const char *)a3 length:(unint64_t)a4
{
  migrationkit::signature::get_identifier((migrationkit::signature *)a3, &__p);
  id v4 = [NSString alloc];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  v6 = (void *)[v4 initWithCString:p_p encoding:4];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v6;
}

@end