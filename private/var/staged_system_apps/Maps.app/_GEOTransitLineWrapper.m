@interface _GEOTransitLineWrapper
- (BOOL)departuresAreVehicleSpecific;
- (BOOL)hasLineColorString;
- (BOOL)isBus;
- (BOOL)showVehicleNumber;
- (GEOMapItemIdentifier)identifier;
- (GEOTransitArtworkDataSource)alternateArtwork;
- (GEOTransitArtworkDataSource)artwork;
- (GEOTransitArtworkDataSource)headerArtwork;
- (GEOTransitArtworkDataSource)modeArtwork;
- (GEOTransitSystem)system;
- (NSArray)operatingHours;
- (NSString)lineColorString;
- (NSString)name;
- (_GEOTransitLineWrapper)initWithName:(id)a3 artwork:(id)a4;
- (unint64_t)departureTimeDisplayStyle;
- (unint64_t)muid;
@end

@implementation _GEOTransitLineWrapper

- (_GEOTransitLineWrapper)initWithName:(id)a3 artwork:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GEOTransitLineWrapper;
  v8 = [(_GEOTransitLineWrapper *)&v12 init];
  if (v8)
  {
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = (NSString *)[v6 copy];
      name = v8->_name;
      v8->_name = v9;
    }
    if (!v7 || [v7 conformsToProtocol:&OBJC_PROTOCOL___GEOTransitArtworkDataSource]) {
      objc_storeStrong((id *)&v8->_artwork, a4);
    }
  }

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (GEOTransitArtworkDataSource)artwork
{
  return self->_artwork;
}

- (unint64_t)muid
{
  return 0;
}

- (GEOMapItemIdentifier)identifier
{
  return 0;
}

- (GEOTransitSystem)system
{
  return 0;
}

- (GEOTransitArtworkDataSource)modeArtwork
{
  return 0;
}

- (GEOTransitArtworkDataSource)alternateArtwork
{
  return 0;
}

- (GEOTransitArtworkDataSource)headerArtwork
{
  return 0;
}

- (BOOL)hasLineColorString
{
  return 0;
}

- (NSString)lineColorString
{
  return 0;
}

- (BOOL)showVehicleNumber
{
  return 0;
}

- (NSArray)operatingHours
{
  return 0;
}

- (unint64_t)departureTimeDisplayStyle
{
  return 1;
}

- (BOOL)departuresAreVehicleSpecific
{
  return 0;
}

- (BOOL)isBus
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end