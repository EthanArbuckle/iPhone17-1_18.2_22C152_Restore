@interface PSCapacityBarView
- (PSCapacityBarData)barData;
- (PSCapacityBarView)initWithFrame:(CGRect)a3;
- (UIColor)barBackgroundColor;
- (UIColor)barOtherDataColor;
- (UIColor)barSeparatorColor;
- (id)bezierPathWithLineFrom:(CGPoint)a3 to:(CGPoint)a4;
- (void)drawRect:(CGRect)a3;
- (void)setBarBackgroundColor:(id)a3;
- (void)setBarData:(id)a3;
- (void)setBarOtherDataColor:(id)a3;
- (void)setBarSeparatorColor:(id)a3;
@end

@implementation PSCapacityBarView

- (PSCapacityBarView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSCapacityBarView;
  v3 = -[PSCapacityBarView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    [(PSCapacityBarView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (id)bezierPathWithLineFrom:(CGPoint)a3 to:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  v8 = [MEMORY[0x1E4F427D0] bezierPath];
  objc_msgSend(v8, "moveToPoint:", v7, v6);
  objc_msgSend(v8, "addLineToPoint:", x, y);
  return v8;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  v4 = [(PSCapacityBarView *)self traitCollection];
  uint64_t v80 = [v4 userInterfaceStyle];

  v5 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v6 = [v5 userInterfaceLayoutDirection];

  double v7 = [(PSCapacityBarView *)self barData];
  v8 = [v7 adjustedCategories];
  v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = [v7 capacity];
  v72 = v7;
  uint64_t v11 = [v7 bytesUsed];
  long long v85 = 0u;
  long long v86 = 0u;
  if (v11 >= v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v11;
  }
  long long v87 = 0uLL;
  long long v88 = 0uLL;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v85 objects:v90 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v86 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = [*(id *)(*((void *)&v85 + 1) + 8 * i) bytes];
        v16 += v19 & ~(v19 >> 63);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v85 objects:v90 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v16 = 0;
  }

  uint64_t v20 = v12 - v16;
  if (v12 > v16)
  {
    barOtherDataColor = self->_barOtherDataColor;
    if (barOtherDataColor)
    {
      v22 = barOtherDataColor;
    }
    else
    {
      if (v80 == 2) {
        [MEMORY[0x1E4F428B8] systemDarkLightMidGrayColor];
      }
      else {
      v22 = [MEMORY[0x1E4F428B8] systemLightMidGrayColor];
      }
    }
    v23 = v22;
    v24 = [[PSCapacityBarCategory alloc] initWithIdentifier:@"_CAT_OTHER_" title:&stru_1EFB51FD0 color:v22 bytes:v20];
    [v13 addObject:v24];
  }
  c = UIGraphicsGetCurrentContext();
  CGContextSaveGState(c);
  [(PSCapacityBarView *)self bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  v71 = [MEMORY[0x1E4F428B8] clearColor];
  [v71 setFill];
  v33 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRect:", v26, v28, v30, v32);
  [v33 fill];

  v34 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", v26, v28, v30, v32, 5.0);
  [v34 addClip];

  double v78 = v26;
  v35 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", v26, v28, v30, v32, 5.0);
  [v35 setLineWidth:1.0];
  v77 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.1];
  barBackgroundColor = self->_barBackgroundColor;
  if (barBackgroundColor)
  {
    v37 = barBackgroundColor;
    p_barSeparatorColor = &self->_barSeparatorColor;
    barSeparatorColor = self->_barSeparatorColor;
    if (!barSeparatorColor)
    {
      if (v80 != 2) {
        goto LABEL_30;
      }
LABEL_27:
      v39 = [MEMORY[0x1E4F428B8] blackColor];
      goto LABEL_31;
    }
LABEL_29:
    v39 = barSeparatorColor;
    goto LABEL_31;
  }
  if (v80 == 2)
  {
    v37 = [MEMORY[0x1E4F428B8] _externalSystemExtraDarkGrayColor];
    p_barSeparatorColor = &self->_barSeparatorColor;
    barSeparatorColor = self->_barSeparatorColor;
    if (!barSeparatorColor) {
      goto LABEL_27;
    }
    goto LABEL_29;
  }
  v37 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  p_barSeparatorColor = &self->_barSeparatorColor;
  barSeparatorColor = self->_barSeparatorColor;
  if (barSeparatorColor) {
    goto LABEL_29;
  }
LABEL_30:
  v39 = [MEMORY[0x1E4F428B8] whiteColor];
LABEL_31:
  v75 = self;
  v76 = v39;
  double v79 = v30 + -1.0;
  [(UIColor *)v37 setFill];
  [v35 fill];
  v69 = v37;
  [(UIColor *)v37 setStroke];
  [v35 stroke];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v40 = v13;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v81 objects:v89 count:16];
  double v67 = v32;
  double v68 = v28;
  if (v41)
  {
    uint64_t v42 = v41;
    unint64_t v43 = 0;
    uint64_t v44 = *(void *)v82;
    double v45 = (double)v10;
    double v46 = v78 + v30;
    double v47 = v28 + -0.5;
    double v48 = v32 + 1.0;
    double v74 = v28 + v32 + 0.5;
    double v49 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v82 != v44) {
          objc_enumerationMutation(v40);
        }
        v51 = *(void **)(*((void *)&v81 + 1) + 8 * j);
        uint64_t v52 = objc_msgSend(v51, "bytes", *(void *)&v67, *(void *)&v68);
        if (v52 >= 1)
        {
          v43 += v52;
          double v53 = floor(v79 * ((double)v43 / v45));
          if (v53 - v49 == 0.0) {
            double v54 = 1.0;
          }
          else {
            double v54 = v53 - v49;
          }
          if (v53 - v49 != 0.0 || v53 <= 0.0) {
            double v56 = v53;
          }
          else {
            double v56 = v53 + -1.0;
          }
          if (v6 == 1) {
            double v57 = v46 - v49 - v54;
          }
          else {
            double v57 = v78 + v49;
          }
          CurrentContext = UIGraphicsGetCurrentContext();
          CGContextSaveGState(CurrentContext);
          v59 = (void *)MEMORY[0x1E4F427D0];
          v92.origin.double x = v57;
          v92.origin.double y = v47;
          v92.size.width = v54;
          v92.size.height = v48;
          CGRect v93 = CGRectInset(v92, -0.5, -0.5);
          v60 = objc_msgSend(v59, "bezierPathWithRect:", v93.origin.x, v93.origin.y, v93.size.width, v93.size.height);
          [v60 addClip];

          v61 = [v51 color];
          [v61 setFill];

          [v35 fill];
          if (v49 > 0.0)
          {
            double v62 = -0.0;
            if (v6 == 1) {
              double v62 = v54;
            }
            v63 = -[PSCapacityBarView bezierPathWithLineFrom:to:](v75, "bezierPathWithLineFrom:to:", v62 + v57, v47, v62 + v57, v74);
            [(UIColor *)v76 setStroke];
            [v63 stroke];
            if (v80 == 2 && *p_barSeparatorColor)
            {
              [v77 setStroke];
              [v63 stroke];
            }
          }
          if (v80 == 2)
          {
            [v77 setFill];
            [v35 fill];
          }
          CGContextRestoreGState(CurrentContext);
          double v49 = v56;
        }
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v81 objects:v89 count:16];
    }
    while (v42);
  }
  else
  {
    double v49 = 0.0;
  }

  if (v79 > v49 && objc_msgSend(v40, "count", v79))
  {
    double v64 = v79 - v49;
    double v65 = -0.0;
    if (v6 != 1)
    {
      double v64 = -0.0;
      double v65 = v49;
    }
    v66 = -[PSCapacityBarView bezierPathWithLineFrom:to:](v75, "bezierPathWithLineFrom:to:", v78 + v65 + v64, v68 + -0.5, v78 + v65 + v64, v68 + v67 + 0.5, *(void *)&v67, *(void *)&v68);
    [(UIColor *)v76 setStroke];
    [v66 stroke];
    if (v80 == 2 && *p_barSeparatorColor)
    {
      [v77 setStroke];
      [v66 stroke];
    }
  }
  CGContextRestoreGState(c);
}

