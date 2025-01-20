@interface PLSAsset
+ (BOOL)supportsSecureCoding;
+ (id)asset;
+ (id)assetWithUUID:(id)a3;
- (BOOL)hasVideoComplement;
- (BOOL)isEquivalentTo:(id)a3;
- (BOOL)isVideo;
- (NSArray)adjustments;
- (NSArray)facesInfo;
- (NSNumber)exposureDate;
- (NSNumber)isFlagged;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)modificationDate;
- (NSNumber)rating;
- (NSString)caption;
- (NSString)eventUUID;
- (NSString)originalFileName;
- (PLSAsset)init;
- (PLSAsset)initWithCoder:(id)a3;
- (PLSAsset)initWithUUID:(id)a3;
- (PLSAssetProperties)properties;
- (id)_itemType;
- (id)description;
- (id)getFacesArray;
- (id)initFromPropertyList:(id)a3;
- (id)propertyList;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjustments:(id)a3;
- (void)setCaption:(id)a3;
- (void)setEventUUID:(id)a3;
- (void)setExposureDate:(id)a3;
- (void)setFacesInfo:(id)a3;
- (void)setHasVideoComplement:(BOOL)a3;
- (void)setIsFlagged:(id)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setOriginalFileName:(id)a3;
- (void)setProperties:(id)a3;
- (void)setRating:(id)a3;
@end

@implementation PLSAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustments, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_facesInfo, 0);
  objc_storeStrong((id *)&self->_originalFileName, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_exposureDate, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_eventUUID, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_isFlagged, 0);

  objc_storeStrong((id *)&self->_rating, 0);
}

- (void)setAdjustments:(id)a3
{
}

- (NSArray)adjustments
{
  return self->_adjustments;
}

- (void)setProperties:(id)a3
{
}

- (PLSAssetProperties)properties
{
  return self->_properties;
}

- (void)setFacesInfo:(id)a3
{
}

- (NSArray)facesInfo
{
  return self->_facesInfo;
}

- (void)setOriginalFileName:(id)a3
{
}

- (NSString)originalFileName
{
  return self->_originalFileName;
}

