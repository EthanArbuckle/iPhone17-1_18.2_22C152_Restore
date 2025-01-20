@interface TRISysdiagnoseLogWriter
- (BOOL)writeSysdiagnoseInfoForProvider:(id)a3 error:(id *)a4;
- (NSString)outputDirectory;
- (TRISysdiagnoseLogWriter)initWithDirectory:(id)a3;
@end

@implementation TRISysdiagnoseLogWriter

- (TRISysdiagnoseLogWriter)initWithDirectory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRISysdiagnoseLogWriter;
  v6 = [(TRISysdiagnoseLogWriter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_outputDirectory, a3);
  }

  return v7;
}

- (BOOL)writeSysdiagnoseInfoForProvider:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 sysdiagnoseLinesWithError:a4];
  if (v7)
  {
    char v36 = 0;
    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    objc_super v9 = [(TRISysdiagnoseLogWriter *)self outputDirectory];
    int v10 = [v8 fileExistsAtPath:v9 isDirectory:&v36];

    if (v10) {
      BOOL v11 = v36 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      v14 = [(TRISysdiagnoseLogWriter *)self outputDirectory];
      v15 = [v6 filename];
      v16 = [v14 stringByAppendingPathComponent:v15];

      v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v18 = [v17 createFileAtPath:v16 contents:0 attributes:0];

      if (v18)
      {
        v19 = [MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:v16];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v20 = v7;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          v29 = v16;
          v30 = v7;
          id v31 = v6;
          uint64_t v23 = *(void *)v33;
          while (2)
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v33 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = [*(id *)(*((void *)&v32 + 1) + 8 * i) stringByAppendingString:@"\n"];
              v26 = (void *)MEMORY[0x19F3AD060]();
              v27 = [v25 dataUsingEncoding:4];
              LODWORD(v26) = [v19 writeData:v27 error:a4];

              if (!v26)
              {
                BOOL v13 = 0;
                goto LABEL_22;
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v37 count:16];
            if (v22) {
              continue;
            }
            break;
          }
          BOOL v13 = 1;
LABEL_22:
          v7 = v30;
          id v6 = v31;
          v16 = v29;
        }
        else
        {
          BOOL v13 = 1;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
      goto LABEL_25;
    }
    if (a4)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      v39[0] = @"Provided directory doesn't exist";
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      [v12 errorWithDomain:@"TRIGeneralErrorDomain" code:12 userInfo:v16];
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

      goto LABEL_26;
    }
  }
  BOOL v13 = 0;
LABEL_26:

  return v13;
}

- (NSString)outputDirectory
{
  return self->_outputDirectory;
}

- (void).cxx_destruct
{
}

@end