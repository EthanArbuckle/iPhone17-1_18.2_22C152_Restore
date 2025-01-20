@interface VISTextConsolidationConfig
- (BOOL)enable_smoothed_transformation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (VISTextConsolidationConfig)initWithDictionary:(id)a3;
- (VISTextConsolidationConfig)initWithJSON:(id)a3;
- (float)angular_offset_exponential_smoothing;
- (float)confidence_filter_ratio;
- (float)confidence_hysteresis_temporal_lag_before_confident;
- (float)confidence_hysteresis_temporal_lag_before_not_confident;
- (float)confidence_hysteresis_value_lag;
- (float)confidence_threshold;
- (float)font_size_start_reporting_threshold;
- (float)font_size_stop_reporting_threshold;
- (float)geo_cost_depth_threshold;
- (float)match_cost_threshold;
- (float)model_aspect_ratio;
- (float)world_position_update_distance_threshold;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAngular_offset_exponential_smoothing:(float)a3;
- (void)setConfidence_filter_ratio:(float)a3;
- (void)setConfidence_hysteresis_temporal_lag_before_confident:(float)a3;
- (void)setConfidence_hysteresis_temporal_lag_before_not_confident:(float)a3;
- (void)setConfidence_hysteresis_value_lag:(float)a3;
- (void)setConfidence_threshold:(float)a3;
- (void)setEnable_smoothed_transformation:(BOOL)a3;
- (void)setFont_size_start_reporting_threshold:(float)a3;
- (void)setFont_size_stop_reporting_threshold:(float)a3;
- (void)setGeo_cost_depth_threshold:(float)a3;
- (void)setMatch_cost_threshold:(float)a3;
- (void)setModel_aspect_ratio:(float)a3;
- (void)setWorld_position_update_distance_threshold:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VISTextConsolidationConfig

- (void)setMatch_cost_threshold:(float)a3
{
  self->_match_cost_threshold = a3;
}

- (void)setFont_size_start_reporting_threshold:(float)a3
{
  self->_font_size_start_reporting_threshold = a3;
}

- (void)setFont_size_stop_reporting_threshold:(float)a3
{
  self->_font_size_stop_reporting_threshold = a3;
}

- (void)setAngular_offset_exponential_smoothing:(float)a3
{
  self->_angular_offset_exponential_smoothing = a3;
}

- (void)setModel_aspect_ratio:(float)a3
{
  self->_model_aspect_ratio = a3;
}

- (void)setConfidence_threshold:(float)a3
{
  self->_confidence_threshold = a3;
}

- (void)setConfidence_filter_ratio:(float)a3
{
  self->_confidence_filter_ratio = a3;
}

- (void)setConfidence_hysteresis_value_lag:(float)a3
{
  self->_confidence_hysteresis_value_lag = a3;
}

- (void)setConfidence_hysteresis_temporal_lag_before_confident:(float)a3
{
  self->_confidence_hysteresis_temporal_lag_before_confident = a3;
}

- (void)setConfidence_hysteresis_temporal_lag_before_not_confident:(float)a3
{
  self->_confidence_hysteresis_temporal_lag_before_not_confident = a3;
}

- (void)setEnable_smoothed_transformation:(BOOL)a3
{
  self->_enable_smoothed_transformation = a3;
}

- (void)setGeo_cost_depth_threshold:(float)a3
{
  self->_geo_cost_depth_threshold = a3;
}

- (void)setWorld_position_update_distance_threshold:(float)a3
{
  self->_world_position_update_distance_threshold = a3;
}

