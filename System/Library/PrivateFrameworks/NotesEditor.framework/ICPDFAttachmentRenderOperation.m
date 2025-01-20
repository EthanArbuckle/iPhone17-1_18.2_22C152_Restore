@interface ICPDFAttachmentRenderOperation
- (CGSize)size;
- (ICAttachment)attachment;
- (ICPDFAttachmentRenderOperation)initWithView:(id)a3;
- (ICPDFAttachmentView)view;
- (double)scale;
- (double)width;
- (id)generateImageForPrinting;
- (void)main;
- (void)setScale:(double)a3;
- (void)setSize:(CGSize)a3;
- (void)setView:(id)a3;
@end

@implementation ICPDFAttachmentRenderOperation

- (ICPDFAttachmentRenderOperation)initWithView:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICPDFAttachmentRenderOperation;
  v5 = [(ICPDFAttachmentRenderOperation *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(ICPDFAttachmentRenderOperation *)v5 setView:v4];
    v7 = [(ICPDFAttachmentRenderOperation *)v6 view];
    [v7 bounds];
    -[ICPDFAttachmentRenderOperation setSize:](v6, "setSize:", v8, v9);

    v10 = [v4 window];
    v11 = [v10 screen];

    if (v11) {
      [v11 scale];
    }
    else {
      double v12 = 1.0;
    }
    [(ICPDFAttachmentRenderOperation *)v6 setScale:v12];
  }
  return v6;
}

- (id)generateImageForPrinting
{
  v3 = [(ICPDFAttachmentRenderOperation *)self view];
  id v4 = [v3 attachment];

  v5 = [(ICPDFAttachmentRenderOperation *)self view];
  if (v4)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    v6 = [v4 managedObjectContext];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __58__ICPDFAttachmentRenderOperation_generateImageForPrinting__block_invoke;
    objc_super v14 = &unk_2640B92A8;
    v16 = &v17;
    id v15 = v5;
    [v6 performBlockAndWait:&v11];

    if (v18[3] && ([(ICPDFAttachmentRenderOperation *)self size], v7 > 0.0))
    {
      double v9 = objc_msgSend(MEMORY[0x263F5ACB0], "renderedImageForPage:scale:size:colorSpace:", v18[3], TSUDeviceRGBColorSpace(), 1.0, 1536.0, v8 * (1536.0 / v7));
      CGPDFPageRelease((CGPDFPageRef)v18[3]);
    }
    else
    {
      double v9 = 0;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

CGPDFPage *__58__ICPDFAttachmentRenderOperation_generateImageForPrinting__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) page];
  result = *(CGPDFPage **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (result)
  {
    return CGPDFPageRetain(result);
  }
  return result;
}

- (void)main
{
  v3 = [(ICPDFAttachmentRenderOperation *)self view];
  id v4 = [v3 attachment];

  if (v4)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    v5 = [v4 managedObjectContext];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __38__ICPDFAttachmentRenderOperation_main__block_invoke;
    v16[3] = &unk_2640B85C8;
    v16[4] = self;
    v16[5] = &v17;
    [v5 performBlockAndWait:v16];

    uint64_t v6 = TSUDeviceRGBColorSpace();
    uint64_t v7 = v18[3];
    if (v7)
    {
      uint64_t v8 = v6;
      double v9 = (void *)MEMORY[0x263F5ACB0];
      [(ICPDFAttachmentRenderOperation *)self scale];
      double v11 = v10;
      [(ICPDFAttachmentRenderOperation *)self size];
      objc_super v14 = objc_msgSend(v9, "renderedImageForPage:scale:size:colorSpace:", v7, v8, v11, v12, v13);
      CGPDFPageRelease((CGPDFPageRef)v18[3]);
    }
    else
    {
      objc_super v14 = 0;
    }
    id v15 = v14;
    performBlockOnMainThreadAndWait();

    _Block_object_dispose(&v17, 8);
  }
}

void __38__ICPDFAttachmentRenderOperation_main__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) view];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 page];
  v2 = *(CGPDFPage **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2) {
    CGPDFPageRetain(v2);
  }
}

void __38__ICPDFAttachmentRenderOperation_main__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) view];
  [v3 setImage:v2];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 setRendering:0];
}

- (ICPDFAttachmentView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (ICPDFAttachmentView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (ICAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);

  return (ICAttachment *)WeakRetained;
}

- (double)width
{
  return self->_width;
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_size, &v3, 16, 1, 0);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attachment);

  objc_destroyWeak((id *)&self->_view);
}

@end