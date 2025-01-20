@interface ICNAInlineDrawingV2FingerStrokeRatioHistogram
- (void)setup;
@end

@implementation ICNAInlineDrawingV2FingerStrokeRatioHistogram

- (void)setup
{
  [(ICNAHistogramBase *)self setBucketLeftBounds:&unk_1F1F925D0];
  [(ICNAHistogramBase *)self setValuePrecision:0.01];
  [(ICNAHistogramBase *)self setValueMax:&unk_1F1F91088];
}

@end