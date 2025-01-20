@interface NUBrushStroke
+ (id)brushStrokeFromDictionary:(id)a3;
+ (id)dictionaryFromBrushStroke:(id)a3;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)clipRect;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)extent;
- ($E2C29196C7A5C696474C6955C5A9CE06)pointAtIndex:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBrushStroke:(id)a3;
- (NUBrushStroke)initWithDictionary:(id)a3;
- (float)opacity;
- (float)radius;
- (float)softness;
- (id)_createDataFromPointArray:(id)a3;
- (id)_createPointArrayFromData:(id)a3;
- (id)ciImageTiled:(BOOL)a3 closed:(BOOL)a4 pressureMode:(int64_t)a5;
- (id)ciImageTiled:(BOOL)a3 closed:(BOOL)a4 pressureMode:(int64_t)a5 filled:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)points;
- (int64_t)pointCount;
- (int64_t)pressureMode;
- (unint64_t)hash;
- (void)_initializeWithRadius:(float)a3 softness:(float)a4 opacity:(float)a5 extent:(id *)a6 clipRect:(id *)a7 data:(id)a8 pressureMode:(int64_t)a9;
- (void)_updateExtent;
- (void)nu_updateDigest:(id)a3;
- (void)setOpacity:(float)a3;
- (void)setPressureMode:(int64_t)a3;
- (void)setRadius:(float)a3;
- (void)setSoftness:(float)a3;
- (void)writeToTIFFAtPath:(id)a3 closed:(BOOL)a4 pressureMode:(int64_t)a5;
@end

@implementation NUBrushStroke

- (void).cxx_destruct
{
}

- (void)setPressureMode:(int64_t)a3
{
  self->_pressureMode = a3;
}

- (int64_t)pressureMode
{
  return self->_pressureMode;
}

- (void)setOpacity:(float)a3
{
  self->_opacity = a3;
}

- (float)opacity
{
  return self->_opacity;
}

- (void)setSoftness:(float)a3
{
  self->_softness = a3;
}

- (float)softness
{
  return self->_softness;
}

- (void)setRadius:(float)a3
{
  self->_radius = a3;
}

- (float)radius
{
  return self->_radius;
}

