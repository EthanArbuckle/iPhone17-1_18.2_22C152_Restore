@interface ICUserSpecificRecordIDParser
+ (BOOL)isUserSpecificRecordID:(id)a3;
+ (BOOL)isUserSpecificRecordType:(id)a3;
+ (id)sharedRecordTypeForUserSpecificRecordType:(id)a3;
+ (id)userSpecificRecordTypeForSharedRecordType:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)validate;
- (CKRecordID)recordID;
- (CKRecordID)sharedRecordID;
- (ICUserSpecificRecordIDParser)initWithRecordName:(id)a3;
- (ICUserSpecificRecordIDParser)initWithSharedRecordType:(id)a3 sharedRecordID:(id)a4 userRecordName:(id)a5 ownerName:(id)a6;
- (NSString)recordType;
- (NSString)sharedRecordType;
- (id)description;
- (unint64_t)hash;
- (void)validate;
@end

@implementation ICUserSpecificRecordIDParser

- (ICUserSpecificRecordIDParser)initWithSharedRecordType:(id)a3 sharedRecordID:(id)a4 userRecordName:(id)a5 ownerName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void *)MEMORY[0x1E4F1CA48];
  id v13 = a6;
  id v14 = a5;
  v15 = [v12 arrayWithCapacity:2];
  v38 = v10;
  v16 = [(id)objc_opt_class() userSpecificRecordTypeForSharedRecordType:v10];
  [v15 setObject:v16 atIndexedSubscript:0];

  [v15 setObject:v14 atIndexedSubscript:1];
  v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  v18 = [v11 zoneID];
  [v18 databaseScope];
  v19 = CKDatabaseScopeString();
  [v17 setObject:v19 atIndexedSubscript:0];

  v20 = [v11 zoneID];
  v21 = [v20 zoneName];
  [v17 setObject:v21 atIndexedSubscript:1];

  [v17 setObject:v13 atIndexedSubscript:2];
  v22 = [v11 recordName];
  [v17 setObject:v22 atIndexedSubscript:3];

  v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v24 = [v15 componentsJoinedByString:@"::"];
  [v23 setObject:v24 atIndexedSubscript:0];

  v25 = [v17 componentsJoinedByString:@"::"];
  [v23 setObject:v25 atIndexedSubscript:1];

  v26 = [v23 componentsJoinedByString:@"/"];
  if ((unint64_t)[v26 length] < 0x100)
  {
    id v36 = a4;
    id v29 = objc_alloc(MEMORY[0x1E4F1A320]);
    v30 = [v11 zoneID];
    v31 = [v30 zoneName];
    v27 = [v29 initWithZoneName:v31 ownerName:*MEMORY[0x1E4F19C08]];

    v32 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v26 zoneID:v27];
    v39.receiver = self;
    v39.super_class = (Class)ICUserSpecificRecordIDParser;
    self = [(ICUserSpecificRecordIDParser *)&v39 init];
    if (!self) {
      goto LABEL_7;
    }
    v33 = [v15 objectAtIndexedSubscript:0];
    recordType = self->_recordType;
    self->_recordType = v33;

    objc_storeStrong((id *)&self->_recordID, v32);
    objc_storeStrong((id *)&self->_sharedRecordType, a3);
    objc_storeStrong((id *)&self->_sharedRecordID, v36);
    v28 = 0;
    if ([(ICUserSpecificRecordIDParser *)self validate]) {
LABEL_7:
    }
      v28 = self;
  }
  else
  {
    v27 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[ICUserSpecificRecordIDParser initWithSharedRecordType:sharedRecordID:userRecordName:ownerName:]();
    }
    v28 = 0;
  }

  return v28;
}

