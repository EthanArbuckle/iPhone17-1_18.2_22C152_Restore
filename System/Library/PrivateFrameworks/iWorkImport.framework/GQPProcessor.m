@interface GQPProcessor
+ (_xmlTextReader)createXmlReaderWithPath:(id)a3 indexFileName:(id)a4 cryptoKey:(id)a5;
+ (_xmlTextReader)createXmlReaderWithZipArchive:(id)a3 indexFileName:(id)a4 cryptoKey:(id)a5 indexEntry:(id *)a6 zipInputStream:(id *)a7;
+ (void)initialize;
- (BOOL)go;
- (BOOL)isWrongFormat;
- (CGSize)thumbnailSize;
- (GQPProcessor)initWithPath:(id)a3 indexFileName:(id)a4 previewRequest:(__QLPreviewRequest *)a5 cryptoKey:(id)a6;
- (GQPProcessor)initWithZipArchive:(id)a3 indexFileName:(id)a4 previewRequest:(__QLPreviewRequest *)a5;
- (GQPProcessor)initWithZipArchive:(id)a3 indexFileName:(id)a4 previewRequest:(__QLPreviewRequest *)a5 cryptoKey:(id)a6;
- (__CFBundle)bundle;
- (id)archive;
- (id)cryptoKey;
- (id)documentState;
- (void)actionStack;
- (void)dealloc;
- (void)setBundle:(__CFBundle *)a3;
- (void)setProgressiveMode:(unsigned __int8)a3;
- (void)setThumbnailSize:(CGSize)a3;
- (void)setWrongFormat:(BOOL)a3;
- (void)stateStack;
@end

@implementation GQPProcessor

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2)
  {
    nullsub_2(v2);
    sub_42674();
  }
}

- (GQPProcessor)initWithPath:(id)a3 indexFileName:(id)a4 previewRequest:(__QLPreviewRequest *)a5 cryptoKey:(id)a6
{
  v29.receiver = self;
  v29.super_class = (Class)GQPProcessor;
  v10 = [(GQPProcessor *)&v29 init];
  if (v10)
  {
    xmlSetGenericErrorFunc(0, (xmlGenericErrorFunc)nullsub_3);
    v10->mOutputPreviewRequest = a5;
    *(_WORD *)&v10->mWrongFormat = 0;
    char v28 = 0;
    v10->mCryptoKey = (SFUCryptoKey *)a6;
    v11 = +[NSFileManager defaultManager];
    if ([(NSFileManager *)v11 fileExistsAtPath:a3 isDirectory:&v28])
    {
      if (v28)
      {
        id v12 = [a3 stringByAppendingPathComponent:a4];
        id v13 = [v12 stringByAppendingPathExtension:@"gz"];
        if ([(NSFileManager *)v11 fileExistsAtPath:v13]
          || (id v13 = v12, [(NSFileManager *)v11 fileExistsAtPath:v12]))
        {
          if (v13)
          {
            int v14 = open((const char *)[v13 fileSystemRepresentation], 0, 0);
            if (v14 != -1)
            {
              int v15 = v14;
              fcntl(v14, 48, 1);
              xmlParserInputBufferPtr v16 = xmlAllocParserInputBuffer(XML_CHAR_ENCODING_UTF8);
              if (v16)
              {
                v17 = v16;
                gzFile v18 = gzdopen(v15, "rb");
                if (v18) {
                  gzFile v19 = v18;
                }
                else {
                  gzFile v19 = (gzFile)v15;
                }
                if (v18) {
                  v20 = (int (__cdecl *)(void *, char *, int))sub_3BE04;
                }
                else {
                  v20 = (int (__cdecl *)(void *, char *, int))sub_3BDE4;
                }
                v21 = (int (__cdecl *)(void *))sub_3BE4C;
                v17->context = v19;
                v17->readcallback = v20;
                if (!v18) {
                  v21 = (int (__cdecl *)(void *))j__close;
                }
                v17->closecallback = v21;
                v10->mParserInputBuffer = v17;
                v22 = (_xmlTextReader *)[(id)objc_opt_class() createXmlReaderWithPath:a3 indexFileName:a4 cryptoKey:a6];
LABEL_28:
                v10->mReader = v22;
                if (v22) {
LABEL_29:
                }
                  operator new();
                goto LABEL_30;
              }
              close(v15);
              xmlGetLastError();
            }
            v10->mParserInputBuffer = 0;
          }
        }
      }
      else
      {
        v23 = (SFUZipArchive *)[objc_alloc((Class)SFUZipArchive) initWithPath:a3 collapseCommonRootDirectory:1];
        v10->mArchive = v23;
        if (v23)
        {
          id v24 = [(SFUZipArchive *)v23 entryWithName:a4];
          if (v24)
          {
            if (!a6)
            {
              v22 = (_xmlTextReader *)[v24 xmlReader];
              goto LABEL_28;
            }
          }
          else
          {
            id v25 = -[SFUZipArchive entryWithName:](v10->mArchive, "entryWithName:", [a4 stringByAppendingPathExtension:@"gz"]);
            if (!a6)
            {
              v22 = (_xmlTextReader *)[v25 xmlReaderForGzippedData];
              goto LABEL_28;
            }
          }
          id v26 = [objc_alloc((Class)SFUZipArchive) initWithPath:a3 collapseCommonRootDirectory:1];
          v10->mReader = xmlReaderForIO((xmlInputReadCallback)sub_3B564, (xmlInputCloseCallback)sub_3B5D8, +[SFUCryptoUtils newBufferedInputStreamForDecryptingZippedBundle:key:zipArchive:isDeflated:zipStream:](SFUCryptoUtils, "newBufferedInputStreamForDecryptingZippedBundle:key:zipArchive:isDeflated:zipStream:", [a4 stringByAppendingPathExtension:@"gz"], a6, v26, 1, 0), 0, 0, 0);

          if (v10->mReader) {
            goto LABEL_29;
          }
        }
      }
    }
LABEL_30:

    return 0;
  }
  return v10;
}

