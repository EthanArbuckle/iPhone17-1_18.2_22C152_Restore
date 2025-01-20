@interface SKDiskImage
+ (id)createBlankAt:(id)a3 params:(id)a4 error:(id *)a5;
+ (id)diskImageConvertFromParamsAt:(id)a3 params:(id)a4 error:(id *)a5;
+ (id)diskImageUnsafeWithURL:(id)a3 params:(id)a4 error:(id *)a5;
+ (id)diskImageWithURL:(id)a3 params:(id)a4 error:(id *)a5;
- (BOOL)attachBeforeResizeWithStdinPass:(BOOL)a3 error:(id *)a4;
- (BOOL)ejectWithError:(id *)a3;
- (BOOL)isAttached;
- (BOOL)resizeWithParams:(id)a3 progress:(id)a4 error:(id *)a5;
- (BOOL)retrieveDIInfoWithParams:(id)a3 error:(id *)a4;
- (DIBaseParams)diParams;
- (DIDeviceHandle)deviceHandle;
- (NSURL)imageURL;
- (SKDiskImage)initWithURL:(id)a3 diParams:(id)a4 error:(id *)a5;
- (SKDiskImage)initWithURL:(id)a3 error:(id *)a4;
- (id)attachNoMountWithError:(id *)a3;
- (id)attachWithError:(id *)a3;
- (id)attachWithParams:(id)a3 error:(id *)a4;
- (id)deduceDiskWithError:(id *)a3;
- (id)description;
- (id)diAttachWithParams:(id)a3 error:(id *)a4;
- (id)mount:(id)a3 params:(id)a4 outError:(id *)a5;
- (id)newResizerWithParams:(id)a3 error:(id *)a4;
- (id)newShallowResizerWithParams:(id)a3 error:(id *)a4;
- (id)redactedDescription;
- (id)resizeLimitsInternalWithLimitsParams:(id)a3 error:(id *)a4;
- (id)resizeLimitsShallowInternalWithLimitsParams:(id)a3 error:(id *)a4;
- (id)resizeLimitsWithError:(id *)a3;
- (id)resizeLimitsWithLimitsParams:(id)a3 error:(id *)a4;
- (id)resizeWithParams:(id)a3 completionBlock:(id)a4;
- (id)retrieveInfoWithParams:(id)a3 error:(id *)a4;
- (unint64_t)diResize:(id)a3 error:(id *)a4;
- (void)resize:(id)a3 completionBlock:(id)a4;
- (void)setDeviceHandle:(id)a3;
- (void)setDiParams:(id)a3;
@end

@implementation SKDiskImage

+ (id)diskImageWithURL:(id)a3 params:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = [a1 diskImageUnsafeWithURL:v8 params:v9 error:a5];
  }
  else
  {
    v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    v10 = +[SKError nilWithError:v11 error:a5];
  }

  return v10;
}

id __45__SKDiskImage_diskImageWithURL_params_error___block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKDiskImage.m", 95);
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

+ (id)diskImageUnsafeWithURL:(id)a3 params:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = (char *)a3;
  id v9 = a4;
  v10 = [v9 source];

  if (!v10)
  {
    if ((unint64_t)[v9 numBlocks] <= 0x4F)
    {
      v12 = +[SKError nilWithPOSIXCode:28 error:a5];
      goto LABEL_48;
    }
    v15 = [a1 createBlankAt:v8 params:v9 error:a5];
    if (!v15)
    {
      v24 = SKGetOSLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        if (a5) {
          v25 = (__CFString *)*a5;
        }
        else {
          v25 = &stru_26F313B30;
        }
        int v33 = 136315394;
        v34 = "+[SKDiskImage diskImageUnsafeWithURL:params:error:]";
        __int16 v35 = 2112;
        v36 = v25;
        _os_log_impl(&dword_23F40C000, v24, OS_LOG_TYPE_ERROR, "%s: Failed to create blank disk image %@", (uint8_t *)&v33, 0x16u);
      }

      id v22 = 0;
      goto LABEL_45;
    }
    v16 = (void *)[objc_alloc((Class)a1) initWithURL:v8 diParams:v15 error:a5];
    if (!v16)
    {
      v26 = SKGetOSLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        if (a5) {
          v27 = (__CFString *)*a5;
        }
        else {
          v27 = &stru_26F313B30;
        }
        int v33 = 136315394;
        v34 = "+[SKDiskImage diskImageUnsafeWithURL:params:error:]";
        __int16 v35 = 2112;
        v36 = v27;
        _os_log_impl(&dword_23F40C000, v26, OS_LOG_TYPE_ERROR, "%s: Failed to create disk image %@", (uint8_t *)&v33, 0x16u);
      }

      int v23 = 1;
LABEL_43:
      v31 = [MEMORY[0x263F08850] defaultManager];
      [v31 removeItemAtURL:v8 error:0];

      id v22 = 0;
LABEL_44:
      if (!v23)
      {
        id v22 = v22;
        v12 = v22;
        goto LABEL_47;
      }
LABEL_45:
      v12 = 0;
