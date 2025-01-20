@interface VKSharedLocationRouteWaypoint
- (NSString)annotationText;
- (NSString)customImageKey;
- (VKCustomImageProvider)imageProvider;
- (VKSharedLocationRouteWaypoint)initWithWaypoint:(id)a3 displayInfo:(id)a4 legIndex:(unint64_t)a5 routeCoordinate:(id)a6 adjacentRouteCoordinate:(id)a7 polylineCoordinate:(PolylineCoordinate)a8;
- (void)setAnnotationText:(id)a3;
- (void)setImageProvider:(id)a3 withKey:(id)a4;
@end

@implementation VKSharedLocationRouteWaypoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationText, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_customImageKey, 0);
}

- (NSString)annotationText
{
  return self->_annotationText;
}

- (VKCustomImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (NSString)customImageKey
{
  return self->_customImageKey;
}

- (void)setAnnotationText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_annotationText, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    annotationText = self->_annotationText;
    self->_annotationText = v4;

    [(VKRouteWaypointInfo *)self setNeedsTextUpdate:1];
  }
}

- (void)setImageProvider:(id)a3 withKey:(id)a4
{
  id v6 = (VKCustomImageProvider *)a3;
  v7 = (NSString *)a4;
  imageProvider = self->_imageProvider;
  self->_imageProvider = v6;
  v10 = v6;

  customImageKey = self->_customImageKey;
  self->_customImageKey = v7;
}

- (VKSharedLocationRouteWaypoint)initWithWaypoint:(id)a3 displayInfo:(id)a4 legIndex:(unint64_t)a5 routeCoordinate:(id)a6 adjacentRouteCoordinate:(id)a7 polylineCoordinate:(PolylineCoordinate)a8
{
  v14.receiver = self;
  v14.super_class = (Class)VKSharedLocationRouteWaypoint;
  v8 = -[VKRouteWaypointInfo initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:waypointType:](&v14, sel_initWithWaypoint_displayInfo_legIndex_routeCoordinate_adjacentRouteCoordinate_polylineCoordinate_waypointType_, a3, a4, a5, a8, 3, a6.var0, a6.var1, a6.var2, a7.var0, a7.var1, a7.var2);
  v9 = v8;
  if (v8)
  {
    customImageKey = v8->_customImageKey;
    v8->_customImageKey = 0;

    imageProvider = v9->_imageProvider;
    v9->_imageProvider = 0;

    v12 = v9;
  }

  return v9;
}

@end