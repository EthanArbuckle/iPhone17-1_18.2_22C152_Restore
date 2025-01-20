@interface MLDDatabaseFileDiagnostic
- (MLDDatabaseFileDiagnostic)initWithDatabasePath:(id)a3;
- (NSDictionary)fileAttributes;
- (NSString)databasePath;
- (id)description;
@end

@implementation MLDDatabaseFileDiagnostic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileAttributes, 0);

  objc_storeStrong((id *)&self->_databasePath, 0);
}

- (NSDictionary)fileAttributes
{
  return self->_fileAttributes;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p {\n  path: %@\n  file attributes: %@\n}", v4, self, self->_databasePath, self->_fileAttributes];

  return v5;
}

- (MLDDatabaseFileDiagnostic)initWithDatabasePath:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLDDatabaseFileDiagnostic;
  v5 = [(MLDDatabaseFileDiagnostic *)&v12 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    databasePath = v5->_databasePath;
    v5->_databasePath = v6;

    v8 = +[NSFileManager defaultManager];
    uint64_t v9 = [v8 attributesOfItemAtPath:v5->_databasePath error:0];
    fileAttributes = v5->_fileAttributes;
    v5->_fileAttributes = (NSDictionary *)v9;
  }
  return v5;
}

@end