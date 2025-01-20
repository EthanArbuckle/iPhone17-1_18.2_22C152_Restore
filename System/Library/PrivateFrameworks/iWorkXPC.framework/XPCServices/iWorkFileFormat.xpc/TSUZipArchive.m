@interface TSUZipArchive
- (BOOL)hasNonEmptyEntries;
- (BOOL)isValid;
- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4 error:(id *)a5;
- (BOOL)readExtraFieldsFromBuffer:(const void *)a3 extraFieldsLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)readFileCommentFromBuffer:(const void *)a3 fileCommentLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)readFilenameFromBuffer:(const void *)a3 nameLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)readLocalFileHeaderFilenameAndExtraFieldsData:(id)a3 forEntry:(id)a4 error:(id *)a5;
- (BOOL)readZip64ExtraFieldFromBuffer:(const void *)a3 dataLength:(unsigned __int16)a4 entry:(id)a5 error:(id *)a6;
- (BOOL)tsp_writeZipEntry:(id)a3 toURL:(id)a4 validateCRC:(BOOL)a5 error:(id *)a6;
- (BOOL)validateCRCAndReturnError:(id *)a3;
- (TSUZipArchive)init;
- (TSUZipArchive)initWithOptions:(unint64_t)a3;
- (id)containedZipArchiveForEntry:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)debugDescription;
- (id)entryForName:(id)a3;
- (id)newArchiveReadChannel;
- (id)normalizeEntryName:(id)a3;
- (id)readChannelForEntry:(id)a3;
- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4;
- (id)sortedEntriesUsingComparator:(id)a3;
- (id)streamReadChannelForEntry:(id)a3;
- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4;
- (id)tsp_dataForEntry:(id)a3;
- (int64_t)endOfLastEntry;
- (unint64_t)archiveLength;
- (unint64_t)entriesCount;
- (unint64_t)options;
- (void)addEntry:(id)a3;
- (void)collapseCommonRootDirectory;
- (void)enumerateEntriesUsingBlock:(id)a3;
- (void)readArchiveWithQueue:(id)a3 completion:(id)a4;
- (void)readCentralDirectoryData:(id)a3 entryCount:(unint64_t)a4 completion:(id)a5;
- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(unint64_t)a5 channel:(id)a6 completion:(id)a7;
- (void)readEndOfCentralDirectoryData:(id)a3 eocdOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6;
- (void)readLocalFileHeaderData:(id)a3 atOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6;
- (void)readLocalFileHeaderEntriesFromChannel:(id)a3 offset:(int64_t)a4 previousEntry:(id)a5 seekAttempts:(unsigned int)a6 seekForward:(BOOL)a7 completion:(id)a8;
- (void)readZip64EndOfCentralDirectoryData:(id)a3 channel:(id)a4 completion:(id)a5;
- (void)readZip64EndOfCentralDirectoryLocatorData:(id)a3 channel:(id)a4 completion:(id)a5;
- (void)readZip64EndOfCentralDirectoryLocatorWithChannel:(id)a3 eocdOffset:(int64_t)a4 completion:(id)a5;
- (void)readZip64EndOfCentralDirectoryWithChannel:(id)a3 offset:(int64_t)a4 completion:(id)a5;
- (void)validateCRCWithQueue:(id)a3 completion:(id)a4;
@end

@implementation TSUZipArchive

- (id)tsp_dataForEntry:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v6 = [(TSUZipArchive *)self streamReadChannelForEntry:v4];
    v7 = +[TSPReadChannelUtils dataFromReadChannel:v6];
    [v6 close];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)tsp_writeZipEntry:(id)a3 toURL:(id)a4 validateCRC:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = [(TSUZipArchive *)self streamReadChannelForEntry:v10 validateCRC:v7];
  if (!v12)
  {
    id v13 = 0;
    id v14 = 0;
    goto LABEL_5;
  }
  id v20 = 0;
  id v13 = [[TSUFileIOChannel alloc] initForStreamWritingURL:v11 error:&v20];
  id v14 = v20;
  if (!v13)
  {
LABEL_5:
    BOOL v15 = 0;
    goto LABEL_6;
  }
  id v19 = v14;
  BOOL v15 = +[TSPFileManager copyDataFromReadChannel:decryptionInfo:size:toWriteChannel:encryptionInfo:encodedLength:error:](TSPFileManager, "copyDataFromReadChannel:decryptionInfo:size:toWriteChannel:encryptionInfo:encodedLength:error:", v12, 0, [v10 size], v13, 0, 0, &v19);
  id v16 = v19;

  id v14 = v16;
LABEL_6:
  [v13 close];
  [v12 close];
  if (a6 && !v15)
  {
    if (v14)
    {
      *a6 = v14;
    }
    else
    {
      id v17 = +[NSError tsp_unknownReadErrorWithUserInfo:0];
      *a6 = v17;
    }
  }

  return v15;
}

- (TSUZipArchive)init
{
  return [(TSUZipArchive *)self initWithOptions:0];
}

