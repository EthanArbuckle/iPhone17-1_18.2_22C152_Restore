@interface MAMsuDownloadOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)allowSameVersion;
- (BOOL)prerequisiteReleaseTypeIsOverridden;
- (BOOL)supervised;
- (MAMsuDownloadOptions)init;
- (MAMsuDownloadOptions)initWithCoder:(id)a3;
- (MAMsuDownloadOptions)initWithPlist:(id)a3;
- (NSString)liveAssetAudienceUUID;
- (NSString)prerequisiteBuildVersion;
- (NSString)prerequisiteProductVersion;
- (NSString)prerequisiteReleaseType;
- (NSString)purpose;
- (NSString)requestedProductVersion;
- (id)description;
- (id)encodeAsPlist;
- (int64_t)delayPeriod;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowSameVersion:(BOOL)a3;
- (void)setDelayPeriod:(int64_t)a3;
- (void)setLiveAssetAudienceUUID:(id)a3;
- (void)setPrerequisiteBuildVersion:(id)a3;
- (void)setPrerequisiteProductVersion:(id)a3;
- (void)setPrerequisiteReleaseType:(id)a3;
- (void)setPrerequisiteReleaseTypeIsOverridden:(BOOL)a3;
- (void)setPurpose:(id)a3;
- (void)setRequestedProductVersion:(id)a3;
- (void)setSupervised:(BOOL)a3;
@end

@implementation MAMsuDownloadOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_liveAssetAudienceUUID, 0);
  objc_storeStrong((id *)&self->_prerequisiteReleaseType, 0);
  objc_storeStrong((id *)&self->_prerequisiteProductVersion, 0);
  objc_storeStrong((id *)&self->_prerequisiteBuildVersion, 0);
  objc_storeStrong((id *)&self->_requestedProductVersion, 0);
}

- (MAMsuDownloadOptions)initWithPlist:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MAMsuDownloadOptions;
  v5 = [(MADownloadOptions *)&v15 initWithPlist:v4];
  if (v5)
  {
    v6 = getPlistString(v4, @"RequestedProductVersion");
    [(MAMsuDownloadOptions *)v5 setRequestedProductVersion:v6];

    v7 = getPlistNumber(v4, @"DelayPeriod");
    v5->_delayPeriod = [v7 longValue];

    v5->_supervised = getPlistNumberAsBool(v4, @"Supervised");
    v5->_allowSameVersion = getPlistNumberAsBool(v4, @"AllowSameVersion");
    v8 = getPlistString(v4, @"PrerequisiteBuildVersion");
    [(MAMsuDownloadOptions *)v5 setPrerequisiteBuildVersion:v8];

    v9 = getPlistString(v4, @"PrerequisiteProductVersion");
    [(MAMsuDownloadOptions *)v5 setPrerequisiteProductVersion:v9];

    v10 = getPlistString(v4, @"PrerequisiteReleaseType");
    [(MAMsuDownloadOptions *)v5 setPrerequisiteReleaseType:v10];

    v5->_prerequisiteReleaseTypeIsOverridden = getPlistNumberAsBool(v4, @"PrerequisiteReleaseTypeIsOverridden");
    v11 = getPlistString(v4, @"DownloadAuthorizationHeader");
    [(MADownloadOptions *)v5 setDownloadAuthorizationHeader:v11];

    v12 = getPlistString(v4, @"LiveAssetAudienceUUID");
    [(MAMsuDownloadOptions *)v5 setLiveAssetAudienceUUID:v12];

    v13 = getPlistString(v4, @"Purpose");
    [(MAMsuDownloadOptions *)v5 setPurpose:v13];
  }
  return v5;
}

- (void)setRequestedProductVersion:(id)a3
{
}

- (void)setPurpose:(id)a3
{
}

- (void)setPrerequisiteReleaseType:(id)a3
{
  self->_prerequisiteReleaseTypeIsOverridden = 1;
}

- (void)setPrerequisiteProductVersion:(id)a3
{
}

- (void)setPrerequisiteBuildVersion:(id)a3
{
}

- (void)setLiveAssetAudienceUUID:(id)a3
{
}

