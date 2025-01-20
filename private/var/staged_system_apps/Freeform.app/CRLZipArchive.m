@interface CRLZipArchive
- (BOOL)hasNonEmptyEntries;
- (BOOL)isValid;
- (BOOL)readCentralFileHeaderWithBuffer:(const void *)a3 dataSize:(unint64_t *)a4 error:(id *)a5;
- (BOOL)readExtraFieldsFromBuffer:(const void *)a3 extraFieldsLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)readFileCommentFromBuffer:(const void *)a3 fileCommentLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)readFilenameFromBuffer:(const void *)a3 nameLength:(unsigned __int16)a4 entry:(id)a5 dataSize:(unint64_t *)a6 error:(id *)a7;
- (BOOL)readLocalFileHeaderFilenameAndExtraFieldsData:(id)a3 forEntry:(id)a4 error:(id *)a5;
- (BOOL)readZip64ExtraFieldFromBuffer:(const void *)a3 dataLength:(unsigned __int16)a4 entry:(id)a5 error:(id *)a6;
- (BOOL)validateCRCAndReturnError:(id *)a3;
- (CRLZipArchive)init;
- (CRLZipArchive)initWithOptions:(unint64_t)a3;
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

@implementation CRLZipArchive

- (CRLZipArchive)init
{
  return [(CRLZipArchive *)self initWithOptions:0];
}

- (CRLZipArchive)initWithOptions:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CRLZipArchive;
  v4 = [(CRLZipArchive *)&v11 init];
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
  v4[2] = sub_10012609C;
  v4[3] = &unk_1014D7D00;
  v4[4] = &v5;
  [(CRLZipArchive *)self enumerateEntriesUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)readArchiveWithQueue:(id)a3 completion:(id)a4
{
  v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(CRLZipArchive *)self archiveLength];
  id v9 = [(CRLZipArchive *)self newArchiveReadChannel];
  v10 = v9;
  if (v9)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100126310;
    v20[3] = &unk_1014D7D50;
    objc_super v11 = (id *)v21;
    id v12 = v9;
    v21[0] = v12;
    v21[1] = self;
    v22 = v6;
    id v23 = v7;
    v13 = objc_retainBlock(v20);
    if ((self->_options & 8) != 0)
    {
      [(CRLZipArchive *)self readLocalFileHeaderEntriesFromChannel:v12 offset:0 previousEntry:0 seekAttempts:0 seekForward:0 completion:v13];
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100126420;
      v16[3] = &unk_1014D7DC0;
      v16[4] = self;
      unint64_t v19 = v8 - 22;
      id v17 = v12;
      v18 = v13;
      +[CRLIOUtils readAllFromChannel:v17 offset:v8 - 22 length:22 completion:v16];
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001266D0;
    block[3] = &unk_1014CC280;
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
    CFStringRef v26 = @"CRLZipArchiveErrorDescription";
    CFStringRef v27 = @"Wrong data size for CRLZipEndOfCentralDirectoryRecord";
    v13 = &v27;
    v14 = &v26;
    goto LABEL_8;
  }
  if (*(_DWORD *)buffer_ptr != 101010256)
  {
    CFStringRef v24 = @"CRLZipArchiveErrorDescription";
    CFStringRef v25 = @"Don't support end of central directory comments";
    v13 = &v25;
    v14 = &v24;
LABEL_8:
    id v15 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v14 count:1];
    v16 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v15];

    if (v16)
    {
      v11[2](v11, v16);
    }
    else
    {
      id v17 = +[NSError crl_fileReadUnknownErrorWithUserInfo:0];
      v11[2](v11, v17);
    }
    goto LABEL_11;
  }
  if (*((_WORD *)buffer_ptr + 2) || *((_WORD *)buffer_ptr + 3))
  {
    CFStringRef v22 = @"CRLZipArchiveErrorDescription";
    CFStringRef v23 = @"Don't support multi-disk";
    v13 = &v23;
    v14 = &v22;
    goto LABEL_8;
  }
  if (*((unsigned __int16 *)buffer_ptr + 5) == 0xFFFFLL
    || *((_DWORD *)buffer_ptr + 4) == -1
    || *((_DWORD *)buffer_ptr + 3) == -1)
  {
    [(CRLZipArchive *)self readZip64EndOfCentralDirectoryLocatorWithChannel:v10 eocdOffset:a4 completion:v11];
  }
  else
  {
    -[CRLZipArchive readCentralDirectoryWithEntryCount:offset:size:channel:completion:](self, "readCentralDirectoryWithEntryCount:offset:size:channel:completion:");
  }
