@interface VCSParsedLine
+ (const)lookupProperty:(int64_t)a3;
+ (int64_t)tokenizeKeyword:(const char *)a3 withType:(unint64_t *)a4;
+ (int64_t)tokenizeNSStringKeyword:(id)a3 withType:(unint64_t *)a4;
- (BOOL)usePalmD4Hooks;
- (VCSParsedLine)init;
- (id)content;
- (id)convertedContent;
- (id)description;
- (id)keyword;
- (id)loadFromCString:(char *)a3 withParseState:(id)a4;
- (id)params;
- (int64_t)tokenID;
- (unint64_t)type;
- (void)reset;
- (void)setContentFromCString:(char *)a3;
- (void)setKeywordFromCString:(char *)a3;
- (void)setTokenID:(int64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setUsePalmD4Hooks:(BOOL)a3;
@end

@implementation VCSParsedLine

+ (int64_t)tokenizeKeyword:(const char *)a3 withType:(unint64_t *)a4
{
  v5 = (int64_t *)bsearch(a3, &vcsTokensList, 0x29uLL, 0x18uLL, (int (__cdecl *)(const void *, const void *))vcsTokenCompare);
  if (v5)
  {
    if (a4) {
      *a4 = v5[2];
    }
    return *v5;
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    return 50;
  }
}

+ (int64_t)tokenizeNSStringKeyword:(id)a3 withType:(unint64_t *)a4
{
  uint64_t v6 = [a3 UTF8String];
  return [a1 tokenizeKeyword:v6 withType:a4];
}

+ (const)lookupProperty:(int64_t)a3
{
  int64_t __key = a3;
  return (const $E9F79BE52C26C7385FEA6DDCC3A6974D *)bsearch(&__key, &vcsPropertyList, 0x24uLL, 0x28uLL, (int (__cdecl *)(const void *, const void *))vcsPropertyCompare);
}

- (VCSParsedLine)init
{
  v10.receiver = self;
  v10.super_class = (Class)VCSParsedLine;
  v2 = [(VCSParsedLine *)&v10 init];
  v3 = (VCSParsedLine *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 40) = xmmword_1DB9EF5C0;
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = 0;

    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    content = v3->_content;
    v3->_content = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    params = v3->_params;
    v3->_params = v7;

    v3->_usePalmD4Hooks = 0;
  }
  return v3;
}

- (void)reset
{
  *(_OWORD *)&self->_type = xmmword_1DB9EF5C0;
  keyword = self->_keyword;
  self->_keyword = 0;

  [(NSMutableData *)self->_content setLength:0];
  params = self->_params;
  [(NSMutableDictionary *)params removeAllObjects];
}

- (id)loadFromCString:(char *)a3 withParseState:(id)a4
{
  id v6 = a4;
  uint64_t v44 = 0;
  size_t v7 = strlen(a3);
  switch(v7)
  {
    case 0uLL:
      goto LABEL_66;
    case 2uLL:
      int v10 = *a3;
      if (v10 == 10 || v10 == 13) {
        goto LABEL_66;
      }
      break;
    case 1uLL:
      v8 = 0;
      int v9 = *a3;
      if (v9 == 10 || v9 == 13) {
        goto LABEL_67;
      }
      break;
  }
  v12 = malloc_type_malloc(v7 + 1, 0xA964C1C8uLL);
  [(VCSParsedLine *)self reset];
  for (unsigned int i = 0; ; ++i)
  {
    int v14 = a3[i];
    if (v14 != 45)
    {
      if (!a3[i])
      {
        unsigned int i = 0;
        goto LABEL_18;
      }
      if ((v14 & 0xFFFFFFDF) - 65 >= 0x1A) {
        break;
      }
    }
  }
  memcpy(v12, a3, i);
  *((unsigned char *)v12 + i) = 0;
  [(VCSParsedLine *)self setKeywordFromCString:v12];
  int64_t v15 = +[VCSParsedLine tokenizeKeyword:v12 withType:&v44];
  [(VCSParsedLine *)self setType:v44];
  [(VCSParsedLine *)self setTokenID:v15];
LABEL_18:
  for (LODWORD(v16) = i; ; LODWORD(v16) = v16 + 1)
  {
    int v17 = a3[v16];
    if (v17 != 32) {
      break;
    }
  }
  if ((v17 - 58) >= 2)
  {
    v34 = VCSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[VCSParsedLine loadFromCString:withParseState:](v6, &a3[v16], v34);
    }
    goto LABEL_65;
  }
  if (v44 == 1)
  {
    if (v17 == 58)
    {
      int v35 = v16 + 1;
      uint64_t v43 = 0;
      do
      {
        int v36 = v35;
        int v37 = a3[v35++];
      }
      while (v37 == 32);
      v38 = &a3[v36];
      +[VCSParsedLine tokenizeKeyword:v38 withType:&v43];
      if (v43 != 2)
      {
        v39 = VCSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          -[VCSParsedLine loadFromCString:withParseState:]((uint64_t)v38, v6);
        }
      }
      v40 = self;
      v41 = v38;
      goto LABEL_59;
    }
    v34 = VCSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[VCSParsedLine loadFromCString:withParseState:].cold.4(v6, v34);
    }
    goto LABEL_65;
  }
  if (v44 != 3)
  {
    v34 = VCSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[VCSParsedLine loadFromCString:withParseState:]((uint64_t)v12, v6);
    }
