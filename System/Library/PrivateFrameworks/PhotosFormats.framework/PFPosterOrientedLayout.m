@interface PFPosterOrientedLayout
+ (id)layoutWithDictionaryRepresentation:(id)a3;
- (BOOL)canApplyHeadroom;
- (BOOL)canApplyParallax;
- (BOOL)hasTopEdgeContact;
- (BOOL)isUsingHeadroom;
- (CGRect)extendedImageExtent;
- (CGRect)imageExtent;
- (CGRect)inactiveFrame;
- (CGRect)normalizedVisibleFrame;
- (CGRect)parallaxInactiveFrame;
- (CGRect)parallaxVisibleFrame;
- (CGRect)screenExtent;
- (CGRect)timeFrame;
- (CGRect)visibleFrame;
- (CGSize)deviceResolution;
- (CGSize)extendedImageSize;
- (CGSize)imageSize;
- (CGSize)parallaxPadding;
- (NSArray)debugLayouts;
- (NSString)clockLayerOrder;
- (PFParallaxLayoutConfiguration)configuration;
- (char)initWithImageSize:(double)a3 deviceResolution:(double)a4 parallaxPadding:(double)a5 visibleFrame:(double)a6 inactiveFrame:(double)a7 timeFrame:(uint64_t)a8 clockLayerOrder:(void *)a9 clockIntersection:(uint64_t)a10 hasTopEdgeContact:(char)a11 debugLayouts:(void *)a12;
- (id)debugDescription;
- (id)debugSwiftCode;
- (id)description;
- (id)dictionaryRepresentation;
- (id)layoutByUpdatingClockIntersection:(unint64_t)a3;
- (id)layoutByUpdatingClockLayerOrder:(id)a3;
- (id)layoutByUpdatingConfiguration:(id)a3;
- (id)layoutByUpdatingImageSize:(CGSize)a3;
- (id)layoutByUpdatingInactiveFrame:(CGRect)a3;
- (id)layoutByUpdatingNormalizedVisibleFrame:(CGRect)a3;
- (id)layoutByUpdatingVisibleFrame:(CGRect)a3;
- (id)layoutByUpgradingToConfiguration:(id)a3;
- (int64_t)orientation;
- (uint64_t)initWithImageSize:(uint64_t)a3 deviceResolution:(uint64_t)a4 parallaxPadding:(uint64_t)a5 visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:debugLayouts:;
- (unint64_t)clockIntersection;
@end

@implementation PFPosterOrientedLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLayouts, 0);

  objc_storeStrong((id *)&self->_clockLayerOrder, 0);
}

- (NSArray)debugLayouts
{
  return self->_debugLayouts;
}

- (BOOL)hasTopEdgeContact
{
  return self->_hasTopEdgeContact;
}

- (unint64_t)clockIntersection
{
  return self->_clockIntersection;
}

- (NSString)clockLayerOrder
{
  return self->_clockLayerOrder;
}

- (CGRect)timeFrame
{
  double x = self->_timeFrame.origin.x;
  double y = self->_timeFrame.origin.y;
  double width = self->_timeFrame.size.width;
  double height = self->_timeFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)inactiveFrame
{
  double x = self->_inactiveFrame.origin.x;
  double y = self->_inactiveFrame.origin.y;
  double width = self->_inactiveFrame.size.width;
  double height = self->_inactiveFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)visibleFrame
{
  double x = self->_visibleFrame.origin.x;
  double y = self->_visibleFrame.origin.y;
  double width = self->_visibleFrame.size.width;
  double height = self->_visibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)parallaxPadding
{
  double width = self->_parallaxPadding.width;
  double height = self->_parallaxPadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)deviceResolution
{
  double width = self->_deviceResolution.width;
  double height = self->_deviceResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)debugSwiftCode
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(PFPosterOrientedLayout *)self imageSize];
  uint64_t v5 = (int)v4;
  [(PFPosterOrientedLayout *)self imageSize];
  [v3 appendFormat:@"XCTAssertEqual(item.originalLayout.imageSize, CGSize(width: %d, height: %d), \"Bad original layout image size\")\n", v5, (int)v6];
  [(PFPosterOrientedLayout *)self deviceResolution];
  uint64_t v8 = (int)v7;
  [(PFPosterOrientedLayout *)self deviceResolution];
  [v3 appendFormat:@"XCTAssertEqual(item.originalLayout.deviceResolution, CGSize(width: %d, height: %d), \"Bad original layout device resolution\")\n", v8, (int)v9];
  [(PFPosterOrientedLayout *)self parallaxPadding];
  uint64_t v11 = v10;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  [v3 appendFormat:@"XCTAssertEqual(item.originalLayout.parallaxPadding, CGSize(width: %.0f, height: %.0f), accuracy: 1.0, \"Bad original layout parallax padding\")\n", v11, v12];
  [(PFPosterOrientedLayout *)self visibleFrame];
  uint64_t v14 = v13;
  [(PFPosterOrientedLayout *)self visibleFrame];
  uint64_t v16 = v15;
  [(PFPosterOrientedLayout *)self visibleFrame];
  uint64_t v18 = v17;
  [(PFPosterOrientedLayout *)self visibleFrame];
  [v3 appendFormat:@"XCTAssertEqual(item.originalLayout.visibleFrame, CGRect(x: %.0f, y: %.0f, width: %.0f, height: %.0f), accuracy: 1.0, \"Bad original layout visibleFrame\")\n", v14, v16, v18, v19];
  [(PFPosterOrientedLayout *)self inactiveFrame];
  uint64_t v21 = v20;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  uint64_t v23 = v22;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  uint64_t v25 = v24;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  [v3 appendFormat:@"XCTAssertEqual(item.originalLayout.inactiveFrame, CGRect(x: %.0f, y: %.0f, width: %.0f, height: %.0f), accuracy: 1.0, \"Bad original layout inactiveFrame\")\n", v21, v23, v25, v26];
  [(PFPosterOrientedLayout *)self timeFrame];
  uint64_t v28 = v27;
  [(PFPosterOrientedLayout *)self timeFrame];
  uint64_t v30 = v29;
  [(PFPosterOrientedLayout *)self timeFrame];
  uint64_t v32 = v31;
  [(PFPosterOrientedLayout *)self timeFrame];
  [v3 appendFormat:@"XCTAssertEqual(item.originalLayout.timeFrame, CGRect(x: %.0f, y: %.0f, width: %.0f, height: %.0f), accuracy: 1.0, \"Bad original layout timeFrame\")\n", v28, v30, v32, v33];
  v34 = [(PFPosterOrientedLayout *)self clockLayerOrder];

  if (v34 == @"ClockAboveForeground")
  {
    v36 = @".aboveForeground";
  }
  else
  {
    v35 = [(PFPosterOrientedLayout *)self clockLayerOrder];

    v36 = @".aboveBackground";
    if (v35 != @"ClockAboveBackground") {
      v36 = 0;
    }
  }
  [v3 appendFormat:@"XCTAssertEqual(item.originalLayout.clockLayerOrder, %@, \"Bad original layout clock layer order\")\n", v36];
  v37 = (void *)[v3 copy];

  return v37;
}

