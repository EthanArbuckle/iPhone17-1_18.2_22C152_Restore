@interface DOCImageMetadataProvider
+ (id)imageMetadataProviderWithNode:(id)a3 levelOfDetail:(int64_t)a4 URL:(id)a5;
- (BOOL)readTag:(CGImageMetadataTag *)a3 path:(id)a4 title:(id *)a5 value:(id *)a6;
- (NSArray)displaySortOrder;
- (NSDictionary)metadataValues;
- (id)compactMetadataValues;
- (id)fullMetadataValues;
- (void)addCGExifPropertiesToDictionary:(id)a3;
- (void)addColorInfoToDictionary:(id)a3;
- (void)addCreditTypeToDictionary:(id)a3;
- (void)addDigitalSourceTypeToDictionary:(id)a3;
- (void)addFlashProperitesToDictionary:(id)a3;
- (void)addGPSInfoToDictionary:(id)a3;
- (void)addHasAlphaToDictionary:(id)a3;
- (void)addHasDPIToDictionary:(id)a3;
- (void)addHasSizeToDictionary:(id)a3;
- (void)dealloc;
@end

@implementation DOCImageMetadataProvider

+ (id)imageMetadataProviderWithNode:(id)a3 levelOfDetail:(int64_t)a4 URL:(id)a5
{
  id v7 = a3;
  CFURLRef v8 = (const __CFURL *)a5;
  if (!v8) {
    goto LABEL_9;
  }
  if (qword_10071D3B0 != -1) {
    dispatch_once(&qword_10071D3B0, &stru_100688EB0);
  }
  v9 = (void *)qword_10071D3A8;
  v10 = [v7 contentType];
  v11 = [v10 identifier];
  LODWORD(v9) = [v9 containsObject:v11];

  if (!v9)
  {
LABEL_9:
    uint64_t v13 = 0;
    goto LABEL_13;
  }
  v12 = CGImageSourceCreateWithURL(v8, 0);
  uint64_t v13 = (uint64_t)v12;
  if (!v12) {
    goto LABEL_13;
  }
  CFDictionaryRef v14 = CGImageSourceCopyPropertiesAtIndex(v12, 0, 0);
  if (!v14)
  {
    CFRelease((CFTypeRef)v13);
    goto LABEL_11;
  }
  CGImageMetadataRef v15 = CGImageSourceCopyMetadataAtIndex((CGImageSourceRef)v13, 0, 0);
  CFRelease((CFTypeRef)v13);
  if (!v15)
  {
LABEL_11:
    uint64_t v13 = 0;
    goto LABEL_12;
  }
  uint64_t v13 = objc_opt_new();
  *(void *)(v13 + 24) = a4;
  objc_storeStrong((id *)(v13 + 8), v14);
  *(void *)(v13 + 16) = v15;
LABEL_12:

LABEL_13:

  return (id)v13;
}

- (void)dealloc
{
  CFRelease(self->_metadata);
  v3.receiver = self;
  v3.super_class = (Class)DOCImageMetadataProvider;
  [(DOCImageMetadataProvider *)&v3 dealloc];
}

- (void)addHasSizeToDictionary:(id)a3
{
  imageProperties = self->_imageProperties;
  id v5 = a3;
  id v11 = [(NSDictionary *)imageProperties objectForKeyedSubscript:kCGImagePropertyPixelWidth];
  if (v11) {
    [v11 floatValue];
  }
  v6 = [(NSDictionary *)self->_imageProperties objectForKeyedSubscript:kCGImagePropertyPixelHeight];
  id v7 = v6;
  if (v6) {
    [v6 floatValue];
  }
  CFURLRef v8 = [(NSDictionary *)self->_imageProperties objectForKeyedSubscript:kCGImagePropertyOrientation];
  v9 = v8;
  if (v8) {
    [v8 intValue];
  }
  v10 = DOCLocalizedMetadataStringForWidthByHeight();
  [v5 setObject:v10 forKeyedSubscript:@"Dimensions"];
}

- (void)addHasDPIToDictionary:(id)a3
{
  id v18 = a3;
  v4 = [(NSDictionary *)self->_imageProperties objectForKeyedSubscript:kCGImagePropertyDPIWidth];
  id v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }
  CFURLRef v8 = [(NSDictionary *)self->_imageProperties objectForKeyedSubscript:kCGImagePropertyDPIHeight];
  v9 = v8;
  if (v8)
  {
    [v8 floatValue];
    if (v7 > 0.0 && v10 > 0.0)
    {
      double v11 = v10;
      v12 = [(NSDictionary *)self->_imageProperties objectForKeyedSubscript:kCGImagePropertyOrientation];
      uint64_t v13 = v12;
      if (v12)
      {
        unsigned int v14 = [v12 intValue];
        BOOL v15 = v14 == 8 || v14 == 6;
        if (v15) {
          double v16 = v7;
        }
        else {
          double v16 = v11;
        }
        if (v15) {
          double v7 = v11;
        }
        double v11 = v16;
      }
      v17 = +[NSString stringWithFormat:@"%d × %d", (int)v7, (int)v11];
      [v18 setObject:v17 forKeyedSubscript:@"Resolution"];
    }
  }
}

