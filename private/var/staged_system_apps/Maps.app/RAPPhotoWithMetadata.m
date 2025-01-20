@interface RAPPhotoWithMetadata
+ (BOOL)supportsSecureCoding;
- (GEORPPhotoMetadata)photoMetadata;
- (NSData)rawImageData;
- (NSString)description;
- (RAPPhotoWithMetadata)initWithCoder:(id)a3;
- (RAPPhotoWithMetadata)initWithRAPPhoto:(id)a3;
- (RAPPhotoWithMetadata)initWithRAPPhoto:(id)a3 photoType:(int64_t)a4;
- (int64_t)photoType;
- (void)anonymizeLocation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RAPPhotoWithMetadata

- (RAPPhotoWithMetadata)initWithRAPPhoto:(id)a3 photoType:(int64_t)a4
{
  result = [(RAPPhotoWithMetadata *)self initWithRAPPhoto:a3];
  if (result) {
    result->_photoType = a4;
  }
  return result;
}

- (RAPPhotoWithMetadata)initWithRAPPhoto:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RAPPhotoWithMetadata;
  v5 = [(RAPPhotoWithMetadata *)&v16 init];
  if (v5)
  {
    v6 = [v4 photo];
    uint64_t v7 = UIImageJPEGRepresentation(v6, 0.400000006);
    rawImageData = v5->_rawImageData;
    v5->_rawImageData = (NSData *)v7;

    id v9 = objc_alloc((Class)GEORPPhotoMetadata);
    v10 = +[NSUUID UUID];
    v11 = [v10 UUIDString];
    v12 = [v4 location];
    v13 = (GEORPPhotoMetadata *)[v9 initWithUUID:v11 location:v12];
    photoMetadata = v5->_photoMetadata;
    v5->_photoMetadata = v13;
  }
  return v5;
}

- (void)anonymizeLocation
{
}

- (RAPPhotoWithMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RAPPhotoWithMetadata;
  v5 = [(RAPPhotoWithMetadata *)&v18 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector("rawImageData");
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    rawImageData = v5->_rawImageData;
    v5->_rawImageData = (NSData *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector("photoMetadata");
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    photoMetadata = v5->_photoMetadata;
    v5->_photoMetadata = (GEORPPhotoMetadata *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector("photoType");
    objc_super v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

    v5->_photoType = (int64_t)[v16 integerValue];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  rawImageData = self->_rawImageData;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector("rawImageData");
  [v5 encodeObject:rawImageData forKey:v6];

  photoMetadata = self->_photoMetadata;
  uint64_t v8 = NSStringFromSelector("photoMetadata");
  [v5 encodeObject:photoMetadata forKey:v8];

  id v10 = +[NSNumber numberWithInteger:self->_photoType];
  id v9 = NSStringFromSelector("photoType");
  [v5 encodeObject:v10 forKey:v9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"hasRawImageData : %d \n photoMetadata : %@ \n photoType : %lu", self->_rawImageData != 0, self->_photoMetadata, self->_photoType];
}

- (NSData)rawImageData
{
  return self->_rawImageData;
}

- (int64_t)photoType
{
  return self->_photoType;
}

- (GEORPPhotoMetadata)photoMetadata
{
  return self->_photoMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoMetadata, 0);

  objc_storeStrong((id *)&self->_rawImageData, 0);
}

@end