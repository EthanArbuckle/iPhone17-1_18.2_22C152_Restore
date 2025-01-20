@interface _UINavigationControllerPalette(SKUINavigationControllerAdditions)
- (void)SKUI_beginHidingPaletteShadow;
- (void)SKUI_endHidingPaletteShadow;
@end

@implementation _UINavigationControllerPalette(SKUINavigationControllerAdditions)

- (void)SKUI_beginHidingPaletteShadow
{
  v2 = objc_getAssociatedObject(a1, (const void *)_SKUINavigationControllerAssociatedObjectKeyPaletteShadowHidden);
  uint64_t v3 = [v2 unsignedIntegerValue];

  v4 = (const void *)_SKUINavigationControllerAssociatedObjectKeyPaletteShadowHidden;
  v5 = [NSNumber numberWithUnsignedInteger:v3 + 1];
  objc_setAssociatedObject(a1, v4, v5, (void *)1);

  if (!v3)
  {
    [a1 setPaletteShadowIsHidden:1];
  }
}

- (void)SKUI_endHidingPaletteShadow
{
  v2 = objc_getAssociatedObject(a1, (const void *)_SKUINavigationControllerAssociatedObjectKeyPaletteShadowHidden);
  uint64_t v3 = [v2 unsignedIntegerValue];

  if (v3)
  {
    v4 = (const void *)_SKUINavigationControllerAssociatedObjectKeyPaletteShadowHidden;
    v5 = (void *)(v3 - 1);
    if (v3 == 1)
    {
      objc_setAssociatedObject(a1, (const void *)_SKUINavigationControllerAssociatedObjectKeyPaletteShadowHidden, v5, (void *)1);
      [a1 setPaletteShadowIsHidden:0];
    }
    else
    {
      id v6 = [NSNumber numberWithUnsignedInteger:v5];
      objc_setAssociatedObject(a1, v4, v6, (void *)1);
    }
  }
}

@end