@interface FCShortcutCategory
- (CKRecord)asCKRecord;
- (FCShortcutCategory)initWithType:(unint64_t)a3 identifier:(id)a4 dateAdded:(id)a5 status:(unint64_t)a6;
- (NSDate)dateAdded;
- (NSString)identifier;
- (id)initWithIdentifier:(void *)a3 dictionaryRepresentation:;
- (unint64_t)status;
- (unint64_t)type;
@end

@implementation FCShortcutCategory

- (FCShortcutCategory)initWithType:(unint64_t)a3 identifier:(id)a4 dateAdded:(id)a5 status:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)FCShortcutCategory;
  v12 = [(FCShortcutCategory *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    v12->_type = a3;
    objc_storeStrong((id *)&v12->_dateAdded, a5);
    v12->_status = a6;
  }

  return v12;
}

- (CKRecord)asCKRecord
{
  if (qword_1EB5D1068 != -1) {
    dispatch_once(&qword_1EB5D1068, &__block_literal_global_10);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v4 = [(FCShortcutCategory *)self identifier];
  v5 = (void *)[v3 initWithRecordName:v4 zoneID:_MergedGlobals_144];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"ShortcutCategory" recordID:v5];
  v7 = NSStringFromShortcutCategoryType((__CFString *)[(FCShortcutCategory *)self type]);
  [v6 setObject:v7 forKeyedSubscript:@"type"];

  v8 = [(FCShortcutCategory *)self identifier];
  [v6 setObject:v8 forKeyedSubscript:@"categoryID"];

  v9 = [(FCShortcutCategory *)self dateAdded];
  [v6 setObject:v9 forKeyedSubscript:@"dateAdded"];

  id v10 = NSStringFromShortcutCategoryStatus((__CFString *)[(FCShortcutCategory *)self status]);
  [v6 setObject:v10 forKeyedSubscript:@"status"];

  return (CKRecord *)v6;
}

uint64_t __32__FCShortcutCategory_asCKRecord__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v1 = [v0 initWithZoneName:@"ShortcutCategories" ownerName:*MEMORY[0x1E4F19C08]];
  uint64_t v2 = _MergedGlobals_144;
  _MergedGlobals_144 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (unint64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)initWithIdentifier:(void *)a3 dictionaryRepresentation:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    v7 = [v5 objectForKeyedSubscript:@"type"];
    uint64_t v8 = FCShortcutCategoryTypeFromString(v7);

    v9 = [v5 objectForKeyedSubscript:@"dateAdded"];
    id v10 = [v5 objectForKeyedSubscript:@"status"];

    uint64_t v11 = FCShortcutCategoryStatusFromString(v10);
    v12 = (void *)[v3 initWithType:v8 identifier:v6 dateAdded:v9 status:v11];

    id v3 = v12;
  }
  return v3;
}

@end