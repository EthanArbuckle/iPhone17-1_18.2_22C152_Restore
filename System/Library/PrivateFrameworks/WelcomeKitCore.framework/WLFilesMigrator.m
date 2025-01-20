@interface WLFilesMigrator
+ (id)contentType;
- (BOOL)accountBased;
- (BOOL)storeRecordDataInDatabase;
- (BOOL)wantsSegmentedDownloads;
- (NSString)rootPath;
- (WLFeaturePayload)featurePayload;
- (WLFilesMigrator)init;
- (id)contentType;
- (id)dataType;
- (id)importWillBegin;
- (void)addWorkingTime:(unint64_t)a3;
- (void)enable;
- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6;
- (void)setEstimatedDataSize:(unint64_t)a3;
- (void)setFeaturePayload:(id)a3;
- (void)setRootPath:(id)a3;
- (void)setState:(id)a3;
@end

@implementation WLFilesMigrator

- (WLFilesMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)WLFilesMigrator;
  v2 = [(WLFilesMigrator *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(WLFileProvider);
    v4 = [(WLFileProvider *)v3 fetchRootPath];

    if (v4) {
      [(WLFilesMigrator *)v2 setRootPath:v4];
    }
    else {
      _WLLog();
    }
  }
  return v2;
}

- (void)enable
{
  p_featurePayload = &self->_featurePayload;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setEnabled:1];

  id v4 = objc_loadWeakRetained((id *)p_featurePayload);
  [v4 setState:@"enabled"];
}

- (void)setState:(id)a3
{
  p_featurePayload = &self->_featurePayload;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_featurePayload);
  [WeakRetained setState:v4];
}

- (void)setEstimatedDataSize:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:a3];
}

- (void)addWorkingTime:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  objc_msgSend(WeakRetained, "setElapsedTime:", objc_msgSend(WeakRetained, "elapsedTime") + a3);
}

- (BOOL)accountBased
{
  return 0;
}

+ (id)contentType
{
  return @"files/binary";
}

- (id)contentType
{
  return +[WLFilesMigrator contentType];
}

- (id)dataType
{
  return @"files";
}

- (BOOL)storeRecordDataInDatabase
{
  return 0;
}

- (BOOL)wantsSegmentedDownloads
{
  return 1;
}

- (id)importWillBegin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  [WeakRetained setSize:0];

  return 0;
}

