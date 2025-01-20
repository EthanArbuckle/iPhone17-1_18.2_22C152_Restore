@interface SKUIGalleryPaneViewController
- (SKUIGalleryPaneViewController)initWithMediaComponent:(id)a3 galleryIndex:(int64_t)a4;
- (SKUIMediaComponent)component;
- (int64_t)galleryIndex;
@end

@implementation SKUIGalleryPaneViewController

- (SKUIGalleryPaneViewController)initWithMediaComponent:(id)a3 galleryIndex:(int64_t)a4
{
  id v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGalleryPaneViewController initWithMediaComponent:galleryIndex:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIGalleryPaneViewController;
  v8 = [(SKUIGalleryPaneViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_component, a3);
    v9->_galleryIndex = a4;
  }

  return v9;
}

- (SKUIMediaComponent)component
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

- (void)initWithMediaComponent:galleryIndex:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGalleryPaneViewController initWithMediaComponent:galleryIndex:]";
}

@end