LABEL_47:

      goto LABEL_48;
    }
    v17 = objc_alloc_init(SKDiskImageAttachParams);
    [(SKDiskImageAttachParams *)v17 setPolicy:0];
    [(SKDiskImageAttachParams *)v17 setIsManagedAttach:1];
    v18 = [v16 attachWithParams:v17 error:a5];
    v19 = v18;
    if (v18)
    {
      v20 = eraseDisk(v18, v9, a5);

      if (v20)
      {
        [v19 ejectWithError:0];
        v21 = SKGetOSLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 138412290;
          v34 = v8;
          _os_log_impl(&dword_23F40C000, v21, OS_LOG_TYPE_DEFAULT, "Created disk image successfully at %@", (uint8_t *)&v33, 0xCu);
        }

        id v22 = v16;
        int v23 = 0;
LABEL_42:

        if (v22) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }
      v30 = SKGetOSLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        int v33 = 138412290;
        v34 = (const char *)v19;
        _os_log_impl(&dword_23F40C000, v30, OS_LOG_TYPE_ERROR, "Failed to erase %@", (uint8_t *)&v33, 0xCu);
      }

      [v19 ejectWithError:0];
    }
    else
    {
      v28 = SKGetOSLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        if (a5) {
          v29 = (__CFString *)*a5;
        }
        else {
          v29 = &stru_26F313B30;
        }
        int v33 = 136315394;
        v34 = "+[SKDiskImage diskImageUnsafeWithURL:params:error:]";
        __int16 v35 = 2112;
        v36 = v29;
        _os_log_impl(&dword_23F40C000, v28, OS_LOG_TYPE_ERROR, "%s: Failed to attach after create %@", (uint8_t *)&v33, 0x16u);
      }
    }
    id v22 = 0;
    int v23 = 1;
    goto LABEL_42;
  }
  v11 = [v9 diConvertParamsWithOutputURL:v8 error:a5];
  if (v11)
  {
    v12 = [a1 diskImageConvertFromParamsAt:v8 params:v11 error:a5];
  }
  else
  {
    v13 = SKGetOSLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        v14 = (__CFString *)*a5;
      }
      else {
        v14 = &stru_26F313B30;
      }
      int v33 = 136315394;
      v34 = "+[SKDiskImage diskImageUnsafeWithURL:params:error:]";
      __int16 v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_23F40C000, v13, OS_LOG_TYPE_ERROR, "%s: Could not create 'convert params' %@", (uint8_t *)&v33, 0x16u);
    }

    v12 = 0;
  }

LABEL_48:

  return v12;
}

+ (id)diskImageConvertFromParamsAt:(id)a3 params:(id)a4 error:(id *)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([MEMORY[0x263F3A418] convertWithParams:v9 error:a5])
  {
    v10 = (void *)[objc_alloc((Class)a1) initWithURL:v8 diParams:v9 error:a5];
  }
  else
  {
    v11 = SKGetOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        v12 = (__CFString *)*a5;
      }
      else {
        v12 = &stru_26F313B30;
      }
      int v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_ERROR, "Could not convert with %@", (uint8_t *)&v14, 0xCu);
    }

    v10 = 0;
  }

  return v10;
}

+ (id)createBlankAt:(id)a3 params:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v6 = [a4 diCreateParamsWithURL:a3 error:a5];
  if (v6)
  {
    if ([MEMORY[0x263F3A418] createBlankWithParams:v6 error:a5])
    {
      id v7 = v6;
      goto LABEL_16;
    }
    id v8 = SKGetOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        v10 = (__CFString *)*a5;
      }
      else {
        v10 = &stru_26F313B30;
      }
      int v15 = 138412290;
      uint64_t v16 = (const char *)v10;
      v11 = "Failed to create disk image %@";
      v12 = v8;
      uint32_t v13 = 12;
LABEL_14:
      _os_log_impl(&dword_23F40C000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, v13);
    }
  }
  else
  {
    id v8 = SKGetOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (a5) {
        id v9 = (__CFString *)*a5;
      }
      else {
        id v9 = &stru_26F313B30;
      }
      int v15 = 136315394;
      uint64_t v16 = "+[SKDiskImage createBlankAt:params:error:]";
      __int16 v17 = 2112;
      v18 = v9;
      v11 = "%s: Failed to create 'create params' %@";
      v12 = v8;
      uint32_t v13 = 22;
      goto LABEL_14;
    }
  }

  id v7 = 0;
LABEL_16:

  return v7;
}

- (BOOL)isAttached
{
  mach_timespec_t waitTime = (mach_timespec_t)5;
  IOKitWaitQuiet(*MEMORY[0x263F0EC88], &waitTime);
  v3 = [[SKIOObject alloc] initWithClassName:@"AppleDiskImagesController"];
  id v4 = [(SKIOObject *)v3 newIteratorWithOptions:0];
  v5 = [(SKIOObject *)[SKIOMedia alloc] initWithIteratorNext:v4];
  if (v5)
  {
    v6 = v5;
    int v14 = v3;
    while (1)
    {
      if (IOObjectConformsTo([(SKIOObject *)v6 ioObj], "AppleDiskImageDevice"))
      {
        id v7 = [(SKIOObject *)v6 copyPropertyWithClass:objc_opt_class() key:@"DiskImageURL"];
        id v8 = [(SKDiskImage *)self imageURL];
        id v9 = [v8 absoluteString];
        int v10 = [v7 isEqualToString:v9];

        if (v10) {
          break;
        }
      }
      v11 = [(SKIOObject *)[SKIOMedia alloc] initWithIteratorNext:v4];

      v6 = v11;
      if (!v11)
      {
        BOOL v12 = 0;
        goto LABEL_9;
      }
    }
    BOOL v12 = 1;
LABEL_9:
    v3 = v14;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (SKDiskImage)initWithURL:(id)a3 error:(id *)a4
{
  return [(SKDiskImage *)self initWithURL:a3 diParams:0 error:a4];
}

- (SKDiskImage)initWithURL:(id)a3 diParams:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SKDiskImage;
  v11 = [(SKDiskImage *)&v18 init];
  if ([v9 isFileURL]
    && ([MEMORY[0x263F08850] defaultManager],
        BOOL v12 = objc_claimAutoreleasedReturnValue(),
        [v9 path],
        uint32_t v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v12 fileExistsAtPath:v13],
        v13,
        v12,
        (v14 & 1) == 0))
  {
    int v15 = +[SKError nilWithSKErrorCode:253 error:a5];
  }
  else
  {
    if (v11)
    {
      objc_storeStrong((id *)&v11->_imageURL, a3);
      objc_storeStrong((id *)&v11->_diParams, a4);
    }
    int v15 = v11;
  }
  uint64_t v16 = v15;

  return v16;
}

