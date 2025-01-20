@interface TUIManager
- (TUIColorRegistry)colorRegistry;
- (TUIDynamicRegistry)dynamicRegistry;
- (TUIElementRegistry)elementRegistry;
- (TUIFilterRegistry)filterRegistry;
- (TUIImageResourceCache)imageResourceCache;
- (TUIManager)init;
- (TUIResourceLoading)resourceLoader;
- (TUIResourceRegistry)resourceRegistry;
- (TUIVideoPlayerManaging)videoPlayerManager;
- (TUIViewRegistry)viewRegistry;
- (const)builderCache;
- (id).cxx_construct;
- (void)setColorRegistry:(id)a3;
- (void)setDynamicRegistry:(id)a3;
- (void)setElementRegistry:(id)a3;
- (void)setFilterRegistry:(id)a3;
- (void)setImageResourceCache:(id)a3;
- (void)setResourceLoader:(id)a3;
- (void)setResourceRegistry:(id)a3;
- (void)setVideoPlayerManager:(id)a3;
- (void)setViewRegistry:(id)a3;
@end

@implementation TUIManager

- (TUIManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUIManager;
  v2 = [(TUIManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(TUIColorRegistry);
    colorRegistry = v2->_colorRegistry;
    v2->_colorRegistry = v3;
  }
  return v2;
}

- (const)builderCache
{
  return &self->_builderCache;
}

- (TUIVideoPlayerManaging)videoPlayerManager
{
  videoPlayerManager = self->_videoPlayerManager;
  if (!videoPlayerManager)
  {
    v4 = objc_alloc_init(TUIVideoPlayerManager);
    v5 = self->_videoPlayerManager;
    self->_videoPlayerManager = (TUIVideoPlayerManaging *)v4;

    videoPlayerManager = self->_videoPlayerManager;
  }

  return videoPlayerManager;
}

- (TUIResourceLoading)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
}

- (TUIResourceRegistry)resourceRegistry
{
  return self->_resourceRegistry;
}

- (void)setResourceRegistry:(id)a3
{
}

- (TUIFilterRegistry)filterRegistry
{
  return self->_filterRegistry;
}

- (void)setFilterRegistry:(id)a3
{
}

- (TUIViewRegistry)viewRegistry
{
  return self->_viewRegistry;
}

- (void)setViewRegistry:(id)a3
{
}

- (TUIElementRegistry)elementRegistry
{
  return self->_elementRegistry;
}

- (void)setElementRegistry:(id)a3
{
}

- (TUIDynamicRegistry)dynamicRegistry
{
  return self->_dynamicRegistry;
}

- (void)setDynamicRegistry:(id)a3
{
}

- (TUIImageResourceCache)imageResourceCache
{
  return self->_imageResourceCache;
}

- (void)setImageResourceCache:(id)a3
{
}

- (TUIColorRegistry)colorRegistry
{
  return self->_colorRegistry;
}

- (void)setColorRegistry:(id)a3
{
}

- (void)setVideoPlayerManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayerManager, 0);
  objc_storeStrong((id *)&self->_colorRegistry, 0);
  objc_storeStrong((id *)&self->_imageResourceCache, 0);
  objc_storeStrong((id *)&self->_dynamicRegistry, 0);
  objc_storeStrong((id *)&self->_elementRegistry, 0);
  objc_storeStrong((id *)&self->_viewRegistry, 0);
  objc_storeStrong((id *)&self->_filterRegistry, 0);
  objc_storeStrong((id *)&self->_resourceRegistry, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);

  TUI::ElementInstantiating::BuilderCache::~BuilderCache((TUI::ElementInstantiating::BuilderCache *)&self->_builderCache);
}

- (id).cxx_construct
{
  return self;
}

@end