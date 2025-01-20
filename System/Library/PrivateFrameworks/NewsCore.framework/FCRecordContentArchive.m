@interface FCRecordContentArchive
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FCRecordContentArchive)initWithCoder:(id)a3;
- (id)description;
- (id)manifest;
- (id)recordBase;
- (id)unarchiveIntoContentContext:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCRecordContentArchive

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    v7 = -[FCRecordContentArchive recordBase]((id *)&self->super.super.isa);
    v8 = [v6[1] base];
    v9 = [v7 identifier];
    v10 = [v8 identifier];
    char v11 = [v9 isEqualToString:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)recordBase
{
  if (a1)
  {
    a1 = [a1[1] base];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (unint64_t)hash
{
  v2 = -[FCRecordContentArchive recordBase]((id *)&self->super.super.isa);
  v3 = [v2 identifier];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (id)description
{
  v3 = [[FCDescription alloc] initWithObject:self];
  unint64_t v4 = -[FCRecordContentArchive recordBase]((id *)&self->super.super.isa);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__FCRecordContentArchive_description__block_invoke;
  v16[3] = &unk_1E5B4C2A0;
  id v17 = v4;
  id v5 = v4;
  v6 = __37__FCRecordContentArchive_description__block_invoke((uint64_t)v16);
  [(FCDescription *)v3 addField:@"type" object:v6];

  v7 = [v5 identifier];
  [(FCDescription *)v3 addField:@"identifier" value:v7];

  v8 = (void *)MEMORY[0x1E4F1C9C8];
  v9 = [v5 fetchDate];
  v10 = [v8 dateWithPBDate:v9];
  [(FCDescription *)v3 addField:@"fetchDate" object:v10];

  char v11 = (void *)MEMORY[0x1E4F1C9C8];
  v12 = [v5 modificationDate];
  v13 = [v11 dateWithPBDate:v12];
  [(FCDescription *)v3 addField:@"modificationDate" object:v13];

  v14 = [(FCDescription *)v3 descriptionString];

  return v14;
}

__CFString *__37__FCRecordContentArchive_description__block_invoke(uint64_t a1)
{
  unsigned int v1 = [*(id *)(a1 + 32) recordType] - 1;
  if (v1 > 0x11) {
    return @"Unknown";
  }
  else {
    return off_1E5B4C358[v1];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCRecordContentArchive)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCRecordContentArchive;
  id v5 = [(FCRecordContentArchive *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"record"];
    record = v5->_record;
    v5->_record = (PBCodable *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)unarchiveIntoContentContext:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = -[FCRecordContentArchive recordBase]((id *)&self->super.super.isa);
  uint64_t v6 = [v4 internalContentContext];

  v7 = [v6 recordSources];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__FCRecordContentArchive_unarchiveIntoContentContext___block_invoke;
  v14[3] = &unk_1E5B4C2C8;
  id v15 = v5;
  id v8 = v5;
  objc_super v9 = objc_msgSend(v7, "fc_firstObjectPassingTest:", v14);

  v16[0] = self->_record;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  char v11 = [v9 savePBRecords:v10];

  v12 = [[FCContentUnarchiveResult alloc] initWithInterestToken:v11 storageSize:[(FCContentArchive *)self storageSize]];
  return v12;
}

BOOL __54__FCRecordContentArchive_unarchiveIntoContentContext___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 pbRecordType];
  return v3 == [*(id *)(a1 + 32) recordType];
}

- (id)manifest
{
  v9[1] = *MEMORY[0x1E4F143B8];
  int v3 = [FCContentManifest alloc];
  id v4 = -[FCRecordContentArchive recordBase]((id *)&self->super.super.isa);
  id v5 = [v4 identifier];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7 = [(FCContentManifest *)v3 initWithRecordIDs:v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end