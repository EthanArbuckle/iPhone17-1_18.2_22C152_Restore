@interface TZFileSystemInterface
+ (id)sharedInstance;
- (NSString)systemICUTZSchemaVersion;
- (NSURL)cachedTZDataLocation;
- (NSURL)currentZoneinfoLinkURL;
- (NSURL)dataExpansionParentURL;
- (NSURL)dataExpansionVersionDirectory;
- (NSURL)latestLinkDestinationAtStartup;
- (NSURL)latestTZDataLink;
- (NSURL)latestTZLinkURL;
- (NSURL)systemICUDirectoryURL;
- (NSURL)systemICUSchemaVersionURL;
- (NSURL)temporaryDirectory;
- (TZFileSystemInterface)init;
- (TZVersionInfo)currentVersionInfo;
- (TZVersionInfo)lastInstalledVersionInfo;
- (TZVersionInfo)latestVersionInfo;
- (TZVersionInfo)systemVersionInfo;
- (id)obtainDestinationOfLinkAtURL:(id)a3;
- (void)cacheTZLatestDestination;
- (void)resetTemporaryDirectory;
- (void)setCachedTZDataLocation:(id)a3;
- (void)setDataExpansionVersionDirectory:(id)a3;
- (void)setLatestTZDataLink:(id)a3;
- (void)setTemporaryDirectory:(id)a3;
@end

@implementation TZFileSystemInterface

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_fileSystemInterfaceShared;

  return v2;
}

uint64_t __39__TZFileSystemInterface_sharedInstance__block_invoke()
{
  if (+[TZDLogging canLogMessageAtLevel:2]) {
    NSLog(&cfstr_SInitializingT.isa, "+[TZFileSystemInterface sharedInstance]_block_invoke");
  }
  sharedInstance_fileSystemInterfaceShared = objc_alloc_init(TZFileSystemInterface);

  return MEMORY[0x270F9A758]();
}

- (TZFileSystemInterface)init
{
  v5.receiver = self;
  v5.super_class = (Class)TZFileSystemInterface;
  v2 = [(TZFileSystemInterface *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TZFileSystemInterface *)v2 cacheTZLatestDestination];
  }
  return v3;
}

- (NSURL)currentZoneinfoLinkURL
{
  return (NSURL *)[NSURL fileURLWithPath:@"/var/db/timezone/zoneinfo" isDirectory:0];
}

- (NSURL)systemICUDirectoryURL
{
  return (NSURL *)[NSURL fileURLWithPath:@"/usr/share/icu" isDirectory:1];
}

- (NSURL)latestTZLinkURL
{
  return (NSURL *)[NSURL fileURLWithPath:@"/var/db/timezone/tz_latest" isDirectory:0];
}

- (NSURL)systemICUSchemaVersionURL
{
  systemICUSchemaVersionURL = self->_systemICUSchemaVersionURL;
  if (!systemICUSchemaVersionURL)
  {
    v4 = [(TZFileSystemInterface *)self systemICUDirectoryURL];
    objc_super v5 = [v4 URLByAppendingPathComponent:@"icutzformat.txt"];

    if (!v5 && +[TZDLogging canLogMessageAtLevel:0])
    {
      v6 = [(TZFileSystemInterface *)self systemICUDirectoryURL];
      NSLog(&cfstr_SCouldNotObtai.isa, "-[TZFileSystemInterface systemICUSchemaVersionURL]", v6);
    }
    v7 = self->_systemICUSchemaVersionURL;
    self->_systemICUSchemaVersionURL = v5;

    systemICUSchemaVersionURL = self->_systemICUSchemaVersionURL;
  }

  return systemICUSchemaVersionURL;
}

- (NSURL)dataExpansionParentURL
{
  return (NSURL *)[NSURL fileURLWithPath:@"/var/db/timezone/tz/" isDirectory:0];
}

- (void)cacheTZLatestDestination
{
  id v5 = [(TZFileSystemInterface *)self latestTZLinkURL];
  v3 = [(TZFileSystemInterface *)self obtainDestinationOfLinkAtURL:v5];
  latestLinkDestinationAtStartup = self->_latestLinkDestinationAtStartup;
  self->_latestLinkDestinationAtStartup = v3;
}

- (void)resetTemporaryDirectory
{
  if (+[TZDLogging canLogMessageAtLevel:2]) {
    NSLog(&cfstr_SResettingTemp.isa, "-[TZFileSystemInterface resetTemporaryDirectory]");
  }

  [(TZFileSystemInterface *)self setTemporaryDirectory:0];
}

- (TZVersionInfo)systemVersionInfo
{
  systemVersionInfo = self->_systemVersionInfo;
  if (!systemVersionInfo)
  {
    v4 = +[TZVersionInfo versionInfoFromDefaultSystem];
    id v5 = self->_systemVersionInfo;
    self->_systemVersionInfo = v4;

    systemVersionInfo = self->_systemVersionInfo;
  }

  return systemVersionInfo;
}

- (TZVersionInfo)latestVersionInfo
{
  v3 = [(TZFileSystemInterface *)self latestTZLinkURL];
  v4 = [(TZFileSystemInterface *)self obtainDestinationOfLinkAtURL:v3];
  id v5 = +[TZVersionInfo versionInfoFromContainerDirectory:v4];

  if (+[TZDLogging canLogMessageAtLevel:2]) {
    NSLog(&cfstr_SLatestVersion.isa, "-[TZFileSystemInterface latestVersionInfo]", v5);
  }

  return (TZVersionInfo *)v5;
}

