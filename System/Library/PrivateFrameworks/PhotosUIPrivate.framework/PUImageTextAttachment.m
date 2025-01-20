@interface PUImageTextAttachment
- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7;
- (CGSize)size;
- (PUImageTextAttachment)initWithImageView:(id)a3 size:(CGSize)a4;
- (UIImageView)imageView;
- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6;
- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5;
@end

@implementation PUImageTextAttachment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  v16.receiver = self;
  v16.super_class = (Class)PUImageTextAttachment;
  -[PUImageTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](&v16, sel_attachmentBoundsForAttributes_location_textContainer_proposedLineFragment_position_, a3, a4, a5, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x, a7.y);
  double v9 = v8;
  [(PUImageTextAttachment *)self size];
  double v11 = v10;
  double v13 = v12;
  double v14 = round(v12 / -5.0);
  double v15 = v9;
  result.size.double height = v13;
  result.size.double width = v11;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

- (id)viewProviderForParentView:(id)a3 location:(id)a4 textContainer:(id)a5
{
  viewProvider = self->_viewProvider;
  if (!viewProvider)
  {
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    double v12 = [_PUImageTextAttachmentViewProvider alloc];
    double v13 = [v9 textLayoutManager];

    double v14 = [(NSTextAttachmentViewProvider *)v12 initWithTextAttachment:self parentView:v11 textLayoutManager:v13 location:v10];
    double v15 = self->_viewProvider;
    self->_viewProvider = v14;

    viewProvider = self->_viewProvider;
  }
  return viewProvider;
}

- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  return 0;
}

- (PUImageTextAttachment)initWithImageView:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUImageTextAttachment;
  id v9 = [(PUImageTextAttachment *)&v12 initWithData:0 ofType:0];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageView, a3);
    v10->_size.CGFloat width = width;
    v10->_size.CGFloat height = height;
  }

  return v10;
}

@end