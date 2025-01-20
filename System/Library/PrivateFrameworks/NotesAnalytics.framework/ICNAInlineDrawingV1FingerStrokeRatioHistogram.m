@interface ICNAInlineDrawingV1FingerStrokeRatioHistogram
- (void)setup;
@end

@implementation ICNAInlineDrawingV1FingerStrokeRatioHistogram

- (void)setup
{
  [(ICNAHistogramBase *)self setBucketLeftBounds:&unk_1F1F92468];
  [(ICNAHistogramBase *)self setValuePrecision:0.01];
  [(ICNAHistogramBase *)self setValueMax:&unk_1F1F8E5E0];
}

@end