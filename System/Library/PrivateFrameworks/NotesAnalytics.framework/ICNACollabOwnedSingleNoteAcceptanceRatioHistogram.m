@interface ICNACollabOwnedSingleNoteAcceptanceRatioHistogram
- (void)setup;
@end

@implementation ICNACollabOwnedSingleNoteAcceptanceRatioHistogram

- (void)setup
{
  [(ICNAHistogramBase *)self setBucketLeftBounds:&unk_1F1F92570];
  [(ICNAHistogramBase *)self setValuePrecision:0.01];
  [(ICNAHistogramBase *)self setValueMax:&unk_1F1F90560];
}

@end