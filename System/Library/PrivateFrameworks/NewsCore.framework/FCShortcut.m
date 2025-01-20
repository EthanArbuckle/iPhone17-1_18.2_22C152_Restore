@interface FCShortcut
- (BOOL)isDeprecated;
- (CKRecord)asCKRecord;
- (FCShortcut)initWithIdentifier:(id)a3 dateAdded:(id)a4 order:(id)a5 shortcutType:(unint64_t)a6;
- (NSDate)dateAdded;
- (NSNumber)order;
- (NSString)identifier;
- (id)initWithIdentifier:(void *)a3 dictionaryRepresentation:;
- (unint64_t)shortcutType;
@end

@implementation FCShortcut

- (id)initWithIdentifier:(void *)a3 dictionaryRepresentation:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    v7 = [v5 objectForKeyedSubscript:@"dateAdded"];
    v8 = [v5 objectForKeyedSubscript:@"order"];
    v9 = [v5 objectForKeyedSubscript:@"type"];

    uint64_t v10 = FCShortcutTypeFromString(v9);
    v11 = (void *)[v3 initWithIdentifier:v6 dateAdded:v7 order:v8 shortcutType:v10];

    id v3 = v11;
  }
  return v3;
}

- (FCShortcut)initWithIdentifier:(id)a3 dateAdded:(id)a4 order:(id)a5 shortcutType:(unint64_t)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)[[NSString alloc] initWithFormat:@"shortcut list entry must have an item identifier"];
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCShortcut initWithIdentifier:dateAdded:order:shortcutType:]";
    __int16 v24 = 2080;
    v25 = "FCShortcut.m";
    __int16 v26 = 1024;
    int v27 = 20;
    __int16 v28 = 2114;
    v29 = v20;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v21.receiver = self;
  v21.super_class = (Class)FCShortcut;
  v13 = [(FCShortcut *)&v21 init];
  v14 = v13;
  if (v13)
  {
    if (v10)
    {
      uint64_t v15 = [v10 copy];
      identifier = v14->_identifier;
      v14->_identifier = (NSString *)v15;

      objc_storeStrong((id *)&v14->_dateAdded, a4);
      uint64_t v17 = [v12 copy];
      order = v14->_order;
      v14->_order = (NSNumber *)v17;

      v14->_shortcutType = a6;
      v14->_deprecated = a6 != 0;
    }
    else
    {

      v14 = 0;
    }
  }

  return v14;
}

- (CKRecord)asCKRecord
{
  if (qword_1EB5D1580 != -1) {
    dispatch_once(&qword_1EB5D1580, &__block_literal_global_73);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v4 = [(FCShortcut *)self identifier];
  id v5 = (void *)[v3 initWithRecordName:v4 zoneID:_MergedGlobals_171];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"Shortcut" recordID:v5];
  v7 = [(FCShortcut *)self dateAdded];
  [v6 setObject:v7 forKeyedSubscript:@"dateAdded"];

  v8 = [(FCShortcut *)self order];
  [v6 setObject:v8 forKeyedSubscript:@"order"];

  v9 = NSStringFromShortcutType((__CFString *)[(FCShortcut *)self shortcutType]);
  [v6 setObject:v9 forKeyedSubscript:@"type"];

  return (CKRecord *)v6;
}

uint64_t __24__FCShortcut_asCKRecord__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v1 = [v0 initWithZoneName:@"Shortcuts" ownerName:*MEMORY[0x1E4F19C08]];
  uint64_t v2 = _MergedGlobals_171;
  _MergedGlobals_171 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (NSNumber)order
{
  return self->_order;
}

- (unint64_t)shortcutType
{
  return self->_shortcutType;
}

- (BOOL)isDeprecated
{
  return self->_deprecated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end