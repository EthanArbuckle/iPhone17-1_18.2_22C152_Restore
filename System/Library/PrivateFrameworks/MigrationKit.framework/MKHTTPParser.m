@interface MKHTTPParser
- (id)chunk:(id)a3 offset:(unint64_t *)a4 done:(BOOL *)a5;
- (id)parse:(id)a3 hostname:(id)a4;
- (id)parts:(id)a3 boundary:(id)a4 container:(id)a5;
@end

@implementation MKHTTPParser

- (id)parse:(id)a3 hostname:(id)a4
{
  id v5 = a3;
  id v22 = a4;
  v6 = (char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  v23 = v5;
  v24 = (void *)[objc_alloc(MEMORY[0x263EFF950]) initWithData:v5];
  [v24 open];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = objc_alloc_init(MEMORY[0x263F089D8]);
  char v9 = 0;
  int v10 = 0;
  while (2)
  {
    uint64_t v11 = [v24 read:v6 maxLength:1024];
    if (!v11) {
      break;
    }
    uint64_t v12 = 0;
    while (1)
    {
      int v13 = v6[v12];
      if (v13 == 10 && v9 == 13) {
        break;
      }
      objc_msgSend(v8, "appendFormat:", @"%c", v6[v12]);
LABEL_11:
      char v9 = v13;
      if (v11 == ++v12) {
        goto LABEL_15;
      }
    }
    if ([v8 length] != 1)
    {
      objc_msgSend(v8, "deleteCharactersInRange:", objc_msgSend(v8, "length") - 1, 1);
      [v7 addObject:v8];
      id v15 = objc_alloc_init(MEMORY[0x263F089D8]);

      id v8 = v15;
      goto LABEL_11;
    }
    if (v12)
    {
      char v16 = 0;
      v10 += v12 + 1;
      goto LABEL_17;
    }
    char v9 = 13;
LABEL_15:
    v10 += v11;
    if (v11 == 1024) {
      continue;
    }
    break;
  }
  char v16 = 1;
LABEL_17:
  [v24 close];
  free(v6);
  if (v16)
  {
    v17 = 0;
  }
  else
  {
    v18 = objc_msgSend(v23, "subdataWithRange:", v10, objc_msgSend(v23, "length") - v10);
    v19 = [MKHTTPRequest alloc];
    v20 = [[MKHTTPHeaders alloc] initWithArray:v7];
    v17 = [(MKHTTPRequest *)v19 initWithHeaders:v20 body:v18 hostname:v22];
  }
  return v17;
}

- (id)chunk:(id)a3 offset:(unint64_t *)a4 done:(BOOL *)a5
{
  id v6 = a3;
  if (v6)
  {
    v25 = a5;
    id v7 = (unsigned __int8 *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
    v24 = (void *)[objc_alloc(MEMORY[0x263EFF950]) initWithData:v6];
    [v24 open];
    id v27 = objc_alloc_init(MEMORY[0x263EFF990]);
    char v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    int v11 = 0;
    int v28 = 0;
    while (1)
    {
      uint64_t v12 = [v24 read:v7 maxLength:1024];
      if (!v12) {
        goto LABEL_22;
      }
      uint64_t v13 = v12;
      for (uint64_t i = 0; i != v13; ++i)
      {
        int v15 = v11;
        int v11 = v7[i];
        if (v11 != 10 || v15 != 13)
        {
          ++v9;
          continue;
        }
        uint64_t v17 = v9 - 1;
        if ((v8 & 1) == 0)
        {
          v19 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v6, "bytes") + v10, v9 - 1, 0);
          v20 = (void *)[[NSString alloc] initWithData:v19 encoding:4];
          v21 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:v20];
          [v21 scanHexInt:&v28];
          v10 += v9 + 1;

          uint64_t v9 = 0;
LABEL_19:
          char v8 = 1;
          continue;
        }
        if (v17 != v28)
        {
          ++v9;
          goto LABEL_19;
        }
        v18 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v6, "bytes") + v10, v9 - 1, 0);
        [v27 appendData:v18];
        if (a4) {
          *a4 = v10 + v17 + 2;
        }
        if (v25) {
          BOOL *v25 = [v18 length] == 0;
        }
        v10 += v9 + 1;
        int v28 = 0;

        uint64_t v9 = 0;
        char v8 = 0;
      }
      if (v13 != 1024)
      {
LABEL_22:
        [v24 close];
        free(v7);

        id v22 = v27;
        goto LABEL_24;
      }
    }
  }
  id v22 = 0;
