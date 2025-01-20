@interface PTPObjectInfoDataset
- (BOOL)contentLengthValid:(unsigned int)a3 forContentType:(int)a4;
- (NSString)captureDate;
- (NSString)filename;
- (NSString)modificationDate;
- (PTPObjectInfoDataset)init;
- (PTPObjectInfoDataset)initWithBytes:(char *)a3 length:(unsigned int)a4;
- (PTPObjectInfoDataset)initWithBytes:(char *)a3 length:(unsigned int)a4 contentType:(int)a5;
- (PTPObjectInfoDataset)initWithData:(id)a3;
- (PTPObjectInfoDataset)initWithData:(id)a3 contentType:(int)a4;
- (id)content;
- (id)content:(int)a3;
- (id)description;
- (id)keywords;
- (id)relatedUUID;
- (int64_t)intervalSince1970;
- (unint64_t)objectCompressedSize64;
- (unsigned)associationDesc;
- (unsigned)associationType;
- (unsigned)imageBitDepth;
- (unsigned)imagePixHeight;
- (unsigned)imagePixWidth;
- (unsigned)objectBufferSizeForContentType:(int)a3;
- (unsigned)objectCompressedSize;
- (unsigned)objectContentSizeForContentType:(int)a3;
- (unsigned)objectFormat;
- (unsigned)objectHandle;
- (unsigned)parentObject;
- (unsigned)protectionStatus;
- (unsigned)sequenceNumber;
- (unsigned)storageID;
- (unsigned)thumbCompressedSize;
- (unsigned)thumbFormat;
- (unsigned)thumbOffset;
- (unsigned)thumbPixHeight;
- (unsigned)thumbPixWidth;
- (void)addCustomKeyword:(id)a3 withIdentifier:(id)a4;
- (void)contentLength:(unsigned int *)a3 bufferLength:(unsigned int *)a4 contentType:(int)a5;
- (void)setAssociationDesc:(unsigned int)a3;
- (void)setAssociationType:(unsigned __int16)a3;
- (void)setCaptureDate:(id)a3;
- (void)setFilename:(id)a3;
- (void)setImageBitDepth:(unsigned int)a3;
- (void)setImagePixHeight:(unsigned int)a3;
- (void)setImagePixWidth:(unsigned int)a3;
- (void)setKeywords:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setObjectCompressedSize:(unint64_t)a3;
- (void)setObjectFormat:(unsigned __int16)a3;
- (void)setObjectHandle:(unsigned int)a3;
- (void)setParentObject:(unsigned int)a3;
- (void)setProtectionStatus:(unsigned __int16)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setStorageID:(unsigned int)a3;
- (void)setThumbCompressedSize:(unsigned int)a3;
- (void)setThumbFormat:(unsigned __int16)a3;
- (void)setThumbOffset:(unsigned int)a3;
- (void)setThumbPixHeight:(unsigned int)a3;
- (void)setThumbPixWidth:(unsigned int)a3;
@end

@implementation PTPObjectInfoDataset

- (PTPObjectInfoDataset)init
{
  v3.receiver = self;
  v3.super_class = (Class)PTPObjectInfoDataset;
  return [(PTPObjectInfoDataset *)&v3 init];
}

- (PTPObjectInfoDataset)initWithData:(id)a3
{
  return [(PTPObjectInfoDataset *)self initWithData:a3 contentType:0];
}

- (PTPObjectInfoDataset)initWithBytes:(char *)a3 length:(unsigned int)a4
{
  return [(PTPObjectInfoDataset *)self initWithBytes:a3 length:*(void *)&a4 contentType:0];
}

- (PTPObjectInfoDataset)initWithData:(id)a3 contentType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [v6 bytes];
  id v8 = [v6 length];

  return [(PTPObjectInfoDataset *)self initWithBytes:v7 length:v8 contentType:v4];
}

