@interface PVImage
+ (PVImage)imageWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 adjustmentVersion:(id)a5 creationDate:(id)a6;
+ (PVImage)imageWithCIImage:(id)a3 assetWidth:(unint64_t)a4 assetHeight:(unint64_t)a5 orientation:(unsigned int)a6 adjustmentVersion:(id)a7 creationDate:(id)a8;
+ (PVImage)imageWithData:(id)a3 imageCreationOptions:(id)a4 assetWidth:(unint64_t)a5 assetHeight:(unint64_t)a6 adjustmentVersion:(id)a7 creationDate:(id)a8;
+ (PVImage)imageWithURL:(id)a3 assetWidth:(unint64_t)a4 assetHeight:(unint64_t)a5 imageCreationOptions:(id)a6 adjustmentVersion:(id)a7 creationDate:(id)a8;
- (CGImage)CGImage;
- (CGRect)imageRectForNormalizedRect:(CGRect)a3;
- (CIImage)CIImage;
- (NSData)imageData;
- (NSString)groupingIdentifier;
- (NSURL)imageURL;
- (PVImage)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 adjustmentVersion:(id)a5 creationDate:(id)a6;
- (PVImage)initWithCIImage:(id)a3 assetWidth:(unint64_t)a4 assetHeight:(unint64_t)a5 orientation:(unsigned int)a6 adjustmentVersion:(id)a7 creationDate:(id)a8;
- (PVImage)initWithData:(id)a3 imageCreationOptions:(id)a4 assetWidth:(unint64_t)a5 assetHeight:(unint64_t)a6 adjustmentVersion:(id)a7 creationDate:(id)a8;
- (PVImage)initWithURL:(id)a3 assetWidth:(unint64_t)a4 assetHeight:(unint64_t)a5 imageCreationOptions:(id)a6 adjustmentVersion:(id)a7 creationDate:(id)a8;
- (id)adjustmentVersion;
- (unint64_t)assetHeight;
- (unint64_t)assetWidth;
- (unint64_t)bytesPerRow;
- (unint64_t)height;
- (unint64_t)orientedHeight;
- (unint64_t)orientedWidth;
- (unint64_t)width;
- (unsigned)orientation;
- (void)dealloc;
@end

@implementation PVImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_CIImage, 0);
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);

  objc_storeStrong(&self->_adjustmentVersion, 0);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (CGImage)CGImage
{
  return self->_CGImage;
}