LABEL_24:

  return v22;
}

- (id)parts:(id)a3 boundary:(id)a4 container:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v37 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v9 appendString:@"--"];
  v35 = v8;
  [v9 appendString:v8];
  v34 = v9;
  v43 = [v9 dataUsingEncoding:4];
  uint64_t v10 = (unsigned __int8 *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  id v45 = v7;
  v38 = (void *)[objc_alloc(MEMORY[0x263EFF950]) initWithData:v7];
  [v38 open];
  id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
  int v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v44 = 0;
  uint64_t v41 = 0;
  char v42 = 0;
  char v14 = 0;
  char v15 = 1;
  do
  {
    uint64_t v16 = [v38 read:v10 maxLength:1024];
    if (!v16) {
      break;
    }
    uint64_t v17 = v16;
    for (uint64_t i = 0; i != v17; ++i)
    {
      int v19 = v11;
      int v11 = v10[i];
      if (v11 != 10 || v19 != 13)
      {
        ++v13;
        continue;
      }
      v21 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v45, "bytes") + v12, v13 - 1, 0);
      id v22 = v21;
      if (v15)
      {
        if ([v21 isEqualToData:v43])
        {
          id v23 = objc_alloc_init(MEMORY[0x263EFF980]);

          char v15 = 0;
          uint64_t v41 = 0;
          v12 += v13 + 1;
          char v14 = 1;
          v44 = v23;
LABEL_22:
          uint64_t v13 = 0;
          goto LABEL_23;
        }
        ++v13;
      }
      else
      {
        if (![v21 length])
        {
          char v15 = 0;
          char v14 = 0;
          v12 += v13 + 1;
          char v42 = 1;
          goto LABEL_22;
        }
        if (v14)
        {
          v24 = (void *)[[NSString alloc] initWithData:v22 encoding:4];
          [v44 addObject:v24];
          v25 = [v24 lowercaseString];
          int v26 = [v25 hasPrefix:@"content-length"];

          if (v26)
          {
            id v27 = [v24 componentsSeparatedByString:@": "];
            if ([v27 count] == 2)
            {
              id v40 = objc_alloc_init(MEMORY[0x263F08A30]);
              [v40 setNumberStyle:1];
              v39 = [v27 objectAtIndexedSubscript:1];
              int v28 = [v40 numberFromString:v39];
              uint64_t v41 = [v28 unsignedLongLongValue];
            }
          }
          v12 += v13 + 1;

          char v15 = 0;
          uint64_t v13 = 0;
          char v14 = 1;
          goto LABEL_23;
        }
        if ((v42 & 1) == 0)
        {
          char v15 = 0;
          char v14 = 0;
          char v42 = 0;
          ++v13;
          goto LABEL_23;
        }
        if (v41 && [v22 length] != v41)
        {
          char v15 = 0;
          char v14 = 0;
          ++v13;
          char v42 = 1;
          goto LABEL_23;
        }
        v29 = [MKHTTPRequest alloc];
        v30 = [[MKHTTPHeaders alloc] initWithMultipartHeaderArray:v44];
        v31 = [v37 hostname];
        v32 = [(MKHTTPRequest *)v29 initWithHeaders:v30 body:v22 hostname:v31];

        [v36 addObject:v32];
        v12 += v13 + 1;

        char v14 = 0;
        char v42 = 0;
        uint64_t v13 = 0;
      }
      char v15 = 1;
LABEL_23:
    }
  }
  while (v17 == 1024);
  [v38 close];
  free(v10);

  return v36;
}

@end