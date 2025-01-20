@interface WFReverseCircleOverlay
+ (id)circleWithCenterCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4 boundingMapRect:(id)a5;
- ($9F77959AF31A96A2E31DA24E27C2F2C1)boundingMapRect;
- ($9F77959AF31A96A2E31DA24E27C2F2C1)boundingRect;
- ($9F77959AF31A96A2E31DA24E27C2F2C1)innerCircleBoundingMapRect;
- (void)setBoundingRect:(id)a3;
@end

@implementation WFReverseCircleOverlay

- (void)setBoundingRect:(id)a3
{
  self->_boundingRect = ($AF67F5D77BDF9AFC0B56783D4C96E717)a3;
}

- ($9F77959AF31A96A2E31DA24E27C2F2C1)boundingRect
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- ($9F77959AF31A96A2E31DA24E27C2F2C1)innerCircleBoundingMapRect
{
  v6.receiver = self;
  v6.super_class = (Class)WFReverseCircleOverlay;
  [(MKCircle *)&v6 boundingMapRect];
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- ($9F77959AF31A96A2E31DA24E27C2F2C1)boundingMapRect
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

+ (id)circleWithCenterCoordinate:(CLLocationCoordinate2D)a3 radius:(double)a4 boundingMapRect:(id)a5
{
  double var1 = a5.var1.var1;
  double var0 = a5.var1.var0;
  double v7 = a5.var0.var1;
  double v8 = a5.var0.var0;
  v9 = +[MKCircle circleWithCenterCoordinate:radius:](WFReverseCircleOverlay, "circleWithCenterCoordinate:radius:", a3.latitude, a3.longitude, a4);
  objc_msgSend(v9, "setBoundingRect:", v8, v7, var0, var1);
  return v9;
}

@end