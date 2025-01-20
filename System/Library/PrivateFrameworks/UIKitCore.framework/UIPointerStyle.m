@interface UIPointerStyle
+ (UIPointerStyle)hiddenPointerStyle;
+ (UIPointerStyle)styleWithEffect:(UIPointerEffect *)effect shape:(UIPointerShape *)shape;
+ (UIPointerStyle)styleWithShape:(UIPointerShape *)shape constrainedAxes:(UIAxis)axes;
+ (UIPointerStyle)systemPointerStyle;
+ (id)_makeStyleWithHoverStyle:(id)a3 view:(id)a4 convertAutomatic:(BOOL)a5;
- (BOOL)_suppressesMirroring;
- (BOOL)canTransitionInPlaceToEffectWithDescriptor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)pointerMergesWithContent;
- (BOOL)pointerUnderlapsContent;
- (CGPoint)_contentSlipFactor;
- (CGPoint)_contentSlipMappedToRegionSize:(CGSize)a3;
- (CGPoint)_pointerSlipFactor;
- (CGPoint)_pointerSlipMappedToRegionSize:(CGSize)a3;
- (NSArray)accessories;
- (NSArray)compatibleDescriptors;
- (NSString)description;
- (UIPointerEffect)pointerEffect;
- (UIPointerShape)pointerShape;
- (UITargetedPreview)targetedPreview;
- (double)_pointerIntensityForMaterialLuminance:(unint64_t)a3;
- (double)contentScale;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)constrainedAxes;
- (unint64_t)hash;
- (unint64_t)options;
- (void)_adaptForNonSystemEffectSupportingEnvironment;
- (void)setAccessories:(NSArray *)accessories;
- (void)setConstrainedAxes:(unint64_t)a3;
- (void)setEffect:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPointerEffect:(id)a3;
- (void)setPointerShape:(id)a3;
- (void)setType:(int64_t)a3;
- (void)set_suppressesMirroring:(BOOL)a3;
@end

@implementation UIPointerStyle

+ (id)_makeStyleWithHoverStyle:(id)a3 view:(id)a4 convertAutomatic:(BOOL)a5
{
  sub_185ADA6D4();
  v7 = (char *)a3 + OBJC_IVAR___UIHoverStyle__effect;
  swift_beginAccess();
  sub_1854B1F38((uint64_t)v7, (uint64_t)v21);
  v8 = *(void **)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 8);
  v9 = *(void **)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 16);
  v10 = *(void **)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 24);
  v11 = *(void **)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 32);
  v12 = *(void **)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 40);
  v13 = *(void **)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 48);
  char v14 = *((unsigned char *)a3 + OBJC_IVAR___UIHoverStyle__shape + 56);
  v19[0] = *(id *)((char *)a3 + OBJC_IVAR___UIHoverStyle__shape);
  v19[1] = v8;
  v19[2] = v9;
  v19[3] = v10;
  v19[4] = v11;
  v19[5] = v12;
  v19[6] = v13;
  char v20 = v14;
  id v15 = a4;
  sub_185638750(v19[0], (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, v14);
  id v16 = sub_185AEC764(v21, (uint64_t)v19, v15, a5);
  return v16;
}

