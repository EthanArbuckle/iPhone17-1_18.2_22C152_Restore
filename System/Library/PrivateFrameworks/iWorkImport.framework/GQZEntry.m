@interface GQZEntry
- (_xmlDoc)recoverXmlDocument;
- (_xmlDoc)xmlDocument;
- (_xmlTextReader)xmlReader:(BOOL)a3;
- (id)data;
- (id)initFromCentralFileHeader:(const char *)a3 inputStream:(id)a4;
- (id)inputStream;
- (void)dealloc;
- (void)readZip64ExtraField:(const char *)a3 size:(unint64_t)a4;
@end

@implementation GQZEntry

- (id)initFromCentralFileHeader:(const char *)a3 inputStream:(id)a4
{
  v6 = [(GQZEntry *)self init];
  if (!v6) {
    return v6;
  }
  v6->mInput = (GQZArchiveInputStream *)a4;
  if (*((_WORD *)a3 + 2)) {
    +[GQZException raise:@"GQZCentralFileHeaderError" format:@"Encrypted files are not supported"];
  }
  int v7 = 0;
  unsigned int v8 = *((unsigned __int16 *)a3 + 3);
  if (v8 > 0x636A)
  {
    if (v8 != 25451)
    {
      if (v8 != 25452) {
        goto LABEL_7;
      }
      goto LABEL_10;
    }
LABEL_11:
    v6->mCompressionMethod = v7;
    goto LABEL_12;
  }
  if (!*((_WORD *)a3 + 3)) {
    goto LABEL_11;
  }
  if (v8 == 8)
  {
LABEL_10:
    int v7 = 1;
    goto LABEL_11;
  }
LABEL_7:
  +[GQZException raise:@"GQZCentralFileHeaderError" format:@"Unsupported compression method"];
LABEL_12:
  v6->mCrc = *((_DWORD *)a3 + 3);
  uint64_t v9 = *((void *)a3 + 2);
  *(void *)&long long v10 = v9;
  *((void *)&v10 + 1) = HIDWORD(v9);
  *(_OWORD *)&v6->mCompressedSize = v10;
  if (*((_WORD *)a3 + 15)) {
    +[GQZException raise:@"GQZCentralFileHeaderError" format:@"No multi-disk support"];
  }
  v6->mOffset = *(unsigned int *)(a3 + 38);
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQZEntry;
  [(GQZEntry *)&v3 dealloc];
}

- (id)inputStream
{
  objc_super v3 = (unsigned __int16 *)[(GQZArchiveInputStream *)self->mInput dataAtOffset:self->mOffset size:30 end:self->mOffset + 30 readSize:0];
  if (*(_DWORD *)v3 != 67324752) {
    +[GQZException raise:@"GQZEntryError" format:@"Local file header record signature not found"];
  }
  unint64_t v4 = v3[13] + self->mOffset + v3[14] + 30;
  int mCompressionMethod = self->mCompressionMethod;
  if (mCompressionMethod == 1)
  {
    v6 = [[GQZEntryInflateInputStream alloc] initWithOffset:v4 end:self->mCompressedSize + v4 uncompressedSize:self->mUncompressedSize crc:self->mCrc input:self->mInput];
  }
  else
  {
    if (mCompressionMethod) {
      return 0;
    }
    v6 = [[GQZEntryUncompressedInputStream alloc] initWithOffset:v4 end:self->mUncompressedSize + v4 input:self->mInput];
  }
  return v6;
}

- (id)data
{
  objc_super v3 = +[NSMutableData dataWithLength:self->mUncompressedSize];
  if (!v3) {
    +[GQZException raise:@"GQZEntryError", @"Couldn't allocate NSMutableData with size: %qu", self->mUncompressedSize format];
  }
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  if (objc_msgSend(-[GQZEntry inputStream](self, "inputStream"), "readToBuffer:size:", -[NSMutableData mutableBytes](v3, "mutableBytes"), self->mUncompressedSize) != self->mUncompressedSize)+[GQZException raise:format:](GQZException, "raise:format:", @"GQZEntryError", @"Couldn't read data with size: %qu", self->mUncompressedSize); {

  }
  return v3;
}