- (ICUserSpecificRecordIDParser)initWithRecordName:(id)a3
{
  id v4 = a3;
  v5 = [v4 componentsSeparatedByString:@"/"];
  if ([v5 count] == 2)
  {
    v6 = [v5 objectAtIndexedSubscript:0];
    v7 = [v6 componentsSeparatedByString:@"::"];
    if ([v7 count] == 2)
    {
      v58 = [v5 objectAtIndexedSubscript:1];
      v8 = [v58 componentsSeparatedByString:@"::"];
      if ([v8 count] == 4)
      {
        v9 = [v7 objectAtIndexedSubscript:0];
        uint64_t v10 = objc_msgSend(v9, "ic_nilWhenEmpty");
        id v11 = (void *)v10;
        if (v10) {
          v12 = (__CFString *)v10;
        }
        else {
          v12 = @"(null)";
        }
        obj = v12;
        id v13 = v12;

        v49 = v7;
        id v14 = [v7 objectAtIndexedSubscript:1];
        uint64_t v15 = objc_msgSend(v14, "ic_nilWhenEmpty");
        v16 = (void *)v15;
        if (v15) {
          v17 = (__CFString *)v15;
        }
        else {
          v17 = @"(null)";
        }
        v57 = v17;

        v18 = [v8 objectAtIndexedSubscript:1];
        uint64_t v19 = objc_msgSend(v18, "ic_nilWhenEmpty");
        v20 = (void *)v19;
        if (v19) {
          v21 = (__CFString *)v19;
        }
        else {
          v21 = @"(null)";
        }
        v56 = v21;

        v54 = v13;
        v22 = [(id)objc_opt_class() sharedRecordTypeForUserSpecificRecordType:v13];
        uint64_t v23 = objc_msgSend(v22, "ic_nilWhenEmpty");
        v24 = (void *)v23;
        if (v23) {
          v25 = (__CFString *)v23;
        }
        else {
          v25 = @"(null)";
        }
        v47 = v25;
        v53 = v25;

        v26 = [v8 objectAtIndexedSubscript:2];
        uint64_t v27 = objc_msgSend(v26, "ic_nilWhenEmpty");
        v28 = (void *)v27;
        if (v27) {
          id v29 = (__CFString *)v27;
        }
        else {
          id v29 = @"(null)";
        }
        v55 = v29;

        v50 = v8;
        v30 = [v8 objectAtIndexedSubscript:3];
        uint64_t v31 = objc_msgSend(v30, "ic_nilWhenEmpty");
        v32 = (void *)v31;
        if (v31) {
          v33 = (__CFString *)v31;
        }
        else {
          v33 = @"(null)";
        }
        v34 = v33;

        uint64_t v35 = [objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:v56 ownerName:v57];
        id v36 = objc_alloc(MEMORY[0x1E4F1A2F8]);
        v52 = (void *)v35;
        uint64_t v37 = v35;
        v38 = v34;
        objc_super v39 = (void *)[v36 initWithRecordName:v4 zoneID:v37];
        uint64_t v40 = [objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:v56 ownerName:v55];
        v41 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v38 zoneID:v40];
        v59.receiver = self;
        v59.super_class = (Class)ICUserSpecificRecordIDParser;
        v42 = [(ICUserSpecificRecordIDParser *)&v59 init];
        self = v42;
        v51 = v38;
        if (v42
          && (objc_storeStrong((id *)&v42->_recordType, obj),
              objc_storeStrong((id *)&self->_recordID, v39),
              objc_storeStrong((id *)&self->_sharedRecordType, v47),
              objc_storeStrong((id *)&self->_sharedRecordID, v41),
              ![(ICUserSpecificRecordIDParser *)self validate]))
        {
          v43 = (void *)v40;
          v44 = 0;
        }
        else
        {
          v43 = (void *)v40;
          v44 = self;
        }
        v7 = v49;
        v8 = v50;

        v45 = v54;
      }
      else
      {
        v45 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          -[ICUserSpecificRecordIDParser initWithRecordName:]();
        }
        v44 = 0;
      }
    }
    else
    {
      v58 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
        -[ICUserSpecificRecordIDParser initWithRecordName:]();
      }
      v44 = 0;
    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ICUserSpecificRecordIDParser initWithRecordName:]();
    }
    v44 = 0;
  }

  return v44;
}

