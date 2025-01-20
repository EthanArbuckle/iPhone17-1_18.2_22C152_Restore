@interface PendingCallback
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBeenCalled;
- (NSArray)args;
- (PendingCallback)initWithCallbackType:(int)a3 taskIdentifier:(unint64_t)a4 args:(id)a5;
- (PendingCallback)initWithCoder:(id)a3;
- (int)type;
- (unint64_t)taskIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setArgs:(id)a3;
- (void)setHasBeenCalled:(BOOL)a3;
- (void)setTaskIdentifier:(unint64_t)a3;
- (void)setType:(int)a3;
@end

@implementation PendingCallback

- (void).cxx_destruct
{
}

- (void)setHasBeenCalled:(BOOL)a3
{
  self->_hasBeenCalled = a3;
}

- (BOOL)hasBeenCalled
{
  return self->_hasBeenCalled;
}

- (void)setArgs:(id)a3
{
}

- (NSArray)args
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)type
{
  return self->_type;
}

- (PendingCallback)initWithCoder:(id)a3
{
  id v4 = a3;
  -[PendingCallback setType:](self, "setType:", [v4 decodeIntegerForKey:@"type"]);
  -[PendingCallback setTaskIdentifier:](self, "setTaskIdentifier:", [v4 decodeIntegerForKey:@"taskIdentifier"]);
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"args"];
  [(PendingCallback *)self setArgs:v5];

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:-[PendingCallback type](self, "type") forKey:@"type"];
  [v5 encodeInteger:-[PendingCallback taskIdentifier](self, "taskIdentifier") forKey:@"taskIdentifier"];
  id v4 = [(PendingCallback *)self args];
  [v5 encodeObject:v4 forKey:@"args"];
}

- (PendingCallback)initWithCallbackType:(int)a3 taskIdentifier:(unint64_t)a4 args:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PendingCallback;
  v9 = [(PendingCallback *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(PendingCallback *)v9 setType:v6];
    [(PendingCallback *)v10 setTaskIdentifier:a4];
    [(PendingCallback *)v10 setArgs:v8];
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end