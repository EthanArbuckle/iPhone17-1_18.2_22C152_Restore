@interface USDomainNormalization
- (id)normalizeDomainName:(id)a3;
- (id)normalizeDomainNames:(id)a3;
- (id)normalizeURL:(id)a3;
- (void)dealloc;
@end

@implementation USDomainNormalization

- (void)dealloc
{
  idna = self->_idna;
  if (idna) {
    uidna_close(idna);
  }
  v4.receiver = self;
  v4.super_class = (Class)USDomainNormalization;
  [(USDomainNormalization *)&v4 dealloc];
}

- (id)normalizeDomainName:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if ([v5 canBeConvertedToEncoding:1])
  {
LABEL_16:
    v14 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
    uint64_t v15 = [v6 rangeOfCharacterFromSet:v14];

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = [v6 lowercaseString];

      v6 = (void *)v16;
    }
    id v17 = v6;
    goto LABEL_22;
  }
  id v7 = [v5 precomposedStringWithCanonicalMapping];
  v8 = (const char *)[v7 UTF8String];

  idna = self->_idna;
  if (!idna)
  {
    *(_DWORD *)&pInfo.size = 0;
    idna = (UIDNA *)MEMORY[0x21D469550](0, &pInfo);
    self->_idna = idna;
    if (*(int *)&pInfo.size >= 1)
    {
      v23 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"USDomainNormalization.m", 45, @"Failed to create UIDNA service object %d", *(unsigned int *)&pInfo.size);

      idna = self->_idna;
    }
  }
  UIDNAInfo pInfo = (UIDNAInfo)xmmword_21839E5A0;
  UErrorCode pErrorCode = U_ZERO_ERROR;
  int32_t v10 = uidna_nameToASCII_UTF8(idna, v8, -1, 0, 0, &pInfo, &pErrorCode);
  int32_t v11 = v10;
  UErrorCode v12 = pErrorCode;
  if (pErrorCode == U_BUFFER_OVERFLOW_ERROR)
  {
    UErrorCode v12 = U_ZERO_ERROR;
    UErrorCode pErrorCode = U_ZERO_ERROR;
  }
  if (v12 <= U_ZERO_ERROR && !pInfo.errors)
  {
    if (v10 < 0)
    {
      v20 = [MEMORY[0x263F08690] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"USDomainNormalization.m", 62, @"Got a negative ACE length for domain %@", v5 object file lineNumber description];
    }
    v13 = (char *)malloc_type_malloc(v11, 0xF6001D5FuLL);
    if (uidna_nameToASCII_UTF8(self->_idna, v8, -1, v13, v11, &pInfo, &pErrorCode) != v11)
    {
      v21 = [MEMORY[0x263F08690] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"USDomainNormalization.m" lineNumber:65 description:@"Got a different ACE length for the same input"];
    }
    if (pErrorCode > U_ZERO_ERROR || pInfo.errors)
    {
      v22 = [MEMORY[0x263F08690] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"USDomainNormalization.m", 66, @"Got an error the second time uidna_nameToASCII_UTF8 was called, %d (%u)", pErrorCode, pInfo.errors object file lineNumber description];
    }
    v6 = (void *)[[NSString alloc] initWithBytes:v13 length:v11 encoding:4];

    free(v13);
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    [(USDomainNormalization *)(uint64_t)v5 normalizeDomainName:(int *)&pInfo.errors];
  }
  id v17 = v5;
LABEL_22:
  v18 = v17;

  return v18;
}

- (id)normalizeDomainNames:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        int32_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (![v11 canBeConvertedToEncoding:1]
          || [v11 rangeOfCharacterFromSet:v5] != 0x7FFFFFFFFFFFFFFFLL)
        {

          UErrorCode v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v6, "count"));
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v13 = v6;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v23;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v23 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = -[USDomainNormalization normalizeDomainName:](self, "normalizeDomainName:", *(void *)(*((void *)&v22 + 1) + 8 * j), (void)v22);
                [v12 addObject:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v15);
          }
          goto LABEL_20;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      UErrorCode v12 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    UErrorCode v12 = 0;
  }
LABEL_20:

  if (v12) {
    v19 = v12;
  }
  else {
    v19 = v6;
  }
  id v20 = v19;

  return v20;
}

- (id)normalizeURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 host];
  id v6 = [(USDomainNormalization *)self normalizeDomainName:v5];
  id v7 = v4;
  id v8 = v7;
  if (v5 != v6)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v7 resolvingAgainstBaseURL:1];
    [v9 setHost:v6];
    id v8 = [v9 URL];
  }
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
      -[USDomainNormalization normalizeURL:]((uint64_t)v7);
    }
    id v8 = v7;
  }

  return v8;
}

- (void)normalizeDomainName:(int *)a3 .cold.1(uint64_t a1, int *a2, int *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = *a2;
  int v4 = *a3;
  int v5 = 138412802;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to encode domain %@, %d (%u)", (uint8_t *)&v5, 0x18u);
}

- (void)normalizeURL:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "Failed to normalize URL: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end