- (void)setLatitude:(id)a3
{
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (void)setLongitude:(id)a3
{
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (void)setModificationDate:(id)a3
{
}

- (NSNumber)modificationDate
{
  return self->_modificationDate;
}

- (void)setExposureDate:(id)a3
{
}

- (NSNumber)exposureDate
{
  return self->_exposureDate;
}

- (void)setEventUUID:(id)a3
{
}

- (NSString)eventUUID
{
  return self->_eventUUID;
}

- (void)setCaption:(id)a3
{
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setHasVideoComplement:(BOOL)a3
{
  self->_hasVideoComplement = a3;
}

- (BOOL)hasVideoComplement
{
  return self->_hasVideoComplement;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsFlagged:(id)a3
{
}

- (NSNumber)isFlagged
{
  return self->_isFlagged;
}

- (void)setRating:(id)a3
{
}

- (NSNumber)rating
{
  return self->_rating;
}

- (id)_itemType
{
  return kPLSTransportAssetItemType;
}

- (BOOL)isEquivalentTo:(id)a3
{
  v4 = (PLSAsset *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v24 = 1;
    goto LABEL_11;
  }
  if (v4)
  {
    v6 = [(PLSAsset *)self exposureDate];
    v7 = [(PLSAsset *)v5 exposureDate];
    unsigned int v8 = +[PLSLibraryChangeSnapshot number:v6 equalsNumber:v7];

    if (v8)
    {
      v9 = [(PLSAsset *)self modificationDate];
      v10 = [(PLSAsset *)v5 modificationDate];
      unsigned int v11 = +[PLSLibraryChangeSnapshot number:v9 equalsNumber:v10];

      if (v11)
      {
        v12 = [(PLSAsset *)self latitude];
        v13 = [(PLSAsset *)v5 latitude];
        unsigned int v14 = [v12 isEqualToNumber:v13];

        if (v14)
        {
          v15 = [(PLSAsset *)self longitude];
          v16 = [(PLSAsset *)v5 longitude];
          unsigned int v17 = [v15 isEqualToNumber:v16];

          if (v17)
          {
            v18 = [(PLSAsset *)self originalFileName];
            uint64_t v19 = [(PLSAsset *)v5 originalFileName];
            if (v18 == (void *)v19)
            {
            }
            else
            {
              v20 = (void *)v19;
              v21 = [(PLSAsset *)self originalFileName];
              v22 = [(PLSAsset *)v5 originalFileName];
              unsigned int v23 = [v21 isEqualToString:v22];

              if (!v23) {
                goto LABEL_9;
              }
            }
            v26 = [(PLSAsset *)self facesInfo];
            id v27 = [v26 count];
            v28 = [(PLSAsset *)v5 facesInfo];
            char v24 = v27 == [v28 count];

            goto LABEL_11;
          }
        }
      }
    }
  }
LABEL_9:
  char v24 = 0;
LABEL_11:

  return v24;
}

- (id)getFacesArray
{
  v2 = [(PLSAsset *)self facesInfo];
  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = [PLSFace alloc];
        unsigned int v11 = -[PLSFace initWithFaceInfo:](v10, "initWithFaceInfo:", v9, (void)v13);
        [v3 addObject:v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)propertyList
{
  v21.receiver = self;
  v21.super_class = (Class)PLSAsset;
  v3 = [(PLSItem *)&v21 propertyList];
  id v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];

  rating = self->_rating;
  if (rating) {
    [v4 setObject:rating forKey:kPLSAssetRatingKey];
  }
  isFlagged = self->_isFlagged;
  if (isFlagged) {
    [v4 setObject:isFlagged forKey:kPLSAssetIsFlaggedKey];
  }
  uint64_t v7 = +[NSNumber numberWithBool:self->_isVideo];

  if (v7)
  {
    unsigned int v8 = +[NSNumber numberWithBool:self->_isVideo];
    [v4 setObject:v8 forKey:kPLSAssetIsVideoKey];
  }
  uint64_t v9 = +[NSNumber numberWithBool:self->_hasVideoComplement];

  if (v9)
  {
    v10 = +[NSNumber numberWithBool:self->_hasVideoComplement];
    [v4 setObject:v10 forKey:kPLSAssetHasVideoComplementKey];
  }
  caption = self->_caption;
  if (caption) {
    [v4 setObject:caption forKey:kPLSAssetCaptionKey];
  }
  eventUUID = self->_eventUUID;
  if (eventUUID) {
    [v4 setObject:eventUUID forKey:kPLSAssetEventUUIDKey];
  }
  exposureDate = self->_exposureDate;
  if (exposureDate) {
    [v4 setObject:exposureDate forKey:kPLSAssetExposureDateKey];
  }
  modificationDate = self->_modificationDate;
  if (modificationDate) {
    [v4 setObject:modificationDate forKey:kPLSAssetModificationDateKey];
  }
  longitude = self->_longitude;
  if (longitude) {
    [v4 setObject:longitude forKey:kPLSAssetLongitudeKey];
  }
  latitude = self->_latitude;
  if (latitude) {
    [v4 setObject:latitude forKey:kPLSAssetLatitudeKey];
  }
  originalFileName = self->_originalFileName;
  if (originalFileName) {
    [v4 setObject:originalFileName forKey:kPLSAssetOriginalFileNameKey];
  }
  facesInfo = self->_facesInfo;
  if (facesInfo) {
    [v4 setObject:facesInfo forKey:kPLSAssetFacesKey];
  }
  uint64_t v19 = [(PLSAssetProperties *)self->_properties propertyList];
  if (v19) {
    [v4 setObject:v19 forKey:@"assetProperties"];
  }

  return v4;
}

- (id)initFromPropertyList:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PLSAsset;
  id v5 = [(PLSItem *)&v35 initFromPropertyList:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:kPLSAssetRatingKey];
    uint64_t v7 = (void *)v5[4];
    v5[4] = v6;

    uint64_t v8 = [v4 objectForKey:kPLSAssetIsFlaggedKey];
    uint64_t v9 = (void *)v5[5];
    v5[5] = v8;

    v10 = [v4 objectForKey:kPLSAssetIsVideoKey];
    *((unsigned char *)v5 + 104) = [v10 BOOLValue];

    unsigned int v11 = [v4 objectForKey:kPLSAssetHasVideoComplementKey];
    *((unsigned char *)v5 + 105) = [v11 BOOLValue];

    uint64_t v12 = [v4 objectForKey:kPLSAssetCaptionKey];
    long long v13 = (void *)v5[6];
    v5[6] = v12;

    uint64_t v14 = [v4 objectForKey:kPLSAssetEventUUIDKey];
    long long v15 = (void *)v5[7];
    v5[7] = v14;

    uint64_t v16 = [v4 objectForKey:kPLSAssetLongitudeKey];
    unsigned int v17 = (void *)v5[8];
    v5[8] = v16;

    uint64_t v18 = [v4 objectForKey:kPLSAssetLatitudeKey];
    uint64_t v19 = (void *)v5[9];
    v5[9] = v18;

    uint64_t v20 = [v4 objectForKey:kPLSAssetOriginalFileNameKey];
    objc_super v21 = (void *)v5[12];
    v5[12] = v20;

    uint64_t v22 = [v4 objectForKey:kPLSAssetExposureDateKey];
    unsigned int v23 = (void *)v5[10];
    v5[10] = v22;

    uint64_t v24 = kPLSAssetModificationDateKey;
    if (!v5[10])
    {
      uint64_t v25 = [v4 objectForKey:kPLSAssetModificationDateKey];
      v26 = (void *)v5[10];
      v5[10] = v25;
    }
    uint64_t v27 = [v4 objectForKey:v24];
    v28 = (void *)v5[11];
    v5[11] = v27;

    uint64_t v29 = [v4 objectForKey:kPLSAssetFacesKey];
    v30 = (void *)v5[14];
    v5[14] = v29;

    v31 = [v4 objectForKey:@"assetProperties"];
    if (v31)
    {
      id v32 = [[PLSAssetProperties alloc] initFromPropertyList:v31];
      v33 = (void *)v5[15];
      v5[15] = v32;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PLSAsset *)self rating];
  [v4 encodeObject:v5 forKey:kPLSAssetRatingKey];

  uint64_t v6 = [(PLSAsset *)self isFlagged];
  [v4 encodeObject:v6 forKey:kPLSAssetIsFlaggedKey];

  uint64_t v7 = +[NSNumber numberWithBool:[(PLSAsset *)self isVideo]];
  [v4 encodeObject:v7 forKey:kPLSAssetIsVideoKey];

  uint64_t v8 = +[NSNumber numberWithBool:[(PLSAsset *)self hasVideoComplement]];
  [v4 encodeObject:v8 forKey:kPLSAssetHasVideoComplementKey];

  uint64_t v9 = [(PLSAsset *)self caption];
  [v4 encodeObject:v9 forKey:kPLSAssetCaptionKey];

  v10 = [(PLSAsset *)self eventUUID];
  [v4 encodeObject:v10 forKey:kPLSAssetEventUUIDKey];

  unsigned int v11 = [(PLSAsset *)self facesInfo];
  [v4 encodeObject:v11 forKey:kPLSAssetFacesKey];

  uint64_t v12 = [(PLSAsset *)self originalFileName];
  [v4 encodeObject:v12 forKey:kPLSAssetOriginalFileNameKey];

  long long v13 = [(PLSAsset *)self properties];

  if (v13)
  {
    uint64_t v14 = [(PLSAsset *)self properties];
    [v4 encodeObject:v14 forKey:@"assetProperties"];
  }
  v15.receiver = self;
  v15.super_class = (Class)PLSAsset;
  [(PLSItem *)&v15 encodeWithCoder:v4];
}

- (PLSAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PLSAsset;
  id v5 = [(PLSItem *)&v23 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSAssetRatingKey];
    rating = v5->_rating;
    v5->_rating = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSAssetIsFlaggedKey];
    isFlagged = v5->_isFlagged;
    v5->_isFlagged = (NSNumber *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSAssetIsVideoKey];
    v5->_isVideo = [v10 BOOLValue];

    unsigned int v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSAssetHasVideoComplementKey];
    v5->_hasVideoComplement = [v11 BOOLValue];

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSAssetCaptionKey];
    caption = v5->_caption;
    v5->_caption = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSAssetEventUUIDKey];
    eventUUID = v5->_eventUUID;
    v5->_eventUUID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPLSAssetOriginalFileNameKey];
    originalFileName = v5->_originalFileName;
    v5->_originalFileName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetProperties"];
    properties = v5->_properties;
    v5->_properties = (PLSAssetProperties *)v18;

    uint64_t v20 = [v4 decodePropertyListForKey:kPLSAssetFacesKey];
    facesInfo = v5->_facesInfo;
    v5->_facesInfo = (NSArray *)v20;
  }
  return v5;
}