- (BOOL)validate
{
  v3 = [(ICUserSpecificRecordIDParser *)self recordType];
  if (![v3 length])
  {

LABEL_15:
    os_log_t v33 = os_log_create("com.apple.notes", "Cloud");
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
LABEL_17:

      return 0;
    }
LABEL_16:
    -[ICUserSpecificRecordIDParser validate]();
    goto LABEL_17;
  }
  id v4 = [(ICUserSpecificRecordIDParser *)self recordType];
  int v5 = [v4 isEqual:@"(null)"];

  if (v5) {
    goto LABEL_15;
  }
  v6 = [(ICUserSpecificRecordIDParser *)self recordType];
  char v7 = [v6 hasSuffix:@"_UserSpecific"];

  if ((v7 & 1) == 0)
  {
    os_log_t v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[ICUserSpecificRecordIDParser validate]2();
    }
    goto LABEL_17;
  }
  v8 = [(ICUserSpecificRecordIDParser *)self recordID];
  v9 = [v8 zoneID];
  uint64_t v10 = [v9 databaseScope];

  if (!v10)
  {
    os_log_t v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[ICUserSpecificRecordIDParser validate]();
    }
    goto LABEL_17;
  }
  id v11 = [(ICUserSpecificRecordIDParser *)self recordID];
  v12 = [v11 zoneID];
  id v13 = [v12 zoneName];
  if (![v13 length])
  {

LABEL_23:
    os_log_t v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[ICUserSpecificRecordIDParser validate]();
    }
    goto LABEL_17;
  }
  id v14 = [(ICUserSpecificRecordIDParser *)self recordID];
  uint64_t v15 = [v14 zoneID];
  v16 = [v15 zoneName];
  int v17 = [v16 isEqual:@"(null)"];

  if (v17) {
    goto LABEL_23;
  }
  v18 = [(ICUserSpecificRecordIDParser *)self recordID];
  uint64_t v19 = [v18 zoneID];
  v20 = [v19 ownerName];
  if (![v20 length])
  {

LABEL_26:
    os_log_t v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[ICUserSpecificRecordIDParser validate].cold.4();
    }
    goto LABEL_17;
  }
  v21 = [(ICUserSpecificRecordIDParser *)self recordID];
  v22 = [v21 zoneID];
  uint64_t v23 = [v22 ownerName];
  int v24 = [v23 isEqual:@"(null)"];

  if (v24) {
    goto LABEL_26;
  }
  v25 = [(ICUserSpecificRecordIDParser *)self recordID];
  v26 = [v25 recordName];
  if (![v26 length])
  {

LABEL_29:
    os_log_t v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[ICUserSpecificRecordIDParser validate].cold.5();
    }
    goto LABEL_17;
  }
  uint64_t v27 = [(ICUserSpecificRecordIDParser *)self recordID];
  v28 = [v27 recordName];
  int v29 = [v28 isEqual:@"(null)"];

  if (v29) {
    goto LABEL_29;
  }
  v30 = [(ICUserSpecificRecordIDParser *)self recordID];
  uint64_t v31 = [v30 recordName];
  int v32 = [v31 containsString:*MEMORY[0x1E4F19C08]];

  if (v32)
  {
    os_log_t v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[ICUserSpecificRecordIDParser validate].cold.6();
    }
    goto LABEL_17;
  }
  uint64_t v35 = [(ICUserSpecificRecordIDParser *)self sharedRecordType];
  if (![v35 length])
  {

LABEL_42:
    os_log_t v33 = os_log_create("com.apple.notes", "Cloud");
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  id v36 = [(ICUserSpecificRecordIDParser *)self sharedRecordType];
  int v37 = [v36 isEqual:@"(null)"];

  if (v37) {
    goto LABEL_42;
  }
  v38 = [(ICUserSpecificRecordIDParser *)self sharedRecordID];
  objc_super v39 = [v38 zoneID];
  uint64_t v40 = [v39 databaseScope];

  if (!v40)
  {
    os_log_t v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[ICUserSpecificRecordIDParser validate].cold.8();
    }
    goto LABEL_17;
  }
  v41 = [(ICUserSpecificRecordIDParser *)self sharedRecordID];
  v42 = [v41 zoneID];
  v43 = [v42 zoneName];
  if (![v43 length])
  {

LABEL_47:
    os_log_t v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[ICUserSpecificRecordIDParser validate].cold.9();
    }
    goto LABEL_17;
  }
  v44 = [(ICUserSpecificRecordIDParser *)self sharedRecordID];
  v45 = [v44 zoneID];
  v46 = [v45 zoneName];
  int v47 = [v46 isEqual:@"(null)"];

  if (v47) {
    goto LABEL_47;
  }
  v48 = [(ICUserSpecificRecordIDParser *)self sharedRecordID];
  v49 = [v48 zoneID];
  v50 = [v49 ownerName];
  if (![v50 length])
  {

LABEL_50:
    os_log_t v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[ICUserSpecificRecordIDParser validate]0();
    }
    goto LABEL_17;
  }
  v51 = [(ICUserSpecificRecordIDParser *)self sharedRecordID];
  v52 = [v51 zoneID];
  v53 = [v52 ownerName];
  int v54 = [v53 isEqual:@"(null)"];

  if (v54) {
    goto LABEL_50;
  }
  v55 = [(ICUserSpecificRecordIDParser *)self sharedRecordID];
  v56 = [v55 recordName];
  if (![v56 length])
  {

LABEL_53:
    os_log_t v33 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[ICUserSpecificRecordIDParser validate]1();
    }
    goto LABEL_17;
  }
  v57 = [(ICUserSpecificRecordIDParser *)self sharedRecordID];
  v58 = [v57 recordName];
  int v59 = [v58 isEqual:@"(null)"];

  if (v59) {
    goto LABEL_53;
  }
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  v6 = [(ICUserSpecificRecordIDParser *)self recordType];
  char v7 = [(ICUserSpecificRecordIDParser *)self recordID];
  v8 = [(ICUserSpecificRecordIDParser *)self sharedRecordType];
  v9 = [(ICUserSpecificRecordIDParser *)self sharedRecordID];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p, recordType: %@, recordID: %@, sharedRecordType: %@, sharedRecordID: %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    objc_opt_class();
    int v5 = ICDynamicCast();

    v6 = [(ICUserSpecificRecordIDParser *)self recordType];
    char v7 = [v5 recordType];
    v8 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v6) {
      v9 = 0;
    }
    else {
      v9 = v6;
    }
    uint64_t v10 = v9;
    if (v8 == v7) {
      id v11 = 0;
    }
    else {
      id v11 = v7;
    }
    unint64_t v12 = v11;
    if (v10 | v12)
    {
      id v13 = (void *)v12;
      if (v10) {
        BOOL v14 = v12 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
        char v15 = 0;
LABEL_58:

        goto LABEL_59;
      }
      int v16 = [(id)v10 isEqual:v12];

      if (!v16)
      {
        char v15 = 0;
LABEL_59:

        return v15;
      }
    }
    v38 = v7;
    uint64_t v10 = [(ICUserSpecificRecordIDParser *)self recordID];
    id v13 = [v5 recordID];
    if (v8 == (void *)v10) {
      int v17 = 0;
    }
    else {
      int v17 = (void *)v10;
    }
    uint64_t v18 = v17;
    if (v8 == v13) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = v13;
    }
    unint64_t v20 = v19;
    if (v18 | v20)
    {
      v21 = (void *)v20;
      if (v18) {
        BOOL v22 = v20 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (v22)
      {
        char v15 = 0;
LABEL_56:

LABEL_57:
        char v7 = v38;
        goto LABEL_58;
      }
      int v23 = [(id)v18 isEqual:v20];

      if (!v23)
      {
        char v15 = 0;
        goto LABEL_57;
      }
    }
    id v36 = v6;
    uint64_t v18 = [(ICUserSpecificRecordIDParser *)self sharedRecordType];
    int v37 = v5;
    v21 = [v5 sharedRecordType];
    if (v8 == (void *)v18) {
      int v24 = 0;
    }
    else {
      int v24 = (void *)v18;
    }
    uint64_t v25 = v24;
    if (v8 == v21) {
      v26 = 0;
    }
    else {
      v26 = v21;
    }
    unint64_t v27 = v26;
    if (v25 | v27)
    {
      v28 = (void *)v27;
      char v15 = 0;
      if (!v25 || !v27)
      {
LABEL_54:

LABEL_55:
        v6 = v36;
        int v5 = v37;
        goto LABEL_56;
      }
      int v29 = [(id)v25 isEqual:v27];

      if (!v29)
      {
        char v15 = 0;
        goto LABEL_55;
      }
    }
    uint64_t v25 = [(ICUserSpecificRecordIDParser *)self sharedRecordID];
    v28 = [v37 sharedRecordID];
    if (v8 == (void *)v25) {
      v30 = 0;
    }
    else {
      v30 = (void *)v25;
    }
    unint64_t v31 = v30;
    if (v8 == v28) {
      int v32 = 0;
    }
    else {
      int v32 = v28;
    }
    unint64_t v33 = v32;
    v34 = (void *)v33;
    if (v31 | v33)
    {
      char v15 = 0;
      if (v31 && v33) {
        char v15 = [(id)v31 isEqual:v33];
      }
    }
    else
    {
      char v15 = 1;
    }

    goto LABEL_54;
  }
  return 1;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    id v4 = [(ICUserSpecificRecordIDParser *)self recordType];
    uint64_t v5 = [v4 hash];
    v6 = [(ICUserSpecificRecordIDParser *)self recordID];
    char v7 = [v6 hash];
    v8 = [(ICUserSpecificRecordIDParser *)self sharedRecordType];
    [v8 hash];
    v9 = [(ICUserSpecificRecordIDParser *)self sharedRecordID];
    [v9 hash];
    self->_hash = ICHashWithHashKeys(v5, v10, v11, v12, v13, v14, v15, v16, v7);

    return self->_hash;
  }
  return result;
}