- (BOOL)readFrom:(id)a3
{
  return VISTextConsolidationConfigReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v17 = a3;
  [(VISTextConsolidationConfig *)self match_cost_threshold];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISTextConsolidationConfig *)self font_size_start_reporting_threshold];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISTextConsolidationConfig *)self font_size_stop_reporting_threshold];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISTextConsolidationConfig *)self angular_offset_exponential_smoothing];
  if (v7 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISTextConsolidationConfig *)self model_aspect_ratio];
  if (v8 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISTextConsolidationConfig *)self confidence_threshold];
  if (v9 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISTextConsolidationConfig *)self confidence_filter_ratio];
  if (v10 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISTextConsolidationConfig *)self confidence_hysteresis_value_lag];
  if (v11 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISTextConsolidationConfig *)self confidence_hysteresis_temporal_lag_before_confident];
  if (v12 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISTextConsolidationConfig *)self confidence_hysteresis_temporal_lag_before_not_confident];
  if (v13 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(VISTextConsolidationConfig *)self enable_smoothed_transformation]) {
    PBDataWriterWriteBOOLField();
  }
  [(VISTextConsolidationConfig *)self geo_cost_depth_threshold];
  if (v14 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISTextConsolidationConfig *)self world_position_update_distance_threshold];
  v15 = v17;
  if (v16 != 0.0)
  {
    PBDataWriterWriteFloatField();
    v15 = v17;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  float match_cost_threshold = self->_match_cost_threshold;
  objc_msgSend(v4, "match_cost_threshold");
  if (match_cost_threshold != v6) {
    goto LABEL_14;
  }
  float font_size_start_reporting_threshold = self->_font_size_start_reporting_threshold;
  objc_msgSend(v4, "font_size_start_reporting_threshold");
  if (font_size_start_reporting_threshold != v8) {
    goto LABEL_14;
  }
  float font_size_stop_reporting_threshold = self->_font_size_stop_reporting_threshold;
  objc_msgSend(v4, "font_size_stop_reporting_threshold");
  if (font_size_stop_reporting_threshold != v10) {
    goto LABEL_14;
  }
  float angular_offset_exponential_smoothing = self->_angular_offset_exponential_smoothing;
  objc_msgSend(v4, "angular_offset_exponential_smoothing");
  if (angular_offset_exponential_smoothing != v12) {
    goto LABEL_14;
  }
  float model_aspect_ratio = self->_model_aspect_ratio;
  objc_msgSend(v4, "model_aspect_ratio");
  if (model_aspect_ratio != v14) {
    goto LABEL_14;
  }
  float confidence_threshold = self->_confidence_threshold;
  objc_msgSend(v4, "confidence_threshold");
  if (confidence_threshold != v16) {
    goto LABEL_14;
  }
  float confidence_filter_ratio = self->_confidence_filter_ratio;
  objc_msgSend(v4, "confidence_filter_ratio");
  if (confidence_filter_ratio != v18) {
    goto LABEL_14;
  }
  float confidence_hysteresis_value_lag = self->_confidence_hysteresis_value_lag;
  objc_msgSend(v4, "confidence_hysteresis_value_lag");
  if (confidence_hysteresis_value_lag != v20) {
    goto LABEL_14;
  }
  float confidence_hysteresis_temporal_lag_before_confident = self->_confidence_hysteresis_temporal_lag_before_confident;
  objc_msgSend(v4, "confidence_hysteresis_temporal_lag_before_confident");
  if (confidence_hysteresis_temporal_lag_before_confident == v22
    && (float confidence_hysteresis_temporal_lag_before_not_confident = self->_confidence_hysteresis_temporal_lag_before_not_confident,
        objc_msgSend(v4, "confidence_hysteresis_temporal_lag_before_not_confident"),
        confidence_hysteresis_temporal_lag_before_not_confident == v24)
    && (int enable_smoothed_transformation = self->_enable_smoothed_transformation,
        enable_smoothed_transformation == objc_msgSend(v4, "enable_smoothed_transformation"))
    && (float geo_cost_depth_threshold = self->_geo_cost_depth_threshold,
        objc_msgSend(v4, "geo_cost_depth_threshold"),
        geo_cost_depth_threshold == v27))
  {
    float world_position_update_distance_threshold = self->_world_position_update_distance_threshold;
    objc_msgSend(v4, "world_position_update_distance_threshold");
    BOOL v28 = world_position_update_distance_threshold == v31;
  }
  else
  {
LABEL_14:
    BOOL v28 = 0;
  }

  return v28;
}

