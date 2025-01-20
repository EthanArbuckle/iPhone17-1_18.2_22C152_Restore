@interface WFGalleryBanner
+ (CGSize)pixelSizeForBannerSize:(int64_t)a3;
+ (CGSize)pointSizeForBannerSize:(int64_t)a3;
+ (NSDictionary)properties;
+ (NSString)recordType;
+ (double)scaleForBannerSize:(int64_t)a3;
+ (id)propertyForSize:(int64_t)a3;
- (CKRecordID)base;
- (CKRecordID)detailPage;
- (CKRecordID)identifier;
- (NSArray)supportedIdioms;
- (NSString)language;
- (NSString)name;
- (NSString)persistentIdentifier;
- (NSString)subtitle;
- (WFFileRepresentation)ipad2xImageFile;
- (WFFileRepresentation)iphone2xImageFile;
- (WFFileRepresentation)iphone3xImageFile;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageFileForSize:(int64_t)a3;
- (id)imageForSize:(int64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)referenceActionForKey:(id)a3;
- (void)setIpad2xImageFile:(id)a3;
- (void)setIphone2xImageFile:(id)a3;
- (void)setIphone3xImageFile:(id)a3;
@end

@implementation WFGalleryBanner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedIdioms, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_ipad2xImageFile, 0);
  objc_storeStrong((id *)&self->_iphone3xImageFile, 0);
  objc_storeStrong((id *)&self->_iphone2xImageFile, 0);
  objc_storeStrong((id *)&self->_detailPage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)supportedIdioms
{
  return self->_supportedIdioms;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (CKRecordID)base
{
  return self->_base;
}

- (NSString)language
{
  return self->_language;
}

- (void)setIpad2xImageFile:(id)a3
{
}

- (WFFileRepresentation)ipad2xImageFile
{
  return self->_ipad2xImageFile;
}

- (void)setIphone3xImageFile:(id)a3
{
}

- (WFFileRepresentation)iphone3xImageFile
{
  return self->_iphone3xImageFile;
}

- (void)setIphone2xImageFile:(id)a3
{
}

- (WFFileRepresentation)iphone2xImageFile
{
  return self->_iphone2xImageFile;
}

- (CKRecordID)detailPage
{
  return self->_detailPage;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)name
{
  return self->_name;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [+[WFMutableGalleryBanner allocWithZone:](WFMutableGalleryBanner, "allocWithZone:") init];
  v6 = [(WFGalleryBanner *)self identifier];
  v7 = (void *)[v6 copyWithZone:a3];
  [(WFMutableGalleryBanner *)v5 setIdentifier:v7];

  v8 = [(WFGalleryBanner *)self name];
  v9 = (void *)[v8 copyWithZone:a3];
  [(WFMutableGalleryBanner *)v5 setName:v9];

  v10 = [(WFGalleryBanner *)self subtitle];
  v11 = (void *)[v10 copyWithZone:a3];
  [(WFMutableGalleryBanner *)v5 setSubtitle:v11];

  v12 = [(WFGalleryBanner *)self detailPage];
  [(WFMutableGalleryBanner *)v5 setDetailPage:v12];

  v13 = [(WFGalleryBanner *)self language];
  v14 = (void *)[v13 copyWithZone:a3];
  [(WFMutableGalleryBanner *)v5 setLanguage:v14];

  v15 = [(WFGalleryBanner *)self base];
  [(WFMutableGalleryBanner *)v5 setBase:v15];

  v16 = [(WFGalleryBanner *)self persistentIdentifier];
  v17 = (void *)[v16 copyWithZone:a3];
  [(WFMutableGalleryBanner *)v5 setPersistentIdentifier:v17];

  v18 = [(WFGalleryBanner *)self ipad2xImageFile];
  v19 = (void *)[v18 copyWithZone:a3];
  [(WFGalleryBanner *)v5 setIpad2xImageFile:v19];

  v20 = [(WFGalleryBanner *)self iphone2xImageFile];
  v21 = (void *)[v20 copyWithZone:a3];
  [(WFGalleryBanner *)v5 setIphone2xImageFile:v21];

  v22 = [(WFGalleryBanner *)self iphone3xImageFile];
  v23 = (void *)[v22 copyWithZone:a3];
  [(WFGalleryBanner *)v5 setIphone3xImageFile:v23];

  v24 = [(WFGalleryBanner *)self supportedIdioms];
  v25 = (void *)[v24 copyWithZone:a3];
  [(WFMutableGalleryBanner *)v5 setSupportedIdioms:v25];

  return v5;
}

+ (CGSize)pixelSizeForBannerSize:(int64_t)a3
{
  objc_msgSend(a1, "pointSizeForBannerSize:");
  double v6 = v5;
  double v8 = v7;
  [a1 scaleForBannerSize:a3];
  CGAffineTransformMakeScale(&v12, v9, v9);
  double v10 = v8 * v12.c + v12.a * v6;
  double v11 = v8 * v12.d + v12.b * v6;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (CGSize)pointSizeForBannerSize:(int64_t)a3
{
  double v3 = dbl_1C856C720[a3 == 2];
  double v4 = 150.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)scaleForBannerSize:(int64_t)a3
{
  double result = 2.0;
  if (a3 == 1) {
    return 3.0;
  }
  return result;
}

+ (id)propertyForSize:(int64_t)a3
{
  double v3 = @"iphone2xImage";
  if (a3 == 1) {
    double v3 = @"iphone3xImage";
  }
  if (a3 == 2) {
    return @"ipad2xImage";
  }
  else {
    return v3;
  }
}

+ (NSDictionary)properties
{
  v19[10] = *MEMORY[0x1E4F143B8];
  v18[0] = @"name";
  v17 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v19[0] = v17;
  v18[1] = @"subtitle";
  v16 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v19[1] = v16;
  v18[2] = @"detailPage";
  v15 = +[WFCloudKitItemProperty itemReferencePropertyWithName:@"detailPage" itemClass:objc_opt_class()];
  v19[2] = v15;
  v18[3] = @"iphone2xImage";
  uint64_t v2 = *MEMORY[0x1E4F44400];
  v14 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44400]];
  double v3 = +[WFCloudKitItemProperty assetPropertyWithName:@"iphone2xImageFile" fileType:v14 ignoredByDefault:1 encrypted:0];
  v19[3] = v3;
  v18[4] = @"iphone3xImage";
  double v4 = [MEMORY[0x1E4FB4718] typeWithUTType:v2];
  double v5 = +[WFCloudKitItemProperty assetPropertyWithName:@"iphone3xImageFile" fileType:v4 ignoredByDefault:1 encrypted:0];
  v19[4] = v5;
  v18[5] = @"ipad2xImage";
  double v6 = [MEMORY[0x1E4FB4718] typeWithUTType:v2];
  double v7 = +[WFCloudKitItemProperty assetPropertyWithName:@"ipad2xImageFile" fileType:v6 ignoredByDefault:1 encrypted:0];
  v19[5] = v7;
  v18[6] = @"language";
  double v8 = +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v19[6] = v8;
  v18[7] = @"base";
  CGFloat v9 = +[WFCloudKitItemProperty itemReferencePropertyWithName:@"base" itemClass:objc_opt_class()];
  v19[7] = v9;
  v18[8] = @"persistentIdentifier";
  double v10 = +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v19[8] = v10;
  v18[9] = @"supportedIdioms";
  double v11 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v19[9] = v11;
  CGAffineTransform v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:10];

  return (NSDictionary *)v12;
}

