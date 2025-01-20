@interface SUControllerDocumentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)licenseAgreement;
- (NSData)releaseNotes;
- (NSData)releaseNotesSummary;
- (NSData)serverAssetMeasurement;
- (NSString)currentLanguage;
- (NSString)humanReadableUpdateName;
- (NSString)serverAssetAlgorithm;
- (NSURL)localBundleURL;
- (NSURL)serverAssetURL;
- (SUControllerDocumentation)initWithCoder:(id)a3;
- (SUControllerDocumentation)initWithDocumentationBundleURL:(id)a3 serverAssetURL:(id)a4 serverAssetMeasurement:(id)a5 serverAssetAlgorithm:(id)a6 serverAssetChunkSize:(int64_t)a7;
- (id)_resourceFromBundle:(__CFBundle *)a3 forKey:(id)a4;
- (id)description;
- (int64_t)serverAssetChunkSize;
- (void)_loadBundleResources;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentLanguage:(id)a3;
- (void)setHumanReadableUpdateName:(id)a3;
- (void)setLicenseAgreement:(id)a3;
- (void)setLocalBundleURL:(id)a3;
- (void)setReleaseNotes:(id)a3;
- (void)setReleaseNotesSummary:(id)a3;
- (void)setServerAssetAlgorithm:(id)a3;
- (void)setServerAssetChunkSize:(int64_t)a3;
- (void)setServerAssetMeasurement:(id)a3;
- (void)setServerAssetURL:(id)a3;
@end

@implementation SUControllerDocumentation

- (SUControllerDocumentation)initWithDocumentationBundleURL:(id)a3 serverAssetURL:(id)a4 serverAssetMeasurement:(id)a5 serverAssetAlgorithm:(id)a6 serverAssetChunkSize:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SUControllerDocumentation;
  v17 = [(SUControllerDocumentation *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_localBundleURL, a3);
    objc_storeStrong((id *)&v18->_serverAssetURL, a4);
    objc_storeStrong((id *)&v18->_serverAssetMeasurement, a5);
    objc_storeStrong((id *)&v18->_serverAssetAlgorithm, a6);
    v18->_serverAssetChunkSize = a7;
  }

  return v18;
}

