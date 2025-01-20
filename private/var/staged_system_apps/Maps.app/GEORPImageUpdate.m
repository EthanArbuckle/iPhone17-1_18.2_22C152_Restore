@interface GEORPImageUpdate
+ (id)deleteImageUpdateWithImageId:(id)a3;
+ (id)newImageUpdateWithClientImageId:(id)a3 responseData:(id)a4;
+ (id)newImageUpdateWithImageId:(id)a3;
+ (id)newImageUpdateWithImageId:(id)a3 photoMetadata:(id)a4;
+ (id)unmodifiedImageUpdateWithImageId:(id)a3;
- (NSUUID)comparisonIdentifier;
@end

@implementation GEORPImageUpdate

- (NSUUID)comparisonIdentifier
{
  id v3 = objc_alloc((Class)NSUUID);
  v4 = [(GEORPImageUpdate *)self photoMetadata];
  v5 = [v4 clientImageUuid];
  id v6 = [v3 initWithUUIDString:v5];

  return (NSUUID *)v6;
}

+ (id)newImageUpdateWithImageId:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)GEORPImageUpdate);
  [v4 setAction:1];
  [v4 setImageId:v3];

  return v4;
}

+ (id)newImageUpdateWithImageId:(id)a3 photoMetadata:(id)a4
{
  id v5 = a4;
  id v6 = +[GEORPImageUpdate newImageUpdateWithImageId:a3];
  [v6 setPhotoMetadata:v5];

  return v6;
}

+ (id)newImageUpdateWithClientImageId:(id)a3 responseData:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[GEORPImageUpdate newImageUpdateWithImageId:0];
  [v7 setUploadResponse:v5];

  id v8 = objc_alloc_init((Class)GEORPPhotoMetadata);
  [v8 setClientImageUuid:v6];

  [v7 setPhotoMetadata:v8];
  return v7;
}

+ (id)deleteImageUpdateWithImageId:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)GEORPImageUpdate);
  [v4 setAction:2];
  [v4 setImageId:v3];

  return v4;
}

+ (id)unmodifiedImageUpdateWithImageId:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)GEORPImageUpdate);
  [v4 setAction:3];
  [v4 setImageId:v3];

  return v4;
}

@end