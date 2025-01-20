@interface PBUICodableImage
+ (BOOL)bs_encodeRepresentation:(int64_t)a3 value:(id)a4 withCoder:(id)a5;
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (CGImage)createCGImageFromCPBitmapData:(id)a3 error:(id *)a4;
+ (CGImage)createCGImageFromData:(id)a3 error:(id *)a4;
+ (CGImage)createCGImageFromURL:(id)a3 error:(id *)a4;
+ (id)dataRepresentationForImage:(CGImage *)a3 error:(id *)a4;
+ (id)makeWithOther:(id)a3;
+ (void)encodeRepresentation:(int64_t)a3 value:(id)a4 withCoder:(id)a5;
- (BOOL)isEqualRepresentation:(id)a3;
- (BOOL)refersToIdenticalImageFrom:(id)a3;
- (CGImage)CGImage;
- (CGImage)buildCGImageWithError:(id *)a3;
- (PBUICodableImage)initWithBSXPCCoder:(id)a3;
- (PBUICodableImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 error:(id *)a5;
- (PBUICodableImage)initWithCoder:(id)a3;
- (PBUICodableImage)initWithIOSurface:(id)a3 scale:(double)a4 error:(id *)a5;
- (PBUICodableImage)initWithUIImage:(id)a3 error:(id *)a4;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromSourceData:(id)a3 scale:(double)a4 error:(id *)a5;
- (id)initFromURL:(id)a3 scale:(double)a4 error:(id *)a5;
- (id)surfaceCreatingIfNecessary:(BOOL)a3;
- (id)wrappedIOSurface;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(CGImage *)a3;
@end

@implementation PBUICodableImage

- (PBUICodableImage)initWithIOSurface:(id)a3 scale:(double)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(PBUICodableImage *)self init];
  v10 = v9;
  if (v9)
  {
    v9->_representation = 2;
    objc_storeStrong((id *)&v9->_surface, a3);
    v10->_scale = a4;
  }

  return v10;
}

+ (id)makeWithOther:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PBUICodableImage);
  v4->_representation = *((void *)v3 + 1);
  objc_storeStrong((id *)&v4->_surface, *((id *)v3 + 2));
  objc_storeStrong((id *)&v4->_url, *((id *)v3 + 3));
  v5 = (CGImage *)*((void *)v3 + 4);
  if (v5) {
    v5 = CGImageRetain(v5);
  }
  v4->_sourceImage = v5;
  v6 = (CGImage *)*((void *)v3 + 6);
  if (v6) {
    v6 = CGImageRetain(v6);
  }
  v4->_cachedImage = v6;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[PBUICodableImage allocWithZone:a3] init];
  v4->_representation = self->_representation;
  objc_storeStrong((id *)&v4->_surface, self->_surface);
  objc_storeStrong((id *)&v4->_url, self->_url);
  sourceImage = self->_sourceImage;
  if (sourceImage) {
    sourceImage = CGImageRetain(sourceImage);
  }
  v4->_sourceImage = sourceImage;
  cachedImage = self->_cachedImage;
  if (cachedImage) {
    cachedImage = CGImageRetain(cachedImage);
  }
  v4->_cachedImage = cachedImage;
  return v4;
}

- (id)initFromSourceData:(id)a3 scale:(double)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = +[PBUICodableImage createCGImageFromData:v8 error:a5];
  if (v9)
  {
    if (CGImageGetImageSource())
    {
      v10 = [(PBUICodableImage *)self initWithCGImage:v9 scale:a5 error:a4];
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)PBUICodableImage;
      v11 = [(PBUICodableImage *)&v15 init];
      v10 = v11;
      if (v11)
      {
        v11->_cachedImage = v9;
        v11->_representation = 1;
        uint64_t v12 = [v8 copy];
        bitmapSourceData = v10->_bitmapSourceData;
        v10->_bitmapSourceData = (NSData *)v12;

        v10->_scale = a4;
        goto LABEL_7;
      }
    }
    CGImageRelease(v9);
