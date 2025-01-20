@interface _UIFocusMapSnapshotDebugInfo
+ (id)_summaryImageForDebugInfoArray:(id)a3 forFocusMovementWithInfo:(id)a4 scaleFactor:(double)a5;
- (CGPoint)imageAnchorPoint;
- (CGRect)_rectContainingAllFocusRegions;
- (UIImage)image;
- (_UIFocusMapSearchInfo)focusMapSearchInfo;
- (_UIFocusMapSnapshot)snapshot;
- (_UIFocusMapSnapshotDebugInfo)initWithSnapshot:(id)a3 focusMapSearchInfo:(id)a4;
- (id)_drawImage;
@end

@implementation _UIFocusMapSnapshotDebugInfo

- (_UIFocusMapSnapshotDebugInfo)initWithSnapshot:(id)a3 focusMapSearchInfo:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshotDebugInfo.m", 35, @"Invalid parameter not satisfying: %@", @"snapshot" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIFocusMapSnapshotDebugInfo;
  v10 = [(_UIFocusMapSnapshotDebugInfo *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_snapshot, a3);
    objc_storeWeak((id *)&v11->_focusMapSearchInfo, v9);
  }

  return v11;
}

- (UIImage)image
{
  image = self->_image;
  if (!image)
  {
    v4 = [(_UIFocusMapSnapshotDebugInfo *)self _drawImage];
    v5 = self->_image;
    self->_image = v4;

    image = self->_image;
  }
  return image;
}

