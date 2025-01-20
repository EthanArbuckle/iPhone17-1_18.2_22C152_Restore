@interface OABOle
+ (BOOL)isBiffCLSID:(id)a3;
+ (BOOL)isChart:(id)a3;
+ (BOOL)readSharedInfoFor:(id)a3 fromStorage:(SsrwOOStorage *)a4;
+ (id)read4ByteFromStream:(SsrwOOStream *)a3;
+ (id)readAnsiStringFromStream:(SsrwOOStream *)a3;
+ (id)readCLSIDFromStream:(SsrwOOStream *)a3;
+ (id)readCompressedFromStream:(SsrwOOStream *)a3 compressedSize:(unsigned int)a4 uncompressedSize:(unsigned int)a5 cancel:(id)a6;
+ (id)readFromData:(id)a3 cancel:(id)a4;
+ (id)readFromFileName:(id)a3 cancel:(id)a4;
+ (id)readFromParentStorage:(SsrwOOStorage *)a3 storageName:(id)a4 cancel:(id)a5;
+ (id)readFromStream:(SsrwOOStream *)a3 size:(unsigned int)a4 cancel:(id)a5;
+ (id)readUnicodeStringFromStream:(SsrwOOStream *)a3;
+ (id)stringForCLSID:(_SsrwOO_GUID)a3;
@end

@implementation OABOle

+ (id)readFromParentStorage:(SsrwOOStorage *)a3 storageName:(id)a4 cancel:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  v11 = (const char *)[v10 UTF8String];
  v22 = 0;
  if (v11)
  {
    v12 = (SsrwOOStorage *)SsrwOOStorage::openStorage(a3, v11);
    if (v12)
    {
      SsrwOORootStorage::SsrwOORootStorage((SsrwOORootStorage *)&v21);
      v22 = malloc_type_malloc(0x4000uLL, 0x7E9BD92FuLL);
      SsrwOORootStorage::createInBuf((SsrwOORootStorage *)&v21, &v22, 0x4000u, MEMORY[0x263EF8A48], v13);
      copyStorageToStorage(v12, &v21);
      uint64_t v14 = SsrwOORootStorage::allocedSize((SsrwOORootStorage *)&v21);
      SsrwOORootStorage::close((SsrwOORootStorage *)&v21, 0);
      id v15 = objc_alloc(MEMORY[0x263EFF990]);
      v16 = (void *)[v15 initWithBytesNoCopy:v22 length:v14 freeWhenDone:0];
      v17 = [a1 readFromData:v16 cancel:v9];

      SsrwOORootStorage::~SsrwOORootStorage((SsrwOORootStorage *)&v21);
      v18 = v22;
    }
    else
    {
      v18 = 0;
      v17 = 0;
    }
  }
  else
  {
    v18 = 0;
    v17 = 0;
    v12 = 0;
  }
  free(v18);
  if (v12)
  {
    SsrwOOStorage::close(v12, 0);
    SsrwOOStorage::~SsrwOOStorage(v12);
    MEMORY[0x23EC997B0]();
  }
  id v19 = v17;

  return v19;
}

+ (id)readFromData:(id)a3 cancel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 length] >> 32)
  {
    id v8 = 0;
    goto LABEL_14;
  }
  id v9 = objc_alloc_init(OADOle);
  SsrwOORootStorage::SsrwOORootStorage((SsrwOORootStorage *)v20);
  id v19 = 0;
  id v10 = v6;
  SsrwOORootStorage::openInBuf((SsrwOORootStorage *)v20, &v19, objc_msgSend(v10, "length", objc_msgSend(v10, "bytes", 0)));
  char v11 = [a1 readSharedInfoFor:v9 fromStorage:v20];
  SsrwOORootStorage::close((SsrwOORootStorage *)v20, 0);
  SsrwOORootStorage::~SsrwOORootStorage((SsrwOORootStorage *)v20);
  if ((v11 & 1) == 0) {
    goto LABEL_11;
  }
  v12 = [[EBReader alloc] initWithCancelDelegate:v7];
  [(OCDReader *)v12 setData:v6];
  if (![(EBReader *)v12 start])
  {

    goto LABEL_11;
  }
  int8x8_t v13 = v12;
  v20[0] = 0;
  if (![(OCBReader *)v13 retainDecryptorWithErrorCode:v20]
    || ([(OCDEncryptedReader *)v13 decryptor],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 isReadProtectedUsingDefaultPassphrase],
        v14,
        (v15 & 1) != 0))
  {
    uint64_t v16 = [(EBReader *)v13 read];

    if (v16)
    {
      [(OADOle *)v9 setObject:v16];
LABEL_12:
      v17 = v9;
      int8x8_t v13 = (EBReader *)v16;
      id v8 = v17;
      goto LABEL_13;
    }
LABEL_11:

    uint64_t v16 = 0;
    id v9 = 0;
    goto LABEL_12;
  }

  id v8 = 0;
  v17 = (OADOle *)v13;
