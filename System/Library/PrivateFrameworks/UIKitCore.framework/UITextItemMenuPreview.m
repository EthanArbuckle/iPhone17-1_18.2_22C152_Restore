@interface UITextItemMenuPreview
+ (UITextItemMenuPreview)defaultPreview;
- (UITextItemMenuPreview)initWithView:(UIView *)view;
- (UIView)_previewView;
@end

@implementation UITextItemMenuPreview

+ (UITextItemMenuPreview)defaultPreview
{
  id v2 = objc_alloc_init((Class)a1);
  return (UITextItemMenuPreview *)v2;
}

- (UITextItemMenuPreview)initWithView:(UIView *)view
{
  v5 = view;
  v9.receiver = self;
  v9.super_class = (Class)UITextItemMenuPreview;
  v6 = [(UITextItemMenuPreview *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_previewView, view);
  }

  return v7;
}

- (UIView)_previewView
{
  return self->_previewView;
}

- (void).cxx_destruct
{
}

@end