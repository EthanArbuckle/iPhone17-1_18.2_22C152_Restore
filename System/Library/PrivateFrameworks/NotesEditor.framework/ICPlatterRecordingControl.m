@interface ICPlatterRecordingControl
- (CGSize)intrinsicContentSize;
- (ICPlatterRecordingControl)initWithDiameter:(double)a3;
@end

@implementation ICPlatterRecordingControl

- (ICPlatterRecordingControl)initWithDiameter:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICPlatterRecordingControl;
  v3 = [(ICRecordingControl *)&v6 initWithDiameter:a3];
  v4 = v3;
  if (v3) {
    [(ICRecordingControl *)v3 setRecordingControlState:2 animated:0 force:0];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  [(ICRecordingControl *)self diameter];
  double v3 = v2 + -2.0;
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

@end