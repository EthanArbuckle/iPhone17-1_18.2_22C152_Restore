@interface TPSAppEntity
- (NSString)bundleId;
- (NSString)name;
- (TPSAppEntity)initWithDictionary:(id)a3;
- (id)value;
- (void)setBundleId:(id)a3;
- (void)setName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation TPSAppEntity

- (TPSAppEntity)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAppEntity;
  v5 = [(TPSAppEntity *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 TPSSafeStringForKey:@"name"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1F4017D10;
    }
    objc_storeStrong((id *)&v5->_name, v8);

    uint64_t v9 = [v4 TPSSafeStringForKey:@"bundleId"];
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = &stru_1F4017D10;
    }
    objc_storeStrong((id *)&v5->_bundleId, v11);

    uint64_t v12 = [v4 TPSSafeObjectForKey:@"value"];
    id value = v5->_value;
    v5->_id value = (id)v12;
  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end