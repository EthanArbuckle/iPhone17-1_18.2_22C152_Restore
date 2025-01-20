@interface VISObjectConsolidationConfig
- (BOOL)enable_packaged_products;
- (BOOL)enable_text_from_object_detection;
- (BOOL)enable_visual_distance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (VISObjectConsolidationConfig)initWithDictionary:(id)a3;
- (VISObjectConsolidationConfig)initWithJSON:(id)a3;
- (float)adaptive_object_distance_threshold_ratio;
- (float)boundary_object_padding_threshold;
- (float)boundary_object_size_threshold;
- (float)depth_distance_threshold;
- (float)frame_object_iou_threshold;
- (float)label_prob_dist_threshold;
- (float)minimal_adaptive_object_distance_threshold;
- (float)nearest_object_distance_threshold;
- (float)nearest_object_iou_threshold;
- (float)normal_decay_rate;
- (float)object_distance_update_threshold;
- (float)object_iou_update_threshold;
- (float)pixel_distance_threshold;
- (float)reticle_padding;
- (float)sharpness_threshold;
- (float)tracked_decay_rate;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setAdaptive_object_distance_threshold_ratio:(float)a3;
- (void)setBoundary_object_padding_threshold:(float)a3;
- (void)setBoundary_object_size_threshold:(float)a3;
- (void)setDepth_distance_threshold:(float)a3;
- (void)setEnable_packaged_products:(BOOL)a3;
- (void)setEnable_text_from_object_detection:(BOOL)a3;
- (void)setEnable_visual_distance:(BOOL)a3;
- (void)setFrame_object_iou_threshold:(float)a3;
- (void)setLabel_prob_dist_threshold:(float)a3;
- (void)setMinimal_adaptive_object_distance_threshold:(float)a3;
- (void)setNearest_object_distance_threshold:(float)a3;
- (void)setNearest_object_iou_threshold:(float)a3;
- (void)setNormal_decay_rate:(float)a3;
- (void)setObject_distance_update_threshold:(float)a3;
- (void)setObject_iou_update_threshold:(float)a3;
- (void)setPixel_distance_threshold:(float)a3;
- (void)setReticle_padding:(float)a3;
- (void)setSharpness_threshold:(float)a3;
- (void)setTracked_decay_rate:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VISObjectConsolidationConfig

- (void)setFrame_object_iou_threshold:(float)a3
{
  self->_frame_object_iou_threshold = a3;
}

- (void)setEnable_packaged_products:(BOOL)a3
{
  self->_enable_packaged_products = a3;
}

- (void)setEnable_text_from_object_detection:(BOOL)a3
{
  self->_enable_text_from_object_detection = a3;
}

- (void)setNearest_object_distance_threshold:(float)a3
{
  self->_nearest_object_distance_threshold = a3;
}

- (void)setObject_distance_update_threshold:(float)a3
{
  self->_object_distance_update_threshold = a3;
}

- (void)setAdaptive_object_distance_threshold_ratio:(float)a3
{
  self->_adaptive_object_distance_threshold_ratio = a3;
}

- (void)setMinimal_adaptive_object_distance_threshold:(float)a3
{
  self->_minimal_adaptive_object_distance_threshold = a3;
}

- (void)setNearest_object_iou_threshold:(float)a3
{
  self->_nearest_object_iou_threshold = a3;
}

- (void)setObject_iou_update_threshold:(float)a3
{
  self->_object_iou_update_threshold = a3;
}

- (void)setLabel_prob_dist_threshold:(float)a3
{
  self->_label_prob_dist_threshold = a3;
}

- (void)setSharpness_threshold:(float)a3
{
  self->_sharpness_threshold = a3;
}

- (void)setEnable_visual_distance:(BOOL)a3
{
  self->_enable_visual_distance = a3;
}

- (void)setTracked_decay_rate:(float)a3
{
  self->_tracked_decay_rate = a3;
}

- (void)setBoundary_object_padding_threshold:(float)a3
{
  self->_boundary_object_padding_threshold = a3;
}

- (void)setBoundary_object_size_threshold:(float)a3
{
  self->_boundary_object_size_threshold = a3;
}

- (void)setNormal_decay_rate:(float)a3
{
  self->_normal_decay_rate = a3;
}

- (void)setDepth_distance_threshold:(float)a3
{
  self->_depth_distance_threshold = a3;
}

- (void)setReticle_padding:(float)a3
{
  self->_reticle_padding = a3;
}

