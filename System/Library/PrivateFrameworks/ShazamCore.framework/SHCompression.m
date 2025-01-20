@interface SHCompression
+ (BOOL)decompressAppleArchiveAtURL:(id)a3 toDirectoryURL:(id)a4 error:(id *)a5;
+ (BOOL)decompressFile:(id)a3 withAlgorithm:(int)a4 toLocation:(id)a5 error:(id *)a6;
+ (int)supportedCompressionTypeFromFilePathExtension:(id)a3;
+ (int)supportedCompressionTypeFromFileURL:(id)a3;
@end

@implementation SHCompression

+ (int)supportedCompressionTypeFromFilePathExtension:(id)a3
{
  return +[SHDataCompression supportedCompressionTypeFromFilePathExtension:a3];
}

+ (int)supportedCompressionTypeFromFileURL:(id)a3
{
  return +[SHDataCompression supportedCompressionTypeFromFileURL:a3];
}

+ (BOOL)decompressFile:(id)a3 withAlgorithm:(int)a4 toLocation:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = a3;
  v11 = objc_alloc_init(SHDataStreamInput);
  id v12 = [[SHDataCompression alloc] initForDecompressionWithAlgorithm:v7];
  [(SHDataStreamInput *)v11 setNext:v12];
  v13 = [[SHDataStreamOutput alloc] initWithDestination:v9];

  [v12 setNext:v13];
  LOBYTE(a6) = [(SHDataStreamInput *)v11 loadDataFromURL:v10 error:a6];

  return (char)a6;
}

+ (BOOL)decompressAppleArchiveAtURL:(id)a3 toDirectoryURL:(id)a4 error:(id *)a5
{
  v57[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = (__CFString *)a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7 || !v8)
  {
    v27 = [NSString stringWithFormat:@"Failed to archive. Archive path %@ or destination path %@ is nil.", v7, v8];
    uint64_t v56 = *MEMORY[0x263F07F80];
    v57[0] = v27;
    v28 = [NSDictionary dictionaryWithObjects:v57 forKeys:&v56 count:1];
    +[SHCoreError annotateError:a5 code:302 underlyingError:0 keyOverrides:v28];

    v29 = shcore_log_object();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    v41 = v27;
LABEL_23:
    _os_log_impl(&dword_226D94000, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    goto LABEL_24;
  }
  id v10 = [(__CFString *)v7 path];
  v11 = AAFileStreamOpenWithPath((const char *)[v10 fileSystemRepresentation], 0, 0x1A4u);

  if (!v11)
  {
    v27 = [NSString stringWithFormat:@"Failed to open source apple archive file at %@.", v7];
    uint64_t v54 = *MEMORY[0x263F07F80];
    v55 = v27;
    v30 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    +[SHCoreError annotateError:a5 code:302 underlyingError:0 keyOverrides:v30];

    v29 = shcore_log_object();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    v41 = v27;
    goto LABEL_23;
  }
  id v12 = AADecompressionInputStreamOpen(v11, 0, 0);
  if (!v12)
  {
    AAByteStreamClose(v11);
    v27 = [NSString stringWithFormat:@"Failed to open archive decompressed input stream at %@.", v7];
    uint64_t v52 = *MEMORY[0x263F07F80];
    v53 = v27;
    v31 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    +[SHCoreError annotateError:a5 code:302 underlyingError:0 keyOverrides:v31];

    v29 = shcore_log_object();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    v41 = v27;
    goto LABEL_23;
  }
  v13 = v12;
  AAArchiveStream v14 = AADecodeArchiveInputStreamOpen(v12, 0, 0, 0, 0);
  if (v14)
  {
    v15 = v14;
    unsigned __int8 v39 = 0;
    v16 = [MEMORY[0x263F08850] defaultManager];
    v17 = [v9 path];
    int v18 = [v16 fileExistsAtPath:v17 isDirectory:&v39];
    int v19 = v39;

    if (!v18 || !v19)
    {
      v20 = [MEMORY[0x263F08850] defaultManager];
      id v38 = 0;
      int v21 = [v20 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v38];
      v22 = v38;

      if (!v21)
      {
        AAByteStreamClose(v13);
        AAByteStreamClose(v11);
        AAArchiveStreamClose(v15);
        v27 = [NSString stringWithFormat:@"Failed to create directory at url %@.", v9];
        uint64_t v48 = *MEMORY[0x263F07F80];
        v49 = v27;
        v35 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        +[SHCoreError annotateError:a5 code:302 underlyingError:v22 keyOverrides:v35];

        v36 = shcore_log_object();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v27;
          _os_log_impl(&dword_226D94000, v36, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        goto LABEL_34;
      }
    }
    id v23 = [v9 path];
    v24 = AAExtractArchiveOutputStreamOpen((const char *)[v23 fileSystemRepresentation], 0, 0, 1uLL, 0);

    if (v24)
    {
      ssize_t v25 = AAArchiveStreamProcess(v15, v24, 0, 0, 0, 0);
      AAByteStreamClose(v13);
      AAByteStreamClose(v11);
      AAArchiveStreamClose(v15);
      AAArchiveStreamClose(v24);
      if ((v25 & 0x8000000000000000) == 0)
      {
        v22 = shcore_log_object();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v41 = v7;
          __int16 v42 = 2112;
          v43 = v9;
          _os_log_impl(&dword_226D94000, v22, OS_LOG_TYPE_DEBUG, "Extracted archive from %@ to destination: %@", buf, 0x16u);
        }
        BOOL v26 = 1;
        v27 = &stru_26DAEBAC8;
        goto LABEL_35;
      }
      v27 = [NSString stringWithFormat:@"Failed to decompress archive file %@ to destination directory %@. Stream processing failed.", v7, v9];
      uint64_t v44 = *MEMORY[0x263F07F80];
      v45 = v27;
      v37 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      +[SHCoreError annotateError:a5 code:302 underlyingError:0 keyOverrides:v37];

      v22 = shcore_log_object();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v27;
        goto LABEL_33;
      }
    }
    else
    {
      AAByteStreamClose(v13);
      AAByteStreamClose(v11);
      AAArchiveStreamClose(v15);
      v27 = [NSString stringWithFormat:@"Failed to create output directory stream at %@ for decompression.", v9];
      uint64_t v46 = *MEMORY[0x263F07F80];
      v47 = v27;
      v34 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      +[SHCoreError annotateError:a5 code:302 underlyingError:0 keyOverrides:v34];

      v22 = shcore_log_object();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v27;
LABEL_33:
        _os_log_impl(&dword_226D94000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
LABEL_34:
    BOOL v26 = 0;
LABEL_35:

    goto LABEL_25;
  }
  AAByteStreamClose(v13);
  AAByteStreamClose(v11);
  v27 = [NSString stringWithFormat:@"Failed to decode archive decompressed stream at %@.", v7];
  uint64_t v50 = *MEMORY[0x263F07F80];
  v51 = v27;
  v32 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  +[SHCoreError annotateError:a5 code:302 underlyingError:0 keyOverrides:v32];

  v29 = shcore_log_object();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v27;
    goto LABEL_23;
  }
LABEL_24:

  BOOL v26 = 0;
LABEL_25:

  return v26;
}

@end