@interface NTKLayoutRule
+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6;
+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 clip:(BOOL)a7;
- (BOOL)clipsToReferenceFrame;
- (BOOL)isEqual:(id)a3;
- (CGRect)calculateLayoutFrameForBoundsSize:(CGSize)a3;
- (CGRect)referenceFrame;
- (CGSize)maximumSize;
- (CLKDevice)device;
- (double)calculateLayoutFrameHeightForBoundsSize:(CGSize)a3;
- (double)calculateLayoutFrameWidthForBoundsSize:(CGSize)a3;
- (double)calculateLayoutFrameXOriginForBoundsSize:(CGSize)a3;
- (double)calculateLayoutFrameYOriginForBoundsSize:(CGSize)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForDevice:(id)a3;
- (id)layoutRuleByConvertingToCoordinateSpaceWithFrame:(CGRect)a3;
- (int64_t)horizontalLayout;
- (int64_t)verticalLayout;
- (unint64_t)hash;
- (void)setClipsToReferenceFrame:(BOOL)a3;
- (void)setHorizontalLayout:(int64_t)a3;
- (void)setReferenceFrame:(CGRect)a3;
- (void)setVerticalLayout:(int64_t)a3;
- (void)validate;
@end

@implementation NTKLayoutRule

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKLayoutRule;
  v6 = [(NTKLayoutRule *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6
{
  return (id)objc_msgSend(a1, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:clip:", a3, a5, a6, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)layoutRuleForDevice:(id)a3 withReferenceFrame:(CGRect)a4 horizontalLayout:(int64_t)a5 verticalLayout:(int64_t)a6 clip:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v15 = a3;
  v16 = (void *)[objc_alloc((Class)a1) initForDevice:v15];

  objc_msgSend(v16, "setReferenceFrame:", x, y, width, height);
  [v16 setHorizontalLayout:a5];
  [v16 setVerticalLayout:a6];
  [v16 setClipsToReferenceFrame:v7];
  [v16 validate];
  return v16;
}

- (id)layoutRuleByConvertingToCoordinateSpaceWithFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v5 = (void *)[(NTKLayoutRule *)self copy];
  [v5 referenceFrame];
  CGRect v9 = CGRectOffset(v8, -x, -y);
  objc_msgSend(v5, "setReferenceFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  return v5;
}

- (double)calculateLayoutFrameXOriginForBoundsSize:(CGSize)a3
{
  double width = a3.width;
  switch([(NTKLayoutRule *)self horizontalLayout])
  {
    case 0:
    case 3:
    case 4:
      [(NTKLayoutRule *)self referenceFrame];
      break;
    case 1:
      [(NTKLayoutRule *)self referenceFrame];
      CLKRectCenteredXInRectForDevice();
      break;
    case 2:
      [(NTKLayoutRule *)self referenceFrame];
      double result = CGRectGetMaxX(v6) - width;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (double)calculateLayoutFrameYOriginForBoundsSize:(CGSize)a3
{
  double height = a3.height;
  switch([(NTKLayoutRule *)self verticalLayout])
  {
    case 0:
    case 3:
    case 4:
      [(NTKLayoutRule *)self referenceFrame];
      goto LABEL_5;
    case 1:
      [(NTKLayoutRule *)self referenceFrame];
      CLKRectCenteredYInRectForDevice();
LABEL_5:
      double result = v5;
      break;
    case 2:
      [(NTKLayoutRule *)self referenceFrame];
      double result = CGRectGetMaxY(v7) - height;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (double)calculateLayoutFrameWidthForBoundsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(NTKLayoutRule *)self verticalLayout] == 4)
  {
    if (height != 0.0)
    {
      [(NTKLayoutRule *)self referenceFrame];
      return width * (v6 / height);
    }
  }
  else
  {
    unint64_t v7 = [(NTKLayoutRule *)self horizontalLayout];
    if (v7 >= 3)
    {
      if (v7 - 3 < 2)
      {
        [(NTKLayoutRule *)self referenceFrame];
        return v9;
      }
    }
    else if ([(NTKLayoutRule *)self clipsToReferenceFrame])
    {
      [(NTKLayoutRule *)self referenceFrame];
      if (width > v8) {
        return v8;
      }
    }
  }
  return width;
}

- (double)calculateLayoutFrameHeightForBoundsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(NTKLayoutRule *)self horizontalLayout] == 4)
  {
    if (width != 0.0)
    {
      [(NTKLayoutRule *)self referenceFrame];
      return height * (v6 / width);
    }
  }
  else
  {
    unint64_t v7 = [(NTKLayoutRule *)self verticalLayout];
    if (v7 >= 3)
    {
      if (v7 - 3 < 2)
      {
        [(NTKLayoutRule *)self referenceFrame];
        return v9;
      }
    }
    else if ([(NTKLayoutRule *)self clipsToReferenceFrame])
    {
      [(NTKLayoutRule *)self referenceFrame];
      if (height > v8) {
        return v8;
      }
    }
  }
  return height;
}

- (CGRect)calculateLayoutFrameForBoundsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(NTKLayoutRule *)self validate];
  -[NTKLayoutRule calculateLayoutFrameWidthForBoundsSize:](self, "calculateLayoutFrameWidthForBoundsSize:", width, height);
  double v7 = v6;
  -[NTKLayoutRule calculateLayoutFrameHeightForBoundsSize:](self, "calculateLayoutFrameHeightForBoundsSize:", width, height);
  double v9 = v8;
  -[NTKLayoutRule calculateLayoutFrameXOriginForBoundsSize:](self, "calculateLayoutFrameXOriginForBoundsSize:", v7, v8);
  double v11 = v10;
  -[NTKLayoutRule calculateLayoutFrameYOriginForBoundsSize:](self, "calculateLayoutFrameYOriginForBoundsSize:", v7, v9);
  double v13 = v12;
  double v14 = v11;
  double v15 = v7;
  double v16 = v9;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v13;
  result.origin.double x = v14;
  return result;
}

