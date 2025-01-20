@interface PhotosControlCommand
+ (const)optstring;
+ (id)abbreviations;
+ (id)name;
+ (int64_t)minimumArgs;
+ (option)longopts;
- (BOOL)processArgc:(int)a3 argv:(char *)a4;
- (BOOL)processOption:(int)a3 arg:(id)a4;
- (BOOL)writeData:(id)a3 toPathOrStdout:(id)a4;
- (PhotosControlCommand)init;
- (PhotosControlCommand)initWithArgc:(int)a3 argv:(char *)a4;
- (id)args;
- (id)dataForPathOrStdin:(id)a3;
- (id)description;
- (id)formatDuration:(double)a3;
- (id)invokedName;
- (id)libraryURLFromArgument:(id)a3;
- (int)run;
- (void)_output:(uint64_t)a3 arguments:(FILE *)a4 file:;
- (void)output:(id)a3;
- (void)output:(id)a3 arguments:(char *)a4;
- (void)outputCompactJsonObject:(id)a3;
- (void)outputError:(id)a3;
- (void)outputError:(id)a3 arguments:(char *)a4;
- (void)outputErrorWithJsonOutput:(BOOL)a3 format:(id)a4;
- (void)outputJsonObject:(id)a3;
@end

@implementation PhotosControlCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_args, 0);
  objc_storeStrong((id *)&self->_invokedName, 0);
}

- (id)libraryURLFromArgument:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 integerValue];
  v6 = [NSNumber numberWithInteger:v5];
  v7 = [v6 stringValue];
  int v8 = [v7 isEqualToString:v4];

  if (v8)
  {
    if ((unint64_t)(v5 - 1) >= 3)
    {
      if (!v5)
      {
        v11 = [NSNumber numberWithInteger:0];
        v12 = PLStringFromWellKnownPhotoLibraryIdentifier();
        [(PhotosControlCommand *)self outputError:@"Library identifier %@ (%@) is not valid in this context\n", v11, v12];
      }
    }
    else
    {
      v9 = [MEMORY[0x1E4F8B980] wellKnownPhotoLibraryURLForIdentifier:v5];
      v10 = PLStringFromWellKnownPhotoLibraryIdentifier();
      [(PhotosControlCommand *)self output:@"Selected %@ at %@\n", v10, v9];

      if (v9) {
        goto LABEL_20;
      }
    }
  }
  uint64_t v33 = 0;
  int valid = PLIsValidUUIDString();
  id v31 = 0;
  id v32 = 0;
  int v14 = PLPhotoLibraryIdentifierDecodeIdentifierPropertiesFromArchivalStringRepresentation(v4, &v32, &v31, &v33);
  id v15 = v32;
  id v16 = v31;
  if ((valid & 1) != 0 || v14)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F8B968]);
    v19 = [v18 libraryManagementClient];
    v20 = objc_alloc_init(PLPhotoLibrarySearchCriteria);
    v21 = v20;
    v29 = self;
    if (valid)
    {
      [(PLPhotoLibrarySearchCriteria *)v20 setUuid:v4];
    }
    else
    {
      [(PLPhotoLibrarySearchCriteria *)v20 setUuid:v15];
      [(PLPhotoLibrarySearchCriteria *)v21 setContainerIdentifier:v16];
      [(PLPhotoLibrarySearchCriteria *)v21 setDomain:v33];
    }
    id v30 = 0;
    v28 = v19;
    v22 = [v19 findPhotoLibraryIdentifiersMatchingSearchCriteria:v21 error:&v30];
    v23 = (__CFString *)v30;
    v24 = [v22 firstObject];
    v9 = [v24 libraryURL];

    if (v9)
    {
      v25 = [v9 path];
      [(PhotosControlCommand *)v29 output:@"Found library with identifier %@ at %@\n", v4, v25];
    }
    else
    {
      v26 = @"No match";
      if (!v22) {
        v26 = v23;
      }
      [(PhotosControlCommand *)v29 outputError:@"Failed to find library with identifier %@: %@\n", v4, v26];
    }
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1CB10]);
    id v18 = [v4 stringByStandardizingPath];
    v9 = (void *)[v17 initFileURLWithPath:v18 isDirectory:1];
  }

LABEL_20:
  return v9;
}