- (id)description
{
  v19.receiver = self;
  v19.super_class = (Class)PLSAsset;
  unsigned int v17 = [(PLSItem *)&v19 description];
  v3 = [(PLSAsset *)self rating];
  id v4 = [(PLSAsset *)self isFlagged];
  unsigned int v5 = [(PLSAsset *)self isVideo];
  CFStringRef v6 = @"NO";
  if (v5) {
    CFStringRef v6 = @"YES";
  }
  CFStringRef v16 = v6;
  uint64_t v7 = [(PLSAsset *)self caption];
  uint64_t v8 = [(PLSAsset *)self eventUUID];
  uint64_t v9 = [(PLSAsset *)self exposureDate];
  v10 = [(PLSAsset *)self modificationDate];
  unsigned int v11 = [(PLSAsset *)self latitude];
  uint64_t v12 = [(PLSAsset *)self longitude];
  long long v13 = [(PLSAsset *)self originalFileName];
  uint64_t v14 = [(PLSAsset *)self facesInfo];
  uint64_t v18 = +[NSString stringWithFormat:@"Asset - %@, rating: %@, isFlagged: %@, isVideo:%@, caption: %@, eventUUID: %@, exposureDate: %@, modificationDate: %@, latitude: %@, longitude: %@, originalFileName: %@, facesInfo: %@", v17, v3, v4, v16, v7, v8, v9, v10, v11, v12, v13, v14];

  return v18;
}

