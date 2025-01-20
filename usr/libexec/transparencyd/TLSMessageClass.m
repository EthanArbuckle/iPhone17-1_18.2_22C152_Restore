@interface TLSMessageClass
- (BOOL)encodeBool:(BOOL)a3 buffer:(id)a4;
- (BOOL)encodeByte:(unsigned __int8)a3 buffer:(id)a4;
- (BOOL)encodeByteArray:(id)a3 minLength:(unint64_t)a4 maxLength:(unint64_t)a5 buffer:(id)a6;
- (BOOL)encodeExtensions:(id)a3 buffer:(id)a4;
- (BOOL)encodeHashValue:(id)a3 buffer:(id)a4;
- (BOOL)encodeUint64:(unint64_t)a3 buffer:(id)a4;
- (BOOL)encodeVRFOutput:(id)a3 buffer:(id)a4;
- (const)parseBool:(const char *)a3 end:(const char *)a4 result:(BOOL *)a5;
- (const)parseByte:(const char *)a3 end:(const char *)a4 result:(char *)a5;
- (const)parseByteArray:(const char *)a3 end:(const char *)a4 minLength:(unint64_t)a5 maxLength:(unint64_t)a6 result:(id *)a7;
- (const)parseExtensions:(const char *)a3 end:(const char *)a4 result:(id *)a5;
- (const)parseHashValue:(const char *)a3 end:(const char *)a4 result:(id *)a5;
- (const)parseUint64:(const char *)a3 end:(const char *)a4 result:(unint64_t *)a5;
- (const)parseVRFOutput:(const char *)a3 end:(const char *)a4 result:(id *)a5;
@end

@implementation TLSMessageClass

