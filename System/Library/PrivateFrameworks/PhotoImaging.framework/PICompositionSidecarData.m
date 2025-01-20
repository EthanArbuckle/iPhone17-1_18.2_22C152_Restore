@interface PICompositionSidecarData
+ (id)_loadContentsDictionaryFromData:(id)a3 error:(id *)a4;
+ (id)dataForImageBuffer:(__CVBuffer *)a3 error:(id *)a4;
+ (id)imageBufferFromData:(id)a3 error:(id *)a4;
+ (id)loadFromDictionary:(id)a3 error:(id *)a4;
+ (id)loadFromURL:(id)a3 error:(id *)a4;
- (BOOL)isEmpty;
- (BOOL)saveToURL:(id)a3 error:(id *)a4;
- (NSArray)maskSources;
- (NSString)sourceIdentifier;
- (PIBrushStrokeHistory)brushStrokeHistory;
- (PICompositionSidecarData)init;
- (PICompositionSidecarData)initWithComposition:(id)a3;
- (PICompositionSidecarData)initWithSourceIdentifier:(id)a3 maskSources:(id)a4;
- (id)contentsDictionary;
- (id)serialize:(id *)a3;
- (unint64_t)version;
- (void)setBrushStrokeHistory:(id)a3;
- (void)setMaskSources:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PICompositionSidecarData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brushStrokeHistory, 0);
  objc_storeStrong((id *)&self->_maskSources, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

- (void)setBrushStrokeHistory:(id)a3
{
}

- (PIBrushStrokeHistory)brushStrokeHistory
{
  return self->_brushStrokeHistory;
}

- (void)setMaskSources:(id)a3
{
}

- (NSArray)maskSources
{
  return self->_maskSources;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  v6 = buf;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v49 = NUAssertLogger_9504();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "archiveURL != nil");
      v50 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v117 = v50;
      _os_log_error_impl(&dword_1A9680000, v49, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v44 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v46 = NUAssertLogger_9504();
    int v52 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (specific)
    {
LABEL_56:
      if (v52)
      {
        v64 = dispatch_get_specific(*v44);
        v65 = (void *)MEMORY[0x1E4F29060];
        id v66 = v64;
        v44 = [v65 callStackSymbols];
        v67 = [v44 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)(v6 + 4) = v64;
        __int16 v118 = 2114;
        *(void *)(v6 + 14) = v67;
        _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v52)
    {
      v53 = [MEMORY[0x1E4F29060] callStackSymbols];
      v44 = [v53 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v117 = v44;
      _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v57 = _NUAssertFailHandler();
    goto LABEL_59;
  }
  if (!a4)
  {
    v54 = NUAssertLogger_9504();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v55 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v117 = v55;
      _os_log_error_impl(&dword_1A9680000, v54, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v44 = (const void **)MEMORY[0x1E4F7A308];
    v56 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v46 = NUAssertLogger_9504();
    int v57 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
    if (!v56)
    {
      if (v57)
      {
        v58 = [MEMORY[0x1E4F29060] callStackSymbols];
        v59 = [v58 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v117 = v59;
        _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_61;
    }
LABEL_59:
    if (v57)
    {
      v68 = dispatch_get_specific(*v44);
      v69 = (void *)MEMORY[0x1E4F29060];
      id v70 = v68;
      v71 = [v69 callStackSymbols];
      v72 = [v71 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)(v6 + 4) = v68;
      __int16 v118 = 2114;
      *(void *)(v6 + 14) = v72;
      _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_61:

    _NUAssertFailHandler();
    goto LABEL_62;
  }
  v8 = v7;
  v9 = [(PICompositionSidecarData *)self serialize:a4];
  if (!v9)
  {
    BOOL v36 = 0;
    goto LABEL_37;
  }
  v10 = [v8 URLByDeletingLastPathComponent];
  v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v114 = 0;
  char v12 = [v11 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v114];
  id v13 = v114;

  if ((v12 & 1) == 0)
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to create archive parent directory" object:v8 underlyingError:v13];
    BOOL v36 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F8CBA0]) initWithArchiveURL:v8];
  [v14 setCompression:-1];
  id v113 = v13;
  char v15 = [v14 openForWriting:&v113];
  id v16 = v113;

  if ((v15 & 1) == 0)
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to open sidecar data archive for writing" object:v8 underlyingError:v16];
    BOOL v36 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  v102 = self;
  uint64_t v17 = [v9 objectForKeyedSubscript:@"contents.plist"];
  if (!v17)
  {
LABEL_62:
    v73 = NUAssertLogger_9504();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      v74 = [NSString stringWithFormat:@"Missing contents manifest"];
      *(_DWORD *)buf = 138543362;
      *(void *)(v6 + 4) = v74;
      _os_log_error_impl(&dword_1A9680000, v73, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v75 = (const void **)MEMORY[0x1E4F7A308];
    v76 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v77 = NUAssertLogger_9504();
    BOOL v78 = os_log_type_enabled(v77, OS_LOG_TYPE_ERROR);
    if (v76)
    {
      if (v78)
      {
        v81 = dispatch_get_specific(*v75);
        v82 = (void *)MEMORY[0x1E4F29060];
        id v83 = v81;
        v84 = [v82 callStackSymbols];
        v85 = [v84 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v117 = (const void **)v81;
        __int16 v118 = 2114;
        v119 = v85;
        _os_log_error_impl(&dword_1A9680000, v77, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v78)
    {
      v79 = [MEMORY[0x1E4F29060] callStackSymbols];
      v80 = [v79 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v117 = v80;
      _os_log_error_impl(&dword_1A9680000, v77, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    goto LABEL_70;
  }
  v18 = (void *)v17;
  id v112 = v16;
  char v19 = [v14 encodeData:v17 filename:@"contents.plist" error:&v112];
  id v20 = v112;

  if ((v19 & 1) == 0)
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to archive contents plist data" object:v18 underlyingError:v20];
    BOOL v36 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v100 = v18;
  v101 = a4;
  v104 = v14;
  v99 = v10;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id obj = [(PICompositionSidecarData *)v102 maskSources];
  uint64_t v21 = [obj countByEnumeratingWithState:&v108 objects:v115 count:16];
  if (!v21) {
    goto LABEL_17;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v109;
  do
  {
    v6 = 0;
    v24 = v20;
    do
    {
      if (*(void *)v109 != v23) {
        objc_enumerationMutation(obj);
      }
      v25 = NSString;
      v26 = [*(id *)(*((void *)&v108 + 1) + 8 * (void)v6) maskIdentifier];
      v27 = [v25 stringWithFormat:@"masks/%@", v26];

      uint64_t v28 = [v9 objectForKeyedSubscript:v27];
      if (!v28)
      {
        v42 = NUAssertLogger_9504();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = [NSString stringWithFormat:@"Missing mask %@", v27];
          *(_DWORD *)buf = 138543362;
          v117 = v43;
          _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        v44 = (const void **)MEMORY[0x1E4F7A308];
        v45 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
        v46 = NUAssertLogger_9504();
        BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
        if (v45)
        {
          if (v47)
          {
            v60 = dispatch_get_specific(*v44);
            v61 = (void *)MEMORY[0x1E4F29060];
            id v62 = v60;
            v44 = [v61 callStackSymbols];
            v63 = [v44 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            v117 = (const void **)v60;
            __int16 v118 = 2114;
            v119 = v63;
            _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v47)
        {
          v48 = [MEMORY[0x1E4F29060] callStackSymbols];
          v44 = [v48 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v117 = v44;
          _os_log_error_impl(&dword_1A9680000, v46, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        int v52 = _NUAssertFailHandler();
        goto LABEL_56;
      }
      v29 = (void *)v28;
      id v107 = v24;
      int v30 = [v104 encodeData:v28 filename:v27 error:&v107];
      id v20 = v107;

      if (!v30)
      {
        id *v101 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to archive mask data" object:v29 underlyingError:v20];

        BOOL v36 = 0;
        v10 = v99;
        goto LABEL_33;
      }

      ++v6;
      v24 = v20;
    }
    while ((uint8_t *)v22 != v6);
    uint64_t v22 = [obj countByEnumeratingWithState:&v108 objects:v115 count:16];
  }
  while (v22);
LABEL_17:

  v31 = [v9 objectForKeyedSubscript:@"BrushStrokeHistory.plist"];
  v32 = [(PICompositionSidecarData *)v102 brushStrokeHistory];

  if (v32)
  {
    v33 = v101;
    if (v31)
    {
      id v106 = v20;
      char v34 = [v104 encodeData:v31 filename:@"BrushStrokeHistory.plist" error:&v106];
      id v35 = v106;

      v10 = v99;
      if (v34)
      {
        id v20 = v35;
        goto LABEL_27;
      }
      v38 = (void *)MEMORY[0x1E4F7A438];
      v39 = @"Failed to archive brush stroke history data";
      v40 = v31;
LABEL_31:
      [v38 errorWithCode:1 reason:v39 object:v40 underlyingError:v35];
      BOOL v36 = 0;
      id *v33 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
LABEL_70:
    v86 = NUAssertLogger_9504();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      v87 = [NSString stringWithFormat:@"Missing brush stroke history data"];
      *(_DWORD *)buf = 138543362;
      v117 = v87;
      _os_log_error_impl(&dword_1A9680000, v86, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v88 = (const void **)MEMORY[0x1E4F7A308];
    v89 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v90 = NUAssertLogger_9504();
    BOOL v91 = os_log_type_enabled(v90, OS_LOG_TYPE_ERROR);
    if (v89)
    {
      if (v91)
      {
        v94 = dispatch_get_specific(*v88);
        v95 = (void *)MEMORY[0x1E4F29060];
        id v96 = v94;
        v97 = [v95 callStackSymbols];
        v98 = [v97 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v117 = (const void **)v94;
        __int16 v118 = 2114;
        v119 = v98;
        _os_log_error_impl(&dword_1A9680000, v90, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v91)
    {
      v92 = [MEMORY[0x1E4F29060] callStackSymbols];
      v93 = [v92 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v117 = v93;
      _os_log_error_impl(&dword_1A9680000, v90, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  v10 = v99;
  v33 = v101;
LABEL_27:
  id v105 = v20;
  char v37 = [v104 close:&v105];
  id v35 = v105;

  if ((v37 & 1) == 0)
  {
    v38 = (void *)MEMORY[0x1E4F7A438];
    v39 = @"Failed to close sidecar archive file";
    v40 = v104;
    goto LABEL_31;
  }
  BOOL v36 = 1;
LABEL_32:

  id v20 = v35;
LABEL_33:
  v14 = v104;
  v18 = v100;
LABEL_34:

  id v16 = v20;
LABEL_35:

  id v13 = v16;
LABEL_36:

LABEL_37:
  return v36;
}

- (id)serialize:(id *)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_37;
  }
  v4 = self;
  v5 = [(PICompositionSidecarData *)self contentsDictionary];
  id v74 = 0;
  v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v74];
  id v7 = v74;
  if (!v6)
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to serialize contents plist" object:v5 underlyingError:v7];
    id v31 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v63 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setObject:v6 forKeyedSubscript:@"contents.plist"];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = [(PICompositionSidecarData *)v4 maskSources];
  uint64_t v66 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (!v66) {
    goto LABEL_16;
  }
  uint64_t v9 = *(void *)v71;
  v61 = v6;
  id v62 = v5;
  uint64_t v64 = *(void *)v71;
  do
  {
    for (uint64_t i = 0; i != v66; ++i)
    {
      if (*(void *)v71 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      id v69 = 0;
      char v12 = [v11 sourceImage:&v69];
      id v13 = v69;

      if (!v12)
      {
        id *v63 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to create new mask image from source" object:v11 underlyingError:v13];
        goto LABEL_21;
      }
      uint64_t v14 = [v12 pixelBuffer];
      if (!v14)
      {
        v18 = [v11 definition];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v19 = (objc_class *)MEMORY[0x1E4F1C9B8];
          id v20 = v8;
          uint64_t v21 = v4;
          id v22 = v18;
          id v23 = [v19 alloc];
          v24 = [v22 url];

          uint64_t v17 = (void *)[v23 initWithContentsOfURL:v24];
          v4 = v21;
          id v8 = v20;
          uint64_t v9 = v64;
          id v7 = v13;
          goto LABEL_14;
        }
        id v35 = NUAssertLogger_9504();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          BOOL v36 = [NSString stringWithFormat:@"Mask sources must be backed either by a buffer or a file"];
          *(_DWORD *)buf = 138543362;
          v77 = v36;
          _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        char v37 = (const void **)MEMORY[0x1E4F7A308];
        specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
        v39 = NUAssertLogger_9504();
        BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
        if (specific)
        {
          if (v40)
          {
            v43 = dispatch_get_specific(*v37);
            v44 = (void *)MEMORY[0x1E4F29060];
            id v45 = v43;
            v46 = [v44 callStackSymbols];
            BOOL v47 = [v46 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            v77 = v43;
            __int16 v78 = 2114;
            v79 = v47;
            _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v40)
        {
          v41 = [MEMORY[0x1E4F29060] callStackSymbols];
          v42 = [v41 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v77 = v42;
          _os_log_error_impl(&dword_1A9680000, v39, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler();
LABEL_37:
        v48 = NUAssertLogger_9504();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          v49 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
          *(_DWORD *)buf = 138543362;
          v77 = v49;
          _os_log_error_impl(&dword_1A9680000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
        }
        v50 = (const void **)MEMORY[0x1E4F7A308];
        v51 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
        int v52 = NUAssertLogger_9504();
        BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
        if (v51)
        {
          if (v53)
          {
            v56 = dispatch_get_specific(*v50);
            int v57 = (void *)MEMORY[0x1E4F29060];
            id v58 = v56;
            v59 = [v57 callStackSymbols];
            v60 = [v59 componentsJoinedByString:@"\n"];
            *(_DWORD *)buf = 138543618;
            v77 = v56;
            __int16 v78 = 2114;
            v79 = v60;
            _os_log_error_impl(&dword_1A9680000, v52, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
          }
        }
        else if (v53)
        {
          v54 = [MEMORY[0x1E4F29060] callStackSymbols];
          v55 = [v54 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v77 = v55;
          _os_log_error_impl(&dword_1A9680000, v52, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
        }
        _NUAssertFailHandler();
      }
      uint64_t v15 = v14;
      id v16 = objc_opt_class();
      id v68 = 0;
      uint64_t v17 = [v16 dataForImageBuffer:v15 error:&v68];
      id v7 = v68;

      if (!v17)
      {
        id *v63 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to encode mask" object:v12 underlyingError:v7];

        id v13 = v7;
LABEL_21:

        id v31 = 0;
        v6 = v61;
        v5 = v62;
        goto LABEL_25;
      }
LABEL_14:
      v25 = NSString;
      v26 = [v11 maskIdentifier];
      v27 = [v25 stringWithFormat:@"masks/%@", v26];

      [v8 setObject:v17 forKeyedSubscript:v27];
    }
    v6 = v61;
    v5 = v62;
    uint64_t v66 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
  }
  while (v66);
LABEL_16:

  uint64_t v28 = [(PICompositionSidecarData *)v4 brushStrokeHistory];

  if (v28)
  {
    v29 = [(PICompositionSidecarData *)v4 brushStrokeHistory];
    id v67 = 0;
    int v30 = [v29 exportDataWithError:&v67];
    id v13 = v67;

    if (v30)
    {
      [v8 setObject:v30 forKeyedSubscript:@"BrushStrokeHistory.plist"];

      goto LABEL_23;
    }
    v32 = (void *)MEMORY[0x1E4F7A438];
    v33 = [(PICompositionSidecarData *)v4 brushStrokeHistory];
    id *v63 = [v32 errorWithCode:1 reason:@"Failed to export brush stroke history data" object:v33 underlyingError:v13];

    id v31 = 0;
  }
  else
  {
    id v13 = v7;
LABEL_23:
    id v31 = v8;
  }
LABEL_25:

  id v7 = v13;
LABEL_26:

  return v31;
}

- (id)contentsDictionary
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PICompositionSidecarData version](self, "version"));
  id v23 = v3;
  [v3 setObject:v4 forKeyedSubscript:@"version"];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = self;
  id obj = [(PICompositionSidecarData *)self maskSources];
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v29[0] = @"identifier";
        char v12 = [v11 maskIdentifier];
        v30[0] = v12;
        v29[1] = @"extent";
        if (v11) {
          [v11 extent];
        }
        id v13 = NSArrayFromNUPixelRect();
        v30[1] = v13;
        v29[2] = @"scale";
        [v11 scale];
        uint64_t v14 = NUScaleToString();
        v30[2] = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];

        id v16 = [v11 maskIdentifier];
        [v6 setObject:v15 forKeyedSubscript:v16];

        uint64_t v17 = [v11 maskIdentifier];
        [v5 addObject:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v8);
  }

  [v23 setObject:v6 forKeyedSubscript:@"maskSources"];
  [v23 setObject:v5 forKeyedSubscript:@"maskIdentifiers"];
  v18 = NSNumber;
  char v19 = [(PICompositionSidecarData *)v22 brushStrokeHistory];
  id v20 = [v18 numberWithInt:v19 != 0];
  [v23 setObject:v20 forKeyedSubscript:@"hasBrushStrokeHistory"];

  return v23;
}

- (BOOL)isEmpty
{
  id v3 = [(PICompositionSidecarData *)self maskSources];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 0;
  }
  id v6 = [(PICompositionSidecarData *)self brushStrokeHistory];
  BOOL v5 = [v6 entryCount] == 0;

  return v5;
}

- (PICompositionSidecarData)initWithComposition:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    char v12 = NUAssertLogger_9504();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "composition != nil");
      id v13 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v35 = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v16 = NUAssertLogger_9504();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        long long v25 = dispatch_get_specific(*v14);
        long long v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v14 = [v26 callStackSymbols];
        long long v28 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v35 = (const void **)v25;
        __int16 v36 = 2114;
        char v37 = v28;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v35 = v14;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v22 = _NUAssertFailHandler();
    goto LABEL_17;
  }
  BOOL v5 = v4;
  uint64_t v6 = [v4 objectForKeyedSubscript:@"source"];
  if (!v6)
  {
    char v19 = NUAssertLogger_9504();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [NSString stringWithFormat:@"A source is required to serialize inpaint mask files"];
      *(_DWORD *)buf = 138543362;
      id v35 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v21 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v16 = NUAssertLogger_9504();
    int v22 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v21)
    {
      if (v22)
      {
        id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v35 = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_19;
    }
LABEL_17:
    if (v22)
    {
      v29 = dispatch_get_specific(*v14);
      int v30 = (void *)MEMORY[0x1E4F29060];
      id v31 = v29;
      uint64_t v32 = [v30 callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v35 = (const void **)v29;
      __int16 v36 = 2114;
      char v37 = v33;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_19:

    _NUAssertFailHandler();
  }
  uint64_t v7 = (void *)v6;
  uint64_t v8 = [v5 objectForKeyedSubscript:@"inpaintMasks"];
  uint64_t v9 = [v7 assetIdentifier];
  v10 = [(PICompositionSidecarData *)self initWithSourceIdentifier:v9 maskSources:v8];

  return v10;
}

- (PICompositionSidecarData)initWithSourceIdentifier:(id)a3 maskSources:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PICompositionSidecarData;
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(PICompositionSidecarData *)&v13 init];
  uint64_t v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  sourceIdentifier = v7->_sourceIdentifier;
  v7->_sourceIdentifier = (NSString *)v8;

  v7->_version = 2;
  uint64_t v10 = [v5 copy];

  maskSources = v7->_maskSources;
  v7->_maskSources = (NSArray *)v10;

  return v7;
}

- (PICompositionSidecarData)init
{
  return [(PICompositionSidecarData *)self initWithSourceIdentifier:&stru_1EFFD8610 maskSources:MEMORY[0x1E4F1CBF0]];
}

+ (id)imageBufferFromData:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    char v12 = NUAssertLogger_9504();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "imageData != nil");
      *(_DWORD *)texture = 138543362;
      *(void *)&texture[4] = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", texture, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v16 = NUAssertLogger_9504();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        long long v25 = dispatch_get_specific(*v14);
        long long v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v14 = [v26 callStackSymbols];
        long long v28 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)texture = 138543618;
        *(void *)&texture[4] = v25;
        __int16 v35 = 2114;
        __int16 v36 = v28;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", texture, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)texture = 138543362;
      *(void *)&texture[4] = v14;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", texture, 0xCu);
    }
    int v22 = _NUAssertFailHandler();
    goto LABEL_22;
  }
  if (!a4)
  {
    char v19 = NUAssertLogger_9504();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)texture = 138543362;
      *(void *)&texture[4] = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", texture, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v21 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v16 = NUAssertLogger_9504();
    int v22 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v21)
    {
      if (v22)
      {
        id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)texture = 138543362;
        *(void *)&texture[4] = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", texture, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_22:
    if (v22)
    {
      v29 = dispatch_get_specific(*v14);
      int v30 = (void *)MEMORY[0x1E4F29060];
      id v31 = v29;
      uint64_t v32 = [v30 callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)texture = 138543618;
      *(void *)&texture[4] = v29;
      __int16 v35 = 2114;
      __int16 v36 = v33;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", texture, 0x16u);
    }
LABEL_24:

    _NUAssertFailHandler();
  }
  id v6 = v5;
  *(void *)texture = 0;
  uint64_t CVPixelBufferFromImageData = PFFigCreateCVPixelBufferFromImageData();
  if (CVPixelBufferFromImageData)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F7A438];
    uint64_t v9 = [NSNumber numberWithInt:CVPixelBufferFromImageData];
    *a4 = [v8 failureError:@"Failed to decode pixel buffer" object:v9];

    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F7A3D8]) initWithCVPixelBuffer:*(void *)texture];
    CVPixelBufferRelease(*(CVPixelBufferRef *)texture);
  }

  return v10;
}

+ (id)dataForImageBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    char v12 = NUAssertLogger_9504();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "buffer != nil");
      objc_super v13 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v13;
      _os_log_error_impl(&dword_1A9680000, v12, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v16 = NUAssertLogger_9504();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v17)
      {
        long long v25 = dispatch_get_specific(*v14);
        long long v26 = (void *)MEMORY[0x1E4F29060];
        id v27 = v25;
        uint64_t v14 = [v26 callStackSymbols];
        long long v28 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v35 = (const void **)v25;
        __int16 v36 = 2114;
        uint64_t v37 = v28;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v17)
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v14 = [v18 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v14;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v22 = _NUAssertFailHandler();
    goto LABEL_22;
  }
  if (!a4)
  {
    char v19 = NUAssertLogger_9504();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      id v20 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v20;
      _os_log_error_impl(&dword_1A9680000, v19, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v14 = (const void **)MEMORY[0x1E4F7A308];
    uint64_t v21 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v16 = NUAssertLogger_9504();
    int v22 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v21)
    {
      if (v22)
      {
        id v23 = [MEMORY[0x1E4F29060] callStackSymbols];
        v24 = [v23 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        __int16 v35 = v24;
        _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_22:
    if (v22)
    {
      v29 = dispatch_get_specific(*v14);
      int v30 = (void *)MEMORY[0x1E4F29060];
      id v31 = v29;
      uint64_t v32 = [v30 callStackSymbols];
      v33 = [v32 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      __int16 v35 = (const void **)v29;
      __int16 v36 = 2114;
      uint64_t v37 = v33;
      _os_log_error_impl(&dword_1A9680000, v16, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_24:

    _NUAssertFailHandler();
  }
  uint64_t v5 = PFFigEncodeCVPixelBufferToData();
  id v6 = 0;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F7A438];
    uint64_t v9 = [NSNumber numberWithInt:v5];
    *a4 = [v8 failureError:@"Failed to encode pixel buffer" object:v9];

    id v10 = 0;
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

+ (id)loadFromDictionary:(id)a3 error:(id *)a4
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    int v52 = NUAssertLogger_9504();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      BOOL v53 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "dataDictionary != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v53;
      _os_log_error_impl(&dword_1A9680000, v52, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v54 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v56 = NUAssertLogger_9504();
    BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v57)
      {
        v65 = dispatch_get_specific(*v54);
        uint64_t v66 = (void *)MEMORY[0x1E4F29060];
        id v67 = v65;
        v54 = [v66 callStackSymbols];
        id v68 = [v54 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v65;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v68;
        _os_log_error_impl(&dword_1A9680000, v56, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v57)
    {
      id v58 = [MEMORY[0x1E4F29060] callStackSymbols];
      v54 = [v58 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v54;
      _os_log_error_impl(&dword_1A9680000, v56, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v62 = _NUAssertFailHandler();
    goto LABEL_87;
  }
  if (!a4)
  {
    v59 = NUAssertLogger_9504();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v60;
      _os_log_error_impl(&dword_1A9680000, v59, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v54 = (const void **)MEMORY[0x1E4F7A308];
    v61 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v56 = NUAssertLogger_9504();
    int v62 = os_log_type_enabled(v56, OS_LOG_TYPE_ERROR);
    if (!v61)
    {
      if (v62)
      {
        v63 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v64 = [v63 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v64;
        _os_log_error_impl(&dword_1A9680000, v56, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_89;
    }
LABEL_87:
    if (v62)
    {
      id v69 = dispatch_get_specific(*v54);
      long long v70 = (void *)MEMORY[0x1E4F29060];
      id v71 = v69;
      long long v72 = [v70 callStackSymbols];
      long long v73 = [v72 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v69;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v73;
      _os_log_error_impl(&dword_1A9680000, v56, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_89:

    _NUAssertFailHandler();
  }
  uint64_t v7 = v6;
  uint64_t v8 = objc_alloc_init(PICompositionSidecarData);
  uint64_t v9 = [v7 objectForKeyedSubscript:@"contents.plist"];
  if (!v9)
  {
    [MEMORY[0x1E4F7A438] missingError:@"Missing contents manifest data" object:v7];
    v43 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_63;
  }
  id v10 = [a1 _loadContentsDictionaryFromData:v9 error:a4];
  v11 = v10;
  if (!v10)
  {
    v43 = 0;
    goto LABEL_62;
  }
  id v82 = a1;
  char v12 = [v10 objectForKeyedSubscript:@"version"];
  unint64_t v87 = [v12 unsignedIntegerValue];
  -[PICompositionSidecarData setVersion:](v8, "setVersion:");
  objc_super v13 = [v11 objectForKeyedSubscript:@"maskIdentifiers"];
  v92 = [v11 objectForKeyedSubscript:@"maskSources"];
  id v89 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v96 objects:v101 count:16];
  if (!v15) {
    goto LABEL_40;
  }
  uint64_t v16 = v15;
  uint64_t v90 = *(void *)v97;
  v85 = v11;
  v86 = v8;
  v84 = v12;
  id v88 = v14;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v97 != v90) {
        objc_enumerationMutation(v14);
      }
      uint64_t v18 = *(void *)(*((void *)&v96 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [MEMORY[0x1E4F7A438] invalidError:@"Invalid mask identifier" object:v18];
        v43 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_60;
      }
      char v19 = [v92 objectForKeyedSubscript:v18];
      if (!v19)
      {
        [NSString stringWithFormat:@"Missing mask source metadata for '%@'", v18];
        id v45 = v44 = v14;
        *a4 = [MEMORY[0x1E4F7A438] missingError:v45 object:v92];

        id v14 = v44;
        goto LABEL_58;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        *a4 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid mask source metadata" object:v19];
        goto LABEL_58;
      }
      id v20 = [v19 objectForKeyedSubscript:@"identifier"];
      if (!v20)
      {
        v46 = [MEMORY[0x1E4F7A438] missingError:@"Missing mask source identifier" object:v19];
LABEL_57:
        *a4 = v46;

LABEL_58:
LABEL_59:
        v43 = 0;
LABEL_60:
        uint64_t v38 = v14;
        v11 = v85;
        uint64_t v8 = v86;
        char v12 = v84;
        goto LABEL_61;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v46 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid mask source identifier" object:v20];
        goto LABEL_57;
      }
      if (([v20 isEqualToString:v18] & 1) == 0)
      {
        v46 = [MEMORY[0x1E4F7A438] mismatchError:@"Encoded mask identifier does not match expected value" object:v20];
        goto LABEL_57;
      }
      uint64_t v21 = [v19 objectForKeyedSubscript:@"extent"];
      if (!v21)
      {
        v33 = [MEMORY[0x1E4F7A438] missingError:@"Missing mask source extent" object:v19];
LABEL_26:
        *a4 = v33;
        int v32 = 1;
        goto LABEL_37;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v33 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid mask source extent" object:v21];
        goto LABEL_26;
      }
      memset(buf, 0, 32);
      NUPixelRectFromArray();
      int v22 = [v19 objectForKeyedSubscript:@"scale"];
      if (v22)
      {
        id v83 = v7;
        v81 = v9;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          *a4 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid mask source scale" object:v22];
          int v32 = 1;
LABEL_35:
          uint64_t v7 = v83;
          goto LABEL_36;
        }
        uint64_t v23 = NUScaleFromString();
        uint64_t v76 = v24;
        uint64_t v77 = v23;
        long long v25 = [NSString stringWithFormat:@"masks/%@", v18];
        uint64_t v26 = [v83 objectForKeyedSubscript:v25];
        uint64_t v80 = (void *)v26;
        if (v26)
        {
          uint64_t v27 = v26;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v75 = v25;
            id v95 = 0;
            long long v28 = [v82 imageBufferFromData:v27 error:&v95];
            if (v28)
            {
              id v74 = (objc_class *)MEMORY[0x1E4F7A550];
              id v29 = v95;
              id v30 = [v74 alloc];
              v94[0] = *(_OWORD *)buf;
              v94[1] = *(_OWORD *)&buf[16];
              id v31 = objc_msgSend(v30, "initWithImageBuffer:identifier:extent:scale:", v28, v18, v94, v77, v76);

              [v89 addObject:v31];
              int v32 = 0;
            }
            else
            {
              __int16 v78 = (void *)MEMORY[0x1E4F7A438];
              id v35 = v95;
              int v32 = 1;
              uint64_t v36 = v27;
              id v37 = v35;
              objc_msgSend(v78, "errorWithCode:reason:object:underlyingError:", 1, @"Failed to read mask image data", v36);
              id v79 = (id)objc_claimAutoreleasedReturnValue();

              *a4 = v79;
            }
            uint64_t v9 = v81;

            long long v25 = v75;
            goto LABEL_34;
          }
          char v34 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid mask data" object:v27];
        }
        else
        {
          char v34 = [MEMORY[0x1E4F7A438] missingError:@"Missing mask" object:v25];
        }
        *a4 = v34;
        int v32 = 1;
        uint64_t v9 = v81;
LABEL_34:

        goto LABEL_35;
      }
      *a4 = [MEMORY[0x1E4F7A438] missingError:@"Missing mask source scale" object:0];
      int v32 = 1;
LABEL_36:

      id v14 = v88;
LABEL_37:

      if (v32) {
        goto LABEL_59;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v96 objects:v101 count:16];
    v11 = v85;
    uint64_t v8 = v86;
    char v12 = v84;
    if (v16) {
      continue;
    }
    break;
  }
LABEL_40:
  uint64_t v38 = v14;

  [(PICompositionSidecarData *)v8 setMaskSources:v89];
  uint64_t v39 = [v11 objectForKeyedSubscript:@"hasBrushStrokeHistory"];
  id v14 = (id)v39;
  if (v87 < 2)
  {
LABEL_43:
    if (![v14 BOOLValue])
    {
LABEL_48:
      v43 = v8;
      goto LABEL_61;
    }
    BOOL v40 = [v7 objectForKeyedSubscript:@"BrushStrokeHistory.plist"];
    if (v40)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v93 = 0;
        v41 = [[PIBrushStrokeHistory alloc] initWithData:v40 error:&v93];
        if (v41)
        {
          v42 = v41;
          [(PICompositionSidecarData *)v8 setBrushStrokeHistory:v41];

          goto LABEL_48;
        }
        v50 = (void *)MEMORY[0x1E4F7A438];
        id v91 = v93;
        id v51 = [v50 errorWithCode:1 reason:@"Failed to initialize brush stroke history from data" object:v40 underlyingError:v91];

        *a4 = v51;
LABEL_72:

        v43 = 0;
        goto LABEL_61;
      }
      v49 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid brush stroke history data" object:v40];
    }
    else
    {
      v49 = [MEMORY[0x1E4F7A438] missingError:@"Missing brush stroke history data" object:v11];
    }
    *a4 = v49;
    goto LABEL_72;
  }
  if (v39)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_43;
    }
    v48 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid brush stroke history value" object:v14];
  }
  else
  {
    v48 = [MEMORY[0x1E4F7A438] missingError:@"Missing brush stroke history value" object:v11];
  }
  v43 = 0;
  *a4 = v48;
LABEL_61:

LABEL_62:
LABEL_63:

  return v43;
}

+ (id)_loadContentsDictionaryFromData:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v22 = NUAssertLogger_9504();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "data != nil");
      uint64_t v23 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v23;
      _os_log_error_impl(&dword_1A9680000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v24 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v26 = NUAssertLogger_9504();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v27)
      {
        id v35 = dispatch_get_specific(*v24);
        uint64_t v36 = (void *)MEMORY[0x1E4F29060];
        id v37 = v35;
        uint64_t v24 = [v36 callStackSymbols];
        uint64_t v38 = [v24 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v46 = (const void **)v35;
        __int16 v47 = 2114;
        v48 = v38;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v27)
    {
      long long v28 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v24 = [v28 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v46 = v24;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v32 = _NUAssertFailHandler();
    goto LABEL_52;
  }
  if (!a4)
  {
    id v29 = NUAssertLogger_9504();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      id v30 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v30;
      _os_log_error_impl(&dword_1A9680000, v29, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v24 = (const void **)MEMORY[0x1E4F7A308];
    id v31 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v26 = NUAssertLogger_9504();
    int v32 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v31)
    {
      if (v32)
      {
        v33 = [MEMORY[0x1E4F29060] callStackSymbols];
        char v34 = [v33 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        v46 = v34;
        _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_54;
    }
LABEL_52:
    if (v32)
    {
      uint64_t v39 = dispatch_get_specific(*v24);
      BOOL v40 = (void *)MEMORY[0x1E4F29060];
      id v41 = v39;
      v42 = [v40 callStackSymbols];
      v43 = [v42 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v46 = (const void **)v39;
      __int16 v47 = 2114;
      v48 = v43;
      _os_log_error_impl(&dword_1A9680000, v26, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_54:

    _NUAssertFailHandler();
  }
  id v6 = v5;
  id v44 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v44];
  id v8 = v44;
  if (!v7)
  {
    char v12 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to deserialize contents plist" object:v6 underlyingError:v8];
LABEL_11:
    id v13 = 0;
    *a4 = v12;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v12 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid contents plist" object:v7];
    goto LABEL_11;
  }
  uint64_t v9 = [v7 objectForKeyedSubscript:@"version"];
  if (!v9)
  {
    v11 = [MEMORY[0x1E4F7A438] missingError:@"Missing version info" object:v7];
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid version info" object:v9];
    goto LABEL_14;
  }
  unint64_t v10 = [v9 unsignedIntegerValue];
  if (v10 < 3)
  {
    unint64_t v15 = v10;
    uint64_t v16 = [v7 objectForKeyedSubscript:@"maskIdentifiers"];
    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v17 = [v7 objectForKeyedSubscript:@"maskSources"];
        if (v17)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v15 >= 2)
            {
              uint64_t v18 = [v7 objectForKeyedSubscript:@"hasBrushStrokeHistory"];
              if (v18)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {

                  goto LABEL_27;
                }
                uint64_t v21 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid brush stroke history value" object:v18];
              }
              else
              {
                uint64_t v21 = [MEMORY[0x1E4F7A438] missingError:@"Missing brush stroke history value" object:v7];
              }
              *a4 = v21;

              id v13 = 0;
              goto LABEL_34;
            }
LABEL_27:
            id v13 = v7;
LABEL_34:

            goto LABEL_35;
          }
          id v20 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid mask source metadata" object:v17];
        }
        else
        {
          id v20 = [MEMORY[0x1E4F7A438] missingError:@"Missing mask source metadata" object:v7];
        }
        id v13 = 0;
        *a4 = v20;
        goto LABEL_34;
      }
      char v19 = [MEMORY[0x1E4F7A438] invalidError:@"Invalid mask source identifiers" object:v16];
    }
    else
    {
      char v19 = [MEMORY[0x1E4F7A438] missingError:@"Missing mask source identifiers" object:v7];
    }
    id v13 = 0;
    *a4 = v19;
LABEL_35:

    goto LABEL_15;
  }
  v11 = [MEMORY[0x1E4F7A438] unsupportedError:@"Unsupported version" object:v9];
LABEL_14:
  id v13 = 0;
  *a4 = v11;
LABEL_15:

LABEL_16:
  return v13;
}

+ (id)loadFromURL:(id)a3 error:(id *)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v38 = NUAssertLogger_9504();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "archiveURL != nil");
      uint64_t v39 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v88 = v39;
      _os_log_error_impl(&dword_1A9680000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v40 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v42 = NUAssertLogger_9504();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v43)
      {
        id v51 = dispatch_get_specific(*v40);
        int v52 = (void *)MEMORY[0x1E4F29060];
        id v53 = v51;
        BOOL v40 = [v52 callStackSymbols];
        v54 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v88 = (const void **)v51;
        __int16 v89 = 2114;
        uint64_t v90 = v54;
        _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v43)
    {
      id v44 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v40 = [v44 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v88 = v40;
      _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    int v48 = _NUAssertFailHandler();
    goto LABEL_51;
  }
  if (!a4)
  {
    id v45 = NUAssertLogger_9504();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "error != NULL");
      v46 = (const void **)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v88 = v46;
      _os_log_error_impl(&dword_1A9680000, v45, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    BOOL v40 = (const void **)MEMORY[0x1E4F7A308];
    __int16 v47 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v42 = NUAssertLogger_9504();
    int v48 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (!v47)
    {
      if (v48)
      {
        uint64_t v49 = [MEMORY[0x1E4F29060] callStackSymbols];
        v50 = [v49 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        id v88 = v50;
        _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
      goto LABEL_53;
    }
LABEL_51:
    if (v48)
    {
      v55 = dispatch_get_specific(*v40);
      v56 = (void *)MEMORY[0x1E4F29060];
      id v57 = v55;
      id v58 = [v56 callStackSymbols];
      v59 = [v58 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v88 = (const void **)v55;
      __int16 v89 = 2114;
      uint64_t v90 = v59;
      _os_log_error_impl(&dword_1A9680000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_53:

    _NUAssertFailHandler();
  }
  uint64_t v7 = v6;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F8CBA0]) initWithArchiveURL:v7];
  [v9 setCompression:-1];
  id v85 = 0;
  char v10 = [v9 openForReading:&v85];
  id v11 = v85;
  char v12 = v11;
  if ((v10 & 1) == 0)
  {
    [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to open sidecar data archive for reading" object:v7 underlyingError:v11];
    int v32 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  id v83 = 0;
  id v84 = 0;
  id v82 = v11;
  char v13 = [v9 decodeData:&v84 filename:&v83 error:&v82];
  id v14 = v84;
  id v15 = v83;
  id v16 = v82;

  if ((v13 & 1) == 0)
  {
    char v34 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to decode contents plist data" object:v9 underlyingError:v16];
LABEL_24:
    int v32 = 0;
    *a4 = v34;
    goto LABEL_31;
  }
  if (([v15 isEqualToString:@"contents.plist"] & 1) == 0)
  {
    char v34 = [MEMORY[0x1E4F7A438] invalidError:@"Expected contents.plist data" object:v15];
    goto LABEL_24;
  }
  id v81 = 0;
  id v62 = a1;
  BOOL v17 = [a1 _loadContentsDictionaryFromData:v14 error:&v81];
  id v18 = v81;

  if (!v17)
  {
    int v32 = 0;
    goto LABEL_30;
  }
  [v8 setObject:v14 forKeyedSubscript:@"contents.plist"];
  [v17 objectForKeyedSubscript:@"maskIdentifiers"];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v69 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
  if (!v69) {
    goto LABEL_16;
  }
  uint64_t v68 = *(void *)v78;
  id v60 = v14;
  v61 = a4;
  v63 = v17;
  id v65 = v15;
  while (2)
  {
    uint64_t v19 = 0;
    id v20 = v18;
    do
    {
      uint64_t v21 = v8;
      if (*(void *)v78 != v68) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void *)(*((void *)&v77 + 1) + 8 * v19);
      id v75 = 0;
      id v76 = 0;
      id v74 = v20;
      char v23 = [v9 decodeData:&v76 filename:&v75 error:&v74];
      id v24 = v76;
      id v25 = v75;
      id v18 = v74;

      if ((v23 & 1) == 0)
      {
        id *v61 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to decode mask image data" object:v9 underlyingError:v18];
LABEL_28:
        id v8 = v21;

        int v32 = 0;
        id v15 = v65;
        v33 = obj;
        BOOL v27 = obj;
        id v14 = v60;
        BOOL v17 = v63;
        goto LABEL_29;
      }
      uint64_t v26 = [NSString stringWithFormat:@"masks/%@", v22];
      if (![v25 isEqualToString:v26])
      {
        id v35 = [NSString stringWithFormat:@"Expected %@ data", v26];
        id *v61 = [MEMORY[0x1E4F7A438] invalidError:v35 object:v25];

        goto LABEL_28;
      }
      id v8 = v21;
      [v21 setObject:v24 forKeyedSubscript:v26];

      ++v19;
      id v20 = v18;
    }
    while (v69 != v19);
    id v14 = v60;
    a4 = v61;
    BOOL v17 = v63;
    id v15 = v65;
    uint64_t v69 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v69) {
      continue;
    }
    break;
  }
LABEL_16:

  BOOL v27 = [v17 objectForKeyedSubscript:@"hasBrushStrokeHistory"];
  if ([v27 BOOLValue])
  {
    long long v70 = v27;
    id v71 = v18;
    uint64_t v64 = v17;
    id v66 = v15;
    id v72 = 0;
    id v73 = 0;
    char v28 = [v9 decodeData:&v73 filename:&v72 error:&v71];
    id v29 = v73;
    id v30 = v72;
    id v31 = v71;

    if (v28)
    {
      if ([v30 isEqualToString:@"BrushStrokeHistory.plist"])
      {
        [v8 setObject:v29 forKeyedSubscript:@"BrushStrokeHistory.plist"];

        id v18 = v31;
        BOOL v17 = v64;
        id v15 = v66;
        BOOL v27 = v70;
        goto LABEL_20;
      }
      id v37 = [MEMORY[0x1E4F7A438] mismatchError:@"Unexpected brush stroke history file name" object:v30];
    }
    else
    {
      id v37 = [MEMORY[0x1E4F7A438] errorWithCode:1 reason:@"Failed to decode brush history data" object:v9 underlyingError:v31];
    }
    BOOL v17 = v64;
    *a4 = v37;

    int v32 = 0;
    id v18 = v31;
    id v15 = v66;
    v33 = obj;
    BOOL v27 = v70;
  }
  else
  {
LABEL_20:
    int v32 = [v62 loadFromDictionary:v8 error:a4];
    v33 = obj;
  }
LABEL_29:

LABEL_30:
  id v16 = v18;
LABEL_31:

  char v12 = v16;
LABEL_32:

  return v32;
}

@end