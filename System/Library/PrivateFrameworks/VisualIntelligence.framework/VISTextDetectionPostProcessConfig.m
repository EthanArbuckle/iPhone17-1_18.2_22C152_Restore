@interface VISTextDetectionPostProcessConfig
- (BOOL)enable_text_bbox_size_suppress;
- (BOOL)enable_text_bounding_box_merge;
- (BOOL)enable_text_bounding_box_suppress;
- (BOOL)enable_text_confidence_suppress;
- (BOOL)enable_text_font_size_suppress;
- (BOOL)enable_text_negative_objects_suppress;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (VISTextDetectionPostProcessConfig)initWithDictionary:(id)a3;
- (VISTextDetectionPostProcessConfig)initWithJSON:(id)a3;
- (float)font_size_suppress_threshold;
- (float)padding_for_text_result_merge;
- (float)text_bbox_size_suppress_threshold;
- (float)text_confidence_suppress_threshold;
- (float)text_merge_iou_threshold;
- (float)text_suppress_iou_threshold;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setEnable_text_bbox_size_suppress:(BOOL)a3;
- (void)setEnable_text_bounding_box_merge:(BOOL)a3;
- (void)setEnable_text_bounding_box_suppress:(BOOL)a3;
- (void)setEnable_text_confidence_suppress:(BOOL)a3;
- (void)setEnable_text_font_size_suppress:(BOOL)a3;
- (void)setEnable_text_negative_objects_suppress:(BOOL)a3;
- (void)setFont_size_suppress_threshold:(float)a3;
- (void)setPadding_for_text_result_merge:(float)a3;
- (void)setText_bbox_size_suppress_threshold:(float)a3;
- (void)setText_confidence_suppress_threshold:(float)a3;
- (void)setText_merge_iou_threshold:(float)a3;
- (void)setText_suppress_iou_threshold:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VISTextDetectionPostProcessConfig

- (void)setEnable_text_bounding_box_merge:(BOOL)a3
{
  self->_enable_text_bounding_box_merge = a3;
}

- (void)setText_merge_iou_threshold:(float)a3
{
  self->_text_merge_iou_threshold = a3;
}

- (void)setEnable_text_bounding_box_suppress:(BOOL)a3
{
  self->_enable_text_bounding_box_suppress = a3;
}

- (void)setEnable_text_font_size_suppress:(BOOL)a3
{
  self->_enable_text_font_size_suppress = a3;
}

- (void)setFont_size_suppress_threshold:(float)a3
{
  self->_font_size_suppress_threshold = a3;
}

- (void)setEnable_text_confidence_suppress:(BOOL)a3
{
  self->_enable_text_confidence_suppress = a3;
}

- (void)setText_confidence_suppress_threshold:(float)a3
{
  self->_text_confidence_suppress_threshold = a3;
}

- (void)setEnable_text_bbox_size_suppress:(BOOL)a3
{
  self->_enable_text_bbox_size_suppress = a3;
}

- (void)setText_bbox_size_suppress_threshold:(float)a3
{
  self->_text_bbox_size_suppress_threshold = a3;
}

- (void)setEnable_text_negative_objects_suppress:(BOOL)a3
{
  self->_enable_text_negative_objects_suppress = a3;
}

- (void)setText_suppress_iou_threshold:(float)a3
{
  self->_text_suppress_iou_threshold = a3;
}

- (void)setPadding_for_text_result_merge:(float)a3
{
  self->_padding_for_text_result_merge = a3;
}

