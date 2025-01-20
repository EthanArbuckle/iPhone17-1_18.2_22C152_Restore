@interface ICSQLiteConnectionOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isReadOnly;
- (ICSQLiteConnectionOptions)initWithCoder:(id)a3;
- (ICSQLiteConnectionOptions)initWithDatabasePath:(id)a3;
- (NSString)databasePath;
- (id)copyWithZone:(_NSZone *)a3;
- (int)applyToDatabase:(sqlite3 *)a3;
- (int64_t)cacheSize;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheSize:(int64_t)a3;
- (void)setCacheSizeWithNumberOfKilobytes:(int64_t)a3;
- (void)setDatabasePath:(id)a3;
- (void)setReadOnly:(BOOL)a3;
@end

@implementation ICSQLiteConnectionOptions

- (void).cxx_destruct
{
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)isReadOnly
{
  return self->_readOnly;
}

- (void)setCacheSize:(int64_t)a3
{
  self->_cacheSize = a3;
}

- (int64_t)cacheSize
{
  return self->_cacheSize;
}

- (void)setDatabasePath:(id)a3
{
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t cacheSize = self->_cacheSize;
  id v5 = a3;
  [v5 encodeInteger:cacheSize forKey:@"c"];
  [v5 encodeObject:self->_databasePath forKey:@"p"];
  [v5 encodeBool:self->_readOnly forKey:@"ro"];
}

- (ICSQLiteConnectionOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSQLiteConnectionOptions;
  id v5 = [(ICSQLiteConnectionOptions *)&v9 init];
  if (v5)
  {
    v5->_int64_t cacheSize = [v4 decodeIntegerForKey:@"c"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v6;

    v5->_readOnly = [v4 decodeBoolForKey:@"ro"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    *(void *)(v5 + 24) = self->_cacheSize;
    uint64_t v7 = [(NSString *)self->_databasePath copyWithZone:a3];
    v8 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v7;

    *(unsigned char *)(v6 + 8) = self->_readOnly;
  }
  return (id)v6;
}

- (int)applyToDatabase:(sqlite3 *)a3
{
  sqlite3_extended_result_codes(a3, 1);
  int v8 = 1;
  int v5 = sqlite3_file_control(a3, 0, 10, &v8);
  if (!v5)
  {
    int v5 = sqlite3_exec(a3, "PRAGMA journal_mode=WAL", 0, 0, 0);
    if (!v5)
    {
      id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"PRAGMA cache_size=%ld", -[ICSQLiteConnectionOptions cacheSize](self, "cacheSize"));
      int v5 = sqlite3_exec(a3, (const char *)[v6 UTF8String], 0, 0, 0);
    }
  }
  return v5;
}

- (void)setCacheSizeWithNumberOfKilobytes:(int64_t)a3
{
}

- (ICSQLiteConnectionOptions)initWithDatabasePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSQLiteConnectionOptions;
  int v5 = [(ICSQLiteConnectionOptions *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v6;

    [(ICSQLiteConnectionOptions *)v5 setCacheSizeWithNumberOfKilobytes:128];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end