LABEL_13:

LABEL_14:
  return v8;
}

+ (id)readCompressedFromStream:(SsrwOOStream *)a3 compressedSize:(unsigned int)a4 uncompressedSize:(unsigned int)a5 cancel:(id)a6
{
  id v10 = a6;
  if (a4 >= 0x4000) {
    size_t v11 = 0x4000;
  }
  else {
    size_t v11 = a4;
  }
  uInt v28 = v11;
  v12 = (Bytef *)malloc_type_malloc(v11, 0x6ADED809uLL);
  if (!v12)
  {
    char v15 = 0;
    int v22 = 0;
    uint64_t v14 = 0;
LABEL_22:
    int v23 = 1;
    goto LABEL_24;
  }
  if (a5 >= 0x4000) {
    size_t v13 = 0x4000;
  }
  else {
    size_t v13 = a5;
  }
  uint64_t v14 = (Bytef *)malloc_type_malloc(v13, 0x7F5E63C1uLL);
  if (!v14)
  {
    char v15 = 0;
    int v22 = 0;
    goto LABEL_22;
  }
  char v15 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:a5];
  id v26 = a1;
  memset(&strm, 0, sizeof(strm));
  int v16 = inflateInit_(&strm, "1.2.12", 112);
  strm.avail_in = 0;
  strm.next_out = v14;
  strm.avail_out = v13;
  if (!v16)
  {
    uint64_t v17 = a4;
    do
    {
      if (!strm.avail_in)
      {
        uInt v18 = v28;
        if (v17 - strm.total_in < v28)
        {
          uInt v28 = v17 - LODWORD(strm.total_in);
          uInt v18 = v17 - LODWORD(strm.total_in);
        }
        if (!v18) {
          break;
        }
        (*((void (**)(SsrwOOStream *, Bytef *, uInt *))a3->var0 + 7))(a3, v12, &v28);
        strm.next_in = v12;
        strm.avail_in = v28;
        if (!v28) {
          break;
        }
      }
      int v19 = inflate(&strm, 0);
      uint64_t v20 = (v13 - strm.avail_out);
      if ((int)v20 >= 1)
      {
        SsrwOOStorage v21 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v14 length:v20 freeWhenDone:0];
        [v15 appendData:v21];
      }
      strm.next_out = v14;
      strm.avail_out = v13;
    }
    while (!v19);
  }
  int v23 = 0;
  int v22 = inflateEnd(&strm);
  a1 = v26;
LABEL_24:
  if (v12) {
    free(v12);
  }
  if (v14) {
    free(v14);
  }
  if (v23 | v22)
  {
    v24 = 0;
  }
  else
  {
    v24 = [a1 readFromData:v15 cancel:v10];
  }

  return v24;
}