- (BOOL)readFrom:(id)a3
{
  return VISTextDetectionPostProcessConfigReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  if ([(VISTextDetectionPostProcessConfig *)self enable_text_bounding_box_merge]) {
    PBDataWriterWriteBOOLField();
  }
  [(VISTextDetectionPostProcessConfig *)self text_merge_iou_threshold];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(VISTextDetectionPostProcessConfig *)self enable_text_bounding_box_suppress]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(VISTextDetectionPostProcessConfig *)self enable_text_font_size_suppress]) {
    PBDataWriterWriteBOOLField();
  }
  [(VISTextDetectionPostProcessConfig *)self font_size_suppress_threshold];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(VISTextDetectionPostProcessConfig *)self enable_text_confidence_suppress]) {
    PBDataWriterWriteBOOLField();
  }
  [(VISTextDetectionPostProcessConfig *)self text_confidence_suppress_threshold];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(VISTextDetectionPostProcessConfig *)self enable_text_bbox_size_suppress]) {
    PBDataWriterWriteBOOLField();
  }
  [(VISTextDetectionPostProcessConfig *)self text_bbox_size_suppress_threshold];
  if (v7 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(VISTextDetectionPostProcessConfig *)self enable_text_negative_objects_suppress])
  {
    PBDataWriterWriteBOOLField();
  }
  [(VISTextDetectionPostProcessConfig *)self text_suppress_iou_threshold];
  if (v8 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISTextDetectionPostProcessConfig *)self padding_for_text_result_merge];
  v9 = v11;
  if (v10 != 0.0)
  {
    PBDataWriterWriteFloatField();
    v9 = v11;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  int enable_text_bounding_box_merge = self->_enable_text_bounding_box_merge;
  if (enable_text_bounding_box_merge != objc_msgSend(v4, "enable_text_bounding_box_merge")) {
    goto LABEL_13;
  }
  float text_merge_iou_threshold = self->_text_merge_iou_threshold;
  objc_msgSend(v4, "text_merge_iou_threshold");
  if (text_merge_iou_threshold != v7) {
    goto LABEL_13;
  }
  int enable_text_bounding_box_suppress = self->_enable_text_bounding_box_suppress;
  if (enable_text_bounding_box_suppress != objc_msgSend(v4, "enable_text_bounding_box_suppress")) {
    goto LABEL_13;
  }
  int enable_text_font_size_suppress = self->_enable_text_font_size_suppress;
  if (enable_text_font_size_suppress != objc_msgSend(v4, "enable_text_font_size_suppress")) {
    goto LABEL_13;
  }
  float font_size_suppress_threshold = self->_font_size_suppress_threshold;
  objc_msgSend(v4, "font_size_suppress_threshold");
  if (font_size_suppress_threshold != v11) {
    goto LABEL_13;
  }
  int enable_text_confidence_suppress = self->_enable_text_confidence_suppress;
  if (enable_text_confidence_suppress != objc_msgSend(v4, "enable_text_confidence_suppress")) {
    goto LABEL_13;
  }
  float text_confidence_suppress_threshold = self->_text_confidence_suppress_threshold;
  objc_msgSend(v4, "text_confidence_suppress_threshold");
  if (text_confidence_suppress_threshold != v14) {
    goto LABEL_13;
  }
  int enable_text_bbox_size_suppress = self->_enable_text_bbox_size_suppress;
  if (enable_text_bbox_size_suppress == objc_msgSend(v4, "enable_text_bbox_size_suppress")
    && (float text_bbox_size_suppress_threshold = self->_text_bbox_size_suppress_threshold,
        objc_msgSend(v4, "text_bbox_size_suppress_threshold"),
        text_bbox_size_suppress_threshold == v17)
    && (int enable_text_negative_objects_suppress = self->_enable_text_negative_objects_suppress,
        enable_text_negative_objects_suppress == objc_msgSend(v4, "enable_text_negative_objects_suppress"))
    && (float text_suppress_iou_threshold = self->_text_suppress_iou_threshold,
        objc_msgSend(v4, "text_suppress_iou_threshold"),
        text_suppress_iou_threshold == v20))
  {
    float padding_for_text_result_merge = self->_padding_for_text_result_merge;
    objc_msgSend(v4, "padding_for_text_result_merge");
    BOOL v21 = padding_for_text_result_merge == v24;
  }
  else
  {
LABEL_13:
    BOOL v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  BOOL enable_text_bounding_box_merge = self->_enable_text_bounding_box_merge;
  float text_merge_iou_threshold = self->_text_merge_iou_threshold;
  BOOL v4 = text_merge_iou_threshold < 0.0;
  if (text_merge_iou_threshold == 0.0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    double v5 = text_merge_iou_threshold;
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
  BOOL enable_text_font_size_suppress = self->_enable_text_font_size_suppress;
  BOOL enable_text_bounding_box_suppress = self->_enable_text_bounding_box_suppress;
  float font_size_suppress_threshold = self->_font_size_suppress_threshold;
  BOOL v11 = font_size_suppress_threshold < 0.0;
  if (font_size_suppress_threshold == 0.0)
  {
    unint64_t v16 = 0;
  }
  else
  {
    double v12 = font_size_suppress_threshold;
    double v13 = -v12;
    if (!v11) {
      double v13 = v12;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v16 += (unint64_t)v15;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v15);
    }
  }
  BOOL enable_text_confidence_suppress = self->_enable_text_confidence_suppress;
  float text_confidence_suppress_threshold = self->_text_confidence_suppress_threshold;
  BOOL v19 = text_confidence_suppress_threshold < 0.0;
  if (text_confidence_suppress_threshold == 0.0)
  {
    unint64_t v24 = 0;
  }
  else
  {
    double v20 = text_confidence_suppress_threshold;
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
  BOOL enable_text_bbox_size_suppress = self->_enable_text_bbox_size_suppress;
  float text_bbox_size_suppress_threshold = self->_text_bbox_size_suppress_threshold;
  BOOL v27 = text_bbox_size_suppress_threshold < 0.0;
  if (text_bbox_size_suppress_threshold == 0.0)
  {
    unint64_t v32 = 0;
  }
  else
  {
    double v28 = text_bbox_size_suppress_threshold;
    double v29 = -v28;
    if (!v27) {
      double v29 = v28;
    }
    long double v30 = floor(v29 + 0.5);
    double v31 = (v29 - v30) * 1.84467441e19;
    unint64_t v32 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0) {
        v32 += (unint64_t)v31;
      }
    }
    else
    {
      v32 -= (unint64_t)fabs(v31);
    }
  }
  BOOL enable_text_negative_objects_suppress = self->_enable_text_negative_objects_suppress;
  float text_suppress_iou_threshold = self->_text_suppress_iou_threshold;
  BOOL v35 = text_suppress_iou_threshold < 0.0;
  if (text_suppress_iou_threshold == 0.0)
  {
    unint64_t v40 = 0;
  }
  else
  {
    double v36 = text_suppress_iou_threshold;
    double v37 = -v36;
    if (!v35) {
      double v37 = v36;
    }
    long double v38 = floor(v37 + 0.5);
    double v39 = (v37 - v38) * 1.84467441e19;
    unint64_t v40 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0) {
        v40 += (unint64_t)v39;
      }
    }
    else
    {
      v40 -= (unint64_t)fabs(v39);
    }
  }
  float padding_for_text_result_merge = self->_padding_for_text_result_merge;
  BOOL v42 = padding_for_text_result_merge < 0.0;
  if (padding_for_text_result_merge == 0.0)
  {
    unint64_t v47 = 0;
    goto LABEL_47;
  }
  double v43 = padding_for_text_result_merge;
  double v44 = -v43;
  if (!v42) {
    double v44 = v43;
  }
  long double v45 = floor(v44 + 0.5);
  double v46 = (v44 - v45) * 1.84467441e19;
  unint64_t v47 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
  if (v46 < 0.0)
  {
    v47 -= (unint64_t)fabs(v46);
LABEL_47:
    BOOL v48 = enable_text_bounding_box_suppress;
    BOOL v49 = enable_text_bounding_box_merge;
    BOOL v50 = enable_text_font_size_suppress;
    goto LABEL_48;
  }
  BOOL v48 = enable_text_bounding_box_suppress;
  BOOL v49 = enable_text_bounding_box_merge;
  BOOL v50 = enable_text_font_size_suppress;
  if (v46 > 0.0) {
    v47 += (unint64_t)v46;
  }
