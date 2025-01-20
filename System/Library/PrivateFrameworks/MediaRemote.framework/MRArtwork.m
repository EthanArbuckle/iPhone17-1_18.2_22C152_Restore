@interface MRArtwork
+ (BOOL)processRequestsExternalArtworkValidation;
- (BOOL)isEqual:(id)a3;
- (MRArtwork)initWithImageData:(id)a3 height:(int64_t)a4 width:(int64_t)a5;
- (MRArtwork)initWithProtobuf:(id)a3;
- (NSData)imageData;
- (NSDictionary)dictionaryRepresentation;
- (id)artworkByResizingWithWidth:(int64_t)a3 height:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)height;
- (int64_t)width;
- (void)setImageData:(id)a3;
@end

@implementation MRArtwork

- (void).cxx_destruct
{
}

- (MRArtwork)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = [v4 artworkData];

  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)MRArtwork;
    v6 = [(MRArtwork *)&v17 init];
    if (v6)
    {
      v7 = [v4 artworkData];
      uint64_t v8 = [v7 copy];
      imageData = v6->_imageData;
      v6->_imageData = (NSData *)v8;

      v10 = [v4 metadata];
      int v11 = [v10 hasArtworkDataWidthDeprecated];

      if (v11)
      {
        v12 = [v4 metadata];
        v6->_width = (int)[v12 artworkDataWidthDeprecated];
      }
      else
      {
        v6->_width = (int)[v4 artworkDataWidth];
      }
      v13 = [v4 metadata];
      int v14 = [v13 hasArtworkDataHeightDeprecated];

      if (v14)
      {
        v15 = [v4 metadata];
        v6->_height = (int)[v15 artworkDataHeightDeprecated];
      }
      else
      {
        v6->_height = (int)[v4 artworkDataHeight];
      }
    }
    self = v6;
    v5 = self;
  }

  return v5;
}

- (MRArtwork)initWithImageData:(id)a3 height:(int64_t)a4 width:(int64_t)a5
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRArtwork;
  v7 = [(MRArtwork *)&v10 init];
  uint64_t v8 = v7;
  if (v7) {
    [(MRArtwork *)v7 setImageData:v6];
  }

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MRArtwork *)self imageData];

  if (v4)
  {
    v5 = [(MRArtwork *)self imageData];
    StringRepresentation = (void *)MRDataCreateStringRepresentation(v5);
    [v3 setObject:StringRepresentation forKeyedSubscript:@"imageData"];
  }
  if ([(MRArtwork *)self height] >= 1)
  {
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRArtwork height](self, "height"));
    [v3 setObject:v7 forKeyedSubscript:@"height"];
  }
  if ([(MRArtwork *)self width] >= 1)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRArtwork width](self, "width"));
    [v3 setObject:v8 forKeyedSubscript:@"width"];
  }
  v9 = +[MRUserSettings currentSettings];
  if ([v9 shouldLogArtwork])
  {
    CFDataRef v10 = [(MRArtwork *)self imageData];
    int v11 = (__CFString *)MRCreateASCIIRepresentationFromImageData(v10);
    [v3 setObject:v11 forKeyedSubscript:@"image"];
  }

  return (NSDictionary *)v3;
}

- (void)setImageData:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (+[MRArtwork processRequestsExternalArtworkValidation])
    {
      MRGetSharedService();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      [v6 imageDimensionsForArtworkData:v5];
      double v9 = v8;
      double v10 = v7;
      if (v8 != *MEMORY[0x1E4F1DB30] || v7 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
        goto LABEL_15;
      }
      v12 = _MRLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MRArtwork setImageData:](v12);
      }
    }
    else
    {
      id v16 = 0;
      +[MRImageUtilities imageDimensionsForImageData:v5 error:&v16];
      double v9 = v14;
      double v10 = v15;
      id v6 = v16;
      if (!v6)
      {
LABEL_15:
        objc_storeStrong((id *)&self->_imageData, a3);
        self->_height = (uint64_t)v10;
        self->_width = (uint64_t)v9;
        goto LABEL_16;
      }
      v12 = _MRLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MRArtwork setImageData:](v12);
      }
    }

LABEL_16:
    goto LABEL_17;
  }
  imageData = self->_imageData;
  self->_imageData = 0;

  self->_height = 0;
  self->_width = 0;
LABEL_17:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRArtwork *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    id v5 = [(MRArtwork *)v4 imageData];
    uint64_t v6 = [(MRArtwork *)self imageData];
    if (v5 == (void *)v6)
    {
    }
    else
    {
      double v7 = (void *)v6;
      double v8 = [(MRArtwork *)v4 imageData];
      double v9 = [(MRArtwork *)self imageData];
      int v10 = [v8 isEqualToData:v9];

      if (!v10) {
        goto LABEL_10;
      }
    }
    uint64_t v12 = [(MRArtwork *)v4 height];
    if (v12 != [(MRArtwork *)self height])
    {
LABEL_10:
      BOOL v11 = 0;
      goto LABEL_11;
    }
    uint64_t v13 = [(MRArtwork *)v4 width];
    BOOL v11 = v13 == [(MRArtwork *)self width];
  }