- (TSUZipArchive)initWithOptions:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TSUZipArchive;
  id v4 = [(TSUZipArchive *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    entriesMap = v5->_entriesMap;
    v5->_entriesMap = v6;

    v8 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    entries = v5->_entries;
    v5->_entries = v8;
  }
  return v5;
}

- (unint64_t)entriesCount
{
  return (unint64_t)[(NSMutableOrderedSet *)self->_entries count];
}

- (BOOL)hasNonEmptyEntries
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008ADD8;
  v4[3] = &unk_1001CC9E8;
  v4[4] = &v5;
  [(TSUZipArchive *)self enumerateEntriesUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)readArchiveWithQueue:(id)a3 completion:(id)a4
{
  v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(TSUZipArchive *)self archiveLength];
  id v9 = [(TSUZipArchive *)self newArchiveReadChannel];
  id v10 = v9;
  if (v9)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10008B04C;
    v20[3] = &unk_1001CCA38;
    objc_super v11 = (id *)v21;
    id v12 = v9;
    v21[0] = v12;
    v21[1] = self;
    v22 = v6;
    id v23 = v7;
    id v13 = objc_retainBlock(v20);
    if ((self->_options & 8) != 0)
    {
      [(TSUZipArchive *)self readLocalFileHeaderEntriesFromChannel:v12 offset:0 previousEntry:0 seekAttempts:0 seekForward:0 completion:v13];
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10008B15C;
      v16[3] = &unk_1001CCAA8;
      v16[4] = self;
      unint64_t v19 = v8 - 22;
      id v17 = v12;
      v18 = v13;
      +[TSUIOUtils readAllFromChannel:v17 offset:v8 - 22 length:22 completion:v16];
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008B40C;
    block[3] = &unk_1001C6900;
    objc_super v11 = &v15;
    id v15 = v7;
    dispatch_async(v6, block);
  }
}

- (void)readEndOfCentralDirectoryData:(id)a3 eocdOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6
{
  id v10 = a5;
  objc_super v11 = (void (**)(id, void *))a6;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v12 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x15)
  {
    CFStringRef v27 = @"TSUZipArchiveErrorDescription";
    id v15 = +[NSString stringWithFormat:@"Wrong data size (%zu) for TSUZipEndOfCentralDirectoryRecord (size: %zu)", size_ptr, 22];
    v28 = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v17 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v16];

    goto LABEL_9;
  }
  if (*(_DWORD *)buffer_ptr != 101010256)
  {
    CFStringRef v25 = @"TSUZipArchiveErrorDescription";
    CFStringRef v26 = @"Don't support end of central directory comments";
    id v13 = &v26;
    id v14 = &v25;
    goto LABEL_8;
  }
  if (*((_WORD *)buffer_ptr + 2) || *((_WORD *)buffer_ptr + 3))
  {
    CFStringRef v23 = @"TSUZipArchiveErrorDescription";
    CFStringRef v24 = @"Don't support multi-disk";
    id v13 = &v24;
    id v14 = &v23;
LABEL_8:
    id v15 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v14 count:1];
    id v17 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v15];
LABEL_9:

    if (v17)
    {
      v11[2](v11, v17);
    }
    else
    {
      v18 = +[NSError tsu_fileReadUnknownErrorWithUserInfo:0];
      v11[2](v11, v18);
    }
    goto LABEL_12;
  }
  if (*((unsigned __int16 *)buffer_ptr + 5) == 0xFFFFLL
    || *((_DWORD *)buffer_ptr + 4) == -1
    || *((_DWORD *)buffer_ptr + 3) == -1)
  {
    [(TSUZipArchive *)self readZip64EndOfCentralDirectoryLocatorWithChannel:v10 eocdOffset:a4 completion:v11];
  }
  else
  {
    -[TSUZipArchive readCentralDirectoryWithEntryCount:offset:size:channel:completion:](self, "readCentralDirectoryWithEntryCount:offset:size:channel:completion:");
  }
LABEL_12:
}

- (void)readZip64EndOfCentralDirectoryLocatorWithChannel:(id)a3 eocdOffset:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((unint64_t)a4 > 0x13)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008B86C;
    v12[3] = &unk_1001CCAD0;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    +[TSUIOUtils readAllFromChannel:v13 offset:a4 - 20 length:20 completion:v12];
  }
  else
  {
    CFStringRef v15 = @"TSUZipArchiveErrorDescription";
    CFStringRef v16 = @"File isn't long enough for Zip64 locator";
    id v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    objc_super v11 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v10];
    (*((void (**)(id, void *))v9 + 2))(v9, v11);
  }
}

