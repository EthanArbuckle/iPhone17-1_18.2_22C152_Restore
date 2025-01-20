@interface RCRecordingControlLayoutHelper
- (CGRect)labelLozengeRectWithLabelIntrinsicWidth:(double)a3 recordingControlCenterPoint:(CGPoint)a4;
- (_TtC10VoiceMemos30RCRecordingControlLayoutHelper)init;
- (_TtC10VoiceMemos30RCRecordingControlLayoutHelper)initWithDiameter:(double)a3;
- (double)labelLozengeHeight;
- (double)labelLozengeHorizontalPadding;
- (double)labelLozengeWidthWithPaddedLabelWidth:(double)a3;
- (double)paddedLabelWidthWithLabelIntrinsicWidth:(double)a3;
- (double)recordingControlHeight;
- (double)recordingControlInnerSquareWidth;
- (double)recordingControlLozengeFixedWidth;
- (double)recordingControlOuterRingGap;
- (double)recordingControlOuterRingThickness;
- (double)recordingControlPauseGap;
- (double)recordingControlPauseStrokeCornerRadius;
- (double)recordingControlSquareCornerRadius;
- (double)recordingControlWidthWithLabelIntrinsicWidth:(double)a3;
@end

@implementation RCRecordingControlLayoutHelper

- (_TtC10VoiceMemos30RCRecordingControlLayoutHelper)initWithDiameter:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos30RCRecordingControlLayoutHelper_diameter) = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RCRecordingControlLayoutHelper();
  return [(RCRecordingControlLayoutHelper *)&v4 init];
}

- (double)recordingControlOuterRingThickness
{
  return sub_10010017C((char *)self, (uint64_t)a2, (SEL *)&selRef_recordingControlOuterRingThicknessScaleFactor);
}

- (double)recordingControlOuterRingGap
{
  return sub_10010017C((char *)self, (uint64_t)a2, (SEL *)&selRef_recordingControlOuterRingGapScaleFactor);
}

- (double)recordingControlInnerSquareWidth
{
  return sub_10010017C((char *)self, (uint64_t)a2, (SEL *)&selRef_recordingControlInnerSquareWidthScaleFactor);
}

- (double)recordingControlSquareCornerRadius
{
  return sub_10010017C((char *)self, (uint64_t)a2, (SEL *)&selRef_recordingControlSquareCornerRadiusScaleFactor);
}

- (double)recordingControlPauseGap
{
  return sub_10010017C((char *)self, (uint64_t)a2, (SEL *)&selRef_recordingControlPauseGapScaleFactor);
}

- (double)recordingControlPauseStrokeCornerRadius
{
  return sub_10010017C((char *)self, (uint64_t)a2, (SEL *)&selRef_recordingControlPauseStrokeCornerRadiusScaleFactor);
}

- (double)recordingControlLozengeFixedWidth
{
  return sub_10010017C((char *)self, (uint64_t)a2, (SEL *)&selRef_recordingControlLozengeFixedWidthScaleFactor);
}

- (double)recordingControlHeight
{
  v3 = self;
  objc_super v4 = self;
  id v5 = [v3 sharedStyleProvider];
  [v5 recordingControlHeightForDiameter:*(double *)((char *)&v4->super.isa + OBJC_IVAR____TtC10VoiceMemos30RCRecordingControlLayoutHelper_diameter)];
  double v7 = v6;

  return v7;
}

- (double)recordingControlWidthWithLabelIntrinsicWidth:(double)a3
{
  id v5 = self;
  double v6 = self;
  id v7 = [v5 sharedStyleProvider];
  double v8 = *(double *)((char *)&v6->super.isa + OBJC_IVAR____TtC10VoiceMemos30RCRecordingControlLayoutHelper_diameter);
  [v7 recordingControlHeightForDiameter:v8];
  double v10 = v9;

  id v11 = [v5 sharedStyleProvider];
  [v11 recordingControlLozengeFixedWidthScaleFactor];
  double v13 = v12;

  double v14 = v8 * v13;
  if (v8 * v13 < a3) {
    double v14 = a3;
  }
  return v10 + v10 + v14;
}

- (CGRect)labelLozengeRectWithLabelIntrinsicWidth:(double)a3 recordingControlCenterPoint:(CGPoint)a4
{
  double x = a4.x;
  double v6 = self;
  double v7 = sub_100100364(a3, x);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.double x = v14;
  return result;
}

- (double)labelLozengeHeight
{
  v2 = self;
  double v3 = sub_1001004A0();

  return v3;
}

- (double)labelLozengeWidthWithPaddedLabelWidth:(double)a3
{
  objc_super v4 = self;
  double v5 = sub_1001004A0();

  return v5 + a3;
}

- (double)labelLozengeHorizontalPadding
{
  v2 = self;
  double v3 = sub_1001004A0();

  return v3;
}

- (double)paddedLabelWidthWithLabelIntrinsicWidth:(double)a3
{
  double v5 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos30RCRecordingControlLayoutHelper_diameter);
  double v6 = self;
  double v7 = self;
  id v8 = [v6 sharedStyleProvider];
  [v8 recordingControlLozengeFixedWidthScaleFactor];
  double v10 = v9;

  double result = v5 * v10;
  if (v5 * v10 < a3) {
    return a3;
  }
  return result;
}

- (_TtC10VoiceMemos30RCRecordingControlLayoutHelper)init
{
  double result = (_TtC10VoiceMemos30RCRecordingControlLayoutHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end