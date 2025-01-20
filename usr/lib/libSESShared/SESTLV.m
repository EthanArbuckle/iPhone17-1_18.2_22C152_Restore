@interface SESTLV
+ (id)TLVWithData:(id)a3;
+ (id)TLVWithTag:(unsigned int)a3 children:(id)a4;
+ (id)TLVWithTag:(unsigned int)a3 fromData:(id)a4;
+ (id)TLVWithTag:(unsigned int)a3 unsignedChar:(unsigned __int8)a4;
+ (id)TLVWithTag:(unsigned int)a3 unsignedLongValue:(unsigned int)a4;
+ (id)TLVWithTag:(unsigned int)a3 unsignedShort:(unsigned __int16)a4;
+ (id)TLVWithTag:(unsigned int)a3 value:(id)a4;
+ (id)TLVsWithData:(id)a3;
+ (id)_intToData:(unsigned int)a3;
+ (id)_parseTLVs:(const char *)a3 end:(const char *)a4 simple:(BOOL)a5;
+ (id)dataWithTLVs:(id)a3;
+ (id)simpleTLVsWithData:(id)a3;
+ (id)simpleTLVsWithTag:(unsigned int)a3 fromData:(id)a4;
- (NSArray)children;
- (NSData)value;
- (id)asData;
- (id)childWithTag:(unsigned int)a3;
- (id)childrenWithTag:(unsigned int)a3;
- (id)description;
- (id)valueAsString;
- (unint64_t)valueAsUnsignedLongLong;
- (unsigned)tag;
- (unsigned)valueAsUnsignedChar;
- (unsigned)valueAsUnsignedLong;
- (unsigned)valueAsUnsignedShort;
@end

@implementation SESTLV

+ (id)dataWithTLVs:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) asData:v12];
        [v4 appendData:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)TLVsWithData:(id)a3
{
  id v4 = a3;
  uint64_t v8 = [v4 bytes];
  uint64_t v5 = [v4 length];

  uint64_t v6 = [a1 _parseTLVs:&v8 end:v8 + v5 simple:0];

  return v6;
}

+ (id)simpleTLVsWithData:(id)a3
{
  id v4 = a3;
  uint64_t v8 = [v4 bytes];
  uint64_t v5 = [v4 length];

  uint64_t v6 = [a1 _parseTLVs:&v8 end:v8 + v5 simple:1];

  return v6;
}

+ (id)TLVWithData:(id)a3
{
  id v3 = [a1 TLVsWithData:a3];
  if (![v3 count])
  {
    id v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = "No TLV detected";
      uint64_t v6 = buf;
      goto LABEL_7;
    }
LABEL_8:

    uint64_t v7 = 0;
    goto LABEL_10;
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    id v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = 0;
      uint64_t v5 = "More than one TLV detected";
      uint64_t v6 = (uint8_t *)&v9;
LABEL_7:
      _os_log_impl(&dword_263826000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v7 = [v3 lastObject];
LABEL_10:

  return v7;
}

+ (id)TLVWithTag:(unsigned int)a3 fromData:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = +[SESTLV TLVsWithData:](SESTLV, "TLVsWithData:", a4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 tag] == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

+ (id)simpleTLVsWithTag:(unsigned int)a3 fromData:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = +[SESTLV simpleTLVsWithData:](SESTLV, "simpleTLVsWithData:", v5, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 tag] == a3) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)TLVWithTag:(unsigned int)a3 children:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  *(_DWORD *)(v7 + 8) = a3;
  objc_storeStrong((id *)(v7 + 24), a4);
  if (*(void *)(v7 + 24))
  {
    uint64_t v8 = [MEMORY[0x263EFF990] data];
    uint64_t v9 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v8;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = *(id *)(v7 + 24);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(v7 + 16);
          long long v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) asData:v18];
          [v15 appendData:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }

  return (id)v7;
}

+ (id)TLVWithTag:(unsigned int)a3 value:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  *(_DWORD *)(v6 + 8) = a3;
  uint64_t v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  return (id)v6;
}

+ (id)TLVWithTag:(unsigned int)a3 unsignedLongValue:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  unsigned int v8 = a4;
  id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:&v8 length:4];
  uint64_t v6 = +[SESTLV TLVWithTag:v4 value:v5];

  return v6;
}