- (void)readZip64EndOfCentralDirectoryLocatorData:(id)a3 channel:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v10 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x13)
  {
    CFStringRef v22 = @"TSUZipArchiveErrorDescription";
    CFStringRef v23 = @"Wrong data size for TSUZip64EndOfCentralDirectoryLocatorRecord";
    objc_super v11 = &v23;
    dispatch_data_t v12 = &v22;
  }
  else if (*(_DWORD *)buffer_ptr == 117853008)
  {
    if (!*((_DWORD *)buffer_ptr + 1) && *((_DWORD *)buffer_ptr + 4) == 1)
    {
      [(TSUZipArchive *)self readZip64EndOfCentralDirectoryWithChannel:v8 offset:*((void *)buffer_ptr + 1) completion:v9];
      goto LABEL_12;
    }
    CFStringRef v18 = @"TSUZipArchiveErrorDescription";
    CFStringRef v19 = @"Multi-disk is not supported";
    objc_super v11 = &v19;
    dispatch_data_t v12 = &v18;
  }
  else
  {
    CFStringRef v20 = @"TSUZipArchiveErrorDescription";
    CFStringRef v21 = @"Zip64 end of central directory locator record signature not found";
    objc_super v11 = &v21;
    dispatch_data_t v12 = &v20;
  }
  id v13 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v12 count:1];
  id v14 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v13];

  if (v14)
  {
    v9[2](v9, v14);
  }
  else
  {
    CFStringRef v15 = +[NSError tsu_fileReadUnknownErrorWithUserInfo:0];
    v9[2](v9, v15);
  }
LABEL_12:
}

- (void)readZip64EndOfCentralDirectoryWithChannel:(id)a3 offset:(int64_t)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008BB64;
  v9[3] = &unk_1001CCAD0;
  v9[4] = self;
  id v10 = a3;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  +[TSUIOUtils readAllFromChannel:v8 offset:a4 length:56 completion:v9];
}

- (void)readZip64EndOfCentralDirectoryData:(id)a3 channel:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v10 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x37)
  {
    CFStringRef v22 = @"TSUZipArchiveErrorDescription";
    CFStringRef v23 = @"Wrong data size for TSUZip64EndOfCentralDirectoryRecord";
    id v11 = &v23;
    dispatch_data_t v12 = &v22;
  }
  else if (*(_DWORD *)buffer_ptr == 101075792)
  {
    if (!*((_DWORD *)buffer_ptr + 4) && !*((_DWORD *)buffer_ptr + 5))
    {
      [(TSUZipArchive *)self readCentralDirectoryWithEntryCount:*((void *)buffer_ptr + 4) offset:*((void *)buffer_ptr + 6) size:*((void *)buffer_ptr + 5) channel:v8 completion:v9];
      goto LABEL_11;
    }
    CFStringRef v18 = @"TSUZipArchiveErrorDescription";
    CFStringRef v19 = @"Multi-disk is not supported";
    id v11 = &v19;
    dispatch_data_t v12 = &v18;
  }
  else
  {
    CFStringRef v20 = @"TSUZipArchiveErrorDescription";
    CFStringRef v21 = @"Zip64 end of central directory record signature not found";
    id v11 = &v21;
    dispatch_data_t v12 = &v20;
  }
  id v13 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v12 count:1];
  id v14 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v13];

  if (v14)
  {
    v9[2](v9, v14);
  }
  else
  {
    CFStringRef v15 = +[NSError tsu_fileReadUnknownErrorWithUserInfo:0];
    v9[2](v9, v15);
  }
LABEL_11:
}

- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(unint64_t)a5 channel:(id)a6 completion:(id)a7
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008BE50;
  v13[3] = &unk_1001CCAF8;
  id v14 = a7;
  unint64_t v15 = a3;
  v13[4] = self;
  id v12 = v14;
  +[TSUIOUtils readAllFromChannel:a6 offset:a4 length:a5 completion:v13];
}

- (void)readCentralDirectoryData:(id)a3 entryCount:(unint64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, id))a5;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v9 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  id v10 = 0;
  if (!a4) {
    goto LABEL_7;
  }
  unint64_t v11 = 1;
  do
  {
    id v12 = v10;
    id v15 = v10;
    unsigned int v13 = [(TSUZipArchive *)self readCentralFileHeaderWithBuffer:&buffer_ptr dataSize:&size_ptr error:&v15];
    id v10 = v15;

    if (!v13) {
      break;
    }
  }
  while (v11++ < a4);
  if ((v13 & 1) == 0)
  {
    if (!v10)
    {
      id v10 = +[NSError tsu_fileReadUnknownErrorWithUserInfo:0];
    }
    v8[2](v8, v10);
  }
  else
  {
LABEL_7:
    v8[2](v8, 0);
  }
}

- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4 error:(id *)a5
{
  dispatch_data_t v9 = objc_alloc_init(TSUZipEntry);
  id v10 = v9;
  if (*a4 <= 0x2D)
  {
    CFStringRef v40 = @"TSUZipArchiveErrorDescription";
    CFStringRef v41 = @"Central directory too short";
    id v14 = &v41;
    id v15 = &v40;
    goto LABEL_9;
  }
  unint64_t v11 = (unsigned __int16 *)*a3;
  id v12 = (char *)*a3 + 46;
  int v13 = *(_DWORD *)*a3;
  *a4 -= 46;
  *a3 = v12;
  if (v13 != 33639248)
  {
    CFStringRef v38 = @"TSUZipArchiveErrorDescription";
    CFStringRef v39 = @"Central directory file header has bad signature";
    id v14 = &v39;
    id v15 = &v38;
    goto LABEL_9;
  }
  if (v11[4])
  {
    CFStringRef v36 = @"TSUZipArchiveErrorDescription";
    CFStringRef v37 = @"Encrypted files are not supported";
    id v14 = &v37;
    id v15 = &v36;
    goto LABEL_9;
  }
  if (v11[17])
  {
    CFStringRef v34 = @"TSUZipArchiveErrorDescription";
    CFStringRef v35 = @"No multi-disk support";
    id v14 = &v35;
    id v15 = &v34;
LABEL_9:
    CFStringRef v16 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v15 count:1];
    id v17 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v16];

    goto LABEL_10;
  }
  int v20 = v11[5];
  if (v11[5]) {
    BOOL v21 = v20 == (unsigned __int16)TSUZipDeflateCompressionMethod;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21)
  {
    CFStringRef v32 = @"TSUZipArchiveErrorDescription";
    CFStringRef v33 = @"Unsupported compression method";
    id v14 = &v33;
    id v15 = &v32;
    goto LABEL_9;
  }
  [(TSUZipEntry *)v9 setCompressed:v20 == (unsigned __int16)TSUZipDeflateCompressionMethod];
  CFStringRef v22 = objc_msgSend(objc_alloc((Class)NSDate), "tsu_initWithDOSTime:", v11[7] | ((unint64_t)v11[6] << 16));
  [(TSUZipEntry *)v10 setLastModificationDate:v22];

  [(TSUZipEntry *)v10 setCRC:*((unsigned int *)v11 + 4)];
  [(TSUZipEntry *)v10 setCompressedSize:*((unsigned int *)v11 + 5)];
  [(TSUZipEntry *)v10 setSize:*((unsigned int *)v11 + 6)];
  [(TSUZipEntry *)v10 setOffset:*(unsigned int *)(v11 + 21)];
  [(TSUZipEntry *)v10 setNameLength:v11[14]];
  [(TSUZipEntry *)v10 setExtraFieldsLength:v11[15]];
  uint64_t v23 = v11[14];
  id v31 = 0;
  unsigned int v24 = [(TSUZipArchive *)self readFilenameFromBuffer:a3 nameLength:v23 entry:v10 dataSize:a4 error:&v31];
  id v25 = v31;
  id v17 = v25;
  if (v24)
  {
    if (!v11[15]
      || (v30 = v25,
          v26 = -[TSUZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:](self, "readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:", a3), v27 = v30, v17, id v17 = v27, v26))
    {
      if (!v11[16]
        || (v28 = -[TSUZipArchive readFileCommentFromBuffer:fileCommentLength:entry:dataSize:error:](self, "readFileCommentFromBuffer:fileCommentLength:entry:dataSize:error:", a3), v29 = v17, v17, id v17 = v29, v28))
      {
        [(TSUZipArchive *)self addEntry:v10];
        BOOL v18 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_10:
  if (a5)
  {
    id v17 = v17;
    BOOL v18 = 0;
    *a5 = v17;
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_13:

  return v18;
}

- (BOOL)readFilenameFromBuffer:(const void *)a3 nameLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9 = a4;
  id v11 = a5;
  if (*a6 < v9)
  {
    CFStringRef v18 = @"TSUZipArchiveErrorDescription";
    CFStringRef v19 = @"Central directory too short";
    id v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    int v13 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v12];
LABEL_6:
    BOOL v15 = 0;
    goto LABEL_7;
  }
  uint64_t v14 = v9;
  id v12 = [objc_alloc((Class)NSString) initWithBytes:*a3 length:v9 encoding:4];
  [v11 setName:v12];
  *a6 -= v14;
  *a3 = (char *)*a3 + v14;
  BOOL v15 = v12 != 0;
  if (!v12)
  {
    CFStringRef v20 = @"TSUZipArchiveErrorDescription";
    CFStringRef v21 = @"Couldn't read name";
    CFStringRef v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    int v13 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v16];

    goto LABEL_6;
  }
  int v13 = 0;
LABEL_7:

  if (a7 && !v15) {
    *a7 = v13;
  }

  return v15;
}