- (id)formatDuration:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 == 0.0)
  {
    v3 = @"0.0 s";
  }
  else
  {
    double v4 = a3;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [&unk_1EEBF2090 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(&unk_1EEBF2090);
          }
          if (fabs(v4) >= 1.0)
          {
            [NSString stringWithFormat:@"%3.2f %@", *(void *)&v4, *(void *)(*((void *)&v11 + 1) + 8 * v8)];
            goto LABEL_13;
          }
          double v4 = v4 * 1000.0;
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [&unk_1EEBF2090 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%3.2f ns", *(void *)&v4, v10);
LABEL_13:
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)writeData:(id)a3 toPathOrStdout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PhotosControlCommand.m", 291, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"PhotosControlCommand.m", 292, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

LABEL_3:
  if ([v9 isEqualToString:@"-"])
  {
    uint64_t v10 = [MEMORY[0x1E4F28CB0] fileHandleWithStandardOutput];
    id v21 = 0;
    char v11 = [v10 writeData:v7 error:&v21];
    id v12 = v21;

    if (v11)
    {
      char v13 = 1;
    }
    else
    {
      [(PhotosControlCommand *)self outputError:@"Unable to write data to standard output: %@\n", v12];
      char v13 = 0;
    }
  }
  else
  {
    long long v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
    id v20 = 0;
    char v13 = [v7 writeToURL:v14 options:0 error:&v20];
    id v15 = v20;
    uint64_t v16 = v15;
    if ((v13 & 1) == 0) {
      [(PhotosControlCommand *)self outputError:@"Unable to write data to %@: %@\n", v9, v15];
    }

    id v12 = 0;
  }

  return v13;
}

- (id)dataForPathOrStdin:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PhotosControlCommand.m", 269, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  if (![v5 isEqualToString:@"-"])
  {
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
    id v13 = 0;
    id v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8 options:0 error:&v13];
    id v9 = v13;
    if (!v7 || ![v7 length])
    {
      [(PhotosControlCommand *)self outputError:@"Unable to read data of file at path %@: %@\n", v5, v9];

      goto LABEL_12;
    }

LABEL_10:
    id v7 = v7;
    uint64_t v10 = v7;
    goto LABEL_13;
  }
  uint64_t v6 = [MEMORY[0x1E4F28CB0] fileHandleWithStandardInput];
  id v7 = [v6 readDataToEndOfFile];

  if (v7 && [v7 length]) {
    goto LABEL_10;
  }
  [(PhotosControlCommand *)self outputError:@"Unable to read data from standard input\n"];
LABEL_12:
  uint64_t v10 = 0;
LABEL_13:

  return v10;
}

- (void)outputError:(id)a3 arguments:(char *)a4
{
}

- (void)_output:(uint64_t)a3 arguments:(FILE *)a4 file:
{
  if (a1)
  {
    uint64_t v6 = (objc_class *)NSString;
    id v7 = a2;
    id v8 = (void *)[[v6 alloc] initWithFormat:v7 arguments:a3];

    id v9 = v8;
    fputs((const char *)[v9 UTF8String], a4);
  }
}

- (void)output:(id)a3 arguments:(char *)a4
{
}

- (void)outputErrorWithJsonOutput:(BOOL)a3 format:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v10 = @"error";
    id v5 = (objc_class *)NSString;
    id v6 = a4;
    id v7 = (id)[[v5 alloc] initWithFormat:v6 arguments:&v12];

    v11[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [(PhotosControlCommand *)self outputJsonObject:v8];
  }
  else
  {
    id v9 = (FILE *)*MEMORY[0x1E4F143C8];
    id v7 = a4;
    -[PhotosControlCommand _output:arguments:file:]((uint64_t)self, v7, (uint64_t)&v12, v9);
  }
}

- (void)outputError:(id)a3
{
  -[PhotosControlCommand _output:arguments:file:]((uint64_t)self, a3, (uint64_t)&v3, (FILE *)*MEMORY[0x1E4F143C8]);
}

- (void)output:(id)a3
{
  -[PhotosControlCommand _output:arguments:file:]((uint64_t)self, a3, (uint64_t)&v3, (FILE *)*MEMORY[0x1E4F143D8]);
}

- (void)outputCompactJsonObject:(id)a3
{
  uint64_t v6 = 0;
  double v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:0 error:&v6];
  if (v4)
  {
    id v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    [(PhotosControlCommand *)self output:@"%@\n", v5];
  }
}

- (void)outputJsonObject:(id)a3
{
  uint64_t v6 = 0;
  double v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:1 error:&v6];
  if (v4)
  {
    id v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    [(PhotosControlCommand *)self output:@"%@\n", v5];
  }
}

- (id)invokedName
{
  return self->_invokedName;
}

- (id)args
{
  return self->_args;
}

- (int)run
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  [(PhotosControlCommand *)self outputError:@"%@ must implement '- (int)run'\n", v4];

  return 70;
}

- (BOOL)processOption:(int)a3 arg:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = NSStringFromSelector(a2);
  [v5 raise:v6, @"%@ must implement %@ to support option processing", v8, v9 format];

  return 0;
}