- (void)addHasAlphaToDictionary:(id)a3
{
  id v7 = a3;
  v4 = [(NSDictionary *)self->_imageProperties objectForKeyedSubscript:kCGImagePropertyHasAlpha];
  id v5 = v4;
  if (v4)
  {
    [v4 BOOLValue];
    float v6 = DOCLocalizedMetadataYesNoStringForBool();
    [v7 setObject:v6 forKeyedSubscript:@"hasAlpha"];
  }
}

- (void)addColorInfoToDictionary:(id)a3
{
  id v6 = a3;
  v4 = [(NSDictionary *)self->_imageProperties objectForKeyedSubscript:kCGImagePropertyNamedColorSpace];
  if (v4) {
    [v6 setObject:v4 forKeyedSubscript:@"ColorSpace"];
  }
  id v5 = [(NSDictionary *)self->_imageProperties objectForKeyedSubscript:kCGImagePropertyProfileName];
  if (v5) {
    [v6 setObject:v5 forKeyedSubscript:@"ColorProfile"];
  }
}

- (void)addCGExifPropertiesToDictionary:(id)a3
{
  id v28 = a3;
  v4 = [(NSDictionary *)self->_imageProperties objectForKeyedSubscript:kCGImagePropertyExifDictionary];
  if (v4)
  {
    id v5 = objc_opt_new();
    [v5 setMaxFractionalDigits:4];
    id v6 = [v4 objectForKeyedSubscript:kCGImagePropertyExifApertureValue];
    id v7 = [v5 displayStringForMetadataValue:v6];
    [v28 setObject:v7 forKeyedSubscript:@"ApertureValue"];

    CFURLRef v8 = [v4 objectForKeyedSubscript:kCGImagePropertyExifExposureProgram];
    v9 = DOCLocalizedMetadataStringForExposureProgramNumber();
    [v28 setObject:v9 forKeyedSubscript:@"ExposureProgram"];

    float v10 = objc_opt_new();
    [v10 setMaxFractionalDigits:4];
    [v10 setPrefersIntegerFractionalDisplay:1];
    double v11 = [v4 objectForKeyedSubscript:kCGImagePropertyExifExposureTime];
    v12 = [v10 displayStringForMetadataValue:v11];
    [v28 setObject:v12 forKeyedSubscript:@"ExposureTime"];

    uint64_t v13 = objc_opt_new();
    [v13 setMaxFractionalDigits:4];
    [v13 setLengthUnits:8];
    unsigned int v14 = [v4 objectForKeyedSubscript:kCGImagePropertyExifFocalLength];
    BOOL v15 = [v13 displayStringForMetadataValue:v14];
    [v28 setObject:v15 forKeyedSubscript:@"FocalLength"];

    double v16 = objc_opt_new();
    [v16 setMaxFractionalDigits:2];
    v17 = _DocumentManagerBundle();
    id v18 = [v17 localizedStringForKey:@"f/%1$@" value:@"f/%1$@" table:@"Localizable"];

    [v16 setDecimalFormatString:v18];
    v19 = [v4 objectForKeyedSubscript:kCGImagePropertyExifFNumber];
    v20 = [v16 displayStringForMetadataValue:v19];
    [v28 setObject:v20 forKeyedSubscript:@"FNumber"];

    v21 = [v4 objectForKeyedSubscript:kCGImagePropertyExifMeteringMode];
    v22 = DOCLocalizedMetadataStringForMeteringModeNumber();
    [v28 setObject:v22 forKeyedSubscript:@"MeteringMode"];

    v23 = [v4 objectForKeyedSubscript:kCGImagePropertyExifISOSpeedRatings];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v24 = [v23 firstObject];

      v23 = (void *)v24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [v23 description];
      [v28 setObject:v25 forKeyedSubscript:@"ISOSpeed"];
    }
    v26 = [v4 objectForKeyedSubscript:kCGImagePropertyExifWhiteBalance];
    v27 = DOCLocalizedMetadataStringForWhiteBalanceModeNumber();
    [v28 setObject:v27 forKeyedSubscript:@"WhiteBalance"];
  }
}

- (void)addFlashProperitesToDictionary:(id)a3
{
  id v10 = a3;
  v4 = [(NSDictionary *)self->_imageProperties objectForKeyedSubscript:kCGImagePropertyExifDictionary];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:kCGImagePropertyExifFlash];
    id v7 = v6;
    if (v6)
    {
      [v6 integerValue];
      CFURLRef v8 = DOCLocalizedMetadataYesNoStringForBool();
      [v10 setObject:v8 forKeyedSubscript:@"Flash"];

      v9 = DOCLocalizedMetadataYesNoStringForBool();
      [v10 setObject:v9 forKeyedSubscript:@"FlashRedEye"];
    }
  }
}

