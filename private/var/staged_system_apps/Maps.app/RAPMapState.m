@interface RAPMapState
- (BOOL)isEqual:(id)a3;
- (BOOL)isShowingImagery;
- (BOOL)isShowingLabels;
- (BOOL)isShowingTraffic;
- (BOOL)isSprMap;
- (GEOMapRegion)mapRegion;
- (GEOMapServiceTraits)traits;
- (MKMapCamera)mapCamera;
- (NSArray)mapVisibleTileSets;
- (NSData)mapSnapshotImageData;
- (NSString)debugDescription;
- (RAPLookAroundContext)reportedLookAroundContext;
- (RAPMapState)initWithMapView:(id)a3 traits:(id)a4 place:(id)a5;
- (RAPMapState)initWithTraits:(id)a3;
- (RAPPlace)reportedPlace;
- (RAPPlacecardImageryContext)placecardImageryContext;
- (RAPTransitLine)reportedLine;
- (double)mapZoomLevel;
- (id)copyWithReportedPlace:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)mapType;
- (void)setMapSnapshotImageData:(id)a3;
- (void)setReportedLine:(id)a3;
- (void)setReportedPlace:(id)a3;
@end

@implementation RAPMapState

- (RAPMapState)initWithTraits:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPMapState;
  v6 = [(RAPMapState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_traits, a3);
  }

  return v7;
}

- (RAPMapState)initWithMapView:(id)a3 traits:(id)a4 place:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)RAPMapState;
  v11 = [(RAPMapState *)&v20 init];
  if (v11)
  {
    v11->_isShowingImagery = [v8 isShowingImagery];
    v11->_isShowingLabels = ((unint64_t)[v8 mapType] & 0xFFFFFFFFFFFFFFFDLL) != 1;
    [v8 _zoomLevel];
    v11->_mapZoomLevel = v12;
    uint64_t v13 = [v8 mapRegion];
    mapRegion = v11->_mapRegion;
    v11->_mapRegion = (GEOMapRegion *)v13;

    v11->_mapType = (unint64_t)[v8 mapType];
    v11->_isShowingTraffic = [v8 showsTraffic];
    v11->_isSprMap = [v8 _isShowingCuratedElevatedGround];
    uint64_t v15 = [v8 _visibleTileSets];
    mapVisibleTileSets = v11->_mapVisibleTileSets;
    v11->_mapVisibleTileSets = (NSArray *)v15;

    uint64_t v17 = [v8 camera];
    mapCamera = v11->_mapCamera;
    v11->_mapCamera = (MKMapCamera *)v17;

    objc_storeStrong((id *)&v11->_traits, a4);
    objc_storeStrong((id *)&v11->_reportedPlace, a5);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_mapSnapshotImageData copyWithZone:a3];
  v7 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v6;

  *((unsigned char *)v5 + 9) = self->_isShowingImagery;
  *((unsigned char *)v5 + 8) = self->_isShowingLabels;
  *((void *)v5 + 6) = *(void *)&self->_mapZoomLevel;
  id v8 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  id v9 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v8;

  *((void *)v5 + 7) = self->_mapType;
  id v10 = [(NSArray *)self->_mapVisibleTileSets copyWithZone:a3];
  v11 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v10;

  id v12 = [(MKMapCamera *)self->_mapCamera copyWithZone:a3];
  uint64_t v13 = (void *)*((void *)v5 + 10);
  *((void *)v5 + 10) = v12;

  id v14 = [(GEOMapServiceTraits *)self->_traits copyWithZone:a3];
  uint64_t v15 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v14;

  objc_storeStrong((id *)v5 + 2, self->_reportedPlace);
  id v16 = [(RAPTransitLine *)self->_reportedLine copyWithZone:a3];
  uint64_t v17 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v16;

  objc_storeStrong((id *)v5 + 11, self->_reportedLookAroundContext);
  *((unsigned char *)v5 + 10) = self->_isShowingTraffic;
  *((unsigned char *)v5 + 11) = self->_isSprMap;
  return v5;
}