LABEL_48:
  if (enable_text_negative_objects_suppress) {
    uint64_t v51 = 2654435761;
  }
  else {
    uint64_t v51 = 0;
  }
  if (enable_text_bbox_size_suppress) {
    uint64_t v52 = 2654435761;
  }
  else {
    uint64_t v52 = 0;
  }
  if (enable_text_confidence_suppress) {
    uint64_t v53 = 2654435761;
  }
  else {
    uint64_t v53 = 0;
  }
  if (v50) {
    uint64_t v54 = 2654435761;
  }
  else {
    uint64_t v54 = 0;
  }
  if (v48) {
    uint64_t v55 = 2654435761;
  }
  else {
    uint64_t v55 = 0;
  }
  if (v49) {
    uint64_t v56 = 2654435761;
  }
  else {
    uint64_t v56 = 0;
  }
  return v9 ^ v56 ^ v55 ^ v54 ^ v16 ^ v53 ^ v24 ^ v52 ^ v32 ^ v51 ^ v40 ^ v47;
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_enable_text_bbox_size_suppress)
  {
    BOOL v4 = objc_msgSend(NSNumber, "numberWithBool:", -[VISTextDetectionPostProcessConfig enable_text_bbox_size_suppress](self, "enable_text_bbox_size_suppress"));
    [v3 setObject:v4 forKeyedSubscript:@"enableTextBboxSizeSuppress"];
  }
  if (self->_enable_text_bounding_box_merge)
  {
    double v5 = objc_msgSend(NSNumber, "numberWithBool:", -[VISTextDetectionPostProcessConfig enable_text_bounding_box_merge](self, "enable_text_bounding_box_merge"));
    [v3 setObject:v5 forKeyedSubscript:@"enableTextBoundingBoxMerge"];
  }
  if (self->_enable_text_bounding_box_suppress)
  {
    double v6 = objc_msgSend(NSNumber, "numberWithBool:", -[VISTextDetectionPostProcessConfig enable_text_bounding_box_suppress](self, "enable_text_bounding_box_suppress"));
    [v3 setObject:v6 forKeyedSubscript:@"enableTextBoundingBoxSuppress"];
  }
  if (self->_enable_text_confidence_suppress)
  {
    long double v7 = objc_msgSend(NSNumber, "numberWithBool:", -[VISTextDetectionPostProcessConfig enable_text_confidence_suppress](self, "enable_text_confidence_suppress"));
    [v3 setObject:v7 forKeyedSubscript:@"enableTextConfidenceSuppress"];
  }
  if (self->_enable_text_font_size_suppress)
  {
    double v8 = objc_msgSend(NSNumber, "numberWithBool:", -[VISTextDetectionPostProcessConfig enable_text_font_size_suppress](self, "enable_text_font_size_suppress"));
    [v3 setObject:v8 forKeyedSubscript:@"enableTextFontSizeSuppress"];
  }
  if (self->_enable_text_negative_objects_suppress)
  {
    unint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[VISTextDetectionPostProcessConfig enable_text_negative_objects_suppress](self, "enable_text_negative_objects_suppress"));
    [v3 setObject:v9 forKeyedSubscript:@"enableTextNegativeObjectsSuppress"];
  }
  if (self->_font_size_suppress_threshold != 0.0)
  {
    float v10 = NSNumber;
    [(VISTextDetectionPostProcessConfig *)self font_size_suppress_threshold];
    BOOL v11 = objc_msgSend(v10, "numberWithFloat:");
    [v3 setObject:v11 forKeyedSubscript:@"fontSizeSuppressThreshold"];
  }
  if (self->_padding_for_text_result_merge != 0.0)
  {
    double v12 = NSNumber;
    [(VISTextDetectionPostProcessConfig *)self padding_for_text_result_merge];
    double v13 = objc_msgSend(v12, "numberWithFloat:");
    [v3 setObject:v13 forKeyedSubscript:@"paddingForTextResultMerge"];
  }
  if (self->_text_bbox_size_suppress_threshold != 0.0)
  {
    long double v14 = NSNumber;
    [(VISTextDetectionPostProcessConfig *)self text_bbox_size_suppress_threshold];
    double v15 = objc_msgSend(v14, "numberWithFloat:");
    [v3 setObject:v15 forKeyedSubscript:@"textBboxSizeSuppressThreshold"];
  }
  if (self->_text_confidence_suppress_threshold != 0.0)
  {
    unint64_t v16 = NSNumber;
    [(VISTextDetectionPostProcessConfig *)self text_confidence_suppress_threshold];
    float v17 = objc_msgSend(v16, "numberWithFloat:");
    [v3 setObject:v17 forKeyedSubscript:@"textConfidenceSuppressThreshold"];
  }
  if (self->_text_merge_iou_threshold != 0.0)
  {
    v18 = NSNumber;
    [(VISTextDetectionPostProcessConfig *)self text_merge_iou_threshold];
    BOOL v19 = objc_msgSend(v18, "numberWithFloat:");
    [v3 setObject:v19 forKeyedSubscript:@"textMergeIouThreshold"];
  }
  if (self->_text_suppress_iou_threshold != 0.0)
  {
    double v20 = NSNumber;
    [(VISTextDetectionPostProcessConfig *)self text_suppress_iou_threshold];
    double v21 = objc_msgSend(v20, "numberWithFloat:");
    [v3 setObject:v21 forKeyedSubscript:@"textSuppressIouThreshold"];
  }
  return v3;
}