LABEL_7:
    self = v10;
    v9 = (CGImage *)self;
  }

  return v9;
}

- (id)initFromURL:(id)a3 scale:(double)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(PBUICodableImage *)self init];
  v10 = v9;
  if (!v9) {
    goto LABEL_3;
  }
  v9->_representation = 3;
  uint64_t v11 = [v8 copy];
  url = v10->_url;
  v10->_url = (NSURL *)v11;

  v10->_scale = a4;
  uint64_t v13 = [(id)objc_opt_class() createCGImageFromURL:v10->_url error:a5];
  v10->_cachedImage = (CGImage *)v13;
  if (!v13) {
    v14 = 0;
  }
  else {
LABEL_3:
  }
    v14 = v10;

  return v14;
}

- (PBUICodableImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 error:(id *)a5
{
  v7 = [(PBUICodableImage *)self init];
  id v8 = v7;
  if (v7)
  {
    v7->_representation = 0;
    v7->_sourceImage = CGImageRetain(a3);
    v8->_scale = a4;
  }
  return v8;
}

- (PBUICodableImage)initWithUIImage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 ioSurface];
  if (v7)
  {
    [v6 scale];
    id v8 = -[PBUICodableImage initWithIOSurface:scale:error:](self, "initWithIOSurface:scale:error:", v7, a4);
  }
  else
  {
    id v9 = v6;
    uint64_t CGImageRepresentation = [v9 CGImage];
    if (!CGImageRepresentation)
    {
      uint64_t CGImageRepresentation = _UIImageGetCGImageRepresentation();
      if (!CGImageRepresentation)
      {
        uint64_t v11 = 0;
        goto LABEL_7;
      }
    }
    [v9 scale];
    id v8 = -[PBUICodableImage initWithCGImage:scale:error:](self, "initWithCGImage:scale:error:", CGImageRepresentation, a4);
  }
  self = v8;
  uint64_t v11 = self;
LABEL_7:

  return v11;
}

- (CGImage)CGImage
{
  result = self->_cachedImage;
  if (!result)
  {
    result = self->_sourceImage;
    if (!result)
    {
      result = [(PBUICodableImage *)self buildCGImageWithError:0];
      self->_cachedImage = result;
    }
  }
  return result;
}

- (CGImage)buildCGImageWithError:(id *)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (self->_surface)
  {
    uint64_t v5 = CGImageCreateFromIOSurface();
    if (v5)
    {
      id v6 = (CGImage *)v5;
      id v7 = 0;
      goto LABEL_11;
    }
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28228];
    v16[0] = *MEMORY[0x1E4F28578];
    v16[1] = v9;
    v17[0] = @"IOSurface failed to be made into a CGImage.";
    v17[1] = @"Check os_log for errors from ImageIO.";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    id v7 = [v8 errorWithDomain:@"com.apple.PaperBoardUI.RendererService" code:1 userInfo:v10];
  }
  else
  {
    id v7 = 0;
  }
  if (!self->_url
    || (uint64_t v11 = objc_opt_class(),
        url = self->_url,
        id v15 = 0,
        id v6 = (CGImage *)[v11 createCGImageFromURL:url error:&v15],
        id v13 = v15,
        v7,
        id v7 = v13,
        !v6))
  {
    if (a3)
    {
      id v7 = v7;
      id v6 = 0;
      *a3 = v7;
    }
    else
    {
      id v6 = 0;
    }
  }
LABEL_11:

  return v6;
}

- (void)setImage:(CGImage *)a3
{
  self->_cachedImage = CGImageRetain(a3);
}

- (void)dealloc
{
  CGImageRelease(self->_sourceImage);
  self->_sourceImage = 0;
  CGImageRelease(self->_cachedImage);
  self->_cachedImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)PBUICodableImage;
  [(PBUICodableImage *)&v3 dealloc];
}

