@interface THWReviewDividerRep
- (BOOL)directlyManagesLayerContent;
- (CGRect)layerFrameInScaledCanvas;
- (void)dealloc;
- (void)didUpdateLayer:(id)a3;
@end

@implementation THWReviewDividerRep

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)THWReviewDividerRep;
  [(THWReviewDividerRep *)&v2 dealloc];
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)didUpdateLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWReviewDividerRep;
  -[THWReviewDividerRep didUpdateLayer:](&v4, "didUpdateLayer:");
  objc_msgSend(a3, "setBackgroundColor:", objc_msgSend(objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "colorWithAlphaComponent:", 0.150000006), "CGColor"));
}

- (CGRect)layerFrameInScaledCanvas
{
  v6.receiver = self;
  v6.super_class = (Class)THWReviewDividerRep;
  [(THWReviewDividerRep *)&v6 layerFrameInScaledCanvas];
  if (v5 < 1.0) {
    double v5 = 1.0;
  }
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end