- (CGPoint)imageAnchorPoint
{
  id v3 = [(_UIFocusMapSnapshotDebugInfo *)self image];
  double x = self->_imageAnchorPoint.x;
  double y = self->_imageAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)_rectContainingAllFocusRegions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(_UIFocusMapSnapshotDebugInfo *)self snapshot];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v7 = objc_msgSend(v2, "regions", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        [v2 snapshotFrameForRegion:*(void *)(*((void *)&v20 + 1) + 8 * v11)];
        v29.origin.CGFloat x = v12;
        v29.origin.CGFloat y = v13;
        v29.size.CGFloat width = v14;
        v29.size.CGFloat height = v15;
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        CGRect v27 = CGRectUnion(v26, v29);
        CGFloat x = v27.origin.x;
        CGFloat y = v27.origin.y;
        CGFloat width = v27.size.width;
        CGFloat height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (id)_drawImage
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v3 = [(_UIFocusMapSnapshotDebugInfo *)self snapshot];
  v4 = [v3 mapArea];
  v5 = [v4 coordinateSpace];

  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v14 = [v3 _searchArea];
  [v14 frame];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  CGFloat v86 = v18;
  CGFloat v87 = v16;
  v96.origin.CGFloat x = v16;
  v96.origin.CGFloat y = v18;
  CGFloat v84 = v22;
  CGFloat v85 = v20;
  v96.size.CGFloat width = v20;
  v96.size.CGFloat height = v22;
  v112.origin.CGFloat x = v7;
  v112.origin.CGFloat y = v9;
  v112.size.CGFloat width = v11;
  v112.size.CGFloat height = v13;
  BOOL v23 = CGRectEqualToRect(v96, v112);
  [(_UIFocusMapSnapshotDebugInfo *)self _rectContainingAllFocusRegions];
  CGFloat x = v24;
  CGFloat y = v25;
  CGFloat width = v26;
  CGFloat height = v27;
  if (v5)
  {
    v113.origin.CGFloat x = v7;
    v113.origin.CGFloat y = v9;
    v113.size.CGFloat width = v11;
    v113.size.CGFloat height = v13;
    CGRect v97 = CGRectUnion(*(CGRect *)&v24, v113);
    CGFloat x = v97.origin.x;
    CGFloat y = v97.origin.y;
    CGFloat width = v97.size.width;
    CGFloat height = v97.size.height;
  }
  v32 = [v3 focusedRegion];

  if (v32)
  {
    v33 = [v3 focusedRegion];
    [v3 snapshotFrameForRegion:v33];
    v114.origin.CGFloat x = v34;
    v114.origin.CGFloat y = v35;
    v114.size.CGFloat width = v36;
    v114.size.CGFloat height = v37;
    v98.origin.CGFloat x = x;
    v98.origin.CGFloat y = y;
    v98.size.CGFloat width = width;
    v98.size.CGFloat height = height;
    CGRect v99 = CGRectUnion(v98, v114);
    CGFloat x = v99.origin.x;
    CGFloat y = v99.origin.y;
    CGFloat width = v99.size.width;
    CGFloat height = v99.size.height;
  }
  if (!v23)
  {
    v38 = [v3 _searchArea];
    [v38 frame];
    v115.origin.CGFloat x = v39;
    v115.origin.CGFloat y = v40;
    v115.size.CGFloat width = v41;
    v115.size.CGFloat height = v42;
    v100.origin.CGFloat x = x;
    v100.origin.CGFloat y = y;
    v100.size.CGFloat width = width;
    v100.size.CGFloat height = height;
    CGRect v101 = CGRectUnion(v100, v115);
    CGFloat x = v101.origin.x;
    CGFloat y = v101.origin.y;
    CGFloat width = v101.size.width;
    CGFloat height = v101.size.height;
  }
  v102.origin.CGFloat x = x;
  v102.origin.CGFloat y = y;
  v102.size.CGFloat width = width;
  v102.size.CGFloat height = height;
  CGRect v103 = CGRectInset(v102, -90.0, -60.0);
  double v43 = v103.origin.x;
  double v44 = v103.origin.y;
  CGFloat v45 = v103.size.width;
  CGFloat v46 = v103.size.height;
  _UIGraphicsBeginImageContextWithOptions(0, 0, v103.size.width, v103.size.height, 0.0);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    v48 = 0;
  }
  else {
    v48 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  id v49 = +[UIColor whiteColor];
  CGContextSetFillColorWithColor(v48, (CGColorRef)[v49 CGColor]);

  v104.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v104.origin.CGFloat y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  v104.size.CGFloat width = v45;
  v104.size.CGFloat height = v46;
  CGContextFillRect(v48, v104);
  CGContextTranslateCTM(v48, -v43, -v44);
  v50 = +[UIScreen mainScreen];
  v51 = [v50 _preferredFocusedWindow];

  if (v51)
  {
    [v51 frame];
    _UIGraphicsBeginImageContextWithOptions(0, 0, v52, v53, 0.0);
    [v51 bounds];
    objc_msgSend(v51, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
    v54 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();
    if (v54)
    {
      [v51 frame];
      objc_msgSend(v54, "drawInRect:blendMode:alpha:", 0);
    }
  }
  if (v5)
  {
    v105.origin.CGFloat x = v7;
    v105.origin.CGFloat y = v9;
    v105.size.CGFloat width = v11;
    v105.size.CGFloat height = v13;
    CGFloat v55 = CGRectGetMidX(v105) - v43;
    v106.origin.CGFloat x = v7;
    v106.origin.CGFloat y = v9;
    v106.size.CGFloat width = v11;
    v106.size.CGFloat height = v13;
    CGFloat MidY = CGRectGetMidY(v106);
    self->_imageAnchorPoint.CGFloat x = v55;
    self->_imageAnchorPoint.CGFloat y = MidY - v43;
    CGContextSaveGState(v48);
    id v57 = +[UIColor blackColor];
    CGContextSetStrokeColorWithColor(v48, (CGColorRef)[v57 CGColor]);

    v107.origin.CGFloat x = v7;
    v107.origin.CGFloat y = v9;
    v107.size.CGFloat width = v11;
    v107.size.CGFloat height = v13;
    CGContextStrokeRect(v48, v107);
    CGContextRestoreGState(v48);
  }
  v58 = objc_msgSend(v3, "focusedRegion", v51);

  if (v58)
  {
    v59 = [v3 focusedRegion];
    [v3 snapshotFrameForRegion:v59];
    CGFloat v61 = v60;
    CGFloat v63 = v62;
    CGFloat v65 = v64;
    CGFloat v67 = v66;

    CGContextSaveGState(v48);
    v68 = +[UIColor redColor];
    id v69 = [v68 colorWithAlphaComponent:0.5];
    CGContextSetFillColorWithColor(v48, (CGColorRef)[v69 CGColor]);

    v108.origin.CGFloat x = v61;
    v108.origin.CGFloat y = v63;
    v108.size.CGFloat width = v65;
    v108.size.CGFloat height = v67;
    CGContextFillRect(v48, v108);
    id v70 = +[UIColor redColor];
    CGContextSetStrokeColorWithColor(v48, (CGColorRef)[v70 CGColor]);

    CGContextSetLineWidth(v48, 4.0);
    v109.origin.CGFloat x = v61;
    v109.origin.CGFloat y = v63;
    v109.size.CGFloat width = v65;
    v109.size.CGFloat height = v67;
    CGContextStrokeRect(v48, v109);
    CGContextRestoreGState(v48);
  }
  v88 = v5;
  if (!v23)
  {
    CGContextSaveGState(v48);
    v71 = +[UIColor redColor];
    id v72 = [v71 colorWithAlphaComponent:0.1];
    CGContextSetFillColorWithColor(v48, (CGColorRef)[v72 CGColor]);

    v110.origin.CGFloat y = v86;
    v110.origin.CGFloat x = v87;
    v110.size.CGFloat height = v84;
    v110.size.CGFloat width = v85;
    CGContextFillRect(v48, v110);
    CGContextRestoreGState(v48);
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v73 = [v3 regions];
  uint64_t v74 = [v73 countByEnumeratingWithState:&v89 objects:v93 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v75; ++i)
      {
        if (*(void *)v90 != v76) {
          objc_enumerationMutation(v73);
        }
        uint64_t v78 = *(void *)(*((void *)&v89 + 1) + 8 * i);
        CGContextSaveGState(v48);
        +[_UIFocusRegionDebugQuickLook drawDebugQuickLookImageForRegion:v78 withInfo:self inContext:v48];
        CGContextRestoreGState(v48);
      }
      uint64_t v75 = [v73 countByEnumeratingWithState:&v89 objects:v93 count:16];
    }
    while (v75);
  }

  if (!v23)
  {
    CGContextSaveGState(v48);
    v79 = +[UIColor redColor];
    id v80 = [v79 colorWithAlphaComponent:0.5];
    CGContextSetStrokeColorWithColor(v48, (CGColorRef)[v80 CGColor]);

    CGContextSetLineDash(v48, 0.0, &_drawImage_dashedLineLength, 1uLL);
    CGContextSetLineWidth(v48, 4.0);
    v111.origin.CGFloat y = v86;
    v111.origin.CGFloat x = v87;
    v111.size.CGFloat height = v84;
    v111.size.CGFloat width = v85;
    CGContextStrokeRect(v48, v111);
    CGContextRestoreGState(v48);
  }
  v81 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();

  return v81;
}

