@interface RCMigration
+ (id)createEncryptedFieldsMigration:(int)a3 context:(id)a4;
- (BOOL)hasEncryptedFields;
- (NSString)jsonDescription;
- (id)_descriptionDictionary;
- (id)_initWithFlags:(unint64_t)a3 context:(id)a4;
- (id)description;
- (int)migrationReason;
- (unint64_t)migrationFlags;
- (void)jsonDescription;
- (void)setHasEncryptedFields:(BOOL)a3;
- (void)setMigrationFlags:(unint64_t)a3;
@end

@implementation RCMigration

- (unint64_t)migrationFlags
{
  v2 = [(RCMigration *)self flags];
  unint64_t v3 = [v2 longLongValue];

  return v3;
}

- (void)setMigrationFlags:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a3];
  [(RCMigration *)self setFlags:v4];
}

+ (id)createEncryptedFieldsMigration:(int)a3 context:(id)a4
{
  if ((a3 - 1) > 2) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = qword_1C39B18C8[a3 - 1];
  }
  id v5 = a4;
  id v6 = [[RCMigration alloc] _initWithFlags:v4 context:v5];

  return v6;
}

- (id)_initWithFlags:(unint64_t)a3 context:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RCMigration;
  id v5 = [(RCMigration *)&v8 initWithContext:a4];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [(RCMigration *)v5 setDate:v6];

    [(RCMigration *)v5 setMigrationFlags:a3];
  }
  return v5;
}

- (BOOL)hasEncryptedFields
{
  return [(RCMigration *)self migrationFlags] & 1;
}

- (void)setHasEncryptedFields:(BOOL)a3
{
  unint64_t v4 = [(RCMigration *)self migrationFlags] & 0xFFFFFFFFFFFFFFFELL | a3;
  [(RCMigration *)self setMigrationFlags:v4];
}

- (int)migrationReason
{
  char v2 = [(RCMigration *)self migrationFlags];
  if ((v2 & 8) != 0) {
    int v3 = 3;
  }
  else {
    int v3 = 0;
  }
  if ((v2 & 4) != 0) {
    int v4 = 2;
  }
  else {
    int v4 = v3;
  }
  if ((v2 & 2) != 0) {
    return 1;
  }
  else {
    return v4;
  }
}

- (id)_descriptionDictionary
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v17[0] = @"objectID";
  v16 = [(RCMigration *)self objectID];
  int v3 = [v16 URIRepresentation];
  int v4 = [v3 path];
  id v5 = v4;
  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v5;
  v17[1] = @"date";
  id v6 = [(RCMigration *)self date];
  v7 = [v6 description];
  objc_super v8 = v7;
  if (!v7)
  {
    objc_super v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v8;
  v17[2] = @"hasEncryptedFields";
  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[RCMigration hasEncryptedFields](self, "hasEncryptedFields"));
  v18[2] = v9;
  v17[3] = @"reason";
  unsigned int v10 = [(RCMigration *)self migrationReason] - 1;
  if (v10 > 2) {
    v11 = @"Unknown";
  }
  else {
    v11 = off_1E6497178[v10];
  }
  v18[3] = v11;
  v17[4] = @"flags";
  v12 = [(RCMigration *)self flags];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[4] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  if (!v12) {

  }
  if (!v7) {
  if (!v4)
  }

  return v14;
}

- (id)description
{
  char v2 = [(RCMigration *)self _descriptionDictionary];
  int v3 = [v2 description];

  return v3;
}

- (NSString)jsonDescription
{
  char v2 = (void *)MEMORY[0x1E4F28D90];
  int v3 = [(RCMigration *)self _descriptionDictionary];
  id v9 = 0;
  int v4 = [v2 dataWithJSONObject:v3 options:1 error:&v9];
  id v5 = v9;

  if (v4)
  {
    id v6 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  }
  else
  {
    v7 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(RCMigration *)(uint64_t)v5 jsonDescription];
    }

    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void)jsonDescription
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "-[RCMigration jsonDescription]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- dataWithJSONObject failed with %@", (uint8_t *)&v2, 0x16u);
}

@end