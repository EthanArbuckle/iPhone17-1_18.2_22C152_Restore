@interface UGCPhotoWithMetadata
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuggestedPhoto;
- (BOOL)needsToBeDownloaded;
- (GEORPPhotoMetadata)photoMetadata;
- (NSData)rawImageData;
- (NSString)identifier;
- (NSURL)url;
- (UGCPhotoWithMetadata)initWithImageData:(id)a3 PHAsset:(id)a4 sourceType:(int64_t)a5;
- (UGCPhotoWithMetadata)initWithImageData:(id)a3 date:(id)a4 location:(id)a5 source:(int64_t)a6;
- (UIImage)image;
- (int64_t)photoType;
- (void)setIsSuggestedPhoto:(BOOL)a3;
@end

@implementation UGCPhotoWithMetadata

- (UGCPhotoWithMetadata)initWithImageData:(id)a3 date:(id)a4 location:(id)a5 source:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
LABEL_13:
      v22 = 0;
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v24 = "Assertion failed: imageData != ((void *)0)";
LABEL_15:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v24, buf, 2u);
    goto LABEL_13;
  }
  if (!a6)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v24 = "Assertion failed: sourceType != UGCSourceTypeUnknown";
    goto LABEL_15;
  }
  v25.receiver = self;
  v25.super_class = (Class)UGCPhotoWithMetadata;
  v14 = [(UGCPhotoWithMetadata *)&v25 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_rawImageData, a3);
    objc_storeStrong((id *)&v15->_date, a4);
    v15->_sourceCFStringRef Type = a6;
    objc_storeStrong((id *)&v15->_location, a5);
    v16 = CGImageSourceCreateWithData((CFDataRef)v15->_rawImageData, 0);
    if (v16)
    {
      v17 = v16;
      CFStringRef Type = CGImageSourceGetType(v16);
      if (Type)
      {
        v19 = +[UTType typeWithIdentifier:Type];
        uint64_t v20 = [v19 preferredMIMEType];
        mimeCFStringRef Type = v15->_mimeType;
        v15->_mimeCFStringRef Type = (NSString *)v20;
      }
      CFRelease(v17);
    }
  }
  self = v15;
  v22 = self;
LABEL_9:

  return v22;
}

- (UGCPhotoWithMetadata)initWithImageData:(id)a3 PHAsset:(id)a4 sourceType:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 creationDate];
  id v11 = [v8 location];

  id v12 = [(UGCPhotoWithMetadata *)self initWithImageData:v9 date:v10 location:v11 source:a5];
  return v12;
}

- (int64_t)photoType
{
  return 6;
}

- (NSString)identifier
{
  v2 = [(UGCPhotoWithMetadata *)self photoMetadata];
  v3 = [v2 clientImageUuid];

  return (NSString *)v3;
}

- (GEORPPhotoMetadata)photoMetadata
{
  photoMetadata = self->_photoMetadata;
  if (!photoMetadata)
  {
    id v4 = objc_alloc((Class)GEORPPhotoMetadata);
    v5 = +[NSUUID UUID];
    v6 = [v5 UUIDString];
    v7 = (GEORPPhotoMetadata *)[v4 initWithUUID:v6 location:self->_location];
    id v8 = self->_photoMetadata;
    self->_photoMetadata = v7;

    [(GEORPPhotoMetadata *)self->_photoMetadata setSize:[(NSData *)self->_rawImageData length]];
    [(GEORPPhotoMetadata *)self->_photoMetadata setMediaType:self->_mimeType];
    char v9 = sub_10098FEC4();
    photoMetadata = self->_photoMetadata;
    if ((v9 & 1) == 0)
    {
      v10 = [(GEORPPhotoMetadata *)photoMetadata geotag];
      [v10 setTimestamp:0.0];

      id v11 = [(GEORPPhotoMetadata *)self->_photoMetadata geotag];
      [v11 setHasTimestamp:0];

      photoMetadata = self->_photoMetadata;
    }
  }

  return photoMetadata;
}

- (UIImage)image
{
  image = self->_image;
  if (!image)
  {
    id v4 = (UIImage *)[objc_alloc((Class)UIImage) initWithData:self->_rawImageData];
    v5 = self->_image;
    self->_image = v4;

    image = self->_image;
  }

  return image;
}

- (NSURL)url
{
  return 0;
}

- (BOOL)needsToBeDownloaded
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unsigned __int8 v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    id v7 = v4;
    id v8 = [(UGCPhotoWithMetadata *)self image];
    char v9 = [v7 image];
    if ([v8 isEqual:v9])
    {
      v10 = [(UGCPhotoWithMetadata *)self photoMetadata];
      id v11 = [v7 photoMetadata];
      unsigned __int8 v6 = [v10 isEqual:v11];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  return v6;
}

- (NSData)rawImageData
{
  return self->_rawImageData;
}

- (BOOL)isSuggestedPhoto
{
  return self->_isSuggestedPhoto;
}

- (void)setIsSuggestedPhoto:(BOOL)a3
{
  self->_isSuggestedPhoto = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoMetadata, 0);
  objc_storeStrong((id *)&self->_rawImageData, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end