- (BOOL)isEqualToBrushStroke:(id)a3
{
  v4 = (id *)a3;
  [v4 radius];
  if (v5 != self->_radius) {
    goto LABEL_4;
  }
  [v4 softness];
  if (v6 != self->_softness) {
    goto LABEL_4;
  }
  [v4 opacity];
  if (v7 != self->_opacity) {
    goto LABEL_4;
  }
  if (v4)
  {
    [v4 extent];
    uint64_t v10 = v20;
    uint64_t v11 = v19;
    uint64_t v12 = v21;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    long long v21 = 0u;
  }
  char v8 = 0;
  if (self->_extent.origin.x == v11 && self->_extent.origin.y == v10 && self->_extent.size.width == v12)
  {
    if (self->_extent.size.height != *((void *)&v21 + 1))
    {
LABEL_4:
      char v8 = 0;
      goto LABEL_5;
    }
    if (v4)
    {
      [v4 clipRect];
      uint64_t v13 = v17;
      uint64_t v14 = v16;
      uint64_t v15 = v18;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      long long v18 = 0u;
    }
    char v8 = 0;
    if (self->_clipRect.origin.x == v14 && self->_clipRect.origin.y == v13 && self->_clipRect.size.width == v15)
    {
      if (self->_clipRect.size.height == *((void *)&v18 + 1))
      {
        char v8 = [v4[12] isEqualToData:self->_data];
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
LABEL_5:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 isEqualToBrushStroke:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)nu_updateDigest:(id)a3
{
  id v4 = a3;
  [v4 addString:@"NUBrushStroke{"];
  [v4 addBytes:&self->_radius length:4];
  [v4 addBytes:&self->_softness length:4];
  [v4 addBytes:&self->_opacity length:4];
  [v4 addBytes:&self->_extent length:32];
  [v4 addBytes:&self->_clipRect length:32];
  objc_msgSend(v4, "addBytes:length:", -[NSMutableData bytes](self->_data, "bytes"), -[NSMutableData length](self->_data, "length"));
  [v4 addString:@"}"];
}

- (unint64_t)hash
{
  return (0x10821348B093D5 * LODWORD(self->_softness)) ^ (0x13106BBD0F0903 * LODWORD(self->_radius)) ^ (0x1EA54677C8386DLL * LODWORD(self->_opacity)) ^ (0x4039836B4C3B3 * ((0x1BF75A10D65E13 * self->_extent.origin.y) ^ (0x10E0076873D11FLL * self->_extent.origin.x) ^ (0xB4C213BC9A2FBLL * self->_extent.size.width) ^ (0x210F2E3C563F53 * self->_extent.size.height))) ^ (0xBA581662031A1 * ((0x1BF75A10D65E13 * self->_clipRect.origin.y) ^ (0x10E0076873D11FLL * self->_clipRect.origin.x) ^ (0xB4C213BC9A2FBLL * self->_clipRect.size.width) ^ (0x210F2E3C563F53 * self->_clipRect.size.height)));
}

- (void)_updateExtent
{
  uint64_t v3 = [(NUBrushStroke *)self pointCount];
  if (v3 < 1)
  {
    $86B46DF249C2B4242DBB096758D29184 v15 = ($86B46DF249C2B4242DBB096758D29184)NUPixelRectNull;
    $5BB7312FFE32F1AB3F1F5957C99A58B3 v16 = ($5BB7312FFE32F1AB3F1F5957C99A58B3)unk_1A9A743E8;
  }
  else
  {
    uint64_t v4 = v3;
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v9 = (float)((float)(self->_radius * 2.0) + 1.0);
    uint64_t v10 = (float *)[(NSMutableData *)self->_data bytes];
    uint64_t v11 = &v10[3 * v4];
    do
    {
      float radius = self->_radius;
      float v13 = *v10;
      float v14 = v10[1];
      v10 += 3;
      v21.origin.CGFloat x = (float)(v13 - radius);
      v21.origin.CGFloat y = (float)(v14 - radius);
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      v21.size.CGFloat width = v9;
      v21.size.CGFloat height = v9;
      CGRect v20 = CGRectUnion(v19, v21);
      CGFloat x = v20.origin.x;
      CGFloat y = v20.origin.y;
      CGFloat width = v20.size.width;
      CGFloat height = v20.size.height;
    }
    while (v10 != v11);
    CGRect v18 = v20;
    NU::RectT<long>::RectT(v17, &v18, 0);
    $86B46DF249C2B4242DBB096758D29184 v15 = ($86B46DF249C2B4242DBB096758D29184)v17[0];
    $5BB7312FFE32F1AB3F1F5957C99A58B3 v16 = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v17[1];
  }
  self->_extent.origin = v15;
  self->_extent.size = v16;
}

- (id)_createDataFromPointArray:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  id v20 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:12 * v4];
  uint64_t v5 = [v20 mutableBytes];
  if (v4)
  {
    uint64_t v6 = 0;
    float v7 = (float *)(v5 + 8);
    do
    {
      char v8 = [v3 objectAtIndex:v6];
      double v9 = v8;
      if (v8)
      {
        uint64_t v10 = [v8 objectForKey:@"x"];
        uint64_t v11 = [v9 objectForKey:@"y"];
        uint64_t v12 = [v9 objectForKey:@"p"];
        int v13 = 0;
        int v14 = 0;
        if (v10)
        {
          [v10 floatValue];
          int v14 = v15;
        }
        if (v11)
        {
          [v11 floatValue];
          int v13 = v16;
        }
        if (v12)
        {
          [v12 floatValue];
          float v18 = v17;
        }
        else
        {
          float v18 = 1.0;
        }
      }
      else
      {
        int v13 = 0;
        float v18 = 1.0;
        int v14 = 0;
      }
      *((_DWORD *)v7 - 2) = v14;
      *((_DWORD *)v7 - 1) = v13;
      *float v7 = v18;
      v7 += 3;

      ++v6;
    }
    while (v4 != v6);
  }

  return v20;
}

- (id)_createPointArrayFromData:(id)a3
{
  id v18 = a3;
  unint64_t v3 = [v18 length];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3 / 0xC];
  id v19 = v18;
  uint64_t v5 = [v19 bytes];
  if (v3 >= 0xC)
  {
    if (v3 / 0xC <= 1) {
      unint64_t v7 = 1;
    }
    else {
      unint64_t v7 = v3 / 0xC;
    }
    char v8 = (int *)(v5 + 8);
    do
    {
      LODWORD(v6) = *(v8 - 2);
      int v9 = *(v8 - 1);
      int v10 = *v8;
      uint64_t v11 = [NSNumber numberWithFloat:v6];
      LODWORD(v12) = v9;
      int v13 = [NSNumber numberWithFloat:v12];
      LODWORD(v14) = v10;
      int v15 = [NSNumber numberWithFloat:v14];
      int v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v11, @"x", v13, @"y", v15, @"p", 0);
      [v4 addObject:v16];

      v8 += 3;
      --v7;
    }
    while (v7);
  }

  return v4;
}

