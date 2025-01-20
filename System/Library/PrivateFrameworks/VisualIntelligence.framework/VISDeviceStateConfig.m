@interface VISDeviceStateConfig
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)set_zero_state_as_stable;
- (NSData)jsonData;
- (VISDeviceStateConfig)initWithDictionary:(id)a3;
- (VISDeviceStateConfig)initWithJSON:(id)a3;
- (float)anchor_depth;
- (float)camera_large_movement_threshold;
- (float)camera_small_movement_threshold;
- (id)dictionaryRepresentation;
- (int)frame_count;
- (unint64_t)hash;
- (void)setAnchor_depth:(float)a3;
- (void)setCamera_large_movement_threshold:(float)a3;
- (void)setCamera_small_movement_threshold:(float)a3;
- (void)setFrame_count:(int)a3;
- (void)setSet_zero_state_as_stable:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation VISDeviceStateConfig

- (void)setFrame_count:(int)a3
{
  self->_frame_count = a3;
}

- (void)setAnchor_depth:(float)a3
{
  self->_anchor_depth = a3;
}

- (void)setSet_zero_state_as_stable:(BOOL)a3
{
  self->_set_zero_state_as_stable = a3;
}

- (void)setCamera_small_movement_threshold:(float)a3
{
  self->_camera_small_movement_threshold = a3;
}

- (void)setCamera_large_movement_threshold:(float)a3
{
  self->_camera_large_movement_threshold = a3;
}

- (BOOL)readFrom:(id)a3
{
  return VISDeviceStateConfigReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ([(VISDeviceStateConfig *)self frame_count]) {
    PBDataWriterWriteInt32Field();
  }
  [(VISDeviceStateConfig *)self anchor_depth];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(VISDeviceStateConfig *)self set_zero_state_as_stable]) {
    PBDataWriterWriteBOOLField();
  }
  [(VISDeviceStateConfig *)self camera_small_movement_threshold];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISDeviceStateConfig *)self camera_large_movement_threshold];
  v6 = v8;
  if (v7 != 0.0)
  {
    PBDataWriterWriteFloatField();
    v6 = v8;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int frame_count = self->_frame_count, frame_count == objc_msgSend(v4, "frame_count"))
    && (float anchor_depth = self->_anchor_depth, objc_msgSend(v4, "anchor_depth"), anchor_depth == v7)
    && (int set_zero_state_as_stable = self->_set_zero_state_as_stable,
        set_zero_state_as_stable == objc_msgSend(v4, "set_zero_state_as_stable"))
    && (float camera_small_movement_threshold = self->_camera_small_movement_threshold,
        objc_msgSend(v4, "camera_small_movement_threshold"),
        camera_small_movement_threshold == v10))
  {
    float camera_large_movement_threshold = self->_camera_large_movement_threshold;
    objc_msgSend(v4, "camera_large_movement_threshold");
    BOOL v11 = camera_large_movement_threshold == v14;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t frame_count = self->_frame_count;
  float anchor_depth = self->_anchor_depth;
  BOOL v5 = anchor_depth < 0.0;
  if (anchor_depth == 0.0)
  {
    unint64_t v10 = 0;
  }
  else
  {
    double v6 = anchor_depth;
    double v7 = -v6;
    if (!v5) {
      double v7 = v6;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v10 += (unint64_t)v9;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v9);
    }
  }
  BOOL set_zero_state_as_stable = self->_set_zero_state_as_stable;
  float camera_small_movement_threshold = self->_camera_small_movement_threshold;
  BOOL v13 = camera_small_movement_threshold < 0.0;
  if (camera_small_movement_threshold == 0.0)
  {
    unint64_t v18 = 0;
  }
  else
  {
    double v14 = camera_small_movement_threshold;
    double v15 = -v14;
    if (!v13) {
      double v15 = v14;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v18 += (unint64_t)v17;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v17);
    }
  }
  float camera_large_movement_threshold = self->_camera_large_movement_threshold;
  BOOL v20 = camera_large_movement_threshold < 0.0;
  if (camera_large_movement_threshold == 0.0)
  {
    unint64_t v25 = 0;
  }
  else
  {
    double v21 = camera_large_movement_threshold;
    double v22 = -v21;
    if (!v20) {
      double v22 = v21;
    }
    long double v23 = floor(v22 + 0.5);
    double v24 = (v22 - v23) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v25 += (unint64_t)v24;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v24);
    }
  }
  if (set_zero_state_as_stable) {
    uint64_t v26 = 2654435761;
  }
  else {
    uint64_t v26 = 0;
  }
  return v10 ^ v26 ^ v18 ^ v25 ^ (2654435761 * frame_count);
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_anchor_depth != 0.0)
  {
    id v4 = NSNumber;
    [(VISDeviceStateConfig *)self anchor_depth];
    BOOL v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"anchorDepth"];
  }
  if (self->_camera_large_movement_threshold != 0.0)
  {
    double v6 = NSNumber;
    [(VISDeviceStateConfig *)self camera_large_movement_threshold];
    double v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"cameraLargeMovementThreshold"];
  }
  if (self->_camera_small_movement_threshold != 0.0)
  {
    long double v8 = NSNumber;
    [(VISDeviceStateConfig *)self camera_small_movement_threshold];
    double v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"cameraSmallMovementThreshold"];
  }
  if (self->_frame_count)
  {
    unint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", -[VISDeviceStateConfig frame_count](self, "frame_count"));
    [v3 setObject:v10 forKeyedSubscript:@"frameCount"];
  }
  if (self->_set_zero_state_as_stable)
  {
    BOOL v11 = objc_msgSend(NSNumber, "numberWithBool:", -[VISDeviceStateConfig set_zero_state_as_stable](self, "set_zero_state_as_stable"));
    [v3 setObject:v11 forKeyedSubscript:@"setZeroStateAsStable"];
  }
  return v3;
}

