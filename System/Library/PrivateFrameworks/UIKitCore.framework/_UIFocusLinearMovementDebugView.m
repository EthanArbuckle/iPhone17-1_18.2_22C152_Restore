@interface _UIFocusLinearMovementDebugView
- (BOOL)isGroupMode;
- (_UIFocusLinearMovementDebugView)init;
- (_UIFocusLinearMovementDebugView)initWithGroups:(id)a3;
- (_UIFocusLinearMovementDebugView)initWithItems:(id)a3;
- (id)_groupFramesFromGroups:(id)a3;
- (id)_itemFramesFromItems:(id)a3;
- (id)_lineSegmentsFromFrames:(id)a3;
- (id)_primaryGroupFramesFromGroups:(id)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation _UIFocusLinearMovementDebugView

- (_UIFocusLinearMovementDebugView)init
{
  return [(_UIFocusLinearMovementDebugView *)self initWithItems:MEMORY[0x1E4F1CBF0]];
}

- (_UIFocusLinearMovementDebugView)initWithItems:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFocusLinearMovementDebugView;
  v5 = [(UIView *)&v10 init];
  v6 = v5;
  if (v5)
  {
    if (v4) {
      v7 = v4;
    }
    else {
      v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_items, v7);
    v6->_colorCoding = 0;
    [(UIView *)v6 setUserInteractionEnabled:0];
    [(UIView *)v6 setOpaque:0];
    v8 = +[UIColor clearColor];
    [(UIView *)v6 setBackgroundColor:v8];
  }
  return v6;
}

- (_UIFocusLinearMovementDebugView)initWithGroups:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFocusLinearMovementDebugView;
  v5 = [(UIView *)&v10 init];
  v6 = v5;
  if (v5)
  {
    if (v4) {
      v7 = v4;
    }
    else {
      v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_groups, v7);
    v6->_colorCoding = 1;
    [(UIView *)v6 setUserInteractionEnabled:0];
    [(UIView *)v6 setOpaque:0];
    v8 = +[UIColor clearColor];
    [(UIView *)v6 setBackgroundColor:v8];
  }
  return v6;
}

- (BOOL)isGroupMode
{
  return self->_groups != 0;
}