- (SUControllerDocumentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUControllerDocumentation;
  v5 = [(SUControllerDocumentation *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localBundleURL"];
    localBundleURL = v5->_localBundleURL;
    v5->_localBundleURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverAssetURL"];
    serverAssetURL = v5->_serverAssetURL;
    v5->_serverAssetURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverAssetMeasurement"];
    serverAssetMeasurement = v5->_serverAssetMeasurement;
    v5->_serverAssetMeasurement = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverAssetAlgorithm"];
    serverAssetAlgorithm = v5->_serverAssetAlgorithm;
    v5->_serverAssetAlgorithm = (NSString *)v12;

    v5->_serverAssetChunkSize = [v4 decodeInt64ForKey:@"serverAssetChunkSize"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseNotesSummary"];
    releaseNotesSummary = v5->_releaseNotesSummary;
    v5->_releaseNotesSummary = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseNotes"];
    releaseNotes = v5->_releaseNotes;
    v5->_releaseNotes = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"licenseAgreement"];
    licenseAgreement = v5->_licenseAgreement;
    v5->_licenseAgreement = (NSData *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SUControllerDocumentation *)self localBundleURL];
  [v4 encodeObject:v5 forKey:@"localBundleURL"];

  uint64_t v6 = [(SUControllerDocumentation *)self serverAssetURL];
  [v4 encodeObject:v6 forKey:@"serverAssetURL"];

  v7 = [(SUControllerDocumentation *)self serverAssetMeasurement];
  [v4 encodeObject:v7 forKey:@"serverAssetMeasurement"];

  uint64_t v8 = [(SUControllerDocumentation *)self serverAssetAlgorithm];
  [v4 encodeObject:v8 forKey:@"serverAssetAlgorithm"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[SUControllerDocumentation serverAssetChunkSize](self, "serverAssetChunkSize"), @"serverAssetChunkSize");
  v9 = [(SUControllerDocumentation *)self releaseNotesSummary];
  [v4 encodeObject:v9 forKey:@"releaseNotesSummary"];

  uint64_t v10 = [(SUControllerDocumentation *)self releaseNotes];
  [v4 encodeObject:v10 forKey:@"releaseNotes"];

  id v11 = [(SUControllerDocumentation *)self licenseAgreement];
  [v4 encodeObject:v11 forKey:@"licenseAgreement"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)humanReadableUpdateName
{
  [(SUControllerDocumentation *)self _loadBundleResources];
  humanReadableUpdateName = self->_humanReadableUpdateName;

  return humanReadableUpdateName;
}

- (NSData)releaseNotesSummary
{
  [(SUControllerDocumentation *)self _loadBundleResources];
  releaseNotesSummary = self->_releaseNotesSummary;

  return releaseNotesSummary;
}

- (NSData)releaseNotes
{
  [(SUControllerDocumentation *)self _loadBundleResources];
  releaseNotes = self->_releaseNotes;

  return releaseNotes;
}

- (NSData)licenseAgreement
{
  [(SUControllerDocumentation *)self _loadBundleResources];
  licenseAgreement = self->_licenseAgreement;

  return licenseAgreement;
}

- (id)_resourceFromBundle:(__CFBundle *)a3 forKey:(id)a4
{
  CFURLRef v4 = CFBundleCopyResourceURL(a3, (CFStringRef)a4, @"html", 0);
  if (v4)
  {
    v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_loadBundleResources
{
  v3 = [(SUControllerDocumentation *)self localBundleURL];

  if (v3)
  {
    CFURLRef v4 = [MEMORY[0x263EFF960] preferredLanguages];
    v5 = v4;
    if (v4 && [v4 count])
    {
      uint64_t v6 = [v5 objectAtIndex:0];
    }
    else
    {
      uint64_t v6 = @"en";
    }
    uint64_t v16 = v6;
    v7 = [(SUControllerDocumentation *)self currentLanguage];
    char v8 = [(__CFString *)v16 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(SUControllerDocumentation *)self setCurrentLanguage:v16];
      [(SUControllerDocumentation *)self setHumanReadableUpdateName:0];
      [(SUControllerDocumentation *)self setReleaseNotesSummary:0];
      [(SUControllerDocumentation *)self setReleaseNotes:0];
      [(SUControllerDocumentation *)self setLicenseAgreement:0];
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFURLRef v10 = [(SUControllerDocumentation *)self localBundleURL];
      id v11 = CFBundleCreate(v9, v10);

      if (v11)
      {
        uint64_t v12 = (__CFString *)CFBundleCopyLocalizedString(v11, @"HumanReadableUpdateName", 0, @"documentation");
        if (([(__CFString *)v12 isEqualToString:@"HumanReadableUpdateName"] & 1) == 0) {
          [(SUControllerDocumentation *)self setHumanReadableUpdateName:v12];
        }
        id v13 = [(SUControllerDocumentation *)self _resourceFromBundle:v11 forKey:@"ReadMeSummary"];
        [(SUControllerDocumentation *)self setReleaseNotesSummary:v13];

        uint64_t v14 = [(SUControllerDocumentation *)self _resourceFromBundle:v11 forKey:@"ReadMe"];
        [(SUControllerDocumentation *)self setReleaseNotes:v14];

        id v15 = [(SUControllerDocumentation *)self _resourceFromBundle:v11 forKey:@"License"];
        [(SUControllerDocumentation *)self setLicenseAgreement:v15];

        CFRelease(v11);
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  CFURLRef v4 = (SUControllerDocumentation *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(SUControllerDocumentation *)v4 localBundleURL];
      uint64_t v6 = [(SUControllerDocumentation *)self localBundleURL];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  v19 = NSString;
  uint64_t v18 = [(SUControllerDocumentation *)self localBundleURL];
  v17 = [(SUControllerDocumentation *)self serverAssetURL];
  objc_super v20 = [(SUControllerDocumentation *)self serverAssetMeasurement];
  v3 = @"absent";
  if (v20) {
    CFURLRef v4 = @"present";
  }
  else {
    CFURLRef v4 = @"absent";
  }
  uint64_t v16 = v4;
  v5 = [(SUControllerDocumentation *)self serverAssetAlgorithm];
  int64_t v6 = [(SUControllerDocumentation *)self serverAssetChunkSize];
  char v7 = [(SUControllerDocumentation *)self releaseNotesSummary];
  if (v7) {
    char v8 = @"present";
  }
  else {
    char v8 = @"absent";
  }
  CFAllocatorRef v9 = [(SUControllerDocumentation *)self releaseNotes];
  if (v9) {
    CFURLRef v10 = @"present";
  }
  else {
    CFURLRef v10 = @"absent";
  }
  id v11 = [(SUControllerDocumentation *)self licenseAgreement];
  if (v11) {
    v3 = @"present";
  }
  uint64_t v12 = [(SUControllerDocumentation *)self humanReadableUpdateName];
  id v13 = [(SUControllerDocumentation *)self currentLanguage];
  uint64_t v14 = [v19 stringWithFormat:@"\nLocalBundleURL: %@\nServerAssetURL: %@\nServerAssetMeasurement: %@\nServerAssetAlgorithm: %@\nServerAssetChunkSize: %lld\nReleaseNotesSummary: %@\nReleaseNotes: %@\nLicenseAgreement: %@\nHumanReadableUpdateName: %@\ncurrentLanguage: %@\n", v18, v17, v16, v5, v6, v8, v10, v3, v12, v13];

  return v14;
}

- (void)setReleaseNotesSummary:(id)a3
{
}

- (void)setReleaseNotes:(id)a3
{
}

- (void)setLicenseAgreement:(id)a3
{
}

- (void)setHumanReadableUpdateName:(id)a3
{
}

- (NSURL)localBundleURL
{
  return self->_localBundleURL;
}

- (void)setLocalBundleURL:(id)a3
{
}

- (NSURL)serverAssetURL
{
  return self->_serverAssetURL;
}

- (void)setServerAssetURL:(id)a3
{
}

- (NSData)serverAssetMeasurement
{
  return self->_serverAssetMeasurement;
}

- (void)setServerAssetMeasurement:(id)a3
{
}

- (NSString)serverAssetAlgorithm
{
  return self->_serverAssetAlgorithm;
}

- (void)setServerAssetAlgorithm:(id)a3
{
}

- (int64_t)serverAssetChunkSize
{
  return self->_serverAssetChunkSize;
}

- (void)setServerAssetChunkSize:(int64_t)a3
{
  self->_serverAssetChunkSize = a3;
}

- (NSString)currentLanguage
{
  return self->_currentLanguage;
}

- (void)setCurrentLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_serverAssetAlgorithm, 0);
  objc_storeStrong((id *)&self->_serverAssetMeasurement, 0);
  objc_storeStrong((id *)&self->_serverAssetURL, 0);
  objc_storeStrong((id *)&self->_localBundleURL, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_licenseAgreement, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);

  objc_storeStrong((id *)&self->_releaseNotesSummary, 0);
}

@end