LABEL_65:

    free(v12);
LABEL_66:
    v8 = 0;
    goto LABEL_67;
  }
  while (v17 == 59)
  {
    unsigned int v18 = 0;
    int v19 = v16 + 1;
    while (1)
    {
      uint64_t v20 = v19 + v18;
      int v21 = a3[v20];
      if (v21 != 45)
      {
        if (!a3[v20])
        {
          v22 = &a3[v20];
          goto LABEL_32;
        }
        if ((v21 & 0xFFFFFFDF) - 65 >= 0x1A) {
          break;
        }
      }
      ++v18;
    }
    v22 = &a3[v20];
    memcpy(v12, &a3[v19], v18);
    *((unsigned char *)v12 + v18) = 0;
    unsigned int i = v19 + v18;
LABEL_32:
    for (LODWORD(v16) = i; ; LODWORD(v16) = v16 + 1)
    {
      int v23 = a3[v16];
      if (v23 != 32) {
        break;
      }
    }
    if (v23 == 61)
    {
      size_t v24 = strlen(v22);
      v25 = malloc_type_malloc(v24 + 1, 0x100004077774924uLL);
      LODWORD(v16) = v16 + 1;
      int v26 = a3[v16];
      v27 = v25;
      do
      {
        if (v26 == 92)
        {
          if (a3[(v16 + 1)] == 59) {
            LODWORD(v16) = v16 + 1;
          }
          LOBYTE(v26) = a3[v16];
        }
        *v27++ = v26;
        uint64_t v16 = (v16 + 1);
        int v26 = a3[v16];
      }
      while ((v26 & 0xFE) != 0x3A);
      unsigned char *v27 = 0;
      params = self->_params;
      v29 = [NSString stringWithUTF8String:v25];
      v30 = [NSString stringWithUTF8String:v12];
      [(NSMutableDictionary *)params setObject:v29 forKey:v30];

      free(v25);
      uint64_t v31 = v16;
    }
    else
    {
      uint64_t v31 = v16;
      v32 = self->_params;
      v33 = [NSString stringWithUTF8String:v12];
      [(NSMutableDictionary *)v32 setObject:&stru_1F3601330 forKey:v33];
    }
    int v17 = a3[v31];
  }
  if (v17 != 58) {
    goto LABEL_60;
  }
  v41 = &a3[(v16 + 1)];
  v40 = self;
LABEL_59:
  [(VCSParsedLine *)v40 setContentFromCString:v41];
LABEL_60:
  if (self) {
    -[VCSParsedLine setUsePalmD4Hooks:](self, "setUsePalmD4Hooks:", [v6 palmImport]);
  }
  free(v12);
  v8 = self;
LABEL_67:

  return v8;
}

- (void)setKeywordFromCString:(char *)a3
{
  self->_keyword = (NSString *)[[NSString alloc] initWithUTF8String:a3];
  MEMORY[0x1F41817F8]();
}

- (id)keyword
{
  return self->_keyword;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)VCSParsedLine;
  v4 = [(VCSParsedLine *)&v10 description];
  keyword = self->_keyword;
  id v6 = [NSString alloc];
  size_t v7 = objc_msgSend(v6, "initWithData:encoding:", self->_content, objc_msgSend(NSString, "defaultCStringEncoding"));
  v8 = [v3 stringWithFormat:@"%@ %@,%@", v4, keyword, v7];

  return v8;
}

