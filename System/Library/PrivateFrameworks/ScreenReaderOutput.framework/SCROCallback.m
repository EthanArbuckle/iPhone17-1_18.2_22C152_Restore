@interface SCROCallback
+ (BOOL)supportsSecureCoding;
- (BOOL)isAtomic;
- (SCROCallback)initWithCoder:(id)a3;
- (SCROCallback)initWithKey:(int)a3 object:(id)a4;
- (id)object;
- (int)key;
- (void)encodeWithCoder:(id)a3;
- (void)postToHandler:(id)a3;
- (void)setIsAtomic:(BOOL)a3;
@end

@implementation SCROCallback

- (SCROCallback)initWithKey:(int)a3 object:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SCROCallback;
  v8 = [(SCROCallback *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_key = a3;
    objc_storeStrong((id *)&v8->_object, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCROCallback)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntForKey:@"_key"];
  if (initWithCoder__onceToken != -1) {
    dispatch_once(&initWithCoder__onceToken, &__block_literal_global_5);
  }
  v6 = [v4 decodeObjectOfClasses:initWithCoder__classes forKey:@"_object"];
  id v7 = [(SCROCallback *)self initWithKey:v5 object:v6];

  return v7;
}

void __30__SCROCallback_initWithCoder___block_invoke()
{
  v4[10] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:10];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCoder__classes;
  initWithCoder__classes = v2;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t key = self->_key;
  id v5 = a3;
  [v5 encodeInt:key forKey:@"_key"];
  [v5 encodeObject:self->_object forKey:@"_object"];
}

- (int)key
{
  return self->_key;
}

- (id)object
{
  return self->_object;
}

- (void)setIsAtomic:(BOOL)a3
{
  self->_isAtomic = a3;
}

- (BOOL)isAtomic
{
  return self->_isAtomic;
}

- (void)postToHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end