- (BOOL)readExtraFieldsFromBuffer:(const void *)a3 extraFieldsLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9 = a4;
  id v28 = a5;
  if (*a6 < v9)
  {
    CFStringRef v29 = @"TSUZipArchiveErrorDescription";
    CFStringRef v30 = @"Central directory too short";
    id v12 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    int v13 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v12];

    BOOL v14 = 0;
    if (!a7) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  id v27 = a7;
  int v13 = 0;
  BOOL v15 = (char *)*a3 + v9;
  unsigned __int8 v16 = 1;
  while (1)
  {
    id v17 = (char *)*a3;
    CFStringRef v18 = (char *)*a3 + 4;
    BOOL v14 = v18 > v15;
    if (v18 > v15) {
      break;
    }
    unint64_t v19 = *a6 - 4;
    *a6 = v19;
    *a3 = v18;
    uint64_t v20 = *((unsigned __int16 *)v17 + 1);
    if (&v18[v20] > v15)
    {
      CFStringRef v31 = @"TSUZipArchiveErrorDescription";
      CFStringRef v32 = @"Invalid Zip entry extra field length";
      CFStringRef v22 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      uint64_t v23 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v22];

      int v13 = (void *)v23;
LABEL_12:
      id v17 = (char *)*a3;
      break;
    }
    if (*(unsigned __int16 *)v17 == (unsigned __int16)TSUZip64ExtraFieldSignature)
    {
      unsigned __int8 v16 = -[TSUZipArchive readZip64ExtraFieldFromBuffer:dataLength:entry:error:](self, "readZip64ExtraFieldFromBuffer:dataLength:entry:error:");
      id v21 = v13;

      uint64_t v20 = *((unsigned __int16 *)v17 + 1);
      unint64_t v19 = *a6;
      int v13 = v21;
      CFStringRef v18 = (char *)*a3;
    }
    *a6 = v19 - v20;
    *a3 = &v18[v20];
    if ((v16 & 1) == 0) {
      goto LABEL_12;
    }
  }
  if (v17 != v15)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CCB18);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100165D3C();
    }
    unsigned int v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:]", a7);
    id v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipArchive.m"];
    +[TSUAssertionHandler handleFailureInFunction:v24 file:v25 lineNumber:461 isFatal:0 description:"Unexpected buffer position while reading extra fields."];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  a7 = v27;
  if (v27)
  {
LABEL_20:
    if (!v14) {
      *a7 = v13;
    }
  }
LABEL_22:

  return v14;
}

- (BOOL)readZip64ExtraFieldFromBuffer:(const void *)a3 dataLength:(unsigned __int16)a4 entry:(id)a5 error:(id *)a6
{
  unsigned int v7 = a4;
  id v9 = a5;
  if ([v9 size] == (id)0xFFFFFFFFLL)
  {
    BOOL v10 = v7 >= 8;
    LOWORD(v7) = v7 - 8;
    if (!v10)
    {
      CFStringRef v23 = @"TSUZipArchiveErrorDescription";
      CFStringRef v24 = @"Not enough room for Zip64 uncompressed size";
      BOOL v15 = &v24;
      unsigned __int8 v16 = &v23;
      goto LABEL_14;
    }
    uint64_t v11 = *(void *)a3;
    a3 = (char *)a3 + 8;
    [v9 setSize:v11];
  }
  if ([v9 compressedSize] == (id)0xFFFFFFFFLL)
  {
    if ((unsigned __int16)v7 < 8u)
    {
      CFStringRef v21 = @"TSUZipArchiveErrorDescription";
      CFStringRef v22 = @"Not enough room for Zip64 compressed size";
      BOOL v15 = &v22;
      unsigned __int8 v16 = &v21;
      goto LABEL_14;
    }
    uint64_t v12 = *(void *)a3;
    a3 = (char *)a3 + 8;
    [v9 setCompressedSize:v12];
    LOWORD(v7) = v7 - 8;
  }
  if ([v9 offset] != (id)0xFFFFFFFFLL)
  {
LABEL_11:
    id v13 = 0;
    BOOL v14 = 1;
    goto LABEL_17;
  }
  if ((unsigned __int16)v7 >= 8u)
  {
    [v9 setOffset:*(void *)a3];
    goto LABEL_11;
  }
  CFStringRef v19 = @"TSUZipArchiveErrorDescription";
  CFStringRef v20 = @"Not enough room for Zip64 offset";
  BOOL v15 = &v20;
  unsigned __int8 v16 = &v19;
LABEL_14:
  id v17 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:1];
  id v13 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v17];

  if (a6)
  {
    id v13 = v13;
    BOOL v14 = 0;
    *a6 = v13;
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_17:

  return v14;
}

- (BOOL)readFileCommentFromBuffer:(const void *)a3 fileCommentLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7
{
  unsigned int v9 = a4;
  id v11 = a5;
  unint64_t v12 = *a6;
  unint64_t v13 = v9;
  if (*a6 < v9)
  {
    CFStringRef v17 = @"TSUZipArchiveErrorDescription";
    CFStringRef v18 = @"Central directory too short";
    BOOL v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v14 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v15];

    if (a7)
    {
      id v14 = v14;
      *a7 = v14;
    }
  }
  else
  {
    id v14 = 0;
    *a6 = v12 - v13;
    *a3 = (char *)*a3 + v13;
  }

  return v12 >= v13;
}

- (void)readLocalFileHeaderEntriesFromChannel:(id)a3 offset:(int64_t)a4 previousEntry:(id)a5 seekAttempts:(unsigned int)a6 seekForward:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10008CC30;
  v19[3] = &unk_1001CCBC8;
  id v22 = a8;
  int64_t v23 = a4;
  v19[4] = self;
  id v20 = v14;
  BOOL v25 = a7;
  unsigned int v24 = a6;
  id v21 = v15;
  id v16 = v22;
  id v17 = v15;
  id v18 = v14;
  +[TSUIOUtils readAllFromChannel:v18 offset:a4 length:30 completion:v19];
}