+ (BOOL)readSharedInfoFor:(id)a3 fromStorage:(SsrwOOStorage *)a4
{
  id v6 = a3;
  if (!v6
    || SsrwOOStorage::getChildType(a4, +[OABOle readSharedInfoFor:fromStorage:]::compObjStreamName) != 2)
  {
    BOOL v11 = 0;
    goto LABEL_15;
  }
  id v7 = SsrwOOStorage::openStream(a4, +[OABOle readSharedInfoFor:fromStorage:]::compObjStreamName);
  if ((*(unsigned int (**)(void))(*(void *)v7 + 176))() < 0xC
    || ((*(void (**)(SsrwOOStgStream *))(*(void *)v7 + 80))(v7),
        (*(void (**)(SsrwOOStgStream *))(*(void *)v7 + 80))(v7),
        (*(void (**)(SsrwOOStgStream *))(*(void *)v7 + 104))(v7),
        (*(void (**)(SsrwOOStgStream *))(*(void *)v7 + 104))(v7),
        +[OABOle readCLSIDFromStream:v7],
        (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v10 = 0;
    goto LABEL_11;
  }
  [v6 setCLSID:v8];
  id v9 = [a1 readAnsiStringFromStream:v7];
  if (v9)
  {
    [v6 setAnsiUserType:v9];
    if ((*(unsigned int (**)(SsrwOOStgStream *))(*(void *)v7 + 176))(v7) >= 4)
    {
      int v14 = (*(uint64_t (**)(SsrwOOStgStream *))(*(void *)v7 + 96))(v7);
      if (v14 == -2)
      {
        char v15 = [a1 read4ByteFromStream:v7];
        if (!v15) {
          goto LABEL_31;
        }
        [v6 setMacClipboardFormat:v15];
      }
      else
      {
        if (v14 == -1)
        {
          if ((*(unsigned int (**)(SsrwOOStgStream *))(*(void *)v7 + 176))(v7) >= 4)
          {
            [v6 setWinClipboardFormat:(*(uint64_t (**)(SsrwOOStgStream *))(*(void *)v7 + 104))(v7)];
LABEL_25:
            if ((*(unsigned int (**)(SsrwOOStgStream *))(*(void *)v7 + 176))(v7) >= 4)
            {
              int v16 = [a1 readAnsiStringFromStream:v7];
              [v6 setAnsiProgID:v16];
              if ((*(unsigned int (**)(SsrwOOStgStream *))(*(void *)v7 + 176))(v7) >= 4
                && (*(unsigned int (**)(SsrwOOStgStream *))(*(void *)v7 + 104))(v7) == 1907505652)
              {
                uint64_t v17 = [a1 readUnicodeStringFromStream:v7];
                [v6 setUnicodeUserType:v17];
                uInt v18 = [a1 readUnicodeStringFromStream:v7];
                [v6 setUnicodeClipboardFormatName:v18];
                int v19 = [a1 readUnicodeStringFromStream:v7];
                [v6 setUnicodeProgID:v19];
              }
            }

            char v10 = 0;
            int v12 = 0;
            goto LABEL_12;
          }
LABEL_31:
          char v10 = 0;
          goto LABEL_8;
        }
        (*(void (**)(SsrwOOStgStream *, uint64_t, uint64_t))(*(void *)v7 + 16))(v7, 4294967292, 1);
        char v15 = [a1 readAnsiStringFromStream:v7];
        if (!v15) {
          goto LABEL_31;
        }
        [v6 setAnsiClipboardFormatName:v15];
      }

      goto LABEL_25;
    }
  }
  char v10 = 1;
LABEL_8:

LABEL_11:
  int v12 = 1;
LABEL_12:
  (*(void (**)(SsrwOOStgStream *, uint64_t))(*(void *)v7 + 152))(v7, 1);
  (*(void (**)(SsrwOOStgStream *))(*(void *)v7 + 8))(v7);
  if ((v12 | 2) == 2) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10;
  }
LABEL_15:

  return v11;
}

+ (id)readCLSIDFromStream:(SsrwOOStream *)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  if ((*((unsigned int (**)(SsrwOOStream *, SEL))a3->var0 + 22))(a3, a2) >= 0x10)
  {
    LODWORD(v8[0]) = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 13))(a3);
    WORD2(v8[0]) = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 10))(a3);
    HIWORD(v8[0]) = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 10))(a3);
    for (uint64_t i = 8; i != 16; ++i)
      *((unsigned char *)v8 + i) = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 8))(a3);
    v5 = objc_msgSend(a1, "stringForCLSID:", v8[0], v8[1]);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)stringForCLSID:(_SsrwOO_GUID)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%08X-%04hX-%04hX-%02hhX%02hhX-%02hhX%02hhX%02hhX%02hhX%02hhX%02hhX", *(void *)&a3.var0, a3.var1, a3.var2, a3.var3[0], a3.var3[1], a3.var3[2], a3.var3[3], a3.var3[4], a3.var3[5], a3.var3[6], a3.var3[7]);
}

+ (BOOL)isChart:(id)a3
{
  v4 = [a3 CLSID];
  if (v4) {
    char v5 = [a1 isBiffCLSID:v4];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isBiffCLSID:(id)a3
{
  id v3 = a3;
  v4 = (void *)+[OABOle isBiffCLSID:]::biffClassIds;
  if (!+[OABOle isBiffCLSID:]::biffClassIds)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"00020820-0000-0000-C000-000000000046", @"00020803-0000-0000-C000-000000000046", @"00020821-0000-0000-C000-000000000046", @"00020801-0000-0000-C000-000000000046", 0);
    id v6 = (void *)+[OABOle isBiffCLSID:]::biffClassIds;
    +[OABOle isBiffCLSID:]::biffClassIds = v5;

    v4 = (void *)+[OABOle isBiffCLSID:]::biffClassIds;
  }
  char v7 = [v4 containsObject:v3];

  return v7;
}