+ (id)TLVWithTag:(unsigned int)a3 unsignedChar:(unsigned __int8)a4
{
  uint64_t v4 = *(void *)&a3;
  unsigned __int8 v8 = a4;
  id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:&v8 length:1];
  uint64_t v6 = +[SESTLV TLVWithTag:v4 value:v5];

  return v6;
}

+ (id)TLVWithTag:(unsigned int)a3 unsignedShort:(unsigned __int16)a4
{
  uint64_t v4 = *(void *)&a3;
  unsigned __int16 v8 = a4;
  id v5 = [MEMORY[0x263EFF8F8] dataWithBytes:&v8 length:2];
  uint64_t v6 = +[SESTLV TLVWithTag:v4 value:v5];

  return v6;
}

- (id)description
{
  id v3 = NSString;
  if (self->_children)
  {
    v13.receiver = self;
    v13.super_class = (Class)SESTLV;
    uint64_t v4 = [(SESTLV *)&v13 description];
    uint64_t tag = self->_tag;
    uint64_t v6 = [(SESTLV *)self children];
    [v3 stringWithFormat:@"%@ %02x : %@", v4, tag, v6, v10];
  }
  else
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithData:self->_value encoding:1];
    uint64_t v7 = NSString;
    if (v4)
    {
      v12.receiver = self;
      v12.super_class = (Class)SESTLV;
      uint64_t v6 = [(SESTLV *)&v12 description];
      [v7 stringWithFormat:@"%@ %02x = %@ \"%@\"", v6, self->_tag, self->_value, v4];
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)SESTLV;
      uint64_t v6 = [(SESTLV *)&v11 description];
      [v7 stringWithFormat:@"%@ %02x = %@", v6, self->_tag, self->_value, v10];
    }
  unsigned __int16 v8 = };

  return v8;
}

- (unsigned)tag
{
  return self->_tag;
}

- (NSData)value
{
  return self->_value;
}

- (id)valueAsString
{
  if (self->_value) {
    v2 = (void *)[[NSString alloc] initWithData:self->_value encoding:1];
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (unsigned)valueAsUnsignedChar
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(NSData *)self->_value length] == 1) {
    return *(unsigned char *)[(NSData *)self->_value bytes];
  }
  uint64_t v4 = SESDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    value = self->_value;
    int v6 = 138412290;
    uint64_t v7 = value;
    _os_log_impl(&dword_263826000, v4, OS_LOG_TYPE_ERROR, "Unexpected length %@", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (unsigned)valueAsUnsignedLong
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  value = self->_value;
  if (!value) {
    return 0;
  }
  if ([(NSData *)value length] >= 5)
  {
    uint64_t v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = self->_value;
      int v10 = 138412290;
      objc_super v11 = v5;
      _os_log_impl(&dword_263826000, v4, OS_LOG_TYPE_ERROR, "Value too large: %@", (uint8_t *)&v10, 0xCu);
    }

    return 0;
  }
  int v6 = [(NSData *)self->_value bytes];
  if (![(NSData *)self->_value length]) {
    return 0;
  }
  unint64_t v7 = 0;
  unsigned int v8 = 0;
  do
    unsigned int v8 = v6[v7++] | (v8 << 8);
  while ([(NSData *)self->_value length] > v7);
  return v8;
}

- (unsigned)valueAsUnsignedShort
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  value = self->_value;
  if (!value) {
    return 0;
  }
  if ([(NSData *)value length] >= 3)
  {
    uint64_t v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = self->_value;
      int v10 = 138412290;
      objc_super v11 = v5;
      _os_log_impl(&dword_263826000, v4, OS_LOG_TYPE_ERROR, "Value too large: %@", (uint8_t *)&v10, 0xCu);
    }

    return 0;
  }
  int v6 = [(NSData *)self->_value bytes];
  if (![(NSData *)self->_value length]) {
    return 0;
  }
  unint64_t v7 = 0;
  unsigned __int16 v8 = 0;
  do
    unsigned __int16 v8 = v6[v7++] | (unsigned __int16)(v8 << 8);
  while ([(NSData *)self->_value length] > v7);
  return v8;
}

