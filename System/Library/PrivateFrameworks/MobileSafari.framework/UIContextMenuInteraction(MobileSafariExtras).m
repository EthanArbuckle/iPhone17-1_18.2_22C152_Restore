@interface UIContextMenuInteraction(MobileSafariExtras)
- (_SFUIViewPopoverSourceInfo)safari_popoverSourceInfo;
@end

@implementation UIContextMenuInteraction(MobileSafariExtras)

- (_SFUIViewPopoverSourceInfo)safari_popoverSourceInfo
{
  v2 = [a1 view];
  [a1 locationInView:v2];
  double v4 = v3;
  double v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v2;
    v8 = objc_msgSend(v7, "indexPathForItemAtPoint:", v4, v6);
    if (v8)
    {
      uint64_t v9 = [v7 cellForItemAtIndexPath:v8];
      if (v9)
      {
        v10 = (void *)v9;
        v11 = [[_SFUIViewPopoverSourceInfo alloc] initWithView:v9];

        goto LABEL_7;
      }
    }
  }
  v12 = [_SFUIViewPopoverSourceInfo alloc];
  v11 = -[_SFUIViewPopoverSourceInfo initWithView:rect:](v12, "initWithView:rect:", v2, v4, v6, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
LABEL_7:

  return v11;
}

@end