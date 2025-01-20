@interface TICompositionMapItem
+ (id)itemWithKey:(id)a3 value:(id)a4;
- (NSString)key;
- (NSString)value;
- (TICompositionMapItem)initWithKey:(id)a3 value:(id)a4;
@end

@implementation TICompositionMapItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (NSString)value
{
  return self->_value;
}

- (NSString)key
{
  return self->_key;
}

- (TICompositionMapItem)initWithKey:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TICompositionMapItem;
  v8 = [(TICompositionMapItem *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    key = v8->_key;
    v8->_key = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    value = v8->_value;
    v8->_value = (NSString *)v11;
  }
  return v8;
}

+ (id)itemWithKey:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithKey:v7 value:v6];

  return v8;
}

@end