- (id)description
{
  objc_super v15 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)MAMsuDownloadOptions;
  v3 = [(MADownloadOptions *)&v16 description];
  id v4 = [(MAMsuDownloadOptions *)self requestedProductVersion];
  int64_t v5 = [(MAMsuDownloadOptions *)self delayPeriod];
  BOOL v6 = [(MAMsuDownloadOptions *)self supervised];
  BOOL v7 = [(MAMsuDownloadOptions *)self allowSameVersion];
  v8 = [(MAMsuDownloadOptions *)self prerequisiteBuildVersion];
  v9 = [(MAMsuDownloadOptions *)self prerequisiteProductVersion];
  if (self->_prerequisiteReleaseTypeIsOverridden) {
    prerequisiteReleaseType = (__CFString *)self->_prerequisiteReleaseType;
  }
  else {
    prerequisiteReleaseType = @"(default)";
  }
  v11 = [(MAMsuDownloadOptions *)self liveAssetAudienceUUID];
  v12 = [(MAMsuDownloadOptions *)self purpose];
  v13 = [v15 stringWithFormat:@"%@  + MAMsuDownloadOptions reqProdVersion: %@ delayPeriod: %ld managedDevice: %d allowSameVersion: %d prereqBuild: %@ prereqVersion: %@ prereqReleaseType: %@ liveAssetAudienceUUID: %@ purpose: %@", v3, v4, v5, v6, v7, v8, v9, prerequisiteReleaseType, v11, v12];

  return v13;
}

- (BOOL)supervised
{
  return self->_supervised;
}