- (_xmlDoc)xmlDocument
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  id v4 = [(GQZEntry *)self inputStream];
  chunk = 0;
  *(void *)size = 0;
  [v4 readToOwnBuffer:&chunk size:size];
  xmlParserCtxtPtr PushParserCtxt = xmlCreatePushParserCtxt(0, 0, chunk, size[0], 0);
  if (!PushParserCtxt) {
    +[GQZException raise:@"GQZEntryError" format:@"xmlCreatePushParserCtxt() failed"];
  }
  while (1)
  {
    [v4 readToOwnBuffer:&chunk size:size];
    if (!*(void *)size) {
      break;
    }
    uint64_t v6 = xmlParseChunk(PushParserCtxt, chunk, size[0], 0);
    if (v6) {
      +[GQZException raise:@"GQZEntryError", @"xmlParseChunk() failed: %d", v6 format];
    }
  }
  uint64_t v7 = xmlParseChunk(PushParserCtxt, chunk, 0, 1);
  if (v7) {
    +[GQZException raise:@"GQZEntryError", @"xmlParseChunk() failed: %d", v7 format];
  }
  myDoc = PushParserCtxt->myDoc;
  if (!PushParserCtxt->wellFormed) {
    +[GQZException raise:@"GQZEntryError" format:@"XML document is not well formed."];
  }
  xmlFreeParserCtxt(PushParserCtxt);

  return myDoc;
}

- (_xmlDoc)recoverXmlDocument
{
  id v2 = [(GQZEntry *)self inputStream];
  return xmlReadIO((xmlInputReadCallback)sub_45220, (xmlInputCloseCallback)sub_45294, v2, 0, 0, 97);
}

- (_xmlTextReader)xmlReader:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GQZEntry *)self inputStream];
  v5 = v4;
  if (!v3)
  {
    uint64_t v7 = v4;
    return xmlReaderForIO((xmlInputReadCallback)sub_45220, (xmlInputCloseCallback)sub_45294, v5, 0, 0, 0);
  }
  if ([(GQZInflateInputStream *)v4 readToBuffer:v11 size:10] == 10)
  {
    char v6 = v12;
    if ((v12 & 4) != 0)
    {
      unsigned __int16 v10 = 0;
      if ((char *)[(GQZInflateInputStream *)v5 readToBuffer:&v10 size:2] != (char *)&dword_0 + 2) {
        return 0;
      }
      if (v10)
      {
        int v9 = 0;
        while ((char *)[(GQZInflateInputStream *)v5 readToBuffer:v11 size:1] == (char *)&dword_0 + 1)
        {
          if (++v9 >= v10) {
            goto LABEL_4;
          }
        }
        return 0;
      }
    }
LABEL_4:
    if ((v6 & 8) != 0)
    {
      v11[0] = 1;
      while ((char *)[(GQZInflateInputStream *)v5 readToBuffer:v11 size:1] == (char *)&dword_0 + 1)
      {
        if (!v11[0]) {
          goto LABEL_8;
        }
      }
      return 0;
    }
LABEL_8:
    if ((v6 & 0x10) != 0)
    {
      v11[0] = 1;
      while ((char *)[(GQZInflateInputStream *)v5 readToBuffer:v11 size:1] == (char *)&dword_0 + 1)
      {
        if (!v11[0]) {
          goto LABEL_12;
        }
      }
      return 0;
    }
LABEL_12:
    if ((v6 & 2) == 0
      || (char *)[(GQZInflateInputStream *)v5 readToBuffer:v11 size:2] == (char *)&dword_0 + 2)
    {
      v5 = [[GQZInflateInputStream alloc] initWithInput:v5];
      return xmlReaderForIO((xmlInputReadCallback)sub_45220, (xmlInputCloseCallback)sub_45294, v5, 0, 0, 0);
    }
  }
  return 0;
}

- (void)readZip64ExtraField:(const char *)a3 size:(unint64_t)a4
{
  uint64_t v7 = a3;
  if (self->mUncompressedSize == 0xFFFFFFFF)
  {
    uint64_t v7 = a3 + 8;
    if ((uint64_t)a4 <= 7) {
      +[GQZException raise:@"GQZCentralFileHeaderError" format:@"Not enough room for Zip64 uncompressed size"];
    }
    self->mUncompressedSize = *(void *)a3;
  }
  unsigned int v8 = &a3[a4];
  if (self->mCompressedSize == 0xFFFFFFFF)
  {
    if (v7 + 8 > v8) {
      +[GQZException raise:@"GQZCentralFileHeaderError" format:@"Not enough room for Zip64 compressed size"];
    }
    self->mCompressedSize = *(void *)v7;
    v7 += 8;
  }
  if (self->mOffset == 0xFFFFFFFF)
  {
    if (v7 + 8 > v8) {
      +[GQZException raise:@"GQZCentralFileHeaderError" format:@"Not enough room for Zip64 offset"];
    }
    self->mOffset = *(void *)v7;
  }
}

@end