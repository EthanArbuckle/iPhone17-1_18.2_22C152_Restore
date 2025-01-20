@interface ICNACollabOwnedRootFolderAcceptanceRatioHistogram
- (void)setup;
@end

@implementation ICNACollabOwnedRootFolderAcceptanceRatioHistogram

- (void)setup
{
  [(ICNAHistogramBase *)self setBucketLeftBounds:&unk_1F1F923D8];
  [(ICNAHistogramBase *)self setValuePrecision:0.01];
  [(ICNAHistogramBase *)self setValueMax:&unk_1F1F8D668];
}

@end