- (id)description
{
  unint64_t v3 = NSString;
  float radius = self->_radius;
  float softness = self->_softness;
  opacitint64_t y = self->_opacity;
  int64_t v7 = [(NUBrushStroke *)self pointCount];
  char v8 = [NSString stringWithFormat:@"{origin={%ld, %ld} size={%ld, %ld}}]", self->_extent.origin.x, self->_extent.origin.y, self->_extent.size.width, self->_extent.size.height];
  int64_t x = self->_clipRect.origin.x;
  int64_t y = self->_clipRect.origin.y;
  int64_t height = self->_clipRect.size.height;
  BOOL v14 = x == 0x7FFFFFFFFFFFFFFFLL && y == 0x7FFFFFFFFFFFFFFFLL && self->_clipRect.size.width == 0 && height == 0;
  char v15 = v14;
  if (v14)
  {
    int v16 = @"None";
  }
  else
  {
    [NSString stringWithFormat:@"{origin={%ld, %ld} size={%ld, %ld}}]", x, y, self->_clipRect.size.width, height];
    int v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  float v17 = [v3 stringWithFormat:@"<%@: radius=%f,softness=%f,opacity=%f,pointCount=%lu,extent=%@,clipRect=%@>", @"NUBrushStroke", radius, softness, opacity, v7, v8, v16];
  if ((v15 & 1) == 0) {

  }
  return v17;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)clipRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = self[2].var1;
  retstr->var0 = self[2].var0;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = var1;
  return self;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)extent
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = self[1].var1;
  retstr->var0 = self[1].var0;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = var1;
  return self;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)pointAtIndex:(int64_t)a3
{
  int64_t v5 = [(NUBrushStroke *)self pointCount];
  if (a3 < 0 || v5 <= a3)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8] format:@"Point index out of bounds"];
  }
  else
  {
    double v6 = (float *)([(NSMutableData *)self->_data bytes] + 12 * a3);
    float v7 = *v6;
    float v8 = v6[1];
    float v9 = v6[2];
  }
  result.var2 = v9;
  result.$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v8;
  result.var0 = v7;
  return result;
}

- (int64_t)pointCount
{
  return (int64_t)[(NSMutableData *)self->_data length] / 12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[NUMutableBrushStroke allocWithZone:a3] init];
  int64_t v5 = (void *)[(NSMutableData *)self->_data mutableCopy];
  *(float *)&double v6 = self->_radius;
  *(float *)&double v7 = self->_softness;
  *(float *)&double v8 = self->_opacity;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size = self->_extent.size;
  v13[0] = self->_extent.origin;
  v13[1] = size;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v10 = self->_clipRect.size;
  v12[0] = self->_clipRect.origin;
  v12[1] = v10;
  [(NUBrushStroke *)v4 _initializeWithRadius:v13 softness:v12 opacity:v5 extent:self->_pressureMode clipRect:v6 data:v7 pressureMode:v8];
  if ((!self->_extent.size.width || !self->_extent.size.height) && [(NUBrushStroke *)v4 pointCount] >= 1) {
    [(NUBrushStroke *)v4 _updateExtent];
  }

  return v4;
}

+ (id)dictionaryFromBrushStroke:(id)a3
{
  v21[7] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a3;
  uint64_t v4 = v3[3];
  int64_t v5 = @"none";
  if (v4 == 2) {
    int64_t v5 = @"opacity";
  }
  if (v4 == 1) {
    double v6 = @"radius";
  }
  else {
    double v6 = v5;
  }
  double v7 = v6;
  double v8 = [v3 _createPointArrayFromData:v3[12]];
  v21[0] = &unk_1F0049D28;
  v20[0] = @"version";
  v20[1] = @"radius";
  LODWORD(v9) = *((_DWORD *)v3 + 2);
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v10 = [NSNumber numberWithFloat:v9];
  v21[1] = v10;
  v20[2] = @"softness";
  LODWORD(v11) = *((_DWORD *)v3 + 3);
  double v12 = [NSNumber numberWithFloat:v11];
  v21[2] = v12;
  v20[3] = @"opacity";
  LODWORD(v13) = *((_DWORD *)v3 + 4);
  BOOL v14 = [NSNumber numberWithFloat:v13];
  v21[3] = v14;
  v21[4] = v8;
  v20[4] = @"points";
  v20[5] = @"pressureMode";
  v21[5] = v7;
  v20[6] = @"clipRect";
  long long v15 = *((_OWORD *)v3 + 5);
  v19[0] = *((_OWORD *)v3 + 4);
  v19[1] = v15;
  int v16 = NSArrayFromNUPixelRect(v19);
  v21[6] = v16;
  float v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];

  return v17;
}

+ (id)brushStrokeFromDictionary:(id)a3
{
  id v4 = a3;
  int64_t v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (id)points
{
  return self->_data;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NUBrushStroke allocWithZone:a3] init];
  *(float *)&double v5 = self->_radius;
  *(float *)&double v6 = self->_softness;
  *(float *)&double v7 = self->_opacity;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size = self->_extent.size;
  v12[0] = self->_extent.origin;
  v12[1] = size;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v9 = self->_clipRect.size;
  v11[0] = self->_clipRect.origin;
  v11[1] = v9;
  [(NUBrushStroke *)v4 _initializeWithRadius:v12 softness:v11 opacity:self->_data extent:self->_pressureMode clipRect:v5 data:v6 pressureMode:v7];
  if ((!self->_extent.size.width || !self->_extent.size.height) && [(NUBrushStroke *)v4 pointCount] >= 1) {
    [(NUBrushStroke *)v4 _updateExtent];
  }
  return v4;
}