LABEL_11:
}

- (void)readZip64EndOfCentralDirectoryLocatorWithChannel:(id)a3 eocdOffset:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((unint64_t)a4 > 0x13)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100126AE8;
    v12[3] = &unk_1014D7DE8;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    +[CRLIOUtils readAllFromChannel:v13 offset:a4 - 20 length:20 completion:v12];
  }
  else
  {
    CFStringRef v15 = @"CRLZipArchiveErrorDescription";
    CFStringRef v16 = @"File isn't long enough for Zip64 locator";
    id v10 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    objc_super v11 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v10];
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
    CFStringRef v22 = @"CRLZipArchiveErrorDescription";
    CFStringRef v23 = @"Wrong data size for CRLZip64EndOfCentralDirectoryLocatorRecord";
    objc_super v11 = &v23;
    dispatch_data_t v12 = &v22;
  }
  else if (*(_DWORD *)buffer_ptr == 117853008)
  {
    if (!*((_DWORD *)buffer_ptr + 1) && *((_DWORD *)buffer_ptr + 4) == 1)
    {
      [(CRLZipArchive *)self readZip64EndOfCentralDirectoryWithChannel:v8 offset:*((void *)buffer_ptr + 1) completion:v9];
      goto LABEL_12;
    }
    CFStringRef v18 = @"CRLZipArchiveErrorDescription";
    CFStringRef v19 = @"Multi-disk is not supported";
    objc_super v11 = &v19;
    dispatch_data_t v12 = &v18;
  }
  else
  {
    CFStringRef v20 = @"CRLZipArchiveErrorDescription";
    CFStringRef v21 = @"Zip64 end of central directory locator record signature not found";
    objc_super v11 = &v21;
    dispatch_data_t v12 = &v20;
  }
  id v13 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v12 count:1];
  id v14 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v13];

  if (v14)
  {
    v9[2](v9, v14);
  }
  else
  {
    CFStringRef v15 = +[NSError crl_fileReadUnknownErrorWithUserInfo:0];
    v9[2](v9, v15);
  }
LABEL_12:
}

- (void)readZip64EndOfCentralDirectoryWithChannel:(id)a3 offset:(int64_t)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100126DE0;
  v9[3] = &unk_1014D7DE8;
  v9[4] = self;
  id v10 = a3;
  id v11 = a5;
  id v7 = v11;
  id v8 = v10;
  +[CRLIOUtils readAllFromChannel:v8 offset:a4 length:56 completion:v9];
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
    CFStringRef v22 = @"CRLZipArchiveErrorDescription";
    CFStringRef v23 = @"Wrong data size for CRLZip64EndOfCentralDirectoryRecord";
    id v11 = &v23;
    dispatch_data_t v12 = &v22;
  }
  else if (*(_DWORD *)buffer_ptr == 101075792)
  {
    if (!*((_DWORD *)buffer_ptr + 4) && !*((_DWORD *)buffer_ptr + 5))
    {
      [(CRLZipArchive *)self readCentralDirectoryWithEntryCount:*((void *)buffer_ptr + 4) offset:*((void *)buffer_ptr + 6) size:*((void *)buffer_ptr + 5) channel:v8 completion:v9];
      goto LABEL_11;
    }
    CFStringRef v18 = @"CRLZipArchiveErrorDescription";
    CFStringRef v19 = @"Multi-disk is not supported";
    id v11 = &v19;
    dispatch_data_t v12 = &v18;
  }
  else
  {
    CFStringRef v20 = @"CRLZipArchiveErrorDescription";
    CFStringRef v21 = @"Zip64 end of central directory record signature not found";
    id v11 = &v21;
    dispatch_data_t v12 = &v20;
  }
  id v13 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v12 count:1];
  id v14 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v13];

  if (v14)
  {
    v9[2](v9, v14);
  }
  else
  {
    CFStringRef v15 = +[NSError crl_fileReadUnknownErrorWithUserInfo:0];
    v9[2](v9, v15);
  }
LABEL_11:
}