- (unint64_t)hash
{
  float match_cost_threshold = self->_match_cost_threshold;
  BOOL v4 = match_cost_threshold < 0.0;
  if (match_cost_threshold == 0.0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    double v5 = match_cost_threshold;
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
  float font_size_start_reporting_threshold = self->_font_size_start_reporting_threshold;
  BOOL v11 = font_size_start_reporting_threshold < 0.0;
  if (font_size_start_reporting_threshold == 0.0)
  {
    unint64_t v16 = 0;
  }
  else
  {
    double v12 = font_size_start_reporting_threshold;
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
  float font_size_stop_reporting_threshold = self->_font_size_stop_reporting_threshold;
  BOOL v18 = font_size_stop_reporting_threshold < 0.0;
  if (font_size_stop_reporting_threshold == 0.0)
  {
    unint64_t v23 = 0;
  }
  else
  {
    double v19 = font_size_stop_reporting_threshold;
    double v20 = -v19;
    if (!v18) {
      double v20 = v19;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v23 += (unint64_t)v22;
      }
    }
    else
    {
      v23 -= (unint64_t)fabs(v22);
    }
  }
  float angular_offset_exponential_smoothing = self->_angular_offset_exponential_smoothing;
  BOOL v25 = angular_offset_exponential_smoothing < 0.0;
  if (angular_offset_exponential_smoothing == 0.0)
  {
    unint64_t v30 = 0;
  }
  else
  {
    double v26 = angular_offset_exponential_smoothing;
    double v27 = -v26;
    if (!v25) {
      double v27 = v26;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v30 += (unint64_t)v29;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v29);
    }
  }
  float model_aspect_ratio = self->_model_aspect_ratio;
  BOOL v32 = model_aspect_ratio < 0.0;
  if (model_aspect_ratio == 0.0)
  {
    unint64_t v37 = 0;
  }
  else
  {
    double v33 = model_aspect_ratio;
    double v34 = -v33;
    if (!v32) {
      double v34 = v33;
    }
    long double v35 = floor(v34 + 0.5);
    double v36 = (v34 - v35) * 1.84467441e19;
    unint64_t v37 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0) {
        v37 += (unint64_t)v36;
      }
    }
    else
    {
      v37 -= (unint64_t)fabs(v36);
    }
  }
  float confidence_threshold = self->_confidence_threshold;
  BOOL v39 = confidence_threshold < 0.0;
  if (confidence_threshold == 0.0)
  {
    unint64_t v44 = 0;
  }
  else
  {
    double v40 = confidence_threshold;
    double v41 = -v40;
    if (!v39) {
      double v41 = v40;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v44 += (unint64_t)v43;
      }
    }
    else
    {
      v44 -= (unint64_t)fabs(v43);
    }
  }
  float confidence_filter_ratio = self->_confidence_filter_ratio;
  BOOL v46 = confidence_filter_ratio < 0.0;
  if (confidence_filter_ratio == 0.0)
  {
    unint64_t v51 = 0;
  }
  else
  {
    double v47 = confidence_filter_ratio;
    double v48 = -v47;
    if (!v46) {
      double v48 = v47;
    }
    long double v49 = floor(v48 + 0.5);
    double v50 = (v48 - v49) * 1.84467441e19;
    unint64_t v51 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0) {
        v51 += (unint64_t)v50;
      }
    }
    else
    {
      v51 -= (unint64_t)fabs(v50);
    }
  }
  float confidence_hysteresis_value_lag = self->_confidence_hysteresis_value_lag;
  BOOL v53 = confidence_hysteresis_value_lag < 0.0;
  if (confidence_hysteresis_value_lag == 0.0)
  {
    unint64_t v58 = 0;
  }
  else
  {
    double v54 = confidence_hysteresis_value_lag;
    double v55 = -v54;
    if (!v53) {
      double v55 = v54;
    }
    long double v56 = floor(v55 + 0.5);
    double v57 = (v55 - v56) * 1.84467441e19;
    unint64_t v58 = 2654435761u * (unint64_t)fmod(v56, 1.84467441e19);
    if (v57 >= 0.0)
    {
      if (v57 > 0.0) {
        v58 += (unint64_t)v57;
      }
    }
    else
    {
      v58 -= (unint64_t)fabs(v57);
    }
  }
  float confidence_hysteresis_temporal_lag_before_confident = self->_confidence_hysteresis_temporal_lag_before_confident;
  BOOL v60 = confidence_hysteresis_temporal_lag_before_confident < 0.0;
  unint64_t v95 = v51;
  if (confidence_hysteresis_temporal_lag_before_confident == 0.0)
  {
    unint64_t v65 = 0;
  }
  else
  {
    double v61 = confidence_hysteresis_temporal_lag_before_confident;
    double v62 = -v61;
    if (!v60) {
      double v62 = v61;
    }
    long double v63 = floor(v62 + 0.5);
    double v64 = (v62 - v63) * 1.84467441e19;
    unint64_t v65 = 2654435761u * (unint64_t)fmod(v63, 1.84467441e19);
    if (v64 >= 0.0)
    {
      if (v64 > 0.0) {
        v65 += (unint64_t)v64;
      }
    }
    else
    {
      v65 -= (unint64_t)fabs(v64);
    }
  }
  float confidence_hysteresis_temporal_lag_before_not_confident = self->_confidence_hysteresis_temporal_lag_before_not_confident;
  BOOL v67 = confidence_hysteresis_temporal_lag_before_not_confident < 0.0;
  unint64_t v96 = v44;
  unint64_t v97 = v37;
  unint64_t v94 = v58;
  if (confidence_hysteresis_temporal_lag_before_not_confident == 0.0)
  {
    unint64_t v73 = v30;
    unint64_t v74 = v23;
    unint64_t v75 = v16;
    unint64_t v76 = v9;
    unint64_t v72 = 0;
  }
  else
  {
    double v68 = confidence_hysteresis_temporal_lag_before_not_confident;
    double v69 = -v68;
    if (!v67) {
      double v69 = v68;
    }
    long double v70 = floor(v69 + 0.5);
    double v71 = (v69 - v70) * 1.84467441e19;
    unint64_t v72 = 2654435761u * (unint64_t)fmod(v70, 1.84467441e19);
    unint64_t v73 = v30;
    unint64_t v74 = v23;
    unint64_t v75 = v16;
    unint64_t v76 = v9;
    if (v71 >= 0.0)
    {
      if (v71 > 0.0) {
        v72 += (unint64_t)v71;
      }
    }
    else
    {
      v72 -= (unint64_t)fabs(v71);
    }
  }
  BOOL enable_smoothed_transformation = self->_enable_smoothed_transformation;
  float geo_cost_depth_threshold = self->_geo_cost_depth_threshold;
  BOOL v79 = geo_cost_depth_threshold < 0.0;
  if (geo_cost_depth_threshold == 0.0)
  {
    unint64_t v84 = 0;
  }
  else
  {
    double v80 = geo_cost_depth_threshold;
    double v81 = -v80;
    if (!v79) {
      double v81 = v80;
    }
    long double v82 = floor(v81 + 0.5);
    double v83 = (v81 - v82) * 1.84467441e19;
    unint64_t v84 = 2654435761u * (unint64_t)fmod(v82, 1.84467441e19);
    if (v83 >= 0.0)
    {
      if (v83 > 0.0) {
        v84 += (unint64_t)v83;
      }
    }
    else
    {
      v84 -= (unint64_t)fabs(v83);
    }
  }
  float world_position_update_distance_threshold = self->_world_position_update_distance_threshold;
  BOOL v86 = world_position_update_distance_threshold < 0.0;
  if (world_position_update_distance_threshold == 0.0)
  {
    unint64_t v91 = 0;
  }
  else
  {
    double v87 = world_position_update_distance_threshold;
    double v88 = -v87;
    if (!v86) {
      double v88 = v87;
    }
    long double v89 = floor(v88 + 0.5);
    double v90 = (v88 - v89) * 1.84467441e19;
    unint64_t v91 = 2654435761u * (unint64_t)fmod(v89, 1.84467441e19);
    if (v90 >= 0.0)
    {
      if (v90 > 0.0) {
        v91 += (unint64_t)v90;
      }
    }
    else
    {
      v91 -= (unint64_t)fabs(v90);
    }
  }
  if (enable_smoothed_transformation) {
    uint64_t v92 = 2654435761;
  }
  else {
    uint64_t v92 = 0;
  }
  return v75 ^ v76 ^ v74 ^ v73 ^ v97 ^ v96 ^ v95 ^ v94 ^ v65 ^ v72 ^ v84 ^ v91 ^ v92;
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_angular_offset_exponential_smoothing != 0.0)
  {
    BOOL v4 = NSNumber;
    [(VISTextConsolidationConfig *)self angular_offset_exponential_smoothing];
    double v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"angularOffsetExponentialSmoothing"];
  }
  if (self->_confidence_filter_ratio != 0.0)
  {
    double v6 = NSNumber;
    [(VISTextConsolidationConfig *)self confidence_filter_ratio];
    long double v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"confidenceFilterRatio"];
  }
  if (self->_confidence_hysteresis_temporal_lag_before_confident != 0.0)
  {
    double v8 = NSNumber;
    [(VISTextConsolidationConfig *)self confidence_hysteresis_temporal_lag_before_confident];
    unint64_t v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"confidenceHysteresisTemporalLagBeforeConfident"];
  }
  if (self->_confidence_hysteresis_temporal_lag_before_not_confident != 0.0)
  {
    float v10 = NSNumber;
    [(VISTextConsolidationConfig *)self confidence_hysteresis_temporal_lag_before_not_confident];
    BOOL v11 = objc_msgSend(v10, "numberWithFloat:");
    [v3 setObject:v11 forKeyedSubscript:@"confidenceHysteresisTemporalLagBeforeNotConfident"];
  }
  if (self->_confidence_hysteresis_value_lag != 0.0)
  {
    double v12 = NSNumber;
    [(VISTextConsolidationConfig *)self confidence_hysteresis_value_lag];
    double v13 = objc_msgSend(v12, "numberWithFloat:");
    [v3 setObject:v13 forKeyedSubscript:@"confidenceHysteresisValueLag"];
  }
  if (self->_confidence_threshold != 0.0)
  {
    long double v14 = NSNumber;
    [(VISTextConsolidationConfig *)self confidence_threshold];
    double v15 = objc_msgSend(v14, "numberWithFloat:");
    [v3 setObject:v15 forKeyedSubscript:@"confidenceThreshold"];
  }
  if (self->_enable_smoothed_transformation)
  {
    unint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", -[VISTextConsolidationConfig enable_smoothed_transformation](self, "enable_smoothed_transformation"));
    [v3 setObject:v16 forKeyedSubscript:@"enableSmoothedTransformation"];
  }
  if (self->_font_size_start_reporting_threshold != 0.0)
  {
    id v17 = NSNumber;
    [(VISTextConsolidationConfig *)self font_size_start_reporting_threshold];
    BOOL v18 = objc_msgSend(v17, "numberWithFloat:");
    [v3 setObject:v18 forKeyedSubscript:@"fontSizeStartReportingThreshold"];
  }
  if (self->_font_size_stop_reporting_threshold != 0.0)
  {
    double v19 = NSNumber;
    [(VISTextConsolidationConfig *)self font_size_stop_reporting_threshold];
    double v20 = objc_msgSend(v19, "numberWithFloat:");
    [v3 setObject:v20 forKeyedSubscript:@"fontSizeStopReportingThreshold"];
  }
  if (self->_geo_cost_depth_threshold != 0.0)
  {
    long double v21 = NSNumber;
    [(VISTextConsolidationConfig *)self geo_cost_depth_threshold];
    double v22 = objc_msgSend(v21, "numberWithFloat:");
    [v3 setObject:v22 forKeyedSubscript:@"geoCostDepthThreshold"];
  }
  if (self->_match_cost_threshold != 0.0)
  {
    unint64_t v23 = NSNumber;
    [(VISTextConsolidationConfig *)self match_cost_threshold];
    float v24 = objc_msgSend(v23, "numberWithFloat:");
    [v3 setObject:v24 forKeyedSubscript:@"matchCostThreshold"];
  }
  if (self->_model_aspect_ratio != 0.0)
  {
    BOOL v25 = NSNumber;
    [(VISTextConsolidationConfig *)self model_aspect_ratio];
    double v26 = objc_msgSend(v25, "numberWithFloat:");
    [v3 setObject:v26 forKeyedSubscript:@"modelAspectRatio"];
  }
  if (self->_world_position_update_distance_threshold != 0.0)
  {
    double v27 = NSNumber;
    [(VISTextConsolidationConfig *)self world_position_update_distance_threshold];
    long double v28 = objc_msgSend(v27, "numberWithFloat:");
    [v3 setObject:v28 forKeyedSubscript:@"worldPositionUpdateDistanceThreshold"];
  }
  return v3;
}

