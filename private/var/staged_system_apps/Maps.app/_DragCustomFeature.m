@interface _DragCustomFeature
+ (id)customFeatureForMapItem:(id)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)showsBalloonCallout;
- (_DragCustomFeature)initWithCustomFeature:(id)a3 coordinate:(id)a4;
- (id)feature;
@end

@implementation _DragCustomFeature

- (_DragCustomFeature)initWithCustomFeature:(id)a3 coordinate:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DragCustomFeature;
  v9 = [(_DragCustomFeature *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feature, a3);
    v10->_coordinate.latitude = var0;
    v10->_coordinate.longitude = var1;
    v11 = v10;
  }

  return v10;
}

- (id)feature
{
  return self->_feature;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double var1 = longitude;
  result.double var0 = latitude;
  return result;
}

- (BOOL)showsBalloonCallout
{
  return 0;
}

+ (id)customFeatureForMapItem:(id)a3
{
  id v3 = a3;
  [v3 _coordinate];
  double v5 = v4;
  [v3 _coordinate];
  double v7 = v6;
  id v8 = [objc_alloc((Class)VKCustomFeature) initWithCoordinate:v5, v6];
  v9 = [v3 _styleAttributes];
  if (([v9 hasAttributes] & 1) == 0)
  {
    id v10 = [objc_alloc((Class)GEOFeatureStyleAttributes) initWithAttributes:4, 226, 5, 3, 6, 348, 10, 0, 0];

    v9 = v10;
  }
  id v11 = [v9 copy];

  long long v15 = xmmword_100F741E0;
  uint64_t v16 = 0x100010024;
  [v11 replaceAttributes:&v15 count:3];
  [v8 setStyleAttributes:v11];
  v12 = [v3 name];
  [v8 setText:v12 locale:0];

  objc_super v13 = -[_DragCustomFeature initWithCustomFeature:coordinate:]([_DragCustomFeature alloc], "initWithCustomFeature:coordinate:", v8, v5, v7);

  return v13;
}

- (void).cxx_destruct
{
}

@end