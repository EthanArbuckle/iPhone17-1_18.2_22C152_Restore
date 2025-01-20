@interface CRE5MLUtilities
+ (id)E5RTProgramLibraryCompilationOptionsForModelSource:(id)a3;
+ (id)E5RTProgramLibraryForModelURL:(id)a3 error:(id *)a4;
+ (id)newE5RTExecutionOutputsForFunctionDescriptor:(id)a3 error:(id *)a4;
+ (id)newImageInputsForFunctionDescriptor:(id)a3 croppedPixelBuffer:(__CVBuffer *)a4 error:(id *)a5;
+ (id)newInputsForFunctionDescriptor:(id)a3 surface:(__IOSurface *)a4 isImage:(BOOL)a5 error:(id *)a6;
@end

@implementation CRE5MLUtilities

+ (id)E5RTProgramLibraryForModelURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([MEMORY[0x1E4FB3E88] isProgramLibraryAtURL:v6])
  {
    v7 = [MEMORY[0x1E4FB3E88] programLibraryForURL:v6 error:a4];
  }
  else if ([MEMORY[0x1E4FB3E80] isModelSourceURL:v6])
  {
    v8 = [MEMORY[0x1E4FB3E80] modelSourceFromURL:v6 error:a4];
    if (v8)
    {
      v9 = [a1 E5RTProgramLibraryCompilationOptionsForModelSource:v8];
      if (v9)
      {
        v7 = [MEMORY[0x1E4FB3E88] compileModelSource:v8 options:v9 error:a4];
      }
      else if (a4)
      {
        +[CRImageReader errorWithErrorCode:-8];
        v7 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)E5RTProgramLibraryCompilationOptionsForModelSource:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB3E90]);
  return v3;
}

+ (id)newImageInputsForFunctionDescriptor:(id)a3 croppedPixelBuffer:(__CVBuffer *)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4FB3ED8]);
  if (!a4) {
    goto LABEL_4;
  }
  v9 = [v7 onlyInputImage];
  if (!v9)
  {
    if (a5)
    {
      +[CRImageReader errorWithErrorCode:-8];
      id v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    id v13 = 0;
    goto LABEL_8;
  }
  v10 = v9;
  v11 = [v9 name];
  int v12 = [v8 assignPixelBuffer:a4 toName:v11 error:a5];

  if (!v12) {
    goto LABEL_7;
  }
LABEL_4:
  id v13 = v8;
LABEL_8:

  return v13;
}

+ (id)newInputsForFunctionDescriptor:(id)a3 surface:(__IOSurface *)a4 isImage:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(MEMORY[0x1E4FB3ED8]);
  if (a4)
  {
    if (v7)
    {
      v11 = [v9 onlyInputImage];
      if (!v11) {
        goto LABEL_9;
      }
    }
    else
    {
      int v12 = [v9 allInputs];
      uint64_t v13 = [v12 count];

      if (v13 != 1
        || ([v9 allInputs],
            v14 = objc_claimAutoreleasedReturnValue(),
            [v14 firstObject],
            v11 = objc_claimAutoreleasedReturnValue(),
            v14,
            !v11))
      {
LABEL_9:
        if (a6)
        {
          +[CRImageReader errorWithErrorCode:-8];
          id v17 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
LABEL_11:
        id v17 = 0;
        goto LABEL_12;
      }
    }
    v15 = [v11 name];
    int v16 = [v10 assignSurface:a4 toName:v15 error:a6];

    if (!v16) {
      goto LABEL_11;
    }
  }
  id v17 = v10;
LABEL_12:

  return v17;
}

+ (id)newE5RTExecutionOutputsForFunctionDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB3ED8]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v7 = objc_msgSend(v5, "allOutputs", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (![*(id *)(*((void *)&v14 + 1) + 8 * v11) E5RTExecutionContextAssignNewTensorInstanceToNamedObjects:v6 error:a4])
        {

          id v12 = 0;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v12 = v6;
LABEL_11:

  return v12;
}

@end