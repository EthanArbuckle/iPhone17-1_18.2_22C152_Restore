@interface _UIFocusableRegionMapEntry
- (BOOL)isFocusCandidate;
- (BOOL)isFocusGuide;
- (_UILegacyFocusRegion)focusableRegion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)visualRepresentationColor;
- (void)drawVisualRepresentationInContext:(CGContext *)a3 imageFrame:(CGRect)a4 isFinal:(BOOL)a5;
- (void)setFocusCandidate:(BOOL)a3;
- (void)setFocusableRegion:(id)a3;
- (void)setIsFocusGuide:(BOOL)a3;
@end

@implementation _UIFocusableRegionMapEntry

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFocusableRegionMapEntry;
  v4 = [(_UIFocusRegionMapEntry *)&v7 copyWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusableRegion);
  objc_storeWeak(v4 + 13, WeakRetained);

  *((unsigned char *)v4 + 96) = self->_isFocusGuide;
  *((unsigned char *)v4 + 97) = self->_focusCandidate;
  return v4;
}

- (id)visualRepresentationColor
{
  if ([(_UIFocusableRegionMapEntry *)self isFocusGuide])
  {
    if (qword_1EB25E700 != -1) {
      dispatch_once(&qword_1EB25E700, &__block_literal_global_278);
    }
    uint64_t v3 = qword_1EB25E6F8;
  }
  else
  {
    if (qword_1EB25E710 != -1) {
      dispatch_once(&qword_1EB25E710, &__block_literal_global_282_1);
    }
    uint64_t v3 = qword_1EB25E708;
  }
  v4 = [(_UIFocusableRegionMapEntry *)self focusableRegion];
  v5 = [(_UIFocusRegionMapEntry *)self _uniqueElementFromArray:v3 forKey:v4];

  return v5;
}

- (void)drawVisualRepresentationInContext:(CGContext *)a3 imageFrame:(CGRect)a4 isFinal:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(_UIFocusRegionMapEntry *)self frame];
  CGRect v41 = CGRectOffset(v40, -x, -y);
  if (v5)
  {
    CGFloat v10 = v41.origin.x;
    CGFloat v11 = v41.origin.y;
    CGFloat width = v41.size.width;
    CGFloat height = v41.size.height;
    v14 = [(_UIFocusableRegionMapEntry *)self visualRepresentationColor];
    id v15 = [v14 colorWithAlphaComponent:0.5];
    CGContextSetFillColorWithColor(a3, (CGColorRef)[v15 CGColor]);

    v42.origin.double x = v10;
    v42.origin.double y = v11;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    CGContextFillRect(a3, v42);
    v16 = [(_UIFocusRegionMapEntry *)self visualRepresentationPatternType];
    if (v16)
    {
      v17 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC10]);
      Pattern = CGColorSpaceCreatePattern(v17);
      CGContextSetFillColorSpace(a3, Pattern);
      CGColorSpaceRelease(Pattern);
      CGColorSpaceRelease(v17);
      switch((unint64_t)v16)
      {
        case 1uLL:
          long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          *(_OWORD *)&matrix.a = *MEMORY[0x1E4F1DAB8];
          *(_OWORD *)&matrix.c = v19;
          *(_OWORD *)&matrix.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks;
          goto LABEL_11;
        case 2uLL:
          CGAffineTransformMakeRotation(&matrix, 0.785398163);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks_343;
          goto LABEL_13;
        case 3uLL:
          long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          *(_OWORD *)&matrix.a = *MEMORY[0x1E4F1DAB8];
          *(_OWORD *)&matrix.c = v21;
          *(_OWORD *)&matrix.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks_344;
          goto LABEL_11;
        case 4uLL:
          CGAffineTransformMakeRotation(&matrix, 1.57079633);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks_345;
          goto LABEL_11;
        case 5uLL:
          CGAffineTransformMakeRotation(&matrix, 0.785398163);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks_346;
          goto LABEL_11;
        case 6uLL:
          CGAffineTransformMakeRotation(&matrix, 2.35619449);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks_347;
LABEL_11:
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          double v24 = 30.0;
          double v25 = 30.0;
          CGFloat v26 = 30.0;
          CGFloat v27 = 30.0;
          goto LABEL_14;
        case 7uLL:
          CGAffineTransformMakeRotation(&matrix, 2.35619449);
          v20 = (const CGPatternCallbacks *)&_UIFocusRegionMapEntryPatternCreateWithType_callbacks_348;
LABEL_13:
          double v24 = 22.5;
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          double v25 = 22.5;
          CGFloat v26 = 22.5;
          CGFloat v27 = 22.5;
LABEL_14:
          v16 = CGPatternCreate(0, *(CGRect *)&v22, &matrix, v26, v27, kCGPatternTilingConstantSpacing, 0, v20);
          break;
        default:
          v16 = 0;
          break;
      }
    }
    v28 = [(_UIFocusableRegionMapEntry *)self visualRepresentationColor];
    BOOL v29 = [(_UIFocusableRegionMapEntry *)self isFocusGuide];
    double v30 = 0.3;
    if (v29) {
      double v30 = 0.4;
    }
    id v31 = [v28 colorWithAlphaComponent:v30];
    Components = CGColorGetComponents((CGColorRef)[v31 CGColor]);
    CGContextSetFillPattern(a3, v16, Components);

    v43.origin.double x = v10;
    v43.origin.double y = v11;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    CGContextFillRect(a3, v43);
    CGPatternRelease(v16);
    id v33 = [(_UIFocusableRegionMapEntry *)self visualRepresentationColor];
    CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v33 CGColor]);

    v44.origin.double x = v10;
    v44.origin.double y = v11;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    CGContextStrokeRect(a3, v44);
    if ([(_UIFocusableRegionMapEntry *)self isFocusCandidate])
    {
      CGContextSaveGState(a3);
      v45.origin.double x = v10;
      v45.origin.double y = v11;
      v45.size.CGFloat width = width;
      v45.size.CGFloat height = height;
      CGRect v46 = CGRectInset(v45, -6.0, -6.0);
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v46.origin.x, v46.origin.y, v46.size.width, v46.size.height, 12.0);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      [v37 setLineWidth:3.0];
      v34 = +[UIColor redColor];
      v35 = [v34 colorWithAlphaComponent:0.5];
      id v36 = [v35 colorWithAlphaComponent:0.5];
      CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v36 CGColor]);

      [v37 stroke];
      CGContextRestoreGState(a3);
    }
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  [(_UIFocusRegionMapEntry *)self frame];
  v6 = NSStringFromCGRect(v14);
  objc_super v7 = [(_UIFocusableRegionMapEntry *)self focusableRegion];
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  CGFloat v10 = [(_UIFocusableRegionMapEntry *)self focusableRegion];
  CGFloat v11 = [v3 stringWithFormat:@"<%@: %p frame=%@, region=%@: %p>", v5, self, v6, v9, v10];

  return v11;
}

- (_UILegacyFocusRegion)focusableRegion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusableRegion);
  return (_UILegacyFocusRegion *)WeakRetained;
}

- (void)setFocusableRegion:(id)a3
{
}

- (BOOL)isFocusGuide
{
  return self->_isFocusGuide;
}

- (void)setIsFocusGuide:(BOOL)a3
{
  self->_isFocusGuide = a3;
}

- (BOOL)isFocusCandidate
{
  return self->_focusCandidate;
}

- (void)setFocusCandidate:(BOOL)a3
{
  self->_focusCandidate = a3;
}

- (void).cxx_destruct
{
}

@end