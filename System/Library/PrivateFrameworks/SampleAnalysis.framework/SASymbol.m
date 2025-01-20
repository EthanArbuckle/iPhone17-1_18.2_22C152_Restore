@interface SASymbol
+ (void)symbolWithOffsetIntoSegment:(uint64_t)a3 length:(void *)a4 name:;
- (NSString)name;
- (id)addInlineSourceInfoWithOffsetIntoSegment:(uint64_t)a3 length:(int)a4 lineNum:(int)a5 columnNum:(void *)a6 filePath:;
- (id)addNonInlineSourceInfoWithOffsetIntoSegment:(uint64_t)a3 length:(int)a4 lineNum:(int)a5 columnNum:(void *)a6 filePath:;
- (id)debugDescription;
- (unint64_t)length;
- (unint64_t)offsetIntoSegment;
- (unint64_t)offsetIntoTextSegment;
@end

@implementation SASymbol

- (id)addInlineSourceInfoWithOffsetIntoSegment:(uint64_t)a3 length:(int)a4 lineNum:(int)a5 columnNum:(void *)a6 filePath:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  if (!a1)
  {
LABEL_27:
    v17 = 0;
    goto LABEL_21;
  }
  if (!a3)
  {
    int v22 = *__error();
    v23 = _sa_logt();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = [a1 debugDescription];
      *(_DWORD *)buf = 136315906;
      uint64_t v37 = [v24 UTF8String];
      __int16 v38 = 2080;
      uint64_t v39 = [v9 UTF8String];
      __int16 v40 = 1024;
      int v41 = a4;
      __int16 v42 = 1024;
      int v43 = a5;
      _os_log_error_impl(&dword_1BF22B000, v23, OS_LOG_TYPE_ERROR, "%s: inlining 0-length source info %s:%d,%d", buf, 0x22u);
    }
    *__error() = v22;
    id v25 = [a1 debugDescription];
    char v26 = [v25 UTF8String];
    [v9 UTF8String];
    _SASetCrashLogMessage(4493, "%s: inlining 0-length source info %s:%d,%d", v27, v28, v29, v30, v31, v32, v26);

    _os_crash();
    __break(1u);
    goto LABEL_27;
  }
  v10 = a1;
  objc_sync_enter(v10);
  id v11 = v10[4];
  if (!v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    id v13 = v10[4];
    v10[4] = (id)v12;

    id v11 = v10[4];
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __87__SASymbol_addInlineSourceInfoWithOffsetIntoSegment_length_lineNum_columnNum_filePath___block_invoke;
  v35[3] = &__block_descriptor_48_e22_q16__0__SASourceInfo_8l;
  v35[4] = a2;
  v35[5] = a3;
  uint64_t v14 = SABinarySearchArray(v11, 1536, (uint64_t)v35);
  uint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = v14 - 1;
    while (1)
    {
      v17 = [v10[4] objectAtIndexedSubscript:v16];
      if ([v17 offsetIntoSegment] != a2 || objc_msgSend(v17, "length") != a3) {
        break;
      }
      if (v9)
      {
        v18 = [v17 filePath];
        if (v18)
        {
          v19 = [v17 filePath];
          if ([v9 isEqualToString:v19]
            && [v17 lineNum] == a4)
          {
            BOOL v20 = [v17 columnNum] == a5;

            if (v20) {
              goto LABEL_20;
            }
          }
          else
          {
          }
        }
      }

      if (--v16 == -1) {
        goto LABEL_19;
      }
    }
  }
LABEL_19:
  v17 = +[SASourceInfo sourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]((uint64_t)SASourceInfo, a2, a3, a4, a5, v9);
  [v10[4] insertObject:v17 atIndex:v15];
LABEL_20:
  objc_sync_exit(v10);

LABEL_21:
  return v17;
}

