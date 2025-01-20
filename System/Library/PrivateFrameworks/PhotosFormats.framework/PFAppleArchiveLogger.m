@interface PFAppleArchiveLogger
+ (BOOL)encodeFile:(id)a3 destination:(id)a4 error:(id *)a5;
- (BOOL)encodeBuffer:(const void *)a3 size:(unint64_t)a4 error:(id *)a5;
- (BOOL)flush:(id *)a3;
- (PFAppleArchiveLogger)initWithArchiveURL:(id)a3;
@end

@implementation PFAppleArchiveLogger

- (BOOL)encodeBuffer:(const void *)a3 size:(unint64_t)a4 error:(id *)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    _PFAssertFailHandler();
    goto LABEL_10;
  }
  if (!a4)
  {
LABEL_10:
    _PFAssertFailHandler();
    goto LABEL_11;
  }
  if (!self->super._outputStream)
  {
LABEL_11:
    _PFAssertFailHandler();
LABEL_12:
    _PFAssertFailHandler();
  }
  compressionStream = self->super._compressionStream;
  if (!compressionStream) {
    goto LABEL_12;
  }
  ssize_t v8 = AAByteStreamWrite(compressionStream, a3, a4);
  ssize_t v9 = v8;
  if (a5 && v8 != a4)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = [NSString stringWithFormat:@"%@", @"Failed to write to stream", *MEMORY[0x1E4F28228]];
    v15[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a5 = [v10 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v12];
  }
  return v9 == a4;
}

- (BOOL)flush:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (self->super._compressionStream)
  {
    int v4 = AAByteStreamFlush();
    if (a3 && v4)
    {
      v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v6 = v4;
      v7 = [NSString stringWithFormat:@"%@", @"Failed to flush compression stream", *MEMORY[0x1E4F28228]];
      v11[0] = v7;
      ssize_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      *a3 = [v5 errorWithDomain:@"com.apple.PhotosFormats" code:v6 userInfo:v8];

      return 0;
    }
    if (v4) {
      return 0;
    }
  }
  return 1;
}

- (PFAppleArchiveLogger)initWithArchiveURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFAppleArchiveLogger;
  v3 = [(PFAppleArchiveStream *)&v6 initWithArchiveURL:a3];
  int v4 = v3;
  if (v3)
  {
    [(PFAppleArchiveStream *)v3 setAppendToExistingArchive:1];
    [(PFAppleArchiveStream *)v4 setBlockSize:0x10000];
  }
  return v4;
}

+ (BOOL)encodeFile:(id)a3 destination:(id)a4 error:(id *)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [a3 path];
  int v9 = open((const char *)[v8 fileSystemRepresentation], 0, 0);

  if (v9 < 0)
  {
    if (!a5)
    {
      char v24 = 0;
      goto LABEL_23;
    }
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28228];
    p_isa = [NSString stringWithFormat:@"%@", @"failed to open encode source"];
    v35[0] = p_isa;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    *a5 = [v19 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v20];
  }
  else
  {
    uint64_t v10 = [[PFAppleArchiveLogger alloc] initWithArchiveURL:v7];
    if (v10)
    {
      p_isa = &v10->super.super.isa;
      [(PFAppleArchiveStream *)v10 setAppendToExistingArchive:0];
      if ([p_isa openForWriting:a5])
      {
        v12 = (AAByteStream_impl *)p_isa[3];
        while (1)
        {
          ssize_t v13 = read(v9, buf, 0x1000uLL);
          if (v13 < 1) {
            break;
          }
          if (AAByteStreamWrite(v12, buf, v13) != v13)
          {
            if (!a5) {
              goto LABEL_20;
            }
            uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v29 = *MEMORY[0x1E4F28228];
            v15 = [NSString stringWithFormat:@"%@", @"Failed to write to stream"];
            v30 = v15;
            v16 = (void *)MEMORY[0x1E4F1C9E8];
            v17 = &v30;
            v18 = &v29;
            goto LABEL_19;
          }
        }
        if ((v13 & 0x8000000000000000) == 0)
        {
          close(v9);
          char v24 = [p_isa close:a5];
          goto LABEL_22;
        }
        if (a5)
        {
          uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
          v15 = [NSString stringWithFormat:@"%@", @"Failed to write to stream", *MEMORY[0x1E4F28228]];
          v28 = v15;
          v16 = (void *)MEMORY[0x1E4F1C9E8];
          v17 = &v28;
          v18 = &v27;
LABEL_19:
          v25 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:1];
          *a5 = [v14 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v25];
        }
LABEL_20:
        close(v9);
      }
    }
    else
    {
      if (a5)
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v32 = *MEMORY[0x1E4F28228];
        v22 = [NSString stringWithFormat:@"%@", @"failed to make archive logger"];
        v33 = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        *a5 = [v21 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v23];
      }
      p_isa = 0;
    }
  }
  char v24 = 0;
LABEL_22:

LABEL_23:
  return v24;
}

@end