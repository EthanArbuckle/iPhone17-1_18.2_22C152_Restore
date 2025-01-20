@interface SBFCARendererImageRepresentation
+ (BOOL)supportsSecureCoding;
+ (id)representationWithFileURL:(id)a3 imageOrientation:(int64_t)a4;
+ (id)representationWithIOSurface:(id)a3 imageOrientation:(int64_t)a4;
+ (id)representationWithImage:(id)a3;
+ (id)representationWithImageData:(id)a3 imageOrientation:(int64_t)a4;
- (CGImage)createCGImageReturningScale:(double *)a3;
- (IOSurface)surface;
- (NSData)imageData;
- (NSURL)fileURL;
- (SBFCARendererImageRepresentation)initWithCoder:(id)a3;
- (int64_t)imageOrientation;
- (int64_t)representationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBFCARendererImageRepresentation

+ (id)representationWithImage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 ioSurface];
    if (v6)
    {
      v7 = objc_msgSend(a1, "representationWithIOSurface:imageOrientation:", v6, objc_msgSend(v5, "imageOrientation"));
    }
    else
    {
      v8 = v5;
      [(UIImage *)v8 CGImage];
      v9 = (void *)CGImageCopySourceData();
      v10 = v9;
      if (v9 && [v9 length])
      {
        v7 = objc_msgSend(a1, "representationWithImageData:imageOrientation:", v10, -[UIImage imageOrientation](v8, "imageOrientation"));
      }
      else
      {
        v11 = UIImageJPEGRepresentation(v8, 100.0);
        if (v11)
        {
          v7 = objc_msgSend(a1, "representationWithImageData:imageOrientation:", v11, -[UIImage imageOrientation](v8, "imageOrientation"));
        }
        else
        {
          v7 = 0;
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)representationWithFileURL:(id)a3 imageOrientation:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  v8 = v7;
  if (v7)
  {
    v7[1] = 3;
    uint64_t v9 = [v6 copy];
    v10 = (void *)v8[2];
    v8[2] = v9;

    v8[4] = a4;
  }

  return v8;
}

+ (id)representationWithImageData:(id)a3 imageOrientation:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  v8 = v7;
  if (v7)
  {
    v7[1] = 1;
    uint64_t v9 = [v6 copy];
    v10 = (void *)v8[3];
    v8[3] = v9;

    v8[4] = a4;
  }

  return v8;
}

+ (id)representationWithIOSurface:(id)a3 imageOrientation:(int64_t)a4
{
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  uint64_t v9 = v8;
  if (v8)
  {
    *((void *)v8 + 1) = 2;
    objc_storeStrong((id *)v8 + 5, a3);
    v9[4] = a4;
  }

  return v9;
}

- (SBFCARendererImageRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBFCARendererImageRepresentation;
  v5 = [(SBFCARendererImageRepresentation *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"representationType"];
    v5->_representationType = v6;
    switch(v6)
    {
      case 3:
        uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileURL"];
        fileURL = v5->_fileURL;
        v5->_fileURL = (NSURL *)v9;

        if (!v5->_fileURL) {
          goto LABEL_10;
        }
        break;
      case 2:
        uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"surface"];
        surface = v5->_surface;
        v5->_surface = (IOSurface *)v11;

        if (!v5->_surface)
        {
LABEL_10:
          v5->_representationType = 0;
          goto LABEL_11;
        }
        break;
      case 1:
        uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
        imageData = v5->_imageData;
        v5->_imageData = (NSData *)v7;

        if (!v5->_imageData) {
          goto LABEL_10;
        }
        break;
      default:
        goto LABEL_10;
    }
    v5->_imageOrientation = [v4 decodeIntegerForKey:@"orientation"];
  }
LABEL_11:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->_representationType forKey:@"representationType"];
  [v5 encodeInteger:self->_imageOrientation forKey:@"orientation"];
  unint64_t v4 = self->_representationType - 1;
  if (v4 <= 2) {
    [v5 encodeObject:*(Class *)((char *)&self->super.isa + qword_18B5E5FF0[v4]) forKey:off_1E548E0F8[v4]];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGImage)createCGImageReturningScale:(double *)a3
{
  int64_t representationType = self->_representationType;
  switch(representationType)
  {
    case 3:
      p_fileURL = (uint64_t *)&self->_fileURL;
      fileURL = self->_fileURL;
      if (fileURL)
      {
        [(NSURL *)fileURL path];
        MappedDataFromPath = (void *)CPBitmapCreateMappedDataFromPath();
        if (!MappedDataFromPath) {
          id v10 = 0;
        }
        id v14 = 0;
        v15 = v14;
        if (MappedDataFromPath && !v14) {
          goto LABEL_21;
        }
        v16 = SBLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          [(SBFCARendererImageRepresentation *)p_fileURL createCGImageReturningScale:v16];
        }

        if (MappedDataFromPath) {
LABEL_21:
        }
          uint64_t v6 = _SBFCARendererCGImageForImageData(MappedDataFromPath);
        else {
          uint64_t v6 = 0;
        }

        if (a3) {
          goto LABEL_14;
        }
        return v6;
      }
      break;
    case 2:
      surface = self->_surface;
      if (surface)
      {
        v12 = [(IOSurface *)surface CGImageBuilder];
        uint64_t v6 = (CGImage *)[v12 buildCGImage];

        if (!a3) {
          return v6;
        }
        goto LABEL_14;
      }
      break;
    case 1:
      imageData = self->_imageData;
      if (imageData)
      {
        uint64_t v6 = _SBFCARendererCGImageForImageData(imageData);
        if (!a3) {
          return v6;
        }
        goto LABEL_14;
      }
      break;
  }
  uint64_t v6 = 0;
  if (a3) {
LABEL_14:
  }
    *a3 = 1.0;
  return v6;
}

- (int64_t)representationType
{
  return self->_representationType;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (IOSurface)surface
{
  return self->_surface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surface, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)createCGImageReturningScale:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_18B52E000, log, OS_LOG_TYPE_ERROR, "Failed to read file URL at path %{public}@ with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end