- (unint64_t)valueAsUnsignedLongLong
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  value = self->_value;
  if (!value) {
    return 0;
  }
  if ([(NSData *)value length] >= 9)
  {
    uint64_t v4 = SESDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = self->_value;
      int v10 = 138412290;
      objc_super v11 = v5;
      _os_log_impl(&dword_263826000, v4, OS_LOG_TYPE_ERROR, "Value too large: %@", (uint8_t *)&v10, 0xCu);
    }

    return 0;
  }
  int v6 = [(NSData *)self->_value bytes];
  if (![(NSData *)self->_value length]) {
    return 0;
  }
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  do
    unint64_t v8 = v6[v7++] | (v8 << 8);
  while ([(NSData *)self->_value length] > v7);
  return v8;
}

- (NSArray)children
{
  return self->_children;
}

- (id)childrenWithTag:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v6 = [(SESTLV *)self children];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 tag] == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)childWithTag:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(SESTLV *)self children];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 tag] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

+ (id)_intToData:(unsigned int)a3
{
  uint64_t v4 = [MEMORY[0x263EFF990] dataWithCapacity:4];
  uint64_t v5 = v4;
  char v9 = 0;
  if (a3)
  {
    int v6 = 4;
    if (HIBYTE(a3)) {
      goto LABEL_14;
    }
    do
    {
      unsigned int v7 = HIWORD(a3);
      a3 <<= 8;
      --v6;
    }
    while (!v7 && v6);
    if (v6)
    {
LABEL_14:
      do
      {
        char v9 = HIBYTE(a3);
        [v5 appendBytes:&v9 length:1];
        a3 <<= 8;
        --v6;
      }
      while (v6);
    }
  }
  else
  {
    [v4 appendBytes:&v9 length:1];
  }

  return v5;
}

- (id)asData
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF990] data];
  uint64_t v4 = +[SESTLV _intToData:self->_tag];
  [v3 appendData:v4];

  uint64_t v5 = self->_value;
  if (!v5)
  {
    if (self->_children)
    {
      uint64_t v5 = [MEMORY[0x263EFF990] data];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      int v6 = self->_children;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v6);
            }
            objc_super v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) asData];
            [(NSData *)v5 appendData:v11];
          }
          uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v8);
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  uint64_t v12 = [(NSData *)v5 length];
  long long v13 = +[SESTLV _intToData:v12];
  long long v14 = v13;
  if (v12 >= 0x80)
  {
    char v16 = [v13 length] | 0x80;
    [v3 appendBytes:&v16 length:1];
  }
  [v3 appendData:v14];
  if (v5) {
    [v3 appendData:v5];
  }

  return v3;
}

+ (id)_parseTLVs:(const char *)a3 end:(const char *)a4 simple:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v9 = [MEMORY[0x263EFF980] array];
  id v10 = *a3;
  if (*a3 >= a4)
  {
LABEL_32:
    id v31 = v9;
    goto LABEL_46;
  }
  while (1)
  {
    objc_super v11 = v10 + 1;
    *a3 = v10 + 1;
    uint64_t v12 = *(unsigned __int8 *)v10;
    if (!v5) {
      break;
    }
    if (v11 >= a4)
    {
      v32 = SESDefaultLogObject();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      int v37 = 67109120;
      int v38 = v12;
      v33 = "Underflow: tag=0x%x";
      goto LABEL_43;
    }
    unint64_t v13 = (unint64_t)(v10 + 2);
    *a3 = v10 + 2;
    unsigned int v14 = *((unsigned __int8 *)v10 + 1);
    if (v14 == 255)
    {
      unsigned int v14 = 0;
      char v19 = 1;
      while (v13 < (unint64_t)a4)
      {
        char v20 = v19;
        char v19 = 0;
        unint64_t v21 = v13 + 1;
        *a3 = (const char *)(v13 + 1);
        unsigned int v14 = *(unsigned __int8 *)v13++ | (v14 << 8);
        if ((v20 & 1) == 0)
        {
          BOOL v15 = 1;
          unint64_t v13 = v21;
          goto LABEL_18;
        }
      }
      v32 = SESDefaultLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        int v37 = 67109120;
        int v38 = v12;
        v33 = "Underflow: tag=0x%x";
        goto LABEL_43;
      }
      goto LABEL_45;
    }
    BOOL v15 = 1;
