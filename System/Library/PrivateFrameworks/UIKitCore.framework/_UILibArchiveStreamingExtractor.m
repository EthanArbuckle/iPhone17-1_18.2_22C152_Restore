@interface _UILibArchiveStreamingExtractor
+ (BOOL)shouldExtractPathInArchive:(id)a3 forExtractionRootedAtStandardizedSubpathInArchive:(id)a4;
+ (id)archiveSubpathByStandardizingArchiveSubpath:(id)a3;
- (BOOL)extractArchivePath:(id)a3 toDirectory:(id)a4 error:(id *)a5;
- (NSArray)extractedContentAbsolutePaths;
- (NSString)archivePath;
- (id)initForExtractingArchivePath:(id)a3;
@end

@implementation _UILibArchiveStreamingExtractor

- (id)initForExtractingArchivePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UILibArchiveStreamingExtractor;
  v6 = [(_UILibArchiveStreamingExtractor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_archivePath, a3);
  }

  return v7;
}

+ (id)archiveSubpathByStandardizingArchiveSubpath:(id)a3
{
  v3 = [a3 stringByStandardizingPath];
  if ([v3 length] && (objc_msgSend(v3, "isEqualToString:", @"/") & 1) == 0)
  {
    v4 = @".";
    if (([v3 isEqualToString:@"."] & 1) == 0)
    {
      if ([v3 hasPrefix:@"/"])
      {
        uint64_t v6 = [v3 substringFromIndex:1];

        v3 = (void *)v6;
      }
      v4 = v3;
      v3 = v4;
    }
  }
  else
  {
    v4 = @".";
  }

  return v4;
}

+ (BOOL)shouldExtractPathInArchive:(id)a3 forExtractionRootedAtStandardizedSubpathInArchive:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"."])
  {
    char v7 = 1;
  }
  else
  {
    v8 = [v5 stringByStandardizingPath];

    char v7 = [v8 hasPrefix:v6];
    id v5 = v8;
  }

  return v7;
}

- (BOOL)extractArchivePath:(id)a3 toDirectory:(id)a4 error:(id *)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  bzero(v68, 0x400uLL);
  id v9 = v8;
  id v10 = a3;
  if (realpath_DARWIN_EXTSN((const char *)[v9 fileSystemRepresentation], v68))
  {
    id v41 = [NSString stringWithUTF8String:v68];
  }
  else
  {
    id v41 = v9;
  }

  v11 = [(id)objc_opt_class() archiveSubpathByStandardizingArchiveSubpath:v10];

  id v12 = [[_UILibArchiveStreamingReader alloc] initForReadingArchivePath:self->_archivePath];
  if ([v12 open])
  {
    ui_archive_write_disk_new();
    uint64_t v14 = v13;
    ui_archive_write_disk_set_standard_lookup(v13);
    ui_archive_write_disk_set_options(v14, 772);
    *(void *)v68 = 0;
    v69 = v68;
    uint64_t v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__68;
    v72 = __Block_byref_object_dispose__68;
    id v73 = 0;
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x2020000000;
    uint64_t v59 = 0;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x2020000000;
    uint64_t v55 = 0;
    v15 = [MEMORY[0x1E4F1CA48] array];
    id obj = [MEMORY[0x1E4F1CA48] array];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __72___UILibArchiveStreamingExtractor_extractArchivePath_toDirectory_error___block_invoke;
    v43[3] = &unk_1E52EB6E8;
    v48 = &v56;
    v43[4] = self;
    id v16 = v11;
    id v44 = v16;
    v49 = &v52;
    id v17 = v41;
    id v45 = v17;
    v50 = v68;
    uint64_t v51 = v14;
    id v18 = v15;
    id v46 = v18;
    id v19 = obj;
    id v47 = v19;
    id v42 = 0;
    [v12 readAllItemsWithBlock:v43 error:&v42];
    id v40 = v42;
    ui_archive_write_close(v14);
    ui_archive_write_finish(v14);
    [v12 close];
    if (*((void *)v69 + 5)) {
      goto LABEL_15;
    }
    uint64_t v20 = v57[3];
    if (v20)
    {
      if (v53[3])
      {
        uint64_t v20 = 0;
      }
      else
      {
        v34 = [NSString stringWithFormat:@"No items found at requested subpath %@ in archive %@", v16, self->_archivePath];
        v35 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v64 = *MEMORY[0x1E4F28568];
        v65 = v34;
        v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        uint64_t v37 = [v35 errorWithDomain:@"_UIArchiveExtractorErrorDomain" code:-1 userInfo:v36];
        v38 = (void *)*((void *)v69 + 5);
        *((void *)v69 + 5) = v37;

        uint64_t v20 = *((void *)v69 + 5);
        if (v20) {
          goto LABEL_13;
        }
      }
    }
    if (v40)
    {
      v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("DocumentInteraction", &_MergedGlobals_1018) + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v40;
        _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "encountered reading error: %@", buf, 0xCu);
      }
      v22 = [NSString stringWithFormat:@"Extractor encountered error reading source archive %@", self->_archivePath];
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      v60[0] = *MEMORY[0x1E4F28A50];
      v60[1] = v24;
      v61[0] = v40;
      v61[1] = v22;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
      uint64_t v26 = [v23 errorWithDomain:@"_UIArchiveExtractorErrorDomain" code:-1 userInfo:v25];
      v27 = (void *)*((void *)v69 + 5);
      *((void *)v69 + 5) = v26;

      uint64_t v20 = *((void *)v69 + 5);
    }
LABEL_13:
    if (!v20)
    {
      objc_storeStrong((id *)&self->_extractedContentAbsolutePaths, obj);
      if (!*((void *)v69 + 5))
      {
LABEL_19:
        _UIAppleDoubleMergeAppleDoubleItemsIntoRealFiles(v18, v17);
        LOBYTE(a5) = *((void *)v69 + 5) == 0;

        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(&v56, 8);

        _Block_object_dispose(v68, 8);
        goto LABEL_22;
      }
    }
LABEL_15:
    v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("DocumentInteraction", &qword_1EB2602B8) + 8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)*((void *)v69 + 5);
      *(_DWORD *)buf = 138412290;
      id v63 = v29;
      _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "encountered writing error: %@", buf, 0xCu);
    }
    if (a5) {
      *a5 = *((id *)v69 + 5);
    }
    goto LABEL_19;
  }
  if (a5)
  {
    v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v66 = *MEMORY[0x1E4F28568];
    v31 = [NSString stringWithFormat:@"Unable to open source archive %@ for extracting", self->_archivePath];
    v67 = v31;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    *a5 = [v30 errorWithDomain:@"_UIArchiveExtractorErrorDomain" code:-1 userInfo:v32];

    LOBYTE(a5) = 0;
  }
LABEL_22:

  return (char)a5;
}

- (NSString)archivePath
{
  return self->_archivePath;
}

- (NSArray)extractedContentAbsolutePaths
{
  return self->_extractedContentAbsolutePaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedContentAbsolutePaths, 0);
  objc_storeStrong((id *)&self->_archivePath, 0);
}

@end