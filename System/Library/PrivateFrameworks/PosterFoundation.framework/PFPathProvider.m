@interface PFPathProvider
+ (PFPathProvider)scopedCurrentContainer;
+ (PFPathProvider)scopedSystemContainerForCurrentProcess;
+ (id)providerFromProvider:(id)a3;
- (NSURL)cachesPath;
- (NSURL)defaultPath;
- (NSURL)libraryPath;
- (id)initFromProvider:(id)a3;
- (id)providerByAppendingPathComponent:(id)a3;
- (void)setCachesPath:(id)a3;
- (void)setDefaultPath:(id)a3;
- (void)setLibraryPath:(id)a3;
@end

@implementation PFPathProvider

+ (PFPathProvider)scopedCurrentContainer
{
  v2 = [PFPathProvider alloc];
  v3 = [MEMORY[0x263F29C98] pathProviderForCurrentContainer];
  id v4 = [(PFPathProvider *)v2 initFromProvider:v3];

  v5 = [v4 providerByAppendingPathComponent:@"com.apple.PaperBoardUI"];

  return (PFPathProvider *)v5;
}

+ (PFPathProvider)scopedSystemContainerForCurrentProcess
{
  v2 = [MEMORY[0x263F29BE0] tokenForCurrentProcess];
  int v3 = [v2 hasEntitlement:@"com.apple.security.system-container"];

  if (v3)
  {
    id v4 = [MEMORY[0x263F29C98] pathProviderForSystemContainerForCurrentProcess];
    v5 = v4;
    if (v4)
    {
      v6 = [v4 defaultPath];

      if (v6)
      {
        id v7 = [[PFPathProvider alloc] initFromProvider:v5];
        v6 = [v7 providerByAppendingPathComponent:@"com.apple.PaperBoardUI"];
      }
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  return (PFPathProvider *)v6;
}

+ (id)providerFromProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = (id)[objc_alloc((Class)a1) initFromProvider:v6];
  }
  v10 = v9;

  return v10;
}

- (id)initFromProvider:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PFPathProvider;
  uint64_t v5 = [(PFPathProvider *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 defaultPath];
    defaultPath = v5->_defaultPath;
    v5->_defaultPath = (NSURL *)v6;

    uint64_t v8 = [v4 libraryPath];
    libraryPath = v5->_libraryPath;
    v5->_libraryPath = (NSURL *)v8;

    uint64_t v10 = [v4 cachesPath];
    cachesPath = v5->_cachesPath;
    v5->_cachesPath = (NSURL *)v10;
  }
  return v5;
}

- (id)providerByAppendingPathComponent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(PFPathProvider);
  uint64_t v6 = [(NSURL *)self->_defaultPath URLByAppendingPathComponent:v4 isDirectory:1];
  [(PFPathProvider *)v5 setDefaultPath:v6];

  id v7 = [(NSURL *)self->_libraryPath URLByAppendingPathComponent:v4 isDirectory:1];
  [(PFPathProvider *)v5 setLibraryPath:v7];

  uint64_t v8 = [(NSURL *)self->_cachesPath URLByAppendingPathComponent:v4 isDirectory:1];

  [(PFPathProvider *)v5 setCachesPath:v8];
  return v5;
}

- (NSURL)defaultPath
{
  return self->_defaultPath;
}

- (void)setDefaultPath:(id)a3
{
}

- (NSURL)libraryPath
{
  return self->_libraryPath;
}

- (void)setLibraryPath:(id)a3
{
}

- (NSURL)cachesPath
{
  return self->_cachesPath;
}

- (void)setCachesPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachesPath, 0);
  objc_storeStrong((id *)&self->_libraryPath, 0);
  objc_storeStrong((id *)&self->_defaultPath, 0);
}

@end