- (NSData)jsonData
{
  v2 = [(VISTextConsolidationConfig *)self dictionaryRepresentation];
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

- (VISTextConsolidationConfig)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  BOOL v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = 0;
  }
  else
  {
    self = [(VISTextConsolidationConfig *)self initWithDictionary:v4];
    double v5 = self;
  }

  return v5;
}

- (VISTextConsolidationConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)VISTextConsolidationConfig;
  double v5 = [(VISTextConsolidationConfig *)&v28 init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"matchCostThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[VISTextConsolidationConfig setMatch_cost_threshold:](v5, "setMatch_cost_threshold:");
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"fontSizeStartReportingThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[VISTextConsolidationConfig setFont_size_start_reporting_threshold:](v5, "setFont_size_start_reporting_threshold:");
    }
    double v8 = [v4 objectForKeyedSubscript:@"fontSizeStopReportingThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[VISTextConsolidationConfig setFont_size_stop_reporting_threshold:](v5, "setFont_size_stop_reporting_threshold:");
    }
    unint64_t v9 = [v4 objectForKeyedSubscript:@"angularOffsetExponentialSmoothing"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[VISTextConsolidationConfig setAngular_offset_exponential_smoothing:](v5, "setAngular_offset_exponential_smoothing:");
    }
    float v10 = [v4 objectForKeyedSubscript:@"modelAspectRatio"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[VISTextConsolidationConfig setModel_aspect_ratio:](v5, "setModel_aspect_ratio:");
    }
    BOOL v11 = [v4 objectForKeyedSubscript:@"confidenceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      -[VISTextConsolidationConfig setConfidence_threshold:](v5, "setConfidence_threshold:");
    }
    double v12 = [v4 objectForKeyedSubscript:@"confidenceFilterRatio"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[VISTextConsolidationConfig setConfidence_filter_ratio:](v5, "setConfidence_filter_ratio:");
    }
    double v27 = v6;
    double v13 = objc_msgSend(v4, "objectForKeyedSubscript:", @"confidenceHysteresisValueLag", v12);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 floatValue];
      -[VISTextConsolidationConfig setConfidence_hysteresis_value_lag:](v5, "setConfidence_hysteresis_value_lag:");
    }
    double v26 = v7;
    long double v14 = [v4 objectForKeyedSubscript:@"confidenceHysteresisTemporalLagBeforeConfident"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      -[VISTextConsolidationConfig setConfidence_hysteresis_temporal_lag_before_confident:](v5, "setConfidence_hysteresis_temporal_lag_before_confident:");
    }
    BOOL v25 = v8;
    double v15 = [v4 objectForKeyedSubscript:@"confidenceHysteresisTemporalLagBeforeNotConfident"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[VISTextConsolidationConfig setConfidence_hysteresis_temporal_lag_before_not_confident:](v5, "setConfidence_hysteresis_temporal_lag_before_not_confident:");
    }
    unint64_t v23 = v11;
    float v24 = v9;
    unint64_t v16 = [v4 objectForKeyedSubscript:@"enableSmoothedTransformation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISTextConsolidationConfig setEnable_smoothed_transformation:](v5, "setEnable_smoothed_transformation:", [v16 BOOLValue]);
    }
    id v17 = v10;
    BOOL v18 = [v4 objectForKeyedSubscript:@"geoCostDepthThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 floatValue];
      -[VISTextConsolidationConfig setGeo_cost_depth_threshold:](v5, "setGeo_cost_depth_threshold:");
    }
    double v19 = [v4 objectForKeyedSubscript:@"worldPositionUpdateDistanceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v19 floatValue];
      -[VISTextConsolidationConfig setWorld_position_update_distance_threshold:](v5, "setWorld_position_update_distance_threshold:");
    }
    double v20 = v5;
  }
  return v5;
}