- (void)addGPSInfoToDictionary:(id)a3
{
  id v3 = a3;
  if (DOCSpotlightGPSInfoFromCGImagePropertyDictionary())
  {
    v4 = DOCLocalizedMetadataStringForLatitude();
    id v5 = DOCLocalizedMetadataStringForLongitude();
    if (objc_msgSend(v4, "length", 0, 0) && objc_msgSend(v5, "length"))
    {
      [v3 setObject:v4 forKeyedSubscript:@"GPSLatitude"];
      [v3 setObject:v5 forKeyedSubscript:@"GPSLongitude"];
    }
  }
}

- (void)addDigitalSourceTypeToDictionary:(id)a3
{
  id v6 = a3;
  v4 = [(NSDictionary *)self->_imageProperties objectForKeyedSubscript:kCGImagePropertyIPTCDictionary];
  id v5 = [v4 objectForKeyedSubscript:kCGImagePropertyIPTCExtDigitalSourceType];
  if (v5) {
    [v6 setObject:v5 forKeyedSubscript:@"DigitalSourceType"];
  }
}

- (void)addCreditTypeToDictionary:(id)a3
{
  id v6 = a3;
  v4 = [(NSDictionary *)self->_imageProperties objectForKeyedSubscript:kCGImagePropertyIPTCDictionary];
  id v5 = [v4 objectForKeyedSubscript:kCGImagePropertyIPTCCredit];
  if (v5) {
    [v6 setObject:v5 forKeyedSubscript:@"Credit"];
  }
}

- (BOOL)readTag:(CGImageMetadataTag *)a3 path:(id)a4 title:(id *)a5 value:(id *)a6
{
  id v9 = a4;
  *a5 = (id)(id)CGImageMetadataTagCopyName(a3);
  id v10 = (void *)CGImageMetadataTagCopyValue(a3);
  LODWORD(a3) = [&__NSArray0__struct containsObject:v9];

  if a3 && (objc_opt_respondsToSelector())
  {
    [v10 BOOLValue];
    DOCLocalizedMetadataYesNoStringForBool();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v10;
  }
  *a6 = v11;

  return 1;
}

- (NSArray)displaySortOrder
{
  v4[0] = @"Dimensions";
  v4[1] = @"Resolution";
  v4[2] = @"ColorSpace";
  v4[3] = @"ColorProfile";
  v4[4] = @"hasAlpha";
  v4[5] = @"Make";
  v4[6] = @"Model";
  v4[7] = @"LensModel";
  v4[8] = @"ApertureValue";
  v4[9] = @"ExposureTime";
  v4[10] = @"ExposureProgram";
  v4[11] = @"FocalLength";
  v4[12] = @"ISOSpeed";
  v4[13] = @"Flash";
  v4[14] = @"FlashRedEye";
  v4[15] = @"FNumber";
  v4[16] = @"MeteringMode";
  v4[17] = @"WhiteBalance";
  v4[18] = @"Credit";
  v4[19] = @"CreatorTool";
  v4[20] = @"DigitalSourceType";
  v4[21] = @"GPSLatitude";
  v4[22] = @"GPSLongitude";
  v2 = +[NSArray arrayWithObjects:v4 count:23];

  return (NSArray *)v2;
}

- (NSDictionary)metadataValues
{
  int64_t levelOfDetail = self->_levelOfDetail;
  if (levelOfDetail)
  {
    if (levelOfDetail != 1) {
      goto LABEL_6;
    }
    id v3 = [(DOCImageMetadataProvider *)self fullMetadataValues];
  }
  else
  {
    id v3 = [(DOCImageMetadataProvider *)self compactMetadataValues];
  }
  a2 = v3;
LABEL_6:

  return (NSDictionary *)(id)a2;
}

- (id)compactMetadataValues
{
  id v3 = objc_opt_new();
  [(DOCImageMetadataProvider *)self addHasSizeToDictionary:v3];

  return v3;
}

- (id)fullMetadataValues
{
  id v3 = objc_opt_new();
  [(DOCImageMetadataProvider *)self addHasSizeToDictionary:v3];
  [(DOCImageMetadataProvider *)self addHasDPIToDictionary:v3];
  [(DOCImageMetadataProvider *)self addHasAlphaToDictionary:v3];
  [(DOCImageMetadataProvider *)self addColorInfoToDictionary:v3];
  [(DOCImageMetadataProvider *)self addGPSInfoToDictionary:v3];
  [(DOCImageMetadataProvider *)self addCGExifPropertiesToDictionary:v3];
  [(DOCImageMetadataProvider *)self addFlashProperitesToDictionary:v3];
  [(DOCImageMetadataProvider *)self addCreditTypeToDictionary:v3];
  [(DOCImageMetadataProvider *)self addDigitalSourceTypeToDictionary:v3];
  v4 = +[NSMutableSet setWithObjects:@"exifEX:LensModel", @"tiff:Model", @"tiff:Make", @"xmp:CreatorTool", 0];
  metadata = self->_metadata;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DDC54;
  block[3] = &unk_100688ED8;
  id v12 = v4;
  uint64_t v13 = self;
  id v6 = v3;
  id v14 = v6;
  id v7 = v4;
  CGImageMetadataEnumerateTagsUsingBlock(metadata, 0, 0, block);
  CFURLRef v8 = v14;
  id v9 = v6;

  return v9;
}

- (void).cxx_destruct
{
}

@end