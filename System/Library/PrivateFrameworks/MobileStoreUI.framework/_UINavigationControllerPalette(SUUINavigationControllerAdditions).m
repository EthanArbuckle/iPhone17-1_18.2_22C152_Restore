@interface _UINavigationControllerPalette(SUUINavigationControllerAdditions)
- (void)SUUI_beginHidingPaletteShadow;
- (void)SUUI_endHidingPaletteShadow;
@end

@implementation _UINavigationControllerPalette(SUUINavigationControllerAdditions)

- (void)SUUI_beginHidingPaletteShadow
{
  v2 = objc_getAssociatedObject(a1, (const void *)_SUUINavigationControllerAssociatedObjectKeyPaletteShadowHidden);
  uint64_t v3 = [v2 unsignedIntegerValue];

  v4 = (const void *)_SUUINavigationControllerAssociatedObjectKeyPaletteShadowHidden;
  v5 = [NSNumber numberWithUnsignedInteger:v3 + 1];
  objc_setAssociatedObject(a1, v4, v5, (void *)1);

  if (!v3)
  {
    [a1 setPaletteShadowIsHidden:1];
  }
}

- (void)SUUI_endHidingPaletteShadow
{
  v2 = objc_getAssociatedObject(a1, (const void *)_SUUINavigationControllerAssociatedObjectKeyPaletteShadowHidden);
  uint64_t v3 = [v2 unsignedIntegerValue];

  if (v3)
  {
    v4 = (const void *)_SUUINavigationControllerAssociatedObjectKeyPaletteShadowHidden;
    v5 = (void *)(v3 - 1);
    if (v3 == 1)
    {
      objc_setAssociatedObject(a1, (const void *)_SUUINavigationControllerAssociatedObjectKeyPaletteShadowHidden, v5, (void *)1);
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