LABEL_18:
    if (!(v12 | v14)) {
      goto LABEL_32;
    }
    if (!v15)
    {
      if ((uint64_t)&a4[-v13] >= v14)
      {
        unint64_t v24 = v13 + v14;
        uint64_t v25 = [MEMORY[0x263EFF8F8] dataWithBytes:length:];
        v26 = [a1 _parseTLVs:a3 end:v24 simple:v5];
        v27 = +[SESTLV TLVWithTag:v12 children:v26];

        v28 = (void *)v27[2];
        v27[2] = v25;

        [v9 addObject:v27];
        id v10 = *a3;
        goto LABEL_24;
      }
      v32 = SESDefaultLogObject();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
LABEL_52:
      int v37 = 67109376;
      int v38 = v12;
      __int16 v39 = 1024;
      unsigned int v40 = v14;
      v33 = "Underflow: tag=0x%x len=%u";
      v34 = v32;
      uint32_t v35 = 14;
      goto LABEL_44;
    }
    if ((uint64_t)&a4[-v13] < v14)
    {
      v32 = SESDefaultLogObject();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_45;
      }
      goto LABEL_52;
    }
    uint64_t v22 = [MEMORY[0x263EFF8F8] dataWithBytes:length:];
    uint64_t v23 = +[SESTLV TLVWithTag:v12 value:v22];
    [v9 addObject:v23];

    id v10 = &(*a3)[v14];
    *a3 = v10;
LABEL_24:
    if (v10 >= a4) {
      goto LABEL_32;
    }
  }
  BOOL v15 = (v12 & 0x20) == 0;
  if ((~v12 & 0x1F) == 0)
  {
    while (v11 < a4)
    {
      char v16 = (unsigned __int8 *)(v11 + 1);
      *a3 = v11 + 1;
      int v17 = *v11;
      uint64_t v18 = *(unsigned __int8 *)v11++ | (v12 << 8);
      LODWORD(v12) = v18;
      if ((v17 & 0x80000000) == 0) {
        goto LABEL_11;
      }
    }
    v32 = SESDefaultLogObject();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    LOWORD(v37) = 0;
    v33 = "Underflow";
    v34 = v32;
    uint32_t v35 = 2;
LABEL_44:
    _os_log_impl(&dword_263826000, v34, OS_LOG_TYPE_ERROR, v33, (uint8_t *)&v37, v35);
    goto LABEL_45;
  }
  char v16 = (unsigned __int8 *)v11;
  uint64_t v18 = v12;
LABEL_11:
  if (v16 >= (unsigned __int8 *)a4)
  {
    v32 = SESDefaultLogObject();
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    int v37 = 67109120;
    int v38 = v18;
    v33 = "Underflow: tag=0x%x";
LABEL_43:
    v34 = v32;
    uint32_t v35 = 8;
    goto LABEL_44;
  }
  unint64_t v13 = (unint64_t)(v16 + 1);
  *a3 = (const char *)(v16 + 1);
  unsigned int v14 = *v16;
  if (((char)*v16 & 0x80000000) == 0)
  {
LABEL_13:
    uint64_t v12 = v18;
    goto LABEL_18;
  }
  int v29 = v14 & 0x7F;
  if ((v14 & 0x7F) == 0)
  {
    unsigned int v14 = 0;
    goto LABEL_13;
  }
  unsigned int v14 = 0;
  while (v13 < (unint64_t)a4)
  {
    unint64_t v30 = v13 + 1;
    *a3 = (const char *)(v13 + 1);
    unsigned int v14 = *(unsigned __int8 *)v13++ | (v14 << 8);
    if (!--v29)
    {
      unint64_t v13 = v30;
      goto LABEL_13;
    }
  }
  v32 = SESDefaultLogObject();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    int v37 = 67109120;
    int v38 = v18;
    v33 = "Underflow: tag=0x%x";
    goto LABEL_43;
  }
LABEL_45:

  id v31 = 0;
LABEL_46:

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end