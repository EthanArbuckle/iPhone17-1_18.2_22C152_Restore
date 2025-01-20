@interface TPSSizes
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (TPSSize)compact;
- (TPSSize)regular;
- (TPSSizes)initWithCoder:(id)a3;
- (TPSSizes)initWithDictionary:(id)a3;
- (double)heightToWidthRatioForViewMode:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCompact:(id)a3;
- (void)setRegular:(id)a3;
@end

@implementation TPSSizes

- (TPSSizes)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TPSSizes;
  v5 = [(TPSSerializableObject *)&v19 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 TPSSafeDictionaryForKey:@"compact"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (void *)v6;
    }
    else {
      v8 = v4;
    }
    id v9 = v8;

    v10 = [[TPSSize alloc] initWithDictionary:v9];
    compact = v5->_compact;
    v5->_compact = v10;

    uint64_t v12 = [v4 TPSSafeDictionaryForKey:@"regular"];
    v13 = (void *)v12;
    if (v12) {
      v14 = (void *)v12;
    }
    else {
      v14 = v4;
    }
    id v15 = v14;

    v16 = [[TPSSize alloc] initWithDictionary:v15];
    regular = v5->_regular;
    v5->_regular = v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSSizes;
  id v4 = a3;
  [(TPSSerializableObject *)&v7 encodeWithCoder:v4];
  v5 = [(TPSSizes *)self compact];
  [v4 encodeObject:v5 forKey:@"compact"];

  uint64_t v6 = [(TPSSizes *)self regular];
  [v4 encodeObject:v6 forKey:@"regular"];
}

- (TPSSize)regular
{
  return self->_regular;
}

- (TPSSize)compact
{
  return self->_compact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regular, 0);
  objc_storeStrong((id *)&self->_compact, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSSizes)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSSizes;
  v5 = [(TPSSerializableObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"compact"];
    compact = v5->_compact;
    v5->_compact = (TPSSize *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"regular"];
    regular = v5->_regular;
    v5->_regular = (TPSSize *)v8;
  }
  return v5;
}

id __23__TPSSizes_na_identity__block_invoke()
{
  if (TPSSizesRegularKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&TPSSizesRegularKey_block_invoke_na_once_token_0, &__block_literal_global_7_1);
  }
  v0 = (void *)TPSSizesRegularKey_block_invoke_na_once_object_0;
  return v0;
}

uint64_t __23__TPSSizes_na_identity__block_invoke_2()
{
  uint64_t v0 = __23__TPSSizes_na_identity__block_invoke_3();
  uint64_t v1 = TPSSizesRegularKey_block_invoke_na_once_object_0;
  TPSSizesRegularKey_block_invoke_na_once_object_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __23__TPSSizes_na_identity__block_invoke_3()
{
  uint64_t v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_13];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_15];
  v3 = [v0 build];

  return v3;
}

uint64_t __23__TPSSizes_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 compact];
}

uint64_t __23__TPSSizes_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 regular];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TPSSizes;
  id v4 = [(TPSSerializableObject *)&v8 copyWithZone:a3];
  v5 = [(TPSSizes *)self compact];
  [v4 setCompact:v5];

  uint64_t v6 = [(TPSSizes *)self regular];
  [v4 setRegular:v6];

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

- (double)heightToWidthRatioForViewMode:(int64_t)a3
{
  if (a3) {
    [(TPSSizes *)self regular];
  }
  else {
  v3 = [(TPSSizes *)self compact];
  }
  unint64_t v4 = v3;
  if (v3)
  {
    v5 = [v3 height];
    [v5 doubleValue];
    double v7 = v6;
    objc_super v8 = [v4 width];
    [v8 doubleValue];
    double v10 = v7 / v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSSizes;
  unint64_t v4 = [(TPSSizes *)&v9 description];
  v5 = (void *)[v3 initWithString:v4];

  double v6 = [(TPSSizes *)self compact];
  [v5 appendFormat:@" %@ = %@,", @"compact", v6];

  double v7 = [(TPSSizes *)self regular];
  [v5 appendFormat:@" %@ = %@", @"regular", v7];

  return v5;
}

- (void)setCompact:(id)a3
{
}

- (void)setRegular:(id)a3
{
}

@end