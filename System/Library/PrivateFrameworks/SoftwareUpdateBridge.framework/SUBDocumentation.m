@interface SUBDocumentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)preferredPhoneLanguages;
- (NSData)licenseAgreement;
- (NSData)preferencesIcon;
- (NSData)releaseNotes;
- (NSData)releaseNotesSummary;
- (NSString)currentPhoneLanguage;
- (NSString)humanReadableUpdateName;
- (NSString)phoneLanguage;
- (NSURL)documentationBundleURL;
- (SUBDocumentation)initWithCoder:(id)a3;
- (SUBDocumentation)initWithDocumentationBundleURL:(id)a3;
- (SUBDocumentation)initWithMAAsset:(id)a3;
- (SUCoreDocumentation)suCoreParsedDocumentation;
- (id)_resourceFromBundle:(id)a3 forKey:(id)a4;
- (id)summary;
- (void)_loadBundleResources;
- (void)encodeWithCoder:(id)a3;
- (void)setDocumentationBundleURL:(id)a3;
- (void)setHumanReadableUpdateName:(id)a3;
- (void)setLicenseAgreement:(id)a3;
- (void)setPhoneLanguage:(id)a3;
- (void)setPreferencesIcon:(id)a3;
- (void)setReleaseNotes:(id)a3;
- (void)setReleaseNotesSummary:(id)a3;
- (void)setSuCoreParsedDocumentation:(id)a3;
@end

@implementation SUBDocumentation

- (NSString)currentPhoneLanguage
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [(SUBDocumentation *)self preferredPhoneLanguages];
  v3 = v2;
  if (v2 && [v2 count])
  {
    v4 = (void *)softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v6 = [v3 objectAtIndex:0];
      int v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_23C27B000, v5, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation] : currentPhoneLanguage returned via preferredPhoneLanguages is (%{public}@)", (uint8_t *)&v10, 0xCu);
    }
    v7 = [v3 objectAtIndex:0];
  }
  else
  {
    v8 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_23C27B000, v8, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation] : Using default language for currentPhoneLanguage", (uint8_t *)&v10, 2u);
    }
    v7 = @"en";
  }

  return (NSString *)v7;
}

- (NSArray)preferredPhoneLanguages
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v3 = [v2 count];
  uint64_t v4 = softwareupdatebridge_log;
  BOOL v5 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v5) {
      goto LABEL_7;
    }
    int v10 = 138543362;
    v11 = v2;
    v6 = "[SUBDocumentation] : Preferred languages are %{public}@";
    v7 = v4;
    uint32_t v8 = 12;
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    LOWORD(v10) = 0;
    v6 = "[SUBDocumentation] : NSLocale did not return any preferred phone languages";
    v7 = v4;
    uint32_t v8 = 2;
  }
  _os_log_impl(&dword_23C27B000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
LABEL_7:
  return (NSArray *)v2;
}

- (SUBDocumentation)initWithDocumentationBundleURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUBDocumentation;
  v6 = [(SUBDocumentation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_documentationBundleURL, a3);
    suCoreParsedDocumentation = v7->_suCoreParsedDocumentation;
    v7->_suCoreParsedDocumentation = 0;
  }
  return v7;
}

- (SUBDocumentation)initWithMAAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUBDocumentation;
  id v5 = [(SUBDocumentation *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 getLocalUrl];
    documentationBundleURL = v5->_documentationBundleURL;
    v5->_documentationBundleURL = (NSURL *)v6;

    uint32_t v8 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C27B000, v8, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation]: Calling SUCoreDocumentation alloc on maDocAsset", buf, 2u);
    }
    uint64_t v9 = [objc_alloc(MEMORY[0x263F77B60]) initWithDocumentationAsset:v4];
    suCoreParsedDocumentation = v5->_suCoreParsedDocumentation;
    v5->_suCoreParsedDocumentation = (SUCoreDocumentation *)v9;

    v11 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v5->_suCoreParsedDocumentation;
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_23C27B000, v11, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation]: Parsed doc asset is: %{public}@\n", buf, 0xCu);
    }
  }

  return v5;
}

