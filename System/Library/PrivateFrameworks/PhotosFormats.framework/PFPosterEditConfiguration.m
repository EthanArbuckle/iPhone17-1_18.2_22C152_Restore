@interface PFPosterEditConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isDepthAvailable;
- (BOOL)isDepthEnabled;
- (BOOL)isLandscapeDepthEnabled;
- (BOOL)isPerspectiveZoomEnabled;
- (BOOL)isSettlingEffectAvailable;
- (BOOL)isSettlingEffectEnabled;
- (CGRect)normalizedLandscapeVisibleFrame;
- (CGRect)normalizedVisibleFrame;
- (NSString)description;
- (PFParallaxLayerStyle)style;
- (PFPosterEditConfiguration)init;
- (PFPosterEditConfiguration)initWithCoder:(id)a3;
- (id)analyticsPayload;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIsDepthAvailable:(BOOL)a3;
- (void)setIsDepthEnabled:(BOOL)a3;
- (void)setIsLandscapeDepthEnabled:(BOOL)a3;
- (void)setIsPerspectiveZoomEnabled:(BOOL)a3;
- (void)setIsSettlingEffectAvailable:(BOOL)a3;
- (void)setIsSettlingEffectEnabled:(BOOL)a3;
- (void)setNormalizedLandscapeVisibleFrame:(CGRect)a3;
- (void)setNormalizedVisibleFrame:(CGRect)a3;
- (void)setStyle:(id)a3;
@end

@implementation PFPosterEditConfiguration

- (void).cxx_destruct
{
}

- (void)setIsSettlingEffectAvailable:(BOOL)a3
{
  self->_isSettlingEffectAvailable = a3;
}

- (BOOL)isSettlingEffectAvailable
{
  return self->_isSettlingEffectAvailable;
}

- (void)setIsSettlingEffectEnabled:(BOOL)a3
{
  self->_isSettlingEffectEnabled = a3;
}

- (BOOL)isSettlingEffectEnabled
{
  return self->_isSettlingEffectEnabled;
}

- (void)setIsLandscapeDepthEnabled:(BOOL)a3
{
  self->_isLandscapeDepthEnabled = a3;
}

- (BOOL)isLandscapeDepthEnabled
{
  return self->_isLandscapeDepthEnabled;
}

- (void)setIsDepthAvailable:(BOOL)a3
{
  self->_isDepthAvailable = a3;
}

- (BOOL)isDepthAvailable
{
  return self->_isDepthAvailable;
}

- (void)setIsDepthEnabled:(BOOL)a3
{
  self->_isDepthEnabled = a3;
}

- (BOOL)isDepthEnabled
{
  return self->_isDepthEnabled;
}

- (void)setIsPerspectiveZoomEnabled:(BOOL)a3
{
  self->_isPerspectiveZoomEnabled = a3;
}

- (BOOL)isPerspectiveZoomEnabled
{
  return self->_isPerspectiveZoomEnabled;
}

- (void)setNormalizedLandscapeVisibleFrame:(CGRect)a3
{
  self->_normalizedLandscapeVisibleFrame = a3;
}