+ (UIPointerStyle)styleWithEffect:(UIPointerEffect *)effect shape:(UIPointerShape *)shape
{
  v5 = effect;
  v6 = shape;
  v7 = [(UIPointerEffect *)v5 preview];
  if (![(UIPointerEffect *)v5 allowsSanitization])
  {
    BOOL v11 = 0;
    goto LABEL_38;
  }
  v8 = v5;
  v9 = v6;
  v10 = v8;
  if (+[_UIPointerAccessibilityEffect shouldApplyAccessibilityEffect])
  {
    v5 = +[_UIPointerAccessibilityEffect _effectWithInputEffect:v10];
    BOOL v11 = 0;
    v12 = (UIPointerShape *)v10;
LABEL_36:

    goto LABEL_37;
  }
  if (([(UIPointerEffect *)v10 options] & 0x100) != 0)
  {
    v12 = [(UIPointerEffect *)v10 preview];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    if (v9) {
      id v15 = v9;
    }
    else {
      id v15 = v12;
    }
    [(UIPointerShape *)v15 size];
    *(void *)&double v18 = _UISizeRespectingTransformsFromPreview(v12, v16, v17).n128_u64[0];
    double v20 = v19;
    v21 = +[_UIPointerSettingsDomain rootSettings];
    v22 = [v21 sizeRuleSettings];

    [v22 explicitRequestMultiplier];
    double v24 = v23;
    [v22 genericSizeRuleThreshold];
    double v26 = v25;
    [v22 narrowAspectRuleMinorDimensionThreshold];
    double v28 = v27;
    [v22 narrowAspectRuleMajorDimensionThreshold];
    double v30 = v29;
    [v22 pointerSizeRuleMinorDimensionThreshold];
    double v32 = v31;
    [v22 pointerSizeRuleMajorDimensionThreshold];
    double v34 = 1.0;
    if (v13 != v14) {
      double v34 = v24;
    }
    double v35 = v34 * v30;
    if (v18 <= v28 && v20 <= v35 || (v20 > v26 * v34 ? (BOOL v36 = 1) : (BOOL v36 = v18 > v26 * v34), v20 <= v28 && v18 <= v35)) {
      BOOL v36 = 0;
    }
    double v37 = v34 * v33;
    if ((v18 > v32 || v20 > v37) && (v20 > v32 || v18 > v37))
    {

      if (v36)
      {
        v5 = +[UIPointerEffect effectWithPreview:v12];
        [(UIPointerEffect *)v5 setPrefersShadow:([(UIPointerEffect *)v10 options] >> 4) & 1];
        [(UIPointerEffect *)v5 set_tintViewTakesOnPointerShape:1];
        BOOL v11 = ([(UIPointerEffect *)v10 options] & 0x20) == 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
    }
    if (v13 != v14)
    {
      BOOL v11 = 0;
      v5 = v10;
      goto LABEL_36;
    }
    v38 = v12;
    v39 = [(UIPointerShape *)v38 parameters];
    v40 = [v39 visiblePath];

    if (v40)
    {
    }
    else
    {
      v41 = [(UIPointerShape *)v38 view];
      v42 = [v41 backgroundColor];
      int v43 = [v42 _isOpaque];

      if (v43)
      {
        v44 = UIPointerLiftEffect;
LABEL_34:
        v5 = [(__objc2_class *)v44 effectWithPreview:v38];
        BOOL v11 = 0;
        goto LABEL_35;
      }
    }
    v44 = UIPointerHighlightEffect;
    goto LABEL_34;
  }
  BOOL v11 = 0;
  v5 = v10;
LABEL_37:

LABEL_38:
  v45 = (unsigned char *)objc_opt_new();
  [v45 setType:1];
  [v45 setPointerEffect:v5];
  objc_msgSend(v45, "setOptions:", -[UIPointerEffect options](v5, "options"));
  objc_msgSend(v45, "setConstrainedAxes:", -[UIPointerEffect constrainedAxes](v5, "constrainedAxes"));
  v45[312] = v11;
  if (!v6)
  {
    v54 = v5;
    v55 = [(UIPointerEffect *)v54 preview];
    v56 = [v55 parameters];
    if ([v55 _previewMode] == 1)
    {
      if ([v56 _isSingleLineText])
      {
        [v55 size];
        double v58 = v57;
        double v60 = v59;
        double v61 = 0.0;
        double v62 = 0.0;
        double v63 = 4.0;
LABEL_57:
        v67 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v61, v62, v58, v60, v63);
        goto LABEL_58;
      }
      objc_msgSend(v56, "_setTextPathInsets:", -2.0, -3.0, -2.0, -3.0);
      [v56 _setTextPathCornerRadius:4.0];
      v66 = [v56 visiblePath];
    }
    else
    {
      v64 = [v56 visiblePath];

      if (!v64)
      {
        v68 = [(UIPointerEffect *)v54 settings];
        [v68 defaultPointerCornerRadius];
        double v70 = v69;

        v71 = [v55 view];
        [v71 bounds];
        double v73 = v72;
        double v75 = v74;
        double v77 = v76;
        double v79 = v78;
        v80 = [v55 target];
        [v80 center];
        double v82 = v81;
        double v84 = v83;
        v85 = [v55 target];
        v86 = [v85 container];
        [v86 _currentScreenScale];
        UIRectCenteredAboutPointScale(v73, v75, v77, v79, v82, v84, v87);
        double v89 = v88;
        double v91 = v90;
        double v93 = v92;
        double v95 = v94;

        v96 = [v55 view];
        [v96 _cornerRadius];
        double v98 = v97;

        if (v98 >= v70) {
          double v63 = v98;
        }
        else {
          double v63 = v70;
        }
        double v61 = v89;
        double v62 = v91;
        double v58 = v93;
        double v60 = v95;
        goto LABEL_57;
      }
      v65 = [v56 visiblePath];
      v66 = _UIPathConvertedToPreviewContainerSpace(v65, v55);
    }
    v67 = +[UIPointerShape shapeWithPath:v66];

LABEL_58:
    [v45 setPointerShape:v67];

    char v99 = [v45 options];
    uint64_t v100 = [v45 options];
    if (v99) {
      uint64_t v53 = v100 | 0x800;
    }
    else {
      uint64_t v53 = v100 | 0x40;
    }
    v6 = 0;
    goto LABEL_62;
  }
  if (!dyld_program_sdk_at_least() || _UIIsPrivateMainBundle())
  {
    v46 = [(UIPointerShape *)v6 path];

    if (v46)
    {
      v47 = [(UIPointerShape *)v6 path];
      v48 = _UIPathConvertedToPreviewContainerSpace(v47, v7);

      uint64_t v49 = +[UIPointerShape shapeWithPath:v48];

      v6 = (UIPointerShape *)v49;
    }
  }
  [v45 setPointerShape:v6];
  if ([v45 options])
  {
    v50 = [v45 pointerShape];
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();

    if (v51 != v52)
    {
      uint64_t v53 = [v45 options] | 0x800;
LABEL_62:
      [v45 setOptions:v53];
    }
  }
  [(UIPointerEffect *)v5 defaultPointerCornerRadius];
  -[UIPointerShape setDefaultCornerRadius:](v6, "setDefaultCornerRadius:");

  return (UIPointerStyle *)v45;
}