- (GQPProcessor)initWithZipArchive:(id)a3 indexFileName:(id)a4 previewRequest:(__QLPreviewRequest *)a5
{
  if ([a3 isEncrypted])
  {
    return [(GQPProcessor *)self initWithZipArchive:a3 indexFileName:a4 previewRequest:a5 cryptoKey:0];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)GQPProcessor;
    v9 = [(GQPProcessor *)&v11 init];
    if (v9)
    {
      xmlSetGenericErrorFunc(0, (xmlGenericErrorFunc)nullsub_3);
      v9->mOutputPreviewRequest = a5;
      *(_WORD *)&v9->mWrongFormat = 0;
      if (objc_msgSend(a3, "entryWithName:", objc_msgSend(a4, "stringByAppendingPathExtension:", @"gz"))
        || [a3 entryWithName:a4])
      {
        operator new();
      }

      return 0;
    }
    return v9;
  }
}

- (GQPProcessor)initWithZipArchive:(id)a3 indexFileName:(id)a4 previewRequest:(__QLPreviewRequest *)a5 cryptoKey:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)GQPProcessor;
  v10 = [(GQPProcessor *)&v14 init];
  if (v10)
  {
    v10->mCryptoKey = (SFUCryptoKey *)a6;
    v10->mOutputPreviewRequest = a5;
    v10->mWrongFormat = 0;
    uint64_t v13 = 0;
    objc_super v11 = (_xmlTextReader *)[(id)objc_opt_class() createXmlReaderWithZipArchive:a3 indexFileName:a4 cryptoKey:v10->mCryptoKey indexEntry:&v13 zipInputStream:&v10->mInputStream];
    v10->mReader = v11;
    if (v11) {
      operator new();
    }

    return 0;
  }
  return v10;
}

+ (_xmlTextReader)createXmlReaderWithZipArchive:(id)a3 indexFileName:(id)a4 cryptoKey:(id)a5 indexEntry:(id *)a6 zipInputStream:(id *)a7
{
  xmlSetGenericErrorFunc(0, (xmlGenericErrorFunc)nullsub_3);
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  id v12 = [a4 stringByAppendingPathExtension:@"gz"];
  uint64_t v13 = (_xmlTextReader *)[a3 entryWithName:v12];
  if (!v13)
  {
    result = (_xmlTextReader *)[a3 entryWithName:a4];
    if (!result) {
      return result;
    }
    objc_super v14 = result;
    result = (_xmlTextReader *)[(_xmlTextReader *)result xmlReader];
    if (!a6) {
      return result;
    }
    goto LABEL_16;
  }
  objc_super v14 = v13;
  if (!a7)
  {
    result = (_xmlTextReader *)[(_xmlTextReader *)v13 xmlReaderForGzippedData];
    if (!a6) {
      return result;
    }
    goto LABEL_16;
  }
  if (!a5)
  {
    result = (_xmlTextReader *)[(_xmlTextReader *)v13 xmlReaderForGzippedDataWithInputStream:a7];
    if (!a6) {
      return result;
    }
    goto LABEL_16;
  }
  result = (_xmlTextReader *)+[SFUCryptoUtils newBufferedInputStreamForDecryptingZippedBundle:v12 key:a5 zipArchive:a3 isDeflated:1 zipStream:0];
  xmlParserInputBufferPtr v16 = result;
  if (result) {
    result = xmlReaderForIO((xmlInputReadCallback)sub_3B564, (xmlInputCloseCallback)sub_3B5D8, result, 0, 0, 0);
  }
  *a7 = v16;
  if (a6) {
LABEL_16:
  }
    *a6 = v14;
  return result;
}

