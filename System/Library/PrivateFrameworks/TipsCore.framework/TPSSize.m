@interface TPSSize
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)height;
- (NSNumber)width;
- (TPSSize)initWithCoder:(id)a3;
- (TPSSize)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHeight:(id)a3;
- (void)setWidth:(id)a3;
@end

@implementation TPSSize

- (TPSSize)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSSize;
  v5 = [(TPSSerializableObject *)&v12 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 TPSSafeNumberForKey:@"width"];
  width = v5->_width;
  v5->_width = (NSNumber *)v6;

  uint64_t v8 = [v4 TPSSafeNumberForKey:@"height"];
  height = v5->_height;
  v5->_height = (NSNumber *)v8;

  if ([(NSNumber *)v5->_width intValue] < 1 || [(NSNumber *)v5->_height intValue] < 1) {
    v10 = 0;
  }
  else {
LABEL_4:
  }
    v10 = v5;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSSize;
  id v4 = a3;
  [(TPSSerializableObject *)&v7 encodeWithCoder:v4];
  v5 = [(TPSSize *)self width];
  [v4 encodeObject:v5 forKey:@"width"];

  uint64_t v6 = [(TPSSize *)self height];
  [v4 encodeObject:v6 forKey:@"height"];
}

- (NSNumber)width
{
  return self->_width;
}

- (NSNumber)height
{
  return self->_height;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSSize)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSSize;
  v5 = [(TPSSerializableObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"width"];
    width = v5->_width;
    v5->_width = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"height"];
    height = v5->_height;
    v5->_height = (NSNumber *)v8;
  }
  return v5;
}

id __22__TPSSize_na_identity__block_invoke()
{
  if (TPSSizeHeightKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&TPSSizeHeightKey_block_invoke_na_once_token_0, &__block_literal_global_7_2);
  }
  v0 = (void *)TPSSizeHeightKey_block_invoke_na_once_object_0;
  return v0;
}

uint64_t __22__TPSSize_na_identity__block_invoke_2()
{
  uint64_t v0 = __22__TPSSize_na_identity__block_invoke_3();
  uint64_t v1 = TPSSizeHeightKey_block_invoke_na_once_object_0;
  TPSSizeHeightKey_block_invoke_na_once_object_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __22__TPSSize_na_identity__block_invoke_3()
{
  uint64_t v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_13_0];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_15_0];
  v3 = [v0 build];

  return v3;
}

uint64_t __22__TPSSize_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 width];
}

uint64_t __22__TPSSize_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 height];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TPSSize;
  id v4 = [(TPSSerializableObject *)&v8 copyWithZone:a3];
  v5 = [(TPSSize *)self width];
  [v4 setWidth:v5];

  uint64_t v6 = [(TPSSize *)self height];
  [v4 setHeight:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSSize;
  unint64_t v4 = [(TPSSize *)&v9 description];
  v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSSize *)self width];
  [v5 appendFormat:@" %@ = %@,", @"width", v6];

  objc_super v7 = [(TPSSize *)self height];
  [v5 appendFormat:@" %@ = %@", @"height", v7];

  return v5;
}

- (void)setWidth:(id)a3
{
}

- (void)setHeight:(id)a3
{
}

@end