- (void)readLocalFileHeaderData:(id)a3 atOffset:(int64_t)a4 channel:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v12 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  if (size_ptr <= 0x1D)
  {
    CFStringRef v41 = @"TSUZipArchiveErrorDescription";
    CFStringRef v42 = @"Wrong data size for TSUZipLocalFileHeaderRecord";
    BOOL v21 = 1;
    id v22 = &v42;
    int64_t v23 = &v41;
    goto LABEL_13;
  }
  unint64_t v13 = (unsigned __int16 *)buffer_ptr;
  if (*(_DWORD *)buffer_ptr != 67324752)
  {
    BOOL v21 = *(_DWORD *)buffer_ptr == 33639248;
    CFStringRef v39 = @"TSUZipArchiveErrorDescription";
    CFStringRef v40 = @"Local file header has bad signature";
    id v22 = &v40;
    int64_t v23 = &v39;
LABEL_13:
    unsigned int v24 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:1];
    id v20 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v24];

    if ([(NSMutableOrderedSet *)self->_entries count])
    {
      (*((void (**)(id, void, void, BOOL))v11 + 2))(v11, 0, 0, v21);
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  __int16 v14 = *((_WORD *)buffer_ptr + 3);
  if (v14)
  {
    CFStringRef v37 = @"TSUZipArchiveErrorDescription";
    CFStringRef v38 = @"Encrypted files are not supported";
    BOOL v25 = &v38;
    unsigned int v26 = &v37;
  }
  else if ((v14 & 8) != 0)
  {
    CFStringRef v35 = @"TSUZipArchiveErrorDescription";
    CFStringRef v36 = @"Local file header does not have the entry CRC and size";
    BOOL v25 = &v36;
    unsigned int v26 = &v35;
  }
  else
  {
    if (*((_WORD *)buffer_ptr + 4)) {
      BOOL v15 = *((unsigned __int16 *)buffer_ptr + 4) == (unsigned __int16)TSUZipDeflateCompressionMethod;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      id v16 = objc_alloc_init(TSUZipEntry);
      [(TSUZipEntry *)v16 setCompressed:v13[4] == (unsigned __int16)TSUZipDeflateCompressionMethod];
      id v17 = objc_msgSend(objc_alloc((Class)NSDate), "tsu_initWithDOSTime:", v13[6] | ((unint64_t)v13[5] << 16));
      [(TSUZipEntry *)v16 setLastModificationDate:v17];

      [(TSUZipEntry *)v16 setCRC:*(unsigned int *)(v13 + 7)];
      [(TSUZipEntry *)v16 setCompressedSize:*(unsigned int *)(v13 + 9)];
      [(TSUZipEntry *)v16 setSize:*(unsigned int *)(v13 + 11)];
      [(TSUZipEntry *)v16 setOffset:a4];
      [(TSUZipEntry *)v16 setNameLength:v13[13]];
      [(TSUZipEntry *)v16 setExtraFieldsLength:v13[14]];
      unint64_t v18 = v13[14] + (unint64_t)v13[13];
      [(TSUZipEntry *)v16 setFileHeaderLength:v18 + 30];
      int64_t v19 = a4 + 30;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10008D508;
      v28[3] = &unk_1001CCAD0;
      v28[4] = self;
      CFStringRef v29 = v16;
      id v30 = v11;
      id v20 = v16;
      +[TSUIOUtils readAllFromChannel:v10 offset:v19 length:v18 completion:v28];

      goto LABEL_21;
    }
    CFStringRef v33 = @"TSUZipArchiveErrorDescription";
    CFStringRef v34 = @"Unsupported compression method";
    BOOL v25 = &v34;
    unsigned int v26 = &v33;
  }
  id v27 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v26 count:1];
  id v20 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v27];

LABEL_18:
  if (!v20)
  {
    id v20 = +[NSError tsu_fileReadUnknownErrorWithUserInfo:0];
  }
  (*((void (**)(id, void, TSUZipEntry *, void))v11 + 2))(v11, 0, v20, 0);
LABEL_21:
}