- (NSData)jsonData
{
  v2 = [(VISTextDetectionPostProcessConfig *)self dictionaryRepresentation];
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

- (VISTextDetectionPostProcessConfig)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  BOOL v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = 0;
  }
  else
  {
    self = [(VISTextDetectionPostProcessConfig *)self initWithDictionary:v4];
    double v5 = self;
  }

  return v5;
}

- (VISTextDetectionPostProcessConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VISTextDetectionPostProcessConfig;
  double v5 = [(VISTextDetectionPostProcessConfig *)&v26 init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"enableTextBoundingBoxMerge"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISTextDetectionPostProcessConfig setEnable_text_bounding_box_merge:](v5, "setEnable_text_bounding_box_merge:", [v6 BOOLValue]);
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"textMergeIouThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[VISTextDetectionPostProcessConfig setText_merge_iou_threshold:](v5, "setText_merge_iou_threshold:");
    }
    double v8 = [v4 objectForKeyedSubscript:@"enableTextBoundingBoxSuppress"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISTextDetectionPostProcessConfig setEnable_text_bounding_box_suppress:](v5, "setEnable_text_bounding_box_suppress:", [v8 BOOLValue]);
    }
    unint64_t v9 = [v4 objectForKeyedSubscript:@"enableTextFontSizeSuppress"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISTextDetectionPostProcessConfig setEnable_text_font_size_suppress:](v5, "setEnable_text_font_size_suppress:", [v9 BOOLValue]);
    }
    float v10 = [v4 objectForKeyedSubscript:@"fontSizeSuppressThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[VISTextDetectionPostProcessConfig setFont_size_suppress_threshold:](v5, "setFont_size_suppress_threshold:");
    }
    BOOL v11 = [v4 objectForKeyedSubscript:@"enableTextConfidenceSuppress"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISTextDetectionPostProcessConfig setEnable_text_confidence_suppress:](v5, "setEnable_text_confidence_suppress:", [v11 BOOLValue]);
    }
    double v21 = v11;
    double v12 = [v4 objectForKeyedSubscript:@"textConfidenceSuppressThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[VISTextDetectionPostProcessConfig setText_confidence_suppress_threshold:](v5, "setText_confidence_suppress_threshold:");
    }
    v25 = v6;
    double v13 = [v4 objectForKeyedSubscript:@"enableTextBboxSizeSuppress"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISTextDetectionPostProcessConfig setEnable_text_bbox_size_suppress:](v5, "setEnable_text_bbox_size_suppress:", [v13 BOOLValue]);
    }
    unint64_t v24 = v7;
    long double v14 = [v4 objectForKeyedSubscript:@"textBboxSizeSuppressThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      -[VISTextDetectionPostProcessConfig setText_bbox_size_suppress_threshold:](v5, "setText_bbox_size_suppress_threshold:");
    }
    long double v22 = v10;
    double v23 = v8;
    double v15 = [v4 objectForKeyedSubscript:@"enableTextNegativeObjectsSuppress"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISTextDetectionPostProcessConfig setEnable_text_negative_objects_suppress:](v5, "setEnable_text_negative_objects_suppress:", [v15 BOOLValue]);
    }
    unint64_t v16 = v9;
    float v17 = [v4 objectForKeyedSubscript:@"textSuppressIouThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v17 floatValue];
      -[VISTextDetectionPostProcessConfig setText_suppress_iou_threshold:](v5, "setText_suppress_iou_threshold:");
    }
    v18 = [v4 objectForKeyedSubscript:@"paddingForTextResultMerge"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 floatValue];
      -[VISTextDetectionPostProcessConfig setPadding_for_text_result_merge:](v5, "setPadding_for_text_result_merge:");
    }
    BOOL v19 = v5;
  }
  return v5;
}

