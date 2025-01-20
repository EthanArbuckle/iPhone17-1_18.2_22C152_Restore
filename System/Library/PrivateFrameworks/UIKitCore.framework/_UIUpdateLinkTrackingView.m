@interface _UIUpdateLinkTrackingView
- (void)dealloc;
@end

@implementation _UIUpdateLinkTrackingView

- (void)dealloc
{
  uint64_t v3 = *(void *)&self->super.super._sceneForeground;
  if (v3)
  {
    *(void *)(v3 + 16) = 0;
    if (!*(void *)(v3 + 8)) {
      objc_msgSend(0, "removeInteraction:");
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIUpdateLinkTrackingView;
  [(UIUpdateLink *)&v4 dealloc];
}

@end