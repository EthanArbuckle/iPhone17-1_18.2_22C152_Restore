@interface ICAMSBagValuePromise
- (ICAMSBagValuePromise)initWithBagKey:(id)a3 bagValueType:(unint64_t)a4;
- (NSString)bagKey;
- (unint64_t)bagValueType;
@end

@implementation ICAMSBagValuePromise

- (ICAMSBagValuePromise)initWithBagKey:(id)a3 bagValueType:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICAMSBagValuePromise;
  v7 = [(ICAMSBagValuePromise *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    bagKey = v7->_bagKey;
    v7->_bagKey = (NSString *)v8;

    v7->_bagValueType = a4;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (unint64_t)bagValueType
{
  return self->_bagValueType;
}

- (NSString)bagKey
{
  return self->_bagKey;
}

@end