@interface TRICPrinter
+ (id)_repeatString:(id)a3 length:(unint64_t)a4;
+ (void)_printAndLogString:(id)a3 error:(BOOL)a4;
+ (void)printAndLogDefaultWithFormat:(id)a3;
+ (void)printAndLogErrorWithFormat:(id)a3;
+ (void)printNewlineAndLogDefaultWithFormat:(id)a3;
+ (void)printNewlineAndLogErrorWithFormat:(id)a3;
+ (void)printNewlineUsingStderr:(BOOL)a3 format:(id)a4;
+ (void)printTabularWithLogDefaultForLines:(id)a3;
@end

@implementation TRICPrinter

+ (void)_printAndLogString:(id)a3 error:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x19F3AD060]();
  v7 = [v5 dataUsingEncoding:4];
  if (v7)
  {
    if (v4) {
      [MEMORY[0x1E4F28CB0] fileHandleWithStandardError];
    }
    else {
    v8 = [MEMORY[0x1E4F28CB0] fileHandleWithStandardOutput];
    }
    [v8 writeData:v7];
  }
  v9 = TRILogCategory_InternalTool();
  v10 = v9;
  if (v4) {
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  }
  if (os_log_type_enabled(v9, v11))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_19D909000, v10, v11, "%@", (uint8_t *)&v12, 0xCu);
  }
}

+ (void)printNewlineUsingStderr:(BOOL)a3 format:(id)a4
{
  id v5 = (objc_class *)NSString;
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithFormat:v6 arguments:&v11];

  v8 = (void *)[[NSString alloc] initWithFormat:@"%@\n", v7];
  v9 = [v8 dataUsingEncoding:4];
  if (v9)
  {
    if (a3) {
      [MEMORY[0x1E4F28CB0] fileHandleWithStandardError];
    }
    else {
    v10 = [MEMORY[0x1E4F28CB0] fileHandleWithStandardOutput];
    }
    [v10 writeData:v9];
  }
}

+ (void)printAndLogDefaultWithFormat:(id)a3
{
  BOOL v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [a1 _printAndLogString:v6 error:0];
}

+ (void)printAndLogErrorWithFormat:(id)a3
{
  BOOL v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [a1 _printAndLogString:v6 error:1];
}

+ (void)printNewlineAndLogDefaultWithFormat:(id)a3
{
  BOOL v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v8];

  uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"%@\n", v6];
  [a1 _printAndLogString:v7 error:0];
}

+ (void)printNewlineAndLogErrorWithFormat:(id)a3
{
  BOOL v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v8];

  uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"%@\n", v6];
  [a1 _printAndLogString:v7 error:1];
}

+ (void)printTabularWithLogDefaultForLines:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v16 = a1;
    id v5 = [v4 objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 count];

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
    if (v6)
    {
      uint64_t v8 = v6;
      do
      {
        [v7 addObject:&unk_1EEFCBDF8];
        --v8;
      }
      while (v8);
    }
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v4;
    uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          int v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v12 count] != v6)
          {
            uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
            v15 = [NSString stringWithUTF8String:"+[TRICPrinter printTabularWithLogDefaultForLines:]"];
            [v14 handleFailureInFunction:v15 file:@"TRICPrinter.m" lineNumber:97 description:@"Tabular data has mismatched column counts"];
          }
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __50__TRICPrinter_printTabularWithLogDefaultForLines___block_invoke;
          v22[3] = &unk_1E596A1E8;
          id v23 = v7;
          v24 = v29;
          [v12 enumerateObjectsUsingBlock:v22];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__TRICPrinter_printTabularWithLogDefaultForLines___block_invoke_2;
    v18[3] = &unk_1E596A238;
    uint64_t v20 = v6;
    id v21 = v16;
    id v13 = v7;
    id v19 = v13;
    [obj enumerateObjectsUsingBlock:v18];

    _Block_object_dispose(v29, 8);
  }
}

void __50__TRICPrinter_printTabularWithLogDefaultForLines___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)NSNumber;
  id v6 = a2;
  id v7 = [v5 alloc];
  unint64_t v8 = [v6 length];
  uint64_t v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  unint64_t v10 = [v9 unsignedIntegerValue];

  if (v8 <= v10) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v8;
  }
  int v12 = (void *)[v7 initWithUnsignedInteger:v11];
  [*(id *)(a1 + 32) setObject:v12 atIndexedSubscript:a3];

  unint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v14 = [v6 length];

  if (v13 <= v14) {
    unint64_t v15 = v14;
  }
  else {
    unint64_t v15 = v13;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v15;
}

void __50__TRICPrinter_printTabularWithLogDefaultForLines___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a2;
  id v7 = (void *)[[v5 alloc] initWithCapacity:*(void *)(a1 + 40)];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  unint64_t v14 = __50__TRICPrinter_printTabularWithLogDefaultForLines___block_invoke_3;
  unint64_t v15 = &unk_1E596A210;
  uint64_t v18 = *(void *)(a1 + 48);
  id v16 = *(id *)(a1 + 32);
  id v8 = v7;
  id v17 = v8;
  [v6 enumerateObjectsUsingBlock:&v12];

  uint64_t v9 = [v8 componentsJoinedByString:@"|"];
  [*(id *)(a1 + 48) printNewlineAndLogDefaultWithFormat:@"%@", v9, v12, v13, v14, v15];
  if (!a3)
  {
    unint64_t v10 = *(void **)(a1 + 48);
    unint64_t v11 = objc_msgSend(v10, "_repeatString:length:", @"-", objc_msgSend(v9, "length"));
    [v10 printNewlineAndLogDefaultWithFormat:@"%@", v11];
  }
}

void __50__TRICPrinter_printTabularWithLogDefaultForLines___block_invoke_3(void *a1, void *a2, uint64_t a3)
{
  id v5 = (void *)a1[6];
  id v6 = (void *)a1[4];
  id v7 = a2;
  id v8 = [v6 objectAtIndexedSubscript:a3];
  objc_msgSend(v5, "_repeatString:length:", @" ", objc_msgSend(v8, "unsignedIntegerValue") - objc_msgSend(v7, "length"));
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = (void *)a1[5];
  unint64_t v10 = (void *)[[NSString alloc] initWithFormat:@" %@%@ ", v7, v11];

  [v9 addObject:v10];
}

+ (id)_repeatString:(id)a3 length:(unint64_t)a4
{
  id v5 = a3;
  for (uint64_t i = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(v5, "length") * a4);
        a4;
        --a4)
  {
    [i appendString:v5];
  }

  return i;
}

@end