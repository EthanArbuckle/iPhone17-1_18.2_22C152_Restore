@interface _UIPickerViewStyle_iOS
- (BOOL)sizeIsValid:(CGSize)a3;
- (CATransform3D)perspectiveTransform;
- (CATransform3D)transformForCellAtY:(SEL)a3 inBounds:(double)a4 rowHeight:(CGRect)a5 selectionBarRect:(double)a6;
- (CGSize)defaultSizeForTraitCollection:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3 forTraitCollection:(id)a4;
- (double)_distanceToCenterForY:(double)a3 inBounds:(CGRect)a4;
- (double)_rotationForCellCenterY:(double)a3 inBounds:(CGRect)a4 rowHeight:(double)a5;
- (double)_unitYForViewY:(double)a3 inBounds:(CGRect)a4;
- (double)_viewYForUnitY:(double)a3 inBounds:(CGRect)a4;
- (double)_yForY:(double)a3 inBounds:(CGRect)a4 rowHeight:(double)a5;
- (double)_yRangingFromZeroTo:(double)a3 forUnitY:(double)a4;
- (double)_zCoordinateForYCoordinate:(double)a3 inBounds:(CGRect)a4;
- (double)_zForUnitY:(double)a3 inBounds:(CGRect)a4 rowHeight:(double)a5;
- (double)defaultRowHeightForSize:(CGSize)a3;
- (double)horizontalBiasForEndTablesWithColumnFrame:(CGRect)a3 tableFrame:(CGRect)a4;
- (double)horizontalPaddingForCenterHighlightView;
- (double)horizontalPaddingForContents;
- (double)labelSideOffset;
- (double)paddingAroundWheels;
- (double)paddingBetweenWheels;
- (double)selectionBarSideInset;
- (double)verticalPaddingForCenterHighlightView;
- (id)createCenterHighlightView;
- (void)configureMaskGradientLayer:(id)a3;
@end

@implementation _UIPickerViewStyle_iOS

