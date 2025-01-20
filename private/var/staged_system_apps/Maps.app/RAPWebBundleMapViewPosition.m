@interface RAPWebBundleMapViewPosition
- (NSString)mapId;
- (RAPWebBundleMapViewPosition)initWithDictionary:(id)a3;
- (double)height;
- (double)opacity;
- (double)widthPadding;
- (double)widthPercent;
- (double)xPosition;
- (double)yPosition;
@end

@implementation RAPWebBundleMapViewPosition

- (RAPWebBundleMapViewPosition)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RAPWebBundleMapViewPosition;
  v5 = [(RAPWebBundleMapViewPosition *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"id"];
    mapId = v5->_mapId;
    v5->_mapId = (NSString *)v6;

    v8 = [v4 objectForKeyedSubscript:@"height"];
    [v8 floatValue];
    v5->_height = v9;

    v10 = [v4 objectForKeyedSubscript:@"opacity"];
    [v10 floatValue];
    v5->_opacity = v11;

    v12 = [v4 objectForKeyedSubscript:@"y"];
    [v12 floatValue];
    v5->_yPosition = v13;

    v14 = [v4 objectForKeyedSubscript:@"x"];
    [v14 floatValue];
    v5->_xPosition = v15;

    v16 = [v4 objectForKeyedSubscript:@"widthPadding"];
    [v16 floatValue];
    v5->_widthPadding = v17;

    v18 = [v4 objectForKeyedSubscript:@"widthPercent"];
    [v18 floatValue];
    v5->_widthPercent = v19;
  }
  return v5;
}

- (NSString)mapId
{
  return self->_mapId;
}

- (double)height
{
  return self->_height;
}

- (double)opacity
{
  return self->_opacity;
}

- (double)yPosition
{
  return self->_yPosition;
}

- (double)xPosition
{
  return self->_xPosition;
}

- (double)widthPadding
{
  return self->_widthPadding;
}

- (double)widthPercent
{
  return self->_widthPercent;
}

- (void).cxx_destruct
{
}

@end