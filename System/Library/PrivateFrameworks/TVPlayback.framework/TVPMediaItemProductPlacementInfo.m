@interface TVPMediaItemProductPlacementInfo
- (NSNumber)duration;
- (NSString)imageUrlStringFormat;
- (NSString)localizedInfoString;
- (TVPMediaItemProductPlacementInfo)initWithLocalizedProductPlacementInfoString:(id)a3 duration:(id)a4 andImageURLStringFormat:(id)a5;
- (id)description;
- (void)setDuration:(id)a3;
- (void)setImageUrlStringFormat:(id)a3;
- (void)setLocalizedInfoString:(id)a3;
@end

@implementation TVPMediaItemProductPlacementInfo

- (TVPMediaItemProductPlacementInfo)initWithLocalizedProductPlacementInfoString:(id)a3 duration:(id)a4 andImageURLStringFormat:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TVPMediaItemProductPlacementInfo;
  v12 = [(TVPMediaItemProductPlacementInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localizedInfoString, a3);
    objc_storeStrong((id *)&v13->_duration, a4);
    objc_storeStrong((id *)&v13->_imageUrlStringFormat, a5);
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = [(TVPMediaItemProductPlacementInfo *)self localizedInfoString];
  v5 = [(TVPMediaItemProductPlacementInfo *)self duration];
  [v5 doubleValue];
  uint64_t v7 = v6;
  v8 = [(TVPMediaItemProductPlacementInfo *)self imageUrlStringFormat];
  id v9 = [v3 stringWithFormat:@"infoString - %@, duration - %f, urlString - %@", v4, v7, v8];

  return v9;
}

- (NSString)localizedInfoString
{
  return self->_localizedInfoString;
}

- (void)setLocalizedInfoString:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSString)imageUrlStringFormat
{
  return self->_imageUrlStringFormat;
}

- (void)setImageUrlStringFormat:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageUrlStringFormat, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_localizedInfoString, 0);
}

@end