- (PTPObjectInfoDataset)initWithBytes:(char *)a3 length:(unsigned int)a4 contentType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  v37.receiver = self;
  v37.super_class = (Class)PTPObjectInfoDataset;
  id v8 = [(PTPObjectInfoDataset *)&v37 init];
  v9 = v8;
  if (!v8) {
    return v9;
  }
  if ([(PTPObjectInfoDataset *)v8 contentLengthValid:v6 forContentType:v5])
  {
    v10 = &a3[v6];
    v36 = a3;
    if (v5)
    {
      v9->_objectHandle = sub_10001F148(&v36);
      if (v5 > 2) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = sub_10001F148(&v36);
      }
    }
    v9->_storageID = sub_10001F148(&v36);
    v9->_objectFormat = sub_10001F0CC(&v36);
    v9->_protectionStatus = sub_10001F0CC(&v36);
    if (v5 > 1)
    {
      if ((v5 & 0xFFFFFFFE) == 2) {
        v9->_objectCompressedSize = sub_10001F19C((void **)&v36);
      }
      BOOL v18 = v5 == 3;
      if ((v5 - 5) > 0xFFFFFFFD) {
        goto LABEL_18;
      }
    }
    else
    {
      BOOL v18 = 0;
      v9->_objectCompressedSize = sub_10001F148(&v36);
    }
    v9->_thumbFormat = sub_10001F0CC(&v36);
    v9->_thumbCompressedSize = sub_10001F148(&v36);
    v9->_thumbPixWidth = sub_10001F148(&v36);
    v9->_thumbPixHeight = sub_10001F148(&v36);
    v9->_imagePixWidth = sub_10001F148(&v36);
    v9->_imagePixHeight = sub_10001F148(&v36);
    v9->_imageBitDepth = sub_10001F148(&v36);