+ (id)_summaryImageForDebugInfoArray:(id)a3 forFocusMovementWithInfo:(id)a4 scaleFactor:(double)a5
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    double v10 = 0;
    goto LABEL_74;
  }
  if (v8) {
    unint64_t v9 = [v8 heading];
  }
  else {
    unint64_t v9 = 0;
  }
  double v89 = a5;
  id v90 = v8;
  unint64_t v101 = [v7 count];
  uint64_t v94 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
  double v11 = *MEMORY[0x1E4F1DB30];
  double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v91 = v7;
  obuint64_t j = v7;
  uint64_t v13 = [obj countByEnumeratingWithState:&v106 objects:v113 count:16];
  if (!v13)
  {
    LOBYTE(v23) = 1;
    double v21 = 0.0;
    double v22 = 0.0;
    int v24 = 1;
    goto LABEL_32;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v107;
  BOOL v17 = (v9 & 3) != 0 || v9 == 0;
  BOOL v97 = v17;
  uint64_t v18 = (v9 >> 3) & 1;
  uint64_t v19 = (v9 >> 1) & 1;
  char v20 = 1;
  double v21 = 0.0;
  double v22 = 0.0;
  uint64_t v23 = 1;
  LOBYTE(v24) = 1;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v107 != v15) {
        objc_enumerationMutation(obj);
      }
      double v26 = *(void **)(*((void *)&v106 + 1) + 8 * i);
      double v27 = [v26 image];
      [v26 imageAnchorPoint];
      double v29 = v28;
      double v31 = v30;
      if (v20)
      {
        uint64_t v23 = v19;
        uint64_t v32 = v18;
        if (!v97) {
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v32 = v23;
        if ((v24 & 1) == 0)
        {
LABEL_19:
          [v27 size];
          double v12 = v12 + v33 + 0.0;
          if (v22 < v29) {
            double v22 = v29;
          }
          [v27 size];
          int v24 = 0;
          double v35 = v34 - v22;
          uint64_t v23 = v32;
          goto LABEL_26;
        }
      }
      [v27 size];
      double v11 = v11 + v36 + 0.0;
      if (v22 < v31) {
        double v22 = v31;
      }
      [v27 size];
      double v35 = v37 - v22;
      int v24 = 1;
LABEL_26:
      if (v21 < v35) {
        double v21 = v35;
      }

      char v20 = 0;
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v106 objects:v113 count:16];
    char v20 = 0;
  }
  while (v14);