- (void)setPixel_distance_threshold:(float)a3
{
  self->_pixel_distance_threshold = a3;
}

- (BOOL)readFrom:(id)a3
{
  return VISObjectConsolidationConfigReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v21 = a3;
  [(VISObjectConsolidationConfig *)self frame_object_iou_threshold];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(VISObjectConsolidationConfig *)self enable_packaged_products]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(VISObjectConsolidationConfig *)self enable_text_from_object_detection]) {
    PBDataWriterWriteBOOLField();
  }
  [(VISObjectConsolidationConfig *)self nearest_object_distance_threshold];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self object_distance_update_threshold];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self adaptive_object_distance_threshold_ratio];
  if (v7 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self minimal_adaptive_object_distance_threshold];
  if (v8 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self nearest_object_iou_threshold];
  if (v9 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self object_iou_update_threshold];
  if (v10 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self label_prob_dist_threshold];
  if (v11 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self sharpness_threshold];
  if (v12 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(VISObjectConsolidationConfig *)self enable_visual_distance]) {
    PBDataWriterWriteBOOLField();
  }
  [(VISObjectConsolidationConfig *)self tracked_decay_rate];
  if (v13 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self boundary_object_padding_threshold];
  if (v14 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self boundary_object_size_threshold];
  if (v15 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self normal_decay_rate];
  if (v16 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self depth_distance_threshold];
  if (v17 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self reticle_padding];
  if (v18 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISObjectConsolidationConfig *)self pixel_distance_threshold];
  v19 = v21;
  if (v20 != 0.0)
  {
    PBDataWriterWriteFloatField();
    v19 = v21;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  float frame_object_iou_threshold = self->_frame_object_iou_threshold;
  objc_msgSend(v4, "frame_object_iou_threshold");
  if (frame_object_iou_threshold != v6) {
    goto LABEL_20;
  }
  int enable_packaged_products = self->_enable_packaged_products;
  if (enable_packaged_products != objc_msgSend(v4, "enable_packaged_products")) {
    goto LABEL_20;
  }
  int enable_text_from_object_detection = self->_enable_text_from_object_detection;
  if (enable_text_from_object_detection != objc_msgSend(v4, "enable_text_from_object_detection")) {
    goto LABEL_20;
  }
  float nearest_object_distance_threshold = self->_nearest_object_distance_threshold;
  objc_msgSend(v4, "nearest_object_distance_threshold");
  if (nearest_object_distance_threshold != v10) {
    goto LABEL_20;
  }
  float object_distance_update_threshold = self->_object_distance_update_threshold;
  objc_msgSend(v4, "object_distance_update_threshold");
  if (object_distance_update_threshold != v12) {
    goto LABEL_20;
  }
  float adaptive_object_distance_threshold_ratio = self->_adaptive_object_distance_threshold_ratio;
  objc_msgSend(v4, "adaptive_object_distance_threshold_ratio");
  if (adaptive_object_distance_threshold_ratio != v14) {
    goto LABEL_20;
  }
  float minimal_adaptive_object_distance_threshold = self->_minimal_adaptive_object_distance_threshold;
  objc_msgSend(v4, "minimal_adaptive_object_distance_threshold");
  if (minimal_adaptive_object_distance_threshold != v16) {
    goto LABEL_20;
  }
  float nearest_object_iou_threshold = self->_nearest_object_iou_threshold;
  objc_msgSend(v4, "nearest_object_iou_threshold");
  if (nearest_object_iou_threshold != v18) {
    goto LABEL_20;
  }
  float object_iou_update_threshold = self->_object_iou_update_threshold;
  objc_msgSend(v4, "object_iou_update_threshold");
  if (object_iou_update_threshold != v20) {
    goto LABEL_20;
  }
  float label_prob_dist_threshold = self->_label_prob_dist_threshold;
  objc_msgSend(v4, "label_prob_dist_threshold");
  if (label_prob_dist_threshold != v22) {
    goto LABEL_20;
  }
  float sharpness_threshold = self->_sharpness_threshold;
  objc_msgSend(v4, "sharpness_threshold");
  if (sharpness_threshold != v24) {
    goto LABEL_20;
  }
  int enable_visual_distance = self->_enable_visual_distance;
  if (enable_visual_distance != objc_msgSend(v4, "enable_visual_distance")) {
    goto LABEL_20;
  }
  float tracked_decay_rate = self->_tracked_decay_rate;
  objc_msgSend(v4, "tracked_decay_rate");
  if (tracked_decay_rate != v27) {
    goto LABEL_20;
  }
  float boundary_object_padding_threshold = self->_boundary_object_padding_threshold;
  objc_msgSend(v4, "boundary_object_padding_threshold");
  if (boundary_object_padding_threshold != v29) {
    goto LABEL_20;
  }
  float boundary_object_size_threshold = self->_boundary_object_size_threshold;
  objc_msgSend(v4, "boundary_object_size_threshold");
  if (boundary_object_size_threshold != v31) {
    goto LABEL_20;
  }
  float normal_decay_rate = self->_normal_decay_rate;
  objc_msgSend(v4, "normal_decay_rate");
  if (normal_decay_rate == v33
    && (float depth_distance_threshold = self->_depth_distance_threshold,
        objc_msgSend(v4, "depth_distance_threshold"),
        depth_distance_threshold == v35)
    && (float reticle_padding = self->_reticle_padding, objc_msgSend(v4, "reticle_padding"), reticle_padding == v37))
  {
    float pixel_distance_threshold = self->_pixel_distance_threshold;
    objc_msgSend(v4, "pixel_distance_threshold");
    BOOL v38 = pixel_distance_threshold == v41;
  }
  else
  {
LABEL_20:
    BOOL v38 = 0;
  }

  return v38;
}

