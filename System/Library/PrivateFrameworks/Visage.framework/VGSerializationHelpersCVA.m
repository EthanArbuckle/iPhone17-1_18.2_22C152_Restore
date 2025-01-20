@interface VGSerializationHelpersCVA
+ (BOOL)getCVAMatrix3xXf:(void *)a3 fromDictionary:(id)a4 forKey:(id)a5;
+ (BOOL)getCVAMatrix3xXui:(void *)a3 fromDictionary:(id)a4 forKey:(id)a5;
+ (BOOL)getCVAMatrix4x4f:(void *)a3 fromDictionary:(id)a4 forKey:(id)a5;
+ (BOOL)getSimdFloat33:(id *)a3 fromDictionary:(id)a4 forKey:(id)a5;
+ (BOOL)setCVAMatrix3xXf:(const void *)a3 inDictionary:(id)a4 forKey:(id)a5;
+ (BOOL)setCVAMatrix3xXui:(const void *)a3 inDictionary:(id)a4 forKey:(id)a5;
+ (BOOL)setCVAMatrix4x4f:(const void *)a3 inDictionary:(id)a4 forKey:(id)a5;
+ (BOOL)setSimdFloat33:(id *)a3 inDictionary:(id)a4 forKey:(id)a5;
@end

@implementation VGSerializationHelpersCVA

+ (BOOL)setCVAMatrix3xXf:(const void *)a3 inDictionary:(id)a4 forKey:(id)a5
{
  id v7 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v9, (__CFDictionary *)a4);
  cva::ItemHandler::createMatrix<float,3u,0u>((uint64_t)a3);
}

+ (BOOL)setCVAMatrix3xXui:(const void *)a3 inDictionary:(id)a4 forKey:(id)a5
{
  id v7 = (__CFDictionary *)a4;
  id v8 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v20, v7);
  size_t v9 = (4 * (3 * *((_DWORD *)a3 + 4)) + 31) & 0x7FFFFFFE0;
  v18[1] = (void *)(v9 >> 2);
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x20uLL, v9, 0x49090899uLL);
  v10 = memptr;
  v18[0] = memptr;
  int v11 = *((_DWORD *)a3 + 4);
  int v19 = v11;
  if (v11)
  {
    uint64_t v12 = (3 * v11);
    v13 = *(int **)a3;
    uint64_t v14 = 4 * v12;
    do
    {
      int v15 = *v13++;
      *v10++ = v15;
      v14 -= 4;
    }
    while (v14);
  }
  cva::ItemHandler::createMatrix<int,3u,0u>((uint64_t)v18);
}

+ (BOOL)setCVAMatrix4x4f:(const void *)a3 inDictionary:(id)a4 forKey:(id)a5
{
  id v7 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v9, (__CFDictionary *)a4);
  cva::ItemHandler::createMatrix<float,4u,4u>((uint64_t)a3);
}

+ (BOOL)setSimdFloat33:(id *)a3 inDictionary:(id)a4 forKey:(id)a5
{
  id v7 = (__CFDictionary *)a4;
  id v8 = a5;
  size_t v9 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:a3 length:48 freeWhenDone:0];
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v15, v7);
  cva::ItemHandler::createData(v14, v9, v10);
  id v11 = v8;
  char v12 = cva::DictionaryHandler::setItem((cva::DictionaryHandler *)v15, (const char *)[v11 UTF8String], (const cva::ItemHandler *)v14);
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v14);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v15);

  return v12;
}

+ (BOOL)getCVAMatrix3xXf:(void *)a3 fromDictionary:(id)a4 forKey:(id)a5
{
  id v6 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v10, (const __CFDictionary *)a4);
  id v7 = v6;
  cva::DictionaryHandler::item(v9, (cva::DictionaryHandler *)v10, (const char *)[v7 UTF8String]);
  if (cva::ItemHandler::isMatrixType((cva::ItemHandler *)v9)) {
    cva::ItemHandler::getMatrix<float,3u,0u>();
  }
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v9);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v10);

  return 0;
}

+ (BOOL)getCVAMatrix3xXui:(void *)a3 fromDictionary:(id)a4 forKey:(id)a5
{
  CFDictionaryRef v6 = (const __CFDictionary *)a4;
  id v7 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v11, v6);
  id v8 = v7;
  cva::DictionaryHandler::item(v10, (cva::DictionaryHandler *)v11, (const char *)[v8 UTF8String]);
  if (cva::ItemHandler::isMatrixType((cva::ItemHandler *)v10)) {
    cva::ItemHandler::getMatrix<int,3u,0u>();
  }
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v10);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v11);

  return 0;
}

+ (BOOL)getCVAMatrix4x4f:(void *)a3 fromDictionary:(id)a4 forKey:(id)a5
{
  id v6 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v10, (const __CFDictionary *)a4);
  id v7 = v6;
  cva::DictionaryHandler::item(v9, (cva::DictionaryHandler *)v10, (const char *)[v7 UTF8String]);
  if (cva::ItemHandler::isMatrixType((cva::ItemHandler *)v9)) {
    cva::ItemHandler::getMatrix<float,4u,4u>();
  }
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v9);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v10);

  return 0;
}

+ (BOOL)getSimdFloat33:(id *)a3 fromDictionary:(id)a4 forKey:(id)a5
{
  id v7 = a5;
  cva::DictionaryHandler::DictionaryHandler((cva::DictionaryHandler *)v13, (const __CFDictionary *)a4);
  id v8 = v7;
  cva::DictionaryHandler::item(v12, (cva::DictionaryHandler *)v13, (const char *)[v8 UTF8String]);
  char isDataType = cva::ItemHandler::isDataType((cva::ItemHandler *)v12);
  if (isDataType)
  {
    CFDataRef v10 = cva::ItemHandler::getData((cva::ItemHandler *)v12);
    [v10 getBytes:a3 length:48];
  }
  cva::ItemHandler::~ItemHandler((cva::ItemHandler *)v12);
  cva::DictionaryHandler::~DictionaryHandler((cva::DictionaryHandler *)v13);

  return isDataType;
}

@end