LABEL_32:

  v38 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(obj, "count"));
  uint64_t v39 = *(void *)off_1E52D2048;
  v111[0] = *(void *)off_1E52D2040;
  v111[1] = v39;
  v112[0] = v94;
  CGFloat v40 = +[UIColor blackColor];
  v112[1] = v40;
  CGFloat v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:2];

  v88 = v38;
  [v38 sizeWithAttributes:v41];
  if (v42 < v43) {
    double v42 = v43;
  }
  double v44 = v42 * 0.6;
  double v98 = v42 * 0.6;
  if (v24)
  {
    double v45 = v44 * 5.0;
    double v46 = v44 * 5.0 + -60.0;
    if (v45 < 60.0) {
      double v46 = 0.0;
    }
    if (v101 <= 1) {
      double v47 = 0.0;
    }
    else {
      double v47 = v46;
    }
    double v12 = v21 + v22 + v47;
  }
  else
  {
    double v48 = v44 * 6.0;
    double v49 = v44 * 6.0 + -90.0;
    if (v48 < 90.0) {
      double v49 = 0.0;
    }
    if (v101 <= 1) {
      double v47 = 0.0;
    }
    else {
      double v47 = v49;
    }
    double v11 = v21 + v22 + v47;
  }
  if (v23) {
    double v50 = v47;
  }
  else {
    double v50 = 0.0;
  }
  _UIGraphicsBeginImageContextWithOptions(0, 0, v11, v12, 0.0);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    CGFloat v52 = 0;
  }
  else {
    CGFloat v52 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  id v53 = +[UIColor whiteColor];
  CGContextSetFillColorWithColor(v52, (CGColorRef)[v53 CGColor]);

  v116.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v116.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  double y = v116.origin.y;
  double v87 = *MEMORY[0x1E4F1DAD8];
  double v92 = v12;
  double v93 = v11;
  v116.size.CGFloat width = v11;
  v116.size.CGFloat height = v12;
  CGContextFillRect(v52, v116);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id obja = obj;
  uint64_t v54 = [obja countByEnumeratingWithState:&v102 objects:v110 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    double v56 = v22 + v50;
    uint64_t v57 = *(void *)v103;
    if (v23) {
      double v58 = (v47 + 90.0) * 0.5;
    }
    else {
      double v58 = v11 - (v47 + 90.0) * 0.5;
    }
    double v59 = (v47 + 60.0) * 0.5;
    if ((v23 & 1) == 0) {
      double v59 = v12 - v59;
    }
    double v95 = v59;
    double v96 = v58;
    uint64_t v60 = 1;
    double v61 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v103 != v57) {
          objc_enumerationMutation(obja);
        }
        CGFloat v63 = *(void **)(*((void *)&v102 + 1) + 8 * j);
        double v64 = [v63 image];
        [v63 imageAnchorPoint];
        double v66 = v65;
        double v68 = v67;
        id v69 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v60 + j);
        [v69 sizeWithAttributes:v41];
        double v71 = v70;
        double v73 = v72;
        if (v24)
        {
          objc_msgSend(v64, "drawAtPoint:", v61, v56 - v68);
          [v64 size];
          double v61 = v61 + v74 + 0.0;
          if (v101 < 2) {
            goto LABEL_69;
          }
          [v64 size];
          double v76 = v71 * 0.5;
          double v77 = v61 - v75 * 0.5 - v71 * 0.5;
          double v78 = v73 * 0.5;
          double v79 = v95;
        }
        else
        {
          objc_msgSend(v64, "drawAtPoint:", v56 - v66, v61);
          [v64 size];
          double v61 = v61 + v80 + 0.0;
          if (v101 < 2) {
            goto LABEL_69;
          }
          double v76 = v71 * 0.5;
          double v77 = v96 - v71 * 0.5;
          [v64 size];
          double v79 = v61 - v81 * 0.5;
          double v78 = v73 * 0.5;
        }
        double v82 = v79 - v78;
        objc_msgSend(v69, "drawInRect:withAttributes:", v41, v77, v79 - v78, v71, v73);
        CGContextSetLineWidth(v52, 2.0);
        id v83 = +[UIColor blackColor];
        CGContextSetStrokeColorWithColor(v52, (CGColorRef)[v83 CGColor]);

        CGContextAddArc(v52, v77 + v76, v82 + v78, v98, 0.0, 6.28318531, 1);
        CGContextStrokePath(v52);
LABEL_69:
      }
      uint64_t v55 = [obja countByEnumeratingWithState:&v102 objects:v110 count:16];
      v60 += j;
    }
    while (v55);
  }

  double v10 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();
  if (v89 + -1.0 > 2.22044605e-16)
  {
    _UIGraphicsBeginImageContextWithOptions(0, 0, v93 * v89, v92 * v89, 0.0);
    objc_msgSend(v10, "drawInRect:", v87, y, v93 * v89, v92 * v89);
    uint64_t v84 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();

    double v10 = (void *)v84;
  }
  id v8 = v90;
  id v7 = v91;

LABEL_74:
  return v10;
}

- (_UIFocusMapSnapshot)snapshot
{
  return self->_snapshot;
}

- (_UIFocusMapSearchInfo)focusMapSearchInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusMapSearchInfo);
  return (_UIFocusMapSearchInfo *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusMapSearchInfo);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end