LABEL_11:

  return v11;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(MRArtwork *)self width];
  int64_t v6 = [(MRArtwork *)self height];
  double v7 = [(MRArtwork *)self imageData];
  double v8 = (void *)[v3 initWithFormat:@"<%@: %p> %ld x %ld (%ld bytes)", v4, self, v5, v6, objc_msgSend(v7, "length")];

  return v8;
}

- (id)debugDescription
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p> {\n", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"  width = %ld\n", -[MRArtwork width](self, "width"));
  objc_msgSend(v3, "appendFormat:", @"  height = %ld\n", -[MRArtwork height](self, "height"));
  uint64_t v4 = [(MRArtwork *)self imageData];
  int64_t v5 = [v4 description];
  int64_t v6 = MRCreateIndentedDebugDescriptionFromObject(v5);
  [v3 appendFormat:@"  imageData = %@\n", v6];

  double v7 = +[MRUserSettings currentSettings];
  LODWORD(v5) = [v7 shouldLogArtwork];

  if (v5)
  {
    CFDataRef v8 = [(MRArtwork *)self imageData];
    double v9 = (__CFString *)MRCreateASCIIRepresentationFromImageData(v8);
    int v10 = MRCreateIndentedDebugDescriptionFromObject(v9);
    [v3 appendFormat:@"artwork = %@\n", v10];
  }
  [v3 appendString:@"}"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  int64_t v5 = [(MRArtwork *)self imageData];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    double v7 = [(MRArtwork *)self imageData];
    CFDataRef v8 = (void *)[v6 initWithData:v7];
    [v4 setImageData:v8];
  }
  else
  {
    [v4 setImageData:0];
  }

  objc_msgSend(v4, "setHeight:", -[MRArtwork height](self, "height"));
  objc_msgSend(v4, "setWidth:", -[MRArtwork width](self, "width"));
  return v4;
}

- (id)artworkByResizingWithWidth:(int64_t)a3 height:(int64_t)a4
{
  double v7 = (double)a3;
  double v8 = (double)a4;
  double v9 = (double)[(MRArtwork *)self width];
  uint64_t v10 = [(MRArtwork *)self height];
  double v11 = (double)v10;
  if (v7 + 0.5 >= v9 && v8 + 0.5 >= v11)
  {
LABEL_22:
    v22 = 0;
    goto LABEL_25;
  }
  double v13 = v9;
  double v14 = (double)v10;
  if ((a4 & a3) != 0xFFFFFFFFFFFFFFFFLL)
  {
    double v15 = v9 / v11;
    if (a3 == -1)
    {
      double v13 = v15 * v8;
      goto LABEL_11;
    }
    if (a4 != -1)
    {
      double v13 = v7;
LABEL_11:
      double v14 = v8;
      goto LABEL_13;
    }
    double v13 = v7;
    double v14 = v7 / v15;
  }
LABEL_13:
  double v16 = v14 + 0.5;
  if (v13 + 0.5 >= v9 && v16 >= v11) {
    goto LABEL_22;
  }
  v18 = [(MRArtwork *)self imageData];
  id v24 = 0;
  v19 = +[MRImageUtilities resizeImageData:forFittingSize:error:](MRImageUtilities, "resizeImageData:forFittingSize:error:", v18, &v24, v13, v14);
  id v20 = v24;

  if (v20)
  {
    v21 = _MRLogForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MRArtwork artworkByResizingWithWidth:height:]((uint64_t)v20, v21);
    }

    v22 = 0;
  }
  else
  {
    v22 = [[MRArtwork alloc] initWithImageData:v19 height:(uint64_t)v14 width:(uint64_t)v13];
  }

LABEL_25:

  return v22;
}

+ (BOOL)processRequestsExternalArtworkValidation
{
  if (processRequestsExternalArtworkValidation_onceToken != -1) {
    dispatch_once(&processRequestsExternalArtworkValidation_onceToken, &__block_literal_global_28);
  }
  return processRequestsExternalArtworkValidation___entitled;
}

uint64_t __53__MRArtwork_processRequestsExternalArtworkValidation__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F77990] hasBoolEntitlement:@"com.apple.mediaremote.external-artwork-validation" shouldLogForMissingEntitlement:0];
  processRequestsExternalArtworkValidation___entitled = result;
  return result;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (int64_t)height
{
  return self->_height;
}

- (int64_t)width
{
  return self->_width;
}

- (void)setImageData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[MRArtwork] Failed to determine dimensions for provided image data.", v1, 2u);
}

- (void)artworkByResizingWithWidth:(uint64_t)a1 height:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[MRArtwork] resize failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end