- (CGRect)normalizedLandscapeVisibleFrame
{
  double x = self->_normalizedLandscapeVisibleFrame.origin.x;
  double y = self->_normalizedLandscapeVisibleFrame.origin.y;
  double width = self->_normalizedLandscapeVisibleFrame.size.width;
  double height = self->_normalizedLandscapeVisibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNormalizedVisibleFrame:(CGRect)a3
{
  self->_normalizedVisibleFrame = a3;
}

- (CGRect)normalizedVisibleFrame
{
  double x = self->_normalizedVisibleFrame.origin.x;
  double y = self->_normalizedVisibleFrame.origin.y;
  double width = self->_normalizedVisibleFrame.size.width;
  double height = self->_normalizedVisibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStyle:(id)a3
{
}

- (PFParallaxLayerStyle)style
{
  return self->_style;
}

- (NSString)description
{
  id v23 = [NSString alloc];
  v3 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v3);
  v21 = [(PFPosterEditConfiguration *)self style];
  [(PFPosterEditConfiguration *)self normalizedVisibleFrame];
  v8 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", v4, v5, v6, v7];
  [(PFPosterEditConfiguration *)self normalizedLandscapeVisibleFrame];
  v13 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", v9, v10, v11, v12];
  if ([(PFPosterEditConfiguration *)self isPerspectiveZoomEnabled]) {
    v14 = @"Y";
  }
  else {
    v14 = @"N";
  }
  v15 = @"A";
  if ([(PFPosterEditConfiguration *)self isDepthAvailable]) {
    v16 = @"A";
  }
  else {
    v16 = @"NA";
  }
  if ([(PFPosterEditConfiguration *)self isDepthEnabled]) {
    v17 = @"Y";
  }
  else {
    v17 = @"N";
  }
  if (![(PFPosterEditConfiguration *)self isSettlingEffectAvailable]) {
    v15 = @"NA";
  }
  if ([(PFPosterEditConfiguration *)self isSettlingEffectEnabled]) {
    v18 = @"Y";
  }
  else {
    v18 = @"N";
  }
  v19 = objc_msgSend(v23, "initWithFormat:", @"<%@ %p; style: %@; norm. visible frame: %@; land. norm. visible frame: %@; zoom: %@; depth: %@|%@; settle: %@|%@>",
                  v22,
                  self,
                  v21,
                  v8,
                  v13,
                  v14,
                  v16,
                  v17,
                  v15,
                  v18);

  return (NSString *)v19;
}

- (PFPosterEditConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PFPosterEditConfiguration;
  uint64_t v5 = [(PFPosterEditConfiguration *)&v21 init];
  if ([v4 containsValueForKey:@"version"]) {
    unint64_t v6 = [v4 decodeIntegerForKey:@"version"];
  }
  else {
    unint64_t v6 = 0;
  }
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"style"];
  v8 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v7;

  if (v6)
  {
    [v4 decodeRectForKey:@"visibleFrame"];
    *((void *)v5 + 3) = v9;
    *((void *)v5 + 4) = v10;
    *((void *)v5 + 5) = v11;
    *((void *)v5 + 6) = v12;
    [v4 decodeRectForKey:@"landscapeVisibleFrame"];
    *((void *)v5 + 7) = v13;
    *((void *)v5 + 8) = v14;
    *((void *)v5 + 9) = v15;
    *((void *)v5 + 10) = v16;
  }
  else
  {
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v5 + 24) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v5 + 40) = v17;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      v20[0] = 0;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Decoded PFPosterEditConfiguration contains legacy visible frame, ignored.", (uint8_t *)v20, 2u);
    }
  }
  v5[8] = [v4 decodeBoolForKey:@"isPerspectiveZoomEnabled"];
  v5[9] = [v4 decodeBoolForKey:@"isDepthEnabled"];
  v5[10] = [v4 decodeBoolForKey:@"isDepthAvailable"];
  v5[11] = [v4 decodeBoolForKey:@"isLandscapeDepthEnabled"];
  if (v6 < 2)
  {
    char v18 = 0;
    v5[12] = 0;
  }
  else
  {
    v5[12] = [v4 decodeBoolForKey:@"isSettlingEffectEnabled"];
    char v18 = [v4 decodeBoolForKey:@"isSettlingEffectAvailable"];
  }
  v5[13] = v18;

  return (PFPosterEditConfiguration *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:2 forKey:@"version"];
  id v4 = [(PFPosterEditConfiguration *)self style];
  [v5 encodeObject:v4 forKey:@"style"];

  [(PFPosterEditConfiguration *)self normalizedVisibleFrame];
  objc_msgSend(v5, "encodeRect:forKey:", @"visibleFrame");
  [(PFPosterEditConfiguration *)self normalizedLandscapeVisibleFrame];
  objc_msgSend(v5, "encodeRect:forKey:", @"landscapeVisibleFrame");
  objc_msgSend(v5, "encodeBool:forKey:", -[PFPosterEditConfiguration isPerspectiveZoomEnabled](self, "isPerspectiveZoomEnabled"), @"isPerspectiveZoomEnabled");
  objc_msgSend(v5, "encodeBool:forKey:", -[PFPosterEditConfiguration isDepthEnabled](self, "isDepthEnabled"), @"isDepthEnabled");
  objc_msgSend(v5, "encodeBool:forKey:", -[PFPosterEditConfiguration isDepthAvailable](self, "isDepthAvailable"), @"isDepthAvailable");
  objc_msgSend(v5, "encodeBool:forKey:", -[PFPosterEditConfiguration isLandscapeDepthEnabled](self, "isLandscapeDepthEnabled"), @"isLandscapeDepthEnabled");
  objc_msgSend(v5, "encodeBool:forKey:", -[PFPosterEditConfiguration isSettlingEffectEnabled](self, "isSettlingEffectEnabled"), @"isSettlingEffectEnabled");
  objc_msgSend(v5, "encodeBool:forKey:", -[PFPosterEditConfiguration isSettlingEffectAvailable](self, "isSettlingEffectAvailable"), @"isSettlingEffectAvailable");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PFPosterEditConfiguration allocWithZone:a3];
  objc_storeStrong((id *)&v4->_style, self->_style);
  CGPoint origin = self->_normalizedVisibleFrame.origin;
  v4->_normalizedVisibleFrame.size = self->_normalizedVisibleFrame.size;
  v4->_normalizedVisibleFrame.CGPoint origin = origin;
  CGPoint v6 = self->_normalizedLandscapeVisibleFrame.origin;
  v4->_normalizedLandscapeVisibleFrame.size = self->_normalizedLandscapeVisibleFrame.size;
  v4->_normalizedLandscapeVisibleFrame.CGPoint origin = v6;
  v4->_isPerspectiveZoomEnabled = self->_isPerspectiveZoomEnabled;
  v4->_isDepthEnabled = self->_isDepthEnabled;
  v4->_isDepthAvailable = self->_isDepthAvailable;
  v4->_isLandscapeDepthEnabled = self->_isLandscapeDepthEnabled;
  v4->_isSettlingEffectEnabled = self->_isSettlingEffectEnabled;
  v4->_isSettlingEffectAvailable = self->_isSettlingEffectAvailable;
  return v4;
}