- (void)readCentralDirectoryWithEntryCount:(unint64_t)a3 offset:(int64_t)a4 size:(unint64_t)a5 channel:(id)a6 completion:(id)a7
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001270CC;
  v13[3] = &unk_1014D7E10;
  id v14 = a7;
  unint64_t v15 = a3;
  v13[4] = self;
  id v12 = v14;
  +[CRLIOUtils readAllFromChannel:a6 offset:a4 length:a5 completion:v13];
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
    unsigned int v13 = [(CRLZipArchive *)self readCentralFileHeaderWithBuffer:&buffer_ptr dataSize:&size_ptr error:&v15];
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
      id v10 = +[NSError crl_fileReadUnknownErrorWithUserInfo:0];
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
  dispatch_data_t v9 = objc_alloc_init(CRLZipEntry);
  id v10 = v9;
  if (*a4 <= 0x2D)
  {
    CFStringRef v40 = @"CRLZipArchiveErrorDescription";
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
    CFStringRef v38 = @"CRLZipArchiveErrorDescription";
    CFStringRef v39 = @"Central directory file header has bad signature";
    id v14 = &v39;
    id v15 = &v38;
    goto LABEL_9;
  }
  if (v11[4])
  {
    CFStringRef v36 = @"CRLZipArchiveErrorDescription";
    CFStringRef v37 = @"Encrypted files are not supported";
    id v14 = &v37;
    id v15 = &v36;
    goto LABEL_9;
  }
  if (v11[17])
  {
    CFStringRef v34 = @"CRLZipArchiveErrorDescription";
    CFStringRef v35 = @"No multi-disk support";
    id v14 = &v35;
    id v15 = &v34;
LABEL_9:
    CFStringRef v16 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v15 count:1];
    id v17 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v16];

    goto LABEL_10;
  }
  int v20 = v11[5];
  if (v11[5]) {
    BOOL v21 = v20 == 8;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21)
  {
    CFStringRef v32 = @"CRLZipArchiveErrorDescription";
    CFStringRef v33 = @"Unsupported compression method";
    id v14 = &v33;
    id v15 = &v32;
    goto LABEL_9;
  }
  [(CRLZipEntry *)v9 setCompressed:v20 == 8];
  CFStringRef v22 = [objc_alloc((Class)NSDate) crl_initWithDOSTime:v11[7] | ((unint64_t)v11[6] << 16)];
  [(CRLZipEntry *)v10 setLastModificationDate:v22];

  [(CRLZipEntry *)v10 setCRC:*((unsigned int *)v11 + 4)];
  [(CRLZipEntry *)v10 setCompressedSize:*((unsigned int *)v11 + 5)];
  [(CRLZipEntry *)v10 setSize:*((unsigned int *)v11 + 6)];
  [(CRLZipEntry *)v10 setOffset:*(unsigned int *)(v11 + 21)];
  [(CRLZipEntry *)v10 setNameLength:v11[14]];
  [(CRLZipEntry *)v10 setExtraFieldsLength:v11[15]];
  uint64_t v23 = v11[14];
  id v31 = 0;
  unsigned int v24 = [(CRLZipArchive *)self readFilenameFromBuffer:a3 nameLength:v23 entry:v10 dataSize:a4 error:&v31];
  id v25 = v31;
  id v17 = v25;
  if (v24)
  {
    if (!v11[15]
      || (v30 = v25,
          v26 = -[CRLZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:](self, "readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:", a3), v27 = v30, v17, id v17 = v27, v26))
    {
      if (!v11[16]
        || (v28 = -[CRLZipArchive readFileCommentFromBuffer:fileCommentLength:entry:dataSize:error:](self, "readFileCommentFromBuffer:fileCommentLength:entry:dataSize:error:", a3), v29 = v17, v17, id v17 = v29, v28))
      {
        [(CRLZipArchive *)self addEntry:v10];
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
    CFStringRef v18 = @"CRLZipArchiveErrorDescription";
    CFStringRef v19 = @"Central directory too short";
    id v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    int v13 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v12];
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
    CFStringRef v20 = @"CRLZipArchiveErrorDescription";
    CFStringRef v21 = @"Couldn't read name";
    CFStringRef v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    int v13 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v16];

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
    CFStringRef v29 = @"CRLZipArchiveErrorDescription";
    CFStringRef v30 = @"Central directory too short";
    id v12 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    int v13 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v12];
    BOOL v14 = 0;
    goto LABEL_22;
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
      CFStringRef v31 = @"CRLZipArchiveErrorDescription";
      CFStringRef v32 = @"Invalid Zip entry extra field length";
      CFStringRef v22 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      uint64_t v23 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v22];

      int v13 = (void *)v23;