- (id)attachWithError:(id *)a3
{
  v5 = objc_opt_new();
  v6 = [(SKDiskImage *)self attachWithParams:v5 error:a3];

  return v6;
}

- (id)attachNoMountWithError:(id *)a3
{
  v5 = objc_opt_new();
  [v5 setPolicy:0];
  v6 = [(SKDiskImage *)self attachWithParams:v5 error:a3];

  return v6;
}

- (id)attachWithParams:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v6 = a3;
  if (v6)
  {
    id v7 = SKGetOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(SKDiskImage *)self imageURL];
      int v18 = 138412546;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_23F40C000, v7, OS_LOG_TYPE_DEFAULT, "Attaching %@ with %@", (uint8_t *)&v18, 0x16u);
    }
    id v9 = [(SKDiskImage *)self diAttachWithParams:v6 error:a4];
    if (v9)
    {
      id v10 = [(SKDiskImage *)self mount:v9 params:v6 outError:a4];
      if (v10)
      {
        v11 = SKGetOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v12 = [(SKDiskImage *)self imageURL];
          int v18 = 138412546;
          uint64_t v19 = v12;
          __int16 v20 = 2112;
          v21 = v10;
          _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_DEFAULT, "Attached disk image %@ to %@ device successfully", (uint8_t *)&v18, 0x16u);
        }
        id v10 = v10;
        uint32_t v13 = v10;
      }
      else
      {
        uint64_t v16 = SKGetOSLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136315394;
          uint64_t v19 = "-[SKDiskImage attachWithParams:error:]";
          __int16 v20 = 2112;
          v21 = v9;
          _os_log_impl(&dword_23F40C000, v16, OS_LOG_TYPE_ERROR, "%s: Couldn't mount disk %@", (uint8_t *)&v18, 0x16u);
        }

        uint32_t v13 = 0;
      }
    }
    else
    {
      id v10 = SKGetOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = [(SKDiskImage *)self imageURL];
        int v18 = 136315394;
        uint64_t v19 = "-[SKDiskImage attachWithParams:error:]";
        __int16 v20 = 2112;
        v21 = v15;
        _os_log_impl(&dword_23F40C000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to attach %@", (uint8_t *)&v18, 0x16u);
      }
      uint32_t v13 = 0;
    }
  }
  else
  {
    char v14 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    uint32_t v13 = +[SKError nilWithError:v14 error:a4];
  }

  return v13;
}

id __38__SKDiskImage_attachWithParams_error___block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKDiskImage.m", 239);
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

- (BOOL)retrieveDIInfoWithParams:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SKDiskImage *)self diParams];

  id v8 = objc_alloc(MEMORY[0x263F3A408]);
  if (v7)
  {
    id v9 = [(SKDiskImage *)self diParams];
    uint64_t v10 = [v8 initWithExistingParams:v9 error:a4];
  }
  else
  {
    id v9 = [(SKDiskImage *)self imageURL];
    uint64_t v10 = [v8 initWithURL:v9 error:a4];
  }
  v11 = (void *)v10;

  if (!v11)
  {
LABEL_13:
    BOOL v16 = 0;
    goto LABEL_14;
  }
  int v12 = [v6 stdinPassPhrase];
  uint64_t v13 = [v11 readPassphraseFlags];
  if (v12) {
    uint64_t v14 = v13 | 8;
  }
  else {
    uint64_t v14 = v13;
  }
  [v11 setReadPassphraseFlags:v14];
  objc_msgSend(v11, "setExtraInfo:", objc_msgSend(v6, "extraInfo"));
  if (([MEMORY[0x263F3A418] retrieveInfoWithParams:v11 error:a4] & 1) == 0)
  {
    __int16 v17 = SKGetOSLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_23F40C000, v17, OS_LOG_TYPE_ERROR, "Failed to retrieve image info", v19, 2u);
    }

    goto LABEL_13;
  }
  [(SKDiskImage *)self setDiParams:v11];
  int v15 = [v11 imageInfo];
  [v6 setImageInfo:v15];

  BOOL v16 = 1;
LABEL_14:

  return v16;
}

