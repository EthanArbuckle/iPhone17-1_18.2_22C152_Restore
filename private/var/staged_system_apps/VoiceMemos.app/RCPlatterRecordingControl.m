@interface RCPlatterRecordingControl
- (CGSize)intrinsicContentSize;
- (RCPlatterRecordingControl)initWithDiameter:(double)a3;
@end

@implementation RCPlatterRecordingControl

- (RCPlatterRecordingControl)initWithDiameter:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCPlatterRecordingControl;
  v3 = [(RCRecordingControl *)&v6 initWithDiameter:a3];
  v4 = v3;
  if (v3) {
    [(RCRecordingControl *)v3 setRecordingControlState:2 animated:0 force:0];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  [(RCRecordingControl *)self diameter];
  [v3 recordingControlHeightForDiameter:];
  double v5 = v4;

  double v6 = v5;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

@end