- (void)_initializeWithRadius:(float)a3 softness:(float)a4 opacity:(float)a5 extent:(id *)a6 clipRect:(id *)a7 data:(id)a8 pressureMode:(int64_t)a9
{
  self->_float radius = a3;
  self->_float softness = a4;
  self->_opacitint64_t y = a5;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a6->var1;
  self->_extent.origin = ($86B46DF249C2B4242DBB096758D29184)a6->var0;
  self->_extent.$5BB7312FFE32F1AB3F1F5957C99A58B3 size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v12 = a7->var1;
  self->_clipRect.origin = ($86B46DF249C2B4242DBB096758D29184)a7->var0;
  self->_clipRect.$5BB7312FFE32F1AB3F1F5957C99A58B3 size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v12;
  objc_storeStrong((id *)&self->_data, a8);
  self->_pressureMode = a9;
}

- (NUBrushStroke)initWithDictionary:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:@"version"];
  uint64_t v6 = [v5 integerValue];

  if (v6 != 1)
  {
    v24 = NUAssertLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown brush stroke version. %ld", v6);
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v25;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v27 = NUAssertLogger();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = [MEMORY[0x1E4F29060] callStackSymbols];
        v33 = [v32 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v33;
        _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v30;
      _os_log_error_impl(&dword_1A9892000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUBrushStroke initWithDictionary:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Mask/NUBrushStroke.mm", 75, @"Unknown brush stroke version. %ld", v34, v35, v36, v37, v6);
  }
  double v7 = [v4 objectForKeyedSubscript:@"radius"];
  [v7 floatValue];
  unsigned int v9 = v8;

  $5BB7312FFE32F1AB3F1F5957C99A58B3 v10 = [v4 objectForKeyedSubscript:@"softness"];
  [v10 floatValue];
  unsigned int v12 = v11;

  double v13 = [v4 objectForKeyedSubscript:@"opacity"];
  [v13 floatValue];
  int v15 = v14;

  int v16 = [v4 objectForKeyedSubscript:@"points"];
  float v17 = [(NUBrushStroke *)self _createDataFromPointArray:v16];
  id v18 = [v4 objectForKeyedSubscript:@"pressureMode"];
  if ([v18 isEqualToString:@"radius"])
  {
    uint64_t v19 = 1;
  }
  else if ([v18 isEqualToString:@"opacity"])
  {
    uint64_t v19 = 2;
  }
  else
  {
    uint64_t v19 = 0;
  }
  memset(buf, 0, 32);
  id v20 = [v4 objectForKeyedSubscript:@"clipRect"];
  NUPixelRectFromArray(v20, (uint64_t *)buf);

  v40.receiver = self;
  v40.super_class = (Class)NUBrushStroke;
  CGRect v21 = [(NUBrushStroke *)&v40 init];
  memset(v39, 0, sizeof(v39));
  v38[0] = *(_OWORD *)buf;
  v38[1] = *(_OWORD *)&buf[16];
  LODWORD(v22) = v15;
  [(NUBrushStroke *)v21 _initializeWithRadius:v39 softness:v38 opacity:v17 extent:v19 clipRect:COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&buf[4], v9)) data:COERCE_DOUBLE(__PAIR64__(*(unsigned int *)&buf[20], v12)) pressureMode:v22];
  [(NUBrushStroke *)v21 _updateExtent];

  return v21;
}

- (void)writeToTIFFAtPath:(id)a3 closed:(BOOL)a4 pressureMode:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  unsigned int v9 = [(NUBrushStroke *)self ciImageTiled:1 closed:v6 pressureMode:a5];
  [v9 extent];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  CGFloat v14 = -CGRectGetMinX(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v19);
  CGAffineTransformMakeTranslation(&v17, v14, -MinY);
  int v16 = [v9 imageByApplyingTransform:&v17];

  [v16 writeToTIFF:v8];
}

- (id)ciImageTiled:(BOOL)a3 closed:(BOOL)a4 pressureMode:(int64_t)a5 filled:(BOOL)a6
{
  [(NUBrushStroke *)self extent];

  return 0;
}

- (id)ciImageTiled:(BOOL)a3 closed:(BOOL)a4 pressureMode:(int64_t)a5
{
  return [(NUBrushStroke *)self ciImageTiled:a3 closed:a4 pressureMode:a5 filled:0];
}

@end