- (id)surfaceCreatingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PBUICodableImage *)self wrappedIOSurface];
  if (v3 && !v5)
  {
    sourceImage = self->_sourceImage;
    if (!sourceImage
      || (soft_PUIIOSurfaceFromCGImage((uint64_t)sourceImage, 1),
          (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (BOOL)refersToIdenticalImageFrom:(id)a3
{
  id v4 = a3;
  if ([(PBUICodableImage *)self isEqualRepresentation:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    [(PBUICodableImage *)self CGImage];
    uint64_t Hash = CGImageGetHash();
    [v4 CGImage];
    BOOL v5 = Hash == CGImageGetHash();
  }

  return v5;
}

- (BOOL)isEqualRepresentation:(id)a3
{
  id v4 = a3;
  if (!self->_cachedImage || !v4[6] || (int v5 = CGImageGetIdentifier(), v5 != CGImageGetIdentifier()))
  {
    bitmapSourceData = self->_bitmapSourceData;
    if (bitmapSourceData)
    {
      id v8 = (NSData *)v4[5];
      if (v8)
      {
        char v6 = bitmapSourceData == v8;
        goto LABEL_20;
      }
    }
    uint64_t v9 = [(PBUICodableImage *)self wrappedIOSurface];
    uint64_t v10 = [v4 wrappedIOSurface];
    uint64_t v11 = (__IOSurface *)v10;
    if (v9 && v10)
    {
      int ID = IOSurfaceGetID(v9);
      int Identifier = IOSurfaceGetID(v11);
    }
    else
    {
      url = self->_url;
      if (url && v4[3])
      {
        char v6 = -[NSURL isEqual:](url, "isEqual:");
LABEL_19:

        goto LABEL_20;
      }
      if (!self->_sourceImage || !v4[4])
      {
        char v6 = 0;
        goto LABEL_19;
      }
      int ID = CGImageGetIdentifier();
      int Identifier = CGImageGetIdentifier();
    }
    char v6 = ID == Identifier;
    goto LABEL_19;
  }
  char v6 = 1;
LABEL_20:

  return v6;
}

- (id)wrappedIOSurface
{
  surface = self->_surface;
  if (surface)
  {
    sourceImage = surface;
  }
  else
  {
    sourceImage = (IOSurface *)self->_sourceImage;
    if (sourceImage)
    {
      soft_PUIIOSurfaceFromCGImage((uint64_t)sourceImage, 0);
      sourceImage = (IOSurface *)objc_claimAutoreleasedReturnValue();
    }
  }
  return sourceImage;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBUICodableImage)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"scale"];
  double v6 = v5;
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"representation"];
  id v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"fileURL"])
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v8];
      if (v9)
      {
        uint64_t v19 = 0;
        uint64_t v10 = (id *)&v19;
        uint64_t v11 = [(PBUICodableImage *)self initFromURL:v9 scale:&v19 error:v6];
LABEL_12:
        id v13 = v11;
        id v14 = *v10;
        self = v13;
        goto LABEL_14;
      }
    }
    else if ([v8 isEqualToString:@"imageData"])
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v8];
      if (v9)
      {
        uint64_t v18 = 0;
        uint64_t v10 = (id *)&v18;
        uint64_t v11 = [(PBUICodableImage *)self initFromSourceData:v9 scale:&v18 error:v6];
        goto LABEL_12;
      }
    }
    else
    {
      if (![v8 isEqualToString:@"surface"])
      {
        id v14 = 0;
LABEL_16:
        self = self;

        uint64_t v12 = self;
        goto LABEL_17;
      }
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v8];
      if (v9)
      {
        uint64_t v17 = 0;
        uint64_t v10 = (id *)&v17;
        uint64_t v11 = [(PBUICodableImage *)self initWithIOSurface:v9 scale:&v17 error:v6];
        goto LABEL_12;
      }
    }
    id v13 = 0;
    id v14 = 0;
LABEL_14:
    id v15 = self;
    self = v13;

    if (v14) {
      [v4 failWithError:v14];
    }
    goto LABEL_16;
  }
  uint64_t v12 = 0;
