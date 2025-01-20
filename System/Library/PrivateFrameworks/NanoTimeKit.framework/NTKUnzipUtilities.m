@interface NTKUnzipUtilities
+ (BOOL)unzipFile:(id)a3 toPath:(id)a4;
+ (int)_read_extract_flags;
+ (void)_printError:(id)a3;
@end

@implementation NTKUnzipUtilities

+ (BOOL)unzipFile:(id)a3 toPath:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  archive_read_new();
  archive_read_support_format_zip();
  archive_read_support_filter_gzip();
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v9 = [v7 path];
  id v36 = 0;
  [v8 createDirectoryAtPath:v9 withIntermediateDirectories:0 attributes:0 error:&v36];
  id v10 = v36;

  if (!v10)
  {
    v34 = v8;
    id v35 = a1;
    id v16 = [v7 path];
    v17 = (const char *)[v16 UTF8String];

    if (realpath_DARWIN_EXTSN(v17, v37))
    {
      v18 = (void *)MEMORY[0x1E4F1CB10];
      v19 = [NSString stringWithUTF8String:v37];
      v20 = [v18 fileURLWithPath:v19];

      id v21 = v6;
      [v21 fileSystemRepresentation];
      if (!archive_read_open_filename())
      {
        while (1)
        {
          int next_header = archive_read_next_header();
          if (next_header) {
            break;
          }
          int v24 = archive_entry_filetype();
          if (v24 != 0x8000 && v24 != 0x4000)
          {
            v32 = [NSString stringWithFormat:@"Decompression failed. This file type is not valid."];
            [v35 _printError:v32];

            goto LABEL_18;
          }
          id v25 = v6;
          v26 = [NSString stringWithUTF8String:archive_entry_pathname()];
          v27 = v20;
          v28 = [v20 path];
          v29 = [v28 stringByAppendingPathComponent:v26];

          id v30 = v29;
          [v30 UTF8String];
          archive_entry_set_pathname();
          objc_msgSend(v35, "_read_extract_flags");
          if (archive_read_extract())
          {
            v31 = [NSString stringWithFormat:@"Decompression failed. Could not extract entry: %@", v26];
            [v35 _printError:v31];

            BOOL v15 = 0;
            id v6 = v25;
            v20 = v27;
            goto LABEL_19;
          }

          id v6 = v25;
          v20 = v27;
        }
        if (next_header == 1)
        {
          BOOL v15 = 1;
          goto LABEL_19;
        }
        [v35 _printError:@"Decompression failed. Bad header."];
LABEL_18:
        BOOL v15 = 0;
LABEL_19:
        archive_read_free();
        goto LABEL_20;
      }
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Decompression failed. Could not open source: %s", objc_msgSend(v21, "fileSystemRepresentation"));
      [a1 _printError:v22];
    }
    else
    {
      v20 = objc_msgSend(NSString, "stringWithFormat:", @"Decompression failed. Could not resolve destination path: %s", v17);
      [a1 _printError:v20];
    }
    BOOL v15 = 0;
LABEL_20:

    v8 = v34;
    goto LABEL_21;
  }
  v11 = NSString;
  v12 = [v7 path];
  v13 = [v10 localizedDescription];
  v14 = [v11 stringWithFormat:@"Decompression failed. Could not create ouput folder, path: %@ due to error: %@.", v12, v13];
  [a1 _printError:v14];

  BOOL v15 = 0;
LABEL_21:

  return v15;
}

+ (int)_read_extract_flags
{
  if (_read_extract_flags_onceToken != -1) {
    dispatch_once(&_read_extract_flags_onceToken, &__block_literal_global_168);
  }
  if (_read_extract_flags_flags) {
    return 776;
  }
  else {
    return 0;
  }
}

void __40__NTKUnzipUtilities__read_extract_flags__block_invoke()
{
  _read_extract_flags_flags = 1;
}

+ (void)_printError:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[NTKUnzipUtilities _printError:]((uint64_t)a3);
  }
}

+ (void)_printError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1BC5A9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

@end