+ (UIPointerStyle)styleWithShape:(UIPointerShape *)shape constrainedAxes:(UIAxis)axes
{
  v5 = shape;
  v6 = objc_opt_new();
  [v6 setPointerShape:v5];

  [v6 setType:2];
  [v6 setOptions:1];
  [v6 setConstrainedAxes:axes];
  return (UIPointerStyle *)v6;
}

+ (UIPointerStyle)hiddenPointerStyle
{
  v2 = objc_opt_new();
  [v2 setType:0];
  return (UIPointerStyle *)v2;
}

+ (UIPointerStyle)systemPointerStyle
{
  v2 = objc_opt_new();
  [v2 setType:2];
  [v2 setOptions:2049];
  return (UIPointerStyle *)v2;
}

- (void)setEffect:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIPointerStyle *)self setPointerEffect:v4];
  }
}

- (UITargetedPreview)targetedPreview
{
  v2 = [(UIPointerStyle *)self pointerEffect];
  v3 = [v2 preview];

  return (UITargetedPreview *)v3;
}

- (CGPoint)_pointerSlipFactor
{
  if ([(UIPointerStyle *)self type] != 1 || ([(UIPointerStyle *)self options] & 1) != 0)
  {
    v3 = [(UIPointerStyle *)self pointerShape];
    [v3 inherentConstrainedSlip];
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    v3 = [(UIPointerStyle *)self pointerEffect];
    id v4 = [(UIPointerStyle *)self pointerShape];
    [v4 size];
    double v6 = v5;
    double v8 = v7;

    v9 = [v3 overrideSlipPoints];

    if (v9)
    {
      v10 = [v3 overrideSlipPoints];
      [v10 CGPointValue];
      double v12 = v11;
      double v14 = v13;
    }
    else
    {
      [v3 slipFactor];
      double v20 = v19;
      double v22 = v21;
      [v3 maxSlip];
      double v12 = fmax(fmin(v6 * v20, v23), 0.0);
      double v14 = fmax(fmin(v8 * v22, v23), 0.0);
    }
    double v16 = v12 / v6;
    double v18 = v14 / v8;
  }

  char v24 = [(UIPointerStyle *)self constrainedAxes];
  double v25 = 1.0;
  if (v24) {
    double v26 = v16;
  }
  else {
    double v26 = 1.0;
  }
  if ((v24 & 2) != 0) {
    double v25 = v18;
  }
  result.y = v25;
  result.x = v26;
  return result;
}