LABEL_17:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeDouble:@"scale" forKey:self->_scale];
  surface = self->_surface;
  if (surface || (surface = self->_url) != 0 || (surface = self->_bitmapSourceData) != 0)
  {
    +[PBUICodableImage encodeRepresentation:self->_representation value:surface withCoder:v4];
  }
  else
  {
    sourceImage = self->_sourceImage;
    if (sourceImage || (sourceImage = self->_cachedImage) != 0)
    {
      id v7 = soft_PUIIOSurfaceFromCGImage((uint64_t)sourceImage, 0);
      if (v7)
      {
        +[PBUICodableImage encodeRepresentation:2 value:v7 withCoder:v4];
      }
      else
      {
        id v8 = +[PBUICodableImage dataRepresentationForImage:sourceImage error:0];
        if (v8) {
          +[PBUICodableImage encodeRepresentation:1 value:v8 withCoder:v4];
        }
      }
    }
    else
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28588];
      v13[0] = *MEMORY[0x1E4F28578];
      v13[1] = v10;
      v14[0] = @"UNREACHABLE: no image or any source was avaliable to encode.";
      v14[1] = @"Somehow a PBUICodableImage was made that had no actual source or image.";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
      uint64_t v12 = [v9 errorWithDomain:@"com.apple.PaperBoardUI.RendererService" code:9999 userInfo:v11];
      [v4 failWithError:v12];
    }
  }
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v9 = a3;
  [v9 encodeDouble:@"scale" forKey:self->_scale];
  surface = self->_surface;
  if (surface || (surface = self->_url) != 0)
  {
    +[PBUICodableImage bs_encodeRepresentation:self->_representation value:surface withCoder:v9];
LABEL_4:
    double v5 = v9;
    goto LABEL_5;
  }
  sourceImage = self->_sourceImage;
  double v5 = v9;
  if (sourceImage || (sourceImage = self->_cachedImage) != 0)
  {
    id v7 = soft_PUIIOSurfaceFromCGImage((uint64_t)sourceImage, 0);
    if (v7)
    {
      +[PBUICodableImage bs_encodeRepresentation:2 value:v7 withCoder:v9];
    }
    else
    {
      id v8 = +[PBUICodableImage dataRepresentationForImage:sourceImage error:0];
      if (v8) {
        +[PBUICodableImage bs_encodeRepresentation:1 value:v8 withCoder:v9];
      }
    }
    goto LABEL_4;
  }
LABEL_5:
}

- (PBUICodableImage)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"scale"];
  double v6 = v5;
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"representation"];
  id v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"fileURL"])
    {
      id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v8];
      if (v9)
      {
        v22 = 0;
        self = [(PBUICodableImage *)self initFromURL:v9 scale:&v22 error:v6];
        uint64_t v10 = v22;
LABEL_9:
        id v12 = v10;
        id v13 = self;
LABEL_11:
        id v14 = v13;

        self = v14;
        goto LABEL_12;
      }
    }
    else
    {
      if (![v8 isEqualToString:@"imageData"])
      {
        if (![v8 isEqualToString:@"surface"])
        {
          id v12 = 0;
LABEL_15:
          self = self;

          uint64_t v11 = self;
          goto LABEL_16;
        }
        v16 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145C8] forKey:v8];
        id v9 = v16;
        if (v16)
        {
          IOSurfaceRef v17 = IOSurfaceLookupFromXPCObject(v16);
          if (v17)
          {
            id v20 = 0;
            self = [(PBUICodableImage *)self initWithIOSurface:v17 scale:&v20 error:v6];
            id v12 = v20;
            uint64_t v18 = self;
          }
          else
          {
            id v12 = 0;
            uint64_t v18 = 0;
          }
          uint64_t v19 = v18;

          self = v19;
        }
        else
        {

          id v12 = 0;
          self = 0;
        }
LABEL_12:

        if (v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[PBUICodableImage initWithBSXPCCoder:](v12);
        }
        goto LABEL_15;
      }
      id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v8];
      if (v9)
      {
        v21 = 0;
        self = [(PBUICodableImage *)self initFromSourceData:v9 scale:&v21 error:v6];
        uint64_t v10 = v21;
        goto LABEL_9;
      }
    }
    id v12 = 0;
    id v13 = 0;
    goto LABEL_11;
  }
  uint64_t v11 = 0;