LABEL_11:
      id v17 = (char *)*a3;
      break;
    }
    if (*(_WORD *)v17 == 1)
    {
      unsigned __int8 v16 = -[CRLZipArchive readZip64ExtraFieldFromBuffer:dataLength:entry:error:](self, "readZip64ExtraFieldFromBuffer:dataLength:entry:error:");
      id v21 = v13;

      uint64_t v20 = *((unsigned __int16 *)v17 + 1);
      unint64_t v19 = *a6;
      int v13 = v21;
      CFStringRef v18 = (char *)*a3;
    }
    *a6 = v19 - v20;
    *a3 = &v18[v20];
    if ((v16 & 1) == 0) {
      goto LABEL_11;
    }
  }
  if (v17 != v15)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7E30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107BC44();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7E50);
    }
    a7 = v27;
    unsigned int v24 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v24);
    }
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:]", v27);
    id v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v25 lineNumber:458 isFatal:0 description:"Unexpected buffer position while reading extra fields."];

LABEL_22:
    if (!a7) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  a7 = v27;
  if (!v27) {
    goto LABEL_25;
  }
LABEL_23:
  if (!v14) {
    *a7 = v13;
  }
LABEL_25:

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
      CFStringRef v23 = @"CRLZipArchiveErrorDescription";
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
      CFStringRef v21 = @"CRLZipArchiveErrorDescription";
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
  CFStringRef v19 = @"CRLZipArchiveErrorDescription";
  CFStringRef v20 = @"Not enough room for Zip64 offset";
  BOOL v15 = &v20;
  unsigned __int8 v16 = &v19;
LABEL_14:
  id v17 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:1];
  id v13 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v17];

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
    CFStringRef v17 = @"CRLZipArchiveErrorDescription";
    CFStringRef v18 = @"Central directory too short";
    BOOL v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v14 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v15];

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
  v19[2] = sub_100127F34;
  v19[3] = &unk_1014D7F00;
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
  +[CRLIOUtils readAllFromChannel:v18 offset:a4 length:30 completion:v19];
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
    CFStringRef v41 = @"CRLZipArchiveErrorDescription";
    CFStringRef v42 = @"Wrong data size for CRLZipLocalFileHeaderRecord";
    BOOL v21 = 1;
    id v22 = &v42;
    int64_t v23 = &v41;
    goto LABEL_13;
  }
  unint64_t v13 = (unsigned __int16 *)buffer_ptr;
  if (*(_DWORD *)buffer_ptr != 67324752)
  {
    BOOL v21 = *(_DWORD *)buffer_ptr == 33639248;
    CFStringRef v39 = @"CRLZipArchiveErrorDescription";
    CFStringRef v40 = @"Local file header has bad signature";
    id v22 = &v40;
    int64_t v23 = &v39;
LABEL_13:
    unsigned int v24 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:1];
    id v20 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v24];

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
    CFStringRef v37 = @"CRLZipArchiveErrorDescription";
    CFStringRef v38 = @"Encrypted files are not supported";
    BOOL v25 = &v38;
    unsigned int v26 = &v37;
  }
  else if ((v14 & 8) != 0)
  {
    CFStringRef v35 = @"CRLZipArchiveErrorDescription";
    CFStringRef v36 = @"Local file header does not have the entry CRC and size";
    BOOL v25 = &v36;
    unsigned int v26 = &v35;
  }
  else
  {
    if (*((_WORD *)buffer_ptr + 4)) {
      BOOL v15 = *((unsigned __int16 *)buffer_ptr + 4) == 8;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15)
    {
      id v16 = objc_alloc_init(CRLZipEntry);
      [(CRLZipEntry *)v16 setCompressed:v13[4] == 8];
      id v17 = [objc_alloc((Class)NSDate) crl_initWithDOSTime:v13[6] | ((unint64_t)v13[5] << 16)];
      [(CRLZipEntry *)v16 setLastModificationDate:v17];

      [(CRLZipEntry *)v16 setCRC:*(unsigned int *)(v13 + 7)];
      [(CRLZipEntry *)v16 setCompressedSize:*(unsigned int *)(v13 + 9)];
      [(CRLZipEntry *)v16 setSize:*(unsigned int *)(v13 + 11)];
      [(CRLZipEntry *)v16 setOffset:a4];
      [(CRLZipEntry *)v16 setNameLength:v13[13]];
      [(CRLZipEntry *)v16 setExtraFieldsLength:v13[14]];
      unint64_t v18 = v13[14] + (unint64_t)v13[13];
      [(CRLZipEntry *)v16 setFileHeaderLength:v18 + 30];
      int64_t v19 = a4 + 30;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10012880C;
      v28[3] = &unk_1014D7DE8;
      v28[4] = self;
      CFStringRef v29 = v16;
      id v30 = v11;
      id v20 = v16;
      +[CRLIOUtils readAllFromChannel:v10 offset:v19 length:v18 completion:v28];

      goto LABEL_21;
    }
    CFStringRef v33 = @"CRLZipArchiveErrorDescription";
    CFStringRef v34 = @"Unsupported compression method";
    BOOL v25 = &v34;
    unsigned int v26 = &v33;
  }
  id v27 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v26 count:1];
  id v20 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v27];