- (id)addNonInlineSourceInfoWithOffsetIntoSegment:(uint64_t)a3 length:(int)a4 lineNum:(int)a5 columnNum:(void *)a6 filePath:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  if (a1)
  {
    uint64_t v12 = a1;
    objc_sync_enter(v12);
    id v13 = v12[4];
    if (!v13)
    {
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      id v15 = v12[4];
      v12[4] = (id)v14;

      id v13 = v12[4];
    }
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __90__SASymbol_addNonInlineSourceInfoWithOffsetIntoSegment_length_lineNum_columnNum_filePath___block_invoke;
    v35[3] = &__block_descriptor_40_e22_q16__0__SASourceInfo_8l;
    v35[4] = a2;
    unint64_t v16 = SABinarySearchArray(v13, 1280, (uint64_t)v35);
    if (v16 < [v12[4] count])
    {
      int v17 = a5;
      v18 = [v12[4] objectAtIndexedSubscript:v16];
      if ([v18 offsetIntoSegment] == a2)
      {
LABEL_18:
        objc_sync_exit(v12);

        goto LABEL_19;
      }
      unint64_t v19 = a3 + a2;
      if (a3 + a2 > [v18 offsetIntoSegment])
      {
        int v20 = *__error();
        v21 = _sa_logt();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = [v18 debugDescription];
          *(_DWORD *)buf = 138413570;
          id v37 = v11;
          __int16 v38 = 1024;
          *(_DWORD *)uint64_t v39 = a4;
          *(_WORD *)&v39[4] = 1024;
          *(_DWORD *)&v39[6] = v17;
          *(_WORD *)__int16 v40 = 2048;
          *(void *)&v40[2] = a2;
          __int16 v41 = 2048;
          unint64_t v42 = v19;
          __int16 v43 = 2112;
          uint64_t v44 = v32;
          v33 = (void *)v32;
          _os_log_error_impl(&dword_1BF22B000, v21, OS_LOG_TYPE_ERROR, "new source info %@:%d,%d (0x%llx-0x%llx) overlaps existing %@", buf, 0x36u);
        }
        *__error() = v20;
        a3 = [v18 offsetIntoSegment] - a2;
      }

      a5 = v17;
    }
    if (v16)
    {
      int v34 = a4;
      int v22 = a5;
      v23 = [v12[4] objectAtIndexedSubscript:v16 - 1];
      uint64_t v24 = [v23 offsetIntoSegment];
      if ([v23 length] + v24 > a2)
      {
        int v25 = *__error();
        char v26 = _sa_logt();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = [v23 debugDescription];
          *(_DWORD *)buf = 138413570;
          id v37 = v31;
          __int16 v38 = 2112;
          *(void *)uint64_t v39 = v11;
          *(_WORD *)&v39[8] = 1024;
          *(_DWORD *)__int16 v40 = v34;
          *(_WORD *)&v40[4] = 1024;
          *(_DWORD *)&v40[6] = v22;
          __int16 v41 = 2048;
          unint64_t v42 = a2;
          __int16 v43 = 2048;
          uint64_t v44 = a3 + a2;
          _os_log_error_impl(&dword_1BF22B000, v26, OS_LOG_TYPE_ERROR, "existing source info %@ overlaps new %@:%d,%d (0x%llx-0x%llx)", buf, 0x36u);
        }
        *__error() = v25;
        uint64_t v27 = [v23 offsetIntoSegment];
        uint64_t v28 = [v23 length];
        uint64_t v29 = [v23 offsetIntoSegment];
        a3 = a3 + a2 - (v27 + v28);
        a2 = [v23 length] + v29;
      }

      a5 = v22;
      a4 = v34;
    }
    v18 = +[SASourceInfo sourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:]((uint64_t)SASourceInfo, a2, a3, a4, a5, v11);
    [v12[4] insertObject:v18 atIndex:v16];
    goto LABEL_18;
  }
  v18 = 0;
LABEL_19:

  return v18;
}

+ (void)symbolWithOffsetIntoSegment:(uint64_t)a3 length:(void *)a4 name:
{
  id v6 = a4;
  v7 = objc_alloc_init((Class)self);
  v7[1] = a2;
  v7[2] = a3;
  uint64_t v8 = [v6 copy];

  id v9 = (void *)v7[3];
  v7[3] = v8;

  return v7;
}

uint64_t __51__SASymbol_nonInlineSourceInfoAtOffsetIntoSegment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [v3 offsetIntoSegment];
  if (v4 >= [v3 length] + v5)
  {
    uint64_t v7 = 1;
  }
  else
  {
    unint64_t v6 = *(void *)(a1 + 32);
    if (v6 >= [v3 offsetIntoSegment]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }

  return v7;
}

uint64_t __90__SASymbol_addNonInlineSourceInfoWithOffsetIntoSegment_length_lineNum_columnNum_filePath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(a1 + 32);
  if (v4 <= [v3 offsetIntoSegment])
  {
    unint64_t v6 = *(void *)(a1 + 32);
    if (v6 >= [v3 offsetIntoSegment]) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = -1;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t __87__SASymbol_addInlineSourceInfoWithOffsetIntoSegment_length_lineNum_columnNum_filePath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 offsetIntoSegment];
  unint64_t v5 = *(void *)(a1 + 32);
  if (v5 <= v4)
  {
    if (v5 >= v4)
    {
      unint64_t v7 = [v3 length];
      unint64_t v8 = *(void *)(a1 + 40);
      BOOL v9 = v8 > v7;
      BOOL v10 = v8 < v7;
      if (v9) {
        uint64_t v6 = -1;
      }
      else {
        uint64_t v6 = v10;
      }
    }
    else
    {
      uint64_t v6 = -1;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  if (self->_name) {
    name = (__CFString *)self->_name;
  }
  else {
    name = @"???";
  }
  unint64_t v5 = (void *)[v3 initWithFormat:@"%@ (0x%llx-0x%llx, %lu source infos)", name, self->_offsetIntoSegment, self->_length + self->_offsetIntoSegment, -[NSMutableArray count](self->_sourceInfos, "count")];
  return v5;
}

- (unint64_t)offsetIntoTextSegment
{
  return self->_offsetIntoSegment;
}

- (unint64_t)offsetIntoSegment
{
  return self->_offsetIntoSegment;
}

- (unint64_t)length
{
  return self->_length;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceInfos, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end