LABEL_16:

  return v11;
}

+ (void)encodeRepresentation:(int64_t)a3 value:(id)a4 withCoder:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  int64_t v10 = a3 & ~(a3 >> 63);
  if (v10 >= 4) {
    int64_t v10 = 4;
  }
  unint64_t v11 = v10 - 1;
  if (v11 >= 3)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28578];
    v17[0] = @"Image did not have a valid representation.";
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v15 = [v13 errorWithDomain:@"com.apple.PaperBoardUI.RendererService" code:2 userInfo:v14];
    [v9 failWithError:v15];
  }
  else
  {
    id v12 = off_1E62B39B0[v11];
    [v8 encodeObject:v12 forKey:@"representation"];
    [v9 encodeObject:v7 forKey:v12];
  }
}

+ (BOOL)bs_encodeRepresentation:(int64_t)a3 value:(id)a4 withCoder:(id)a5
{
  id v7 = (__IOSurface *)a4;
  id v8 = a5;
  id v9 = v8;
  int64_t v10 = a3 & ~(a3 >> 63);
  if (v10 >= 4) {
    int64_t v10 = 4;
  }
  unint64_t v11 = v10 - 1;
  if ((unint64_t)(v10 - 1) <= 2)
  {
    id v12 = off_1E62B39B0[v11];
    [v8 encodeObject:v12 forKey:@"representation"];
    if ([(__IOSurface *)v7 isMemberOfClass:objc_opt_class()])
    {
      xpc_object_t XPCObject = IOSurfaceCreateXPCObject(v7);
      [v9 encodeXPCObject:XPCObject forKey:v12];
    }
    else
    {
      [v9 encodeObject:v7 forKey:v12];
    }
  }

  return v11 < 3;
}

+ (CGImage)createCGImageFromURL:(id)a3 error:(id *)a4
{
  v32[4] = *MEMORY[0x1E4F143B8];
  CFURLRef v7 = (const __CFURL *)a3;
  if (!v7)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"url"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBUICodableImage createCGImageFromURL:error:](a2, (uint64_t)a1, (uint64_t)v26);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC4F3514);
  }
  CFURLRef v8 = v7;
  id v28 = 0;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v7 options:1 error:&v28];
  id v10 = v28;
  if (!v9
    || (id v27 = 0,
        ImageAtIndex = (CGImage *)[a1 createCGImageFromCPBitmapData:v9 error:&v27],
        id v12 = v27,
        v10,
        id v10 = v12,
        !ImageAtIndex))
  {
    if (v10 && [v10 code] != 6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      +[PBUICodableImage createCGImageFromURL:error:](v10);
    }
    id v13 = CGImageSourceCreateWithURL(v8, 0);
    if (!v13)
    {
      if (a4)
      {
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28578];
        v31[0] = *MEMORY[0x1E4F289D0];
        v31[1] = v22;
        v32[0] = v8;
        v32[1] = @"Image creation failed.";
        uint64_t v23 = *MEMORY[0x1E4F28228];
        v31[2] = *MEMORY[0x1E4F28588];
        v31[3] = v23;
        v32[2] = @"URL is either not readable or is not a valid image file.";
        v32[3] = @"Check os_log for errors from ImageIO.";
        uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
        id v20 = v32;
        v21 = v31;
        goto LABEL_14;
      }
LABEL_15:
      ImageAtIndex = 0;
      goto LABEL_16;
    }
    id v14 = v13;
    size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v13);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v14, PrimaryImageIndex, 0);
    CFRelease(v14);
    if (!ImageAtIndex)
    {
      if (a4)
      {
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = *MEMORY[0x1E4F28578];
        v29[0] = *MEMORY[0x1E4F289D0];
        v29[1] = v17;
        v30[0] = v8;
        v30[1] = @"Image creation failed.";
        uint64_t v18 = *MEMORY[0x1E4F28228];
        v29[2] = *MEMORY[0x1E4F28588];
        v29[3] = v18;
        v30[2] = @"CGImageSource could not create an image.";
        v30[3] = @"Check os_log for errors from ImageIO.";
        uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
        id v20 = v30;
        v21 = v29;
LABEL_14:
        v24 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:4];
        *a4 = [v16 errorWithDomain:@"com.apple.PaperBoardUI.RendererService" code:1 userInfo:v24];

        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
LABEL_16:

  return ImageAtIndex;
}