LABEL_18:
  if (!v20)
  {
    id v20 = +[NSError crl_fileReadUnknownErrorWithUserInfo:0];
  }
  (*((void (**)(id, void, CRLZipEntry *, void))v11 + 2))(v11, 0, v20, 0);
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
    unsigned int v15 = -[CRLZipArchive readFilenameFromBuffer:nameLength:entry:dataSize:error:](self, "readFilenameFromBuffer:nameLength:entry:dataSize:error:", &buffer_ptr, [v8 nameLength], v8, &size_ptr, &v18);
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
    BOOL v14 = -[CRLZipArchive readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:](self, "readExtraFieldsFromBuffer:extraFieldsLength:entry:dataSize:error:", &buffer_ptr, [v8 extraFieldsLength], v8, &size_ptr, &v17);
    id v13 = v17;
  }
  else
  {
    CFStringRef v21 = @"CRLZipArchiveErrorDescription";
    CFStringRef v22 = @"Wrong data size for CRLZipLocalFileHeaderRecord filename and extra fields";
    id v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v13 = +[NSError crl_fileReadCorruptedFileErrorWithUserInfo:v12];
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
    unsigned int v7 = [(CRLZipArchive *)self normalizeEntryName:v6];

    id v8 = [(NSMutableDictionary *)self->_entriesMap objectForKeyedSubscript:v7];

    if (v8)
    {
      if (qword_101719A68 != -1) {
        dispatch_once(&qword_101719A68, &stru_1014D7F20);
      }
      dispatch_data_t v9 = off_10166B498;
      if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
        sub_10107BE60((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
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
  return [(CRLZipArchive *)self readChannelForEntry:a3 validateCRC:1];
}

- (id)readChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(NSMutableOrderedSet *)self->_entries containsObject:v6])
  {
    unsigned int v7 = [v6 isCompressed] ^ 1;
    id v8 = [[CRLZipReadChannel alloc] initWithEntry:v6 archive:self validateCRC:v4 & v7];
    if (v7) {
      goto LABEL_14;
    }
    dispatch_data_t v9 = [CRLBufferedReadChannel alloc];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100128E3C;
    v15[3] = &unk_1014D7F48;
    id v16 = v6;
    BOOL v17 = v4;
    uint64_t v10 = [(CRLBufferedReadChannel *)v9 initWithReadChannel:v8 blockInfos:0 streamReadChannelBlock:v15];

    uint64_t v11 = v16;
    id v8 = (CRLZipReadChannel *)v10;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7F68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107BECC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7F88);
    }
    uint64_t v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v12);
    }
    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipArchive readChannelForEntry:validateCRC:]");
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v13 lineNumber:776 isFatal:0 description:"Entry isn't part of this archive"];

    id v8 = 0;
  }

LABEL_14:

  return v8;
}

- (id)streamReadChannelForEntry:(id)a3
{
  return [(CRLZipArchive *)self streamReadChannelForEntry:a3 validateCRC:1];
}

- (id)streamReadChannelForEntry:(id)a3 validateCRC:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(NSMutableOrderedSet *)self->_entries containsObject:v6])
  {
    unsigned int v7 = [v6 isCompressed] ^ 1;
    id v8 = [[CRLZipReadChannel alloc] initWithEntry:v6 archive:self validateCRC:v4 & v7];
    if ((v7 & 1) == 0)
    {
      dispatch_data_t v9 = [CRLZipInflateReadChannel alloc];
      [v6 size];
      uint64_t v10 = -[CRLZipInflateReadChannel initWithReadChannel:uncompressedSize:CRC:validateCRC:](v9, "initWithReadChannel:uncompressedSize:CRC:validateCRC:", v8, [v6 size], [v6 CRC], v4);

      id v8 = (CRLZipReadChannel *)v10;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7FA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107BF54();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7FC8);
    }
    uint64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v11);
    }
    uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipArchive streamReadChannelForEntry:validateCRC:]");
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:799 isFatal:0 description:"Entry isn't part of this archive"];

    id v8 = 0;
  }

  return v8;
}

