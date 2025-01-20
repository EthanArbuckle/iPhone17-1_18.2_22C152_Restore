@interface GuidanceManeuverArtwork
+ (GuidanceManeuverArtwork)artworkWithManeuver:(int)a3;
- (BOOL)isArriveManeuver;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRoundaboutManeuver;
- (BOOL)isStartRouteManeuver;
- (BOOL)isValue:(id)a3 equalTo:(id)a4;
- (GEOTransitArtworkDataSource)artworkDataSource;
- (GuidanceManeuverArtwork)initWithManeuver:(int)a3 junction:(id)a4 drivingSide:(int)a5 artworkDataSource:(id)a6;
- (MKJunction)junction;
- (int)drivingSide;
- (int)maneuver;
- (unint64_t)hash;
- (void)setArtworkDataSource:(id)a3;
@end

@implementation GuidanceManeuverArtwork

- (BOOL)isValue:(id)a3 equalTo:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  v7 = (void *)v6;
  if (!(v5 | v6)) {
    goto LABEL_2;
  }
  unsigned __int8 v8 = 0;
  if (v5 && v6)
  {
    if (v5 == v6)
    {
LABEL_2:
      unsigned __int8 v8 = 1;
      goto LABEL_3;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v8 = [(id)v5 isEqual:v7];
    }
    else {
      unsigned __int8 v8 = 0;
    }
  }
LABEL_3:

  return v8;
}

+ (GuidanceManeuverArtwork)artworkWithManeuver:(int)a3
{
  id v3 = [objc_alloc((Class)a1) initWithManeuver:*(void *)&a3 junction:0 drivingSide:0 artworkDataSource:0];

  return (GuidanceManeuverArtwork *)v3;
}

- (GuidanceManeuverArtwork)initWithManeuver:(int)a3 junction:(id)a4 drivingSide:(int)a5 artworkDataSource:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)GuidanceManeuverArtwork;
  v13 = [(GuidanceManeuverArtwork *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_maneuver = a3;
    objc_storeStrong((id *)&v13->_junction, a4);
    v14->_drivingSide = a5;
    objc_storeStrong((id *)&v14->_artworkDataSource, a6);
  }

  return v14;
}

- (BOOL)isStartRouteManeuver
{
  unsigned int v2 = [(GuidanceManeuverArtwork *)self maneuver];
  BOOL result = 1;
  if (v2 - 25 > 0x3D || ((1 << (v2 - 25)) & 0x3000000000000001) == 0) {
    return v2 == 17;
  }
  return result;
}

- (BOOL)isArriveManeuver
{
  unsigned int v2 = [(GuidanceManeuverArtwork *)self maneuver];
  return (v2 < 0x28) & (0x8600050000uLL >> v2);
}

- (BOOL)isRoundaboutManeuver
{
  unsigned int v2 = [(GuidanceManeuverArtwork *)self maneuver];
  return (v2 < 0x3C) & (0xFFFFE00000000C0uLL >> v2);
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_maneuver;
  unint64_t v4 = v3 ^ (unint64_t)[(MKJunction *)self->_junction hash];
  uint64_t v5 = 2654435761 * self->_drivingSide;
  return v4 ^ v5 ^ (unint64_t)[(GEOTransitArtworkDataSource *)self->_artworkDataSource hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (GuidanceManeuverArtwork *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else if ([(GuidanceManeuverArtwork *)v4 isMemberOfClass:objc_opt_class()] {
         && (int maneuver = self->_maneuver, maneuver == [(GuidanceManeuverArtwork *)v4 maneuver])
  }
         && (int drivingSide = self->_drivingSide, drivingSide == [(GuidanceManeuverArtwork *)v4 drivingSide])
         && (junction = self->_junction,
             [(GuidanceManeuverArtwork *)v4 junction],
             unsigned __int8 v8 = objc_claimAutoreleasedReturnValue(),
             LODWORD(junction) = [(GuidanceManeuverArtwork *)self isValue:junction equalTo:v8],
             v8,
             junction))
  {
    artworkDataSource = self->_artworkDataSource;
    v10 = [(GuidanceManeuverArtwork *)v4 artworkDataSource];
    BOOL v11 = [(GuidanceManeuverArtwork *)self isValue:artworkDataSource equalTo:v10];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (GEOTransitArtworkDataSource)artworkDataSource
{
  return self->_artworkDataSource;
}

- (void)setArtworkDataSource:(id)a3
{
}

- (int)maneuver
{
  return self->_maneuver;
}

- (MKJunction)junction
{
  return self->_junction;
}

- (int)drivingSide
{
  return self->_drivingSide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_junction, 0);

  objc_storeStrong((id *)&self->_artworkDataSource, 0);
}

@end