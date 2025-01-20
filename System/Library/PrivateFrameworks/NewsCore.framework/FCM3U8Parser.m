@interface FCM3U8Parser
- (BOOL)parseWithError:(uint64_t)a1;
- (uint64_t)saveLine:(uint64_t)a1;
- (void)initWithData:(void *)a1;
- (void)processLine;
@end

@implementation FCM3U8Parser

- (void)initWithData:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FCM3U8Parser;
    id v5 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 3, a2);
      uint64_t v6 = [MEMORY[0x1E4F1CA58] data];
      v7 = (void *)a1[4];
      a1[4] = v6;
    }
  }

  return a1;
}

- (BOOL)parseWithError:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v3 = *(void **)(a1 + 40);
  BOOL v4 = v3 == 0;
  if (v3)
  {
    id v6 = v3;
    if (a2) {
      *a2 = v6;
    }
  }
  else
  {
    v7 = *(void **)(a1 + 24);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __31__FCM3U8Parser_parseWithError___block_invoke;
    v9[3] = &unk_1E5B4C0E0;
    v9[4] = a1;
    [v7 enumerateByteRangesUsingBlock:v9];
    if ([*(id *)(a1 + 32) length]) {
      -[FCM3U8Parser processLine](a1);
    }
  }

  return v4;
}

void __31__FCM3U8Parser_parseWithError___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a3 + a4;
  if (a3 < a3 + a4)
  {
    unint64_t v5 = a3;
    uint64_t v8 = a4 + a3;
    do
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9)
      {
        uint64_t v10 = a2 + v5;
        if (v4 == v5)
        {
LABEL_9:
          [*(id *)(v9 + 32) appendBytes:v10 length:v4 - v5];
          unint64_t v11 = v4 - v5;
        }
        else
        {
          unint64_t v11 = 0;
          while (1)
          {
            int v12 = *(unsigned __int8 *)(v10 + v11);
            if (v12 == 10)
            {
              uint64_t v13 = 1;
LABEL_11:
              objc_msgSend(*(id *)(v9 + 32), "appendBytes:length:");
              -[FCM3U8Parser processLine](v9);
              v11 += v13;
              goto LABEL_16;
            }
            if (v12 == 13) {
              break;
            }
            if (v8 - v5 == ++v11) {
              goto LABEL_9;
            }
          }
          if (v11 + 1 < v4 - v5 && *(unsigned char *)(v10 + v11 + 1) == 10)
          {
            uint64_t v13 = 2;
            goto LABEL_11;
          }
          objc_msgSend(*(id *)(v9 + 32), "appendBytes:length:");
        }
      }
      else
      {
        unint64_t v11 = 0;
      }
LABEL_16:
      v5 += v11;
    }
    while (v5 < v4);
  }
}

