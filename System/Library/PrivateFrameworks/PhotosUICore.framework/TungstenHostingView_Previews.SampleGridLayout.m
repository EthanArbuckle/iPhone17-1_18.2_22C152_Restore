@interface TungstenHostingView_Previews.SampleGridLayout
- (_TtCV12PhotosUICore28TungstenHostingView_PreviewsP33_548AEEF075E30F02ECF115384DCAC70916SampleGridLayout)init;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
@end

@implementation TungstenHostingView_Previews.SampleGridLayout

- (_TtCV12PhotosUICore28TungstenHostingView_PreviewsP33_548AEEF075E30F02ECF115384DCAC70916SampleGridLayout)init
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TungstenHostingView_Previews.SampleGridLayout();
  v2 = [(PXGGridLayout *)&v4 init];
  [(PXGGridLayout *)v2 setNumberOfColumns:50];
  [(PXGItemsLayout *)v2 setNumberOfItems:5000];
  [(PXGGridLayout *)v2 setMediaKind:5];
  [(PXGLayout *)v2 setContentSource:v2];

  return v2;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v4 = objc_msgSend(self, sel_purpleColor);
  return v4;
}

@end