- (void)setContentFromCString:(char *)a3
{
  [(NSMutableData *)self->_content setLength:0];
  size_t v5 = strlen(a3) + 1;
  content = self->_content;
  [(NSMutableData *)content appendBytes:a3 length:v5];
}

- (id)content
{
  return self->_content;
}

- (id)convertedContent
{
  v3 = [(NSMutableDictionary *)self->_params objectForKeyedSubscript:@"ENCODING"];
  params = self->_params;
  if (v3)
  {
    [(NSMutableDictionary *)params removeObjectForKey:@"ENCODING"];
  }
  else
  {
    uint64_t v5 = [(NSMutableDictionary *)params objectForKeyedSubscript:@"QUOTED-PRINTABLE"];
    if (!v5)
    {
      objc_super v10 = self->_content;
      goto LABEL_11;
    }
    id v6 = (void *)v5;
    v3 = @"QUOTED-PRINTABLE";
    [(NSMutableDictionary *)self->_params removeObjectForKey:@"QUOTED-PRINTABLE"];
  }
  if ([(__CFString *)v3 isEqualToString:@"QUOTED-PRINTABLE"])
  {
    size_t v7 = [(NSMutableData *)self->_content VCSDecodeQuotedPrintableForText:0];
  }
  else
  {
    int v8 = [(__CFString *)v3 isEqualToString:@"BASE64"];
    content = self->_content;
    if (v8)
    {
      size_t v7 = [(NSMutableData *)content VCSDecodeBase64];
    }
    else
    {
      size_t v7 = content;
    }
  }
  objc_super v10 = v7;

LABEL_11:
  v11 = [(NSMutableDictionary *)self->_params objectForKey:@"CHARSET"];
  v12 = v11;
  if (v11 && ![(__CFString *)v11 isEqualToString:@"macintosh"])
  {
    [(NSMutableDictionary *)self->_params removeObjectForKey:@"CHARSET"];
    uint64_t SystemEncoding = CFStringConvertIANACharSetNameToEncoding(v12);
    goto LABEL_16;
  }
  if (self->_usePalmD4Hooks)
  {
    uint64_t SystemEncoding = CFStringGetSystemEncoding();
LABEL_16:
    uint64_t v14 = SystemEncoding;
    goto LABEL_18;
  }
  uint64_t v14 = 134217984;
LABEL_18:
  int64_t v15 = [(NSMutableData *)v10 VCSConvert8bitBufferToUTF8From:v14];
  if (v15) {
    uint64_t v16 = (void *)[[NSString alloc] initWithData:v15 encoding:4];
  }
  else {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)params
{
  return self->_params;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (int64_t)tokenID
{
  return self->_tokenID;
}

- (void)setTokenID:(int64_t)a3
{
  self->_tokenID = a3;
}

- (BOOL)usePalmD4Hooks
{
  return self->_usePalmD4Hooks;
}

- (void)setUsePalmD4Hooks:(BOOL)a3
{
  self->_usePalmD4Hooks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_keyword, 0);
}

- (void)loadFromCString:(NSObject *)a3 withParseState:.cold.1(void *a1, char *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v5 = [a1 lineNumber];
  int v6 = *a2;
  v7[0] = 67109376;
  v7[1] = v5;
  __int16 v8 = 1024;
  int v9 = v6;
  _os_log_error_impl(&dword_1DB9BF000, a3, OS_LOG_TYPE_ERROR, "File syntax error at line %d: found %c", (uint8_t *)v7, 0xEu);
}

- (void)loadFromCString:(uint64_t)a1 withParseState:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  v3 = [NSString stringWithUTF8String:a1];
  [a2 lineNumber];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1DB9BF000, v4, v5, "Unknown keyword %@ at line %d.", v6, v7, v8, v9, v10);
}

- (void)loadFromCString:(uint64_t)a1 withParseState:(void *)a2 .cold.3(uint64_t a1, void *a2)
{
  v3 = [NSString stringWithUTF8String:a1];
  [a2 lineNumber];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1DB9BF000, v4, v5, "Non entity-name keyword '%@' at line %d", v6, v7, v8, v9, v10);
}

- (void)loadFromCString:(void *)a1 withParseState:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109120;
  v3[1] = [a1 lineNumber];
  _os_log_error_impl(&dword_1DB9BF000, a2, OS_LOG_TYPE_ERROR, "Semi-colon expected at line %d", (uint8_t *)v3, 8u);
}

@end