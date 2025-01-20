@interface SBIconLabelAccessoryView
+ (NSString)labelAccessorySystemImageName;
+ (int64_t)labelAccessorySystemImageScale;
- (BOOL)hasBaseline;
- (CGSize)intrinsicContentSize;
- (SBIconLabelAccessoryView)initWithCoder:(id)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImage)baseImage;
- (double)baselineOffsetFromBottom;
- (void)setBaseImage:(id)a3;
- (void)updateWithLegibilitySettings:(id)a3 labelFont:(id)a4;
@end

@implementation SBIconLabelAccessoryView

+ (NSString)labelAccessorySystemImageName
{
  return (NSString *)&stru_1F2FA0300;
}

+ (int64_t)labelAccessorySystemImageScale
{
  return 0;
}

- (SBIconLabelAccessoryView)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This class does not support unarchiving from a nib" userInfo:0];
  objc_exception_throw(v4);
}

- (void)updateWithLegibilitySettings:(id)a3 labelFont:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() labelAccessorySystemImageName];
  v9 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithFont:scale:", v6, objc_msgSend((id)objc_opt_class(), "labelAccessorySystemImageScale"));

  v10 = [MEMORY[0x1E4FB1818] systemImageNamed:v8 withConfiguration:v9];
  if (!v10)
  {
    v11 = SBLogIcon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SBIconLabelAccessoryView updateWithLegibilitySettings:labelFont:]((uint64_t)v8, v11);
    }
  }
  [(SBIconLabelAccessoryView *)self setBaseImage:v10];
  [(SBIconLabelAccessoryView *)self updateWithBaseImage:v10 legibilitySettings:v7];

  [(SBIconLabelAccessoryView *)self invalidateIntrinsicContentSize];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(SBIconLabelAccessoryView *)self baseImage];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)hasBaseline
{
  return 0;
}

- (double)baselineOffsetFromBottom
{
  return 0.0;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIImage)baseImage
{
  return self->_baseImage;
}

- (void)setBaseImage:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)updateWithLegibilitySettings:(uint64_t)a1 labelFont:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Failed to find system image named '%{public}@' for label accessory view!", (uint8_t *)&v2, 0xCu);
}

@end