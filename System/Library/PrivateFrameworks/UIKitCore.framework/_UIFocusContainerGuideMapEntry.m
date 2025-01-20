@interface _UIFocusContainerGuideMapEntry
- (CGRect)focusContainmentFrame;
- (UIFocusContainerGuide)focusContainerGuide;
- (double)axisAlignedDistanceFromFocusedRect;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)visualRepresentationColor;
- (void)drawVisualRepresentationInContext:(CGContext *)a3 imageFrame:(CGRect)a4;
- (void)setAxisAlignedDistanceFromFocusedRect:(double)a3;
- (void)setFocusContainerGuide:(id)a3;
- (void)setFocusContainmentFrame:(CGRect)a3;
@end

@implementation _UIFocusContainerGuideMapEntry

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusContainerGuideMapEntry;
  v4 = [(_UIFocusRegionMapEntry *)&v8 copyWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusContainerGuide);
  objc_storeWeak(v4 + 12, WeakRetained);

  CGSize size = self->_focusContainmentFrame.size;
  *((_OWORD *)v4 + 7) = self->_focusContainmentFrame.origin;
  *((CGSize *)v4 + 8) = size;
  v4[13] = *(id *)&self->_axisAlignedDistanceFromFocusedRect;
  return v4;
}

- (id)visualRepresentationColor
{
  if (qword_1EB25E720 != -1) {
    dispatch_once(&qword_1EB25E720, &__block_literal_global_313);
  }
  uint64_t v3 = qword_1EB25E718;
  v4 = [(_UIFocusContainerGuideMapEntry *)self focusContainerGuide];
  v5 = [(_UIFocusRegionMapEntry *)self _uniqueElementFromArray:v3 forKey:v4];

  return v5;
}

- (void)drawVisualRepresentationInContext:(CGContext *)a3 imageFrame:(CGRect)a4
{
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(_UIFocusContainerGuideMapEntry *)self focusContainmentFrame];
  CGRect v19 = CGRectOffset(v18, -x, -y);
  double v8 = v19.origin.x;
  double v9 = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;
  v12 = [(_UIFocusContainerGuideMapEntry *)self visualRepresentationColor];
  id v13 = [v12 colorWithAlphaComponent:0.1];
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v13 CGColor]);

  v20.origin.double x = v8;
  v20.origin.double y = v9;
  v20.size.double width = width;
  v20.size.double height = height;
  CGContextFillRect(a3, v20);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v8, v9, width, height, 12.0);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [v16 setLineDash:&drawVisualRepresentationInContext_imageFrame__dashedLineLength count:1 phase:0.0];
  [v16 setLineWidth:4.0];
  v14 = [(_UIFocusContainerGuideMapEntry *)self visualRepresentationColor];
  id v15 = [v14 colorWithAlphaComponent:0.5];
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v15 CGColor]);

  [v16 stroke];
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(_UIFocusRegionMapEntry *)self frame];
  v6 = NSStringFromCGRect(v14);
  v7 = [(_UIFocusContainerGuideMapEntry *)self focusContainerGuide];
  double v8 = (objc_class *)objc_opt_class();
  double v9 = NSStringFromClass(v8);
  v10 = [(_UIFocusContainerGuideMapEntry *)self focusContainerGuide];
  v11 = [v3 stringWithFormat:@"<%@: %p frame=%@, container=%@: %p>", v5, self, v6, v9, v10];

  return v11;
}

- (UIFocusContainerGuide)focusContainerGuide
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusContainerGuide);
  return (UIFocusContainerGuide *)WeakRetained;
}

- (void)setFocusContainerGuide:(id)a3
{
}

- (CGRect)focusContainmentFrame
{
  double x = self->_focusContainmentFrame.origin.x;
  double y = self->_focusContainmentFrame.origin.y;
  double width = self->_focusContainmentFrame.size.width;
  double height = self->_focusContainmentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFocusContainmentFrame:(CGRect)a3
{
  self->_focusContainmentFrame = a3;
}

- (double)axisAlignedDistanceFromFocusedRect
{
  return self->_axisAlignedDistanceFromFocusedRect;
}

- (void)setAxisAlignedDistanceFromFocusedRect:(double)a3
{
  self->_axisAlignedDistanceFromFocusedRect = a3;
}

- (void).cxx_destruct
{
}

@end