- (id)copyWithReportedPlace:(id)a3
{
  id v4 = a3;
  id v5 = [(RAPMapState *)self copyWithZone:0];
  id v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RAPMapState *)a3;
  if (self == v4)
  {
    BOOL v24 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL isShowingLabels = self->_isShowingLabels;
      if (isShowingLabels != [(RAPMapState *)v5 isShowingLabels]
        || (BOOL isShowingImagery = self->_isShowingImagery,
            isShowingImagery != [(RAPMapState *)v5 isShowingImagery])
        || (double mapZoomLevel = self->_mapZoomLevel, [(RAPMapState *)v5 mapZoomLevel], mapZoomLevel != v9)
        || (id mapType = self->_mapType, mapType != (id)[(RAPMapState *)v5 mapType]))
      {
        BOOL v24 = 0;
LABEL_19:

        goto LABEL_20;
      }
      mapRegion = self->_mapRegion;
      id v12 = [(RAPMapState *)v5 mapRegion];
      if (![(GEOMapRegion *)mapRegion isEqual:v12])
      {
        BOOL v24 = 0;
LABEL_54:

        goto LABEL_19;
      }
      mapVisibleTileSets = self->_mapVisibleTileSets;
      id v14 = [(RAPMapState *)v5 mapVisibleTileSets];
      if (![(NSArray *)mapVisibleTileSets isEqual:v14])
      {
        BOOL v24 = 0;
LABEL_53:

        goto LABEL_54;
      }
      mapCamera = self->_mapCamera;
      id v16 = [(RAPMapState *)v5 mapCamera];
      if (![(MKMapCamera *)mapCamera isEqual:v16])
      {
        BOOL v24 = 0;
LABEL_52:

        goto LABEL_53;
      }
      traits = self->_traits;
      v18 = [(RAPMapState *)v5 traits];
      if (![(GEOMapServiceTraits *)traits isEqual:v18])
      {
        BOOL v24 = 0;
LABEL_51:

        goto LABEL_52;
      }
      reportedPlace = self->_reportedPlace;
      objc_super v20 = reportedPlace;
      if (!reportedPlace)
      {
        uint64_t v21 = [(RAPMapState *)v5 reportedPlace];
        if (!v21)
        {
          v40 = 0;
          int v23 = 0;
          goto LABEL_27;
        }
        v40 = (void *)v21;
        objc_super v20 = self->_reportedPlace;
      }
      v22 = [(RAPMapState *)v5 reportedPlace];
      if (![(RAPPlace *)v20 isEqual:v22])
      {
        BOOL v24 = 0;
        goto LABEL_48;
      }
      v42 = v22;
      int v23 = 1;
LABEL_27:
      reportedLine = self->_reportedLine;
      v43 = reportedLine;
      if (!reportedLine)
      {
        uint64_t v27 = [(RAPMapState *)v5 reportedLine];
        if (!v27)
        {
          int v38 = v23;
          int v39 = 0;
          v37 = 0;
          goto LABEL_34;
        }
        v37 = (void *)v27;
        reportedLine = self->_reportedLine;
      }
      v41 = [(RAPMapState *)v5 reportedLine];
      if (!-[RAPTransitLine isEqual:](reportedLine, "isEqual:"))
      {
        BOOL v24 = 0;
        v22 = v42;
LABEL_43:

        goto LABEL_46;
      }
      int v38 = v23;
      int v39 = 1;
LABEL_34:
      reportedLookAroundContext = self->_reportedLookAroundContext;
      v29 = reportedLookAroundContext;
      if (!reportedLookAroundContext)
      {
        uint64_t v30 = [(RAPMapState *)v5 reportedLookAroundContext];
        if (!v30)
        {
          v34 = 0;
          int v35 = 0;
          goto LABEL_59;
        }
        uint64_t v33 = v30;
        v29 = self->_reportedLookAroundContext;
      }
      uint64_t v31 = [(RAPMapState *)v5 reportedLookAroundContext];
      if (v29 != (RAPLookAroundContext *)v31)
      {
        BOOL v24 = 0;
        v29 = (RAPLookAroundContext *)v31;
LABEL_39:

        goto LABEL_40;
      }
      int v35 = 1;
LABEL_59:
      BOOL isShowingTraffic = self->_isShowingTraffic;
      if (isShowingTraffic == [(RAPMapState *)v5 isShowingTraffic])
      {
        BOOL isSprMap = self->_isSprMap;
        BOOL v24 = isSprMap == [(RAPMapState *)v5 isSprMap];
        if (v35) {
          goto LABEL_39;
        }
      }
      else
      {
        BOOL v24 = 0;
        if (v35) {
          goto LABEL_39;
        }
      }
LABEL_40:
      if (reportedLookAroundContext)
      {
        v22 = v42;
        if (v39)
        {
LABEL_42:
          int v23 = v38;
          goto LABEL_43;
        }
      }
      else
      {

        v22 = v42;
        if (v39) {
          goto LABEL_42;
        }
      }
      int v23 = v38;
LABEL_46:
      if (v43)
      {
        if (!v23) {
          goto LABEL_49;
        }
      }
      else
      {

        if ((v23 & 1) == 0)
        {
LABEL_49:
          if (!reportedPlace) {

          }
          goto LABEL_51;
        }
      }
LABEL_48:

      goto LABEL_49;
    }
    BOOL v24 = 0;
  }
LABEL_20:

  return v24;
}

