@interface FCANEFHeader
- (FCANEFHeader)init;
- (void)initWithFileHandle:(void *)a1;
- (void)initWithFilePath:(void *)a1;
- (void)initWithHeaderData:(void *)a3 wrappingKeyID:(void *)a4 wrappedKey:(void *)a5 contentType:;
@end

@implementation FCANEFHeader

- (void)initWithHeaderData:(void *)a3 wrappingKeyID:(void *)a4 wrappedKey:(void *)a5 contentType:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23.receiver = a1;
  v23.super_class = (Class)FCANEFHeader;
  v13 = objc_msgSendSuper2(&v23, sel_init);
  if (v13)
  {
    uint64_t v14 = [v9 copy];
    v15 = (void *)v13[4];
    v13[4] = v14;

    uint64_t v16 = [v10 copy];
    v17 = (void *)v13[1];
    v13[1] = v16;

    uint64_t v18 = [v11 copy];
    v19 = (void *)v13[2];
    v13[2] = v18;

    uint64_t v20 = [v12 copy];
    v21 = (void *)v13[3];
    v13[3] = v20;
  }
  return v13;
}

- (void)initWithFilePath:(void *)a1
{
  v2 = a1;
  if (a1)
  {
    v3 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:a2];
    v4 = -[FCANEFHeader initWithFileHandle:](v2, v3);
    [v3 closeFile];
    v2 = v4;
  }
  return v2;
}

- (void)initWithFileHandle:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = [v3 readDataOfLength:4];
    if ([v5 length] == 4
      && (id v6 = v5, *(_DWORD *)[v6 bytes] == 1178947137))
    {
      id v9 = [v4 readDataOfLength:2];
      if ([v9 length] == 2)
      {
        id v10 = v9;
        id v11 = objc_msgSend(v4, "readDataOfLength:", bswap32(*(unsigned __int16 *)objc_msgSend(v10, "bytes")) >> 16);
        if ([v11 length])
        {
          objc_msgSend(v11, "subdataWithRange:", 0, 1);
          id v12 = objc_claimAutoreleasedReturnValue();
          unint64_t v13 = *(unsigned __int8 *)[v12 bytes];
          if ([v11 length] <= v13)
          {
            v7 = 0;
          }
          else
          {
            v31 = objc_msgSend(v11, "subdataWithRange:", 1, v13);
            unint64_t v14 = v13 + 2;
            if (v13 + 2 <= [v11 length])
            {
              id v30 = v12;
              objc_msgSend(v11, "subdataWithRange:", v13 + 1, 1);
              id v29 = objc_claimAutoreleasedReturnValue();
              uint64_t v16 = *(unsigned __int8 *)[v29 bytes];
              unint64_t v17 = v14 + v16;
              if (v14 + v16 <= [v11 length])
              {
                v28 = objc_msgSend(v11, "subdataWithRange:", v14, v16);
                if (v17 >= [v11 length])
                {
                  v7 = 0;
                  id v12 = v30;
                  v15 = v31;
                  v21 = v28;
                  uint64_t v18 = v29;
                }
                else
                {
                  unint64_t v19 = v17 + 1;
                  objc_msgSend(v11, "subdataWithRange:", v17, 1);
                  id v27 = objc_claimAutoreleasedReturnValue();
                  uint64_t v20 = *(unsigned __int8 *)[v27 bytes];
                  if (v19 + v20 <= [v11 length])
                  {
                    v22 = objc_msgSend(v11, "subdataWithRange:", v19, v20);
                    v25 = v22;
                    if ([v22 length]) {
                      objc_super v23 = objc_msgSend([NSString alloc], "initWithData:encoding:", v22, 4, v22);
                    }
                    else {
                      objc_super v23 = 0;
                    }
                    v15 = v31;
                    v24 = objc_msgSend(MEMORY[0x1E4F1CA58], "data", v25);
                    [v24 appendData:v6];
                    [v24 appendData:v10];
                    [v24 appendData:v11];
                    v21 = v28;
                    a1 = -[FCANEFHeader initWithHeaderData:wrappingKeyID:wrappedKey:contentType:](a1, v24, v31, v28, v23);

                    v7 = a1;
                  }
                  else
                  {
                    v7 = 0;
                    v15 = v31;
                    v21 = v28;
                  }

                  uint64_t v18 = v29;
                  id v12 = v30;
                }
              }
              else
              {
                v7 = 0;
                id v12 = v30;
                v15 = v31;
                uint64_t v18 = v29;
              }
            }
            else
            {
              v7 = 0;
              v15 = v31;
            }
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

- (FCANEFHeader)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCANEFHeader init]";
    __int16 v9 = 2080;
    id v10 = "FCANEFHeader.m";
    __int16 v11 = 1024;
    int v12 = 206;
    __int16 v13 = 2114;
    unint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCANEFHeader init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerData, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_wrappedKey, 0);
  objc_storeStrong((id *)&self->_wrappingKeyID, 0);
}

@end