- (BOOL)enable_text_bounding_box_merge
{
  return self->_enable_text_bounding_box_merge;
}

- (float)text_merge_iou_threshold
{
  return self->_text_merge_iou_threshold;
}

- (BOOL)enable_text_bounding_box_suppress
{
  return self->_enable_text_bounding_box_suppress;
}

- (BOOL)enable_text_font_size_suppress
{
  return self->_enable_text_font_size_suppress;
}

- (float)font_size_suppress_threshold
{
  return self->_font_size_suppress_threshold;
}

- (BOOL)enable_text_confidence_suppress
{
  return self->_enable_text_confidence_suppress;
}

- (float)text_confidence_suppress_threshold
{
  return self->_text_confidence_suppress_threshold;
}

- (BOOL)enable_text_bbox_size_suppress
{
  return self->_enable_text_bbox_size_suppress;
}

- (float)text_bbox_size_suppress_threshold
{
  return self->_text_bbox_size_suppress_threshold;
}

- (BOOL)enable_text_negative_objects_suppress
{
  return self->_enable_text_negative_objects_suppress;
}

- (float)text_suppress_iou_threshold
{
  return self->_text_suppress_iou_threshold;
}

- (float)padding_for_text_result_merge
{
  return self->_padding_for_text_result_merge;
}

@end