- (unint64_t)hash
{
  float frame_object_iou_threshold = self->_frame_object_iou_threshold;
  BOOL v4 = frame_object_iou_threshold < 0.0;
  if (frame_object_iou_threshold == 0.0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    double v5 = frame_object_iou_threshold;
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
  BOOL enable_text_from_object_detection = self->_enable_text_from_object_detection;
  BOOL enable_packaged_products = self->_enable_packaged_products;
  float nearest_object_distance_threshold = self->_nearest_object_distance_threshold;
  BOOL v11 = nearest_object_distance_threshold < 0.0;
  if (nearest_object_distance_threshold == 0.0)
  {
    unint64_t v16 = 0;
  }
  else
  {
    double v12 = nearest_object_distance_threshold;
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
  float object_distance_update_threshold = self->_object_distance_update_threshold;
  BOOL v18 = object_distance_update_threshold < 0.0;
  if (object_distance_update_threshold == 0.0)
  {
    unint64_t v23 = 0;
  }
  else
  {
    double v19 = object_distance_update_threshold;
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
  float adaptive_object_distance_threshold_ratio = self->_adaptive_object_distance_threshold_ratio;
  BOOL v25 = adaptive_object_distance_threshold_ratio < 0.0;
  if (adaptive_object_distance_threshold_ratio == 0.0)
  {
    unint64_t v30 = 0;
  }
  else
  {
    double v26 = adaptive_object_distance_threshold_ratio;
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
  float minimal_adaptive_object_distance_threshold = self->_minimal_adaptive_object_distance_threshold;
  BOOL v32 = minimal_adaptive_object_distance_threshold < 0.0;
  if (minimal_adaptive_object_distance_threshold == 0.0)
  {
    unint64_t v37 = 0;
  }
  else
  {
    double v33 = minimal_adaptive_object_distance_threshold;
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
  float nearest_object_iou_threshold = self->_nearest_object_iou_threshold;
  BOOL v39 = nearest_object_iou_threshold < 0.0;
  if (nearest_object_iou_threshold == 0.0)
  {
    unint64_t v44 = 0;
  }
  else
  {
    double v40 = nearest_object_iou_threshold;
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
  float object_iou_update_threshold = self->_object_iou_update_threshold;
  BOOL v46 = object_iou_update_threshold < 0.0;
  if (object_iou_update_threshold == 0.0)
  {
    unint64_t v51 = 0;
  }
  else
  {
    double v47 = object_iou_update_threshold;
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
  float label_prob_dist_threshold = self->_label_prob_dist_threshold;
  BOOL v53 = label_prob_dist_threshold < 0.0;
  if (label_prob_dist_threshold == 0.0)
  {
    unint64_t v58 = 0;
  }
  else
  {
    double v54 = label_prob_dist_threshold;
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
  float sharpness_threshold = self->_sharpness_threshold;
  BOOL v60 = sharpness_threshold < 0.0;
  unint64_t v138 = v9;
  if (sharpness_threshold == 0.0)
  {
    unint64_t v142 = 0;
    goto LABEL_74;
  }
  double v61 = sharpness_threshold;
  double v62 = -v61;
  if (!v60) {
    double v62 = v61;
  }
  long double v63 = floor(v62 + 0.5);
  double v64 = (v62 - v63) * 1.84467441e19;
  double v65 = fmod(v63, 1.84467441e19);
  if (v64 >= 0.0)
  {
    unint64_t v142 = 2654435761u * (unint64_t)v65;
    if (v64 <= 0.0) {
      goto LABEL_74;
    }
    unint64_t v66 = v142 + (unint64_t)v64;
  }
  else
  {
    unint64_t v66 = 2654435761u * (unint64_t)v65 - (unint64_t)fabs(v64);
  }
  unint64_t v142 = v66;
LABEL_74:
  BOOL enable_visual_distance = self->_enable_visual_distance;
  float tracked_decay_rate = self->_tracked_decay_rate;
  BOOL v68 = tracked_decay_rate < 0.0;
  if (tracked_decay_rate == 0.0)
  {
    unint64_t v141 = 0;
    goto LABEL_83;
  }
  double v69 = tracked_decay_rate;
  double v70 = -v69;
  if (!v68) {
    double v70 = v69;
  }
  long double v71 = floor(v70 + 0.5);
  double v72 = (v70 - v71) * 1.84467441e19;
  double v73 = fmod(v71, 1.84467441e19);
  if (v72 >= 0.0)
  {
    unint64_t v141 = 2654435761u * (unint64_t)v73;
    if (v72 <= 0.0) {
      goto LABEL_83;
    }
    unint64_t v74 = v141 + (unint64_t)v72;
  }
  else
  {
    unint64_t v74 = 2654435761u * (unint64_t)v73 - (unint64_t)fabs(v72);
  }
  unint64_t v141 = v74;
LABEL_83:
  float boundary_object_padding_threshold = self->_boundary_object_padding_threshold;
  BOOL v76 = boundary_object_padding_threshold < 0.0;
  if (boundary_object_padding_threshold == 0.0)
  {
    unint64_t v140 = 0;
    goto LABEL_92;
  }
  double v77 = boundary_object_padding_threshold;
  double v78 = -v77;
  if (!v76) {
    double v78 = v77;
  }
  long double v79 = floor(v78 + 0.5);
  double v80 = (v78 - v79) * 1.84467441e19;
  double v81 = fmod(v79, 1.84467441e19);
  if (v80 >= 0.0)
  {
    unint64_t v140 = 2654435761u * (unint64_t)v81;
    if (v80 <= 0.0) {
      goto LABEL_92;
    }
    unint64_t v82 = v140 + (unint64_t)v80;
  }
  else
  {
    unint64_t v82 = 2654435761u * (unint64_t)v81 - (unint64_t)fabs(v80);
  }
  unint64_t v140 = v82;
LABEL_92:
  float boundary_object_size_threshold = self->_boundary_object_size_threshold;
  BOOL v84 = boundary_object_size_threshold < 0.0;
  if (boundary_object_size_threshold == 0.0)
  {
    unint64_t v139 = 0;
    goto LABEL_101;
  }
  double v85 = boundary_object_size_threshold;
  double v86 = -v85;
  if (!v84) {
    double v86 = v85;
  }
  long double v87 = floor(v86 + 0.5);
  double v88 = (v86 - v87) * 1.84467441e19;
  double v89 = fmod(v87, 1.84467441e19);
  if (v88 >= 0.0)
  {
    unint64_t v139 = 2654435761u * (unint64_t)v89;
    if (v88 <= 0.0) {
      goto LABEL_101;
    }
    unint64_t v90 = v139 + (unint64_t)v88;
  }
  else
  {
    unint64_t v90 = 2654435761u * (unint64_t)v89 - (unint64_t)fabs(v88);
  }
  unint64_t v139 = v90;
LABEL_101:
  float normal_decay_rate = self->_normal_decay_rate;
  BOOL v92 = normal_decay_rate < 0.0;
  unint64_t v137 = v58;
  if (normal_decay_rate == 0.0)
  {
    unint64_t v97 = 0;
  }
  else
  {
    double v93 = normal_decay_rate;
    double v94 = -v93;
    if (!v92) {
      double v94 = v93;
    }
    long double v95 = floor(v94 + 0.5);
    double v96 = (v94 - v95) * 1.84467441e19;
    unint64_t v97 = 2654435761u * (unint64_t)fmod(v95, 1.84467441e19);
    if (v96 >= 0.0)
    {
      if (v96 > 0.0) {
        v97 += (unint64_t)v96;
      }
    }
    else
    {
      v97 -= (unint64_t)fabs(v96);
    }
  }
  float depth_distance_threshold = self->_depth_distance_threshold;
  BOOL v99 = depth_distance_threshold < 0.0;
  if (depth_distance_threshold == 0.0)
  {
    unint64_t v100 = v37;
    unint64_t v101 = v30;
    unint64_t v106 = 0;
  }
  else
  {
    unint64_t v100 = v37;
    unint64_t v101 = v30;
    double v102 = depth_distance_threshold;
    double v103 = -v102;
    if (!v99) {
      double v103 = v102;
    }
    long double v104 = floor(v103 + 0.5);
    double v105 = (v103 - v104) * 1.84467441e19;
    unint64_t v106 = 2654435761u * (unint64_t)fmod(v104, 1.84467441e19);
    if (v105 >= 0.0)
    {
      if (v105 > 0.0) {
        v106 += (unint64_t)v105;
      }
    }
    else
    {
      v106 -= (unint64_t)fabs(v105);
    }
  }
  float reticle_padding = self->_reticle_padding;
  unint64_t v108 = v23;
  unint64_t v109 = v16;
  BOOL v110 = reticle_padding < 0.0;
  if (reticle_padding == 0.0)
  {
    unint64_t v115 = 0;
  }
  else
  {
    double v111 = reticle_padding;
    double v112 = -v111;
    if (!v110) {
      double v112 = v111;
    }
    long double v113 = floor(v112 + 0.5);
    double v114 = (v112 - v113) * 1.84467441e19;
    unint64_t v115 = 2654435761u * (unint64_t)fmod(v113, 1.84467441e19);
    if (v114 >= 0.0)
    {
      if (v114 > 0.0) {
        v115 += (unint64_t)v114;
      }
    }
    else
    {
      v115 -= (unint64_t)fabs(v114);
    }
  }
  float pixel_distance_threshold = self->_pixel_distance_threshold;
  BOOL v117 = pixel_distance_threshold < 0.0;
  if (pixel_distance_threshold == 0.0)
  {
    unint64_t v122 = 0;
    goto LABEL_131;
  }
  double v118 = pixel_distance_threshold;
  double v119 = -v118;
  if (!v117) {
    double v119 = v118;
  }
  long double v120 = floor(v119 + 0.5);
  double v121 = (v119 - v120) * 1.84467441e19;
  unint64_t v122 = 2654435761u * (unint64_t)fmod(v120, 1.84467441e19);
  if (v121 < 0.0)
  {
    v122 -= (unint64_t)fabs(v121);
LABEL_131:
    BOOL v123 = enable_text_from_object_detection;
    BOOL v124 = enable_packaged_products;
    unint64_t v126 = v141;
    unint64_t v125 = v142;
    BOOL v127 = enable_visual_distance;
    unint64_t v129 = v139;
    unint64_t v128 = v140;
    goto LABEL_132;
  }
  BOOL v123 = enable_text_from_object_detection;
  BOOL v124 = enable_packaged_products;
  unint64_t v126 = v141;
  unint64_t v125 = v142;
  BOOL v127 = enable_visual_distance;
  unint64_t v129 = v139;
  unint64_t v128 = v140;
  if (v121 > 0.0) {
    v122 += (unint64_t)v121;
  }
LABEL_132:
  if (v127) {
    uint64_t v130 = 2654435761;
  }
  else {
    uint64_t v130 = 0;
  }
  if (v123) {
    uint64_t v131 = 2654435761;
  }
  else {
    uint64_t v131 = 0;
  }
  if (v124) {
    uint64_t v132 = 2654435761;
  }
  else {
    uint64_t v132 = 0;
  }
  return v132 ^ v138 ^ v131 ^ v109 ^ v108 ^ v101 ^ v100 ^ v44 ^ v51 ^ v137 ^ v125 ^ v130 ^ v126 ^ v128 ^ v129 ^ v97 ^ v106 ^ v115 ^ v122;
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_adaptive_object_distance_threshold_ratio != 0.0)
  {
    BOOL v4 = NSNumber;
    [(VISObjectConsolidationConfig *)self adaptive_object_distance_threshold_ratio];
    double v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"adaptiveObjectDistanceThresholdRatio"];
  }
  if (self->_boundary_object_padding_threshold != 0.0)
  {
    double v6 = NSNumber;
    [(VISObjectConsolidationConfig *)self boundary_object_padding_threshold];
    long double v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"boundaryObjectPaddingThreshold"];
  }
  if (self->_boundary_object_size_threshold != 0.0)
  {
    double v8 = NSNumber;
    [(VISObjectConsolidationConfig *)self boundary_object_size_threshold];
    unint64_t v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"boundaryObjectSizeThreshold"];
  }
  if (self->_depth_distance_threshold != 0.0)
  {
    float v10 = NSNumber;
    [(VISObjectConsolidationConfig *)self depth_distance_threshold];
    BOOL v11 = objc_msgSend(v10, "numberWithFloat:");
    [v3 setObject:v11 forKeyedSubscript:@"depthDistanceThreshold"];
  }
  if (self->_enable_packaged_products)
  {
    double v12 = objc_msgSend(NSNumber, "numberWithBool:", -[VISObjectConsolidationConfig enable_packaged_products](self, "enable_packaged_products"));
    [v3 setObject:v12 forKeyedSubscript:@"enablePackagedProducts"];
  }
  if (self->_enable_text_from_object_detection)
  {
    double v13 = objc_msgSend(NSNumber, "numberWithBool:", -[VISObjectConsolidationConfig enable_text_from_object_detection](self, "enable_text_from_object_detection"));
    [v3 setObject:v13 forKeyedSubscript:@"enableTextFromObjectDetection"];
  }
  if (self->_enable_visual_distance)
  {
    long double v14 = objc_msgSend(NSNumber, "numberWithBool:", -[VISObjectConsolidationConfig enable_visual_distance](self, "enable_visual_distance"));
    [v3 setObject:v14 forKeyedSubscript:@"enableVisualDistance"];
  }
  if (self->_frame_object_iou_threshold != 0.0)
  {
    double v15 = NSNumber;
    [(VISObjectConsolidationConfig *)self frame_object_iou_threshold];
    unint64_t v16 = objc_msgSend(v15, "numberWithFloat:");
    [v3 setObject:v16 forKeyedSubscript:@"frameObjectIouThreshold"];
  }
  if (self->_label_prob_dist_threshold != 0.0)
  {
    float v17 = NSNumber;
    [(VISObjectConsolidationConfig *)self label_prob_dist_threshold];
    BOOL v18 = objc_msgSend(v17, "numberWithFloat:");
    [v3 setObject:v18 forKeyedSubscript:@"labelProbDistThreshold"];
  }
  if (self->_minimal_adaptive_object_distance_threshold != 0.0)
  {
    double v19 = NSNumber;
    [(VISObjectConsolidationConfig *)self minimal_adaptive_object_distance_threshold];
    double v20 = objc_msgSend(v19, "numberWithFloat:");
    [v3 setObject:v20 forKeyedSubscript:@"minimalAdaptiveObjectDistanceThreshold"];
  }
  if (self->_nearest_object_distance_threshold != 0.0)
  {
    long double v21 = NSNumber;
    [(VISObjectConsolidationConfig *)self nearest_object_distance_threshold];
    double v22 = objc_msgSend(v21, "numberWithFloat:");
    [v3 setObject:v22 forKeyedSubscript:@"nearestObjectDistanceThreshold"];
  }
  if (self->_nearest_object_iou_threshold != 0.0)
  {
    unint64_t v23 = NSNumber;
    [(VISObjectConsolidationConfig *)self nearest_object_iou_threshold];
    float v24 = objc_msgSend(v23, "numberWithFloat:");
    [v3 setObject:v24 forKeyedSubscript:@"nearestObjectIouThreshold"];
  }
  if (self->_normal_decay_rate != 0.0)
  {
    BOOL v25 = NSNumber;
    [(VISObjectConsolidationConfig *)self normal_decay_rate];
    double v26 = objc_msgSend(v25, "numberWithFloat:");
    [v3 setObject:v26 forKeyedSubscript:@"normalDecayRate"];
  }
  if (self->_object_distance_update_threshold != 0.0)
  {
    double v27 = NSNumber;
    [(VISObjectConsolidationConfig *)self object_distance_update_threshold];
    long double v28 = objc_msgSend(v27, "numberWithFloat:");
    [v3 setObject:v28 forKeyedSubscript:@"objectDistanceUpdateThreshold"];
  }
  if (self->_object_iou_update_threshold != 0.0)
  {
    double v29 = NSNumber;
    [(VISObjectConsolidationConfig *)self object_iou_update_threshold];
    unint64_t v30 = objc_msgSend(v29, "numberWithFloat:");
    [v3 setObject:v30 forKeyedSubscript:@"objectIouUpdateThreshold"];
  }
  if (self->_pixel_distance_threshold != 0.0)
  {
    float v31 = NSNumber;
    [(VISObjectConsolidationConfig *)self pixel_distance_threshold];
    BOOL v32 = objc_msgSend(v31, "numberWithFloat:");
    [v3 setObject:v32 forKeyedSubscript:@"pixelDistanceThreshold"];
  }
  if (self->_reticle_padding != 0.0)
  {
    double v33 = NSNumber;
    [(VISObjectConsolidationConfig *)self reticle_padding];
    double v34 = objc_msgSend(v33, "numberWithFloat:");
    [v3 setObject:v34 forKeyedSubscript:@"reticlePadding"];
  }
  if (self->_sharpness_threshold != 0.0)
  {
    long double v35 = NSNumber;
    [(VISObjectConsolidationConfig *)self sharpness_threshold];
    double v36 = objc_msgSend(v35, "numberWithFloat:");
    [v3 setObject:v36 forKeyedSubscript:@"sharpnessThreshold"];
  }
  if (self->_tracked_decay_rate != 0.0)
  {
    unint64_t v37 = NSNumber;
    [(VISObjectConsolidationConfig *)self tracked_decay_rate];
    BOOL v38 = objc_msgSend(v37, "numberWithFloat:");
    [v3 setObject:v38 forKeyedSubscript:@"trackedDecayRate"];
  }
  return v3;
}

- (NSData)jsonData
{
  v2 = [(VISObjectConsolidationConfig *)self dictionaryRepresentation];
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

- (VISObjectConsolidationConfig)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  BOOL v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = 0;
  }
  else
  {
    self = [(VISObjectConsolidationConfig *)self initWithDictionary:v4];
    double v5 = self;
  }

  return v5;
}

- (VISObjectConsolidationConfig)initWithDictionary:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)VISObjectConsolidationConfig;
  double v5 = [(VISObjectConsolidationConfig *)&v44 init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"frameObjectIouThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[VISObjectConsolidationConfig setFrame_object_iou_threshold:](v5, "setFrame_object_iou_threshold:");
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"enablePackagedProducts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISObjectConsolidationConfig setEnable_packaged_products:](v5, "setEnable_packaged_products:", [v7 BOOLValue]);
    }
    double v8 = [v4 objectForKeyedSubscript:@"enableTextFromObjectDetection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[VISObjectConsolidationConfig setEnable_text_from_object_detection:](v5, "setEnable_text_from_object_detection:", [v8 BOOLValue]);
    }
    double v33 = v8;
    unint64_t v9 = [v4 objectForKeyedSubscript:@"nearestObjectDistanceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[VISObjectConsolidationConfig setNearest_object_distance_threshold:](v5, "setNearest_object_distance_threshold:");
    }
    unint64_t v37 = v9;
    float v10 = [v4 objectForKeyedSubscript:@"objectDistanceUpdateThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[VISObjectConsolidationConfig setObject_distance_update_threshold:](v5, "setObject_distance_update_threshold:");
    }
    BOOL v11 = v7;
    double v12 = [v4 objectForKeyedSubscript:@"adaptiveObjectDistanceThresholdRatio"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[VISObjectConsolidationConfig setAdaptive_object_distance_threshold_ratio:](v5, "setAdaptive_object_distance_threshold_ratio:");
    }
    double v13 = v6;
    long double v14 = [v4 objectForKeyedSubscript:@"minimalAdaptiveObjectDistanceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      -[VISObjectConsolidationConfig setMinimal_adaptive_object_distance_threshold:](v5, "setMinimal_adaptive_object_distance_threshold:");
    }
    double v15 = [v4 objectForKeyedSubscript:@"nearestObjectIouThreshold"];
    objc_opt_class();
    double v43 = v15;
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[VISObjectConsolidationConfig setNearest_object_iou_threshold:](v5, "setNearest_object_iou_threshold:");
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"objectIouUpdateThreshold"];
    objc_opt_class();
    long double v42 = (void *)v16;
    float v17 = v13;
    if (objc_opt_isKindOfClass())
    {
      [v42 floatValue];
      -[VISObjectConsolidationConfig setObject_iou_update_threshold:](v5, "setObject_iou_update_threshold:");
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"labelProbDistThreshold"];
    objc_opt_class();
    double v41 = (void *)v18;
    double v19 = v11;
    if (objc_opt_isKindOfClass())
    {
      [v41 floatValue];
      -[VISObjectConsolidationConfig setLabel_prob_dist_threshold:](v5, "setLabel_prob_dist_threshold:");
    }
    double v20 = [v4 objectForKeyedSubscript:@"sharpnessThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v20 floatValue];
      -[VISObjectConsolidationConfig setSharpness_threshold:](v5, "setSharpness_threshold:");
    }
    long double v21 = [v4 objectForKeyedSubscript:@"enableVisualDistance"];
    objc_opt_class();
    double v40 = v21;
    if (objc_opt_isKindOfClass()) {
      -[VISObjectConsolidationConfig setEnable_visual_distance:](v5, "setEnable_visual_distance:", [v21 BOOLValue]);
    }
    double v36 = v10;
    double v22 = [v4 objectForKeyedSubscript:@"trackedDecayRate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v22 floatValue];
      -[VISObjectConsolidationConfig setTracked_decay_rate:](v5, "setTracked_decay_rate:");
    }
    long double v35 = v12;
    unint64_t v23 = [v4 objectForKeyedSubscript:@"boundaryObjectPaddingThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v23 floatValue];
      -[VISObjectConsolidationConfig setBoundary_object_padding_threshold:](v5, "setBoundary_object_padding_threshold:");
    }
    double v34 = v14;
    float v24 = [v4 objectForKeyedSubscript:@"boundaryObjectSizeThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v24 floatValue];
      -[VISObjectConsolidationConfig setBoundary_object_size_threshold:](v5, "setBoundary_object_size_threshold:");
    }
    BOOL v39 = v17;
    BOOL v25 = [v4 objectForKeyedSubscript:@"normalDecayRate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v25 floatValue];
      -[VISObjectConsolidationConfig setNormal_decay_rate:](v5, "setNormal_decay_rate:");
    }
    BOOL v38 = v19;
    double v26 = objc_msgSend(v4, "objectForKeyedSubscript:", @"depthDistanceThreshold", v22);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v26 floatValue];
      -[VISObjectConsolidationConfig setDepth_distance_threshold:](v5, "setDepth_distance_threshold:");
    }
    double v27 = v20;
    long double v28 = [v4 objectForKeyedSubscript:@"reticlePadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v28 floatValue];
      -[VISObjectConsolidationConfig setReticle_padding:](v5, "setReticle_padding:");
    }
    double v29 = [v4 objectForKeyedSubscript:@"pixelDistanceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v29 floatValue];
      -[VISObjectConsolidationConfig setPixel_distance_threshold:](v5, "setPixel_distance_threshold:");
    }
    unint64_t v30 = v5;
  }
  return v5;
}