- (SUBDocumentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SUBDocumentation;
  id v5 = [(SUBDocumentation *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentationBundleURL"];
    documentationBundleURL = v5->_documentationBundleURL;
    v5->_documentationBundleURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseNotesSummary"];
    releaseNotesSummary = v5->_releaseNotesSummary;
    v5->_releaseNotesSummary = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"releaseNotes"];
    releaseNotes = v5->_releaseNotes;
    v5->_releaseNotes = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"licenseAgreement"];
    licenseAgreement = v5->_licenseAgreement;
    v5->_licenseAgreement = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HumanReadableUpdateName"];
    humanReadableUpdateName = v5->_humanReadableUpdateName;
    v5->_humanReadableUpdateName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suCoreParsedDocAsset"];
    suCoreParsedDocumentation = v5->_suCoreParsedDocumentation;
    v5->_suCoreParsedDocumentation = (SUCoreDocumentation *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suIconImage"];
    preferencesIcon = v5->_preferencesIcon;
    v5->_preferencesIcon = (NSData *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  documentationBundleURL = self->_documentationBundleURL;
  id v5 = a3;
  [v5 encodeObject:documentationBundleURL forKey:@"documentationBundleURL"];
  [v5 encodeObject:self->_releaseNotesSummary forKey:@"releaseNotesSummary"];
  [v5 encodeObject:self->_releaseNotes forKey:@"releaseNotes"];
  [v5 encodeObject:self->_licenseAgreement forKey:@"licenseAgreement"];
  [v5 encodeObject:self->_humanReadableUpdateName forKey:@"HumanReadableUpdateName"];
  [v5 encodeObject:self->_suCoreParsedDocumentation forKey:@"suCoreParsedDocAsset"];
  [v5 encodeObject:self->_preferencesIcon forKey:@"suIconImage"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)humanReadableUpdateName
{
  [(SUBDocumentation *)self _loadBundleResources];
  humanReadableUpdateName = self->_humanReadableUpdateName;
  return humanReadableUpdateName;
}

- (NSData)releaseNotesSummary
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [(SUBDocumentation *)self _loadBundleResources];
  uint64_t v3 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = self->_releaseNotesSummary != 0;
    v7[0] = 67240192;
    v7[1] = v4;
    _os_log_impl(&dword_23C27B000, v3, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation] : releaseNotesSummary requested, is valid? %{public}d", (uint8_t *)v7, 8u);
  }
  releaseNotesSummary = self->_releaseNotesSummary;
  return releaseNotesSummary;
}

- (NSData)releaseNotes
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [(SUBDocumentation *)self _loadBundleResources];
  uint64_t v3 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = self->_releaseNotes != 0;
    v7[0] = 67240192;
    v7[1] = v4;
    _os_log_impl(&dword_23C27B000, v3, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation] : releaseNotes requested, is valid? %{public}d", (uint8_t *)v7, 8u);
  }
  releaseNotes = self->_releaseNotes;
  return releaseNotes;
}

- (NSData)licenseAgreement
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [(SUBDocumentation *)self _loadBundleResources];
  uint64_t v3 = softwareupdatebridge_log;
  if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = self->_licenseAgreement != 0;
    v7[0] = 67240192;
    v7[1] = v4;
    _os_log_impl(&dword_23C27B000, v3, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation] : licenseAgreement requested, is valid? %{public}d", (uint8_t *)v7, 8u);
  }
  licenseAgreement = self->_licenseAgreement;
  return licenseAgreement;
}

