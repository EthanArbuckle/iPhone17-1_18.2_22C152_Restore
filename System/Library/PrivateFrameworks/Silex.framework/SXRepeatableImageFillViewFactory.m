@interface SXRepeatableImageFillViewFactory
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXImageViewFactory)imageViewFactory;
- (SXRepeatableImageFillViewFactory)initWithDOMObjectProvider:(id)a3 imageViewFactory:(id)a4;
- (id)createRepeatableImageFillViewForRepeatableImageFill:(id)a3;
@end

@implementation SXRepeatableImageFillViewFactory

- (SXRepeatableImageFillViewFactory)initWithDOMObjectProvider:(id)a3 imageViewFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXRepeatableImageFillViewFactory;
  v9 = [(SXRepeatableImageFillViewFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v10->_imageViewFactory, a4);
  }

  return v10;
}

- (id)createRepeatableImageFillViewForRepeatableImageFill:(id)a3
{
  id v4 = a3;
  v5 = [(SXRepeatableImageFillViewFactory *)self DOMObjectProvider];
  v6 = [v4 imageIdentifier];
  id v7 = [v5 imageResourceForIdentifier:v6];

  id v8 = [(SXRepeatableImageFillViewFactory *)self imageViewFactory];
  v9 = [v8 repeatableImageViewForResource:v7];

  v10 = [[SXRepeatableImageFillView alloc] initWithRepeatableImageFill:v4 imageView:v9];
  return v10;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end