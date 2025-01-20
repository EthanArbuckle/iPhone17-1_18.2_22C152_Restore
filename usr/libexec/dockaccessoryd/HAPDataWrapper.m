@interface HAPDataWrapper
+ (id)wrappertlv:(unint64_t)a3 name:(id)a4;
- (NSData)field;
- (void)setField:(id)a3;
@end

@implementation HAPDataWrapper

+ (id)wrappertlv:(unint64_t)a3 name:(id)a4
{
  id v5 = a4;
  v6 = [(HAPFieldWrapper *)[HAPDataWrapper alloc] initWithTlvId:a3 name:v5];

  return v6;
}

- (NSData)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
}

- (void).cxx_destruct
{
}

@end