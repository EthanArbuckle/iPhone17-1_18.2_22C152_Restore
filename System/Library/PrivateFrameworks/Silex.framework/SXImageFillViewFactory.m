@interface SXImageFillViewFactory
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXImageFillViewFactory)initWithDOMObjectProvider:(id)a3 imageViewFactory:(id)a4;
- (SXImageViewFactory)imageViewFactory;
- (id)createImageFillViewForImageFill:(id)a3;
@end

@implementation SXImageFillViewFactory

- (SXImageFillViewFactory)initWithDOMObjectProvider:(id)a3 imageViewFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXImageFillViewFactory;
  v9 = [(SXImageFillViewFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v10->_imageViewFactory, a4);
  }

  return v10;
}

- (id)createImageFillViewForImageFill:(id)a3
{
  id v4 = a3;
  v5 = [(SXImageFillViewFactory *)self DOMObjectProvider];
  v6 = [v4 imageIdentifier];
  id v7 = [v5 imageResourceForIdentifier:v6];

  id v8 = [SXImageFillView alloc];
  v9 = [(SXImageFillViewFactory *)self imageViewFactory];
  v10 = [(SXImageFillView *)v8 initWithImageFill:v4 imageResource:v7 imageViewFactory:v9];

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