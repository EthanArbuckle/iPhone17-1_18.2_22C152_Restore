@interface VKMapViewDescriptor
+ (id)descriptorWithShouldRasterize:(BOOL)a3 inBackground:(BOOL)a4 contentScale:(double)a5 auditToken:(id)a6 mapViewPurpose:(int64_t)a7 allowsAntialiasing:(BOOL)a8;
- (BOOL)allowsAntialiasing;
- (BOOL)inBackground;
- (BOOL)shouldRasterize;
- (GEOApplicationAuditToken)auditToken;
- (VKMapViewDescriptor)init;
- (double)contentScale;
- (int64_t)carDisplayType;
- (int64_t)mapViewPurpose;
- (unsigned)mapKitClientMode;
- (unsigned)mapKitUsage;
- (unsigned)mapsUsage;
- (void)setAllowsAntialiasing:(BOOL)a3;
- (void)setAuditToken:(id)a3;
- (void)setCarDisplayType:(int64_t)a3;
- (void)setContentScale:(double)a3;
- (void)setInBackground:(BOOL)a3;
- (void)setMapKitClientMode:(unsigned __int8)a3;
- (void)setMapKitUsage:(unsigned __int8)a3;
- (void)setMapViewPurpose:(int64_t)a3;
- (void)setMapsUsage:(unsigned __int8)a3;
- (void)setShouldRasterize:(BOOL)a3;
@end

@implementation VKMapViewDescriptor

- (void)setCarDisplayType:(int64_t)a3
{
  self->_carDisplayType = a3;
}

- (void).cxx_destruct
{
}

- (double)contentScale
{
  return self->_contentScale;
}

- (BOOL)inBackground
{
  return self->_inBackground;
}

- (int64_t)carDisplayType
{
  return self->_carDisplayType;
}

- (unsigned)mapsUsage
{
  return self->_mapsUsage;
}

- (BOOL)shouldRasterize
{
  return self->_shouldRasterize;
}

- (int64_t)mapViewPurpose
{
  return self->_mapViewPurpose;
}

- (unsigned)mapKitUsage
{
  return self->_mapKitUsage;
}

- (unsigned)mapKitClientMode
{
  return self->_mapKitClientMode;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (BOOL)allowsAntialiasing
{
  return self->_allowsAntialiasing;
}

+ (id)descriptorWithShouldRasterize:(BOOL)a3 inBackground:(BOOL)a4 contentScale:(double)a5 auditToken:(id)a6 mapViewPurpose:(int64_t)a7 allowsAntialiasing:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a4;
  BOOL v12 = a3;
  id v14 = a6;
  id v15 = objc_alloc_init((Class)a1);
  [v15 setShouldRasterize:v12];
  [v15 setInBackground:v11];
  [v15 setContentScale:a5];
  [v15 setAuditToken:v14];
  [v15 setMapViewPurpose:a7];
  [v15 setAllowsAntialiasing:v8];

  return v15;
}

- (void)setShouldRasterize:(BOOL)a3
{
  self->_shouldRasterize = a3;
}

- (void)setMapViewPurpose:(int64_t)a3
{
  self->_mapViewPurpose = a3;
}

- (void)setInBackground:(BOOL)a3
{
  self->_inBackground = a3;
}

- (void)setContentScale:(double)a3
{
  self->_contentScale = a3;
}

- (void)setAuditToken:(id)a3
{
}

- (void)setAllowsAntialiasing:(BOOL)a3
{
  self->_allowsAntialiasing = a3;
}

- (VKMapViewDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)VKMapViewDescriptor;
  result = [(VKMapViewDescriptor *)&v3 init];
  if (result)
  {
    result->_shouldRasterize = 1;
    *(_WORD *)&result->_mapKitUsage = 256;
    result->_mapKitClientMode = 0;
  }
  return result;
}

- (void)setMapKitClientMode:(unsigned __int8)a3
{
  self->_mapKitClientMode = a3;
}

- (void)setMapsUsage:(unsigned __int8)a3
{
  self->_mapsUsage = a3;
}

- (void)setMapKitUsage:(unsigned __int8)a3
{
  self->_mapKitUsage = a3;
}

@end