- (float)frame_object_iou_threshold
{
  return self->_frame_object_iou_threshold;
}

- (BOOL)enable_packaged_products
{
  return self->_enable_packaged_products;
}

- (BOOL)enable_text_from_object_detection
{
  return self->_enable_text_from_object_detection;
}

- (float)nearest_object_distance_threshold
{
  return self->_nearest_object_distance_threshold;
}

- (float)object_distance_update_threshold
{
  return self->_object_distance_update_threshold;
}

- (float)adaptive_object_distance_threshold_ratio
{
  return self->_adaptive_object_distance_threshold_ratio;
}

- (float)minimal_adaptive_object_distance_threshold
{
  return self->_minimal_adaptive_object_distance_threshold;
}

- (float)nearest_object_iou_threshold
{
  return self->_nearest_object_iou_threshold;
}

- (float)object_iou_update_threshold
{
  return self->_object_iou_update_threshold;
}

- (float)label_prob_dist_threshold
{
  return self->_label_prob_dist_threshold;
}

- (float)sharpness_threshold
{
  return self->_sharpness_threshold;
}

- (BOOL)enable_visual_distance
{
  return self->_enable_visual_distance;
}

- (float)tracked_decay_rate
{
  return self->_tracked_decay_rate;
}

- (float)boundary_object_padding_threshold
{
  return self->_boundary_object_padding_threshold;
}

- (float)boundary_object_size_threshold
{
  return self->_boundary_object_size_threshold;
}

- (float)normal_decay_rate
{
  return self->_normal_decay_rate;
}

- (float)depth_distance_threshold
{
  return self->_depth_distance_threshold;
}

- (float)reticle_padding
{
  return self->_reticle_padding;
}

- (float)pixel_distance_threshold
{
  return self->_pixel_distance_threshold;
}

@end