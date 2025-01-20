@interface PUIPosterSnapshotBundleBuilder
- (BOOL)captureColorStatistics:(id)a3 error:(id *)a4;
- (BOOL)captureSnapshot:(id)a3 forLevelSet:(id)a4 error:(id *)a5;
- (NSMutableDictionary)URLResourceValues;
- (NSMutableDictionary)fileAttributes;
- (NSMutableDictionary)infoDictionary;
- (NSSet)capturedSnapshotLevelSets;
- (PUIColorStatistics)capturedColorStatistics;
- (PUIPosterSnapshotBundleBuilder)initWithHardwareIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4 interfaceOrientation:(int64_t)a5 deviceOrientation:(int64_t)a6;
- (PUIPosterSnapshotBundleBuilder)initWithSnapshotBundle:(id)a3;
- (id)_finalizedInfoPlistDictionaryWithSnapshotImageFormat:(id)a3;
- (id)buildWithError:(id *)a3;
- (id)buildWithOutputURL:(id)a3 diskFormat:(id)a4 error:(id *)a5;
- (id)capturedSnapshotForLevelSet:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)reset;
- (void)setFileAttributes:(id)a3;
- (void)setImage:(id)a3 forLevelSet:(id)a4;
- (void)setInfoDictionary:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setURLResourceValues:(id)a3;
- (void)updateWithPoster:(id)a3;
@end

@implementation PUIPosterSnapshotBundleBuilder

- (PUIPosterSnapshotBundleBuilder)initWithSnapshotBundle:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  NSClassFromString(&cfstr_Puipostersnaps_26.isa);
  if (!v4)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotBundleBuilder initWithSnapshotBundle:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0D87F4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PUIPosterSnapshotBundleClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotBundleBuilder initWithSnapshotBundle:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0D8858);
  }

  v5 = [v4 hardwareIdentifier];
  v6 = -[PUIPosterSnapshotBundleBuilder initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:](self, "initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:", v5, [v4 userInterfaceStyle], objc_msgSend(v4, "interfaceOrientation"), objc_msgSend(v4, "deviceOrientation"));

  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = [v4 snapshotLevelSets];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v13 = [v4 snapshotForLevelSet:v12];
          if (v13) {
            [(NSMutableDictionary *)v6->_levelToImage setObject:v13 forKeyedSubscript:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    uint64_t v14 = [v4 colorStatistics];
    colorStatistics = v6->_colorStatistics;
    v6->_colorStatistics = (PUIColorStatistics *)v14;

    v16 = [(PUIPosterSnapshotBundleBuilder *)v6 infoDictionary];
    v17 = [v4 infoDictionary];
    [v16 addEntriesFromDictionary:v17];
  }
  return v6;
}

- (PUIPosterSnapshotBundleBuilder)initWithHardwareIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4 interfaceOrientation:(int64_t)a5 deviceOrientation:(int64_t)a6
{
  id v10 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v10)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotBundleBuilder initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:]();
    }
LABEL_11:
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0D89C4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotBundleBuilder initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:]();
    }
    goto LABEL_11;
  }

  v20.receiver = self;
  v20.super_class = (Class)PUIPosterSnapshotBundleBuilder;
  v11 = [(PUIPosterSnapshotBundleBuilder *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    hardwareIdentifier = v11->_hardwareIdentifier;
    v11->_hardwareIdentifier = (NSString *)v12;

    uint64_t v14 = objc_opt_new();
    infoDictionary = v11->_infoDictionary;
    v11->_infoDictionary = (NSMutableDictionary *)v14;

    uint64_t v16 = objc_opt_new();
    levelToImage = v11->_levelToImage;
    v11->_levelToImage = (NSMutableDictionary *)v16;

    v11->_userInterfaceStyle = a4;
    v11->_interfaceOrientation = a5;
    v11->_deviceOrientation = a6;
    [(PUIPosterSnapshotBundleBuilder *)v11 setFileAttributes:0];
    [(PUIPosterSnapshotBundleBuilder *)v11 setURLResourceValues:0];
  }

  return v11;
}