- (CIImage)CIImage
{
  return self->_CIImage;
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (id)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (unint64_t)orientedHeight
{
  return self->_orientedHeight;
}

- (unint64_t)orientedWidth
{
  return self->_orientedWidth;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)assetHeight
{
  return self->_assetHeight;
}

- (unint64_t)assetWidth
{
  return self->_assetWidth;
}

- (CGRect)imageRectForNormalizedRect:(CGRect)a3
{
  double x = a3.origin.x;
  BOOL v4 = a3.origin.x >= 0.0 && a3.origin.x <= 1.0;
  if (v4
    && ((double y = a3.origin.y, a3.origin.y >= 0.0) ? (v6 = a3.origin.y <= 1.0) : (v6 = 0),
        v6
     && (double width = a3.size.width, a3.size.width >= 0.0)
     && a3.size.width <= 1.0
     && (double height = a3.size.height, a3.size.height >= 0.0)
     && a3.size.height <= 1.0))
  {
    double v10 = (double)[(PVImage *)self orientedWidth];
    unint64_t v11 = [(PVImage *)self orientedHeight];
    if (v10 >= (double)v11) {
      double v12 = v10;
    }
    else {
      double v12 = (double)v11;
    }
    double v13 = x * v10;
    double v14 = width * v12;
    double v15 = y * (double)v11;
    double v16 = height * v12;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB20];
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v16;
  result.size.double width = v14;
  result.origin.double y = v15;
  result.origin.double x = v13;
  return result;
}

- (void)dealloc
{
  CGImageRelease(self->_CGImage);
  v3.receiver = self;
  v3.super_class = (Class)PVImage;
  [(PVImage *)&v3 dealloc];
}

- (PVImage)initWithURL:(id)a3 assetWidth:(unint64_t)a4 assetHeight:(unint64_t)a5 imageCreationOptions:(id)a6 adjustmentVersion:(id)a7 creationDate:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  CFURLRef v14 = (const __CFURL *)a3;
  CFDictionaryRef v15 = (const __CFDictionary *)a6;
  id v16 = a7;
  id v17 = a8;
  if (v14)
  {
    v40.receiver = self;
    v40.super_class = (Class)PVImage;
    v18 = [(PVImage *)&v40 init];
    if (v18)
    {
      v19 = CGImageSourceCreateWithURL(v14, v15);
      if (v19)
      {
        v20 = v19;
        unint64_t v39 = a5;
        v21 = CGImageSourceCopyMetadataAtIndex(v19, 0, 0);
        if (v21)
        {
          v22 = v21;
          CFStringRef v23 = CGImageMetadataCopyStringValueWithPath(v21, 0, @"tiff:Orientation");
          if (v23)
          {
            CFStringRef v24 = v23;
            SInt32 IntValue = CFStringGetIntValue(v23);
            if ((IntValue - 9) <= 0xFFFFFFF7)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                SInt32 v42 = IntValue;
                _os_log_error_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ERROR: Invalid orientation found: %d. Using a default value of 1", buf, 8u);
              }
              SInt32 IntValue = 1;
            }
            CFRelease(v24);
          }
          else
          {
            SInt32 IntValue = 1;
          }
          CFRelease(v22);
        }
        else
        {
          SInt32 IntValue = 1;
        }
        ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v20, 0, v15);
        if (ImageAtIndex)
        {
          v28 = ImageAtIndex;
          v18->_double width = CGImageGetWidth(ImageAtIndex);
          v18->_double height = CGImageGetHeight(v28);
          v18->_CGImage = v28;
        }
        CFRelease(v20);
        uint64_t v29 = [(__CFURL *)v14 copy];
        imageURL = v18->_imageURL;
        v18->_imageURL = (NSURL *)v29;

        v18->_assetWidth = a4;
        v18->_assetHeight = v39;
        uint64_t v31 = [v16 copy];
        id adjustmentVersion = v18->_adjustmentVersion;
        v18->_id adjustmentVersion = (id)v31;

        uint64_t v33 = GroupingIdentifierFromDate(v17);
        groupingIdentifier = v18->_groupingIdentifier;
        v18->_groupingIdentifier = (NSString *)v33;

        v18->_orientation = IntValue;
        uint64_t v35 = 32;
        if ((IntValue - 5) >= 4) {
          uint64_t v36 = 32;
        }
        else {
          uint64_t v36 = 40;
        }
        if ((IntValue - 5) >= 4) {
          uint64_t v35 = 40;
        }
        unint64_t v37 = *(unint64_t *)((char *)&v18->super.isa + v35);
        v18->_orientedWidth = *(unint64_t *)((char *)&v18->super.isa + v36);
        v18->_orientedHeight = v37;
      }
      else
      {

        v18 = 0;
      }
    }
    self = v18;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (PVImage)initWithData:(id)a3 imageCreationOptions:(id)a4 assetWidth:(unint64_t)a5 assetHeight:(unint64_t)a6 adjustmentVersion:(id)a7 creationDate:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  CFDataRef v15 = (const __CFData *)a3;
  CFDictionaryRef v16 = (const __CFDictionary *)a4;
  id v17 = a7;
  id v18 = a8;
  if (v15)
  {
    v40.receiver = self;
    v40.super_class = (Class)PVImage;
    v19 = [(PVImage *)&v40 init];
    if (v19)
    {
      v20 = CGImageSourceCreateWithData(v15, v16);
      if (v20)
      {
        v21 = v20;
        unint64_t v39 = a5;
        v22 = CGImageSourceCopyMetadataAtIndex(v20, 0, 0);
        if (v22)
        {
          CFStringRef v23 = v22;
          unint64_t v38 = a6;
          CFStringRef v24 = CGImageMetadataCopyStringValueWithPath(v22, 0, @"tiff:Orientation");
          if (v24)
          {
            CFStringRef v25 = v24;
            SInt32 IntValue = CFStringGetIntValue(v24);
            if ((IntValue - 9) <= 0xFFFFFFF7)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                SInt32 v42 = IntValue;
                _os_log_error_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "ERROR: Invalid orientation found: %d. Using a default value of 1", buf, 8u);
              }
              SInt32 IntValue = 1;
            }
            CFRelease(v25);
          }
          else
          {
            SInt32 IntValue = 1;
          }
          CFRelease(v23);
          a6 = v38;
        }
        else
        {
          SInt32 IntValue = 1;
        }
        ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(v21, 0, v16);
        if (ImageAtIndex)
        {
          uint64_t v29 = ImageAtIndex;
          v19->_CGImage = ImageAtIndex;
          v19->_double width = CGImageGetWidth(ImageAtIndex);
          v19->_double height = CGImageGetHeight(v29);
          v19->_assetWidth = v39;
          v19->_assetHeight = a6;
        }
        CFRelease(v21);
        objc_storeStrong((id *)&v19->_imageData, a3);
        uint64_t v30 = [v17 copy];
        id adjustmentVersion = v19->_adjustmentVersion;
        v19->_id adjustmentVersion = (id)v30;

        uint64_t v32 = GroupingIdentifierFromDate(v18);
        groupingIdentifier = v19->_groupingIdentifier;
        v19->_groupingIdentifier = (NSString *)v32;

        v19->_orientation = IntValue;
        uint64_t v34 = 32;
        if ((IntValue - 5) >= 4) {
          uint64_t v35 = 32;
        }
        else {
          uint64_t v35 = 40;
        }
        if ((IntValue - 5) >= 4) {
          uint64_t v34 = 40;
        }
        unint64_t v36 = *(unint64_t *)((char *)&v19->super.isa + v34);
        v19->_orientedWidth = *(unint64_t *)((char *)&v19->super.isa + v35);
        v19->_orientedHeight = v36;
      }
      else
      {

        v19 = 0;
      }
    }
    self = v19;
    v27 = self;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (PVImage)initWithCIImage:(id)a3 assetWidth:(unint64_t)a4 assetHeight:(unint64_t)a5 orientation:(unsigned int)a6 adjustmentVersion:(id)a7 creationDate:(id)a8
{
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (v15)
  {
    v32.receiver = self;
    v32.super_class = (Class)PVImage;
    id v18 = [(PVImage *)&v32 init];
    if (v18)
    {
      [v15 extent];
      double v20 = v19;
      double v22 = v21;
      objc_storeStrong((id *)&v18->_CIImage, a3);
      v18->_double width = (unint64_t)v20;
      v18->_double height = (unint64_t)v22;
      v18->_assetWidth = a4;
      v18->_assetHeight = a5;
      uint64_t v23 = [v16 copy];
      id adjustmentVersion = v18->_adjustmentVersion;
      v18->_id adjustmentVersion = (id)v23;

      uint64_t v25 = GroupingIdentifierFromDate(v17);
      groupingIdentifier = v18->_groupingIdentifier;
      v18->_groupingIdentifier = (NSString *)v25;

      v18->_orientation = a6;
      uint64_t v27 = 32;
      if (a6 - 5 >= 4) {
        uint64_t v28 = 32;
      }
      else {
        uint64_t v28 = 40;
      }
      if (a6 - 5 >= 4) {
        uint64_t v27 = 40;
      }
      unint64_t v29 = *(unint64_t *)((char *)&v18->super.isa + v27);
      v18->_orientedWidth = *(unint64_t *)((char *)&v18->super.isa + v28);
      v18->_orientedHeight = v29;
    }
    self = v18;
    uint64_t v30 = self;
  }
  else
  {
    uint64_t v30 = 0;
  }

  return v30;
}