- (BOOL)readLocalFileHeaderFilenameAndExtraFieldsData:(id)a3 forEntry:(id)a4 error:(id *)a5
{
  id v8 = a4;
  size_t size_ptr = 0;
  buffer_ptr = 0;
  dispatch_data_t v9 = dispatch_data_create_map((dispatch_data_t)a3, (const void **)&buffer_ptr, &size_ptr);
  size_t v10 = size_ptr;
  unsigned int v11 = [v8 nameLength];
  if (v10 >= [v8 extraFieldsLength] + (unint64_t)v11)
  {
    id v18 = 0;
    unsigned int v15 = -[TSUZipArchive readFilenameFromBuffer:nameLength:entry:dataSize:error:](self, "readFilenameFromBuffer:nameLength:entry:dataSize:error:", &buffer_ptr, [v8 nameLength], v8, &size_ptr, &v18);
    id v12 = v18;
    if (!v15)
    {
      BOOL v14 = 0;
      if (!a5) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
    if (![v8 extraFieldsLength])
    {
      BOOL v14 = 1;
      goto LABEL_11;
    }
    id v17 = v12;
    BOOL v14 = -[TSUZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:](self, "readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:", &buffer_ptr, [v8 extraFieldsLength], v8, &size_ptr, &v17);
    id v13 = v17;
  }
  else
  {
    CFStringRef v21 = @"TSUZipArchiveErrorDescription";
    CFStringRef v22 = @"Wrong data size for TSUZipLocalFileHeaderRecord filename and extra fields";
    id v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v13 = +[NSError tsu_fileReadCorruptedFileErrorWithUserInfo:v12];
    BOOL v14 = 0;
  }

  id v12 = v13;
  if (!a5) {
    goto LABEL_11;
  }
LABEL_9:
  if (!v14)
  {
    id v12 = v12;
    BOOL v14 = 0;
    *a5 = v12;
  }
LABEL_11:

  return v14;
}

- (void)addEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = [v4 name];
    unsigned int v7 = [(TSUZipArchive *)self normalizeEntryName:v6];

    id v8 = [(NSMutableDictionary *)self->_entriesMap objectForKeyedSubscript:v7];

    if (v8)
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001CCBE8);
      }
      dispatch_data_t v9 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100165F58((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_entriesMap setObject:v5 forKeyedSubscript:v7];
      [(NSMutableOrderedSet *)self->_entries addObject:v5];
    }
  }
}

- (id)readChannelForEntry:(id)a3
{
  return [(TSUZipArchive *)self readChannelForEntry:a3 validateCRC:1];
}

- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(NSMutableOrderedSet *)self->_entries containsObject:v6])
  {
    unsigned int v7 = [v6 isCompressed] ^ 1;
    id v8 = [[TSUZipReadChannel alloc] initWithEntry:v6 archive:self validateCRC:v4 & v7];
    if ((v7 & 1) == 0)
    {
      dispatch_data_t v9 = [TSUBufferedReadChannel alloc];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10008DAFC;
      v14[3] = &unk_1001CCC10;
      id v15 = v6;
      BOOL v16 = v4;
      uint64_t v10 = [(TSUBufferedReadChannel *)v9 initWithReadChannel:v8 blockInfos:0 streamReadChannelBlock:v14];

      id v8 = (TSUZipReadChannel *)v10;
    }
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CCC30);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100165FC4();
    }
    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipArchive readChannelForEntry:validateCRC:]");
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipArchive.m"];
    +[TSUAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:779 isFatal:0 description:"Entry isn't part of this archive"];

    +[TSUAssertionHandler logBacktraceThrottled];
    id v8 = 0;
  }

  return v8;
}

- (id)streamReadChannelForEntry:(id)a3
{
  return [(TSUZipArchive *)self streamReadChannelForEntry:a3 validateCRC:1];
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(NSMutableOrderedSet *)self->_entries containsObject:v6])
  {
    unsigned int v7 = [v6 isCompressed] ^ 1;
    id v8 = [[TSUZipReadChannel alloc] initWithEntry:v6 archive:self validateCRC:v4 & v7];
    if ((v7 & 1) == 0)
    {
      dispatch_data_t v9 = [TSUZipInflateReadChannel alloc];
      [v6 size];
      uint64_t v10 = -[TSUZipInflateReadChannel initWithReadChannel:uncompressedSize:CRC:validateCRC:](v9, "initWithReadChannel:uncompressedSize:CRC:validateCRC:", v8, [v6 size], objc_msgSend(v6, "CRC"), v4);

      id v8 = (TSUZipReadChannel *)v10;
    }
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CCC50);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016604C();
    }
    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipArchive streamReadChannelForEntry:validateCRC:]");
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipArchive.m"];
    +[TSUAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:802 isFatal:0 description:"Entry isn't part of this archive"];

    +[TSUAssertionHandler logBacktraceThrottled];
    id v8 = 0;
  }

  return v8;
}

- (id)containedZipArchiveForEntry:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return +[TSUContainedZipArchive zipArchiveFromEntry:a3 zipArchive:self options:a4 error:a5];
}

- (id)normalizeEntryName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if ((self->_options & 2) != 0)
  {
    uint64_t v6 = [v4 lowercaseString];

    uint64_t v5 = (void *)v6;
  }
  unsigned int v7 = [v5 precomposedStringWithCanonicalMapping];

  return v7;
}

- (id)entryForName:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = [(TSUZipArchive *)self normalizeEntryName:v4];

    unsigned int v7 = [(NSMutableDictionary *)self->_entriesMap objectForKeyedSubscript:v6];
  }
  else
  {
    unsigned int v7 = 0;
  }
  return v7;
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_entries;
  id v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend(v10, "collapsedName", (void)v13);
      if (v11)
      {
        v4[2](v4, v11, v10, &v17);
      }
      else
      {
        uint64_t v12 = [v10 name];
        v4[2](v4, v12, v10, &v17);
      }
      if (v17) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)sortedEntriesUsingComparator:(id)a3
{
  return [(NSMutableOrderedSet *)self->_entries sortedArrayUsingComparator:a3];
}

