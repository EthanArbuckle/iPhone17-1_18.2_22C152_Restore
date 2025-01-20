@interface MICandidateAppContainer
- (BOOL)isPlaceholder;
- (NSURL)appURL;
- (void)setAppURL:(id)a3;
@end

@implementation MICandidateAppContainer

- (NSURL)appURL
{
  appURL = self->_appURL;
  if (!appURL)
  {
    id v4 = [(MICandidateContainer *)self rootURL];
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    id v19 = 0;
    v5 = [MEMORY[0x1E4F6F5B8] defaultManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = ___AppURLInContainer_block_invoke;
    v13[3] = &unk_1E60C4E40;
    v13[4] = &v14;
    v6 = [v5 enumerateURLsForItemsInDirectoryAtURL:v4 ignoreSymlinks:1 withBlock:v13];
    v7 = v15;
    if (v6 && !v15[5] && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      v12 = [v4 path];
      MOLogWrite();

      v7 = v15;
    }
    v8 = (NSURL *)(id)v7[5];

    _Block_object_dispose(&v14, 8);
    v9 = self->_appURL;
    self->_appURL = v8;

    appURL = self->_appURL;
  }
  v10 = appURL;
  return v10;
}

- (BOOL)isPlaceholder
{
  v2 = [(MICandidateAppContainer *)self appURL];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F6F5B8] defaultManager];
    char v4 = [v3 bundleAtURLIsPlaceholder:v2];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)setAppURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end