- (CGSize)maximumSize
{
  if ([(NTKLayoutRule *)self clipsToReferenceFrame])
  {
    [(NTKLayoutRule *)self referenceFrame];
    double v4 = v3;
    double v6 = v5;
  }
  else
  {
    double v4 = 1.79769313e308;
    double v6 = 1.79769313e308;
  }
  result.double height = v6;
  result.double width = v4;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  [(NTKLayoutRule *)self referenceFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 referenceFrame];
  v23.origin.double x = v13;
  v23.origin.double y = v14;
  v23.size.double width = v15;
  v23.size.double height = v16;
  v22.origin.double x = v6;
  v22.origin.double y = v8;
  v22.size.double width = v10;
  v22.size.double height = v12;
  if (!CGRectEqualToRect(v22, v23)) {
    goto LABEL_6;
  }
  int64_t v17 = [(NTKLayoutRule *)self horizontalLayout];
  if (v17 == [v4 horizontalLayout]
    && (int64_t v18 = -[NTKLayoutRule verticalLayout](self, "verticalLayout"), v18 == [v4 verticalLayout]))
  {
    BOOL v19 = [(NTKLayoutRule *)self clipsToReferenceFrame];
    int v20 = v19 ^ [v4 clipsToReferenceFrame] ^ 1;
  }
  else
  {
LABEL_6:
    LOBYTE(v20) = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  double v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_referenceFrame.origin.x, self->_referenceFrame.origin.y, self->_referenceFrame.size.width, self->_referenceFrame.size.height);
  unint64_t v4 = [v3 hash]
     + 32 * self->_horizontalLayout
     + (self->_verticalLayout << 10)
     + ((unint64_t)self->_clipsToReferenceFrame << 15);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(NTKLayoutRule *)self referenceFrame];
  objc_msgSend(v4, "setReferenceFrame:");
  objc_msgSend(v4, "setHorizontalLayout:", -[NTKLayoutRule horizontalLayout](self, "horizontalLayout"));
  objc_msgSend(v4, "setVerticalLayout:", -[NTKLayoutRule verticalLayout](self, "verticalLayout"));
  objc_msgSend(v4, "setClipsToReferenceFrame:", -[NTKLayoutRule clipsToReferenceFrame](self, "clipsToReferenceFrame"));
  return v4;
}

