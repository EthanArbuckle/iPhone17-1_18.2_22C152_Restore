@interface GEOTransitStepBadge
+ (id)_maps_artworkListFromStepBadges:(id)a3;
- (id)_maps_artworkCluster;
@end

@implementation GEOTransitStepBadge

+ (id)_maps_artworkListFromStepBadges:(id)a3
{
  return sub_100099700(a3, &stru_1012FAAE8);
}

- (id)_maps_artworkCluster
{
  if (([(GEOTransitStepBadge *)self hasArtwork] & 1) != 0
    || [(GEOTransitStepBadge *)self hasText])
  {
    id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    if ([(GEOTransitStepBadge *)self hasArtwork])
    {
      v4 = [(GEOTransitStepBadge *)self artwork];
      [v3 addObject:v4];
    }
    if ([(GEOTransitStepBadge *)self hasText])
    {
      id v5 = objc_alloc((Class)MKTransitText);
      v6 = [(GEOTransitStepBadge *)self text];
      id v7 = [v5 initWithFormattedString:v6];

      id v8 = [objc_alloc((Class)MKTransitArtwork) initWithText:v7];
      [v3 addObject:v8];
    }
    id v12 = v3;
    id v9 = v3;
    v10 = +[NSArray arrayWithObjects:&v12 count:1];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end