- (float)match_cost_threshold
{
  return self->_match_cost_threshold;
}

- (float)font_size_start_reporting_threshold
{
  return self->_font_size_start_reporting_threshold;
}

- (float)font_size_stop_reporting_threshold
{
  return self->_font_size_stop_reporting_threshold;
}

- (float)angular_offset_exponential_smoothing
{
  return self->_angular_offset_exponential_smoothing;
}

- (float)model_aspect_ratio
{
  return self->_model_aspect_ratio;
}

- (float)confidence_threshold
{
  return self->_confidence_threshold;
}

- (float)confidence_filter_ratio
{
  return self->_confidence_filter_ratio;
}

- (float)confidence_hysteresis_value_lag
{
  return self->_confidence_hysteresis_value_lag;
}

- (float)confidence_hysteresis_temporal_lag_before_confident
{
  return self->_confidence_hysteresis_temporal_lag_before_confident;
}

- (float)confidence_hysteresis_temporal_lag_before_not_confident
{
  return self->_confidence_hysteresis_temporal_lag_before_not_confident;
}

- (BOOL)enable_smoothed_transformation
{
  return self->_enable_smoothed_transformation;
}

- (float)geo_cost_depth_threshold
{
  return self->_geo_cost_depth_threshold;
}

- (float)world_position_update_distance_threshold
{
  return self->_world_position_update_distance_threshold;
}

@end