@interface TTSStringEnum
- (BOOL)isEqual:(id)a3;
- (NSString)string;
- (TTSStringEnum)initWithString:(id)a3;
- (id)description;
- (int64_t)hash;
@end

@implementation TTSStringEnum

- (BOOL)isEqual:(id)a3
{
  return sub_19CDB557C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))TTSStringEnum.isEqual(_:));
}

- (NSString)string
{
  return self->_string;
}

- (id)description
{
  return self->_string;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = TTSStringEnum.hash.getter();

  return v3;
}

- (void).cxx_destruct
{
}

- (TTSStringEnum)initWithString:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TTSStringEnum;
  id v3 = a3;
  v4 = [(TTSStringEnum *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  string = v4->_string;
  v4->_string = (NSString *)v5;

  return v4;
}

@end