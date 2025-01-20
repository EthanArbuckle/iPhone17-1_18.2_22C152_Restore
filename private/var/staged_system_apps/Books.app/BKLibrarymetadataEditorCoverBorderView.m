@interface BKLibrarymetadataEditorCoverBorderView
- (void)drawRect:(CGRect)a3;
@end

@implementation BKLibrarymetadataEditorCoverBorderView

- (void)drawRect:(CGRect)a3
{
  v4 = +[UIColor tertiaryLabelColor];
  [v4 setStroke];

  [(BKLibrarymetadataEditorCoverBorderView *)self bounds];
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  mainScreenScaleFactor();
  double v6 = v5;
  double v7 = 1.0;
  if (v6 != 0.0) {
    double v7 = 1.0 / v6 + 1.0 / v6;
  }
  [v8 setLineWidth:v7];
  [v8 stroke];
}

@end