- (id)_resourceFromBundle:(id)a3 forKey:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CFURLRef v4 = CFBundleCopyResourceURLInDirectory((CFURLRef)a3, (CFStringRef)a4, @"html", 0);
  if (v4)
  {
    id v5 = (void *)softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = (void *)MEMORY[0x263EFF8F8];
      v7 = v5;
      uint64_t v8 = [v6 dataWithContentsOfURL:v4];
      int v11 = 138543618;
      CFURLRef v12 = v4;
      __int16 v13 = 2050;
      uint64_t v14 = [v8 length];
      _os_log_impl(&dword_23C27B000, v7, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation] :Length of resource at URL: %{public}@ : %{public}lu", (uint8_t *)&v11, 0x16u);
    }
    uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_loadBundleResources
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  documentationBundleURL = self->_documentationBundleURL;
  CFURLRef v4 = softwareupdatebridge_log;
  BOOL v5 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
  if (documentationBundleURL)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C27B000, v4, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation]: Loading bundle resources", buf, 2u);
    }
    uint64_t v6 = [(SUBDocumentation *)self currentPhoneLanguage];
    int v7 = [(SUBDocumentation *)v6 isEqualToString:self->_phoneLanguage];
    uint64_t v8 = softwareupdatebridge_log;
    BOOL v9 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138543362;
        v38 = v6;
        _os_log_impl(&dword_23C27B000, v8, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation] : documentation language in use is same as the current language: %{public}@", buf, 0xCu);
      }
LABEL_38:

      return;
    }
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v38 = v6;
      _os_log_impl(&dword_23C27B000, v8, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation] : Setting language %@ for documentation language", buf, 0xCu);
    }
    [(SUBDocumentation *)self setPhoneLanguage:v6];
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFURLRef v11 = [(SUBDocumentation *)self documentationBundleURL];
    CFURLRef v12 = CFBundleCreate(v10, v11);

    if (!v12)
    {
      v26 = (void *)softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v26;
        v28 = [(SUBDocumentation *)self documentationBundleURL];
        v29 = [v28 absoluteString];
        *(_DWORD *)buf = 138543362;
        v38 = v29;
        _os_log_impl(&dword_23C27B000, v27, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation] : Unable to create bundle from documentationBundleURL(%{public}@)", buf, 0xCu);
      }
      goto LABEL_38;
    }
    __int16 v13 = [(SUBDocumentation *)self suCoreParsedDocumentation];

    if (!v13)
    {
LABEL_33:
      [(SUBDocumentation *)self setHumanReadableUpdateName:0];
      [(SUBDocumentation *)self setReleaseNotesSummary:0];
      [(SUBDocumentation *)self setReleaseNotes:0];
      [(SUBDocumentation *)self setLicenseAgreement:0];
      v31 = (__CFString *)CFBundleCopyLocalizedString(v12, @"HumanReadableUpdateName", 0, @"documentation");
      if (([(__CFString *)v31 isEqualToString:@"HumanReadableUpdateName"] & 1) == 0) {
        [(SUBDocumentation *)self setHumanReadableUpdateName:v31];
      }
      v32 = [(SUBDocumentation *)self _resourceFromBundle:self->_documentationBundleURL forKey:@"ReadMeSummary"];
      [(SUBDocumentation *)self setReleaseNotesSummary:v32];

      v33 = [(SUBDocumentation *)self _resourceFromBundle:self->_documentationBundleURL forKey:@"ReadMe"];
      [(SUBDocumentation *)self setReleaseNotes:v33];

      v34 = [(SUBDocumentation *)self _resourceFromBundle:self->_documentationBundleURL forKey:@"License"];
      [(SUBDocumentation *)self setLicenseAgreement:v34];

      v35 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v38 = self;
        _os_log_impl(&dword_23C27B000, v35, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation] : %{public}@", buf, 0xCu);
      }
      CFRelease(v12);

      goto LABEL_38;
    }
    uint64_t v14 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C27B000, v14, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation]: SUCore Parsed doc exists. Attempting to extract image", buf, 2u);
    }
    uint64_t v15 = [(SUBDocumentation *)self suCoreParsedDocumentation];
    uint64_t v16 = [v15 softwareUpdateIconImagePath];

    uint64_t v17 = [MEMORY[0x263F08850] defaultManager];
    int v18 = [v17 fileExistsAtPath:v16];
    v19 = softwareupdatebridge_log;
    BOOL v20 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        *(_DWORD *)buf = 138543362;
        v38 = v16;
        _os_log_impl(&dword_23C27B000, v19, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation]: SoftwareUpdateIcon found at path %{public}@", buf, 0xCu);
      }
      id v36 = 0;
      objc_super v21 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v16 options:1 error:&v36];
      id v22 = v36;
      v23 = v22;
      if (v21 && !v22) {
        goto LABEL_23;
      }
      v24 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v38 = v16;
        __int16 v39 = 2114;
        v40 = v23;
        _os_log_impl(&dword_23C27B000, v24, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation]: Failed to read contents of icon file at %{public}@. Error: %{public}@", buf, 0x16u);
      }

      if (v21)
      {
LABEL_23:
        v25 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23C27B000, v25, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation]: Found SU Icon in doc assets", buf, 2u);
        }
        [(SUBDocumentation *)self setPreferencesIcon:v21];