- (const)parseBool:(const char *)a3 end:(const char *)a4 result:(BOOL *)a5
{
  result = 0;
  if (a3 && a4 > a3)
  {
    int v6 = *(unsigned __int8 *)a3;
    if (v6 == 255 || v6 == 0)
    {
      if (a5) {
        *a5 = v6 == 255;
      }
      return a3 + 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (const)parseByte:(const char *)a3 end:(const char *)a4 result:(char *)a5
{
  result = 0;
  if (a3 && a4 > a3)
  {
    if (a5) {
      *a5 = *a3;
    }
    return a3 + 1;
  }
  return result;
}

- (const)parseUint64:(const char *)a3 end:(const char *)a4 result:(unint64_t *)a5
{
  result = 0;
  if (a4 >= a3 && a3 && a4 && (unint64_t)(a4 - a3) >= 8)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
      unint64_t v7 = a3[v6++] | (v7 << 8);
    while (v6 != 8);
    if (a5) {
      *a5 = v7;
    }
    return a3 + 8;
  }
  return result;
}

- (const)parseByteArray:(const char *)a3 end:(const char *)a4 minLength:(unint64_t)a5 maxLength:(unint64_t)a6 result:(id *)a7
{
  unint64_t v7 = 0;
  if (a3 && a4)
  {
    v13 = +[NSMutableData data];
    v14 = v13;
    uint64_t v15 = 0;
    if (a6)
    {
      do
      {
        ++v15;
        BOOL v16 = a6 > 0xFF;
        a6 >>= 8;
      }
      while (v16);
      unint64_t v7 = 0;
      if (a4 >= a3 && a4 - a3 > (unint64_t)(v15 - 1))
      {
        uint64_t v17 = 0;
        a6 = 0;
        do
          a6 = a3[v17++] | (a6 << 8);
        while (v15 != v17);
LABEL_11:
        if (!a5 || a6)
        {
          unint64_t v18 = (unint64_t)&a3[v15];
          if (a6 | a5)
          {
            unint64_t v7 = 0;
            if (v18 <= (unint64_t)a4 && (unint64_t)&a4[-v18] >= a6)
            {
              [v13 appendBytes:v18 length:a6];
              if (a7)
              {
                *a7 = +[NSData dataWithData:v14];
              }
              unint64_t v7 = (const char *)(v18 + a6);
            }
          }
          else
          {
            if (a7) {
              *a7 = 0;
            }
            unint64_t v7 = (const char *)v18;
          }
        }
        else
        {
          unint64_t v7 = 0;
        }
      }
    }
    else
    {
      unint64_t v7 = 0;
      if (a4 >= a3) {
        goto LABEL_11;
      }
    }
  }
  return v7;
}

- (const)parseVRFOutput:(const char *)a3 end:(const char *)a4 result:(id *)a5
{
  return [(TLSMessageClass *)self parseByteArray:a3 end:a4 minLength:1 maxLength:255 result:a5];
}

- (const)parseHashValue:(const char *)a3 end:(const char *)a4 result:(id *)a5
{
  return [(TLSMessageClass *)self parseByteArray:a3 end:a4 minLength:1 maxLength:255 result:a5];
}

- (const)parseExtensions:(const char *)a3 end:(const char *)a4 result:(id *)a5
{
  id v19 = 0;
  uint64_t v6 = [(TLSMessageClass *)self parseByteArray:a3 end:a4 minLength:0 maxLength:0xFFFFLL result:&v19];
  id v7 = v19;
  if (v6)
  {
    v8 = +[NSMutableArray array];
    uint64_t v17 = v6;
    if ([v7 length])
    {
      while (1)
      {
        id v18 = 0;
        v9 = +[TLSExtension parseFromData:error:](TLSExtension, "parseFromData:error:", v7, &v18, v17);
        id v10 = v18;
        if (!v9) {
          break;
        }
        [v8 addObject:v9];
        id v11 = v7;
        id v12 = [v11 bytes];
        v13 = (char *)[v9 parsedLength];
        v14 = [v11 length];
        uint64_t v15 = [v9 parsedLength];
        if (v14 < v15) {
          break;
        }
        id v7 = +[NSData dataWithBytes:&v13[(void)v12] length:v14 - v15];

        if (![v7 length]) {
          goto LABEL_6;
        }
      }

      uint64_t v6 = 0;
    }
    else
    {
LABEL_6:
      if (a5 && [v8 count])
      {
        *a5 = +[NSArray arrayWithArray:v8];
      }
      uint64_t v6 = v17;
    }
  }
  return v6;
}

- (BOOL)encodeBool:(BOOL)a3 buffer:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v10 = -1;
    char v9 = 0;
    if (v4) {
      uint64_t v6 = &v10;
    }
    else {
      uint64_t v6 = &v9;
    }
    BOOL v7 = 1;
    [v5 appendBytes:v6 length:1];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)encodeByte:(unsigned __int8)a3 buffer:(id)a4
{
  unsigned __int8 v7 = a3;
  id v4 = a4;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v5 = 1;
    [v4 appendBytes:&v7 length:1];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)encodeUint64:(unint64_t)a3 buffer:(id)a4
{
  id v5 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    for (uint64_t i = 56; i != -8; i -= 8)
    {
      char v9 = a3 >> i;
      BOOL v7 = 1;
      [v5 appendBytes:&v9 length:1];
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)encodeByteArray:(id)a3 minLength:(unint64_t)a4 maxLength:(unint64_t)a5 buffer:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  if (v10
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (unint64_t)[v9 length] >= a4)
  {
    if (a5)
    {
      uint64_t v13 = -8;
      do
      {
        v13 += 8;
        BOOL v14 = a5 > 0xFF;
        a5 >>= 8;
      }
      while (v14);
      uint64_t v15 = v13 - 8;
      do
      {
        char v16 = 0;
        char v16 = (unint64_t)[v9 length] >> v13;
        [v10 appendBytes:&v16 length:1];
        v15 -= 8;
        LOBYTE(v13) = v13 - 8;
      }
      while (v15 != -16);
    }
    [v10 appendData:v9];
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)encodeVRFOutput:(id)a3 buffer:(id)a4
{
  return [(TLSMessageClass *)self encodeByteArray:a3 minLength:1 maxLength:255 buffer:a4];
}

- (BOOL)encodeHashValue:(id)a3 buffer:(id)a4
{
  return [(TLSMessageClass *)self encodeByteArray:a3 minLength:1 maxLength:255 buffer:a4];
}

- (BOOL)encodeExtensions:(id)a3 buffer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = +[NSMutableData data];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) data:v18];
          if (!v14)
          {

            BOOL v16 = 0;
            goto LABEL_14;
          }
          uint64_t v15 = (void *)v14;
          [v8 appendData:v14];
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    v8 = +[NSData data];
  }
  BOOL v16 = -[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:](self, "encodeByteArray:minLength:maxLength:buffer:", v8, 0, 0xFFFFLL, v7, (void)v18);
LABEL_14:

  return v16;
}

@end