- (unint64_t)hash
{
  unint64_t mapZoomLevel = (unint64_t)self->_mapZoomLevel;
  unint64_t v4 = self->_isShowingImagery ^ self->_isShowingLabels ^ self->_mapType;
  unint64_t v5 = v4 ^ (unint64_t)[(GEOMapRegion *)self->_mapRegion hash];
  unint64_t v6 = v5 ^ (unint64_t)[(NSArray *)self->_mapVisibleTileSets hash];
  unint64_t v7 = v6 ^ (unint64_t)[(MKMapCamera *)self->_mapCamera hash];
  unint64_t v8 = v7 ^ (unint64_t)[(GEOMapServiceTraits *)self->_traits hash] ^ mapZoomLevel;
  unint64_t v9 = (unint64_t)[(RAPPlace *)self->_reportedPlace hash];
  unint64_t v10 = v9 ^ [(RAPTransitLine *)self->_reportedLine hash];
  return v8 ^ v10 ^ (unint64_t)[(RAPLookAroundContext *)self->_reportedLookAroundContext hash] ^ self->_isShowingTraffic ^ self->_isSprMap;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc((Class)NSMutableString);
  v12.receiver = self;
  v12.super_class = (Class)RAPMapState;
  unint64_t v4 = [(RAPMapState *)&v12 description];
  id v5 = [v3 initWithString:v4];

  if (self->_isShowingImagery) {
    CFStringRef v6 = @"\nis showing imagery";
  }
  else {
    CFStringRef v6 = @"\nis not showing imagery";
  }
  [v5 appendString:v6];
  if (self->_isShowingLabels) {
    CFStringRef v7 = @"\nis showing labels";
  }
  else {
    CFStringRef v7 = @"\nis not showing labels";
  }
  [v5 appendString:v7];
  [v5 appendFormat:@"\nzoom level: %f", *(void *)&self->_mapZoomLevel];
  [v5 appendFormat:@"\nmap type: %lu", self->_mapType];
  [v5 appendFormat:@"\ncamera: %@", self->_mapCamera];
  [v5 appendFormat:@"\nregion: %@", self->_mapRegion];
  [v5 appendFormat:@"\ntraits: %@", self->_traits];
  if (self->_reportedLine) {
    [v5 appendFormat:@"\nreported line: %@", self->_reportedLine];
  }
  if (self->_reportedPlace) {
    [v5 appendFormat:@"\nreported place: %@", self->_reportedPlace];
  }
  if (self->_isShowingTraffic) {
    CFStringRef v8 = @"\nis showing traffic";
  }
  else {
    CFStringRef v8 = @"\nis not showing traffic";
  }
  [v5 appendString:v8];
  if (self->_isSprMap) {
    CFStringRef v9 = @"\nis showing spr";
  }
  else {
    CFStringRef v9 = @"\nis not showing spr";
  }
  [v5 appendString:v9];
  id v10 = [v5 copy];

  return (NSString *)v10;
}

- (BOOL)isShowingLabels
{
  return self->_isShowingLabels;
}

- (BOOL)isShowingImagery
{
  return self->_isShowingImagery;
}

- (RAPPlace)reportedPlace
{
  return self->_reportedPlace;
}

- (void)setReportedPlace:(id)a3
{
}

- (RAPTransitLine)reportedLine
{
  return self->_reportedLine;
}

- (void)setReportedLine:(id)a3
{
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (GEOMapRegion)mapRegion
{
  return self->_mapRegion;
}

- (double)mapZoomLevel
{
  return self->_mapZoomLevel;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (NSData)mapSnapshotImageData
{
  return self->_mapSnapshotImageData;
}

- (void)setMapSnapshotImageData:(id)a3
{
}

- (NSArray)mapVisibleTileSets
{
  return self->_mapVisibleTileSets;
}

- (MKMapCamera)mapCamera
{
  return self->_mapCamera;
}

- (RAPLookAroundContext)reportedLookAroundContext
{
  return self->_reportedLookAroundContext;
}

- (RAPPlacecardImageryContext)placecardImageryContext
{
  return self->_placecardImageryContext;
}

- (BOOL)isShowingTraffic
{
  return self->_isShowingTraffic;
}

- (BOOL)isSprMap
{
  return self->_isSprMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placecardImageryContext, 0);
  objc_storeStrong((id *)&self->_reportedLookAroundContext, 0);
  objc_storeStrong((id *)&self->_mapCamera, 0);
  objc_storeStrong((id *)&self->_mapVisibleTileSets, 0);
  objc_storeStrong((id *)&self->_mapSnapshotImageData, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_reportedLine, 0);

  objc_storeStrong((id *)&self->_reportedPlace, 0);
}

@end