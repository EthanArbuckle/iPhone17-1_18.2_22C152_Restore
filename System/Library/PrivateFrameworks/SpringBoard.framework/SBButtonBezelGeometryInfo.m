@interface SBButtonBezelGeometryInfo
+ (id)buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel;
- (CGRect)buttonHWRectForButton:(int64_t)a3 inView:(id)a4;
- (CGRect)buttonHWRectForButton:(int64_t)a3 onEmbeddedDisplayBounds:(CGRect)a4;
- (CGRect)normalizedButtonHWRectForButton:(int64_t)a3;
- (unint64_t)buttonScreenEdgeForButton:(int64_t)a3;
@end

@implementation SBButtonBezelGeometryInfo

+ (id)buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SBButtonBezelGeometryInfo_buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel_onceToken != -1) {
    dispatch_once(&buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel_onceToken, block);
  }
  v2 = (void *)buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel___result;
  return v2;
}

void __82__SBButtonBezelGeometryInfo_buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel___result;
  buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel___result = (uint64_t)v1;
}

- (CGRect)normalizedButtonHWRectForButton:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  switch(a3)
  {
    case 0:
    case 2:
      v11 = @"UserIntentPhysicalButtonNormalizedCGRect";
      double v12 = 1.0;
      goto LABEL_9;
    case 1:
    case 5:
    case 6:
    case 7:
    case 11:
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = NSStringFromSBSHardwareButtonKind();
      [v9 handleFailureInMethod:a2, self, @"SBButtonBezelGeometryInfo.m", 91, @"We're currently not supporting getting the button position for the %@ button", v10 object file lineNumber description];

      break;
    case 3:
      v11 = @"VolumeUpButtonNormalizedCGRect";
      goto LABEL_8;
    case 4:
      v11 = @"VolumeDownButtonNormalizedCGRect";
      goto LABEL_8;
    case 8:
      v11 = @"RingerButtonNormalizedCGRect";
LABEL_8:
      double v12 = 0.0;
LABEL_9:
      double v13 = SBMGGetCGRectAnswer((uint64_t)v11, v12);
      goto LABEL_10;
    case 9:
      double v3 = 1.0;
      SBMGGetCGRectAnswer(@"CameraButtonNormalizedCGRect", 1.0);
      goto LABEL_11;
    case 10:
      double v21 = SBMGGetCGRectAnswer(@"VolumeUpButtonNormalizedCGRect", 0.0);
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      v33.origin.x = SBMGGetCGRectAnswer(@"VolumeDownButtonNormalizedCGRect", 0.0);
      v33.origin.y = v28;
      v33.size.width = v29;
      v33.size.height = v30;
      v31.origin.x = v21;
      v31.origin.y = v23;
      v31.size.width = v25;
      v31.size.height = v27;
      *(CGRect *)&double v13 = CGRectUnion(v31, v33);
LABEL_10:
      double v3 = v13;
LABEL_11:
      double v4 = v14;
      double v5 = v15;
      double v6 = v16;
      break;
    default:
      break;
  }
  double v17 = v3;
  double v18 = v4;
  double v19 = v5;
  double v20 = v6;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)buttonHWRectForButton:(int64_t)a3 onEmbeddedDisplayBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  [(SBButtonBezelGeometryInfo *)self normalizedButtonHWRectForButton:a3];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v24 = v14;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double v16 = v9 * CGRectGetMaxX(v26) + (1.0 - v9) * MinX;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double v18 = v11 * CGRectGetMaxY(v28) + (1.0 - v11) * MinY;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v19 = v13 * CGRectGetWidth(v29) + (1.0 - v13) * 0.0;
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double v20 = v24 * CGRectGetHeight(v30) + (1.0 - v24) * 0.0;
  double v21 = v16;
  double v22 = v18;
  double v23 = v19;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGRect)buttonHWRectForButton:(int64_t)a3 inView:(id)a4
{
  id v6 = a4;
  v7 = [v6 window];
  double v8 = [v7 windowScene];
  double v9 = [v8 screen];
  if ([v9 _isEmbeddedScreen])
  {
  }
  else
  {
    double v10 = SBLogCommon();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (v11) {
      NSLog(&cfstr_Sbbuttonbezelg_0.isa);
    }
  }
  double v12 = [v8 screen];
  [v12 _referenceBounds];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  [(SBButtonBezelGeometryInfo *)self normalizedButtonHWRectForButton:a3];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v45 = v27;
  v46.origin.CGFloat x = v14;
  v46.origin.CGFloat y = v16;
  v46.size.CGFloat width = v18;
  v46.size.CGFloat height = v20;
  double MinX = CGRectGetMinX(v46);
  v47.origin.CGFloat x = v14;
  v47.origin.CGFloat y = v16;
  v47.size.CGFloat width = v18;
  v47.size.CGFloat height = v20;
  double v29 = v22 * CGRectGetMaxX(v47) + (1.0 - v22) * MinX;
  v48.origin.CGFloat x = v14;
  v48.origin.CGFloat y = v16;
  v48.size.CGFloat width = v18;
  v48.size.CGFloat height = v20;
  double MinY = CGRectGetMinY(v48);
  v49.origin.CGFloat x = v14;
  v49.origin.CGFloat y = v16;
  v49.size.CGFloat width = v18;
  v49.size.CGFloat height = v20;
  double v31 = v24 * CGRectGetMaxY(v49) + (1.0 - v24) * MinY;
  v50.origin.CGFloat x = v14;
  v50.origin.CGFloat y = v16;
  v50.size.CGFloat width = v18;
  v50.size.CGFloat height = v20;
  double v32 = v26 * CGRectGetWidth(v50) + (1.0 - v26) * 0.0;
  v51.origin.CGFloat x = v14;
  v51.origin.CGFloat y = v16;
  v51.size.CGFloat width = v18;
  v51.size.CGFloat height = v20;
  objc_msgSend(v6, "convertRect:fromView:", v7, v29, v31, v32, v45 * CGRectGetHeight(v51) + (1.0 - v45) * 0.0);
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;

  double v41 = v34;
  double v42 = v36;
  double v43 = v38;
  double v44 = v40;
  result.size.CGFloat height = v44;
  result.size.CGFloat width = v43;
  result.origin.CGFloat y = v42;
  result.origin.CGFloat x = v41;
  return result;
}

- (unint64_t)buttonScreenEdgeForButton:(int64_t)a3
{
  [(SBButtonBezelGeometryInfo *)self normalizedButtonHWRectForButton:a3];
  if BSFloatIsZero() && (BSFloatIsZero()) {
    return 2;
  }
  if BSFloatIsOne() && (BSFloatIsZero()) {
    return 8;
  }
  if (BSFloatIsZero() && !BSFloatIsZero()) {
    return 1;
  }
  if (BSFloatIsOne() && !BSFloatIsZero()) {
    return 4;
  }
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"SBButtonBezelGeometryInfo.m" lineNumber:123 description:@"Button rect is not on edge of screen"];

  return 0;
}

@end