- (PLSAsset)initWithUUID:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PLSAsset;
  v3 = [(PLSItem *)&v13 initWithUUID:a3];
  id v4 = v3;
  if (v3)
  {
    rating = v3->_rating;
    v3->_rating = (NSNumber *)&off_25BF8;

    isFlagged = v4->_isFlagged;
    v4->_isFlagged = (NSNumber *)&__kCFBooleanFalse;

    v4->_isVideo = 0;
    caption = v4->_caption;
    v4->_caption = (NSString *)&stru_24CC0;

    eventUUID = v4->_eventUUID;
    v4->_eventUUID = (NSString *)&stru_24CC0;

    exposureDate = v4->_exposureDate;
    v4->_exposureDate = (NSNumber *)&off_25C28;

    modificationDate = v4->_modificationDate;
    v4->_modificationDate = (NSNumber *)&off_25C28;

    facesInfo = v4->_facesInfo;
    v4->_facesInfo = (NSArray *)&__NSArray0__struct;
  }
  return v4;
}

- (PLSAsset)init
{
  v3 = +[PLSUUID generateUUIDAsString];
  id v4 = [(PLSAsset *)self initWithUUID:v3];

  return v4;
}

+ (id)assetWithUUID:(id)a3
{
  id v3 = a3;
  id v4 = [[PLSAsset alloc] initWithUUID:v3];

  return v4;
}

+ (id)asset
{
  v2 = objc_alloc_init(PLSAsset);

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end