@interface VISParseSessionConfig
- (BOOL)enable_object_detection;
- (BOOL)enable_object_tracking;
- (BOOL)enable_text_detection;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)use_vi_detector;
- (NSData)jsonData;
- (VISParseSessionConfig)initWithDictionary:(id)a3;
- (VISParseSessionConfig)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setEnable_object_detection:(BOOL)a3;
- (void)setEnable_object_tracking:(BOOL)a3;
- (void)setEnable_text_detection:(BOOL)a3;
- (void)setUse_vi_detector:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation VISParseSessionConfig

- (void)setEnable_object_detection:(BOOL)a3
{
  self->_enable_object_detection = a3;
}

- (void)setEnable_object_tracking:(BOOL)a3
{
  self->_enable_object_tracking = a3;
}

- (void)setEnable_text_detection:(BOOL)a3
{
  self->_enable_text_detection = a3;
}

- (void)setUse_vi_detector:(BOOL)a3
{
  self->_use_vi_detector = a3;
}

- (BOOL)readFrom:(id)a3
{
  return VISParseSessionConfigReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(VISParseSessionConfig *)self enable_object_detection]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(VISParseSessionConfig *)self enable_object_tracking]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(VISParseSessionConfig *)self enable_text_detection]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(VISParseSessionConfig *)self use_vi_detector]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int enable_object_detection = self->_enable_object_detection,
        enable_object_detection == objc_msgSend(v4, "enable_object_detection"))
    && (int enable_object_tracking = self->_enable_object_tracking,
        enable_object_tracking == objc_msgSend(v4, "enable_object_tracking"))
    && (int enable_text_detection = self->_enable_text_detection,
        enable_text_detection == objc_msgSend(v4, "enable_text_detection")))
  {
    int use_vi_detector = self->_use_vi_detector;
    BOOL v9 = use_vi_detector == objc_msgSend(v4, "use_vi_detector");
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761;
  if (self->_enable_object_detection) {
    uint64_t v3 = 2654435761;
  }
  else {
    uint64_t v3 = 0;
  }
  if (self->_enable_object_tracking) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  if (self->_enable_text_detection) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!self->_use_vi_detector) {
    uint64_t v2 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v2;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_enable_object_detection)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[VISParseSessionConfig enable_object_detection](self, "enable_object_detection"));
    [v3 setObject:v4 forKeyedSubscript:@"enableObjectDetection"];
  }
  if (self->_enable_object_tracking)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[VISParseSessionConfig enable_object_tracking](self, "enable_object_tracking"));
    [v3 setObject:v5 forKeyedSubscript:@"enableObjectTracking"];
  }
  if (self->_enable_text_detection)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[VISParseSessionConfig enable_text_detection](self, "enable_text_detection"));
    [v3 setObject:v6 forKeyedSubscript:@"enableTextDetection"];
  }
  if (self->_use_vi_detector)
  {
    v7 = objc_msgSend(NSNumber, "numberWithBool:", -[VISParseSessionConfig use_vi_detector](self, "use_vi_detector"));
    [v3 setObject:v7 forKeyedSubscript:@"useViDetector"];
  }
  return v3;
}

- (NSData)jsonData
{
  uint64_t v2 = [(VISParseSessionConfig *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    uint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (VISParseSessionConfig)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(VISParseSessionConfig *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (VISParseSessionConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VISParseSessionConfig;
  uint64_t v5 = [(VISParseSessionConfig *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"enableObjectDetection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISParseSessionConfig setEnable_object_detection:](v5, "setEnable_object_detection:", [v6 BOOLValue]);
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"enableObjectTracking"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISParseSessionConfig setEnable_object_tracking:](v5, "setEnable_object_tracking:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"enableTextDetection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISParseSessionConfig setEnable_text_detection:](v5, "setEnable_text_detection:", [v8 BOOLValue]);
    }
    BOOL v9 = [v4 objectForKeyedSubscript:@"useViDetector"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISParseSessionConfig setUse_vi_detector:](v5, "setUse_vi_detector:", [v9 BOOLValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (BOOL)enable_object_detection
{
  return self->_enable_object_detection;
}

- (BOOL)enable_object_tracking
{
  return self->_enable_object_tracking;
}

- (BOOL)enable_text_detection
{
  return self->_enable_text_detection;
}

- (BOOL)use_vi_detector
{
  return self->_use_vi_detector;
}

@end