- (CGSize)defaultSizeForTraitCollection:(id)a3
{
  id v3 = a3;
  if (!dyld_program_sdk_at_least())
  {
    v6 = +[UIDevice currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      uint64_t v5 = 0x4074000000000000;
    }
    else
    {
      uint64_t v8 = [v3 verticalSizeClass];
      v9 = +[UIScreen mainScreen];
      v10 = v9;
      if (v8 == 1)
      {
        [v9 _boundsForInterfaceOrientation:4];
        uint64_t v5 = v11;

        double v4 = 162.0;
        goto LABEL_12;
      }
      [v9 _boundsForInterfaceOrientation:1];
      uint64_t v5 = v12;
    }
    double v4 = 216.0;
    goto LABEL_12;
  }
  if ([v3 verticalSizeClass] == 1) {
    double v4 = 162.0;
  }
  else {
    double v4 = 216.0;
  }
  uint64_t v5 = 0x4074000000000000;
LABEL_12:

  double v13 = *(double *)&v5;
  double v14 = v4;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forTraitCollection:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  [(_UIPickerViewStyle_iOS *)self defaultSizeForTraitCollection:a4];
  if (height != 0.0)
  {
    double v7 = 216.0;
    if (height < 216.0) {
      double v7 = dbl_186B98F90[height < 180.0];
    }
  }
  if (width != 0.0) {
    double v6 = width;
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (BOOL)sizeIsValid:(CGSize)a3
{
  double height = a3.height;
  if (dyld_program_sdk_at_least()) {
    return 1;
  }
  BOOL v5 = height == 216.0;
  if (height == 180.0) {
    BOOL v5 = 1;
  }
  return height == 162.0 || v5;
}

- (double)defaultRowHeightForSize:(CGSize)a3
{
  double result = 32.0;
  if (a3.height < 216.0) {
    return 24.0;
  }
  return result;
}

- (double)paddingBetweenWheels
{
  return 5.0;
}

- (double)paddingAroundWheels
{
  return 0.0;
}

- (double)selectionBarSideInset
{
  return 9.0;
}

- (double)labelSideOffset
{
  return 9.0;
}

- (CATransform3D)perspectiveTransform
{
  id v3 = (_OWORD *)MEMORY[0x1E4F39B10];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&retstr->m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&retstr->m33 = v4;
  long long v5 = v3[7];
  *(_OWORD *)&retstr->m41 = v3[6];
  *(_OWORD *)&retstr->m43 = v5;
  long long v6 = v3[1];
  *(_OWORD *)&retstr->m11 = *v3;
  *(_OWORD *)&retstr->m13 = v6;
  long long v7 = v3[3];
  *(_OWORD *)&retstr->m21 = v3[2];
  *(_OWORD *)&retstr->m23 = v7;
  retstr->m34 = -0.00111111111;
  return self;
}

- (void)configureMaskGradientLayer:(id)a3
{
  v11[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[UIColor colorWithWhite:0.0 alpha:0.0];
  long long v5 = [v4 CGColor];

  id v6 = +[UIColor colorWithWhite:0.0 alpha:0.71];
  long long v7 = [v6 CGColor];

  id v8 = +[UIColor colorWithWhite:0.0 alpha:0.8];
  v9 = [v8 CGColor];

  v11[0] = v5;
  v11[1] = v7;
  v11[2] = v9;
  v11[3] = v9;
  v11[4] = v7;
  v11[5] = v5;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];
  [v3 setColors:v10];

  [v3 setLocations:&unk_1ED3EFD88];
}

- (id)createCenterHighlightView
{
  v2 = objc_opt_new();
  id v3 = +[UIColor quaternarySystemFillColor];
  [v2 setBackgroundColor:v3];

  [v2 _setContinuousCornerRadius:8.0];
  return v2;
}

- (double)horizontalPaddingForCenterHighlightView
{
  int v2 = dyld_program_sdk_at_least();
  double result = 0.0;
  if (v2) {
    return 9.0;
  }
  return result;
}

- (double)verticalPaddingForCenterHighlightView
{
  return 2.0;
}

- (double)horizontalPaddingForContents
{
  int v2 = dyld_program_sdk_at_least();
  double result = 0.0;
  if (v2) {
    return 9.0;
  }
  return result;
}

- (double)_zCoordinateForYCoordinate:(double)a3 inBounds:(CGRect)a4
{
  float v4 = a3 / a4.size.height + -0.5;
  return (float)(cosf(v4) + -1.0);
}

- (double)_unitYForViewY:(double)a3 inBounds:(CGRect)a4
{
  return a3 / a4.size.height + -0.5 + a3 / a4.size.height + -0.5;
}

- (double)_yRangingFromZeroTo:(double)a3 forUnitY:(double)a4
{
  return (a4 * 0.5 + 0.5) * a3;
}

- (double)_viewYForUnitY:(double)a3 inBounds:(CGRect)a4
{
  -[_UIPickerViewStyle_iOS _yRangingFromZeroTo:forUnitY:](self, "_yRangingFromZeroTo:forUnitY:", a4.size.height, a3, a4.origin.y, a4.size.width);
  return result;
}

- (double)_zForUnitY:(double)a3 inBounds:(CGRect)a4 rowHeight:(double)a5
{
  double height = a4.size.height;
  -[_UIPickerViewStyle_iOS _viewYForUnitY:inBounds:](self, "_viewYForUnitY:inBounds:", a3);
  -[_UIPickerViewStyle_iOS _rotationForCellCenterY:inBounds:rowHeight:](self, "_rotationForCellCenterY:inBounds:rowHeight:");
  *(float *)&double v7 = v7;
  return height / 3.14159265 * 1.05 * cosf(*(float *)&v7) - height / 3.14159265 * 1.05;
}

- (double)_distanceToCenterForY:(double)a3 inBounds:(CGRect)a4
{
  return a4.size.height * 0.5 - a3;
}

- (double)_yForY:(double)a3 inBounds:(CGRect)a4 rowHeight:(double)a5
{
  double height = a4.size.height;
  -[_UIPickerViewStyle_iOS _rotationForCellCenterY:inBounds:rowHeight:](self, "_rotationForCellCenterY:inBounds:rowHeight:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
  *(float *)&double v6 = v6;
  return height / -3.14159265 * 1.05 * sinf(*(float *)&v6);
}

- (double)_rotationForCellCenterY:(double)a3 inBounds:(CGRect)a4 rowHeight:(double)a5
{
  float v5 = (a4.size.height + a4.size.height) / a5;
  return (a3 + a4.size.height * -0.5) / a5 * -6.28318531 / ceilf(v5);
}

- (CATransform3D)transformForCellAtY:(SEL)a3 inBounds:(double)a4 rowHeight:(CGRect)a5 selectionBarRect:(double)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v15 = (long long *)MEMORY[0x1E4F39B10];
  long long v49 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v50 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&retstr->m31 = v50;
  *(_OWORD *)&retstr->m33 = v49;
  long long v47 = v15[7];
  long long v48 = v15[6];
  *(_OWORD *)&retstr->m41 = v48;
  *(_OWORD *)&retstr->m43 = v47;
  long long v45 = v15[1];
  long long v46 = *v15;
  *(_OWORD *)&retstr->m11 = *v15;
  *(_OWORD *)&retstr->m13 = v45;
  long long v43 = v15[3];
  long long v44 = v15[2];
  *(_OWORD *)&retstr->m21 = v44;
  *(_OWORD *)&retstr->m23 = v43;
  memset(&v56, 0, sizeof(v56));
  -[_UIPickerViewStyle_iOS _rotationForCellCenterY:inBounds:rowHeight:](self, "_rotationForCellCenterY:inBounds:rowHeight:", a4, a5.origin.x);
  CATransform3DMakeRotation(&v56, v16, 1.0, 0.0, 0.0);
  memset(&v55, 0, sizeof(v55));
  -[_UIPickerViewStyle_iOS _distanceToCenterForY:inBounds:](self, "_distanceToCenterForY:inBounds:", a4, x, y, width, height);
  CATransform3DMakeTranslation(&v55, 0.0, v17, 0.0);
  memset(&v54, 0, sizeof(v54));
  -[_UIPickerViewStyle_iOS _yForY:inBounds:rowHeight:](self, "_yForY:inBounds:rowHeight:", a4, x, y, width, height, a6);
  CGFloat v19 = v18;
  -[_UIPickerViewStyle_iOS _unitYForViewY:inBounds:](self, "_unitYForViewY:inBounds:", a4, x, y, width, height);
  -[_UIPickerViewStyle_iOS _zForUnitY:inBounds:rowHeight:](self, "_zForUnitY:inBounds:rowHeight:");
  CATransform3DMakeTranslation(&v54, 0.0, v19, v20);
  double result = (CATransform3D *)-[_UIPickerViewStyle_iOS _distanceToCenterForY:inBounds:](self, "_distanceToCenterForY:inBounds:", a4, x, y, width, height);
  if (fabs(v22) > a7.size.height * 0.5)
  {
    *(_OWORD *)&a.m31 = v50;
    *(_OWORD *)&a.m33 = v49;
    *(_OWORD *)&a.m41 = v48;
    *(_OWORD *)&a.m43 = v47;
    *(_OWORD *)&a.m11 = v46;
    *(_OWORD *)&a.m13 = v45;
    *(_OWORD *)&a.m21 = v44;
    *(_OWORD *)&a.m23 = v43;
    CATransform3D b = v56;
    CATransform3DConcat(&v53, &a, &b);
    long long v23 = *(_OWORD *)&v53.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v53.m31;
    *(_OWORD *)&retstr->m33 = v23;
    long long v24 = *(_OWORD *)&v53.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v53.m41;
    *(_OWORD *)&retstr->m43 = v24;
    long long v25 = *(_OWORD *)&v53.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v53.m11;
    *(_OWORD *)&retstr->m13 = v25;
    long long v26 = *(_OWORD *)&v53.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v53.m21;
    *(_OWORD *)&retstr->m23 = v26;
    long long v27 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&a.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&a.m33 = v27;
    long long v28 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&a.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&a.m43 = v28;
    long long v29 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&a.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&a.m13 = v29;
    long long v30 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&a.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&a.m23 = v30;
    CATransform3D b = v55;
    CATransform3DConcat(&v53, &a, &b);
    long long v31 = *(_OWORD *)&v53.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v53.m31;
    *(_OWORD *)&retstr->m33 = v31;
    long long v32 = *(_OWORD *)&v53.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v53.m41;
    *(_OWORD *)&retstr->m43 = v32;
    long long v33 = *(_OWORD *)&v53.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v53.m11;
    *(_OWORD *)&retstr->m13 = v33;
    long long v34 = *(_OWORD *)&v53.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v53.m21;
    *(_OWORD *)&retstr->m23 = v34;
    long long v35 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&a.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&a.m33 = v35;
    long long v36 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&a.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&a.m43 = v36;
    long long v37 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&a.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&a.m13 = v37;
    long long v38 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&a.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&a.m23 = v38;
    CATransform3D b = v54;
    double result = CATransform3DConcat(&v53, &a, &b);
    long long v39 = *(_OWORD *)&v53.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v53.m31;
    *(_OWORD *)&retstr->m33 = v39;
    long long v40 = *(_OWORD *)&v53.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v53.m41;
    *(_OWORD *)&retstr->m43 = v40;
    long long v41 = *(_OWORD *)&v53.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v53.m11;
    *(_OWORD *)&retstr->m13 = v41;
    long long v42 = *(_OWORD *)&v53.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v53.m21;
    *(_OWORD *)&retstr->m23 = v42;
  }
  return result;
}

- (double)horizontalBiasForEndTablesWithColumnFrame:(CGRect)a3 tableFrame:(CGRect)a4
{
  double width = a4.size.width;
  double x = a4.origin.x;
  double v6 = a3.size.width;
  double MidX = CGRectGetMidX(a3);
  double v8 = 0.0;
  if (floor(width) > ceil(v6 / 3.0)) {
    return (x + width * 0.5 - MidX) / -10.0;
  }
  return v8;
}

@end