- (id)_itemFramesFromItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = _UIFocusItemFrameInCoordinateSpace(*(void **)(*((void *)&v14 + 1) + 8 * i), self);
        v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v11, (void)v14);
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_groupFramesFromGroups:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v5 = self->_groups;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_msgSend(v10, "boundingBox", (void)v30);
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        uint64_t v19 = [v10 coordinateSpace];
        -[UIView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v19, v12, v14, v16, v18);
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;

        v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v21, v23, v25, v27);
        [v4 addObject:v28];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_primaryGroupFramesFromGroups:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v5 = self->_groups;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_msgSend(v10, "primaryRect", (void)v30);
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        uint64_t v19 = [v10 coordinateSpace];
        -[UIView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", v19, v12, v14, v16, v18);
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;

        v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v21, v23, v25, v27);
        [v4 addObject:v28];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_lineSegmentsFromFrames:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v13 = *(void *)v26;
    do
    {
      uint64_t v14 = 0;
      double v15 = v11;
      double v16 = v12;
      double v17 = v10;
      double v18 = v9;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v14), "CGRectValue", (void)v25);
        double v9 = v19;
        double v10 = v20;
        double v11 = v21;
        double v12 = v22;
        v32.origin.x = v18;
        v32.origin.y = v17;
        v32.size.width = v15;
        v32.size.height = v16;
        if (!CGRectIsEmpty(v32))
        {
          double v23 = -[_UIFocusLinearMovementDebugViewLineSegment initWithStartRect:endRect:previousSegment:]([_UIFocusLinearMovementDebugViewLineSegment alloc], "initWithStartRect:endRect:previousSegment:", v8, v18, v17, v15, v16, v9, v10, v11, v12);
          [v4 addObject:v23];

          uint64_t v8 = v23;
        }
        ++v14;
        double v15 = v11;
        double v16 = v12;
        double v17 = v10;
        double v18 = v9;
      }
      while (v7 != v14);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  ContextStacuint64_t k = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v10 = 0;
  }
  else {
    double v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSaveGState(v10);
  v99.origin.double x = x;
  v99.origin.double y = y;
  v99.size.double width = width;
  v99.size.CGFloat height = height;
  CGContextClearRect(v10, v99);
  items = self->_items;
  if ((items == 0) == (self->_groups != 0))
  {
    if (items)
    {
LABEL_6:
      double v12 = -[_UIFocusLinearMovementDebugView _itemFramesFromItems:](self, "_itemFramesFromItems:");
      v77 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = (objc_class *)objc_opt_class();
    double v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"_UIFocusLinearMovementDebugView.m", 138, @"%@ needs to be created with either items or groups.", v15 object file lineNumber description];

    if (self->_items) {
      goto LABEL_6;
    }
  }
  double v12 = [(_UIFocusLinearMovementDebugView *)self _groupFramesFromGroups:self->_groups];
  v77 = [(_UIFocusLinearMovementDebugView *)self _primaryGroupFramesFromGroups:self->_groups];
LABEL_9:
  double v71 = height;
  v70 = [(_UIFocusLinearMovementDebugView *)self _lineSegmentsFromFrames:v12];
  CGContextSaveGState(v10);
  c = v10;
  CGContextSetLineWidth(v10, 2.0);
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v86 objects:v97 count:16];
  v76 = self;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v87 != v20) {
          objc_enumerationMutation(v16);
        }
        unint64_t v22 = v19 + i;
        double v23 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        BOOL colorCoding = self->_colorCoding;
        unint64_t v25 = [v16 count];
        if (colorCoding) {
          +[UIColor colorWithHue:(double)v22 / (double)v25 saturation:1.0 brightness:1.0 alpha:1.0];
        }
        else {
        long long v26 = +[UIColor systemBlueColor];
        }
        [v26 setStroke];
        long long v27 = [v26 colorWithAlphaComponent:0.2];
        [v27 setFill];

        [v23 CGRectValue];
        CGFloat v28 = v100.origin.x;
        CGFloat v29 = v100.origin.y;
        CGFloat v30 = v100.size.width;
        CGFloat v31 = v100.size.height;
        if (!CGRectIsNull(v100))
        {
          v101.origin.double x = v28;
          v101.origin.double y = v29;
          v101.size.double width = v30;
          v101.size.CGFloat height = v31;
          CGContextFillRect(c, v101);
          v102.origin.double x = v28;
          v102.origin.double y = v29;
          v102.size.double width = v30;
          v102.size.CGFloat height = v31;
          CGContextStrokeRect(c, v102);
        }
        if (v77)
        {
          CGRect v32 = [v77 objectAtIndexedSubscript:v19 + i];
          [v32 CGRectValue];
          CGFloat v34 = v33;
          CGFloat v36 = v35;
          CGFloat v38 = v37;
          CGFloat v40 = v39;

          v103.origin.double x = v34;
          v103.origin.double y = v36;
          v103.size.double width = v38;
          v103.size.CGFloat height = v40;
          if (!CGRectIsNull(v103))
          {
            *(_OWORD *)lengths = xmmword_186B94D80;
            CGContextSetLineDash(c, (double)v22 * 4.0, lengths, 2uLL);
            v104.origin.double x = v34;
            v104.origin.double y = v36;
            v104.size.double width = v38;
            v104.size.CGFloat height = v40;
            CGRect v105 = CGRectInset(v104, 2.0, 2.0);
            CGContextStrokeRect(c, v105);
            CGContextSetLineDash(c, 0.0, 0, 0);
          }
        }

        self = v76;
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v86 objects:v97 count:16];
      v19 += i;
    }
    while (v18);
  }

  CGContextRestoreGState(c);
  CGContextSaveGState(c);
  CGContextSetLineWidth(c, 2.0);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v16;
  uint64_t v74 = [obj countByEnumeratingWithState:&v82 objects:v95 count:16];
  if (v74)
  {
    uint64_t v41 = 0;
    uint64_t v73 = *(void *)v83;
    uint64_t v42 = *(void *)off_1E52D2040;
    uint64_t v43 = *(void *)off_1E52D2048;
    do
    {
      for (uint64_t j = 0; j != v74; ++j)
      {
        if (*(void *)v83 != v73) {
          objc_enumerationMutation(obj);
        }
        v45 = *(void **)(*((void *)&v82 + 1) + 8 * j);
        BOOL v46 = self->_colorCoding;
        unint64_t v47 = [obj count];
        if (v46) {
          +[UIColor colorWithHue:(double)(unint64_t)(v41 + j) / (double)v47 saturation:1.0 brightness:1.0 alpha:1.0];
        }
        else {
        v48 = +[UIColor systemBlueColor];
        }
        [v48 setStroke];
        v49 = [v48 colorWithAlphaComponent:0.2];
        [v49 setFill];

        [v45 CGRectValue];
        double v51 = v50;
        double v53 = v52;
        v54 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v41 + j + 1);
        v93[0] = v42;
        v55 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
        v93[1] = v43;
        v94[0] = v55;
        v94[1] = v48;
        v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:2];
        objc_msgSend(v54, "drawAtPoint:withAttributes:", v56, v51, v53);

        if (v77)
        {
          v57 = [v77 objectAtIndexedSubscript:v41 + j];
          [v57 CGRectValue];
          double v59 = v58;
          double v61 = v60;

          if (v51 != v59 || v53 != v61)
          {
            v91[0] = v42;
            v62 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
            v91[1] = v43;
            v92[0] = v62;
            v92[1] = v48;
            v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:2];
            objc_msgSend(v54, "drawAtPoint:withAttributes:", v63, v59, v61);
          }
        }

        self = v76;
      }
      v41 += j;
      uint64_t v74 = [obj countByEnumeratingWithState:&v82 objects:v95 count:16];
    }
    while (v74);
  }

  CGContextRestoreGState(c);
  CGContextSaveGState(c);
  v64 = +[UIColor systemBlueColor];
  [v64 setStroke];
  [v64 setFill];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v65 = v70;
  uint64_t v66 = [v65 countByEnumeratingWithState:&v78 objects:v90 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v79;
    do
    {
      for (uint64_t k = 0; k != v67; ++k)
      {
        if (*(void *)v79 != v68) {
          objc_enumerationMutation(v65);
        }
        objc_msgSend(*(id *)(*((void *)&v78 + 1) + 8 * k), "drawInRect:", x, y, width, v71);
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v78 objects:v90 count:16];
    }
    while (v67);
  }

  CGContextRestoreGState(c);
  CGContextRestoreGState(c);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end