- (NSString)requestedProductVersion
{
  return self->_requestedProductVersion;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (NSString)prerequisiteProductVersion
{
  return self->_prerequisiteProductVersion;
}

- (NSString)prerequisiteBuildVersion
{
  return self->_prerequisiteBuildVersion;
}

- (NSString)liveAssetAudienceUUID
{
  return self->_liveAssetAudienceUUID;
}

- (int64_t)delayPeriod
{
  return self->_delayPeriod;
}

- (BOOL)allowSameVersion
{
  return self->_allowSameVersion;
}

- (MAMsuDownloadOptions)init
{
  v11.receiver = self;
  v11.super_class = (Class)MAMsuDownloadOptions;
  v2 = [(MADownloadOptions *)&v11 init];
  v3 = v2;
  if (v2)
  {
    requestedProductVersion = v2->_requestedProductVersion;
    v2->_requestedProductVersion = 0;

    v3->_delayPeriod = 0;
    v3->_supervised = 0;
    v3->_allowSameVersion = 0;
    prerequisiteBuildVersion = v3->_prerequisiteBuildVersion;
    v3->_prerequisiteBuildVersion = 0;

    prerequisiteProductVersion = v3->_prerequisiteProductVersion;
    v3->_prerequisiteProductVersion = 0;

    prerequisiteReleaseType = v3->_prerequisiteReleaseType;
    v3->_prerequisiteReleaseType = 0;

    v3->_prerequisiteReleaseTypeIsOverridden = 0;
    liveAssetAudienceUUID = v3->_liveAssetAudienceUUID;
    v3->_liveAssetAudienceUUID = 0;

    purpose = v3->_purpose;
    v3->_purpose = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MAMsuDownloadOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MAMsuDownloadOptions;
  int64_t v5 = [(MADownloadOptions *)&v17 initWithCoder:v4];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RequestedProductVersion"];
    [(MAMsuDownloadOptions *)v5 setRequestedProductVersion:v6];

    BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DelayPeriod"];
    v5->_delayPeriod = [v7 longValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Supervised"];
    v5->_supervised = [v8 BOOLValue];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AllowSameVersion"];
    v5->_allowSameVersion = [v9 BOOLValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteBuildVersion"];
    [(MAMsuDownloadOptions *)v5 setPrerequisiteBuildVersion:v10];

    objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteProductVersion"];
    [(MAMsuDownloadOptions *)v5 setPrerequisiteProductVersion:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteReleaseType"];
    [(MAMsuDownloadOptions *)v5 setPrerequisiteReleaseType:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrerequisiteReleaseTypeIsOverridden"];
    v5->_prerequisiteReleaseTypeIsOverridden = [v13 BOOLValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LiveAssetAudienceUUID"];
    [(MAMsuDownloadOptions *)v5 setLiveAssetAudienceUUID:v14];

    objc_super v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Purpose"];
    [(MAMsuDownloadOptions *)v5 setPurpose:v15];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MAMsuDownloadOptions;
  [(MADownloadOptions *)&v15 encodeWithCoder:v4];
  requestedProductVersion = self->_requestedProductVersion;
  if (requestedProductVersion) {
    [v4 encodeObject:requestedProductVersion forKey:@"RequestedProductVersion"];
  }
  BOOL v6 = [NSNumber numberWithLong:self->_delayPeriod];
  [v4 encodeObject:v6 forKey:@"DelayPeriod"];

  BOOL v7 = [NSNumber numberWithBool:self->_supervised];
  [v4 encodeObject:v7 forKey:@"Supervised"];

  v8 = [NSNumber numberWithBool:self->_allowSameVersion];
  [v4 encodeObject:v8 forKey:@"AllowSameVersion"];

  prerequisiteBuildVersion = self->_prerequisiteBuildVersion;
  if (prerequisiteBuildVersion) {
    [v4 encodeObject:prerequisiteBuildVersion forKey:@"PrerequisiteBuildVersion"];
  }
  prerequisiteProductVersion = self->_prerequisiteProductVersion;
  if (prerequisiteProductVersion) {
    [v4 encodeObject:prerequisiteProductVersion forKey:@"PrerequisiteProductVersion"];
  }
  prerequisiteReleaseType = self->_prerequisiteReleaseType;
  if (prerequisiteReleaseType) {
    [v4 encodeObject:prerequisiteReleaseType forKey:@"PrerequisiteReleaseType"];
  }
  v12 = [NSNumber numberWithBool:self->_prerequisiteReleaseTypeIsOverridden];
  [v4 encodeObject:v12 forKey:@"PrerequisiteReleaseTypeIsOverridden"];

  v13 = [(MAMsuDownloadOptions *)self liveAssetAudienceUUID];
  [v4 encodeObject:v13 forKey:@"LiveAssetAudienceUUID"];

  v14 = [(MAMsuDownloadOptions *)self purpose];
  [v4 encodeObject:v14 forKey:@"Purpose"];
}

- (id)encodeAsPlist
{
  v17.receiver = self;
  v17.super_class = (Class)MAMsuDownloadOptions;
  v3 = [(MADownloadOptions *)&v17 encodeAsPlist];
  id v4 = v3;
  requestedProductVersion = self->_requestedProductVersion;
  if (requestedProductVersion) {
    [v3 setValue:requestedProductVersion forKey:@"RequestedProductVersion"];
  }
  BOOL v6 = [NSNumber numberWithLong:self->_delayPeriod];
  [v4 setValue:v6 forKey:@"DelayPeriod"];

  BOOL v7 = [NSNumber numberWithBool:self->_supervised];
  [v4 setValue:v7 forKey:@"Supervised"];

  v8 = [NSNumber numberWithBool:self->_allowSameVersion];
  [v4 setValue:v8 forKey:@"AllowSameVersion"];

  prerequisiteBuildVersion = self->_prerequisiteBuildVersion;
  if (prerequisiteBuildVersion) {
    [v4 setValue:prerequisiteBuildVersion forKey:@"PrerequisiteBuildVersion"];
  }
  prerequisiteProductVersion = self->_prerequisiteProductVersion;
  if (prerequisiteProductVersion) {
    [v4 setValue:prerequisiteProductVersion forKey:@"PrerequisiteProductVersion"];
  }
  prerequisiteReleaseType = self->_prerequisiteReleaseType;
  if (prerequisiteReleaseType) {
    [v4 setValue:prerequisiteReleaseType forKey:@"PrerequisiteReleaseType"];
  }
  v12 = [NSNumber numberWithBool:self->_prerequisiteReleaseTypeIsOverridden];
  [v4 setValue:v12 forKey:@"PrerequisiteReleaseTypeIsOverridden"];

  v13 = [(MADownloadOptions *)self downloadAuthorizationHeader];
  [v4 setValue:v13 forKey:@"DownloadAuthorizationHeader"];

  v14 = [(MAMsuDownloadOptions *)self liveAssetAudienceUUID];
  [v4 setValue:v14 forKey:@"LiveAssetAudienceUUID"];

  objc_super v15 = [(MAMsuDownloadOptions *)self purpose];
  [v4 setValue:v15 forKey:@"Purpose"];

  return v4;
}

- (void)setDelayPeriod:(int64_t)a3
{
  self->_delayPeriod = a3;
}

- (void)setSupervised:(BOOL)a3
{
  self->_supervised = a3;
}

- (void)setAllowSameVersion:(BOOL)a3
{
  self->_allowSameVersion = a3;
}

- (NSString)prerequisiteReleaseType
{
  return self->_prerequisiteReleaseType;
}

- (BOOL)prerequisiteReleaseTypeIsOverridden
{
  return self->_prerequisiteReleaseTypeIsOverridden;
}

- (void)setPrerequisiteReleaseTypeIsOverridden:(BOOL)a3
{
  self->_prerequisiteReleaseTypeIsOverridden = a3;
}

@end