+ (_xmlTextReader)createXmlReaderWithPath:(id)a3 indexFileName:(id)a4 cryptoKey:(id)a5
{
  xmlSetGenericErrorFunc(0, (xmlGenericErrorFunc)nullsub_3);
  char v20 = 0;
  v8 = +[NSFileManager defaultManager];
  v9 = 0;
  if (![(NSFileManager *)v8 fileExistsAtPath:a3 isDirectory:&v20]) {
    return v9;
  }
  if (v20)
  {
    id v10 = [a3 stringByAppendingPathComponent:a4];
    id v11 = [v10 stringByAppendingPathExtension:@"gz"];
    BOOL v12 = [(NSFileManager *)v8 fileExistsAtPath:v11];
    if (v12 || (id v11 = v10, [(NSFileManager *)v8 fileExistsAtPath:v10]))
    {
      if (v11)
      {
        if (a5) {
          return xmlReaderForIO((xmlInputReadCallback)sub_3B564, (xmlInputCloseCallback)sub_3B5D8, +[SFUCryptoUtils newBufferedInputStreamForDecryptingFile:v11 key:a5 isDeflated:v12 zipStream:0], 0, 0, 0);
        }
        id v16 = [objc_alloc((Class)SFUFileDataRepresentation) initWithPath:v11];
        v17 = v16;
        if (v12) {
          gzFile v18 = (_xmlTextReader *)[v16 xmlReaderForGzippedData];
        }
        else {
          gzFile v18 = (_xmlTextReader *)[v16 xmlReader];
        }
        v9 = v18;

        return v9;
      }
    }
    return 0;
  }
  id v13 = [objc_alloc((Class)SFUZipArchive) initWithPath:a3 collapseCommonRootDirectory:1];
  if ([v13 passphraseVerifier]) {
    [v13 setCryptoKey:a5];
  }
  if (!v13) {
    return 0;
  }
  id v14 = [v13 entryWithName:a4];
  if (v14) {
    int v15 = (_xmlTextReader *)[v14 xmlReader];
  }
  else {
    int v15 = (_xmlTextReader *)objc_msgSend(objc_msgSend(v13, "entryWithName:", objc_msgSend(a4, "stringByAppendingPathExtension:", @"gz")), "xmlReaderForGzippedData");
  }
  v9 = v15;

  return v9;
}

- (void)dealloc
{
  xmlFreeTextReader(self->mReader);
  xmlFreeParserInputBuffer(self->mParserInputBuffer);

  mStateStack = self->mStateStack;
  if (mStateStack)
  {
    sub_3BE90(mStateStack);
    operator delete();
  }
  mActionStack = self->mActionStack;
  if (mActionStack)
  {
    sub_3C018(mActionStack);
    operator delete();
  }

  v5.receiver = self;
  v5.super_class = (Class)GQPProcessor;
  [(GQPProcessor *)&v5 dealloc];
}

- (id)archive
{
  return self->mArchive;
}

- (__CFBundle)bundle
{
  result = self->mBundle;
  if (!result)
  {
    result = CFBundleGetBundleWithIdentifier(@"com.apple.iwork.iWorkQuickLookGenerator");
    self->mBundle = result;
    if (!result)
    {
      result = CFBundleGetMainBundle();
      self->mBundle = result;
    }
  }
  return result;
}

- (void)setBundle:(__CFBundle *)a3
{
  self->mBundle = a3;
}

- (BOOL)go
{
  [(GQPProcessor *)self pushInitialState];
  int v3 = 1;
  while (1)
  {
    do
    {
      if (v3 == 1 && xmlTextReaderRead(self->mReader) != 1)
      {
        int v3 = 1;
        return v3 != 3;
      }
      int v3 = sub_3AD94(self->mReader, (uint64_t)self, (void *)self->mStateStack, (void *)self->mActionStack, self->mDocumentState);
      if ((v3 - 3) < 2) {
        return v3 != 3;
      }
    }
    while (!self->mOutputPreviewRequest && !self->mIsProgressive || pthread_mutex_lock(&stru_9D2C8));
    if (byte_A2780) {
      break;
    }
    pthread_mutex_unlock(&stru_9D2C8);
  }
  byte_A2780 = 0;
  pthread_mutex_unlock(&stru_9D2C8);
  int v3 = 3;
  return v3 != 3;
}

- (void)stateStack
{
  return self->mStateStack;
}

- (void)actionStack
{
  return self->mActionStack;
}

- (id)documentState
{
  return self->mDocumentState;
}

- (id)cryptoKey
{
  return self->mCryptoKey;
}

- (CGSize)thumbnailSize
{
  double width = self->mThumbnailSize.width;
  double height = self->mThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->mThumbnailSize = a3;
}

- (void)setProgressiveMode:(unsigned __int8)a3
{
  self->mIsProgressive = a3;
}

- (BOOL)isWrongFormat
{
  return self->mWrongFormat;
}

- (void)setWrongFormat:(BOOL)a3
{
  self->mWrongFormat = a3;
}

@end