- (void)validate
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NTKLayoutRule *)self horizontalLayout];
  int64_t v4 = [(NTKLayoutRule *)self verticalLayout];
  if (v3 == 4)
  {
    if ((unint64_t)(v4 - 3) > 1) {
      return;
    }
    int64_t v5 = [(NTKLayoutRule *)self verticalLayout];
    int64_t v6 = [(NTKLayoutRule *)self horizontalLayout];
    if ((unint64_t)(v5 - 1) > 3) {
      double v7 = @"NTKLayoutMin";
    }
    else {
      double v7 = off_1E62C2858[v5 - 1];
    }
    if ((unint64_t)(v6 - 1) > 3) {
      double v11 = @"NTKLayoutMin";
    }
    else {
      double v11 = off_1E62C2858[v6 - 1];
    }
    CGFloat v12 = [NSString stringWithFormat:@"*** Error in <NTKLayoutRule %p>: %@ for verticalLayout does not make sense when horizontalLayout is %@.", self, v7, v11];
    CGFloat v13 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v14 = [(NTKLayoutRule *)self verticalLayout];
      if ((unint64_t)(v14 - 1) > 3) {
        CGFloat v15 = @"NTKLayoutMin";
      }
      else {
        CGFloat v15 = off_1E62C2858[v14 - 1];
      }
      int64_t v17 = [NSString stringWithFormat:@"Breaking verticalLayout by resetting %@ to NTKLayoutMin", v15];
      *(_DWORD *)buf = 138412546;
      CGRect v23 = v12;
      __int16 v24 = 2112;
      v25 = v17;
      _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
    }
    [(NTKLayoutRule *)self setVerticalLayout:0];
    goto LABEL_29;
  }
  if (v4 == 4 && (unint64_t)([(NTKLayoutRule *)self horizontalLayout] - 3) <= 1)
  {
    int64_t v8 = [(NTKLayoutRule *)self horizontalLayout];
    int64_t v9 = [(NTKLayoutRule *)self verticalLayout];
    if ((unint64_t)(v8 - 1) > 3) {
      CGFloat v10 = @"NTKLayoutMin";
    }
    else {
      CGFloat v10 = off_1E62C2858[v8 - 1];
    }
    if ((unint64_t)(v9 - 1) > 3) {
      CGFloat v16 = @"NTKLayoutMin";
    }
    else {
      CGFloat v16 = off_1E62C2858[v9 - 1];
    }
    CGFloat v12 = [NSString stringWithFormat:@"*** Error in <NTKLayoutRule %p>: %@ for horizontalLayout does not make sense when verticalLayout is %@.", self, v10, v16];
    int64_t v18 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v19 = [(NTKLayoutRule *)self horizontalLayout];
      if ((unint64_t)(v19 - 1) > 3) {
        int v20 = @"NTKLayoutMin";
      }
      else {
        int v20 = off_1E62C2858[v19 - 1];
      }
      v21 = [NSString stringWithFormat:@"Breaking horizontalLayout by resetting %@ to NTKLayoutMin", v20];
      *(_DWORD *)buf = 138412546;
      CGRect v23 = v12;
      __int16 v24 = 2112;
      v25 = v21;
      _os_log_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_DEFAULT, "%@ %@", buf, 0x16u);
    }
    [(NTKLayoutRule *)self setHorizontalLayout:0];
LABEL_29:
  }
}

- (id)description
{
  int64_t v3 = NSString;
  [(NTKLayoutRule *)self referenceFrame];
  int64_t v4 = NSStringFromCGRect(v14);
  unint64_t v5 = [(NTKLayoutRule *)self horizontalLayout] - 1;
  if (v5 > 3) {
    int64_t v6 = @"NTKLayoutMin";
  }
  else {
    int64_t v6 = off_1E62C2858[v5];
  }
  unint64_t v7 = [(NTKLayoutRule *)self verticalLayout] - 1;
  if (v7 > 3) {
    int64_t v8 = @"NTKLayoutMin";
  }
  else {
    int64_t v8 = off_1E62C2858[v7];
  }
  BOOL v9 = [(NTKLayoutRule *)self clipsToReferenceFrame];
  CGFloat v10 = @"no";
  if (v9) {
    CGFloat v10 = @"yes";
  }
  double v11 = [v3 stringWithFormat:@"[%@] h:%@ v:%@ clip:%@", v4, v6, v8, v10];

  return v11;
}

- (CLKDevice)device
{
  return self->_device;
}

- (CGRect)referenceFrame
{
  double x = self->_referenceFrame.origin.x;
  double y = self->_referenceFrame.origin.y;
  double width = self->_referenceFrame.size.width;
  double height = self->_referenceFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setReferenceFrame:(CGRect)a3
{
  self->_referenceFrame = a3;
}

- (int64_t)horizontalLayout
{
  return self->_horizontalLayout;
}

- (void)setHorizontalLayout:(int64_t)a3
{
  self->_horizontalLayout = a3;
}

- (int64_t)verticalLayout
{
  return self->_verticalLayout;
}

- (void)setVerticalLayout:(int64_t)a3
{
  self->_verticalLayout = a3;
}

- (BOOL)clipsToReferenceFrame
{
  return self->_clipsToReferenceFrame;
}

- (void)setClipsToReferenceFrame:(BOOL)a3
{
  self->_clipsToReferenceFrame = a3;
}

- (void).cxx_destruct
{
}

@end