+ (CGImage)createCGImageFromData:(id)a3 error:(id *)a4
{
  v28[3] = *MEMORY[0x1E4F143B8];
  CFDataRef v7 = (const __CFData *)a3;
  if (!v7)
  {
    uint64_t v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"data != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBUICodableImage createCGImageFromData:error:](a2, (uint64_t)a1, (uint64_t)v23);
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1BC4F37A0);
  }
  CFDataRef v8 = v7;
  id v24 = 0;
  ImageAtIndex = (CGImage *)[a1 createCGImageFromCPBitmapData:v7 error:&v24];
  id v10 = v24;
  unint64_t v11 = v10;
  if (!ImageAtIndex)
  {
    if (v10 && [v10 code] != 6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      +[PBUICodableImage createCGImageFromData:error:](v11);
    }
    id v12 = CGImageSourceCreateWithData(v8, 0);
    if (!v12)
    {
      if (a4)
      {
        uint64_t v20 = *MEMORY[0x1E4F28588];
        v27[0] = *MEMORY[0x1E4F28578];
        v27[1] = v20;
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        v28[0] = @"Image creation failed.";
        v28[1] = @"Data is not a valid image format.";
        v27[2] = *MEMORY[0x1E4F285A0];
        v28[2] = @"Check os_log for errors from ImageIO.";
        uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v18 = v28;
        uint64_t v19 = v27;
        goto LABEL_13;
      }
LABEL_14:
      ImageAtIndex = 0;
      goto LABEL_15;
    }
    id v13 = v12;
    size_t PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(v12);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v13, PrimaryImageIndex, 0);
    CFRelease(v13);
    if (!ImageAtIndex)
    {
      if (a4)
      {
        uint64_t v15 = *MEMORY[0x1E4F28588];
        v25[0] = *MEMORY[0x1E4F28578];
        v25[1] = v15;
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        v26[0] = @"Image creation failed.";
        v26[1] = @"CGImageSource could not create an image.";
        v25[2] = *MEMORY[0x1E4F28228];
        v26[2] = @"Check os_log for errors from ImageIO.";
        uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v18 = v26;
        uint64_t v19 = v25;
LABEL_13:
        v21 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:3];
        *a4 = [v16 errorWithDomain:@"com.apple.PaperBoardUI.RendererService" code:1 userInfo:v21];

        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
LABEL_15:

  return ImageAtIndex;
}