LABEL_18:
    v9->_parentObject = sub_10001F148(&v36);
    v9->_associationType = sub_10001F0CC(&v36);
    v9->_associationDesc = sub_10001F148(&v36);
    v9->_sequenceNumber = sub_10001F148(&v36);
    uint64_t v19 = sub_10001F270((const void **)&v36, (unint64_t)v10);
    filename = v9->_filename;
    v9->_filename = (NSString *)v19;

    uint64_t v21 = sub_10001F270((const void **)&v36, (unint64_t)v10);
    if (v18)
    {
      modificationDate = v9->_modificationDate;
      v9->_modificationDate = (NSString *)v21;
    }
    else
    {
      captureDate = v9->_captureDate;
      v9->_captureDate = (NSString *)v21;

      uint64_t v24 = sub_10001F270((const void **)&v36, (unint64_t)v10);
      v25 = v9->_modificationDate;
      v9->_modificationDate = (NSString *)v24;

      modificationDate = sub_10001F270((const void **)&v36, (unint64_t)v10);
      [(PTPObjectInfoDataset *)v9 setKeywords:modificationDate];
    }

    uint64_t v35 = 0;
    [(PTPObjectInfoDataset *)v9 contentLength:(char *)&v35 + 4 bufferLength:&v35 contentType:v5];
    if (HIDWORD(v35) != v6)
    {
      __ICOSLogCreate();
      v26 = [(PTPObjectInfoDataset *)v9 filename];
      if ((unint64_t)[v26 length] >= 0x15)
      {
        v27 = [v26 substringWithRange:0, 18];
        uint64_t v28 = [v27 stringByAppendingString:@".."];

        v26 = (void *)v28;
      }
      v29 = +[NSString stringWithFormat:@"Output Content Length Mismatch: contentLength: %d  datasetLength: %d\n", HIDWORD(v35), v6];
      v30 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = v26;
        v32 = v30;
        id v33 = [v31 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v39 = v33;
        __int16 v40 = 2114;
        v41 = v29;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    return v9;
  }
  __ICOSLogCreate();
  v11 = @"PTPObjInfo";
  if ((unint64_t)[@"PTPObjInfo" length] >= 0x15)
  {
    v12 = [@"PTPObjInfo" substringWithRange:0, 18];
    v11 = [v12 stringByAppendingString:@".."];
  }
  v13 = +[NSString stringWithFormat:@"Input Content Length Mismatch: contentLength: %d", v6];
  v14 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v11;
    v16 = v14;
    id v17 = [(__CFString *)v15 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v39 = v17;
    __int16 v40 = 2114;
    v41 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  return 0;
}

- (id)content
{
  return [(PTPObjectInfoDataset *)self content:0];
}

- (void)contentLength:(unsigned int *)a3 bufferLength:(unsigned int *)a4 contentType:(int)a5
{
  NSUInteger v9 = [(NSString *)self->_filename length];
  if (v9) {
    int v10 = v9 + 1;
  }
  else {
    int v10 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_captureDate length];
  if (v11) {
    int v12 = v11 + 1;
  }
  else {
    int v12 = 0;
  }
  NSUInteger v13 = [(NSString *)self->_modificationDate length];
  if (v13) {
    int v14 = v13 + 1;
  }
  else {
    int v14 = 0;
  }
  id v15 = [(NSMutableString *)self->_keywords length];
  if (v15) {
    int v16 = v15 + 1;
  }
  else {
    int v16 = 0;
  }
  if (a5 == 2)
  {
    int v18 = 2 * (v14 + v10 + v12 + v16);
    *a3 = v18 + 60;
    unsigned int v17 = v18 + 68;
  }
  else if (a5 == 1)
  {
    int v19 = 2 * (v14 + v10 + v12 + v16);
    *a3 = v19 + 56;
    unsigned int v17 = v19 + 64;
  }
  else
  {
    if (a5)
    {
      if ((a5 - 3) > 1) {
        return;
      }
      unsigned int v17 = 2 * (v14 + v10) + 36;
    }
    else
    {
      unsigned int v17 = 2 * (v14 + v10 + v12 + v16) + 56;
    }
    *a3 = v17;
  }
  *a4 = v17;
}

- (BOOL)contentLengthValid:(unsigned int)a3 forContentType:(int)a4
{
  uint64_t v6 = 0;
  [(PTPObjectInfoDataset *)self contentLength:(char *)&v6 + 4 bufferLength:&v6 contentType:*(void *)&a4];
  return HIDWORD(v6) <= a3;
}

- (id)content:(int)a3
{
  uint64_t v15 = 0;
  [(PTPObjectInfoDataset *)self contentLength:(char *)&v15 + 4 bufferLength:&v15 contentType:*(void *)&a3];
  id v5 = objc_alloc((Class)NSMutableData);
  id v6 = [v5 initWithLength:v15];
  int v16 = [v6 mutableBytes];
  if (a3)
  {
    sub_10001F130((_DWORD **)&v16, self->_objectHandle);
    if (a3 <= 2) {
      sub_10001F130((_DWORD **)&v16, SHIDWORD(v15));
    }
  }
  sub_10001F130((_DWORD **)&v16, self->_storageID);
  sub_10001F0B4(&v16, self->_objectFormat);
  sub_10001F0B4(&v16, self->_protectionStatus);
  if (a3 <= 1)
  {
    if (HIDWORD(self->_objectCompressedSize)) {
      int objectCompressedSize = -1;
    }
    else {
      int objectCompressedSize = self->_objectCompressedSize;
    }
    sub_10001F130((_DWORD **)&v16, objectCompressedSize);
  }
  if ((a3 & 0xFFFFFFFE) == 2) {
    sub_10001F184((void **)&v16, self->_objectCompressedSize);
  }
  if ((a3 - 5) <= 0xFFFFFFFD)
  {
    sub_10001F0B4(&v16, self->_thumbFormat);
    sub_10001F130((_DWORD **)&v16, self->_thumbCompressedSize);
    sub_10001F130((_DWORD **)&v16, self->_thumbPixWidth);
    sub_10001F130((_DWORD **)&v16, self->_thumbPixHeight);
    sub_10001F130((_DWORD **)&v16, self->_imagePixWidth);
    sub_10001F130((_DWORD **)&v16, self->_imagePixHeight);
    sub_10001F130((_DWORD **)&v16, self->_imageBitDepth);
  }
  sub_10001F130((_DWORD **)&v16, self->_parentObject);
  sub_10001F0B4(&v16, self->_associationType);
  sub_10001F130((_DWORD **)&v16, self->_associationDesc);
  sub_10001F130((_DWORD **)&v16, self->_sequenceNumber);
  sub_10001F2B8((unsigned char **)&v16, self->_filename);
  if (a3 == 3)
  {
    p_modificationDate = (id *)&self->_modificationDate;
  }
  else
  {
    sub_10001F2B8((unsigned char **)&v16, self->_captureDate);
    sub_10001F2B8((unsigned char **)&v16, self->_modificationDate);
    p_modificationDate = (id *)&self->_keywords;
    if ((unint64_t)[(NSMutableString *)self->_keywords length] >= 0x100)
    {
      __ICOSLogCreate();
      NSUInteger v9 = [(PTPObjectInfoDataset *)self filename];
      if ((unint64_t)[v9 length] >= 0x15)
      {
        int v10 = [v9 substringWithRange:0, 18];
        uint64_t v11 = [v10 stringByAppendingString:@".."];

        NSUInteger v9 = (void *)v11;
      }
      int v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Keywords length of: %lu is larger than a uint8 and cannot be written.", [*p_modificationDate length]);
      NSUInteger v13 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
        sub_100030A04(v9, v13);
      }
    }
  }
  sub_10001F2B8((unsigned char **)&v16, *p_modificationDate);

  return v6;
}