- (id)retrieveInfoWithParams:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(SKDiskImage *)self retrieveDIInfoWithParams:v6 error:a4])
  {
    id v7 = objc_opt_new();
    id v8 = v7;
    if (v7)
    {
      [v7 setReadOnly:1];
      [v8 setIsManagedAttach:1];
      [v8 setPolicy:0];
      id v9 = [(SKDiskImage *)self attachWithParams:v8 error:a4];
      if (v9)
      {
        uint64_t v10 = [v6 getInfoDictWithDisk:v9];
        if (!v10)
        {
          uint64_t v10 = +[SKError nilWithSKErrorCode:254 error:a4];
        }
      }
      else
      {
        v11 = SKGetOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v13 = 136315138;
          uint64_t v14 = "-[SKDiskImage retrieveInfoWithParams:error:]";
          _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_ERROR, "%s: Attach failed", (uint8_t *)&v13, 0xCu);
        }

        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = +[SKError nilWithSKErrorCode:251 error:a4];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)diAttachWithParams:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id obj = 0;
  id v7 = SKGetOSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [(SKDiskImage *)self imageURL];
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = v8;
    __int16 v38 = 2112;
    id v39 = v6;
    _os_log_impl(&dword_23F40C000, v7, OS_LOG_TYPE_DEBUG, "Attaching %@ with %@", buf, 0x16u);
  }
  id v9 = [(SKDiskImage *)self diParams];

  if (v9)
  {
    uint64_t v10 = SKGetOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F40C000, v10, OS_LOG_TYPE_DEBUG, "Using saved instance of di2 params", buf, 2u);
    }

    v11 = [(SKDiskImage *)self diParams];
    id v34 = 0;
    int v12 = [v6 diAttachParamsWithExistingParams:v11 error:&v34];
    id v13 = v34;

    if (v12) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v14 = [(SKDiskImage *)self imageURL];
    id v33 = 0;
    int v12 = [v6 diAttachParamsWithURL:v14 error:&v33];
    id v13 = v33;

    [(SKDiskImage *)self setDiParams:v12];
    if (v12) {
      goto LABEL_13;
    }
  }
  if ([v13 code] == 45)
  {
    uint64_t v15 = SKGetOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = [(SKDiskImage *)self imageURL];
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v16;
      __int16 v38 = 2112;
      id v39 = v6;
      _os_log_impl(&dword_23F40C000, v15, OS_LOG_TYPE_DEFAULT, "Fallback attaching %@ with %@", buf, 0x16u);
    }
    __int16 v17 = (void *)MEMORY[0x263F3A3D8];
    int v18 = [(SKDiskImage *)self imageURL];
    id v32 = 0;
    int v19 = objc_msgSend(v17, "diskImageAttach:readOnly:autoMount:BSDName:error:", v18, objc_msgSend(v6, "readOnly"), 0, &v32, a4);
    id v20 = v32;

LABEL_26:
    v26 = 0;
    if (v19 && v20)
    {
      v26 = objc_opt_new();
      id obj = v26;
      [v26 setBSDName:v20];
    }

    if (v19) {
      goto LABEL_30;
    }
    goto LABEL_33;
  }
LABEL_13:
  if (a4 && v13) {
    *a4 = v13;
  }
  v21 = SKGetOSLog();
  uint64_t v22 = v21;
  if (!v12)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v37 = "-[SKDiskImage diAttachWithParams:error:]";
      _os_log_impl(&dword_23F40C000, v22, OS_LOG_TYPE_ERROR, "%s: Failed to create attach params", buf, 0xCu);
    }

    goto LABEL_36;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = [(SKDiskImage *)self imageURL];
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = v23;
    __int16 v38 = 2112;
    id v39 = v12;
    _os_log_impl(&dword_23F40C000, v22, OS_LOG_TYPE_DEFAULT, "Attaching %@ with %@", buf, 0x16u);
  }
  if (![v6 isManagedAttach])
  {
    id v31 = 0;
    int v19 = [MEMORY[0x263F3A3D8] diskImageAttach:v12 BSDName:&v31 error:a4];
    id v20 = v31;
    goto LABEL_26;
  }
  v24 = [v6 mountParams];
  v25 = [v24 mountPoint];
  [v12 setUniqueDevice:v25 != 0];

  if (![MEMORY[0x263F3A418] managedAttachWithParams:v12 handle:&obj error:a4])
  {
LABEL_33:
    v29 = SKGetOSLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F40C000, v29, OS_LOG_TYPE_ERROR, "Failed to attach disk image", buf, 2u);
    }

LABEL_36:
    v28 = 0;
    goto LABEL_37;
  }
  v26 = obj;
LABEL_30:
  objc_storeStrong((id *)&self->_deviceHandle, v26);
  v27 = SKGetOSLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v37 = (const char *)obj;
    _os_log_impl(&dword_23F40C000, v27, OS_LOG_TYPE_DEFAULT, "Attached device %@", buf, 0xCu);
  }

  v28 = [(SKDiskImage *)self deduceDiskWithError:a4];
LABEL_37:

  return v28;
}

- (id)deduceDiskWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = +[SKManager syncSharedManager];
  id v6 = [(SKDiskImage *)self deviceHandle];

  if (v6)
  {
    id v7 = [(SKDiskImage *)self deviceHandle];
    id v8 = [v7 BSDName];
    id v9 = [v5 diskForString:v8];

    if (v9)
    {
      id v10 = v9;
    }
    else
    {
      int v12 = SKGetOSLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = [(SKDiskImage *)self deviceHandle];
        uint64_t v14 = [v13 BSDName];
        int v16 = 138412290;
        __int16 v17 = v14;
        _os_log_impl(&dword_23F40C000, v12, OS_LOG_TYPE_ERROR, "Couldn't discover disk %@ after attach", (uint8_t *)&v16, 0xCu);
      }
      id v10 = +[SKError nilWithSKErrorCode:251 error:a3];
    }
    v11 = v10;
  }
  else
  {
    v11 = +[SKError nilWithSKErrorCode:251 error:a3];
  }

  return v11;
}