- (id)dictionaryRepresentation
{
  v17[8] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v16[0] = @"imageSize";
  [(PFPosterOrientedLayout *)self imageSize];
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v19);
  v17[0] = DictionaryRepresentation;
  v16[1] = @"deviceResolution";
  [(PFPosterOrientedLayout *)self deviceResolution];
  CFDictionaryRef v4 = CGSizeCreateDictionaryRepresentation(v20);
  v17[1] = v4;
  v16[2] = @"visibleFrame";
  [(PFPosterOrientedLayout *)self visibleFrame];
  CFDictionaryRef v5 = CGRectCreateDictionaryRepresentation(v22);
  v17[2] = v5;
  v16[3] = @"timeFrame";
  [(PFPosterOrientedLayout *)self timeFrame];
  CFDictionaryRef v6 = CGRectCreateDictionaryRepresentation(v23);
  v17[3] = v6;
  v16[4] = @"parallaxPadding";
  [(PFPosterOrientedLayout *)self parallaxPadding];
  CFDictionaryRef v7 = CGSizeCreateDictionaryRepresentation(v21);
  v17[4] = v7;
  v16[5] = @"clockLayerOrder";
  uint64_t v8 = [(PFPosterOrientedLayout *)self clockLayerOrder];
  v17[5] = v8;
  v16[6] = @"clockIntersection";
  double v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PFPosterOrientedLayout clockIntersection](self, "clockIntersection"));
  v17[6] = v9;
  v16[7] = @"hasTopEdgeContact";
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[PFPosterOrientedLayout hasTopEdgeContact](self, "hasTopEdgeContact"));
  v17[7] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:8];
  uint64_t v12 = (void *)[v3 initWithDictionary:v11];

  [(PFPosterOrientedLayout *)self inactiveFrame];
  if (!CGRectIsNull(v24))
  {
    [(PFPosterOrientedLayout *)self inactiveFrame];
    CFDictionaryRef v13 = CGRectCreateDictionaryRepresentation(v25);
    [v12 setObject:v13 forKeyedSubscript:@"inactiveFrame"];
  }

  return v12;
}

- (BOOL)isUsingHeadroom
{
  [(PFPosterOrientedLayout *)self visibleFrame];
  double v4 = v3;
  [(PFPosterOrientedLayout *)self visibleFrame];
  double v6 = v4 + v5;
  [(PFPosterOrientedLayout *)self imageSize];
  return v6 - v7 > 0.0;
}

- (BOOL)canApplyParallax
{
  [(PFPosterOrientedLayout *)self visibleFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  CGFloat v12 = -v11;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  CGFloat v14 = -v13;
  v46.origin.CGFloat x = v4;
  v46.origin.CGFloat y = v6;
  v46.size.CGFloat width = v8;
  v46.size.CGFloat height = v10;
  CGRect v47 = CGRectInset(v46, v12, v14);
  CGFloat x = v47.origin.x;
  CGFloat y = v47.origin.y;
  CGFloat width = v47.size.width;
  CGFloat height = v47.size.height;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  double v20 = v19;
  [(PFPosterOrientedLayout *)self visibleFrame];
  double v22 = v20 / v21;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  double v24 = v23;
  [(PFPosterOrientedLayout *)self visibleFrame];
  double v26 = v24 / v25;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  double v28 = v27;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  double v30 = v29;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  CGRect v49 = CGRectInset(v48, -(v28 * v22), -(v30 * v26));
  CGFloat v31 = v49.origin.x;
  CGFloat v32 = v49.origin.y;
  CGFloat v33 = v49.size.width;
  CGFloat v34 = v49.size.height;
  [(PFPosterOrientedLayout *)self imageExtent];
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  BOOL v35 = CGRectContainsRect(v50, v51);
  if (v35)
  {
    [(PFPosterOrientedLayout *)self imageExtent];
    CGFloat v40 = v31;
    CGFloat v41 = v32;
    CGFloat v42 = v33;
    CGFloat v43 = v34;
    LOBYTE(v35) = CGRectContainsRect(*(CGRect *)&v36, *(CGRect *)&v40);
  }
  return v35;
}

- (id)debugDescription
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(PFPosterOrientedLayout *)self imageSize];
  uint64_t v43 = v5;
  [(PFPosterOrientedLayout *)self imageSize];
  uint64_t v42 = v6;
  [(PFPosterOrientedLayout *)self deviceResolution];
  uint64_t v41 = v7;
  [(PFPosterOrientedLayout *)self deviceResolution];
  uint64_t v40 = v8;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  uint64_t v39 = v9;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  uint64_t v38 = v10;
  [(PFPosterOrientedLayout *)self visibleFrame];
  uint64_t v37 = v11;
  [(PFPosterOrientedLayout *)self visibleFrame];
  uint64_t v36 = v12;
  [(PFPosterOrientedLayout *)self visibleFrame];
  uint64_t v35 = v13;
  [(PFPosterOrientedLayout *)self visibleFrame];
  uint64_t v34 = v14;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  uint64_t v16 = v15;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  uint64_t v18 = v17;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  uint64_t v20 = v19;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  uint64_t v22 = v21;
  [(PFPosterOrientedLayout *)self timeFrame];
  uint64_t v24 = v23;
  [(PFPosterOrientedLayout *)self timeFrame];
  uint64_t v26 = v25;
  [(PFPosterOrientedLayout *)self timeFrame];
  uint64_t v28 = v27;
  [(PFPosterOrientedLayout *)self timeFrame];
  uint64_t v30 = v29;
  CGFloat v31 = [(PFPosterOrientedLayout *)self clockLayerOrder];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p> img:%.0fx%.0f res:%.0fx%.0f pad:%.0fx%.0fx vis:%.0f,%.0f %.0fx%.0f inact:%.0f,%.0f %.0fx%.0f time:%.0f,%.0f %.0fx%.0f clock:%@", v4, self, v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v16, v18, v20, v22,
    v24,
    v26,
    v28,
    v30,
  CGFloat v32 = v31);

  return v32;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(PFPosterOrientedLayout *)self imageSize];
  uint64_t v6 = v5;
  [(PFPosterOrientedLayout *)self imageSize];
  uint64_t v8 = v7;
  [(PFPosterOrientedLayout *)self deviceResolution];
  uint64_t v10 = v9;
  [(PFPosterOrientedLayout *)self deviceResolution];
  uint64_t v12 = v11;
  [(PFPosterOrientedLayout *)self visibleFrame];
  uint64_t v14 = v13;
  [(PFPosterOrientedLayout *)self visibleFrame];
  uint64_t v16 = v15;
  [(PFPosterOrientedLayout *)self visibleFrame];
  uint64_t v18 = v17;
  [(PFPosterOrientedLayout *)self visibleFrame];
  uint64_t v20 = v19;
  uint64_t v21 = [(PFPosterOrientedLayout *)self clockLayerOrder];
  uint64_t v22 = [v3 stringWithFormat:@"<%@:%p img:%.0fx%.0f res:%.0fx%.0f vis:%.0f,%.0f %.0fx%.0f clock:%@>", v4, self, v6, v8, v10, v12, v14, v16, v18, v20, v21];

  return v22;
}