- (id)description
{
  uint64_t objectHandle = self->_objectHandle;
  uint64_t storageID = self->_storageID;
  int v16 = sub_100020D80(self->_objectFormat);
  objc_super v3 = sub_100020CF4(self->_protectionStatus);
  unint64_t objectCompressedSize = self->_objectCompressedSize;
  uint64_t v4 = sub_100020D80(self->_thumbFormat);
  uint64_t thumbCompressedSize = self->_thumbCompressedSize;
  uint64_t thumbPixWidth = self->_thumbPixWidth;
  uint64_t thumbPixHeight = self->_thumbPixHeight;
  uint64_t imagePixWidth = self->_imagePixWidth;
  uint64_t imagePixHeight = self->_imagePixHeight;
  uint64_t imageBitDepth = self->_imageBitDepth;
  uint64_t parentObject = self->_parentObject;
  uint64_t v11 = sub_100021068(self->_associationType);
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<PTPObjectInfoDataset %p>{\n  _objectHandle:            0x%08lX\n  _storageID:            0x%08lX\n  _objectFormat:         %@\n  _protectionStatus:     %@\n  _objectCompressedSize: %llu\n  _thumbFormat:          %@\n  _thumbCompressedSize:  %lu\n  _thumbPixWidth:        %lu\n  _thumbPixHeight:       %lu\n  _imagePixWidth:        %lu\n  _imagePixHeight:       %lu\n  _imageBitDepth:        %lu\n  _parentObject:         0x%08lX\n  _associationType:      %@\n  _associationDesc:      0x%08lX\n  _sequenceNumber:       %lu\n  _filename:             %@\n  _captureDate:          %@\n  _modificationDate:     %@\n  _keywords:             %@\n}", self, objectHandle, storageID, v16, v3, objectCompressedSize, v4, thumbCompressedSize, thumbPixWidth, thumbPixHeight, imagePixWidth, imagePixHeight, imageBitDepth, parentObject, v11, self->_associationDesc,
    self->_sequenceNumber,
    self->_filename,
    self->_captureDate,
    self->_modificationDate,
  int v12 = self->_keywords);

  return v12;
}

- (unint64_t)objectCompressedSize64
{
  return self->_objectCompressedSize;
}

- (unsigned)objectCompressedSize
{
  if (HIDWORD(self->_objectCompressedSize)) {
    return -1;
  }
  else {
    return self->_objectCompressedSize;
  }
}

- (void)setObjectCompressedSize:(unint64_t)a3
{
  self->_unint64_t objectCompressedSize = a3;
}

- (id)keywords
{
  id v2 = [(NSMutableString *)self->_keywords copy];

  return v2;
}

- (void)setKeywords:(id)a3
{
  id v6 = a3;
  if ((-[NSMutableString isEqualToString:](self->_keywords, "isEqualToString:") & 1) == 0)
  {
    uint64_t v4 = (NSMutableString *)[v6 mutableCopy];
    keywords = self->_keywords;
    self->_keywords = v4;
  }
}

- (void)addCustomKeyword:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    if (!self->_keywords)
    {
      NSUInteger v9 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
      keywords = self->_keywords;
      self->_keywords = v9;
    }
    id v11 = [v6 length];
    int v12 = (char *)[v8 length];
    NSUInteger v13 = &v12[(void)v11 + 3 + (unint64_t)[(NSMutableString *)self->_keywords length]];
    if ((unint64_t)v13 > 0xFF)
    {
      __ICOSLogCreate();
      int v16 = [(PTPObjectInfoDataset *)self filename];
      if ((unint64_t)[v16 length] >= 0x15)
      {
        unsigned int v17 = [v16 substringWithRange:0, 18];
        uint64_t v18 = [v17 stringByAppendingString:@".."];

        int v16 = (void *)v18;
      }
      int v19 = +[NSString stringWithFormat:@"Dropping keyword: %@ identifier: %@ -- Would create string of illegal length: 0x%llx > 0xFF", v6, v8, v13];
      v20 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
        sub_100030A04(v16, v20);
      }
    }
    else
    {
      id v14 = [(NSMutableString *)self->_keywords length];
      CFStringRef v15 = @"&";
      if (!v14) {
        CFStringRef v15 = &stru_100048E60;
      }
      [(NSMutableString *)self->_keywords appendFormat:@"%@%@^%@", v15, v8, v6];
    }
  }
}

- (unsigned)objectContentSizeForContentType:(int)a3
{
  unsigned int v5 = 0;
  int v4 = 0;
  [(PTPObjectInfoDataset *)self contentLength:&v5 bufferLength:&v4 contentType:*(void *)&a3];
  return v5;
}