- (id)analyticsPayload
{
  v17[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v16[0] = @"perspective_zoom_enabled";
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PFPosterEditConfiguration isPerspectiveZoomEnabled](self, "isPerspectiveZoomEnabled"));
  v17[0] = v4;
  v16[1] = @"depth_enabled";
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[PFPosterEditConfiguration isDepthEnabled](self, "isDepthEnabled"));
  v17[1] = v5;
  v16[2] = @"landscape_depth_enabled";
  CGPoint v6 = objc_msgSend(NSNumber, "numberWithBool:", -[PFPosterEditConfiguration isLandscapeDepthEnabled](self, "isLandscapeDepthEnabled"));
  v17[2] = v6;
  v16[3] = @"depth_available";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PFPosterEditConfiguration isDepthAvailable](self, "isDepthAvailable"));
  v17[3] = v7;
  v16[4] = @"settling_effect_enabled";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PFPosterEditConfiguration isSettlingEffectEnabled](self, "isSettlingEffectEnabled"));
  v17[4] = v8;
  v16[5] = @"settling_effect_available";
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[PFPosterEditConfiguration isSettlingEffectAvailable](self, "isSettlingEffectAvailable"));
  v17[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];
  uint64_t v11 = (void *)[v3 initWithDictionary:v10];

  uint64_t v12 = [(PFPosterEditConfiguration *)self style];

  if (v12)
  {
    uint64_t v13 = [(PFPosterEditConfiguration *)self style];
    uint64_t v14 = [v13 kind];
    [v11 setObject:v14 forKeyedSubscript:@"style_kind"];
  }

  return v11;
}

- (PFPosterEditConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFPosterEditConfiguration;
  CGRect result = [(PFPosterEditConfiguration *)&v4 init];
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  result->_normalizedVisibleFrame.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  result->_normalizedVisibleFrame.size = v3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end