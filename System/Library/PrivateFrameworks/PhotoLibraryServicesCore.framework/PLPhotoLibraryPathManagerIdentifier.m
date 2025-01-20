@interface PLPhotoLibraryPathManagerIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPathManagerIdentifier:(id)a3;
- (NSString)identifier;
- (PLPhotoLibraryPathManagerIdentifier)initWithLibraryID:(id)a3 libraryFormat:(unsigned __int8)a4;
- (PLPhotoLibraryPathManagerIdentifier)initWithPathManager:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)bundleFormat;
- (void)setBundleFormat:(unsigned __int8)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation PLPhotoLibraryPathManagerIdentifier

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PLPhotoLibraryPathManagerIdentifier *)self isEqualToPathManagerIdentifier:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(PLPhotoLibraryPathManagerIdentifier *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToPathManagerIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PLPhotoLibraryPathManagerIdentifier *)self identifier];
  v6 = [v4 identifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    [(PLPhotoLibraryPathManagerIdentifier *)self bundleFormat];
    [v4 bundleFormat];
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)bundleFormat
{
  return self->_bundleFormat;
}

- (PLPhotoLibraryPathManagerIdentifier)initWithPathManager:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLPhotoLibraryPathManagerIdentifier.m", 34, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  if ([v5 bundleScope])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLPhotoLibraryPathManagerIdentifier.m", 35, @"Invalid parameter not satisfying: %@", @"pathManager.bundleScope == PLBundleScopeMain" object file lineNumber description];
  }
  v6 = [v5 photoDirectoryWithType:1];
  if ([v5 isUBF]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  v8 = [(PLPhotoLibraryPathManagerIdentifier *)self initWithLibraryID:v6 libraryFormat:v7];

  return v8;
}

- (PLPhotoLibraryPathManagerIdentifier)initWithLibraryID:(id)a3 libraryFormat:(unsigned __int8)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLPhotoLibraryPathManagerIdentifier.m", 40, @"Invalid parameter not satisfying: %@", @"libraryID" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PLPhotoLibraryPathManagerIdentifier;
  v9 = [(PLPhotoLibraryPathManagerIdentifier *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_bundleFormat = a4;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(PLPhotoLibraryPathManagerIdentifier *)self identifier];
  v6 = objc_msgSend(v4, "initWithLibraryID:libraryFormat:", v5, -[PLPhotoLibraryPathManagerIdentifier bundleFormat](self, "bundleFormat"));

  return v6;
}

- (void)setBundleFormat:(unsigned __int8)a3
{
  self->_bundleFormat = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (id)description
{
  unint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoLibraryPathManagerIdentifier;
  id v4 = [(PLPhotoLibraryPathManagerIdentifier *)&v9 description];
  id v5 = PLStringFromPLPhotoLibraryPathManagerLibraryFormatShort([(PLPhotoLibraryPathManagerIdentifier *)self bundleFormat]);
  v6 = [(PLPhotoLibraryPathManagerIdentifier *)self identifier];
  uint64_t v7 = [v3 stringWithFormat:@"%@ [%@] [%@]", v4, v5, v6];

  return v7;
}

@end