- (CGPoint)_contentSlipFactor
{
  double v3 = 1.0;
  double v4 = 1.0;
  if ([(UIPointerStyle *)self type] == 1)
  {
    if (([(UIPointerStyle *)self options] & 0x200) != 0)
    {
      [(UIPointerStyle *)self _pointerSlipFactor];
      double v3 = v10;
      double v4 = v11;
    }
    else
    {
      double v5 = [(UIPointerStyle *)self pointerEffect];
      [v5 parallaxAmount];
      double v7 = v6;

      [(UIPointerStyle *)self _pointerSlipFactor];
      double v3 = v7 * v8;
      double v4 = v7 * v9;
    }
  }
  char v12 = [(UIPointerStyle *)self constrainedAxes];
  if (v12) {
    double v13 = v3;
  }
  else {
    double v13 = 1.0;
  }
  if ((v12 & 2) != 0) {
    double v14 = v4;
  }
  else {
    double v14 = 1.0;
  }
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)_contentSlipMappedToRegionSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIPointerStyle *)self _contentSlipFactor];
  double v7 = v6;
  double v9 = v8;
  if ([(UIPointerStyle *)self type] == 1)
  {
    double v10 = [(UIPointerStyle *)self pointerShape];
    [v10 size];
    double v7 = fmin(v7 * v11 / (width * 0.5), 1.0);
    double v9 = fmin(v9 * v12 / (height * 0.5), 1.0);
  }
  double v13 = v7;
  double v14 = v9;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)_pointerSlipMappedToRegionSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIPointerStyle *)self _pointerSlipFactor];
  double v7 = v6;
  double v9 = v8;
  if ([(UIPointerStyle *)self type] == 1 && ([(UIPointerStyle *)self options] & 1) == 0)
  {
    double v10 = [(UIPointerStyle *)self pointerShape];
    [v10 size];
    double v7 = fmin(v7 * v11 / (width * 0.5), 1.0);
    double v9 = fmin(v9 * v12 / (height * 0.5), 1.0);
  }
  double v13 = v7;
  double v14 = v9;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)_adaptForNonSystemEffectSupportingEnvironment
{
  if ([(UIPointerStyle *)self type] == 1)
  {
    double v3 = [(UIPointerStyle *)self pointerEffect];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v5 = [(UIPointerStyle *)self pointerEffect];
      double v6 = [v5 preview];
      double v7 = +[UIPointerEffect effectWithPreview:v6];
      [(UIPointerStyle *)self setPointerEffect:v7];
    }
    double v8 = [(UIPointerStyle *)self pointerEffect];
    uint64_t v9 = [v8 options];

    [(UIPointerStyle *)self setOptions:v9 | 0x8000];
  }
}

