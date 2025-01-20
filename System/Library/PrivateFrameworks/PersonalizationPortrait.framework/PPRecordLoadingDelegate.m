@interface PPRecordLoadingDelegate
- (NSString)name;
- (PPRecordLoadingDelegate)initWithName:(id)a3;
- (id)description;
- (unsigned)recentRecordLoadingHandler:(id)a3;
- (unsigned)recordLoadingHandler:(id)a3;
@end

@implementation PPRecordLoadingDelegate

- (void).cxx_destruct
{
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)recentRecordLoadingHandler:(id)a3
{
  id v3 = a3;
  __break(1u);
  return v3;
}

- (unsigned)recordLoadingHandler:(id)a3
{
  id v3 = a3;
  __break(1u);
  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ '%@'>", v5, self->_name];

  return v6;
}

- (PPRecordLoadingDelegate)initWithName:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PPRecordLoadingDelegate.m", 19, @"Invalid parameter not satisfying: %@", @"name != nil" object file lineNumber description];
  }
  if (![v6 length])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PPRecordLoadingDelegate.m", 20, @"Invalid parameter not satisfying: %@", @"name.length > 0" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PPRecordLoadingDelegate;
  v7 = [(PPRecordLoadingDelegate *)&v12 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_name, a3);
  }

  return v8;
}

@end