+ (id)dataRepresentationForImage:(CGImage *)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  double v6 = (__CFData *)CGImageCopySourceData();
  if (!v6)
  {
    double v6 = (__CFData *)CGImageCopyJPEGData();
    if (!v6)
    {
      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x2050000000;
      CFDataRef v7 = (void *)getPUIImageOnDiskFormatClass_softClass;
      uint64_t v26 = getPUIImageOnDiskFormatClass_softClass;
      if (!getPUIImageOnDiskFormatClass_softClass)
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __getPUIImageOnDiskFormatClass_block_invoke;
        v22[3] = &unk_1E62B2890;
        v22[4] = &v23;
        __getPUIImageOnDiskFormatClass_block_invoke((uint64_t)v22);
        CFDataRef v7 = (void *)v24[3];
      }
      CFDataRef v8 = v7;
      _Block_object_dispose(&v23, 8);
      id v9 = [v8 alloc];
      id v10 = (void *)[v9 initWithTypeRecord:*MEMORY[0x1E4F443E0] destinationOptions:0 addImageOptions:0];
      unint64_t v11 = [MEMORY[0x1E4F1CA58] data];
      CFDictionaryRef v12 = [v10 resolveDestinationOptionsForImage:a3];
      id v13 = CGImageDestinationCreateWithData(v11, (CFStringRef)[v10 typeIdentifier], 1uLL, v12);
      if (v13)
      {
        CFDictionaryRef v14 = [v10 resolveAddImageOptionsForImage:a3];
        CGImageDestinationAddImage(v13, a3, v14);
        BOOL v15 = CGImageDestinationFinalize(v13);
        CFRelease(v13);
        if (v15)
        {
          double v6 = v11;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        if (a4)
        {
          uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v19 = getPUIImageEncoderErrorDomain();
          uint64_t v27 = *MEMORY[0x1E4F28568];
          id v28 = @"Image final encoding failed for unknown reasons in CoreGraphics.";
          uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          *a4 = [v18 errorWithDomain:v19 code:2 userInfo:v20];
        }
      }
      else
      {
        if (!a4)
        {
          double v6 = 0;
          goto LABEL_14;
        }
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        getPUIImageEncoderErrorDomain();
        CFDictionaryRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = *MEMORY[0x1E4F28568];
        v30[0] = @"Image destination failed to be created to Data.";
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
        *a4 = [v16 errorWithDomain:v14 code:1 userInfo:v17];
      }
      double v6 = 0;
      goto LABEL_13;
    }
  }
LABEL_15:
  return v6;
}

+ (CGImage)createCGImageFromCPBitmapData:(id)a3 error:(id *)a4
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  CFArrayRef ImagesFromData = (const __CFArray *)CPBitmapCreateImagesFromData();
  if (!ImagesFromData) {
    return 0;
  }
  ValueAtIndex = (CGImage *)CFArrayGetValueAtIndex(ImagesFromData, 0);
  CFDataRef v7 = ValueAtIndex;
  if (ValueAtIndex)
  {
    CFRetain(ValueAtIndex);
  }
  else if (a4)
  {
    CFDataRef v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28588];
    v12[0] = *MEMORY[0x1E4F28578];
    v12[1] = v9;
    v13[0] = @"CPBitmap file contained no images.";
    v13[1] = @"The bitmap file was valid, it just had no images.";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    *a4 = [v8 errorWithDomain:@"com.apple.PaperBoardUI.RendererService" code:2 userInfo:v10];
  }
  CFRelease(ImagesFromData);
  return v7;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitmapSourceData, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_surface, 0);
}

- (void)initWithBSXPCCoder:(void *)a1 .cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = [a1 debugDescription];
  int v2 = 138412290;
  BOOL v3 = v1;
  _os_log_error_impl(&dword_1BC4B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PBUICodableImage BSXPCDecoding failed: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)createCGImageFromURL:(uint64_t)a3 error:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"PBUICodableImage.m";
  __int16 v10 = 1024;
  int v11 = 498;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1BC4B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

+ (void)createCGImageFromURL:(void *)a1 error:.cold.2(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = [a1 debugDescription];
  int v2 = 138412290;
  BOOL v3 = v1;
  _os_log_debug_impl(&dword_1BC4B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[Possibly Expected Error] CPBitmap read failed will fallback to ImageIO. The source data is unlikely a cpbitmap so you can normally ignore this: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)createCGImageFromData:(uint64_t)a3 error:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStringFromSelector(a1);
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0();
  uint64_t v9 = @"PBUICodableImage.m";
  __int16 v10 = 1024;
  int v11 = 548;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1BC4B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

+ (void)createCGImageFromData:(void *)a1 error:.cold.2(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = [a1 debugDescription];
  int v2 = 138412290;
  BOOL v3 = v1;
  _os_log_debug_impl(&dword_1BC4B3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[Possibly Expected Error] CPBitmap read failed. The source data is unlikely a cpbitmap so you can normally ignore this: %@", (uint8_t *)&v2, 0xCu);
}

@end