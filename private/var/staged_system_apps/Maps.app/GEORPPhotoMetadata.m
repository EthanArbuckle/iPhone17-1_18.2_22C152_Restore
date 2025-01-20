@interface GEORPPhotoMetadata
- (GEORPPhotoMetadata)initWithUUID:(id)a3 location:(id)a4;
@end

@implementation GEORPPhotoMetadata

- (GEORPPhotoMetadata)initWithUUID:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEORPPhotoMetadata;
  v8 = [(GEORPPhotoMetadata *)&v17 init];
  v9 = v8;
  if (v8)
  {
    [(GEORPPhotoMetadata *)v8 setClientImageUuid:v6];
    if (v7)
    {
      [v7 coordinate];
      if (CLLocationCoordinate2DIsValid(v18))
      {
        id v10 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v7];
        [(GEORPPhotoMetadata *)v9 setGeotag:v10];

        v11 = [v7 timestamp];

        if (v11)
        {
          v12 = [v7 timestamp];
          [v12 timeIntervalSinceReferenceDate];
          double v14 = v13;
          v15 = [(GEORPPhotoMetadata *)v9 geotag];
          [v15 setTimestamp:v14];
        }
      }
    }
  }

  return v9;
}

@end