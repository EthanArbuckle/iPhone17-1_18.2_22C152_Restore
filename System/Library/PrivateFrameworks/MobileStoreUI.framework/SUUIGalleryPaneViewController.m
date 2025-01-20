@interface SUUIGalleryPaneViewController
- (SUUIGalleryPaneViewController)initWithMediaComponent:(id)a3 galleryIndex:(int64_t)a4;
- (SUUIMediaComponent)component;
- (int64_t)galleryIndex;
@end

@implementation SUUIGalleryPaneViewController

- (SUUIGalleryPaneViewController)initWithMediaComponent:(id)a3 galleryIndex:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIGalleryPaneViewController;
  v8 = [(SUUIGalleryPaneViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_component, a3);
    v9->_galleryIndex = a4;
  }

  return v9;
}

- (SUUIMediaComponent)component
{
  return self->_component;
}

- (int64_t)galleryIndex
{
  return self->_galleryIndex;
}

- (void).cxx_destruct
{
}

@end