LABEL_32:
        goto LABEL_33;
      }
    }
    else if (v20)
    {
      *(_DWORD *)buf = 138543362;
      v38 = v16;
      _os_log_impl(&dword_23C27B000, v19, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation]: SoftwareUpdateIcon file *not* found at path %{public}@", buf, 0xCu);
    }
    v30 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C27B000, v30, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation]: Unable to locate preferences icon in docs", buf, 2u);
    }
    goto LABEL_32;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23C27B000, v4, OS_LOG_TYPE_DEFAULT, "[SUBDocumentation] : Documentation bundle URL is nil..", buf, 2u);
  }
}

- (BOOL)isEqual:(id)a3
{
  CFURLRef v4 = (SUBDocumentation *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [(SUBDocumentation *)v4 documentationBundleURL];
      uint64_t v6 = [(SUBDocumentation *)self documentationBundleURL];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)summary
{
  id v3 = [NSString alloc];
  CFURLRef v4 = [(SUBDocumentation *)self humanReadableUpdateName];
  BOOL v5 = [(SUBDocumentation *)self releaseNotesSummary];
  uint64_t v6 = @"Null";
  if (v5) {
    char v7 = @"valid";
  }
  else {
    char v7 = @"Null";
  }
  uint64_t v8 = [(SUBDocumentation *)self releaseNotes];
  if (v8) {
    BOOL v9 = @"valid";
  }
  else {
    BOOL v9 = @"Null";
  }
  CFAllocatorRef v10 = [(SUBDocumentation *)self licenseAgreement];
  if (v10) {
    uint64_t v6 = @"valid";
  }
  CFURLRef v11 = [(SUBDocumentation *)self documentationBundleURL];
  CFURLRef v12 = [(SUBDocumentation *)self preferencesIcon];
  __int16 v13 = @"YES";
  if (!v12) {
    __int16 v13 = @"NO";
  }
  uint64_t v14 = (void *)[v3 initWithFormat:@"Update name: %@ releaseNotesSummary:%@ releaseNotes:%@ licenseAgreement:%@, localBundleURL: %@ UIIconPresent: %@", v4, v7, v9, v6, v11, v13];

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

- (NSData)preferencesIcon
{
  return self->_preferencesIcon;
}

- (void)setPreferencesIcon:(id)a3
{
}

- (NSURL)documentationBundleURL
{
  return self->_documentationBundleURL;
}

- (void)setDocumentationBundleURL:(id)a3
{
}

- (SUCoreDocumentation)suCoreParsedDocumentation
{
  return self->_suCoreParsedDocumentation;
}

- (void)setSuCoreParsedDocumentation:(id)a3
{
}

- (NSString)phoneLanguage
{
  return self->_phoneLanguage;
}

- (void)setPhoneLanguage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneLanguage, 0);
  objc_storeStrong((id *)&self->_suCoreParsedDocumentation, 0);
  objc_storeStrong((id *)&self->_documentationBundleURL, 0);
  objc_storeStrong((id *)&self->_preferencesIcon, 0);
  objc_storeStrong((id *)&self->_humanReadableUpdateName, 0);
  objc_storeStrong((id *)&self->_licenseAgreement, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);
  objc_storeStrong((id *)&self->_releaseNotesSummary, 0);
}

@end