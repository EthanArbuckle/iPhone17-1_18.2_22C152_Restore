@interface VISObjectSelectionConfig
- (BOOL)enable_object_selection;
- (BOOL)enable_text_state_selection;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (VISObjectSelectionConfig)initWithDictionary:(id)a3;
- (VISObjectSelectionConfig)initWithJSON:(id)a3;
- (float)bounding_box_padding_for_cropping;
- (float)text_book_world_distance_threshold;
- (float)unknown_label_threshold;
- (id)dictionaryRepresentation;
- (int)max_number_of_text_entities;
- (unint64_t)hash;
- (void)setBounding_box_padding_for_cropping:(float)a3;
- (void)setEnable_object_selection:(BOOL)a3;
- (void)setEnable_text_state_selection:(BOOL)a3;
- (void)setMax_number_of_text_entities:(int)a3;
- (void)setText_book_world_distance_threshold:(float)a3;
- (void)setUnknown_label_threshold:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VISObjectSelectionConfig

- (void)setUnknown_label_threshold:(float)a3
{
  self->_unknown_label_threshold = a3;
}

- (void)setEnable_text_state_selection:(BOOL)a3
{
  self->_enable_text_state_selection = a3;
}

- (void)setMax_number_of_text_entities:(int)a3
{
  self->_max_number_of_text_entities = a3;
}

- (void)setText_book_world_distance_threshold:(float)a3
{
  self->_text_book_world_distance_threshold = a3;
}

- (void)setBounding_box_padding_for_cropping:(float)a3
{
  self->_bounding_box_padding_for_cropping = a3;
}

- (void)setEnable_object_selection:(BOOL)a3
{
  self->_enable_object_selection = a3;
}

- (BOOL)readFrom:(id)a3
{
  return VISObjectSelectionConfigReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  [(VISObjectSelectionConfig *)self unknown_label_threshold];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(VISObjectSelectionConfig *)self enable_text_state_selection]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(VISObjectSelectionConfig *)self max_number_of_text_entities]) {
    PBDataWriterWriteInt32Field();
  }
  [(VISObjectSelectionConfig *)self text_book_world_distance_threshold];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectSelectionConfig *)self bounding_box_padding_for_cropping];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(VISObjectSelectionConfig *)self enable_object_selection]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_7;
  }
  float unknown_label_threshold = self->_unknown_label_threshold;
  objc_msgSend(v4, "unknown_label_threshold");
  if (unknown_label_threshold != v6) {
    goto LABEL_7;
  }
  int enable_text_state_selection = self->_enable_text_state_selection;
  if (enable_text_state_selection == objc_msgSend(v4, "enable_text_state_selection")
    && (int max_number_of_text_entities = self->_max_number_of_text_entities,
        max_number_of_text_entities == objc_msgSend(v4, "max_number_of_text_entities"))
    && (float text_book_world_distance_threshold = self->_text_book_world_distance_threshold,
        objc_msgSend(v4, "text_book_world_distance_threshold"),
        text_book_world_distance_threshold == v10)
    && (float bounding_box_padding_for_cropping = self->_bounding_box_padding_for_cropping,
        objc_msgSend(v4, "bounding_box_padding_for_cropping"),
        bounding_box_padding_for_cropping == v12))
  {
    int enable_object_selection = self->_enable_object_selection;
    BOOL v13 = enable_object_selection == objc_msgSend(v4, "enable_object_selection");
  }
  else
  {
LABEL_7:
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  float unknown_label_threshold = self->_unknown_label_threshold;
  BOOL v4 = unknown_label_threshold < 0.0;
  if (unknown_label_threshold == 0.0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    double v5 = unknown_label_threshold;
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
  BOOL enable_text_state_selection = self->_enable_text_state_selection;
  uint64_t max_number_of_text_entities = self->_max_number_of_text_entities;
  float text_book_world_distance_threshold = self->_text_book_world_distance_threshold;
  BOOL v13 = text_book_world_distance_threshold < 0.0;
  if (text_book_world_distance_threshold == 0.0)
  {
    unint64_t v18 = 0;
  }
  else
  {
    double v14 = text_book_world_distance_threshold;
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
  float bounding_box_padding_for_cropping = self->_bounding_box_padding_for_cropping;
  BOOL v20 = bounding_box_padding_for_cropping < 0.0;
  if (bounding_box_padding_for_cropping == 0.0)
  {
    unint64_t v25 = 0;
  }
  else
  {
    double v21 = bounding_box_padding_for_cropping;
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
  if (enable_text_state_selection) {
    uint64_t v26 = 2654435761;
  }
  else {
    uint64_t v26 = 0;
  }
  if (self->_enable_object_selection) {
    uint64_t v27 = 2654435761;
  }
  else {
    uint64_t v27 = 0;
  }
  return v26 ^ v9 ^ v18 ^ v25 ^ (2654435761 * max_number_of_text_entities) ^ v27;
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_bounding_box_padding_for_cropping != 0.0)
  {
    BOOL v4 = NSNumber;
    [(VISObjectSelectionConfig *)self bounding_box_padding_for_cropping];
    double v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"boundingBoxPaddingForCropping"];
  }
  if (self->_enable_object_selection)
  {
    double v6 = objc_msgSend(NSNumber, "numberWithBool:", -[VISObjectSelectionConfig enable_object_selection](self, "enable_object_selection"));
    [v3 setObject:v6 forKeyedSubscript:@"enableObjectSelection"];
  }
  if (self->_enable_text_state_selection)
  {
    long double v7 = objc_msgSend(NSNumber, "numberWithBool:", -[VISObjectSelectionConfig enable_text_state_selection](self, "enable_text_state_selection"));
    [v3 setObject:v7 forKeyedSubscript:@"enableTextStateSelection"];
  }
  if (self->_max_number_of_text_entities)
  {
    double v8 = objc_msgSend(NSNumber, "numberWithInt:", -[VISObjectSelectionConfig max_number_of_text_entities](self, "max_number_of_text_entities"));
    [v3 setObject:v8 forKeyedSubscript:@"maxNumberOfTextEntities"];
  }
  if (self->_text_book_world_distance_threshold != 0.0)
  {
    unint64_t v9 = NSNumber;
    [(VISObjectSelectionConfig *)self text_book_world_distance_threshold];
    float v10 = objc_msgSend(v9, "numberWithFloat:");
    [v3 setObject:v10 forKeyedSubscript:@"textBookWorldDistanceThreshold"];
  }
  if (self->_unknown_label_threshold != 0.0)
  {
    v11 = NSNumber;
    [(VISObjectSelectionConfig *)self unknown_label_threshold];
    float v12 = objc_msgSend(v11, "numberWithFloat:");
    [v3 setObject:v12 forKeyedSubscript:@"unknownLabelThreshold"];
  }
  return v3;
}

- (NSData)jsonData
{
  v2 = [(VISObjectSelectionConfig *)self dictionaryRepresentation];
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

- (VISObjectSelectionConfig)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  BOOL v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = 0;
  }
  else
  {
    self = [(VISObjectSelectionConfig *)self initWithDictionary:v4];
    double v5 = self;
  }

  return v5;
}

