@interface HAPArrayWrapper
+ (id)wrappertlv:(unint64_t)a3 name:(id)a4 objectCreator:(id)a5;
- (NSArray)field;
- (id)objectCreator;
- (void)setField:(id)a3;
- (void)setObjectCreator:(id)a3;
@end

@implementation HAPArrayWrapper

+ (id)wrappertlv:(unint64_t)a3 name:(id)a4 objectCreator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(HAPFieldWrapper *)[HAPArrayWrapper alloc] initWithTlvId:a3 name:v8];

  [(HAPArrayWrapper *)v9 setObjectCreator:v7];

  return v9;
}

- (NSArray)field
{
  return self->_field;
}

- (void)setField:(id)a3
{
}

- (id)objectCreator
{
  return self->_objectCreator;
}

- (void)setObjectCreator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_objectCreator, 0);

  objc_storeStrong((id *)&self->_field, 0);
}

@end