- (void)importRecordData:(id)a3 summary:(id)a4 account:(id)a5 completion:(id)a6
{
  v69[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = (void (**)(id, uint64_t, void))a6;
  if ([v8 itemSize] && self->_rootPath)
  {
    v10 = [v8 bucket];

    if (v10)
    {
      v11 = [v8 bucket];
      v12 = [v11 pathComponents];

      if ((unint64_t)[v12 count] > 1)
      {
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        v52 = v12;
        id v21 = v12;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v65 count:16];
        if (!v22)
        {
LABEL_20:

          id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
          objc_msgSend(WeakRetained, "setCount:", objc_msgSend(WeakRetained, "count") + 1);

          id v28 = objc_loadWeakRetained((id *)&self->_featurePayload);
          objc_msgSend(v28, "setSize:", objc_msgSend(v28, "size") + objc_msgSend(v8, "itemSize"));

          v16 = [v8 dataFilePath];
          rootPath = self->_rootPath;
          v30 = [v8 bucket];
          v31 = [(NSString *)rootPath stringByAppendingPathComponent:v30];

          v32 = [v31 stringByDeletingLastPathComponent];
          v33 = [MEMORY[0x263F08850] defaultManager];
          char v34 = [v33 fileExistsAtPath:v32];

          if ((v34 & 1) != 0
            || ([MEMORY[0x263F08850] defaultManager],
                v35 = objc_claimAutoreleasedReturnValue(),
                id v54 = 0,
                [v35 createDirectoryAtPath:v32 withIntermediateDirectories:1 attributes:0 error:&v54], id v36 = v54, v35, !v36))
          {
            v44 = [MEMORY[0x263F08850] defaultManager];
            char v45 = [v44 fileExistsAtPath:v31];

            if ((v45 & 1) != 0
              || ([MEMORY[0x263F08850] defaultManager],
                  v46 = objc_claimAutoreleasedReturnValue(),
                  id v53 = 0,
                  [v46 moveItemAtPath:v16 toPath:v31 error:&v53],
                  id v36 = v53,
                  v46,
                  !v36))
            {
              if (v9) {
                v9[2](v9, 1, 0);
              }
              id v36 = 0;
            }
            else
            {
              _WLLog();
              if (v9)
              {
                v47 = (void *)MEMORY[0x263F087E8];
                uint64_t v48 = *MEMORY[0x263F86308];
                uint64_t v59 = *MEMORY[0x263F08320];
                v60 = @"NSFileManager could not move a file.";
                v49 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
                v50 = [v47 errorWithDomain:v48 code:1 userInfo:v49];

                ((void (**)(id, uint64_t, void *))v9)[2](v9, 1, v50);
              }
            }
          }
          else
          {
            _WLLog();
            if (v9)
            {
              v37 = (void *)MEMORY[0x263F087E8];
              uint64_t v38 = *MEMORY[0x263F86308];
              uint64_t v61 = *MEMORY[0x263F08320];
              v62 = @"NSFileManager could not create a directory with intermediate directories.";
              v39 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
              v40 = [v37 errorWithDomain:v38 code:1 userInfo:v39];

              ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v40);
            }
          }
          v12 = v52;

          goto LABEL_35;
        }
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v56;
        id v51 = v8;
LABEL_13:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v56 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v55 + 1) + 8 * v25);
          if ((objc_msgSend(v26, "isEqualToString:", @"..", v51) & 1) != 0
            || ([v26 isEqualToString:@"~"] & 1) != 0)
          {
            break;
          }
          if (v23 == ++v25)
          {
            uint64_t v23 = [v21 countByEnumeratingWithState:&v55 objects:v65 count:16];
            id v8 = v51;
            if (v23) {
              goto LABEL_13;
            }
            goto LABEL_20;
          }
        }

        _WLLog();
        id v8 = v51;
        v12 = v52;
        if (!v9) {
          goto LABEL_36;
        }
        v41 = (void *)MEMORY[0x263F087E8];
        uint64_t v42 = *MEMORY[0x263F86310];
        uint64_t v63 = *MEMORY[0x263F08320];
        v64 = @"WLFilesMigrator cannot move a file to a restricted path.";
        v43 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        v16 = [v41 errorWithDomain:v42 code:6 userInfo:v43];
      }
      else
      {
        _WLLog();
        if (!v9)
        {
LABEL_36:

          goto LABEL_37;
        }
        v13 = (void *)MEMORY[0x263F087E8];
        uint64_t v14 = *MEMORY[0x263F86310];
        uint64_t v66 = *MEMORY[0x263F08320];
        v67 = @"WLFilesMigrator cannot move a file to a restricted path.";
        v15 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        v16 = [v13 errorWithDomain:v14 code:6 userInfo:v15];
      }
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v16);
LABEL_35:

      goto LABEL_36;
    }
    _WLLog();
    if (v9)
    {
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F86308];
      uint64_t v68 = *MEMORY[0x263F08320];
      v69[0] = @"Bucket is not specified and it can not import the file.";
      v19 = [NSDictionary dictionaryWithObjects:v69 forKeys:&v68 count:1];
      v20 = [v17 errorWithDomain:v18 code:1 userInfo:v19];

      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v20);
    }
  }
  else
  {
    _WLLog();
    if (v9) {
      v9[2](v9, 1, 0);
    }
  }
LABEL_37:
}

- (WLFeaturePayload)featurePayload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_featurePayload);
  return (WLFeaturePayload *)WeakRetained;
}

- (void)setFeaturePayload:(id)a3
{
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_destroyWeak((id *)&self->_featurePayload);
}

@end