- (void)processLine
{
  if (!a1) {
    return;
  }
  if ([*(id *)(a1 + 32) length])
  {
    id v33 = (id)[[NSString alloc] initWithData:*(void *)(a1 + 32) encoding:4];
    if (![v33 length])
    {
LABEL_45:
      id v31 = *(id *)(a1 + 32);
      objc_msgSend(v31, "replaceBytesInRange:withBytes:length:", 0, objc_msgSend(v31, "length"), 0, 0);

      return;
    }
    if (![v33 hasPrefix:@"#EXT"])
    {
      if ([v33 hasPrefix:@"#"])
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
        [WeakRetained parser:a1 lineIsComment:v33];

        if (*(unsigned char *)(a1 + 8))
        {
          id v8 = objc_loadWeakRetained((id *)(a1 + 16));
          int v9 = [v8 parserShouldCollectLine:a1];

          if (v9) {
            -[FCM3U8Parser saveLine:](a1, v33);
          }
        }
      }
      else
      {
        if (*(unsigned char *)(a1 + 8))
        {
          id v24 = objc_loadWeakRetained((id *)(a1 + 16));
          int v25 = [v24 parserShouldCollectLine:a1];

          if (v25) {
            -[FCM3U8Parser saveLine:](a1, v33);
          }
        }
        id v26 = objc_loadWeakRetained((id *)(a1 + 16));
        v27 = [MEMORY[0x1E4F1CB10] URLWithString:v33];
        [v26 parser:a1 lineIsURL:v27];
      }
      goto LABEL_45;
    }
    id v2 = v33;
    uint64_t v3 = [v2 rangeOfString:@":"];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v4 = 0;
      unint64_t v5 = &stru_1EF8299B8;
      id v6 = v2;
      goto LABEL_41;
    }
    uint64_t v10 = v3;
    id v6 = [v2 substringToIndex:v3];

    unint64_t v5 = [v2 substringFromIndex:v10 + 1];
    if ([(__CFString *)v5 length])
    {
      unint64_t v5 = v5;
      v32 = [MEMORY[0x1E4F1CA60] dictionary];
      if ([(__CFString *)v5 length])
      {
        unint64_t v11 = 0;
        while (1)
        {
          uint64_t v12 = [(__CFString *)v5 rangeOfString:@"=", 0, v11, [(__CFString *)v5 length] - v11 options range];
          if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_35;
          }
          uint64_t v13 = v12;
          v14 = -[__CFString substringWithRange:](v5, "substringWithRange:", v11, v12 - v11);
          uint64_t v15 = v13 + 1;
          uint64_t v16 = ~v13;
          uint64_t v17 = [(__CFString *)v5 length] + ~v13;
          unint64_t v18 = [(__CFString *)v5 rangeOfString:@"\"", 0, v13 + 1, v17 options range];
          unint64_t v19 = [(__CFString *)v5 rangeOfString:@",", 0, v15, v17 options range];
          uint64_t v20 = v19;
          if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          if (v19 != 0x7FFFFFFFFFFFFFFFLL && v19 <= v18) {
            goto LABEL_25;
          }
          uint64_t v22 = [(__CFString *)v5 rangeOfString:@"\"", 0, v18 + 1, [(__CFString *)v5 length] - (v18 + 1) options range];
          if (v22 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v21 = [(__CFString *)v5 substringFromIndex:v18 + 1];
          }
          else
          {
            uint64_t v23 = v22;
            v21 = -[__CFString substringWithRange:](v5, "substringWithRange:", v18 + 1, v22 + ~v18);
            uint64_t v20 = [(__CFString *)v5 rangeOfString:@",", 0, v23 + 1, [(__CFString *)v5 length] - (v23 + 1) options range];
          }
          if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_30;
          }
LABEL_32:
          unint64_t v11 = v20 + 1;
          if (v14) {
            goto LABEL_33;
          }
LABEL_34:

          if (v11 >= [(__CFString *)v5 length]) {
            goto LABEL_35;
          }
        }
        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v21 = [(__CFString *)v5 substringFromIndex:v15];
LABEL_30:
          unint64_t v11 = [(__CFString *)v5 length];
          if (!v14) {
            goto LABEL_34;
          }
LABEL_33:
          [v32 setObject:v21 forKeyedSubscript:v14];
          goto LABEL_34;
        }
LABEL_25:
        v21 = -[__CFString substringWithRange:](v5, "substringWithRange:", v15, v19 + v16);
        goto LABEL_32;
      }
LABEL_35:
      unint64_t v4 = (void *)[v32 copy];
    }
    else
    {
      unint64_t v4 = 0;
    }
LABEL_41:
    id v28 = objc_loadWeakRetained((id *)(a1 + 16));
    [v28 parser:a1 lineIsTag:v6 value:v5 attributeList:v4];

    if (*(unsigned char *)(a1 + 8))
    {
      id v29 = objc_loadWeakRetained((id *)(a1 + 16));
      int v30 = [v29 parserShouldCollectLine:a1];

      if (v30) {
        -[FCM3U8Parser saveLine:](a1, v2);
      }
    }

    goto LABEL_45;
  }
  if (*(unsigned char *)(a1 + 8))
  {
    -[FCM3U8Parser saveLine:](a1, &stru_1EF8299B8);
  }
}

- (uint64_t)saveLine:(uint64_t)a1
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = a2;
  if (!v3)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA58] data];
    id v6 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v5;
  }
  v7 = *(void **)(a1 + 48);
  id v8 = v4;
  id v9 = v7;
  uint64_t v10 = [v8 UTF8String];
  id v11 = v8;
  uint64_t v12 = (const char *)[v11 UTF8String];

  [v9 appendBytes:v10 length:strlen(v12)];
  uint64_t v13 = *(void **)(a1 + 48);
  return [v13 appendBytes:"\n" length:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectedData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end