- (BOOL)ejectWithError:(id *)a3
{
  id v4 = -[SKDiskImage deduceDiskWithError:](self, "deduceDiskWithError:");
  v5 = v4;
  if (v4) {
    char v6 = [v4 ejectWithError:a3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)mount:(id)a3 params:(id)a4 outError:(id *)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 policy];
  switch(v9)
  {
    case 2:
      v11 = SKGetOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        id v19 = v7;
        __int16 v20 = 2112;
        id v21 = v8;
        _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_DEFAULT, "Mounting disk %@ with %@", (uint8_t *)&v18, 0x16u);
      }

      int v12 = [v8 mountParams];
      char v13 = [v7 mountWithParams:v12 error:a5];

      if ((v13 & 1) == 0)
      {
        [v7 ejectWithError:0];
        uint64_t v14 = 0;
        goto LABEL_14;
      }
      goto LABEL_12;
    case 1:
      uint64_t v15 = SKGetOSLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        id v19 = v7;
        __int16 v20 = 2112;
        id v21 = v8;
        _os_log_impl(&dword_23F40C000, v15, OS_LOG_TYPE_DEFAULT, "Mounting disk %@ with %@", (uint8_t *)&v18, 0x16u);
      }

      int v16 = [v8 mountParams];
      [v7 mountWithParams:v16 error:0];

      goto LABEL_12;
    case 0:
LABEL_12:
      id v10 = v7;
      goto LABEL_13;
  }
  id v10 = +[SKError nilWithSKErrorCode:250 error:a5];
LABEL_13:
  uint64_t v14 = v10;
LABEL_14:

  return v14;
}

- (unint64_t)diResize:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SKDiskImage *)self diParams];

  id v8 = objc_alloc(MEMORY[0x263F3A410]);
  if (v7)
  {
    uint64_t v9 = [(SKDiskImage *)self diParams];
    id v10 = objc_msgSend(v8, "initWithExistingParams:size:error:", v9, objc_msgSend(v6, "size"), a4);

    if (!v10) {
      goto LABEL_10;
    }
  }
  else
  {
    v11 = [(SKDiskImage *)self imageURL];
    id v10 = objc_msgSend(v8, "initWithURL:size:error:", v11, objc_msgSend(v6, "size"), a4);

    [(SKDiskImage *)self setDiParams:v10];
    if (!v10)
    {
LABEL_10:
      unint64_t v15 = 0;
      goto LABEL_11;
    }
  }
  int v12 = [v6 stdinPassPhrase];
  uint64_t v13 = [v10 readPassphraseFlags];
  if (v12) {
    uint64_t v14 = v13 | 8;
  }
  else {
    uint64_t v14 = v13;
  }
  [v10 setReadPassphraseFlags:v14];
  if (![MEMORY[0x263F3A418] resizeWithParams:v10 error:a4]) {
    goto LABEL_10;
  }
  unint64_t v15 = [v10 size];
LABEL_11:

  return v15;
}

- (id)redactedDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  deviceHandle = self->_deviceHandle;
  if (deviceHandle)
  {
    id v7 = [(DIDeviceHandle *)deviceHandle BSDName];
    id v8 = [v3 stringWithFormat:@"<%@: { device: \"%@\"}>", v5, v7];
  }
  else
  {
    id v8 = [v3 stringWithFormat:@"<%@: { device: \"%@\"}>", v5, 0];
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  imageURL = self->_imageURL;
  deviceHandle = self->_deviceHandle;
  if (deviceHandle)
  {
    id v8 = [(DIDeviceHandle *)deviceHandle BSDName];
    uint64_t v9 = [v3 stringWithFormat:@"<%@: { image URL: \"%@\", device: \"%@\"}>", v5, imageURL, v8];
  }
  else
  {
    uint64_t v9 = [v3 stringWithFormat:@"<%@: { image URL: \"%@\", device: \"%@\"}>", v5, self->_imageURL, 0];
  }

  return v9;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (DIDeviceHandle)deviceHandle
{
  return self->_deviceHandle;
}

- (void)setDeviceHandle:(id)a3
{
}

- (DIBaseParams)diParams
{
  return self->_diParams;
}

- (void)setDiParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diParams, 0);
  objc_storeStrong((id *)&self->_deviceHandle, 0);

  objc_storeStrong((id *)&self->_imageURL, 0);
}

