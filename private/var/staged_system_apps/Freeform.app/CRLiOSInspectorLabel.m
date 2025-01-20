@interface CRLiOSInspectorLabel
- (BOOL)containsTrailingMargin;
- (BOOL)p_isAccessibilitySize;
- (CGSize)intrinsicContentSize;
- (CRLiOSInspectorLabel)initWithFrame:(CGRect)a3;
- (int64_t)externalNumberOfLines;
- (void)setContainsTrailingMargin:(BOOL)a3;
- (void)setExternalNumberOfLines:(int64_t)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setText:(id)a3;
- (void)updateConstraints;
@end

@implementation CRLiOSInspectorLabel

- (CRLiOSInspectorLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSInspectorLabel;
  v3 = -[CRLiOSInspectorLabel initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CRLiOSInspectorLabel *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CRLiOSInspectorLabel *)v4 setAdjustsFontSizeToFitWidth:1];
    [(CRLiOSInspectorLabel *)v4 setMinimumScaleFactor:0.5];
    [(CRLiOSInspectorLabel *)v4 setNumberOfLines:0];
    [(CRLiOSInspectorLabel *)v4 setAllowsDefaultTighteningForTruncation:1];
    [(CRLiOSInspectorLabel *)v4 setLineBreakMode:4];
  }
  return v4;
}

- (void)updateConstraints
{
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSInspectorLabel;
  [(CRLiOSInspectorLabel *)&v7 updateConstraints];
  unsigned int v3 = [(CRLiOSInspectorLabel *)self p_isAccessibilitySize];
  int64_t v4 = [(CRLiOSInspectorLabel *)self externalNumberOfLines];
  if (v3)
  {
    -[CRLiOSInspectorLabel setNumberOfLines:](&v6, "setNumberOfLines:", v4, v5.receiver, v5.super_class, self, CRLiOSInspectorLabel);
  }
  else if (!v4)
  {
    -[CRLiOSInspectorLabel setNumberOfLines:](&v5, "setNumberOfLines:", 2, self, CRLiOSInspectorLabel, v6.receiver, v6.super_class);
  }
}

- (CGSize)intrinsicContentSize
{
  v11.receiver = self;
  v11.super_class = (Class)CRLiOSInspectorLabel;
  [(CRLiOSInspectorLabel *)&v11 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  unsigned int v7 = [(CRLiOSInspectorLabel *)self containsTrailingMargin];
  double v8 = 16.0;
  if (!v7) {
    double v8 = -0.0;
  }
  double v9 = v4 + v8;
  double v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setNumberOfLines:(int64_t)a3
{
  -[CRLiOSInspectorLabel setExternalNumberOfLines:](self, "setExternalNumberOfLines:");
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInspectorLabel;
  [(CRLiOSInspectorLabel *)&v5 setNumberOfLines:a3];
}

- (void)setText:(id)a3
{
}

- (BOOL)p_isAccessibilitySize
{
  v2 = +[UIApplication sharedApplication];
  double v3 = [v2 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (BOOL)containsTrailingMargin
{
  return self->_containsTrailingMargin;
}

- (void)setContainsTrailingMargin:(BOOL)a3
{
  self->_containsTrailingMargin = a3;
}

- (int64_t)externalNumberOfLines
{
  return self->_externalNumberOfLines;
}

- (void)setExternalNumberOfLines:(int64_t)a3
{
  self->_externalNumberOfLines = a3;
}

@end