- (id)layoutByUpgradingToConfiguration:(id)a3
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PFPosterOrientedLayout *)self configuration];
  int v6 = [v4 isEqualToLayoutConfiguration:v5];

  if (v6)
  {
    uint64_t v7 = self;
    goto LABEL_58;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(PFPosterOrientedLayout *)self debugDescription];
    uint64_t v9 = [v4 debugDescription];
    *(_DWORD *)buf = 138412546;
    double v124 = *(double *)&v8;
    __int16 v125 = 2112;
    double v126 = *(double *)&v9;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Upgrading %@ to %@", buf, 0x16u);
  }
  uint64_t v10 = (double *)MEMORY[0x1E4F1DAD8];
  double v121 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PFPosterOrientedLayout *)self imageSize];
  double v111 = v11;
  double v114 = v12;
  [(PFPosterOrientedLayout *)self visibleFrame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  double v118 = v21;
  double v106 = v22;
  double v109 = v23;
  double v116 = v24;
  [(PFPosterOrientedLayout *)self timeFrame];
  uint64_t v103 = v25;
  double v104 = v26;
  double v105 = v27;
  double rect = v28;
  v131.origin.CGFloat x = v14;
  v131.origin.CGFloat y = v16;
  v131.size.CGFloat width = v18;
  v131.size.CGFloat height = v20;
  if (CGRectIsEmpty(v131))
  {
    double v29 = *v10;
    [(PFPosterOrientedLayout *)self deviceResolution];
    double v32 = v30;
    double v33 = v31;
    if (v30 == 0.0
      || v31 == 0.0
      || (v30 == *MEMORY[0x1E4F8A250] ? (BOOL v34 = v31 == *(double *)(MEMORY[0x1E4F8A250] + 8)) : (BOOL v34 = 0), v34))
    {
      double v35 = v121;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218496;
        double v124 = v32;
        __int16 v125 = 2048;
        double v126 = v33;
        __int16 v127 = 2048;
        uint64_t v128 = 0x3FF0000000000000;
        _os_log_fault_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
      }
    }
    else
    {
      double v35 = v121;
    }
    double v36 = v29 + v111 * 0.5;
    double v37 = v35 + v114 * 0.5;
    PFSizeWithAspectRatioFittingSize();
    double v18 = v38;
    double v20 = v39;
    double v14 = v36 + v38 * -0.5;
    double v16 = v37 + v39 * -0.5;
  }
  [v4 screenSize];
  double v42 = v41 / v40;
  double v43 = sqrt(v20 * v18 / (v41 / v40));
  double v44 = sqrt(v20 * v18 * (v41 / v40));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v45 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&v14, *(void *)&v16, *(void *)&v43, *(void *)&v44];
    *(_DWORD *)buf = 138412290;
    double v124 = *(double *)&v45;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "newVisibleFrame after scaling: %@", buf, 0xCu);
  }
  double v113 = v43;
  BOOL v46 = v43 <= v111 && v44 <= v114;
  double v47 = v44;
  double v48 = v106;
  if (!v46)
  {
    PFSizeWithAspectRatioFittingSize();
    double v50 = v49;
    double v47 = v51;
    double v113 = v49;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v52 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&v14, *(void *)&v16, *(void *)&v50, *(void *)&v47];
      *(_DWORD *)buf = 138412290;
      double v124 = *(double *)&v52;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "newVisibleFrame after more scaling: %@", buf, 0xCu);
    }
  }
  double v110 = v47;
  double v53 = v105;
  double v120 = v16;
  double v54 = v14;
  if (rect <= v105)
  {
    uint64_t v55 = v103;
    double v56 = v104;
    double v57 = rect;
    double MinY = CGRectGetMinY(*(CGRect *)(&v53 - 2));
    v132.origin.CGFloat x = v14;
    v132.origin.CGFloat y = v16;
    v132.size.CGFloat width = v18;
    v132.size.CGFloat height = v20;
    double v120 = v16;
    double v54 = v14;
    if (MinY >= CGRectGetMidY(v132))
    {
      [v4 timeRect];
      double v54 = v14 + (v18 - v113) * 0.5;
      double v61 = v104 - (v59 * v110 + 0.0) + (rect - v110 * v60) * 0.25;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v62 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&v54, *(void *)&v61, *(void *)&v113, *(void *)&v110];
        *(_DWORD *)buf = 138412290;
        double v124 = *(double *)&v62;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "newVisibleFrame after centering: %@", buf, 0xCu);
      }
      if (v61 < v121)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          v63 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&v54, *(void *)&v121, *(void *)&v113, *(void *)&v110];
          *(_DWORD *)buf = 138412290;
          double v124 = *(double *)&v63;
          _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "newVisibleFrame after clamp 1: %@", buf, 0xCu);
        }
        double v120 = v121;
        goto LABEL_36;
      }
      double v64 = v14 + (v18 - v113) * 0.5;
      double v65 = v121 + v114;
      if (v110 + v61 <= v121 + v114)
      {
        double v120 = v61;
LABEL_36:
        double v48 = v106;
        goto LABEL_37;
      }
      double v66 = v65 - v110;
      double v48 = v106;
      double v120 = v65 - v110;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v67 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&v64, *(void *)&v66, *(void *)&v113, *(void *)&v110];
        *(_DWORD *)buf = 138412290;
        double v124 = *(double *)&v67;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "newVisibleFrame after clamp 2: %@", buf, 0xCu);
      }
    }
  }