- (void)setBarData:(id)a3
{
  v4 = (PSCapacityBarData *)[a3 copy];
  barData = self->_barData;
  self->_barData = v4;

  [(PSCapacityBarView *)self setNeedsDisplay];
}

- (void)setBarBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_barBackgroundColor, a3);
  [(PSCapacityBarView *)self setNeedsDisplay];
}

- (void)setBarSeparatorColor:(id)a3
{
  objc_storeStrong((id *)&self->_barSeparatorColor, a3);
  [(PSCapacityBarView *)self setNeedsDisplay];
}

- (void)setBarOtherDataColor:(id)a3
{
  objc_storeStrong((id *)&self->_barOtherDataColor, a3);
  [(PSCapacityBarView *)self setNeedsDisplay];
}

- (PSCapacityBarData)barData
{
  return self->_barData;
}

- (UIColor)barBackgroundColor
{
  return self->_barBackgroundColor;
}

- (UIColor)barSeparatorColor
{
  return self->_barSeparatorColor;
}

- (UIColor)barOtherDataColor
{
  return self->_barOtherDataColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barOtherDataColor, 0);
  objc_storeStrong((id *)&self->_barSeparatorColor, 0);
  objc_storeStrong((id *)&self->_barBackgroundColor, 0);
  objc_storeStrong((id *)&self->_barData, 0);
}

@end