- (void)collapseCommonRootDirectory
{
  uint64_t v18 = 0;
  int64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  CFStringRef v21 = sub_10008E280;
  CFStringRef v22 = sub_10008E290;
  id v23 = 0;
  unint64_t v4 = (self->_options >> 1) & 1 | 2;
  entriesMap = self->_entriesMap;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008E298;
  v17[3] = &unk_1001CCC78;
  v17[4] = &v18;
  v17[5] = v4;
  [(NSMutableDictionary *)entriesMap enumerateKeysAndObjectsUsingBlock:v17];
  if ([(id)v19[5] count])
  {
    id v6 = +[NSString pathWithComponents:v19[5]];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [v6 length];
  if (v7)
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](self->_entriesMap, "count"));
    uint64_t v10 = self->_entriesMap;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008E474;
    v13[3] = &unk_1001CCCA0;
    id v16 = v7;
    uint64_t v11 = (NSMutableDictionary *)v8;
    long long v14 = v11;
    long long v15 = self;
    [(NSMutableDictionary *)v10 enumerateKeysAndObjectsUsingBlock:v13];

    uint64_t v12 = self->_entriesMap;
    self->_entriesMap = v11;
  }
  _Block_object_dispose(&v18, 8);
}

- (unint64_t)archiveLength
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CCCC0);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    unint64_t v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v16 = v2;
    __int16 v17 = 2082;
    uint64_t v18 = "-[TSUZipArchive archiveLength]";
    __int16 v19 = 2082;
    uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipArchive.m";
    __int16 v21 = 1024;
    int v22 = 919;
    __int16 v23 = 2114;
    unsigned int v24 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipArchive archiveLength]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipArchive.m"];
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 919, 0, "Abstract method not overridden by %{public}@", v10);

  +[TSUAssertionHandler logBacktraceThrottled];
  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  long long v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v12, "-[TSUZipArchive archiveLength]");
  id v14 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (id)newArchiveReadChannel
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CCCE0);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    unint64_t v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v16 = v2;
    __int16 v17 = 2082;
    uint64_t v18 = "-[TSUZipArchive newArchiveReadChannel]";
    __int16 v19 = 2082;
    uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipArchive.m";
    __int16 v21 = 1024;
    int v22 = 923;
    __int16 v23 = 2114;
    unsigned int v24 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipArchive newArchiveReadChannel]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipArchive.m"];
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 923, 0, "Abstract method not overridden by %{public}@", v10);

  +[TSUAssertionHandler logBacktraceThrottled];
  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  long long v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v12, "-[TSUZipArchive newArchiveReadChannel]");
  id v14 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (BOOL)isValid
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CCD00);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    unint64_t v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v16 = v2;
    __int16 v17 = 2082;
    uint64_t v18 = "-[TSUZipArchive isValid]";
    __int16 v19 = 2082;
    uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipArchive.m";
    __int16 v21 = 1024;
    int v22 = 927;
    __int16 v23 = 2114;
    unsigned int v24 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipArchive isValid]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipArchive.m"];
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 927, 0, "Abstract method not overridden by %{public}@", v10);

  +[TSUAssertionHandler logBacktraceThrottled];
  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  long long v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v12, "-[TSUZipArchive isValid]");
  id v14 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (void)validateCRCWithQueue:(id)a3 completion:(id)a4
{
  id v16 = a3;
  id v15 = a4;
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("TSUZipArchive.Validation", v6);

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_10008E280;
  v28[4] = sub_10008E290;
  id v29 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = self->_entries;
  id v9 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v11);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10008EF24;
        block[3] = &unk_1001CCD48;
        void block[4] = self;
        block[5] = v12;
        __int16 v23 = v28;
        int v22 = v7;
        dispatch_async(v22, block);

        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v9);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008F150;
  v17[3] = &unk_1001CCD98;
  id v18 = v16;
  id v19 = v15;
  uint64_t v20 = v28;
  id v13 = v16;
  id v14 = v15;
  dispatch_async(v7, v17);

  _Block_object_dispose(v28, 8);
}

- (BOOL)validateCRCAndReturnError:(id *)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10008E280;
  id v14 = sub_10008E290;
  id v15 = 0;
  uint64_t v5 = dispatch_semaphore_create(0);
  id v6 = dispatch_get_global_queue(0, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008F394;
  v9[3] = &unk_1001CC6E0;
  v9[4] = v5;
  void v9[5] = &v10;
  [(TSUZipArchive *)self validateCRCWithQueue:v6 completion:v9];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_queue_t v7 = (void *)v11[5];
  if (a3 && v7) {
    *a3 = v7;
  }

  _Block_object_dispose(&v10, 8);
  return v7 == 0;
}

- (id)debugDescription
{
  v3 = +[TSUDescription descriptionWithObject:self class:objc_opt_class()];
  unint64_t v4 = [(NSMutableOrderedSet *)self->_entries array];
  uint64_t v5 = TSUArrayDescription(v4);
  [v3 addField:@"entries" value:v5];

  id v6 = [v3 descriptionString];

  return v6;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)endOfLastEntry
{
  return self->_endOfLastEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_entriesMap, 0);
}

@end