- (id)containedZipArchiveForEntry:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return +[CRLContainedZipArchive zipArchiveFromEntry:a3 zipArchive:self options:a4 error:a5];
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
    uint64_t v6 = [(CRLZipArchive *)self normalizeEntryName:v4];

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
      uint64_t v11 = [v10 collapsedName];
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
  CFStringRef v21 = sub_100129688;
  CFStringRef v22 = sub_100129698;
  id v23 = 0;
  unint64_t v4 = (self->_options >> 1) & 1 | 2;
  entriesMap = self->_entriesMap;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001296A0;
  v17[3] = &unk_1014D7FF0;
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
    id v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSMutableDictionary count](self->_entriesMap, "count")];
    uint64_t v10 = self->_entriesMap;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10012987C;
    v13[3] = &unk_1014D8018;
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
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D8038);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unint64_t v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    CFStringRef v21 = "-[CRLZipArchive archiveLength]";
    __int16 v22 = 2082;
    id v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m";
    __int16 v24 = 1024;
    int v25 = 916;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D8058);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    uint64_t v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    CFStringRef v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipArchive archiveLength]");
  uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  long long v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 916, 0, "Abstract method not overridden by %{public}@", v13);

  long long v14 = (objc_class *)objc_opt_class();
  long long v15 = NSStringFromClass(v14);
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLZipArchive archiveLength]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (id)newArchiveReadChannel
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D8078);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unint64_t v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    CFStringRef v21 = "-[CRLZipArchive newArchiveReadChannel]";
    __int16 v22 = 2082;
    id v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m";
    __int16 v24 = 1024;
    int v25 = 920;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D8098);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    uint64_t v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    CFStringRef v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipArchive newArchiveReadChannel]");
  uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  long long v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 920, 0, "Abstract method not overridden by %{public}@", v13);

  long long v14 = (objc_class *)objc_opt_class();
  long long v15 = NSStringFromClass(v14);
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLZipArchive newArchiveReadChannel]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (BOOL)isValid
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D80B8);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    unint64_t v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v2;
    __int16 v20 = 2082;
    CFStringRef v21 = "-[CRLZipArchive isValid]";
    __int16 v22 = 2082;
    id v23 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m";
    __int16 v24 = 1024;
    int v25 = 924;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D80D8);
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = v7;
    uint64_t v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v19 = v2;
    __int16 v20 = 2114;
    CFStringRef v21 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLZipArchive isValid]");
  uint64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/Zip/CRLZipArchive.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  long long v13 = NSStringFromClass(v12);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 924, 0, "Abstract method not overridden by %{public}@", v13);

  long long v14 = (objc_class *)objc_opt_class();
  long long v15 = NSStringFromClass(v14);
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[CRLZipArchive isValid]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
}

- (void)validateCRCWithQueue:(id)a3 completion:(id)a4
{
  id v16 = a3;
  id v15 = a4;
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create("CRLZipArchive.Validation", v6);

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_100129688;
  v28[4] = sub_100129698;
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
        block[2] = sub_10012A5C0;
        block[3] = &unk_1014D8120;
        void block[4] = self;
        block[5] = v12;
        id v23 = v28;
        __int16 v22 = v7;
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
  v17[2] = sub_10012A7EC;
  v17[3] = &unk_1014D8170;
  id v18 = v16;
  id v19 = v15;
  __int16 v20 = v28;
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
  id v13 = sub_100129688;
  id v14 = sub_100129698;
  id v15 = 0;
  uint64_t v5 = dispatch_semaphore_create(0);
  id v6 = dispatch_get_global_queue(0, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10012AA30;
  v9[3] = &unk_1014D5408;
  v9[4] = v5;
  void v9[5] = &v10;
  [(CRLZipArchive *)self validateCRCWithQueue:v6 completion:v9];
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
  v3 = +[CRLDescription descriptionWithObject:self class:objc_opt_class()];
  unint64_t v4 = [(NSMutableOrderedSet *)self->_entries array];
  uint64_t v5 = sub_10003F328(v4);
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