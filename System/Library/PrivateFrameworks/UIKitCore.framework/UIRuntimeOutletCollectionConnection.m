@interface UIRuntimeOutletCollectionConnection
- (BOOL)addsContentToExistingCollection;
- (NSString)runtimeCollectionClassName;
- (UIRuntimeOutletCollectionConnection)initWithCoder:(id)a3;
- (id)description;
- (void)connectForSimulator;
- (void)encodeWithCoder:(id)a3;
- (void)performConnect;
- (void)setAddsContentToExistingCollection:(BOOL)a3;
- (void)setRuntimeCollectionClassName:(id)a3;
@end

@implementation UIRuntimeOutletCollectionConnection

- (UIRuntimeOutletCollectionConnection)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIRuntimeOutletCollectionConnection;
  v5 = [(UIRuntimeConnection *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"runtimeCollectionClassName"];
    runtimeCollectionClassName = v5->runtimeCollectionClassName;
    v5->runtimeCollectionClassName = (NSString *)v6;

    v5->addsContentToExistingCollection = [v4 decodeBoolForKey:@"addsContentToExistingCollection"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIRuntimeOutletCollectionConnection;
  [(UIRuntimeConnection *)&v6 encodeWithCoder:v4];
  runtimeCollectionClassName = self->runtimeCollectionClassName;
  if (runtimeCollectionClassName) {
    [v4 encodeObject:runtimeCollectionClassName forKey:@"runtimeCollectionClassName"];
  }
  [v4 encodeBool:self->addsContentToExistingCollection forKey:@"addsContentToExistingCollection"];
}

- (void)performConnect
{
  id v4 = [(UIRuntimeOutletCollectionConnection *)self runtimeCollectionClassName];
  v5 = NSClassFromString(v4);

  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [(UIRuntimeOutletCollectionConnection *)self runtimeCollectionClassName];
    [v16 handleFailureInMethod:a2, self, @"UIRuntimeOutletCollectionConnection.m", 37, @"No class named '%@'.", v17 object file lineNumber description];
  }
  if ([(objc_class *)v5 isSubclassOfClass:objc_opt_class()])
  {
    id v6 = [v5 alloc];
    v7 = [(UIRuntimeConnection *)self destination];
    id v18 = (id)[v6 initWithArray:v7];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = NSStringFromClass(v5);
    [v7 handleFailureInMethod:a2, self, @"UIRuntimeOutletCollectionConnection.m", 41, @"'%@' is not a supported collection class. Expected subclass of NSArray.", v8 object file lineNumber description];

    id v18 = 0;
  }

  if (!self->addsContentToExistingCollection) {
    goto LABEL_9;
  }
  objc_super v9 = [(UIRuntimeConnection *)self source];
  v10 = [(UIRuntimeConnection *)self label];
  v11 = [v9 valueForKeyPath:v10];

  if (v11)
  {
    v12 = [(UIRuntimeConnection *)self source];
    v13 = [(UIRuntimeConnection *)self label];
    v14 = [v12 mutableArrayValueForKeyPath:v13];

    [v14 addObjectsFromArray:v18];
  }
  else
  {
LABEL_9:
    v14 = [(UIRuntimeConnection *)self source];
    v15 = [(UIRuntimeConnection *)self label];
    [v14 setValue:v18 forKeyPath:v15];
  }
}

- (void)connectForSimulator
{
}

- (id)description
{
  v3 = NSString;
  id v4 = [(UIRuntimeConnection *)self source];
  v5 = [(UIRuntimeConnection *)self destination];
  id v6 = [(UIRuntimeConnection *)self label];
  v7 = [(UIRuntimeOutletCollectionConnection *)self runtimeCollectionClassName];
  v8 = [v3 stringWithFormat:@"Outlet collection connection with source %@, value %@, variable name %@, and runtime collection class name %@.", v4, v5, v6, v7];

  return v8;
}

- (NSString)runtimeCollectionClassName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRuntimeCollectionClassName:(id)a3
{
}

- (BOOL)addsContentToExistingCollection
{
  return self->addsContentToExistingCollection;
}

- (void)setAddsContentToExistingCollection:(BOOL)a3
{
  self->addsContentToExistingCollection = a3;
}

- (void).cxx_destruct
{
}

@end