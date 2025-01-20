@interface NAIdentityBuilder
+ (id)buildPointerIdentity;
+ (id)builder;
+ (id)builderWithIdentity:(id)a3;
+ (id)na_identity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isObject:(id)a3 equalToObject:(id)a4;
- (NAIdentity)builtIdentity;
- (NAIdentityBuilder)init;
- (NAIdentityBuilder)initWithIdentity:(id)a3;
- (NSMutableArray)characteristics;
- (id)appendCharacteristic:(id)a3;
- (id)appendCharacteristic:(id)a3 withRole:(int64_t)a4;
- (id)appendCharacteristic:(id)a3 withRole:(int64_t)a4 comparatorBlock:(id)a5 hashBlock:(id)a6;
- (id)appendDoubleCharacteristic:(id)a3;
- (id)appendDoubleCharacteristic:(id)a3 withRole:(int64_t)a4;
- (id)appendFloatCharacteristic:(id)a3;
- (id)appendFloatCharacteristic:(id)a3 withRole:(int64_t)a4;
- (id)appendIntegerCharacteristic:(id)a3;
- (id)appendIntegerCharacteristic:(id)a3 withRole:(int64_t)a4;
- (id)appendRangeCharacteristic:(id)a3;
- (id)appendRangeCharacteristic:(id)a3 withRole:(int64_t)a4;
- (id)appendUnsignedIntegerCharacteristic:(id)a3;
- (id)appendUnsignedIntegerCharacteristic:(id)a3 withRole:(int64_t)a4;
- (id)build;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)hashOfObject:(id)a3;
- (void)setBuiltIdentity:(id)a3;
- (void)setCharacteristics:(id)a3;
@end

@implementation NAIdentityBuilder

id __41__NAIdentityBuilder_buildPointerIdentity__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

- (id)appendCharacteristic:(id)a3
{
  return [(NAIdentityBuilder *)self appendCharacteristic:a3 withRole:3 comparatorBlock:0 hashBlock:0];
}

+ (id)buildPointerIdentity
{
  id v2 = +[NAIdentityBuilder builder];
  v3 = [v2 appendCharacteristic:&__block_literal_global_143 withRole:3 comparatorBlock:&__block_literal_global_7_0 hashBlock:&__block_literal_global_16];
  v4 = [v3 build];

  return v4;
}

+ (id)builderWithIdentity:(id)a3
{
  id v3 = a3;
  v4 = [[NAIdentityBuilder alloc] initWithIdentity:v3];

  return v4;
}

+ (id)builder
{
  id v2 = objc_opt_new();
  return v2;
}

- (NAIdentityBuilder)init
{
  return [(NAIdentityBuilder *)self initWithIdentity:0];
}

- (id)build
{
  id v3 = [(NAIdentityBuilder *)self builtIdentity];

  if (!v3)
  {
    v4 = [NAIdentity alloc];
    v5 = [(NAIdentityBuilder *)self characteristics];
    v6 = [(NAIdentity *)v4 initWithCharacteristics:v5];
    [(NAIdentityBuilder *)self setBuiltIdentity:v6];
  }
  v7 = [(NAIdentityBuilder *)self builtIdentity];
  return v7;
}

- (NAIdentity)builtIdentity
{
  return self->_builtIdentity;
}

- (id)appendCharacteristic:(id)a3 withRole:(int64_t)a4 comparatorBlock:(id)a5 hashBlock:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  [(NAIdentityBuilder *)self setBuiltIdentity:0];
  v13 = objc_opt_new();
  [v13 setRole:a4];
  v14 = (void *)[v12 copy];

  [v13 setRetrievalBlock:v14];
  if (v10)
  {
    v15 = (void *)[v10 copy];
    [v13 setComparisonBlock:v15];
  }
  if (v11)
  {
    v16 = (void *)[v11 copy];
    [v13 setHashBlock:v16];
  }
  v17 = [(NAIdentityBuilder *)self characteristics];
  [v17 addObject:v13];

  return self;
}

- (void)setBuiltIdentity:(id)a3
{
}

- (NSMutableArray)characteristics
{
  return self->_characteristics;
}

- (NAIdentityBuilder)initWithIdentity:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NAIdentityBuilder;
  v5 = [(NAIdentityBuilder *)&v10 init];
  if (v5)
  {
    v6 = [v4 characteristics];
    v7 = (void *)[v6 mutableCopy];
    if (v7)
    {
      [(NAIdentityBuilder *)v5 setCharacteristics:v7];
    }
    else
    {
      v8 = objc_opt_new();
      [(NAIdentityBuilder *)v5 setCharacteristics:v8];
    }
    [(NAIdentityBuilder *)v5 setBuiltIdentity:v4];
  }

  return v5;
}

- (void)setCharacteristics:(id)a3
{
}