- (TZVersionInfo)currentVersionInfo
{
  v3 = [(TZFileSystemInterface *)self currentZoneinfoLinkURL];
  v4 = [(TZFileSystemInterface *)self obtainDestinationOfLinkAtURL:v3];

  if (v4)
  {
    id v5 = [v4 path];
    int v6 = [v5 isEqualToString:@"/usr/share/zoneinfo.default"];

    if (v6)
    {
      if (+[TZDLogging canLogMessageAtLevel:2]) {
        NSLog(&cfstr_SCurrentZonein.isa, "-[TZFileSystemInterface currentVersionInfo]");
      }
      v7 = [(TZFileSystemInterface *)self systemVersionInfo];
    }
    else
    {
      v8 = [v4 path];
      v9 = [v8 stringByDeletingLastPathComponent];

      if (+[TZDLogging canLogMessageAtLevel:2]) {
        NSLog(&cfstr_SCurrentZonein_0.isa, "-[TZFileSystemInterface currentVersionInfo]", v9);
      }
      v10 = [NSURL fileURLWithPath:v9];
      v7 = +[TZVersionInfo versionInfoFromContainerDirectory:v10];
    }
  }
  else
  {
    v7 = 0;
    if (+[TZDLogging canLogMessageAtLevel:0])
    {
      NSLog(&cfstr_SCouldNotObtai_0.isa, "-[TZFileSystemInterface currentVersionInfo]");
      v7 = 0;
    }
  }
  if (+[TZDLogging canLogMessageAtLevel:2]) {
    NSLog(&cfstr_SCurrentVersio.isa, "-[TZFileSystemInterface currentVersionInfo]", v7);
  }

  return (TZVersionInfo *)v7;
}

- (TZVersionInfo)lastInstalledVersionInfo
{
  v3 = [(TZFileSystemInterface *)self latestVersionInfo];
  if (v3) {
    [(TZFileSystemInterface *)self latestVersionInfo];
  }
  else {
  v4 = [(TZFileSystemInterface *)self currentVersionInfo];
  }
  if (+[TZDLogging canLogMessageAtLevel:2]) {
    NSLog(&cfstr_SLastInstalled.isa, "-[TZFileSystemInterface lastInstalledVersionInfo]", v4);
  }

  return (TZVersionInfo *)v4;
}

- (NSString)systemICUTZSchemaVersion
{
  p_systemICUTZSchemaVersion = &self->_systemICUTZSchemaVersion;
  if (self->_systemICUTZSchemaVersion)
  {
LABEL_2:
    id v3 = 0;
    goto LABEL_11;
  }
  id v5 = [(TZFileSystemInterface *)self systemICUSchemaVersionURL];

  if (!v5)
  {
    id v3 = 0;
    if (!+[TZDLogging canLogMessageAtLevel:0]) {
      goto LABEL_11;
    }
    NSLog(&cfstr_SCouldNotGetTz.isa, "-[TZFileSystemInterface systemICUTZSchemaVersion]");
    goto LABEL_2;
  }
  int v6 = [(TZFileSystemInterface *)self systemICUSchemaVersionURL];
  id v10 = 0;
  v7 = +[TZUtilities stringWithContentsOfFileAtURL:v6 error:&v10];
  id v3 = v10;

  if (v7)
  {
    objc_storeStrong((id *)p_systemICUTZSchemaVersion, v7);
  }
  else if (+[TZDLogging canLogMessageAtLevel:0])
  {
    NSLog(&cfstr_SCouldNotGetSy.isa, "-[TZFileSystemInterface systemICUTZSchemaVersion]", v3);
  }

LABEL_11:
  v8 = *p_systemICUTZSchemaVersion;

  return v8;
}

- (id)obtainDestinationOfLinkAtURL:(id)a3
{
  id v3 = a3;
  if (+[TZUtilities fileExistsAndIsSymbolicLinkAtURL:v3])
  {
    v4 = [MEMORY[0x263F08850] defaultManager];
    id v5 = [v3 path];
    id v11 = 0;
    int v6 = [v4 destinationOfSymbolicLinkAtPath:v5 error:&v11];
    id v7 = v11;

    BOOL v8 = +[TZDLogging canLogMessageAtLevel:0];
    if (v6)
    {
      if (v8) {
        NSLog(&cfstr_SDestinationOf.isa, "-[TZFileSystemInterface obtainDestinationOfLinkAtURL:]", v6);
      }
      v9 = [NSURL fileURLWithPath:v6];
    }
    else
    {
      if (v8) {
        NSLog(&cfstr_SCannotGetDest.isa, "-[TZFileSystemInterface obtainDestinationOfLinkAtURL:]", v7);
      }
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSURL)cachedTZDataLocation
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCachedTZDataLocation:(id)a3
{
}

- (NSURL)latestTZDataLink
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLatestTZDataLink:(id)a3
{
}

- (NSURL)dataExpansionVersionDirectory
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDataExpansionVersionDirectory:(id)a3
{
}

- (NSURL)latestLinkDestinationAtStartup
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (NSURL)temporaryDirectory
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTemporaryDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong((id *)&self->_latestLinkDestinationAtStartup, 0);
  objc_storeStrong((id *)&self->_dataExpansionVersionDirectory, 0);
  objc_storeStrong((id *)&self->_latestTZDataLink, 0);
  objc_storeStrong((id *)&self->_cachedTZDataLocation, 0);
  objc_storeStrong((id *)&self->_systemVersionInfo, 0);
  objc_storeStrong((id *)&self->_lastInstalledVersionInfo, 0);
  objc_storeStrong((id *)&self->_currentVersionInfo, 0);
  objc_storeStrong((id *)&self->_latestVersionInfo, 0);
  objc_storeStrong((id *)&self->_systemICUTZSchemaVersion, 0);

  objc_storeStrong((id *)&self->_systemICUSchemaVersionURL, 0);
}

@end