- (void)updateWithPoster:(id)a3
{
  id v13 = a3;
  id v4 = [v13 serverIdentity];

  if (v4)
  {
    v5 = [v13 serverIdentity];
    v6 = [v5 posterUUID];
    v7 = [v6 UUIDString];
    [(PUIPosterSnapshotBundleBuilder *)self setObject:v7 forKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyPosterUUID"];

    uint64_t v8 = NSNumber;
    uint64_t v9 = [v13 serverIdentity];
    id v10 = objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "version"));
    [(PUIPosterSnapshotBundleBuilder *)self setObject:v10 forKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyPosterVersion"];

    v11 = [v13 serverIdentity];
    uint64_t v12 = [v11 provider];
    [(PUIPosterSnapshotBundleBuilder *)self setObject:v12 forKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyPosterProvider"];
  }
}

- (void)setURLResourceValues:(id)a3
{
  if (a3) {
    objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:");
  }
  else {
  self->_URLResourceValues = [MEMORY[0x263EFF9A0] dictionaryWithObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF6B0]];
  }
  MEMORY[0x270F9A758]();
}

- (void)setFileAttributes:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:");
    self->_fileAttributes = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PFFileProtectionNoneAttributes();
    id v4 = (NSMutableDictionary *)[(id)objc_claimAutoreleasedReturnValue() mutableCopy];
    fileAttributes = self->_fileAttributes;
    self->_fileAttributes = v4;
  }
  MEMORY[0x270F9A758]();
}

- (BOOL)captureSnapshot:(id)a3 forLevelSet:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"snapshot"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotBundleBuilder captureSnapshot:forLevelSet:error:]();
    }
