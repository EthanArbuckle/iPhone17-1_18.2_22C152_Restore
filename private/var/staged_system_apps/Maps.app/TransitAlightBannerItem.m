@interface TransitAlightBannerItem
- (TransitAlightBannerItem)initWithGuidanceState:(id)a3;
- (TransitAlightMessage)alightMessage;
- (id)artwork;
- (id)subtitle;
- (id)title;
- (unint64_t)bannerType;
@end

@implementation TransitAlightBannerItem

- (TransitAlightBannerItem)initWithGuidanceState:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitAlightBannerItem;
  v5 = [(BannerItem *)&v9 initWithGuidanceState:v4];
  if (v5)
  {
    uint64_t v6 = [v4 uniqueIdForBannerType:2];
    uniqueId = v5->super._uniqueId;
    v5->super._uniqueId = (NSString *)v6;
  }
  return v5;
}

- (TransitAlightMessage)alightMessage
{
  v2 = [(BannerItem *)self guidanceState];
  v3 = [v2 alightMessage];

  return (TransitAlightMessage *)v3;
}

- (unint64_t)bannerType
{
  return 2;
}

- (id)artwork
{
  v2 = [(TransitAlightBannerItem *)self alightMessage];
  v3 = [v2 artwork];

  return v3;
}

- (id)title
{
  v2 = [(TransitAlightBannerItem *)self alightMessage];
  v3 = [v2 title];

  return v3;
}

- (id)subtitle
{
  v2 = [(TransitAlightBannerItem *)self alightMessage];
  v3 = [v2 detail];

  return v3;
}

@end