- (id)newShallowResizerWithParams:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_opt_new();
  objc_msgSend(v7, "setShallow:", objc_msgSend(v6, "shallow"));
  objc_msgSend(v7, "setStdinPassPhrase:", objc_msgSend(v6, "stdinPassPhrase"));
  id v8 = [(SKDiskImage *)self resizeLimitsShallowInternalWithLimitsParams:v7 error:a4];
  if (v8)
  {
    uint64_t v9 = [(SKDiskImageResizerBase *)[SKDiskImageResizer alloc] initWithDiskImage:self limits:v8 resizeParams:v6 error:a4];
  }
  else
  {
    id v10 = SKGetOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[SKDiskImage(Resize) newShallowResizerWithParams:error:]";
      _os_log_impl(&dword_23F40C000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to get shallow limits", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

- (id)newResizerWithParams:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![v6 shallow])
  {
    id v8 = objc_opt_new();
    objc_msgSend(v8, "setShallow:", objc_msgSend(v6, "shallow"));
    objc_msgSend(v8, "setStdinPassPhrase:", objc_msgSend(v6, "stdinPassPhrase"));
    uint64_t v9 = [(SKDiskImage *)self resizeLimitsInternalWithLimitsParams:v8 error:a4];
    if (v9)
    {
      id v10 = [(SKDiskImage *)self deduceDiskWithError:a4];
      v11 = v10;
      if (v10)
      {
        int v12 = [v10 type];
        BOOL v13 = +[SKDiskImageSizeLimits isSupportedWholeDisk:v12];

        if (v13)
        {
          uint64_t v14 = [[SKLastPartitions alloc] initWithDisk:v11];
          unint64_t v15 = [(SKLastPartitions *)v14 resizablePart];
          int v16 = [v15 type];
          if ([v16 isEqualToString:kSKDiskTypeAPFSPS[0]])
          {

            __int16 v17 = off_26506BA88;
          }
          else
          {
            __int16 v20 = [(SKLastPartitions *)v14 resizablePart];
            [v20 type];
            id v21 = v27 = v14;
            int v26 = [v21 isEqualToString:kSKDiskTypeHFS[0]];

            uint64_t v14 = v27;
            __int16 v17 = off_26506BAA0;
            if (v26) {
              __int16 v17 = off_26506BA88;
            }
          }
          id v7 = (SKDiskImagePartitionLessResizer *)[objc_alloc(*v17) initWithDiskImage:self limits:v9 resizeParams:v6 error:a4];

          goto LABEL_23;
        }
        id v19 = [v11 type];
        if ([v19 isEqualToString:kSKDiskTypeAPFSPS[0]])
        {
        }
        else
        {
          uint64_t v22 = [v11 type];
          int v23 = [v22 isEqualToString:kSKDiskTypeHFS[0]];

          if (!v23)
          {
            [v11 ejectWithError:0];
            v24 = +[SKError nilWithPOSIXCode:45 error:a4];
            goto LABEL_22;
          }
        }
        v24 = [(SKDiskImageResizerBase *)[SKDiskImagePartitionLessResizer alloc] initWithDiskImage:self limits:v9 resizeParams:v6 error:a4];
LABEL_22:
        id v7 = v24;
        goto LABEL_23;
      }
      int v18 = SKGetOSLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[SKDiskImage(Resize) newResizerWithParams:error:]";
        _os_log_impl(&dword_23F40C000, v18, OS_LOG_TYPE_ERROR, "%s: Failed to get root disk of disk image", buf, 0xCu);
      }
    }
    else
    {
      v11 = SKGetOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[SKDiskImage(Resize) newResizerWithParams:error:]";
        _os_log_impl(&dword_23F40C000, v11, OS_LOG_TYPE_ERROR, "%s: Failed to get limits", buf, 0xCu);
      }
    }
    id v7 = 0;
LABEL_23:

    goto LABEL_24;
  }
  id v7 = [(SKDiskImage *)self newShallowResizerWithParams:v6 error:a4];
LABEL_24:

  return v7;
}

- (BOOL)resizeWithParams:(id)a3 progress:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SKDiskImage *)self newResizerWithParams:v8 error:a5];
  v11 = v10;
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v12 = [v10 requestedSize];
  BOOL v13 = [v11 limits];
  uint64_t v14 = [v13 currentBytes];

  if (v12 != v14)
  {
    if ([v11 requiredSizeForRecoveryMove])
    {
      unint64_t v15 = -[SKDiskImageResizeParams initWithSize:]([SKDiskImageResizeParams alloc], "initWithSize:", [v11 requiredSizeForRecoveryMove]);
      [(SKDiskImageResizeParams *)v15 setShallow:1];
      id v16 = [(SKDiskImage *)self newResizerWithParams:v15 error:a5];
      __int16 v17 = v16;
      if (!v16
        || ([v16 progress],
            int v18 = objc_claimAutoreleasedReturnValue(),
            [v9 chainChildProgress:v18 withPendingUnitCount:50],
            v18,
            ([v17 resizeWithError:a5] & 1) == 0))
      {

        goto LABEL_14;
      }
      id v19 = [(SKDiskImage *)self newResizerWithParams:v8 error:a5];

      if (!v19)
      {
        v11 = 0;
        goto LABEL_14;
      }
      uint64_t v20 = 50;
      v11 = v19;
    }
    else
    {
      uint64_t v20 = 100;
    }
    id v21 = [v11 progress];
    [v9 chainChildProgress:v21 withPendingUnitCount:v20];

    if ([v11 resizeWithError:a5])
    {
      objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v9, "totalUnitCount"));
      goto LABEL_12;
    }
LABEL_14:
    BOOL v22 = 0;
    goto LABEL_15;
  }
LABEL_12:
  BOOL v22 = 1;
LABEL_15:

  return v22;
}

- (BOOL)attachBeforeResizeWithStdinPass:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v7 = objc_opt_new();
  [v7 setPolicy:0];
  [v7 setIsManagedAttach:1];
  objc_msgSend(v7, "setStdinPassPhrase:", objc_msgSend(v7, "stdinPassPhrase") | v5);
  id v8 = [(SKDiskImage *)self attachWithParams:v7 error:a4];
  LOBYTE(a4) = v8 != 0;

  return (char)a4;
}

- (id)resizeWithParams:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SKProgress progressWithTotalUnitCount:100];
  id v9 = +[SKManager sharedManager];
  id v10 = [v9 frameworkAsyncOperationsQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __56__SKDiskImage_Resize__resizeWithParams_completionBlock___block_invoke;
  v17[3] = &unk_26506C078;
  id v20 = v7;
  v17[4] = self;
  id v18 = v6;
  id v11 = v8;
  id v19 = v11;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v17);

  uint64_t v14 = v19;
  id v15 = v11;

  return v15;
}