- (VISObjectSelectionConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VISObjectSelectionConfig;
  double v5 = [(VISObjectSelectionConfig *)&v14 init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"unknownLabelThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[VISObjectSelectionConfig setUnknown_label_threshold:](v5, "setUnknown_label_threshold:");
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"enableTextStateSelection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISObjectSelectionConfig setEnable_text_state_selection:](v5, "setEnable_text_state_selection:", [v7 BOOLValue]);
    }
    double v8 = [v4 objectForKeyedSubscript:@"maxNumberOfTextEntities"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISObjectSelectionConfig setMax_number_of_text_entities:](v5, "setMax_number_of_text_entities:", [v8 intValue]);
    }
    unint64_t v9 = [v4 objectForKeyedSubscript:@"textBookWorldDistanceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[VISObjectSelectionConfig setText_book_world_distance_threshold:](v5, "setText_book_world_distance_threshold:");
    }
    float v10 = [v4 objectForKeyedSubscript:@"boundingBoxPaddingForCropping"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[VISObjectSelectionConfig setBounding_box_padding_for_cropping:](v5, "setBounding_box_padding_for_cropping:");
    }
    v11 = [v4 objectForKeyedSubscript:@"enableObjectSelection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISObjectSelectionConfig setEnable_object_selection:](v5, "setEnable_object_selection:", [v11 BOOLValue]);
    }
    float v12 = v5;
  }
  return v5;
}

- (float)unknown_label_threshold
{
  return self->_unknown_label_threshold;
}

- (BOOL)enable_text_state_selection
{
  return self->_enable_text_state_selection;
}

- (int)max_number_of_text_entities
{
  return self->_max_number_of_text_entities;
}

- (float)text_book_world_distance_threshold
{
  return self->_text_book_world_distance_threshold;
}

- (float)bounding_box_padding_for_cropping
{
  return self->_bounding_box_padding_for_cropping;
}

- (BOOL)enable_object_selection
{
  return self->_enable_object_selection;
}

@end