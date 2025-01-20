@interface WLAsset
- (BOOL)download;
- (NSString)localFile;
- (NSString)name;
- (NSString)remoteURL;
- (WLAsset)initWithName:(id)a3 remoteURL:(id)a4;
- (void)setLocalFile:(id)a3;
- (void)setName:(id)a3;
- (void)setRemoteURL:(id)a3;
@end

@implementation WLAsset

- (WLAsset)initWithName:(id)a3 remoteURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WLAsset;
  v8 = [(WLAsset *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(WLAsset *)v8 setName:v6];
    [(WLAsset *)v9 setRemoteURL:v7];
    v10 = [@"/Library/WelcomeKit/Downloads/" stringByAppendingPathComponent:v6];
    v11 = NSHomeDirectory();
    v12 = [v11 stringByAppendingPathComponent:v10];
    [(WLAsset *)v9 setLocalFile:v12];
  }
  return v9;
}

- (BOOL)download
{
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(NSString *)self->_localFile stringByDeletingLastPathComponent];
  if (([v3 fileExistsAtPath:v4] & 1) != 0
    || (v54[0] = 0,
        [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:v54],
        (id v5 = v54[0]) == 0))
  {
    if ([v3 fileExistsAtPath:self->_localFile])
    {
      BOOL v7 = 1;
      _WLLog();
    }
    else
    {
      v8 = [NSURL URLWithString:self->_remoteURL];
      v9 = [MEMORY[0x263F08BD8] requestWithURL:v8];
      v10 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
      v11 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v10];
      dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
      uint64_t v50 = 0;
      v51 = &v50;
      uint64_t v52 = 0x2020000000;
      char v53 = 0;
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x3032000000;
      v47 = __Block_byref_object_copy_;
      v48 = __Block_byref_object_dispose_;
      id v49 = 0;
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x2020000000;
      uint64_t v43 = 0;
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x3032000000;
      v37 = __Block_byref_object_copy_;
      v38 = __Block_byref_object_dispose_;
      id v39 = 0;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __19__WLAsset_download__block_invoke;
      v28[3] = &unk_2648708E0;
      v30 = &v44;
      v31 = &v40;
      v32 = &v34;
      v33 = &v50;
      v13 = v12;
      v29 = v13;
      v26 = v11;
      objc_super v14 = [v11 downloadTaskWithRequest:v9 completionHandler:v28];
      [v14 resume];
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v23 = v45[5];
      uint64_t v24 = v35[5];
      uint64_t v21 = *((unsigned __int8 *)v51 + 24);
      uint64_t v22 = v41[3];
      _WLLog();
      if (*((unsigned char *)v51 + 24))
      {
        v25 = v10;
        v15 = v9;
        v16 = v8;
        uint64_t v17 = v35[5];
        v18 = objc_msgSend(NSURL, "fileURLWithPath:", self->_localFile, v21, v22, v23, v24);
        id v27 = 0;
        LOBYTE(v17) = [v3 moveItemAtURL:v17 toURL:v18 error:&v27];
        id v19 = v27;
        *((unsigned char *)v51 + 24) = v17;

        if (!*((unsigned char *)v51 + 24) || v19) {
          _WLLog();
        }

        BOOL v7 = *((unsigned char *)v51 + 24) != 0;
        v8 = v16;
        v9 = v15;
        v10 = v25;
      }
      else
      {
        BOOL v7 = 0;
      }

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v40, 8);
      _Block_object_dispose(&v44, 8);

      _Block_object_dispose(&v50, 8);
    }
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
    _WLLog();
    BOOL v7 = 0;
  }

  return v7;
}

void __19__WLAsset_download__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v8 statusCode];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  if (v9) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = (unint64_t)([v8 statusCode] - 200) < 0x64;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)localFile
{
  return self->_localFile;
}

- (void)setLocalFile:(id)a3
{
}

- (NSString)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_localFile, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end