- (id)appendCharacteristic:(id)a3 withRole:(int64_t)a4
{
  return [(NAIdentityBuilder *)self appendCharacteristic:a3 withRole:a4 comparatorBlock:0 hashBlock:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builtIdentity, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  v5 = [(NAIdentityBuilder *)self characteristics];
  v6 = (void *)[v5 mutableCopy];
  [v4 setCharacteristics:v6];

  v7 = [v4 builtIdentity];
  [v4 setBuiltIdentity:v7];

  return v4;
}

- (id)appendIntegerCharacteristic:(id)a3
{
  return [(NAIdentityBuilder *)self appendIntegerCharacteristic:a3 withRole:3];
}

- (id)appendUnsignedIntegerCharacteristic:(id)a3
{
  return [(NAIdentityBuilder *)self appendUnsignedIntegerCharacteristic:a3 withRole:3];
}

- (id)appendFloatCharacteristic:(id)a3
{
  return [(NAIdentityBuilder *)self appendFloatCharacteristic:a3 withRole:3];
}

- (id)appendDoubleCharacteristic:(id)a3
{
  return [(NAIdentityBuilder *)self appendDoubleCharacteristic:a3 withRole:3];
}

- (id)appendRangeCharacteristic:(id)a3
{
  return [(NAIdentityBuilder *)self appendRangeCharacteristic:a3 withRole:3];
}

- (id)appendIntegerCharacteristic:(id)a3 withRole:(int64_t)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__NAIdentityBuilder_appendIntegerCharacteristic_withRole___block_invoke;
  v10[3] = &unk_1E610A670;
  id v11 = v6;
  id v7 = v6;
  v8 = [(NAIdentityBuilder *)self appendCharacteristic:v10 withRole:a4 comparatorBlock:0 hashBlock:0];

  return v8;
}

uint64_t __58__NAIdentityBuilder_appendIntegerCharacteristic_withRole___block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return [v1 numberWithInteger:v2];
}

- (id)appendUnsignedIntegerCharacteristic:(id)a3 withRole:(int64_t)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__NAIdentityBuilder_appendUnsignedIntegerCharacteristic_withRole___block_invoke;
  v10[3] = &unk_1E610A670;
  id v11 = v6;
  id v7 = v6;
  v8 = [(NAIdentityBuilder *)self appendCharacteristic:v10 withRole:a4 comparatorBlock:0 hashBlock:0];

  return v8;
}

uint64_t __66__NAIdentityBuilder_appendUnsignedIntegerCharacteristic_withRole___block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  uint64_t v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return [v1 numberWithUnsignedInteger:v2];
}

- (id)appendFloatCharacteristic:(id)a3 withRole:(int64_t)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__NAIdentityBuilder_appendFloatCharacteristic_withRole___block_invoke;
  v10[3] = &unk_1E610A670;
  id v11 = v6;
  id v7 = v6;
  v8 = [(NAIdentityBuilder *)self appendCharacteristic:v10 withRole:a4 comparatorBlock:&__block_literal_global_8 hashBlock:0];

  return v8;
}

uint64_t __56__NAIdentityBuilder_appendFloatCharacteristic_withRole___block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return objc_msgSend(v1, "numberWithFloat:");
}

- (id)appendDoubleCharacteristic:(id)a3 withRole:(int64_t)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__NAIdentityBuilder_appendDoubleCharacteristic_withRole___block_invoke;
  v10[3] = &unk_1E610A670;
  id v11 = v6;
  id v7 = v6;
  v8 = [(NAIdentityBuilder *)self appendCharacteristic:v10 withRole:a4 comparatorBlock:&__block_literal_global_2 hashBlock:0];

  return v8;
}

uint64_t __57__NAIdentityBuilder_appendDoubleCharacteristic_withRole___block_invoke(uint64_t a1)
{
  v1 = NSNumber;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return objc_msgSend(v1, "numberWithDouble:");
}

- (id)appendRangeCharacteristic:(id)a3 withRole:(int64_t)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__NAIdentityBuilder_appendRangeCharacteristic_withRole___block_invoke;
  v10[3] = &unk_1E610A670;
  id v11 = v6;
  id v7 = v6;
  v8 = [(NAIdentityBuilder *)self appendCharacteristic:v10 withRole:a4 comparatorBlock:&__block_literal_global_2 hashBlock:0];

  return v8;
}

uint64_t __56__NAIdentityBuilder_appendRangeCharacteristic_withRole___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F29238];
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return objc_msgSend(v1, "valueWithRange:", v3, v2);
}

- (unint64_t)hashOfObject:(id)a3
{
  id v4 = a3;
  v5 = [(NAIdentityBuilder *)self build];
  unint64_t v6 = [v5 hashOfObject:v4];

  return v6;
}

- (BOOL)isObject:(id)a3 equalToObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(NAIdentityBuilder *)self build];
  char v9 = [v8 isObject:v7 equalToObject:v6];

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

+ (id)na_identity
{
  if (na_identity_onceToken_135 != -1) {
    dispatch_once(&na_identity_onceToken_135, &__block_literal_global_137);
  }
  uint64_t v2 = (void *)na_identity_identity_134;
  return v2;
}

void __32__NAIdentityBuilder_na_identity__block_invoke()
{
  id v3 = +[NAIdentityBuilder builder];
  id v0 = (id)[v3 appendCharacteristic:&__block_literal_global_140];
  uint64_t v1 = [v3 build];
  uint64_t v2 = (void *)na_identity_identity_134;
  na_identity_identity_134 = v1;
}

uint64_t __32__NAIdentityBuilder_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 characteristics];
}

@end