LABEL_37:
  double v68 = v118;
  v133.origin.CGFloat x = v118;
  v133.origin.CGFloat y = v48;
  v133.size.CGFloat width = v109;
  double v69 = v116;
  v133.size.CGFloat height = v116;
  if (!CGRectIsNull(v133))
  {
    double v70 = v54;
    double v71 = sqrt(v109 * v116 / v42);
    double v69 = sqrt(v109 * v116 * v42);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v72 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&v118, *(void *)&v48, *(void *)&v71, *(void *)&v69];
      *(_DWORD *)buf = 138412290;
      double v124 = *(double *)&v72;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "newInactiveFrame after scaling: %@", buf, 0xCu);
    }
    double v48 = v121;
    if (v71 > v111 || v69 > v114)
    {
      PFSizeWithAspectRatioFittingSize();
      double v71 = v73;
      double v69 = v74;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v75 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&v118, *(void *)&v106, *(void *)&v71, *(void *)&v69];
        *(_DWORD *)buf = 138412290;
        double v124 = *(double *)&v75;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "newInactiveFrame after more scaling: %@", buf, 0xCu);
      }
    }
    double v68 = v118 + v70 - v14;
    double v76 = v106 + v120 - v16;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v77 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&v68, *(void *)&v76, *(void *)&v71, *(void *)&v69];
      *(_DWORD *)buf = 138412290;
      double v124 = *(double *)&v77;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "newInactiveFrame after offset: %@", buf, 0xCu);
    }
    double v109 = v71;
    if (v76 >= v121)
    {
      if (v76 + v69 <= v121 + v114)
      {
        double v48 = v76;
        goto LABEL_54;
      }
      double v48 = v121 + v114 - v69;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v78 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&v68, *(void *)&v48, *(void *)&v71, *(void *)&v69];
        *(_DWORD *)buf = 138412290;
        double v124 = *(double *)&v78;
        v79 = MEMORY[0x1E4F14500];
        v80 = "newInactiveFrame after clamp 2: %@";
        goto LABEL_52;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v78 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&v68, *(void *)&v121, *(void *)&v71, *(void *)&v69];
      *(_DWORD *)buf = 138412290;
      double v124 = *(double *)&v78;
      v79 = MEMORY[0x1E4F14500];
      v80 = "newInactiveFrame after clamp 1: %@";
LABEL_52:
      _os_log_impl(&dword_1A41FE000, v79, OS_LOG_TYPE_DEFAULT, v80, buf, 0xCu);
    }
LABEL_54:
    double v54 = v70;
  }
  double v117 = v69;
  double v119 = v68;
  double v122 = v48;
  [v4 timeRect];
  double v115 = v54;
  double v82 = v54 + v81 * v113;
  double v84 = v120 + v83 * v110;
  double v86 = v113 * v85;
  double v88 = v110 * v87;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v89 = (void *)[[NSString alloc] initWithFormat:@"{{%.2f, %.2f}, {%.2f, %.2f}}", *(void *)&v82, *(void *)&v84, *(void *)&v86, *(void *)&v88];
    *(_DWORD *)buf = 138412290;
    double v124 = *(double *)&v89;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "newTimeRect: %@", buf, 0xCu);
  }
  v90 = [PFPosterOrientedLayout alloc];
  [(PFPosterOrientedLayout *)self imageSize];
  double v112 = v91;
  double recta = v92;
  [v4 screenSize];
  double v94 = v93;
  double v96 = v95;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  double v98 = v97;
  double v100 = v99;
  v101 = [(PFPosterOrientedLayout *)self clockLayerOrder];
  uint64_t v7 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v90, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v101, [(PFPosterOrientedLayout *)self clockIntersection], [(PFPosterOrientedLayout *)self hasTopEdgeContact], 0, v112, recta, v94, v96, v98, v100, *(void *)&v115, *(void *)&v120, *(void *)&v113, *(void *)&v110, *(void *)&v119, *(void *)&v122,
         *(void *)&v109,
         *(void *)&v117,
         *(void *)&v82,
         *(void *)&v84,
         *(void *)&v86,
         *(void *)&v88);

LABEL_58:

  return v7;
}

- (id)layoutByUpdatingConfiguration:(id)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PFPosterOrientedLayout *)self configuration];
  int v6 = [v4 isEqualToLayoutConfiguration:v5];

  if (v6)
  {
    uint64_t v7 = self;
  }
  else
  {
    [(PFPosterOrientedLayout *)self visibleFrame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(PFPosterOrientedLayout *)self inactiveFrame];
    double v97 = v17;
    CGFloat v99 = v16;
    double v19 = v18;
    double v21 = v20;
    [(PFPosterOrientedLayout *)self timeFrame];
    double v23 = v22;
    double v25 = v24;
    v112.origin.CGFloat x = v9;
    v112.origin.CGFloat y = v11;
    v112.size.CGFloat width = v13;
    v112.size.CGFloat height = v15;
    double v93 = v25;
    if (CGRectIsEmpty(v112))
    {
      double v89 = v23;
      double v91 = v21;
      double v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v101 = *MEMORY[0x1E4F1DAD8];
      [(PFPosterOrientedLayout *)self imageSize];
      double v28 = v27;
      double v30 = v29;
      [(PFPosterOrientedLayout *)self deviceResolution];
      double v33 = v31;
      double v34 = v32;
      if (v31 == 0.0
        || v32 == 0.0
        || (v31 == *MEMORY[0x1E4F8A250] ? (BOOL v35 = v32 == *(double *)(MEMORY[0x1E4F8A250] + 8)) : (BOOL v35 = 0), v35))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218496;
          double v105 = v33;
          __int16 v106 = 2048;
          double v107 = v34;
          __int16 v108 = 2048;
          uint64_t v109 = 0x3FF0000000000000;
          _os_log_fault_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", buf, 0x20u);
        }
      }
      double v36 = v19;
      PFSizeWithAspectRatioFittingSize();
      double v13 = v37;
      double v15 = v38;
      double v95 = v101 + v28 * 0.5 + v37 * -0.5;
      double v102 = v26 + v30 * 0.5 + v38 * -0.5;
      double v23 = v89;
      double v21 = v91;
    }
    else
    {
      double v102 = v11;
      double v95 = v9;
      double v36 = v19;
    }
    [(PFPosterOrientedLayout *)self deviceResolution];
    double v40 = v39;
    double v42 = v41;
    [v4 screenSize];
    double v45 = v44 / v43;
    if (v44 / v43 <= v42 / v40)
    {
      if (v44 / v43 < v42 / v40)
      {
        double v54 = v13 * v45;
        [v4 timeRect];
        double v57 = v23 - (v55 * v54 + 0.0) + (v93 - v54 * v56) * 0.25;
        double v87 = v102;
        double v48 = v99;
        if (v57 >= v102)
        {
          double v87 = v23 - (v55 * v54 + 0.0) + (v93 - v54 * v56) * 0.25;
          if (v54 + v57 > v15 + v102) {
            double v87 = v15 + v102 - v54;
          }
        }
        v114.origin.CGFloat x = v99;
        v114.origin.CGFloat y = v36;
        v114.size.CGFloat width = v97;
        v114.size.CGFloat height = v21;
        BOOL IsNull = CGRectIsNull(v114);
        double v59 = v97 * v45;
        double v51 = v97;
        if (IsNull) {
          double v59 = v21;
        }
        double v90 = v59;
        double v92 = v97;
        double v15 = v13 * v45;
        double v47 = v95;
        double v94 = v95;
        double v52 = v102;
        double v53 = v87;
      }
      else
      {
        double v47 = v95;
        double v51 = v97;
        double v94 = v95;
        double v52 = v102;
        double v53 = v102;
        double v90 = v21;
        double v92 = v97;
        double v48 = v99;
      }
    }
    else
    {
      double v46 = v13;
      double v13 = v15 / v45;
      double v47 = v95;
      double v94 = v95 + (v46 - v15 / v45) * 0.5;
      double v48 = v99;
      v113.origin.CGFloat x = v99;
      v113.origin.CGFloat y = v36;
      v113.size.CGFloat width = v97;
      v113.size.CGFloat height = v21;
      BOOL v49 = CGRectIsNull(v113);
      double v50 = v21 / v45;
      double v51 = v97;
      if (v49) {
        double v50 = v97;
      }
      double v92 = v50;
      double v52 = v102;
      double v53 = v102;
      double v90 = v21;
    }
    double v98 = v13;
    double v60 = v48;
    double v61 = v36;
    double v62 = v21;
    BOOL v63 = CGRectIsNull(*(CGRect *)(&v51 - 2));
    double v64 = v94 - v47;
    if (v63) {
      double v64 = -0.0;
    }
    double v103 = v48 + v64;
    if (v63) {
      double v65 = -0.0;
    }
    else {
      double v65 = v53 - v52;
    }
    double v100 = v36 + v65;
    [v4 timeRect];
    double v96 = v94 + v66 * v13;
    double v86 = v13 * v68;
    double v88 = v53 + v67 * v15;
    double v70 = v15 * v69;
    double v71 = [PFPosterOrientedLayout alloc];
    [(PFPosterOrientedLayout *)self imageSize];
    double v84 = v73;
    double v85 = v72;
    [v4 screenSize];
    double v75 = v74;
    double v77 = v76;
    [(PFPosterOrientedLayout *)self parallaxPadding];
    double v79 = v78;
    double v81 = v80;
    double v82 = [(PFPosterOrientedLayout *)self clockLayerOrder];
    uint64_t v7 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v71, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v82, [(PFPosterOrientedLayout *)self clockIntersection], [(PFPosterOrientedLayout *)self hasTopEdgeContact], 0, v85, v84, v75, v77, v79, v81, *(void *)&v94, *(void *)&v53, *(void *)&v98, *(void *)&v15, *(void *)&v103, *(void *)&v100,
           *(void *)&v92,
           *(void *)&v90,
           *(void *)&v96,
           *(void *)&v88,
           *(void *)&v86,
           *(void *)&v70);
  }

  return v7;
}