- (double)contentScale
{
  double v3 = 1.0;
  if (([(UIPointerStyle *)self options] & 0x20) != 0)
  {
    double v4 = [(UIPointerStyle *)self targetedPreview];
    if ([(UIPointerStyle *)self pointerMergesWithContent]
      || ([(UIPointerStyle *)self options] & 1) != 0)
    {
      [v4 size];
      double v7 = v10;
      double v9 = v11;
    }
    else
    {
      double v5 = [(UIPointerStyle *)self pointerShape];
      [v5 size];
      double v7 = v6;
      double v9 = v8;
    }
    double v12 = _UISizeRespectingTransformsFromPreview(v4, v7, v9).n128_f64[0];
    if (v12 >= v13) {
      double v14 = v12;
    }
    else {
      double v14 = v13;
    }
    double v15 = [(UIPointerStyle *)self pointerEffect];
    [v15 scaleUpPoints];
    double v3 = (v14 + v16) / v14;

    if (self->_determineScaleAutomatically)
    {
      double v17 = [(UIPointerStyle *)self targetedPreview];
      [v17 size];
      double v19 = v18;
      double v21 = v20;
      double v22 = [v17 target];
      double v23 = v22;
      if (v22)
      {
        [v22 transform];
        double v24 = v44;
        double v25 = v43;
        double v26 = v46;
        double v27 = v45;
      }
      else
      {
        double v26 = 0.0;
        double v24 = 0.0;
        double v27 = 0.0;
        double v25 = 0.0;
      }
      double v28 = v21 * v27 + v19 * v25;
      double v29 = v21 * v26 + v19 * v24;

      double v30 = [v17 target];
      double v31 = [v30 container];
      [v31 bounds];
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      CGFloat v37 = v36;
      CGFloat v39 = v38;

      v47.origin.x = v33;
      v47.origin.y = v35;
      v47.size.double width = v37;
      v47.size.double height = v39;
      double v40 = CGRectGetWidth(v47) / v28;
      v48.origin.x = v33;
      v48.origin.y = v35;
      v48.size.double width = v37;
      v48.size.double height = v39;
      double v41 = CGRectGetWidth(v48) / v29;
      if (v40 < v41) {
        double v41 = v40;
      }
      double v3 = fmax(fmin(v3, v41), 1.0);
    }
  }
  return v3;
}

- (double)_pointerIntensityForMaterialLuminance:(unint64_t)a3
{
  double v4 = [(UIPointerStyle *)self pointerShape];
  double v5 = v4;
  if (!v4)
  {
    if (!self->_type) {
      goto LABEL_7;
    }
LABEL_6:
    [(UIPointerStyle *)self options];
    [(UIPointerStyle *)self pointerMergesWithContent];
    goto LABEL_7;
  }
  uint64_t v6 = [v4 materialUsage];
  if (self->_type && v6 != 2) {
    goto LABEL_6;
  }
LABEL_7:
  PSIntensityForLuminanceAndUsage();
  double v8 = v7;

  return v8;
}

- (BOOL)pointerUnderlapsContent
{
  int64_t v3 = [(UIPointerStyle *)self type];
  if (v3) {
    LOBYTE(v3) = ([(UIPointerStyle *)self options] & 1) == 0;
  }
  return v3;
}

- (BOOL)pointerMergesWithContent
{
  return ([(UIPointerStyle *)self options] >> 1) & 1;
}

- (NSString)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(UIPointerStyle *)self type];
  if (v5 > 2) {
    uint64_t v6 = @"<unknown>";
  }
  else {
    uint64_t v6 = off_1E52FD720[v5];
  }
  return (NSString *)[v3 stringWithFormat:@"<%@: %p; type = %@>", v4, self, v6];
}