- (NSData)jsonData
{
  v2 = [(VISDeviceStateConfig *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    double v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    double v3 = 0;
  }

  return (NSData *)v3;
}

- (VISDeviceStateConfig)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v5 = 0;
  }
  else
  {
    self = [(VISDeviceStateConfig *)self initWithDictionary:v4];
    BOOL v5 = self;
  }

  return v5;
}

- (VISDeviceStateConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VISDeviceStateConfig;
  BOOL v5 = [(VISDeviceStateConfig *)&v13 init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"frameCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISDeviceStateConfig setFrame_count:](v5, "setFrame_count:", [v6 intValue]);
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"anchorDepth"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[VISDeviceStateConfig setAnchor_depth:](v5, "setAnchor_depth:");
    }
    long double v8 = [v4 objectForKeyedSubscript:@"setZeroStateAsStable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISDeviceStateConfig setSet_zero_state_as_stable:](v5, "setSet_zero_state_as_stable:", [v8 BOOLValue]);
    }
    double v9 = [v4 objectForKeyedSubscript:@"cameraSmallMovementThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[VISDeviceStateConfig setCamera_small_movement_threshold:](v5, "setCamera_small_movement_threshold:");
    }
    unint64_t v10 = [v4 objectForKeyedSubscript:@"cameraLargeMovementThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[VISDeviceStateConfig setCamera_large_movement_threshold:](v5, "setCamera_large_movement_threshold:");
    }
    BOOL v11 = v5;
  }
  return v5;
}

- (int)frame_count
{
  return self->_frame_count;
}

- (float)anchor_depth
{
  return self->_anchor_depth;
}

- (BOOL)set_zero_state_as_stable
{
  return self->_set_zero_state_as_stable;
}

- (float)camera_small_movement_threshold
{
  return self->_camera_small_movement_threshold;
}

- (float)camera_large_movement_threshold
{
  return self->_camera_large_movement_threshold;
}

@end