- (id)layoutByUpdatingNormalizedVisibleFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PFPosterOrientedLayout *)self imageExtent];
  double v10 = v8 + x * v9;
  double v13 = v11 + y * v12;
  double v14 = width * v9;
  double v15 = height * v12;

  return -[PFPosterOrientedLayout layoutByUpdatingVisibleFrame:](self, "layoutByUpdatingVisibleFrame:", v10, v13, v14, v15);
}

- (id)layoutByUpdatingImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PFPosterOrientedLayout *)self imageSize];
  if (width == v7 && height == v6)
  {
    double v60 = self;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(PFPosterOrientedLayout *)self imageSize];
    double v12 = v11;
    double v14 = v13;
    [(PFPosterOrientedLayout *)self imageSize];
    double v71 = v15;
    [(PFPosterOrientedLayout *)self parallaxPadding];
    double v78 = v17;
    double v80 = v16;
    [(PFPosterOrientedLayout *)self visibleFrame];
    double v83 = v9;
    double v22 = v21 - v9;
    double v23 = 0.0;
    double v24 = 0.0;
    if (v12 != 0.0)
    {
      double v22 = v22 / v12;
      double v24 = v19 / v12;
    }
    double v74 = v24;
    double v25 = v18 - v10;
    if (v14 != 0.0)
    {
      double v25 = v25 / v14;
      double v23 = v20 / v14;
    }
    double v72 = v23;
    double v82 = height;
    [(PFPosterOrientedLayout *)self inactiveFrame];
    double v30 = v29 - v83;
    double v31 = 0.0;
    double v32 = 0.0;
    if (v12 != 0.0)
    {
      double v30 = v30 / v12;
      double v32 = v27 / v12;
    }
    double v67 = v32;
    double v33 = v10;
    double v34 = v26 - v10;
    if (v14 != 0.0)
    {
      double v34 = v34 / v14;
      double v31 = v28 / v14;
    }
    double v69 = v31;
    double v77 = v83 + v22 * width;
    double v75 = width * v74;
    double v76 = v33 + v25 * v82;
    double v73 = v82 * v72;
    double v35 = width / v71;
    [(PFPosterOrientedLayout *)self timeFrame];
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v65 = v42;
    [(PFPosterOrientedLayout *)self visibleFrame];
    double v47 = v37 - v46;
    double v48 = 0.0;
    double v49 = 0.0;
    if (v44 != 0.0)
    {
      double v47 = v47 / v44;
      double v49 = v41 / v44;
    }
    double v79 = v78 * v35;
    double v81 = v80 * v35;
    double v84 = v83 + v30 * width;
    double v50 = v39 - v43;
    double v68 = width * v67;
    double v70 = v82 * v69;
    if (v45 != 0.0)
    {
      double v50 = v50 / v45;
      double v48 = v65 / v45;
    }
    double v64 = v76 + v50 * v73;
    double v66 = v77 + v47 * v75;
    double v51 = v75 * v49;
    double v52 = v73 * v48;
    double v53 = [PFPosterOrientedLayout alloc];
    [(PFPosterOrientedLayout *)self deviceResolution];
    double v62 = v55;
    double v63 = v54;
    double v56 = [(PFPosterOrientedLayout *)self clockLayerOrder];
    unint64_t v57 = [(PFPosterOrientedLayout *)self clockIntersection];
    BOOL v58 = [(PFPosterOrientedLayout *)self hasTopEdgeContact];
    double v59 = [(PFPosterOrientedLayout *)self debugLayouts];
    double v60 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v53, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v56, v57, v58, v59, width, v82, v63, v62, v81, v79, *(void *)&v77, *(void *)&v76, *(void *)&v75, *(void *)&v73, *(void *)&v84, v33 + v34 * v82,
            *(void *)&v68,
            *(void *)&v70,
            *(void *)&v66,
            *(void *)&v64,
            *(void *)&v51,
            *(void *)&v52);
  }

  return v60;
}

