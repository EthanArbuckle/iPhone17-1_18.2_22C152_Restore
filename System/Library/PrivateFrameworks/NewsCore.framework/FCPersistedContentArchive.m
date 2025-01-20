@interface FCPersistedContentArchive
+ (BOOL)supportsSecureCoding;
- (FCPersistedContentArchive)initWithCoder:(id)a3;
- (id)description;
- (id)manifest;
- (id)unarchiveIntoContentContext:(id)a3;
- (int64_t)storageSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCPersistedContentArchive

- (id)description
{
  v3 = [[FCDescription alloc] initWithObject:self];
  [(FCDescription *)v3 addField:@"archivePath" value:self->_archivePath];
  v4 = [(FCDescription *)v3 descriptionString];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCPersistedContentArchive)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPersistedContentArchive;
  v5 = [(FCPersistedContentArchive *)&v9 init];
  if (v5)
  {
    if (qword_1EB5D0FC0 != -1) {
      dispatch_once(&qword_1EB5D0FC0, &__block_literal_global_254);
    }
    uint64_t v6 = [v4 decodeObjectOfClasses:qword_1EB5D0FB8 forKey:@"archivePath"];
    archivePath = v5->_archivePath;
    v5->_archivePath = (NSString *)v6;
  }
  return v5;
}

uint64_t __43__FCPersistedContentArchive_initWithCoder___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v1 = qword_1EB5D0FB8;
  qword_1EB5D0FB8 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)unarchiveIntoContentContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1A6260FD0]();
  uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:self->_archivePath];
  uint64_t v13 = 0;
  v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v13];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 unarchiveIntoContentContext:v4];
  }
  else
  {
    v10 = [FCContentUnarchiveResult alloc];
    uint64_t v9 = [(FCContentUnarchiveResult *)v10 initWithInterestToken:MEMORY[0x1E4F1CBF0] storageSize:0];
  }
  v11 = (void *)v9;

  return v11;
}

- (id)manifest
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v3 = (void *)[[NSString alloc] initWithFormat:@"persisted content archive doesn't currently support providing its manifest"];
    int v4 = 136315906;
    v5 = "-[FCPersistedContentArchive manifest]";
    __int16 v6 = 2080;
    v7 = "FCContentArchive.m";
    __int16 v8 = 1024;
    int v9 = 875;
    __int16 v10 = 2114;
    v11 = v3;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);
  }
  return 0;
}

- (int64_t)storageSize
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int64_t v4 = objc_msgSend(v3, "fc_sizeOfItemAtPath:error:", self->_archivePath, 0);

  return v4;
}

- (void).cxx_destruct
{
}

@end