void __56__SKDiskImage_Resize__resizeWithParams_completionBlock___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAttached])
  {
    id v12 = 0;
    +[SKError failWithPOSIXCode:16 error:&v12];
    id v2 = v12;
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) stdinPassPhrase];
    id v11 = 0;
    int v5 = [v3 attachBeforeResizeWithStdinPass:v4 error:&v11];
    id v2 = v11;
    if (v5)
    {
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      id v10 = v2;
      [v6 resizeWithParams:v7 progress:v8 error:&v10];
      id v9 = v10;

      id v2 = v9;
    }
    [*(id *)(a1 + 32) ejectWithError:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)resize:(id)a3 completionBlock:(id)a4
{
  id v4 = [(SKDiskImage *)self resizeWithParams:a3 completionBlock:a4];
}

- (id)resizeLimitsShallowInternalWithLimitsParams:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = [(SKDiskImage *)self deduceDiskWithError:a4];
  if (!v6)
  {
    uint64_t v7 = SKGetOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[SKDiskImage(Resize) resizeLimitsShallowInternalWithLimitsParams:error:]";
      _os_log_impl(&dword_23F40C000, v7, OS_LOG_TYPE_ERROR, "%s: Failed to attach disk image", buf, 0xCu);
    }
    goto LABEL_22;
  }
  uint64_t v7 = objc_opt_new();
  if (![(SKDiskImage *)self retrieveDIInfoWithParams:v7 error:a4])
  {
LABEL_22:
    id v21 = 0;
    goto LABEL_40;
  }
  uint64_t v8 = [v7 imageInfo];
  id v9 = +[SKDiskImageInfoParams size_info_key];
  id v10 = [v8 objectForKeyedSubscript:v9];

  id v11 = +[SKDiskImageInfoParams format_info_key];
  id v12 = [v8 objectForKeyedSubscript:v11];

  if (v10 && v12)
  {
    id v13 = [v10 objectForKeyedSubscript:@"Max Size Bytes"];
    if (!v13)
    {
      id v13 = [NSNumber numberWithUnsignedLongLong:-1];
    }
    v46 = v13;
    unint64_t v14 = [v13 unsignedLongLongValue];
    if ([v12 isEqualToString:@"RAW"])
    {
      id v15 = +[SKManager syncSharedManager];
      id v16 = [(SKDiskImage *)self imageURL];
      __int16 v17 = [v16 path];
      id v18 = [v15 diskForPath:v17];

      if (v18)
      {
        unint64_t v19 = [v46 unsignedLongLongValue];
        unint64_t v20 = [v18 freeSpace];
        if (v19 >= v20) {
          unint64_t v14 = v20;
        }
        else {
          unint64_t v14 = v19;
        }
      }
    }
    id v21 = objc_opt_new();
    objc_msgSend(v21, "setCurrentBytes:", objc_msgSend(v6, "unformattedSize"));
    unint64_t v22 = [v21 currentBytes];
    if (v22 <= v14) {
      unint64_t v23 = v14;
    }
    else {
      unint64_t v23 = v22;
    }
    [v21 setMaxBytes:v23];
    v24 = [v10 objectForKeyedSubscript:@"Min Size Bytes"];
    v25 = v24;
    if (v24)
    {
      unint64_t v26 = [v24 unsignedLongLongValue];
      unint64_t v27 = [v21 currentBytes];
      if (v26 >= v27) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = v26;
      }
    }
    else
    {
      uint64_t v28 = [v21 currentBytes];
    }
    objc_msgSend(v21, "setMinBytes:", v28, v12);
    id v31 = [[SKLastPartitions alloc] initWithDisk:v6];
    id v32 = SKGetOSLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      id v33 = [(SKLastPartitions *)v31 resizablePart];
      *(_DWORD *)buf = 136315650;
      v48 = "-[SKDiskImage(Resize) resizeLimitsShallowInternalWithLimitsParams:error:]";
      __int16 v49 = 2112;
      v50 = v33;
      __int16 v51 = 2048;
      uint64_t v52 = [(SKLastPartitions *)v31 nonResizableSize];
      _os_log_impl(&dword_23F40C000, v32, OS_LOG_TYPE_DEFAULT, "%s: Resizable partition: %@, non-resizable size: %lld bytes", buf, 0x20u);
    }
    id v34 = [(SKLastPartitions *)v31 resizablePart];
    if (v34)
    {
      unint64_t v35 = [v21 minBytes];
      uint64_t v36 = [v34 startLocation];
      unint64_t v37 = [v34 unformattedSize] + v36;
      unint64_t v38 = v35 <= v37 ? v37 : v35;
      [v21 setMinBytes:v38];
      if (([v34 isEqual:v6] & 1) == 0)
      {
        id v39 = [v6 type];
        objc_msgSend(v21, "setMinBytes:", objc_msgSend(v21, "minBytes")+ +[SKLastPartitions secondaryPartitionTableSizeWithDiskType:](SKLastPartitions, "secondaryPartitionTableSizeWithDiskType:", v39));

        uint64_t v40 = [(SKLastPartitions *)v31 recoveryPart];

        if (v40)
        {
          v41 = SKGetOSLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = [(SKLastPartitions *)v31 recoveryPart];
            *(_DWORD *)buf = 136315394;
            v48 = "-[SKDiskImage(Resize) resizeLimitsShallowInternalWithLimitsParams:error:]";
            __int16 v49 = 2112;
            v50 = v42;
            _os_log_impl(&dword_23F40C000, v41, OS_LOG_TYPE_DEFAULT, "%s: Recovery partition: %@", buf, 0x16u);
          }
          v43 = [(SKLastPartitions *)v31 recoveryPart];
          objc_msgSend(v21, "setMinBytes:", objc_msgSend(v21, "minBytes") + objc_msgSend(v43, "unformattedSize"));
        }
      }
    }
    alignResizeLimits(v21);
    objc_claimAutoreleasedReturnValue();

    id v12 = v45;
  }
  else
  {
    v29 = +[SKBaseManager sharedManager];
    [v29 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_7];

    uint64_t v30 = SKGetOSLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[SKDiskImage(Resize) resizeLimitsShallowInternalWithLimitsParams:error:]";
      _os_log_impl(&dword_23F40C000, v30, OS_LOG_TYPE_FAULT, "%s: Failed to inspect size info", buf, 0xCu);
    }

    [(SKDiskImage *)self setDeviceHandle:0];
    id v21 = +[SKError nilWithPOSIXCode:22 error:a4];
  }

