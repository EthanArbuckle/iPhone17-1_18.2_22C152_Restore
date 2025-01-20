@interface VKCVisualSearchResultInfo
- (BOOL)_forceDefaultGlyphForDomain:(int64_t)a3;
- (CGRect)normalizedBoundingRect;
- (NSString)displayLabel;
- (NSString)displayMessage;
- (NSString)filledInfoButtonGlyphName;
- (NSString)glyphName;
- (NSString)infoButtonGlyphName;
- (VKCVisualSearchResultInfo)initWithResultItem:(id)a3;
- (VKCVisualSearchResultItem)item;
- (id)_infoButtonGlyphName;
- (int64_t)calcDomain;
- (int64_t)domain;
- (void)setDomain:(int64_t)a3;
- (void)setItem:(id)a3;
@end

@implementation VKCVisualSearchResultInfo

- (VKCVisualSearchResultInfo)initWithResultItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCVisualSearchResultInfo;
  v6 = [(VKCVisualSearchResultInfo *)&v9 init];
  v7 = v6;
  if (!v5)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((item) != nil)", "-[VKCVisualSearchResultInfo initWithResultItem:]", 0, 0, @"Expected non-nil value for '%s'", "item");
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v6)
  {
LABEL_3:
    objc_storeStrong((id *)&v7->_item, a3);
    v7->_domain = [(VKCVisualSearchResultInfo *)v7 calcDomain];
  }
LABEL_4:

  return v7;
}

- (NSString)displayLabel
{
  v2 = [(VKCVisualSearchResultInfo *)self item];
  v3 = [v2 domainInfo];
  v4 = [v3 displayLabel];
  id v5 = v4;
  if (!v4) {
    v4 = &stru_1F35566F8;
  }
  v6 = v4;

  return v6;
}

- (NSString)displayMessage
{
  v2 = [(VKCVisualSearchResultInfo *)self item];
  v3 = [v2 domainInfo];
  v4 = [v3 displayMessage];
  id v5 = v4;
  if (!v4) {
    v4 = &stru_1F35566F8;
  }
  v6 = v4;

  return v6;
}

- (NSString)glyphName
{
  v2 = [(VKCVisualSearchResultInfo *)self item];
  v3 = [v2 domainInfo];
  v4 = [v3 glyphName];
  id v5 = v4;
  if (!v4) {
    v4 = &stru_1F35566F8;
  }
  v6 = v4;

  return v6;
}

- (CGRect)normalizedBoundingRect
{
  v2 = [(VKCVisualSearchResultInfo *)self item];
  [v2 normalizedBoundingBox];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSString)infoButtonGlyphName
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(VKCVisualSearchResultInfo *)self _forceDefaultGlyphForDomain:[(VKCVisualSearchResultInfo *)self domain]]|| ([(VKCVisualSearchResultInfo *)self _infoButtonGlyphName], (double v3 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v3 = @"info.circle.badge.sparkles";
  }
  if (vk_isInternalBuild() || vk_isSeedBuild())
  {
    double v4 = objc_msgSend(MEMORY[0x1E4F42A80], "vk_symbolImageWithName:", v3);
    if (!v4)
    {
      double v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        double v6 = [(VKCVisualSearchResultInfo *)self item];
        double v7 = [v6 domainInfo];
        double v8 = [v7 domain];
        double v9 = [v8 lastPathComponent];
        int v11 = 138412290;
        double v12 = v9;
        _os_log_impl(&dword_1DB266000, v5, OS_LOG_TYPE_DEFAULT, "Unable to find glyph for domain: %@", (uint8_t *)&v11, 0xCu);
      }
      double v3 = @"info.circle.badge.sparkles";
    }
  }
  return (NSString *)v3;
}

- (BOOL)_forceDefaultGlyphForDomain:(int64_t)a3
{
  return ((unint64_t)a3 < 0x12) & (0x30246u >> a3);
}

- (id)_infoButtonGlyphName
{
  unint64_t v2 = [(VKCVisualSearchResultInfo *)self domain];
  if (v2 > 0x13) {
    return 0;
  }
  else {
    return off_1E6BF2890[v2];
  }
}

- (NSString)filledInfoButtonGlyphName
{
  unint64_t v2 = [(VKCVisualSearchResultInfo *)self infoButtonGlyphName];
  double v3 = [v2 stringByAppendingString:@".fill"];

  return (NSString *)v3;
}

- (int64_t)calcDomain
{
  unint64_t v2 = [(VKCVisualSearchResultInfo *)self item];
  double v3 = [v2 domainInfo];
  double v4 = [v3 domain];
  double v5 = [v4 pathExtension];

  if ([v5 isEqualToString:@"album"]) {
    goto LABEL_2;
  }
  if ([v5 isEqualToString:@"art"])
  {
    int64_t v6 = 2;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"birds"])
  {
    int64_t v6 = 5;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"book"])
  {
    int64_t v6 = 6;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"cats"])
  {
    int64_t v6 = 7;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"dogs"])
  {
    int64_t v6 = 8;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"food"])
  {
    int64_t v6 = 9;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"insects"])
  {
    int64_t v6 = 10;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"landmark"])
  {
    int64_t v6 = 11;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"mammals"])
  {
    int64_t v6 = 12;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"naturalLandmark"])
  {
    int64_t v6 = 13;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"nature"])
  {
    int64_t v6 = 14;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"reptiles"])
  {
    int64_t v6 = 15;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"sculpture"])
  {
    int64_t v6 = 16;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"skyline"])
  {
    int64_t v6 = 17;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"storefront"])
  {
    int64_t v6 = 18;
    goto LABEL_41;
  }
  if ([v5 isEqualToString:@"album"])
  {
LABEL_2:
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"laundryCareSymbol"])
  {
    int64_t v6 = 19;
  }
  else if ([v5 isEqualToString:@"brandLogoSymbol"])
  {
    int64_t v6 = 4;
  }
  else if ([v5 isEqualToString:@"autoSymbol"])
  {
    int64_t v6 = 3;
  }
  else
  {
    int64_t v6 = 0;
  }
LABEL_41:

  return v6;
}

- (VKCVisualSearchResultItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (void).cxx_destruct
{
}

@end