LABEL_27:
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0D8FF4);
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    v40 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"levelSet"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotBundleBuilder captureSnapshot:forLevelSet:error:]();
    }
    goto LABEL_27;
  }
  id v10 = (void *)MEMORY[0x25A2F5E70]();
  if ([v7 capture]
    && (objc_msgSend(MEMORY[0x263F1C6B0], "pui_imageFromSceneSnapshot:", v7),
        (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v12 = (void *)v11;
    [(NSMutableDictionary *)self->_levelToImage setObject:v11 forKey:v9];
    id v13 = [(PUIPosterSnapshotBundleBuilder *)self objectForKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyAssetSize"];

    if (!v13)
    {
      [v12 size];
      uint64_t v14 = NSStringFromCGSize(v41);
      [(PUIPosterSnapshotBundleBuilder *)self setObject:v14 forKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyAssetSize"];
    }
    v15 = [(PUIPosterSnapshotBundleBuilder *)self objectForKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyScale"];

    if (!v15)
    {
      uint64_t v16 = NSNumber;
      v17 = [v7 context];
      [v17 scale];
      v18 = objc_msgSend(v16, "numberWithDouble:");
      [(PUIPosterSnapshotBundleBuilder *)self setObject:v18 forKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyScale"];
    }
    v19 = [(PUIPosterSnapshotBundleBuilder *)self objectForKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyUserInterfaceStyle"];

    if (!v19)
    {
      objc_super v20 = NSNumber;
      long long v21 = [v7 context];
      long long v22 = [v21 settings];
      long long v23 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v22, "pui_userInterfaceStyle"));
      [(PUIPosterSnapshotBundleBuilder *)self setObject:v23 forKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyUserInterfaceStyle"];
    }
    long long v24 = [(PUIPosterSnapshotBundleBuilder *)self objectForKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeySnapshotDefinitionIdentifier"];

    if (!v24)
    {
      v25 = [v7 context];
      uint64_t v26 = [v25 settings];
      v27 = objc_msgSend(v26, "pui_previewIdentifier");

      if (v27) {
        [(PUIPosterSnapshotBundleBuilder *)self setObject:v27 forKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeySnapshotDefinitionIdentifier"];
      }
    }
    v28 = [(PUIPosterSnapshotBundleBuilder *)self objectForKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyDeviceInterfaceOrientation"];

    if (!v28)
    {
      v29 = NSNumber;
      v30 = [v7 context];
      v31 = [v30 settings];
      v32 = objc_msgSend(v29, "numberWithInteger:", objc_msgSend(v31, "pui_deviceOrientation"));
      [(PUIPosterSnapshotBundleBuilder *)self setObject:v32 forKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyDeviceInterfaceOrientation"];
    }
    v33 = [(PUIPosterSnapshotBundleBuilder *)self objectForKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyInterfaceOrientation"];

    if (!v33)
    {
      v34 = NSNumber;
      v35 = [v7 context];
      v36 = [v35 settings];
      v37 = objc_msgSend(v34, "numberWithInteger:", objc_msgSend(v36, "interfaceOrientation"));
      [(PUIPosterSnapshotBundleBuilder *)self setObject:v37 forKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyInterfaceOrientation"];
    }
    BOOL v38 = 1;
  }
  else
  {
    BOOL v38 = 0;
  }

  return v38;
}

- (void)setImage:(id)a3 forLevelSet:(id)a4
{
  id v7 = a3;
  -[NSMutableDictionary setObject:forKey:](self->_levelToImage, "setObject:forKey:");
  v5 = [(PUIPosterSnapshotBundleBuilder *)self objectForKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyAssetSize"];

  if (!v5)
  {
    [v7 size];
    v6 = NSStringFromCGSize(v9);
    [(PUIPosterSnapshotBundleBuilder *)self setObject:v6 forKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyAssetSize"];
  }
}

- (BOOL)captureColorStatistics:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    id v7 = (void *)MEMORY[0x25A2F5E70]();
    id v8 = (PUIColorStatistics *)[v6 copy];
    colorStatistics = self->_colorStatistics;
    self->_colorStatistics = v8;

    BOOL v10 = self->_colorStatistics != 0;

    return v10;
  }
  else
  {
    uint64_t v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"colorStatistics"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotBundleBuilder captureColorStatistics:error:]();
    }
    [v12 UTF8String];
    BOOL result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (PUIColorStatistics)capturedColorStatistics
{
  return self->_colorStatistics;
}

- (NSSet)capturedSnapshotLevelSets
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(NSMutableDictionary *)self->_levelToImage allKeys];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (id)capturedSnapshotForLevelSet:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_levelToImage objectForKey:a3];
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  id v5 = [(PUIPosterSnapshotBundleBuilder *)self infoDictionary];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUIPosterSnapshotBundleBuilder *)self infoDictionary];
  [v8 setObject:v7 forKey:v6];
}

- (id)buildWithOutputURL:(id)a3 diskFormat:(id)a4 error:(id *)a5
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v64 = a3;
  id v65 = a4;
  id v7 = NSURL;
  id v8 = NSString;
  CGSize v9 = [MEMORY[0x263F08C38] UUID];
  BOOL v10 = [v9 UUIDString];
  uint64_t v11 = [v8 stringWithFormat:@"PUIPosterSnapshotBundleBuilder-%@", v10];
  v67 = objc_msgSend(v7, "pf_temporaryDirectoryURLNamed:", v11);

  uint64_t v12 = objc_opt_new();
  if (![v12 createDirectoryAtURL:v67 withIntermediateDirectories:1 attributes:self->_fileAttributes error:a5])
  {
    v17 = 0;
    goto LABEL_18;
  }
  v92[0] = MEMORY[0x263EF8330];
  v92[1] = 3221225472;
  v92[2] = __70__PUIPosterSnapshotBundleBuilder_buildWithOutputURL_diskFormat_error___block_invoke;
  v92[3] = &unk_265471108;
  id v13 = v12;
  id v93 = v13;
  id v14 = v67;
  id v94 = v14;
  v63 = (void (**)(void))MEMORY[0x25A2F6090](v92);
  uint64_t v86 = 0;
  v87 = (id *)&v86;
  uint64_t v88 = 0x3032000000;
  v89 = __Block_byref_object_copy_;
  v90 = __Block_byref_object_dispose_;
  id v91 = 0;
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = __70__PUIPosterSnapshotBundleBuilder_buildWithOutputURL_diskFormat_error___block_invoke_93;
  v82[3] = &unk_265471508;
  id v62 = v14;
  id v83 = v62;
  id v15 = v13;
  id v84 = v15;
  v85 = &v86;
  PUIPosterSnapshotBundleComponentEnumerateDirectories(v82);
  id v16 = v87[5];
  if (v16)
  {
    if (a5) {
      *a5 = v16;
    }
    v63[2]();
    v17 = 0;
    goto LABEL_17;
  }
  if (v65)
  {
    uint64_t v18 = [v65 filenameExtension];
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v19 = [(PUIPosterSnapshotBundleBuilder *)self _finalizedInfoPlistDictionaryWithSnapshotImageFormat:v18];
  v56 = v15;
  v57 = (void *)v18;
  objc_super v20 = v87;
  obuint64_t j = 0;
  v58 = (void *)v19;
  v61 = objc_msgSend(MEMORY[0x263F08AC0], "dataWithPropertyList:format:options:error:");
  objc_storeStrong(v20 + 5, 0);
  if (!v61 || v87[5])
  {
    if (a5) {
      *a5 = v87[5];
    }
    v63[2]();
    goto LABEL_15;
  }
  long long v22 = PUIPosterSnapshotBundleURLForComponent(v62, 3);
  char v23 = [v61 writeToURL:v22 options:0 error:a5];

  if (v23)
  {
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v24 = [(NSMutableDictionary *)self->_levelToImage allKeys];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v77 objects:v96 count:16];
    if (v25)
    {
      uint64_t v60 = *(void *)v78;
      while (2)
      {
        uint64_t v59 = v25;
        for (uint64_t i = 0; i != v59; ++i)
        {
          if (*(void *)v78 != v60) {
            objc_enumerationMutation(v24);
          }
          v27 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          id v28 = [(NSMutableDictionary *)self->_levelToImage objectForKey:v27];
          v29 = (void *)MEMORY[0x25A2F5E70]();
          v30 = [PUIImageEncoder alloc];
          v31 = PUIPosterSnapshotBundleURLForPosterLevelSet(v62, v27);
          v32 = [(PUIImageEncoder *)v30 initWithURL:v31 format:v65];

          id v76 = 0;
          v33 = [(PUIImageEncoder *)v32 saveUIImage:v28 error:&v76];
          id v34 = v76;
          if (v33)
          {
            v35 = [(PUIPosterSnapshotBundleBuilder *)self objectForKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyAssetSize"];
            BOOL v36 = v35 == 0;

            if (v36)
            {
              [v28 size];
              v37 = NSStringFromCGSize(v99);
              [(PUIPosterSnapshotBundleBuilder *)self setObject:v37 forKeyedSubscript:@"PUIPosterSnapshotBundleInfoKeyAssetSize"];
            }
          }

          if (v34)
          {
            if (a5) {
              *a5 = v34;
            }
            v63[2]();

            goto LABEL_61;
          }
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v77 objects:v96 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }

    if (self->_colorStatistics)
    {
      BOOL v38 = (void *)MEMORY[0x25A2F5E70]();
      v39 = PUIPosterSnapshotBundleURLForComponent(v62, 4);
      colorStatistics = self->_colorStatistics;
      id v75 = 0;
      CGSize v41 = [MEMORY[0x263F08910] archivedDataWithRootObject:colorStatistics requiringSecureCoding:1 error:&v75];
      id v42 = v75;
      id v74 = v42;
      [v41 writeToURL:v39 options:0x10000000 error:&v74];
      id v43 = v74;

      long long v24 = v43;
      if (v43)
      {
        if (a5)
        {
          *a5 = v43;
          long long v24 = v43;
        }
        v63[2]();
        v17 = 0;
        goto LABEL_63;
      }
    }
    v44 = (void *)MEMORY[0x25A2F5E70]();
    v45 = [(NSMutableDictionary *)self->_URLResourceKeys allKeys];
    v46 = [v56 enumeratorAtURL:v62 includingPropertiesForKeys:v45 options:0 errorHandler:0];

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v47 = v46;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v70 objects:v95 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v71;
      while (2)
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v71 != v49) {
            objc_enumerationMutation(v47);
          }
          v51 = *(void **)(*((void *)&v70 + 1) + 8 * j);
          URLResourceValues = self->_URLResourceValues;
          id v69 = 0;
          [v51 setResourceValues:URLResourceValues error:&v69];
          id v53 = v69;
          if (v53)
          {
            id v28 = v53;
            goto LABEL_53;
          }
          fileAttributes = self->_fileAttributes;
          v55 = [v51 path];
          id v68 = 0;
          [v56 setAttributes:fileAttributes ofItemAtPath:v55 error:&v68];
          id v28 = v68;

          if (v28) {
            goto LABEL_53;
          }
        }
        uint64_t v48 = [v47 countByEnumeratingWithState:&v70 objects:v95 count:16];
        id v28 = 0;
        if (v48) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v28 = 0;
    }
LABEL_53:

    if (v28)
    {
      if (a5) {
        *a5 = v28;
      }
    }
    else if ([v56 moveItemAtURL:v62 toURL:v64 error:a5])
    {
      v17 = +[PUIPosterSnapshotBundle snapshotBundleAtURL:v64 error:a5];
      if (v17) {
        [(PUIPosterSnapshotBundleBuilder *)self reset];
      }
      long long v24 = 0;
LABEL_62:

LABEL_63:
      goto LABEL_16;
    }
    v63[2]();
    long long v24 = 0;
LABEL_61:
    v17 = 0;
    goto LABEL_62;
  }
LABEL_15:
  v17 = 0;
LABEL_16:

LABEL_17:
  _Block_object_dispose(&v86, 8);

LABEL_18:
  return v17;
}

uint64_t __70__PUIPosterSnapshotBundleBuilder_buildWithOutputURL_diskFormat_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
}

void __70__PUIPosterSnapshotBundleBuilder_buildWithOutputURL_diskFormat_error___block_invoke_93(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = PUIPosterSnapshotBundleURLForComponent(*(void **)(a1 + 32), a2);
  id v6 = *(void **)(a1 + 40);
  id v7 = PFFileProtectionNoneAttributes();
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v8 + 40);
  LOBYTE(v6) = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);

  if ((v6 & 1) == 0) {
    *a3 = 1;
  }
}

- (id)buildWithError:(id *)a3
{
  id v5 = [(PUIPosterSnapshotBundleBuilder *)self _finalizedInfoPlistDictionaryWithSnapshotImageFormat:0];
  id v6 = (void *)[(NSMutableDictionary *)self->_levelToImage copy];
  id v7 = +[PUIPosterSnapshotBundle snapshotBundleForInfoDictionary:v5 levelToImage:v6 colorStatistics:self->_colorStatistics error:a3];

  if (v7) {
    [(PUIPosterSnapshotBundleBuilder *)self reset];
  }
  return v7;
}

- (void)reset
{
  [(NSMutableDictionary *)self->_levelToImage removeAllObjects];
  colorStatistics = self->_colorStatistics;
  self->_colorStatistics = 0;
}

- (id)_finalizedInfoPlistDictionaryWithSnapshotImageFormat:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = [(PUIPosterSnapshotBundleBuilder *)self infoDictionary];
  id v7 = [v5 dictionaryWithDictionary:v6];

  if (v4) {
    [v7 setObject:v4 forKey:@"PUIPosterSnapshotBundleInfoKeySnapshotImageFormat"];
  }
  hardwareIdentifier = self->_hardwareIdentifier;
  if (hardwareIdentifier) {
    [v7 setObject:hardwareIdentifier forKey:@"PUIPosterSnapshotBundleInfoKeyHardwareIdentifier"];
  }
  CGSize v9 = PUIPosterSnapshotBundleSharedDateFormatter();
  BOOL v10 = [MEMORY[0x263EFF910] date];
  uint64_t v11 = [v9 stringFromDate:v10];
  [v7 setObject:v11 forKey:@"PUIPosterSnapshotBundleInfoKeyDateCreated"];

  uint64_t v12 = [v7 objectForKey:@"PUIPosterSnapshotBundleInfoKeySnapshotEpoch"];

  if (!v12) {
    [v7 setObject:&unk_27081B308 forKey:@"PUIPosterSnapshotBundleInfoKeySnapshotEpoch"];
  }
  [v7 setObject:&unk_27081B320 forKey:@"PUIPosterSnapshotBundleInfoKeySnapshotVersion"];
  [v7 setObject:&unk_27081B338 forKey:@"PUIPosterSnapshotBundleInfoKeySnapshotBundleVersion"];
  id v13 = [(NSMutableDictionary *)self->_levelToImage allKeys];
  id v14 = [v13 objectEnumerator];
  uint64_t v15 = [v14 allObjects];
  id v16 = (void *)v15;
  v17 = (void *)MEMORY[0x263EFFA68];
  if (v15) {
    v17 = (void *)v15;
  }
  id v18 = v17;

  uint64_t v19 = objc_msgSend(v18, "bs_mapNoNulls:", &__block_literal_global_15);

  objc_super v20 = [NSNumber numberWithInteger:self->_userInterfaceStyle];
  [v7 setObject:v20 forKey:@"PUIPosterSnapshotBundleInfoKeyUserInterfaceStyle"];

  [v7 setObject:v19 forKey:@"PUIPosterSnapshotBundleInfoKeySnapshotLevels"];
  long long v21 = [v7 objectForKey:@"PUIPosterSnapshotBundleInfoKeyInterfaceOrientation"];

  if (!v21)
  {
    long long v22 = [NSNumber numberWithInteger:self->_interfaceOrientation];
    [v7 setObject:v22 forKey:@"PUIPosterSnapshotBundleInfoKeyInterfaceOrientation"];
  }
  char v23 = [v7 objectForKey:@"PUIPosterSnapshotBundleInfoKeyDeviceInterfaceOrientation"];

  if (!v23)
  {
    long long v24 = [NSNumber numberWithInteger:self->_deviceOrientation];
    [v7 setObject:v24 forKey:@"PUIPosterSnapshotBundleInfoKeyDeviceInterfaceOrientation"];
  }
  uint64_t v25 = [NSNumber numberWithInt:self->_colorStatistics != 0];
  [v7 setObject:v25 forKey:@"PUIPosterSnapshotBundleInfoKeyContainsColorStatistics"];

  uint64_t v26 = objc_msgSend(NSString, "pf_bootInstanceIdentifier");
  if (v26) {
    [v7 setObject:v26 forKey:@"PUIPosterSnapshotBundleInfoKeyBootSessionIdentifier"];
  }
  v27 = (void *)[v7 copy];

  return v27;
}

uint64_t __87__PUIPosterSnapshotBundleBuilder__finalizedInfoPlistDictionaryWithSnapshotImageFormat___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F08910] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:0];
}

- (NSMutableDictionary)fileAttributes
{
  return self->_fileAttributes;
}

- (NSMutableDictionary)URLResourceValues
{
  return self->_URLResourceValues;
}

- (NSMutableDictionary)infoDictionary
{
  return self->_infoDictionary;
}

- (void)setInfoDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_URLResourceValues, 0);
  objc_storeStrong((id *)&self->_levelToImage, 0);
  objc_storeStrong((id *)&self->_URLResourceKeys, 0);
  objc_storeStrong((id *)&self->_fileAttributes, 0);
  objc_storeStrong((id *)&self->_colorStatistics, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

- (void)initWithSnapshotBundle:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithHardwareIdentifier:userInterfaceStyle:interfaceOrientation:deviceOrientation:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)captureSnapshot:forLevelSet:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)captureSnapshot:forLevelSet:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)captureColorStatistics:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end