- (id)layoutByUpdatingClockIntersection:(unint64_t)a3
{
  if ([(PFPosterOrientedLayout *)self clockIntersection] == a3)
  {
    uint64_t v5 = self;
  }
  else
  {
    double v6 = [PFPosterOrientedLayout alloc];
    [(PFPosterOrientedLayout *)self imageSize];
    double v45 = v8;
    double v46 = v7;
    [(PFPosterOrientedLayout *)self deviceResolution];
    double v44 = v9;
    double v43 = v10;
    [(PFPosterOrientedLayout *)self parallaxPadding];
    double v41 = v12;
    double v42 = v11;
    [(PFPosterOrientedLayout *)self visibleFrame];
    uint64_t v39 = v14;
    uint64_t v40 = v13;
    uint64_t v37 = v16;
    uint64_t v38 = v15;
    [(PFPosterOrientedLayout *)self inactiveFrame];
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    [(PFPosterOrientedLayout *)self timeFrame];
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    double v33 = [(PFPosterOrientedLayout *)self clockLayerOrder];
    BOOL v34 = [(PFPosterOrientedLayout *)self hasTopEdgeContact];
    double v35 = [(PFPosterOrientedLayout *)self debugLayouts];
    uint64_t v5 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v6, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v33, a3, v34, v35, v46, v45, v44, v43, v42, v41, v40, v39, v38, v37, v18, v20,
           v22,
           v24,
           v26,
           v28,
           v30,
           v32);
  }

  return v5;
}

- (id)layoutByUpdatingClockLayerOrder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PFPosterOrientedLayout *)self clockLayerOrder];
  int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    double v7 = self;
  }
  else
  {
    double v8 = [PFPosterOrientedLayout alloc];
    [(PFPosterOrientedLayout *)self imageSize];
    double v47 = v10;
    double v48 = v9;
    [(PFPosterOrientedLayout *)self deviceResolution];
    double v45 = v12;
    double v46 = v11;
    [(PFPosterOrientedLayout *)self parallaxPadding];
    double v43 = v14;
    double v44 = v13;
    [(PFPosterOrientedLayout *)self visibleFrame];
    uint64_t v41 = v16;
    uint64_t v42 = v15;
    uint64_t v39 = v18;
    uint64_t v40 = v17;
    [(PFPosterOrientedLayout *)self inactiveFrame];
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    [(PFPosterOrientedLayout *)self timeFrame];
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    unint64_t v35 = [(PFPosterOrientedLayout *)self clockIntersection];
    BOOL v36 = [(PFPosterOrientedLayout *)self hasTopEdgeContact];
    uint64_t v37 = [(PFPosterOrientedLayout *)self debugLayouts];
    double v7 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v8, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v4, v35, v36, v37, v48, v47, v46, v45, v44, v43, v42, v41, v40, v39, v20, v22,
           v24,
           v26,
           v28,
           v30,
           v32,
           v34);
  }

  return v7;
}

- (id)layoutByUpdatingInactiveFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v4 = [PFPosterOrientedLayout alloc];
  [(PFPosterOrientedLayout *)self imageSize];
  double v34 = v6;
  double v35 = v5;
  [(PFPosterOrientedLayout *)self deviceResolution];
  double v32 = v8;
  double v33 = v7;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  double v30 = v10;
  double v31 = v9;
  [(PFPosterOrientedLayout *)self visibleFrame];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  [(PFPosterOrientedLayout *)self timeFrame];
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v27 = [(PFPosterOrientedLayout *)self clockLayerOrder];
  uint64_t v28 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v4, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v27, [(PFPosterOrientedLayout *)self clockIntersection], [(PFPosterOrientedLayout *)self hasTopEdgeContact], 0, v35, v34, v33, v32, v31, v30, v12, v14, v16, v18, *(void *)&x, *(void *)&y,
          *(void *)&width,
          *(void *)&height,
          v20,
          v22,
          v24,
          v26);

  return v28;
}

- (id)layoutByUpdatingVisibleFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3)
    || (v107.origin.double x = x, v107.origin.y = y, v107.size.width = width, v107.size.height = height, CGRectIsInfinite(v107)))
  {
    double v96 = (PFPosterOrientedLayout *)_PFAssertFailHandler();
    return [(PFPosterOrientedLayout *)v96 configuration];
  }
  else
  {
    [(PFPosterOrientedLayout *)self extendedImageExtent];
    double v104 = height;
    double v11 = y + height;
    double v13 = v8 + v12;
    if (x + width >= v13) {
      double v14 = v13;
    }
    else {
      double v14 = x + width;
    }
    if (v8 >= v14) {
      double v14 = v8;
    }
    double v15 = v9 + v10;
    if (v11 >= v15) {
      double v16 = v15;
    }
    else {
      double v16 = y + height;
    }
    if (v9 >= v16) {
      double v16 = v9;
    }
    double v17 = y + v16 - v11;
    if (x + v14 - (x + width) < v13) {
      double v13 = x + v14 - (x + width);
    }
    if (v8 >= v13) {
      double v18 = v8;
    }
    else {
      double v18 = v13;
    }
    if (v17 >= v15) {
      double v19 = v15;
    }
    else {
      double v19 = v17;
    }
    if (v9 >= v19) {
      double v19 = v9;
    }
    double v105 = v19;
    [(PFPosterOrientedLayout *)self visibleFrame];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    [(PFPosterOrientedLayout *)self imageExtent];
    double v32 = v21 - v31;
    double v33 = 0.0;
    double v34 = 0.0;
    if (v29 != 0.0)
    {
      double v32 = v32 / v29;
      double v34 = v25 / v29;
    }
    double v35 = v23 - v28;
    if (v30 != 0.0)
    {
      double v35 = v35 / v30;
      double v33 = v27 / v30;
    }
    [(PFPosterOrientedLayout *)self screenExtent];
    v108.origin.double x = v36 + v32 * v37;
    v108.origin.double y = v38 + v35 * v39;
    v108.size.double width = v34 * v37;
    v108.size.double height = v33 * v39;
    CGRect v109 = CGRectIntegral(v108);
    CGFloat v40 = v109.origin.x;
    CGFloat v41 = v109.origin.y;
    CGFloat v42 = v109.size.width;
    CGFloat v43 = v109.size.height;
    [(PFPosterOrientedLayout *)self imageExtent];
    double v103 = v18;
    double v48 = v18 - v47;
    double v49 = 0.0;
    double v50 = 0.0;
    if (v45 != 0.0)
    {
      double v48 = v48 / v45;
      double v50 = width / v45;
    }
    double v102 = width;
    double v51 = v105 - v44;
    if (v46 != 0.0)
    {
      double v51 = v51 / v46;
      double v49 = v104 / v46;
    }
    [(PFPosterOrientedLayout *)self screenExtent];
    v110.origin.double x = v52 + v48 * v53;
    v110.origin.double y = v54 + v51 * v55;
    v110.size.double width = v50 * v53;
    v110.size.double height = v49 * v55;
    CGRect v112 = CGRectIntegral(v110);
    v111.origin.double x = v40;
    v111.origin.double y = v41;
    v111.size.double width = v42;
    v111.size.double height = v43;
    if (CGRectEqualToRect(v111, v112))
    {
      double v56 = self;
    }
    else
    {
      [(PFPosterOrientedLayout *)self timeFrame];
      double v58 = v57;
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      [(PFPosterOrientedLayout *)self visibleFrame];
      double v69 = v58 - v68;
      double v70 = 0.0;
      double v71 = 0.0;
      if (v66 != 0.0)
      {
        double v69 = v69 / v66;
        double v71 = v62 / v66;
      }
      double v72 = v60 - v65;
      if (v67 != 0.0)
      {
        double v72 = v72 / v67;
        double v70 = v64 / v67;
      }
      double v73 = v103 + v69 * v102;
      double v74 = v105 + v72 * v104;
      double v75 = v102 * v71;
      double v76 = v104 * v70;
      [(PFPosterOrientedLayout *)self visibleFrame];
      double v78 = v77;
      double v80 = v79;
      [(PFPosterOrientedLayout *)self parallaxPadding];
      double v100 = v74;
      double v101 = v73;
      double v98 = v76;
      double v99 = v75;
      if (v78 != 0.0 && v80 != 0.0 && (v78 != *MEMORY[0x1E4F8A250] || v80 != *(double *)(MEMORY[0x1E4F8A250] + 8)))
      {
        double v81 = v81 * (v102 / v78);
        double v82 = v82 * (v104 / v80);
      }
      double v83 = v81;
      double v84 = v82;
      double v85 = [PFPosterOrientedLayout alloc];
      [(PFPosterOrientedLayout *)self imageSize];
      double v87 = v86;
      double v89 = v88;
      [(PFPosterOrientedLayout *)self deviceResolution];
      double v91 = v90;
      double v93 = v92;
      BOOL v94 = [(PFPosterOrientedLayout *)self hasTopEdgeContact];
      double v56 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v85, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", 0, 0, v94, 0, v87, v89, v91, v93, v83, v84, *(void *)&v103, *(void *)&v105, *(void *)&v102, *(void *)&v104, *MEMORY[0x1E4F1DB20], *(void *)(MEMORY[0x1E4F1DB20] + 8),
              *(void *)(MEMORY[0x1E4F1DB20] + 16),
              *(void *)(MEMORY[0x1E4F1DB20] + 24),
              *(void *)&v101,
              *(void *)&v100,
              *(void *)&v99,
              *(void *)&v98);
    }
    return v56;
  }
}

