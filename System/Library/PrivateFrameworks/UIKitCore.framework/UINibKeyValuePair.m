@interface UINibKeyValuePair
- (NSString)keyPath;
- (UINibKeyValuePair)initWithCoder:(id)a3;
- (UINibKeyValuePair)initWithObject:(id)a3 keyPath:(id)a4 value:(id)a5;
- (id)object;
- (id)value;
- (void)apply;
- (void)applyForSimulator;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UINibKeyValuePair

- (UINibKeyValuePair)initWithObject:(id)a3 keyPath:(id)a4 value:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UINibKeyValuePair;
  v12 = [(UINibKeyValuePair *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->object, a3);
    uint64_t v14 = [v10 copy];
    keyPath = v13->keyPath;
    v13->keyPath = (NSString *)v14;

    objc_storeStrong(&v13->value, a5);
  }

  return v13;
}

- (void)apply
{
}

- (void)applyForSimulator
{
}

- (UINibKeyValuePair)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UINibKeyValuePair;
  v5 = [(UINibKeyValuePair *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UIObject"];
    id object = v5->object;
    v5->id object = (id)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"UIValue"];
    id value = v5->value;
    v5->id value = (id)v8;

    id v10 = [v4 decodeObjectForKey:@"UIKeyPath"];
    uint64_t v11 = [v10 copy];
    keyPath = v5->keyPath;
    v5->keyPath = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id object = self->object;
  id v5 = a3;
  [v5 encodeObject:object forKey:@"UIObject"];
  [v5 encodeObject:self->value forKey:@"UIValue"];
  [v5 encodeObject:self->keyPath forKey:@"UIKeyPath"];
}

- (id)object
{
  return self->object;
}

- (NSString)keyPath
{
  return self->keyPath;
}

- (id)value
{
  return self->value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->value, 0);
  objc_storeStrong((id *)&self->keyPath, 0);
  objc_storeStrong(&self->object, 0);
}

@end