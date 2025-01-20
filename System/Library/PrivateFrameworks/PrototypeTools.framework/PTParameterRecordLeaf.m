@interface PTParameterRecordLeaf
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)recordClassName;
- (PTParameterRecordLeaf)initWithCoder:(id)a3;
- (PTParameterRecordLeaf)initWithRecordClassName:(id)a3 value:(id)a4;
- (id)changedValue;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChangedValue:(id)a3;
- (void)setRecordClassName:(id)a3;
@end

@implementation PTParameterRecordLeaf

- (PTParameterRecordLeaf)initWithRecordClassName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PTParameterRecordLeaf;
  v8 = [(PTParameterRecordLeaf *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(PTParameterRecordLeaf *)v8 setRecordClassName:v6];
    [(PTParameterRecordLeaf *)v9 setChangedValue:v7];
  }

  return v9;
}

- (PTParameterRecordLeaf)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordClassName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changedValue"];

  id v7 = [(PTParameterRecordLeaf *)self initWithRecordClassName:v5 value:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PTParameterRecordLeaf *)self recordClassName];
  [v4 encodeObject:v5 forKey:@"recordClassName"];

  id v6 = [(PTParameterRecordLeaf *)self changedValue];
  [v4 encodeObject:v6 forKey:@"changedValue"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(PTParameterRecordLeaf *)self recordClassName];
  id v6 = [(PTParameterRecordLeaf *)self changedValue];
  id v7 = (void *)[v4 initWithRecordClassName:v5 value:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = [(PTParameterRecordLeaf *)self recordClassName];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __33__PTParameterRecordLeaf_isEqual___block_invoke;
  v16[3] = &unk_1E63BC7B8;
  id v7 = v4;
  id v17 = v7;
  v8 = [v5 appendString:v6 counterpart:v16];
  v9 = [(PTParameterRecordLeaf *)self changedValue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __33__PTParameterRecordLeaf_isEqual___block_invoke_2;
  v14[3] = &unk_1E63BC7E0;
  id v15 = v7;
  id v10 = v7;
  objc_super v11 = [v8 appendObject:v9 counterpart:v14];
  BOOL v12 = v11 != 0;

  return v12;
}

uint64_t __33__PTParameterRecordLeaf_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recordClassName];
}

uint64_t __33__PTParameterRecordLeaf_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) changedValue];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(PTParameterRecordLeaf *)self recordClassName];
  v5 = [v3 appendString:v4];
  id v6 = [(PTParameterRecordLeaf *)self changedValue];
  id v7 = [v5 appendObject:v6];
  unint64_t v8 = [v7 hash];

  return v8;
}

- (NSString)recordClassName
{
  return self->_recordClassName;
}

- (void)setRecordClassName:(id)a3
{
}

- (id)changedValue
{
  return self->_changedValue;
}

- (void)setChangedValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changedValue, 0);
  objc_storeStrong((id *)&self->_recordClassName, 0);
}

@end