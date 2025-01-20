@interface PTCinematographyNetworkRectSignal
- (BOOL)useSqrtForArea;
- (PTCinematographyNetworkRectSignal)initWithModelDictionary:(id)a3;
- (void)setUseSqrtForArea:(BOOL)a3;
- (void)writePayload:(id)a3 toStream:(id)a4;
@end

@implementation PTCinematographyNetworkRectSignal

- (PTCinematographyNetworkRectSignal)initWithModelDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTCinematographyNetworkRectSignal;
  v5 = [(PTCinematographyNetworkSignal *)&v9 initWithModelDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"params"];
    v7 = [v6 objectForKeyedSubscript:@"width_height"];
    v5->_useSqrtForArea = [v7 isEqualToString:@"geomean"];
  }
  return v5;
}

- (void)writePayload:(id)a3 toStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PTCinematographyNetworkSignal *)self checkSignalForStream:v7])
  {
    if ([v6 isMissingDetection])
    {
      [v7 writeZerosWithCount:3];
    }
    else
    {
      objc_super v9 = [v6 detection];
      [v9 rect];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;

      float Area = CGRectGetArea(v11, v13, v15, v17);
      v25.origin.x = v11;
      v25.origin.y = v13;
      v25.size.width = v15;
      v25.size.height = v17;
      float MidX = CGRectGetMidX(v25);
      v26.origin.x = v11;
      v26.origin.y = v13;
      v26.size.width = v15;
      v26.size.height = v17;
      float MidY = CGRectGetMidY(v26);
      BOOL v21 = [(PTCinematographyNetworkRectSignal *)self useSqrtForArea];
      *(float *)&double v22 = sqrtf(Area);
      if (!v21) {
        *(float *)&double v22 = Area;
      }
      [v7 writeFloat:v22];
      *(float *)&double v23 = MidX;
      [v7 writeFloat:v23];
      *(float *)&double v24 = MidY;
      [v7 writeFloat:v24];
    }
  }
  else
  {
    v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyNetworkNamedSignal writePayload:toStream:](v8);
    }
  }
}

- (BOOL)useSqrtForArea
{
  return self->_useSqrtForArea;
}

- (void)setUseSqrtForArea:(BOOL)a3
{
  self->_useSqrtForfloat Area = a3;
}

@end