- (BOOL)processArgc:(int)a3 argv:(char *)a4
{
  uint64_t v7 = [(id)objc_opt_class() minimumArgs];
  uint64_t v8 = [(id)objc_opt_class() maximumArgs];
  if (v7 > a3)
  {
    args = [(id)objc_opt_class() name];
    [(PhotosControlCommand *)self outputError:@"command '%@' expects at least %ld non-option arguments\n", args, v7];
LABEL_5:
    BOOL v11 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = v8;
  if (v8 < a3)
  {
    args = [(id)objc_opt_class() name];
    [(PhotosControlCommand *)self outputError:@"command '%@' expects at most %ld non-option arguments\n", args, v10];
    goto LABEL_5;
  }
  uint64_t v12 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
  if (a3 >= 1)
  {
    uint64_t v13 = a3;
    do
    {
      uint64_t v14 = (uint64_t)*a4++;
      id v15 = [NSString stringWithUTF8String:v14];
      [(NSArray *)v12 addObject:v15];

      --v13;
    }
    while (v13);
  }
  args = self->_args;
  self->_args = v12;
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (id)description
{
  id v2 = [NSString alloc];
  uint64_t v3 = [(id)objc_opt_class() name];
  double v4 = [(id)objc_opt_class() usage];
  id v5 = (void *)[v2 initWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (PhotosControlCommand)initWithArgc:(int)a3 argv:(char *)a4
{
  v28.receiver = self;
  v28.super_class = (Class)PhotosControlCommand;
  uint64_t v6 = [(PhotosControlCommand *)&v28 init];
  if (!v6) {
    return v6;
  }
  uint64_t v7 = (a3 - 1);
  if (a3 >= 1)
  {
    uint64_t v8 = [NSString stringWithUTF8String:*a4];
    invokedName = v6->_invokedName;
    v6->_invokedName = (NSString *)v8;
  }
  [(PhotosControlCommand *)v6 willProcessOptions];
  uint64_t v10 = (const option *)[(id)objc_opt_class() longopts];
  uint64_t v11 = [(id)objc_opt_class() optstring];
  uint64_t v12 = (const char *)v11;
  if (v10)
  {
    if (!v11)
    {
      v23 = (FILE *)*MEMORY[0x1E4F143C8];
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      id v25 = objc_claimAutoreleasedReturnValue();
      fprintf(v23, "command '%s' supplied longopts but not optstring\n", (const char *)[v25 UTF8String]);

LABEL_28:
      return 0;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F149E8];
    while (1)
    {
      uint64_t v14 = getopt_long(a3, a4, v12, v10, 0);
      if (v14 == -1) {
        goto LABEL_25;
      }
      uint64_t v15 = v14;
      if (v14 == 63) {
        goto LABEL_28;
      }
      if (*v13)
      {
        uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:");
        BOOL v17 = [(PhotosControlCommand *)v6 processOption:v15 arg:v16];

        if (!v17) {
          goto LABEL_13;
        }
      }
      else if (![(PhotosControlCommand *)v6 processOption:v14 arg:0])
      {
LABEL_13:
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "unsupported option: %c\n", v15);
        goto LABEL_28;
      }
    }
  }
  if (v11)
  {
    id v18 = (void *)MEMORY[0x1E4F149E8];
    while (1)
    {
      uint64_t v19 = getopt(a3, a4, v12);
      if (v19 == -1) {
        break;
      }
      uint64_t v20 = v19;
      if (v19 == 63) {
        goto LABEL_22;
      }
      if (*v18)
      {
        id v21 = objc_msgSend(NSString, "stringWithUTF8String:");
        BOOL v22 = [(PhotosControlCommand *)v6 processOption:v20 arg:v21];

        if (!v22) {
          goto LABEL_22;
        }
      }
      else if (![(PhotosControlCommand *)v6 processOption:v19 arg:0])
      {
LABEL_22:
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "unsupported option: %c\n", v20);
        goto LABEL_28;
      }
    }
LABEL_25:
    uint64_t v26 = (int)*MEMORY[0x1E4F149F8];
    uint64_t v7 = (a3 - v26);
    goto LABEL_27;
  }
  uint64_t v26 = 1;
LABEL_27:
  if (![(PhotosControlCommand *)v6 processArgc:v7 argv:&a4[v26]]) {
    goto LABEL_28;
  }
  return v6;
}

- (PhotosControlCommand)init
{
  return 0;
}

+ (int64_t)minimumArgs
{
  return 0;
}

+ (option)longopts
{
  return 0;
}

+ (const)optstring
{
  return 0;
}

+ (id)abbreviations
{
  return 0;
}

+ (id)name
{
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  if ([v3 hasPrefix:@"PhotosCtl"])
  {
    uint64_t v4 = [@"PhotosCtl" length];
    uint64_t v5 = [v3 length];
    uint64_t v6 = v5 - [@"PhotosCtl" length];
    if ([v3 hasSuffix:@"Command"]) {
      uint64_t v7 = v6 - 7;
    }
    else {
      uint64_t v7 = v6;
    }
    uint64_t v8 = objc_msgSend(v3, "substringWithRange:", v4, v7);
    id v9 = [v8 lowercaseString];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"class %@ must be named with prefix %@", v3, @"PhotosCtl" format];
    id v9 = v3;
  }

  return v9;
}

@end