- (PFParallaxLayoutConfiguration)configuration
{
  double x = self->_timeFrame.origin.x;
  double y = self->_timeFrame.origin.y;
  double width = self->_timeFrame.size.width;
  double v6 = self->_visibleFrame.size.width;
  double height = self->_visibleFrame.size.height;
  double v8 = x - self->_visibleFrame.origin.x;
  double v9 = 0.0;
  double v10 = 0.0;
  if (v6 != 0.0)
  {
    double v8 = v8 / v6;
    double v10 = width / v6;
  }
  double v28 = v10;
  double v11 = self->_timeFrame.size.height;
  double v12 = y - self->_visibleFrame.origin.y;
  if (height != 0.0)
  {
    double v12 = v12 / height;
    double v9 = v11 / height;
  }
  double v29 = v9;
  double v14 = self->_inactiveFrame.size.width;
  double v13 = self->_inactiveFrame.size.height;
  double v15 = x - self->_inactiveFrame.origin.x;
  double v16 = 0.0;
  double v17 = 0.0;
  if (v14 != 0.0)
  {
    double v15 = v15 / v14;
    double v17 = width / v14;
  }
  double v18 = y - self->_inactiveFrame.origin.y;
  if (v13 != 0.0)
  {
    double v18 = v18 / v13;
    double v16 = v11 / v13;
  }
  double v19 = [PFParallaxLayoutConfiguration alloc];
  [(PFPosterOrientedLayout *)self screenExtent];
  double v21 = v20;
  double v23 = v22;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  double v26 = -[PFParallaxLayoutConfiguration initWithScreenSize:timeRect:inactiveTimeRect:parallaxPadding:](v19, "initWithScreenSize:timeRect:inactiveTimeRect:parallaxPadding:", v21, v23, v8, v12, v28, v29, *(void *)&v15, *(void *)&v18, *(void *)&v17, *(void *)&v16, v24, v25);

  return v26;
}

- (BOOL)canApplyHeadroom
{
  return ![(PFPosterOrientedLayout *)self hasTopEdgeContact];
}

- (CGRect)parallaxInactiveFrame
{
  [(PFPosterOrientedLayout *)self parallaxPadding];
  double v4 = v3;
  [(PFPosterOrientedLayout *)self visibleFrame];
  double v6 = v4 / v5;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  double v8 = v7;
  [(PFPosterOrientedLayout *)self visibleFrame];
  double v10 = v8 / v9;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  double v12 = v11;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  double v14 = v13;
  [(PFPosterOrientedLayout *)self inactiveFrame];
  CGRect v33 = CGRectInset(v32, -(v12 * v6), -(v14 * v10));
  CGFloat x = v33.origin.x;
  CGFloat y = v33.origin.y;
  CGFloat width = v33.size.width;
  CGFloat height = v33.size.height;
  [(PFPosterOrientedLayout *)self imageExtent];
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  CGFloat v27 = x;
  CGFloat v28 = y;
  CGFloat v29 = width;
  CGFloat v30 = height;

  return CGRectIntersection(*(CGRect *)&v27, *(CGRect *)&v20);
}

- (CGRect)parallaxVisibleFrame
{
  [(PFPosterOrientedLayout *)self visibleFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  CGFloat v12 = -v11;
  [(PFPosterOrientedLayout *)self parallaxPadding];
  CGFloat v14 = -v13;
  v32.origin.CGFloat x = v4;
  v32.origin.CGFloat y = v6;
  v32.size.CGFloat width = v8;
  v32.size.CGFloat height = v10;
  CGRect v33 = CGRectInset(v32, v12, v14);
  CGFloat x = v33.origin.x;
  CGFloat y = v33.origin.y;
  CGFloat width = v33.size.width;
  CGFloat height = v33.size.height;
  [(PFPosterOrientedLayout *)self imageExtent];
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  CGFloat v27 = x;
  CGFloat v28 = y;
  CGFloat v29 = width;
  CGFloat v30 = height;

  return CGRectIntersection(*(CGRect *)&v27, *(CGRect *)&v20);
}

- (CGRect)normalizedVisibleFrame
{
  [(PFPosterOrientedLayout *)self visibleFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PFPosterOrientedLayout *)self imageExtent];
  double v13 = v12;
  double v15 = v14;
  double v17 = v4 - v16;
  double v18 = 0.0;
  BOOL v19 = v12 == 0.0;
  double v20 = 0.0;
  if (!v19)
  {
    double v17 = v17 / v13;
    double v20 = v8 / v13;
  }
  double v21 = v6 - v11;
  if (v15 != 0.0)
  {
    double v21 = v21 / v15;
    double v18 = v10 / v15;
  }
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)extendedImageExtent
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PFPosterOrientedLayout *)self extendedImageSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = v2;
  double v9 = v3;
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (CGSize)extendedImageSize
{
  if (PFPosterEnableHeadroom() && [(PFPosterOrientedLayout *)self canApplyHeadroom])
  {
    [(PFPosterOrientedLayout *)self imageExtent];
    double v4 = v3;
    [(PFPosterOrientedLayout *)self imageExtent];
    double v6 = v5 * 1.35;
  }
  else
  {
    [(PFPosterOrientedLayout *)self imageExtent];
    double v4 = v7;
    [(PFPosterOrientedLayout *)self imageExtent];
    double v6 = v8;
  }
  double v9 = v4;
  result.CGFloat height = v6;
  result.CGFloat width = v9;
  return result;
}

