@interface ML3ClientImportSessionConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowAccountMerging;
- (ML3ClientImportSessionConfiguration)init;
- (ML3ClientImportSessionConfiguration)initWithCoder:(id)a3;
- (ML3DatabasePrivacyContext)privacyContext;
- (NSString)libraryPath;
- (int)sourceType;
- (unint64_t)operationCount;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowAccountMerging:(BOOL)a3;
- (void)setLibraryPath:(id)a3;
- (void)setOperationCount:(unint64_t)a3;
- (void)setPrivacyContext:(id)a3;
- (void)setSourceType:(int)a3;
@end

@implementation ML3ClientImportSessionConfiguration

- (void).cxx_destruct
{
}

- (void)setPrivacyContext:(id)a3
{
  self->_privacyContext = (ML3DatabasePrivacyContext *)a3;
}

- (ML3DatabasePrivacyContext)privacyContext
{
  return self->_privacyContext;
}

- (void)setAllowAccountMerging:(BOOL)a3
{
  self->_allowAccountMerging = a3;
}

- (BOOL)allowAccountMerging
{
  return self->_allowAccountMerging;
}

- (void)setOperationCount:(unint64_t)a3
{
  self->_operationCount = a3;
}

- (unint64_t)operationCount
{
  return self->_operationCount;
}

- (void)setSourceType:(int)a3
{
  self->_sourceType = a3;
}

- (int)sourceType
{
  return self->_sourceType;
}

- (void)setLibraryPath:(id)a3
{
}

- (NSString)libraryPath
{
  return self->_libraryPath;
}

- (void)encodeWithCoder:(id)a3
{
  libraryPath = self->_libraryPath;
  id v5 = a3;
  [v5 encodeObject:libraryPath forKey:@"libraryPath"];
  [v5 encodeInt32:self->_sourceType forKey:@"sourceType"];
  [v5 encodeBool:self->_allowAccountMerging forKey:@"allowAccountMerging"];
  [v5 encodeObject:self->_privacyContext forKey:@"privacyContext"];
}

- (ML3ClientImportSessionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3ClientImportSessionConfiguration;
  id v5 = [(ML3ClientImportSessionConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryPath"];
    libraryPath = v5->_libraryPath;
    v5->_libraryPath = (NSString *)v6;

    v5->_sourceType = [v4 decodeInt32ForKey:@"sourceType"];
    v5->_allowAccountMerging = [v4 decodeBoolForKey:@"allowAccountMerging"];
    v5->_privacyContext = (ML3DatabasePrivacyContext *)(id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacyContext"];
  }

  return v5;
}

- (ML3ClientImportSessionConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)ML3ClientImportSessionConfiguration;
  v2 = [(ML3ClientImportSessionConfiguration *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ML3MusicLibrary autoupdatingSharedLibraryPath];
    libraryPath = v2->_libraryPath;
    v2->_libraryPath = (NSString *)v3;

    v2->_sourceType = 0;
    v2->_allowAccountMerging = 1;
    v2->_privacyContext = (ML3DatabasePrivacyContext *)+[ML3DatabasePrivacyContext sharedContext];
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end