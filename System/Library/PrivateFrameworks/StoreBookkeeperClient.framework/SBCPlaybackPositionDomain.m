@interface SBCPlaybackPositionDomain
+ (BOOL)supportsSecureCoding;
+ (id)domainForExtrasValues;
+ (id)domainForSyncingMusicLibraryWithLibraryPath:(id)a3;
- (BOOL)supportsSyncProtocol;
- (NSString)domainIdentifier;
- (NSString)foreignDatabasePath;
- (NSString)ubiquitousDatabasePath;
- (SBCPlaybackPositionDomain)initWithCoder:(id)a3;
- (SBCPlaybackPositionDomain)initWithDomainIdentifier:(id)a3 foreignDatabasePath:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSupportsSyncProtocol:(BOOL)a3;
- (void)setUbiquitousDatabasePath:(id)a3;
@end

@implementation SBCPlaybackPositionDomain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignDatabasePath, 0);
  objc_storeStrong((id *)&self->_ubiquitousDatabasePath, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

- (void)setSupportsSyncProtocol:(BOOL)a3
{
  self->_supportsSyncProtocol = a3;
}

- (BOOL)supportsSyncProtocol
{
  return self->_supportsSyncProtocol;
}

- (NSString)foreignDatabasePath
{
  return self->_foreignDatabasePath;
}

- (void)setUbiquitousDatabasePath:(id)a3
{
}

- (NSString)ubiquitousDatabasePath
{
  return self->_ubiquitousDatabasePath;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (SBCPlaybackPositionDomain)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"SBCDomainIdentifier"];
  v6 = [v4 decodeObjectForKey:@"SBCForeignDatabasePath"];
  v7 = [(SBCPlaybackPositionDomain *)self initWithDomainIdentifier:v5 foreignDatabasePath:v6];
  if (v7)
  {
    v8 = [v4 decodeObjectForKey:@"SBCUbiquitousDatabasePath"];
    [(SBCPlaybackPositionDomain *)v7 setUbiquitousDatabasePath:v8];

    -[SBCPlaybackPositionDomain setSupportsSyncProtocol:](v7, "setSupportsSyncProtocol:", [v4 decodeBoolForKey:@"SBCSupportsSyncProtocol"]);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  domainIdentifier = self->_domainIdentifier;
  id v5 = a3;
  [v5 encodeObject:domainIdentifier forKey:@"SBCDomainIdentifier"];
  [v5 encodeObject:self->_foreignDatabasePath forKey:@"SBCForeignDatabasePath"];
  [v5 encodeObject:self->_ubiquitousDatabasePath forKey:@"SBCUbiquitousDatabasePath"];
  [v5 encodeBool:self->_supportsSyncProtocol forKey:@"SBCSupportsSyncProtocol"];
}

- (id)description
{
  if ([(NSString *)self->_foreignDatabasePath length])
  {
    [NSString stringWithFormat:@", foreignDB = %@", self->_foreignDatabasePath];
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_26E9B09B0;
  }
  id v4 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)SBCPlaybackPositionDomain;
  uint64_t v5 = [(SBCPlaybackPositionDomain *)&v10 description];
  v6 = (void *)v5;
  if (self->_supportsSyncProtocol) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = [v4 stringWithFormat:@"%@ domain='%@'%@, supportsSync=%@", v5, self->_domainIdentifier, v3, v7];

  return v8;
}

- (SBCPlaybackPositionDomain)initWithDomainIdentifier:(id)a3 foreignDatabasePath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBCPlaybackPositionDomain;
  v9 = [(SBCPlaybackPositionDomain *)&v14 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_domainIdentifier, a3);
    uint64_t v11 = [v8 stringByStandardizingPath];
    foreignDatabasePath = v10->_foreignDatabasePath;
    v10->_foreignDatabasePath = (NSString *)v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)domainForExtrasValues
{
  id v2 = objc_alloc((Class)a1);
  v3 = (void *)[v2 initWithDomainIdentifier:*MEMORY[0x263F88F70] foreignDatabasePath:0];
  return v3;
}

+ (id)domainForSyncingMusicLibraryWithLibraryPath:(id)a3
{
  id v3 = a3;
  id v4 = [SBCMusicLibraryPlaybackPositionDomain alloc];
  uint64_t v5 = [(SBCPlaybackPositionDomain *)v4 initWithDomainIdentifier:*MEMORY[0x263F88F68] foreignDatabasePath:v3];

  [(SBCPlaybackPositionDomain *)v5 setSupportsSyncProtocol:1];
  return v5;
}

@end