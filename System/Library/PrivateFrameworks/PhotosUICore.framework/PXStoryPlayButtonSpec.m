@interface PXStoryPlayButtonSpec
- (PXExtendedTraitCollection)extendedTraitCollection;
- (PXStoryChromeButtonSpec)chromeButtonSpec;
- (PXStoryPlayButtonSpec)initWithChromeButtonSpec:(id)a3;
- (double)playButtonProgressIndicatorLineWidth;
@end

@implementation PXStoryPlayButtonSpec

- (void).cxx_destruct
{
}

- (double)playButtonProgressIndicatorLineWidth
{
  return self->_playButtonProgressIndicatorLineWidth;
}

- (PXStoryChromeButtonSpec)chromeButtonSpec
{
  return self->_chromeButtonSpec;
}

- (PXExtendedTraitCollection)extendedTraitCollection
{
  v2 = [(PXStoryPlayButtonSpec *)self chromeButtonSpec];
  v3 = [v2 extendedTraitCollection];

  return (PXExtendedTraitCollection *)v3;
}

- (PXStoryPlayButtonSpec)initWithChromeButtonSpec:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPlayButtonSpec;
  v6 = [(PXStoryPlayButtonSpec *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_chromeButtonSpec, a3);
    v7->_playButtonProgressIndicatorLineWidth = 2.0;
  }

  return v7;
}

@end