LABEL_40:

  return v21;
}

id __73__SKDiskImage_Resize__resizeLimitsShallowInternalWithLimitsParams_error___block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"faultCode";
  v0 = base64Encode((uint64_t)"SKDiskImage+Resize.m", 175);
  v4[0] = v0;
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];

  return v1;
}

- (id)resizeLimitsInternalWithLimitsParams:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(SKDiskImage *)self resizeLimitsShallowInternalWithLimitsParams:v6 error:a4];
  if (!v7)
  {
    uint64_t v8 = SKGetOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136315138;
      uint64_t v30 = "-[SKDiskImage(Resize) resizeLimitsInternalWithLimitsParams:error:]";
      _os_log_impl(&dword_23F40C000, v8, OS_LOG_TYPE_ERROR, "%s: Failed to get limits", (uint8_t *)&v29, 0xCu);
    }
    goto LABEL_10;
  }
  uint64_t v8 = [(SKDiskImage *)self deduceDiskWithError:a4];
  if (!v8)
  {
    id v10 = SKGetOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136315138;
      uint64_t v30 = "-[SKDiskImage(Resize) resizeLimitsInternalWithLimitsParams:error:]";
      _os_log_impl(&dword_23F40C000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to attach disk image", (uint8_t *)&v29, 0xCu);
    }

LABEL_10:
    id v11 = 0;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [v8 type];
    int v13 = [v12 isEqualToString:kSKDiskTypeHFS[0]];

    if (v13)
    {
      uint64_t v9 = +[SKLastPartitions hfsMinimalSizeForDisk:v8 currentSize:0];
      goto LABEL_13;
    }
    unint64_t v14 = [[SKLastPartitions alloc] initWithDisk:v8];
    id v15 = [(SKLastPartitions *)v14 resizablePart];
    id v16 = v15;
    if (v15)
    {
      unint64_t v17 = [v15 totalSpace];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = [v7 physicalStoreMinimumSizeFromStore:v16];
LABEL_19:
        unint64_t v21 = v18;
        if (v18 != -1)
        {
          unint64_t v22 = [v8 type];
          unint64_t v23 = +[SKLastPartitions secondaryPartitionTableSizeWithDiskType:v22];

          uint64_t v24 = [v16 startLocation];
          unint64_t v25 = v17 >= v21 ? v21 : v17;
          [v7 setMinBytes:v23 + v24 + v25];
          unint64_t v26 = [(SKLastPartitions *)v14 recoveryPart];

          if (v26)
          {
            unint64_t v27 = [(SKLastPartitions *)v14 recoveryPart];
            objc_msgSend(v7, "setMinBytes:", objc_msgSend(v7, "minBytes") + objc_msgSend(v27, "totalSpace"));
          }
        }
        goto LABEL_25;
      }
      unint64_t v19 = [v16 type];
      int v20 = [v19 isEqualToString:kSKDiskTypeHFS[0]];

      if (v20)
      {
        uint64_t v18 = +[SKLastPartitions hfsMinimalSizeForDisk:v16 currentSize:0];
        goto LABEL_19;
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v9 = [v7 physicalStoreMinimumSizeFromStore:v8];
LABEL_13:
  [v7 setMinBytes:v9];
LABEL_26:
  alignResizeLimits(v7);
  objc_claimAutoreleasedReturnValue();
  id v11 = v7;
LABEL_27:

  return v11;
}

- (id)resizeLimitsWithLimitsParams:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(SKDiskImage *)self isAttached];
  if (-[SKDiskImage attachBeforeResizeWithStdinPass:error:](self, "attachBeforeResizeWithStdinPass:error:", [v6 stdinPassPhrase], a4))
  {
    if ([v6 shallow]) {
      [(SKDiskImage *)self resizeLimitsShallowInternalWithLimitsParams:v6 error:a4];
    }
    else {
    uint64_t v8 = [(SKDiskImage *)self resizeLimitsInternalWithLimitsParams:v6 error:a4];
    }
    if (v8)
    {
      if (!v7) {
        [(SKDiskImage *)self ejectWithError:0];
      }
      [(SKDiskImage *)self setDeviceHandle:0];
      id v9 = v8;
    }
    else
    {
      id v10 = SKGetOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315138;
        int v13 = "-[SKDiskImage(Resize) resizeLimitsWithLimitsParams:error:]";
        _os_log_impl(&dword_23F40C000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to get limits", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)resizeLimitsWithError:(id *)a3
{
  int v5 = objc_opt_new();
  id v6 = [(SKDiskImage *)self resizeLimitsWithLimitsParams:v5 error:a3];

  return v6;
}

@end