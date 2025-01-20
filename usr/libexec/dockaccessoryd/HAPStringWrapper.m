@interface HAPStringWrapper
+ (id)wrappertlv:(unint64_t)a3 name:(id)a4;
- (NSString)field;
- (void)setField:(id)a3;
@end

@implementation HAPStringWrapper

+ (id)wrappertlv:(unint64_t)a3 name:(id)a4
{
  id v5 = a4;
  v6 = [(HAPFieldWrapper *)[HAPStringWrapper alloc] initWithTlvId:a3 name:v5];

  return v6;
}

- (NSString)field
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