- (CGRect)screenExtent
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PFPosterOrientedLayout *)self deviceResolution];
  double v5 = v4;
  double v7 = v6;
  double v8 = v2;
  double v9 = v3;
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (CGRect)imageExtent
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PFPosterOrientedLayout *)self imageSize];
  double v5 = v4;
  double v7 = v6;
  double v8 = v2;
  double v9 = v3;
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (int64_t)orientation
{
  if (self->_deviceResolution.width <= self->_deviceResolution.height) {
    return 1;
  }
  else {
    return 2;
  }
}

- (uint64_t)initWithImageSize:(uint64_t)a3 deviceResolution:(uint64_t)a4 parallaxPadding:(uint64_t)a5 visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:debugLayouts:
{
  return objc_msgSend(a1, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", a3, a4, 0, a5);
}

- (char)initWithImageSize:(double)a3 deviceResolution:(double)a4 parallaxPadding:(double)a5 visibleFrame:(double)a6 inactiveFrame:(double)a7 timeFrame:(uint64_t)a8 clockLayerOrder:(void *)a9 clockIntersection:(uint64_t)a10 hasTopEdgeContact:(char)a11 debugLayouts:(void *)a12
{
  id v32 = a9;
  id v33 = a12;
  v40.receiver = a1;
  v40.super_class = (Class)PFPosterOrientedLayout;
  double v34 = (char *)objc_msgSendSuper2(&v40, sel_init);
  *((double *)v34 + 5) = a2;
  *((double *)v34 + 6) = a3;
  *((double *)v34 + 7) = a4;
  *((double *)v34 + 8) = a5;
  *((double *)v34 + 9) = a6;
  *((double *)v34 + 10) = a7;
  *(_OWORD *)(v34 + 88) = a15;
  *((void *)v34 + 13) = a16;
  *((void *)v34 + 14) = a17;
  *(_OWORD *)(v34 + 120) = a18;
  *((void *)v34 + 17) = a19;
  *((void *)v34 + 18) = a20;
  *(_OWORD *)(v34 + 152) = a21;
  *((void *)v34 + 21) = a22;
  *((void *)v34 + 22) = a23;
  objc_storeStrong((id *)v34 + 2, a9);
  *((void *)v34 + 3) = a10;
  v34[8] = a11;
  if (v33)
  {
    uint64_t v35 = [v33 copy];
    double v36 = (void *)*((void *)v34 + 4);
    *((void *)v34 + 4) = v35;
  }
  else
  {
    double v36 = (void *)*((void *)v34 + 4);
    *((void *)v34 + 4) = MEMORY[0x1E4F1CBF0];
  }

  return v34;
}

+ (id)layoutWithDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  CGSize v37 = (CGSize)*MEMORY[0x1E4F1DB30];
  CGSize size = v37;
  CGSize v30 = v37;
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  rect.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  rect.CGSize size = v4;
  v35.CGPoint origin = rect.origin;
  v35.CGSize size = v4;
  CGSize v27 = v4;
  CGPoint origin = rect.origin;
  v34.CGPoint origin = rect.origin;
  v34.CGSize size = v4;
  CFDictionaryRef v5 = [v3 objectForKeyedSubscript:@"imageSize"];
  BOOL v6 = !v5
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !CGSizeMakeWithDictionaryRepresentation(v5, &size);
  BOOL v31 = v6;

  CFDictionaryRef v7 = [v3 objectForKeyedSubscript:@"deviceResolution"];
  BOOL v8 = !v7
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !CGSizeMakeWithDictionaryRepresentation(v7, &v37);
  BOOL v29 = v8;

  CFDictionaryRef v9 = [v3 objectForKeyedSubscript:@"visibleFrame"];
  BOOL v10 = !v9
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     || !CGRectMakeWithDictionaryRepresentation(v9, &rect);

  CFDictionaryRef v11 = [v3 objectForKeyedSubscript:@"inactiveFrame"];
  BOOL v12 = v11
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     && CGRectMakeWithDictionaryRepresentation(v11, &v35);

  CFDictionaryRef v13 = [v3 objectForKeyedSubscript:@"timeFrame"];
  BOOL v14 = !v13
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     || !CGRectMakeWithDictionaryRepresentation(v13, &v34);

  double v15 = [v3 objectForKeyedSubscript:@"clockLayerOrder"];
  double v16 = PFParallaxLayoutClockLayerOrderNamed(v15);

  double v17 = [v3 objectForKeyedSubscript:@"clockIntersection"];
  uint64_t v18 = [v17 integerValue];

  CGSize v33 = v30;
  CFDictionaryRef v19 = [v3 objectForKeyedSubscript:@"parallaxPadding"];
  double v20 = [v3 objectForKeyedSubscript:@"hasTopEdgeContact"];
  uint64_t v21 = [v20 BOOLValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v22 = CGSizeMakeWithDictionaryRepresentation(v19, &v33);
    if (v12) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v22 = v19 != 0;
    [(__CFDictionary *)v19 doubleValue];
    v33.CGFloat width = v23;
    v33.CGFloat height = v23;
    if (v12) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  BOOL v22 = 0;
  if (!v12)
  {
LABEL_28:
    v35.CGPoint origin = origin;
    v35.CGSize size = v27;
  }
LABEL_29:
  if (v31 || v29 || v10 || v14 || !v22)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to read layout data", buf, 2u);
    }
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v24 = [PFPosterOrientedLayout alloc];
    uint64_t v25 = -[PFPosterOrientedLayout initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:](v24, "initWithImageSize:deviceResolution:parallaxPadding:visibleFrame:inactiveFrame:timeFrame:clockLayerOrder:clockIntersection:hasTopEdgeContact:debugLayouts:", v16, v18, v21, 0, size.width, size.height, v37.width, v37.height, v33.width, v33.height, *(void *)&rect.origin.x, *(void *)&rect.origin.y, *(void *)&rect.size.width, *(void *)&rect.size.height, *(void *)&v35.origin.x, *(void *)&v35.origin.y,
            *(void *)&v35.size.width,
            *(void *)&v35.size.height,
            *(void *)&v34.origin.x,
            *(void *)&v34.origin.y,
            *(void *)&v34.size.width,
            *(void *)&v34.size.height);
  }

  return v25;
}

@end