- (NSArray)compatibleDescriptors
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (BOOL)canTransitionInPlaceToEffectWithDescriptor:(id)a3
{
  id v4 = a3;
  if ([(UIPointerStyle *)self type] == 1)
  {
    unint64_t v5 = [(UIPointerStyle *)self targetedPreview];
    uint64_t v6 = [v5 view];
    double v7 = [v4 targetedPreview];
    double v8 = [v7 view];
    char v9 = [v6 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setType:", -[UIPointerStyle type](self, "type"));
  objc_msgSend(v4, "setOptions:", -[UIPointerStyle options](self, "options"));
  objc_msgSend(v4, "setConstrainedAxes:", -[UIPointerStyle constrainedAxes](self, "constrainedAxes"));
  unint64_t v5 = [(UIPointerStyle *)self pointerEffect];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPointerEffect:v6];

  double v7 = [(UIPointerStyle *)self pointerShape];
  double v8 = (void *)[v7 copy];
  [v4 setPointerShape:v8];

  v4[312] = self->_determineScaleAutomatically;
  objc_msgSend(v4, "set_suppressesMirroring:", -[UIPointerStyle _suppressesMirroring](self, "_suppressesMirroring"));
  char v9 = [(UIPointerStyle *)self accessories];
  [v4 setAccessories:v9];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UIPointerStyle *)a3;
  if (v4 == self)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      uint64_t v6 = [v5 type];
      if (v6 != [(UIPointerStyle *)self type]
        || (uint64_t v7 = [v5 options], v7 != -[UIPointerStyle options](self, "options"))
        || (uint64_t v8 = [v5 constrainedAxes], v8 != -[UIPointerStyle constrainedAxes](self, "constrainedAxes")))
      {
        LOBYTE(v14) = 0;
LABEL_14:

        goto LABEL_15;
      }
      char v9 = [v5 pointerEffect];
      double v10 = [(UIPointerStyle *)self pointerEffect];
      id v11 = v9;
      id v12 = v10;
      double v13 = v12;
      if (v11 == v12)
      {
      }
      else
      {
        LOBYTE(v14) = 0;
        double v15 = v12;
        id v16 = v11;
        if (!v11 || !v12) {
          goto LABEL_27;
        }
        int v17 = [v11 isEqual:v12];

        if (!v17)
        {
          LOBYTE(v14) = 0;
LABEL_28:

          goto LABEL_14;
        }
      }
      double v19 = [v5 pointerShape];
      double v20 = [(UIPointerStyle *)self pointerShape];
      id v16 = v19;
      id v21 = v20;
      double v15 = v21;
      if (v16 == v21)
      {
      }
      else
      {
        LOBYTE(v14) = 0;
        double v22 = v21;
        double v23 = v16;
        if (!v16 || !v21) {
          goto LABEL_25;
        }
        int v14 = [v16 isEqual:v21];

        if (!v14) {
          goto LABEL_27;
        }
      }
      if (v5[312] != self->_determineScaleAutomatically)
      {
        LOBYTE(v14) = 0;
        goto LABEL_27;
      }
      double v23 = [v5 accessories];
      double v22 = [(UIPointerStyle *)self accessories];
      LOBYTE(v14) = UIEqual(v23, v22);
LABEL_25:

LABEL_27:
      goto LABEL_28;
    }
    LOBYTE(v14) = 0;
  }
LABEL_15:

  return v14;
}

- (unint64_t)hash
{
  int64_t v3 = [(UIPointerStyle *)self type];
  unint64_t v4 = [(UIPointerStyle *)self options] ^ v3;
  unint64_t v5 = v4 ^ [(UIPointerStyle *)self constrainedAxes];
  uint64_t v6 = [(UIPointerStyle *)self pointerEffect];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [(UIPointerStyle *)self pointerShape];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  BOOL determineScaleAutomatically = self->_determineScaleAutomatically;
  id v11 = [(UIPointerStyle *)self accessories];
  unint64_t v12 = v9 ^ [v11 hash] ^ determineScaleAutomatically;

  return v12;
}

- (BOOL)_suppressesMirroring
{
  return self->_suppressesMirroring;
}

- (void)set_suppressesMirroring:(BOOL)a3
{
  self->_suppressesMirroring = a3;
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(NSArray *)accessories
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)constrainedAxes
{
  return self->_constrainedAxes;
}

- (void)setConstrainedAxes:(unint64_t)a3
{
  self->_constrainedAxes = a3;
}

- (UIPointerEffect)pointerEffect
{
  return self->_pointerEffect;
}

- (void)setPointerEffect:(id)a3
{
}

- (UIPointerShape)pointerShape
{
  return self->_pointerShape;
}

- (void)setPointerShape:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerShape, 0);
  objc_storeStrong((id *)&self->_pointerEffect, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
}

@end