@interface SXMosaicGalleryComponentSizer
- (BOOL)galleryLayouter:(id)a3 viewIsCurrentlyFullscreenForItemAtIndex:(unint64_t)a4;
- (CGSize)galleryLayouter:(id)a3 dimensionsForItemAtIndex:(unint64_t)a4;
- (SXMosaicGalleryLayouter)layouter;
- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4;
- (id)documentColumnLayoutForGalleryLayouter:(id)a3;
- (id)galleryLayouter:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (unint64_t)numberOfItemsForGalleryLayouter:(id)a3;
- (void)setLayouter:(id)a3;
@end

@implementation SXMosaicGalleryComponentSizer

- (double)calculateHeightForWidth:(double)a3 layoutContext:(id)a4
{
  v6 = [(SXMosaicGalleryComponentSizer *)self layouter];
  [v6 calculateLayoutForWidth:a3];

  v7 = [(SXMosaicGalleryComponentSizer *)self layouter];
  [v7 contentSize];
  double v9 = v8;

  return v9;
}

- (SXMosaicGalleryLayouter)layouter
{
  layouter = self->_layouter;
  if (!layouter)
  {
    v4 = [[SXMosaicGalleryLayouter alloc] initWithDataSource:self];
    v5 = self->_layouter;
    self->_layouter = v4;

    [(SXComponentSizer *)self saveInfo:self->_layouter forRenderingPhaseWithIdentifier:@"Layouter"];
    layouter = self->_layouter;
  }
  return layouter;
}

- (CGSize)galleryLayouter:(id)a3 dimensionsForItemAtIndex:(unint64_t)a4
{
  v6 = [(SXComponentSizer *)self component];
  v7 = [v6 items];
  double v8 = [v7 objectAtIndex:a4];

  double v9 = [(SXComponentSizer *)self DOMObjectProvider];
  v10 = [v8 imageIdentifier];
  v11 = [v9 imageResourceForIdentifier:v10];

  [v11 dimensions];
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (id)galleryLayouter:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  return 0;
}

- (BOOL)galleryLayouter:(id)a3 viewIsCurrentlyFullscreenForItemAtIndex:(unint64_t)a4
{
  return 0;
}

- (unint64_t)numberOfItemsForGalleryLayouter:(id)a3
{
  v3 = [(SXComponentSizer *)self component];
  v4 = [v3 items];
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)documentColumnLayoutForGalleryLayouter:(id)a3
{
  v3 = [(SXComponentSizer *)self layoutOptions];
  v4 = [v3 columnLayout];

  return v4;
}

- (void)setLayouter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end