- (unsigned)objectBufferSizeForContentType:(int)a3
{
  int v5 = 0;
  unsigned int v4 = 0;
  [(PTPObjectInfoDataset *)self contentLength:&v5 bufferLength:&v4 contentType:*(void *)&a3];
  return v4;
}

- (id)relatedUUID
{
  if (!self->_relatedUUID)
  {
    objc_super v3 = strstr((char *)[(NSMutableString *)self->_keywords UTF8String], "RUUID^");
    if (v3 && (unsigned int v4 = v3, strlen(v3) >= 0x2A))
    {
      __dst[36] = 0;
      strncpy(__dst, v4 + 6, 0x24uLL);
      id v5 = objc_alloc((Class)NSUUID);
      id v6 = +[NSString stringWithUTF8String:__dst];
      id v7 = (NSUUID *)[v5 initWithUUIDString:v6];
      relatedUUID = self->_relatedUUID;
      self->_relatedUUID = v7;
    }
    else
    {
      NSUInteger v9 = +[NSUUID UUID];
      int v10 = (NSUUID *)[v9 copy];
      id v11 = self->_relatedUUID;
      self->_relatedUUID = v10;
    }
  }
  int v12 = self->_relatedUUID;

  return v12;
}

- (int64_t)intervalSince1970
{
  int64_t result = self->_intervalSince1970;
  if (!result)
  {
    int64_t result = sub_10001DFE0(self->_captureDate);
    self->_intervalSince1970 = result;
  }
  return result;
}

- (unsigned)objectHandle
{
  return self->_objectHandle;
}

- (void)setObjectHandle:(unsigned int)a3
{
  self->_uint64_t objectHandle = a3;
}

- (unsigned)storageID
{
  return self->_storageID;
}

- (void)setStorageID:(unsigned int)a3
{
  self->_uint64_t storageID = a3;
}

- (unsigned)parentObject
{
  return self->_parentObject;
}

- (void)setParentObject:(unsigned int)a3
{
  self->_uint64_t parentObject = a3;
}

- (unsigned)associationType
{
  return self->_associationType;
}

- (void)setAssociationType:(unsigned __int16)a3
{
  self->_associationType = a3;
}

- (unsigned)associationDesc
{
  return self->_associationDesc;
}

- (void)setAssociationDesc:(unsigned int)a3
{
  self->_associationDesc = a3;
}

- (unsigned)objectFormat
{
  return self->_objectFormat;
}

- (void)setObjectFormat:(unsigned __int16)a3
{
  self->_objectFormat = a3;
}

- (unsigned)protectionStatus
{
  return self->_protectionStatus;
}

- (void)setProtectionStatus:(unsigned __int16)a3
{
  self->_protectionStatus = a3;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  self->_sequenceNumber = a3;
}

- (unsigned)thumbCompressedSize
{
  return self->_thumbCompressedSize;
}

- (void)setThumbCompressedSize:(unsigned int)a3
{
  self->_uint64_t thumbCompressedSize = a3;
}

- (unsigned)thumbFormat
{
  return self->_thumbFormat;
}

- (void)setThumbFormat:(unsigned __int16)a3
{
  self->_thumbFormat = a3;
}

- (unsigned)thumbOffset
{
  return self->_thumbOffset;
}

- (void)setThumbOffset:(unsigned int)a3
{
  self->_thumbOffset = a3;
}

- (unsigned)thumbPixWidth
{
  return self->_thumbPixWidth;
}

- (void)setThumbPixWidth:(unsigned int)a3
{
  self->_uint64_t thumbPixWidth = a3;
}

- (unsigned)thumbPixHeight
{
  return self->_thumbPixHeight;
}

- (void)setThumbPixHeight:(unsigned int)a3
{
  self->_uint64_t thumbPixHeight = a3;
}

- (unsigned)imagePixWidth
{
  return self->_imagePixWidth;
}

- (void)setImagePixWidth:(unsigned int)a3
{
  self->_uint64_t imagePixWidth = a3;
}

- (unsigned)imagePixHeight
{
  return self->_imagePixHeight;
}

- (void)setImagePixHeight:(unsigned int)a3
{
  self->_uint64_t imagePixHeight = a3;
}

- (unsigned)imageBitDepth
{
  return self->_imageBitDepth;
}

- (void)setImageBitDepth:(unsigned int)a3
{
  self->_uint64_t imageBitDepth = a3;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSString)captureDate
{
  return self->_captureDate;
}

- (void)setCaptureDate:(id)a3
{
}

- (NSString)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_relatedUUID, 0);

  objc_storeStrong((id *)&self->_keywords, 0);
}

@end