@interface WLKSportImageDetails
- (BOOL)disableGradient;
- (BOOL)isP3;
- (BOOL)supportsLayeredImage;
- (NSString)joeColor;
- (NSString)url;
- (WLKSportImageDetails)initWithDictionary:(id)a3;
- (int64_t)height;
- (int64_t)width;
@end

@implementation WLKSportImageDetails

- (WLKSportImageDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WLKSportImageDetails;
  v5 = [(WLKSportImageDetails *)&v13 init];
  if (v5)
  {
    v5->_disableGradient = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"disableGradient", 0);
    v6 = objc_msgSend(v4, "wlk_numberForKey:", @"height");
    v5->_height = [v6 integerValue];

    v5->_isP3 = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"isP3", 0);
    uint64_t v7 = objc_msgSend(v4, "wlk_stringForKey:", @"joeColor");
    joeColor = v5->_joeColor;
    v5->_joeColor = (NSString *)v7;

    v5->_supportsLayeredImage = objc_msgSend(v4, "wlk_BOOLForKey:defaultValue:", @"supportsLayeredImage", 0);
    uint64_t v9 = objc_msgSend(v4, "wlk_stringForKey:", @"url");
    url = v5->_url;
    v5->_url = (NSString *)v9;

    v11 = objc_msgSend(v4, "wlk_numberForKey:", @"width");
    v5->_width = [v11 integerValue];
  }
  return v5;
}

- (BOOL)disableGradient
{
  return self->_disableGradient;
}

- (int64_t)height
{
  return self->_height;
}

- (BOOL)isP3
{
  return self->_isP3;
}

- (NSString)joeColor
{
  return self->_joeColor;
}

- (BOOL)supportsLayeredImage
{
  return self->_supportsLayeredImage;
}

- (NSString)url
{
  return self->_url;
}

- (int64_t)width
{
  return self->_width;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_joeColor, 0);
}

@end