- (PVImage)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 adjustmentVersion:(id)a5 creationDate:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (a3)
  {
    v25.receiver = self;
    v25.super_class = (Class)PVImage;
    double v12 = [(PVImage *)&v25 init];
    if (v12)
    {
      CGImageRetain(a3);
      v12->_CGImage = a3;
      v12->_unint64_t width = CGImageGetWidth(a3);
      size_t Height = CGImageGetHeight(a3);
      v12->_double height = Height;
      unint64_t width = v12->_width;
      if (a4 - 5 >= 4) {
        unint64_t v15 = v12->_width;
      }
      else {
        unint64_t v15 = Height;
      }
      if (a4 - 5 >= 4) {
        unint64_t width = Height;
      }
      v12->_assetWidth = v15;
      v12->_assetsize_t Height = width;
      if (a4 - 5 >= 4) {
        uint64_t v16 = 32;
      }
      else {
        uint64_t v16 = 40;
      }
      if (a4 - 5 >= 4) {
        uint64_t v17 = 40;
      }
      else {
        uint64_t v17 = 32;
      }
      v12->_bytesPerRow = CGImageGetBytesPerRow(a3);
      uint64_t v18 = [v10 copy];
      id adjustmentVersion = v12->_adjustmentVersion;
      v12->_id adjustmentVersion = (id)v18;

      uint64_t v20 = GroupingIdentifierFromDate(v11);
      groupingIdentifier = v12->_groupingIdentifier;
      v12->_groupingIdentifier = (NSString *)v20;

      v12->_orientation = a4;
      unint64_t v22 = *(unint64_t *)((char *)&v12->super.isa + v17);
      v12->_orientedWidth = *(unint64_t *)((char *)&v12->super.isa + v16);
      v12->_orientedsize_t Height = v22;
    }
    self = v12;
    uint64_t v23 = self;
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

+ (PVImage)imageWithData:(id)a3 imageCreationOptions:(id)a4 assetWidth:(unint64_t)a5 assetHeight:(unint64_t)a6 adjustmentVersion:(id)a7 creationDate:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = [[PVImage alloc] initWithData:v16 imageCreationOptions:v15 assetWidth:a5 assetHeight:a6 adjustmentVersion:v14 creationDate:v13];

  return v17;
}

+ (PVImage)imageWithURL:(id)a3 assetWidth:(unint64_t)a4 assetHeight:(unint64_t)a5 imageCreationOptions:(id)a6 adjustmentVersion:(id)a7 creationDate:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a3;
  uint64_t v17 = [[PVImage alloc] initWithURL:v16 assetWidth:a4 assetHeight:a5 imageCreationOptions:v15 adjustmentVersion:v14 creationDate:v13];

  return v17;
}

+ (PVImage)imageWithCIImage:(id)a3 assetWidth:(unint64_t)a4 assetHeight:(unint64_t)a5 orientation:(unsigned int)a6 adjustmentVersion:(id)a7 creationDate:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  id v13 = a8;
  id v14 = a7;
  id v15 = a3;
  id v16 = [[PVImage alloc] initWithCIImage:v15 assetWidth:a4 assetHeight:a5 orientation:v9 adjustmentVersion:v14 creationDate:v13];

  return v16;
}

+ (PVImage)imageWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 adjustmentVersion:(id)a5 creationDate:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = [[PVImage alloc] initWithCGImage:a3 orientation:v7 adjustmentVersion:v10 creationDate:v9];

  return v11;
}

@end