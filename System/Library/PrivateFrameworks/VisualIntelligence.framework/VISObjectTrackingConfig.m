@interface VISObjectTrackingConfig
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (VISObjectTrackingConfig)initWithDictionary:(id)a3;
- (VISObjectTrackingConfig)initWithJSON:(id)a3;
- (float)confidence_for_cache_update;
- (float)geo_distance_threshold;
- (float)reticle_padding;
- (id)dictionaryRepresentation;
- (int)max_tracked_object_count;
- (unint64_t)hash;
- (void)setConfidence_for_cache_update:(float)a3;
- (void)setGeo_distance_threshold:(float)a3;
- (void)setMax_tracked_object_count:(int)a3;
- (void)setReticle_padding:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VISObjectTrackingConfig

- (void)setConfidence_for_cache_update:(float)a3
{
  self->_confidence_for_cache_update = a3;
}

- (void)setMax_tracked_object_count:(int)a3
{
  self->_max_tracked_object_count = a3;
}

- (void)setGeo_distance_threshold:(float)a3
{
  self->_geo_distance_threshold = a3;
}

- (void)setReticle_padding:(float)a3
{
  self->_reticle_padding = a3;
}

- (BOOL)readFrom:(id)a3
{
  return VISObjectTrackingConfigReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  [(VISObjectTrackingConfig *)self confidence_for_cache_update];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(VISObjectTrackingConfig *)self max_tracked_object_count]) {
    PBDataWriterWriteInt32Field();
  }
  [(VISObjectTrackingConfig *)self geo_distance_threshold];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectTrackingConfig *)self reticle_padding];
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
    && (float confidence_for_cache_update = self->_confidence_for_cache_update,
        objc_msgSend(v4, "confidence_for_cache_update"),
        confidence_for_cache_update == v6)
    && (int max_tracked_object_count = self->_max_tracked_object_count,
        max_tracked_object_count == objc_msgSend(v4, "max_tracked_object_count"))
    && (float geo_distance_threshold = self->_geo_distance_threshold,
        objc_msgSend(v4, "geo_distance_threshold"),
        geo_distance_threshold == v9))
  {
    float reticle_padding = self->_reticle_padding;
    objc_msgSend(v4, "reticle_padding");
    BOOL v10 = reticle_padding == v13;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  float confidence_for_cache_update = self->_confidence_for_cache_update;
  BOOL v4 = confidence_for_cache_update < 0.0;
  if (confidence_for_cache_update == 0.0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    double v5 = confidence_for_cache_update;
    double v6 = -v5;
    if (!v4) {
      double v6 = v5;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v9 += (unint64_t)v8;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v8);
    }
  }
  uint64_t max_tracked_object_count = self->_max_tracked_object_count;
  float geo_distance_threshold = self->_geo_distance_threshold;
  BOOL v12 = geo_distance_threshold < 0.0;
  if (geo_distance_threshold == 0.0)
  {
    unint64_t v17 = 0;
  }
  else
  {
    double v13 = geo_distance_threshold;
    double v14 = -v13;
    if (!v12) {
      double v14 = v13;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v17 += (unint64_t)v16;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v16);
    }
  }
  float reticle_padding = self->_reticle_padding;
  BOOL v19 = reticle_padding < 0.0;
  if (reticle_padding == 0.0)
  {
    unint64_t v24 = 0;
  }
  else
  {
    double v20 = reticle_padding;
    double v21 = -v20;
    if (!v19) {
      double v21 = v20;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v24 += (unint64_t)v23;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v23);
    }
  }
  return (2654435761 * max_tracked_object_count) ^ v9 ^ v17 ^ v24;
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_confidence_for_cache_update != 0.0)
  {
    BOOL v4 = NSNumber;
    [(VISObjectTrackingConfig *)self confidence_for_cache_update];
    double v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"confidenceForCacheUpdate"];
  }
  if (self->_geo_distance_threshold != 0.0)
  {
    double v6 = NSNumber;
    [(VISObjectTrackingConfig *)self geo_distance_threshold];
    long double v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"geoDistanceThreshold"];
  }
  if (self->_max_tracked_object_count)
  {
    double v8 = objc_msgSend(NSNumber, "numberWithInt:", -[VISObjectTrackingConfig max_tracked_object_count](self, "max_tracked_object_count"));
    [v3 setObject:v8 forKeyedSubscript:@"maxTrackedObjectCount"];
  }
  if (self->_reticle_padding != 0.0)
  {
    unint64_t v9 = NSNumber;
    [(VISObjectTrackingConfig *)self reticle_padding];
    BOOL v10 = objc_msgSend(v9, "numberWithFloat:");
    [v3 setObject:v10 forKeyedSubscript:@"reticlePadding"];
  }
  return v3;
}

- (NSData)jsonData
{
  v2 = [(VISObjectTrackingConfig *)self dictionaryRepresentation];
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

- (VISObjectTrackingConfig)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  BOOL v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = 0;
  }
  else
  {
    self = [(VISObjectTrackingConfig *)self initWithDictionary:v4];
    double v5 = self;
  }

  return v5;
}

- (VISObjectTrackingConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VISObjectTrackingConfig;
  double v5 = [(VISObjectTrackingConfig *)&v12 init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"confidenceForCacheUpdate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[VISObjectTrackingConfig setConfidence_for_cache_update:](v5, "setConfidence_for_cache_update:");
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"maxTrackedObjectCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISObjectTrackingConfig setMax_tracked_object_count:](v5, "setMax_tracked_object_count:", [v7 intValue]);
    }
    double v8 = [v4 objectForKeyedSubscript:@"geoDistanceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[VISObjectTrackingConfig setGeo_distance_threshold:](v5, "setGeo_distance_threshold:");
    }
    unint64_t v9 = [v4 objectForKeyedSubscript:@"reticlePadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[VISObjectTrackingConfig setReticle_padding:](v5, "setReticle_padding:");
    }
    BOOL v10 = v5;
  }
  return v5;
}

- (float)confidence_for_cache_update
{
  return self->_confidence_for_cache_update;
}

- (int)max_tracked_object_count
{
  return self->_max_tracked_object_count;
}

- (float)geo_distance_threshold
{
  return self->_geo_distance_threshold;
}

- (float)reticle_padding
{
  return self->_reticle_padding;
}

@end