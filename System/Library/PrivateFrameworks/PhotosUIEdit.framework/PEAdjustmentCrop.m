@interface PEAdjustmentCrop
- (CGSize)aspectRatio;
- (PEAdjustmentCrop)initWithModifier:(id)a3;
- (id)modifier;
- (int64_t)category;
- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7;
- (void)setAspectRatio:(CGSize)a3;
- (void)setModifier:(id)a3;
@end

@implementation PEAdjustmentCrop

- (void).cxx_destruct
{
}

- (void)setModifier:(id)a3
{
}

- (id)modifier
{
  return self->_modifier;
}

- (void)setAspectRatio:(CGSize)a3
{
  self->_aspectRatio = a3;
}

- (CGSize)aspectRatio
{
  double width = self->_aspectRatio.width;
  double height = self->_aspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)applyToCompositionController:(id)a3 valuesCalculator:(id)a4 asset:(id)a5 livePortraitBehaviorDelegate:(id)a6 completionHandler:(id)a7
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v9 = a3;
  v10 = (void (**)(id, uint64_t, void))a7;
  id v11 = objc_alloc(MEMORY[0x263F58618]);
  v12 = [v9 composition];
  v13 = (void *)[v11 initWithComposition:v12];

  uint64_t v59 = 0;
  v14 = [v13 submitSynchronous:&v59];
  v15 = [v14 geometry];

  if (v15)
  {
    [v15 extent];
    NUPixelRectToCGRect();
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = [(PEAdjustmentCrop *)self modifier];
    double v25 = v24[2](v21, v23);
    double v27 = v26;

    if (v21 == 0.0
      || v23 == 0.0
      || (v21 == *MEMORY[0x263F5D550] ? (BOOL v28 = v23 == *(double *)(MEMORY[0x263F5D550] + 8)) : (BOOL v28 = 0), v28))
    {
      double v29 = 1.0;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218496;
        double v61 = v21;
        __int16 v62 = 2048;
        double v63 = v23;
        __int16 v64 = 2048;
        uint64_t v65 = 0x3FF0000000000000;
        _os_log_fault_impl(&dword_217B65000, &_os_log_internal, OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
      }
    }
    else
    {
      double v29 = fabs(v21 / v23);
    }
    if (v25 == 0.0 || v27 == 0.0 || v25 == *MEMORY[0x263F5D550] && v27 == *(double *)(MEMORY[0x263F5D550] + 8))
    {
      double v30 = 1.0;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218496;
        double v61 = v25;
        __int16 v62 = 2048;
        double v63 = v27;
        __int16 v64 = 2048;
        uint64_t v65 = 0x3FF0000000000000;
        _os_log_fault_impl(&dword_217B65000, &_os_log_internal, OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
      }
    }
    else
    {
      double v30 = fabs(v25 / v27);
    }
    if (vabdd_f64(v30, v29) > 0.00000999999975)
    {
      double v57 = v27;
      double v31 = v17 + v21 * 0.5;
      double v32 = v19 + v23 * 0.5;
      PFSizeWithAspectRatioFittingSize();
      CGFloat v34 = v33;
      CGFloat v36 = v35;
      double v37 = v31 + v33 * -0.5;
      double v38 = v32 + v35 * -0.5;
      [v15 orientation];
      NUOrientationInverse();
      if (NUOrientationIsValid())
      {
        NUPixelSizeFromCGSize();
        NUOrientationTransformRect();
        double v37 = v39;
        double v38 = v40;
        CGFloat v34 = v41;
        CGFloat v36 = v42;
      }
      v43 = [v9 cropAdjustmentController];
      [v43 cropRect];
      CGFloat v45 = v44;
      CGFloat v47 = v46;

      v67.origin.CGFloat x = v37;
      v67.origin.CGFloat y = v38;
      v67.size.CGFloat width = v34;
      v67.size.CGFloat height = v36;
      CGRect v68 = CGRectOffset(v67, v45, v47);
      CGFloat x = v68.origin.x;
      CGFloat y = v68.origin.y;
      CGFloat width = v68.size.width;
      CGFloat height = v68.size.height;
      if (((uint64_t)v25 | (uint64_t)v57) < 0)
      {
        v55 = [MEMORY[0x263F08690] currentHandler];
        v56 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
        [v55 handleFailureInFunction:v56, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
      }
      uint64_t v52 = NUOrientationTransformImageSize();
      uint64_t v53 = *MEMORY[0x263F5D6E0];
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __119__PEAdjustmentCrop_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke;
      v58[3] = &__block_descriptor_80_e36_v16__0__PICropAdjustmentController_8l;
      *(CGFloat *)&v58[4] = x;
      *(CGFloat *)&v58[5] = y;
      *(CGFloat *)&v58[6] = width;
      *(CGFloat *)&v58[7] = height;
      v58[8] = v52;
      v58[9] = v54;
      [v9 modifyAdjustmentWithKey:v53 modificationBlock:v58];
    }
    v10[2](v10, 1, 0);
  }
}

void __119__PEAdjustmentCrop_applyToCompositionController_valuesCalculator_asset_livePortraitBehaviorDelegate_completionHandler___block_invoke(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  double v5 = a1[6];
  double v6 = a1[7];
  id v7 = a2;
  objc_msgSend(v7, "setCropRect:", v3, v4, v5, v6);
  [v7 setConstraintWidth:*((void *)a1 + 8)];
  [v7 setConstraintHeight:*((void *)a1 + 9)];
  [v7 setIsAuto:0];
  [v7 setEnabled:1];
}

- (int64_t)category
{
  return 6;
}

- (PEAdjustmentCrop)initWithModifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PEAdjustmentCrop;
  double v5 = [(PEAdjustmentCrop *)&v9 init];
  if (v5)
  {
    double v6 = _Block_copy(v4);
    id modifier = v5->_modifier;
    v5->_id modifier = v6;
  }
  return v5;
}

@end