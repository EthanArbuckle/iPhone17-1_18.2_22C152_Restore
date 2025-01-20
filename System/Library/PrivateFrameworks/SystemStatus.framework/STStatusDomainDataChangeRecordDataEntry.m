@interface STStatusDomainDataChangeRecordDataEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (STStatusDomainData)data;
- (STStatusDomainDataChangeRecordDataEntry)initWithCoder:(id)a3;
- (STStatusDomainDataChangeRecordDataEntry)initWithData:(id)a3 clientKey:(id)a4;
- (STStatusDomainDataDiff)diff;
- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:;
- (id)clientKey;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)entryType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusDomainDataChangeRecordDataEntry

- (unint64_t)entryType
{
  return 0;
}

- (STStatusDomainDataChangeRecordDataEntry)initWithData:(id)a3 clientKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STStatusDomainDataChangeRecordDataEntry;
  v8 = [(STStatusDomainDataChangeRecordDataEntry *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copyWithZone:0];
    data = v8->_data;
    v8->_data = (STStatusDomainData *)v9;

    objc_storeStrong(&v8->_clientKey, a4);
  }

  return v8;
}

- (STStatusDomainData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientKey, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (STStatusDomainDataDiff)diff
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = [(STStatusDomainDataChangeRecordDataEntry *)self data];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__STStatusDomainDataChangeRecordDataEntry_isEqual___block_invoke;
  v18[3] = &unk_1E6B646F8;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:v6 counterpart:v18];

  uint64_t v9 = [(STStatusDomainDataChangeRecordDataEntry *)self clientKey];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __51__STStatusDomainDataChangeRecordDataEntry_isEqual___block_invoke_2;
  v16 = &unk_1E6B63430;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendObject:v9 counterpart:&v13];

  LOBYTE(v9) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);
  return (char)v9;
}

uint64_t __51__STStatusDomainDataChangeRecordDataEntry_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) data];
}

uint64_t __51__STStatusDomainDataChangeRecordDataEntry_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientKey];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STStatusDomainDataChangeRecordDataEntry *)self data];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = [(STStatusDomainDataChangeRecordDataEntry *)self clientKey];
  id v7 = (id)[v3 appendObject:v6];

  unint64_t v8 = [v3 hash];
  return v8;
}

- (NSString)description
{
  return (NSString *)[(STStatusDomainDataChangeRecordDataEntry *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STStatusDomainDataChangeRecordDataEntry *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STStatusDomainDataChangeRecordDataEntry *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = -[STStatusDomainDataChangeRecordDataEntry _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  id v4 = [v3 build];

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    id v6 = [v3 succinctDescriptionBuilder];
    [v6 setUseDebugDescription:a3];
    [v6 setActiveMultilinePrefix:v5];

    id v7 = [v6 activeMultilinePrefix];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __91__STStatusDomainDataChangeRecordDataEntry__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v10[3] = &unk_1E6B63080;
    id v8 = v6;
    id v11 = v8;
    id v12 = v3;
    [v8 appendBodySectionWithName:0 multilinePrefix:v7 block:v10];

    id v3 = v8;
  }

  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusDomainDataChangeRecordDataEntry _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __91__STStatusDomainDataChangeRecordDataEntry__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"clientKey"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"data"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STStatusDomainDataChangeRecordDataEntry *)self data];
  [v4 encodeObject:v5 forKey:@"data"];

  id v6 = [(STStatusDomainDataChangeRecordDataEntry *)self clientKey];
  [v4 encodeObject:v6 forKey:@"clientKey"];
}

- (STStatusDomainDataChangeRecordDataEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = STValidStatusDomainDataTypes();
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"data"];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientKey"];

  id v8 = 0;
  if (v6 && v7)
  {
    self = [(STStatusDomainDataChangeRecordDataEntry *)self initWithData:v6 clientKey:v7];
    id v8 = self;
  }

  return v8;
}

- (id)clientKey
{
  return self->_clientKey;
}

@end