+ (id)readAnsiStringFromStream:(SsrwOOStream *)a3
{
  if ((*((unsigned int (**)(SsrwOOStream *, SEL))a3->var0 + 22))(a3, a2) < 4)
  {
LABEL_4:
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  unsigned int v4 = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 13))(a3);
  if (v4)
  {
    if ((*((unsigned int (**)(SsrwOOStream *))a3->var0 + 22))(a3) >= v4) {
      operator new[]();
    }
    goto LABEL_4;
  }
  uint64_t v5 = &stru_26EBF24D8;
LABEL_7:
  return v5;
}

+ (id)readUnicodeStringFromStream:(SsrwOOStream *)a3
{
  if ((*((unsigned int (**)(SsrwOOStream *, SEL))a3->var0 + 22))(a3, a2) < 4)
  {
LABEL_4:
    uint64_t v5 = 0;
    goto LABEL_7;
  }
  unsigned int v4 = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 13))(a3);
  if (v4)
  {
    if ((*((unsigned int (**)(SsrwOOStream *))a3->var0 + 22))(a3) >= v4) {
      operator new[]();
    }
    goto LABEL_4;
  }
  uint64_t v5 = &stru_26EBF24D8;
LABEL_7:
  return v5;
}

+ (id)readFromStream:(SsrwOOStream *)a3 size:(unsigned int)a4 cancel:(id)a5
{
  id v8 = a5;
  id v9 = malloc_type_malloc(a4, 0x55546099uLL);
  unsigned int v13 = a4;
  (*((void (**)(SsrwOOStream *, void *, unsigned int *))a3->var0 + 7))(a3, v9, &v13);
  char v10 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v9 length:a4 freeWhenDone:1];
  BOOL v11 = [a1 readFromData:v10 cancel:v8];

  return v11;
}

+ (id)read4ByteFromStream:(SsrwOOStream *)a3
{
  if ((*((unsigned int (**)(SsrwOOStream *, SEL))a3->var0 + 22))(a3, a2) >= 4)
  {
    for (uint64_t i = 3; i != -1; --i)
      v7[i] = (*((uint64_t (**)(SsrwOOStream *))a3->var0 + 8))(a3);
    v7[4] = 0;
    unsigned int v4 = (void *)[[NSString alloc] initWithUTF8String:v7];
  }
  else
  {
    unsigned int v4 = 0;
  }
  return v4;
}

+ (id)readFromFileName:(id)a3 cancel:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = a4;
  id v8 = objc_alloc_init(OADOle);
  SsrwOORootStorage::SsrwOORootStorage((SsrwOORootStorage *)v18);
  SsrwOORootStorage::open(v18, [(NSString *)v6 fileSystemRepresentation], 0);
  LOBYTE(a1) = [a1 readSharedInfoFor:v8 fromStorage:v18];
  SsrwOORootStorage::close((SsrwOORootStorage *)v18, 0);
  SsrwOORootStorage::~SsrwOORootStorage((SsrwOORootStorage *)v18);
  if ((a1 & 1) == 0) {
    goto LABEL_9;
  }
  id v9 = [[EBReader alloc] initWithCancelDelegate:v7];
  [(OCDReader *)v9 setFileName:v6];
  if (![(EBReader *)v9 start])
  {

LABEL_9:
    int v16 = [MEMORY[0x263F08850] defaultManager];
    [v16 removeItemAtPath:v6 error:0];

    uint64_t v13 = 0;
    goto LABEL_10;
  }
  char v10 = v9;
  LODWORD(v18[0]) = 0;
  if ([(OCBReader *)v10 retainDecryptorWithErrorCode:v18])
  {
    BOOL v11 = [(OCDEncryptedReader *)v10 decryptor];
    char v12 = [v11 isReadProtectedUsingDefaultPassphrase];

    if ((v12 & 1) == 0)
    {

      TCRemoveFileSecurely(v6);
      int v14 = 0;
      char v15 = (OADOle *)v10;
      goto LABEL_11;
    }
  }
  uint64_t v13 = [(EBReader *)v10 read];

  if (!v13) {
    goto LABEL_9;
  }
  [(OADOle *)v8 setObject:v13];
LABEL_10:
  char v15 = v8;
  char v10 = (EBReader *)v13;
  int v14 = v15;
LABEL_11:

  return v14;
}

@end