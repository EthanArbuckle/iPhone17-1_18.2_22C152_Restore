@interface SXVideoFillViewFactory
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXImageViewFactory)imageViewFactory;
- (SXVideoFillViewFactory)initWithDOMObjectProvider:(id)a3 imageViewFactory:(id)a4;
- (id)createVideoFillViewForVideoFill:(id)a3;
@end

@implementation SXVideoFillViewFactory

- (SXVideoFillViewFactory)initWithDOMObjectProvider:(id)a3 imageViewFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXVideoFillViewFactory;
  v9 = [(SXVideoFillViewFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v10->_imageViewFactory, a4);
  }

  return v10;
}

- (id)createVideoFillViewForVideoFill:(id)a3
{
  id v4 = a3;
  v5 = [SXVideoFillView alloc];
  v6 = [(SXVideoFillViewFactory *)self DOMObjectProvider];
  id v7 = [(SXVideoFillViewFactory *)self imageViewFactory];
  id v8 = [(SXVideoFillView *)v5 initWithVideoFill:v4 DOMObjectProvider:v6 imageViewFactory:v7];

  return v8;
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