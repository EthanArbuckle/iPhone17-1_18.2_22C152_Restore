@interface PUPickerSegmentedControl
- (BOOL)_isFullWidthControl;
- (CGSize)intrinsicContentSize;
- (PUPickerSegmentedControl)initWithItems:(id)a3;
@end

@implementation PUPickerSegmentedControl

- (CGSize)intrinsicContentSize
{
  if ([(PUPickerSegmentedControl *)self _isFullWidthControl])
  {
    double v3 = *MEMORY[0x1E4FB2C70];
    v8.receiver = self;
    v8.super_class = (Class)PUPickerSegmentedControl;
    [(PUPickerSegmentedControl *)&v8 intrinsicContentSize];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUPickerSegmentedControl;
    [(PUPickerSegmentedControl *)&v7 intrinsicContentSize];
    double v3 = v5;
  }
  double v6 = v3;
  result.height = v4;
  result.width = v6;
  return result;
}

- (PUPickerSegmentedControl)initWithItems:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPickerSegmentedControl;
  double v3 = [(PUPickerSegmentedControl *)&v6 initWithItems:a3];
  double v4 = v3;
  if (v3 && [(PUPickerSegmentedControl *)v3 _isFullWidthControl]) {
    [(PUPickerSegmentedControl *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v4;
}

- (BOOL)_isFullWidthControl
{
  return 0;
}

@end