+ (NSString)recordType
{
  return (NSString *)@"GalleryBanner";
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = [+[WFGalleryBanner allocWithZone:](WFGalleryBanner, "allocWithZone:") init];
  double v6 = [(WFGalleryBanner *)self identifier];
  uint64_t v7 = [v6 copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (CKRecordID *)v7;

  CGFloat v9 = [(WFGalleryBanner *)self name];
  uint64_t v10 = [v9 copyWithZone:a3];
  name = v5->_name;
  v5->_name = (NSString *)v10;

  CGAffineTransform v12 = [(WFGalleryBanner *)self subtitle];
  uint64_t v13 = [v12 copyWithZone:a3];
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v13;

  uint64_t v15 = [(WFGalleryBanner *)self detailPage];
  detailPage = v5->_detailPage;
  v5->_detailPage = (CKRecordID *)v15;

  v17 = [(WFGalleryBanner *)self language];
  uint64_t v18 = [v17 copyWithZone:a3];
  language = v5->_language;
  v5->_language = (NSString *)v18;

  uint64_t v20 = [(WFGalleryBanner *)self base];
  base = v5->_base;
  v5->_base = (CKRecordID *)v20;

  v22 = [(WFGalleryBanner *)self persistentIdentifier];
  uint64_t v23 = [v22 copyWithZone:a3];
  persistentIdentifier = v5->_persistentIdentifier;
  v5->_persistentIdentifier = (NSString *)v23;

  v25 = [(WFGalleryBanner *)self ipad2xImageFile];
  uint64_t v26 = [v25 copyWithZone:a3];
  ipad2xImageFile = v5->_ipad2xImageFile;
  v5->_ipad2xImageFile = (WFFileRepresentation *)v26;

  v28 = [(WFGalleryBanner *)self iphone2xImageFile];
  uint64_t v29 = [v28 copyWithZone:a3];
  iphone2xImageFile = v5->_iphone2xImageFile;
  v5->_iphone2xImageFile = (WFFileRepresentation *)v29;

  v31 = [(WFGalleryBanner *)self iphone3xImageFile];
  uint64_t v32 = [v31 copyWithZone:a3];
  iphone3xImageFile = v5->_iphone3xImageFile;
  v5->_iphone3xImageFile = (WFFileRepresentation *)v32;

  v34 = [(WFGalleryBanner *)self supportedIdioms];
  uint64_t v35 = [v34 copyWithZone:a3];
  supportedIdioms = v5->_supportedIdioms;
  v5->_supportedIdioms = (NSArray *)v35;

  return v5;
}

- (id)imageForSize:(int64_t)a3
{
  double v3 = [(WFGalleryBanner *)self imageFileForSize:a3];
  double v4 = v3;
  if (v3)
  {
    double v5 = (void *)MEMORY[0x1E4FB4770];
    double v6 = [v3 mappedData];
    uint64_t v7 = [v5 imageWithData:v6 scale:0 allowAnimated:1.0];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)imageFileForSize:(int64_t)a3
{
  if (a3 == 2)
  {
    double v3 = [(WFGalleryBanner *)self ipad2xImageFile];
  }
  else if (a3 == 1)
  {
    double v3 = [(WFGalleryBanner *)self iphone3xImageFile];
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    double v3 = [(WFGalleryBanner *)self iphone2xImageFile];
  }
  a2 = v3;
LABEL_8:
  return (id)(id)a2;
}

- (unint64_t)referenceActionForKey:(id)a3
{
  return [a3 isEqualToString:@"base"];
}

@end