+ (BOOL)isUserSpecificRecordType:(id)a3
{
  return [a3 hasSuffix:@"_UserSpecific"];
}

+ (BOOL)isUserSpecificRecordID:(id)a3
{
  v3 = [a3 recordName];
  id v4 = [v3 componentsSeparatedByString:@"/"];

  if ([v4 count] == 2)
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
    v6 = [v5 componentsSeparatedByString:@"::"];
    if ([v6 count] == 2)
    {
      char v7 = [v4 objectAtIndexedSubscript:1];
      v8 = [v7 componentsSeparatedByString:@"::"];
      BOOL v9 = [v8 count] == 4;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)userSpecificRecordTypeForSharedRecordType:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", a3, @"_UserSpecific"];
}

+ (id)sharedRecordTypeForUserSpecificRecordType:(id)a3
{
  return (id)objc_msgSend(a3, "ic_stringWithoutSuffix:", @"_UserSpecific");
}

- (NSString)recordType
{
  return self->_recordType;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (NSString)sharedRecordType
{
  return self->_sharedRecordType;
}

- (CKRecordID)sharedRecordID
{
  return self->_sharedRecordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedRecordID, 0);
  objc_storeStrong((id *)&self->_sharedRecordType, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
}

- (void)initWithSharedRecordType:sharedRecordID:userRecordName:ownerName:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Cannot construct user-specific record ID because the user-specific record name is longer than allowed {recordName: %@}", v2, v3, v4, v5, v6);
}

- (void)initWithRecordName:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Cannot parse user-specific record ID because shared record component has incorrect component count {recordName: %@}", v2, v3, v4, v5, v6);
}

- (void)initWithRecordName:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Cannot parse user-specific record ID because user-specific record component has incorrect component count {recordName: %@}", v2, v3, v4, v5, v6);
}

- (void)initWithRecordName:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Cannot parse user-specific record ID because record name has incorrect component count {recordName: %@}", v2, v3, v4, v5, v6);
}

- (void)validate
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1C3A61000, v0, v1, "Cannot construct user-specific record ID because the user-specific record name doesn't have the user-specific record suffix {recordID: %@}", v2, v3, v4, v5, v6);
}

@end