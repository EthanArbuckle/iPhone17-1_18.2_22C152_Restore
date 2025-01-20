@interface NSAttributedString(UIKitAdditions)
- (id)_ui_attributedStringWithOriginalFontAttributes;
- (id)_ui_glyphImageViewsScale:()UIKitAdditions outImageRect:outLineRect:outBaselineOffset:;
- (uint64_t)_ui_resolvedTextAlignment;
- (uint64_t)_ui_resolvedTextAlignmentForParagraphStyle:()UIKitAdditions;
- (uint64_t)_ui_resolvedTextAlignmentForParagraphStyle:()UIKitAdditions userInterfaceLayoutDirection:;
- (uint64_t)_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:()UIKitAdditions;
- (uint64_t)_ui_resolvedWritingDirection;
- (uint64_t)_ui_resolvedWritingDirectionForUserInterfaceLayoutDirection:()UIKitAdditions;
@end

@implementation NSAttributedString(UIKitAdditions)

- (uint64_t)_ui_resolvedTextAlignment
{
  uint64_t v2 = [(id)UIApp userInterfaceLayoutDirection];
  return objc_msgSend(a1, "_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:", v2);
}

- (uint64_t)_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:()UIKitAdditions
{
  if (![a1 length]) {
    goto LABEL_4;
  }
  v5 = [a1 attribute:*(void *)off_1E52D21B8 atIndex:0 effectiveRange:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v5 = 0;
  }
  uint64_t v6 = objc_msgSend(a1, "_ui_resolvedTextAlignmentForParagraphStyle:userInterfaceLayoutDirection:", v5, a3);

  return v6;
}

- (uint64_t)_ui_resolvedTextAlignmentForParagraphStyle:()UIKitAdditions userInterfaceLayoutDirection:
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 alignment];
    uint64_t v8 = [v6 baseWritingDirection];
    if (v8 != -1) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 4;
  }
  uint64_t v8 = a4 != 0;
LABEL_6:
  if ((unint64_t)(v7 - 3) >= 2) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 2 * (v8 == 1);
  }

  return v9;
}

- (uint64_t)_ui_resolvedTextAlignmentForParagraphStyle:()UIKitAdditions
{
  v4 = (void *)UIApp;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(a1, "_ui_resolvedTextAlignmentForParagraphStyle:userInterfaceLayoutDirection:", v5, objc_msgSend(v4, "userInterfaceLayoutDirection"));

  return v6;
}

- (uint64_t)_ui_resolvedWritingDirection
{
  uint64_t v2 = [(id)UIApp userInterfaceLayoutDirection];
  return objc_msgSend(a1, "_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:", v2);
}

- (uint64_t)_ui_resolvedWritingDirectionForUserInterfaceLayoutDirection:()UIKitAdditions
{
  if ([a1 length])
  {
    id v5 = [a1 attribute:*(void *)off_1E52D21B8 atIndex:0 effectiveRange:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v5)
      {
LABEL_8:
        uint64_t v6 = a3 != 0;

        return v6;
      }
    }
    else
    {
    }
  }
  uint64_t v6 = [0 baseWritingDirection];
  if (v6 == -1)
  {
    id v5 = 0;
    goto LABEL_8;
  }
  return v6;
}

- (id)_ui_attributedStringWithOriginalFontAttributes
{
  uint64_t v2 = [a1 length];
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = v2;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  v4 = [a1 attribute:*(void *)off_1E52D21A0 atIndex:0 effectiveRange:&v9];
  uint64_t v5 = v10;

  if (!v4 && v5 == v3)
  {
LABEL_7:
    id v7 = a1;
  }
  else
  {
    id v7 = (id)[a1 mutableCopy];
    objc_msgSend(v7, "_ui_restoreOriginalFontAttributes");
  }
  return v7;
}

- (id)_ui_glyphImageViewsScale:()UIKitAdditions outImageRect:outLineRect:outBaselineOffset:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v58 = [MEMORY[0x1E4F1CA48] array];
  if ([(__CFAttributedString *)a1 length])
  {
    v11 = CTLineCreateWithAttributedString(a1);
    if (v11)
    {
      v12 = v11;
      CGRect ImageBounds = CTLineGetImageBounds(v11, 0);
      v73.origin.double x = UIRectIntegralWithScale(ImageBounds.origin.x, ImageBounds.origin.y, ImageBounds.size.width, ImageBounds.size.height, a2);
      CGRect v74 = CGRectInset(v73, -1.0, -1.0);
      double x = v74.origin.x;
      double y = v74.origin.y;
      double height = v74.size.height;
      double width = v74.size.width;
      _UIGraphicsBeginImageContextWithOptions(0, 0, v74.size.width, v74.size.height, a2);
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack >= 1)
      {
        v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
        if (v14)
        {
          v50 = a4;
          v52 = a5;
          v75.origin.double x = x;
          v75.origin.double y = y;
          v75.size.double height = height;
          v75.size.double width = width;
          CGFloat v15 = CGRectGetHeight(v75);
          CGContextTranslateCTM(v14, -x, y + v15);
          CGContextScaleCTM(v14, 1.0, -1.0);
          v51 = v12;
          CTLineGetGlyphRuns(v12);
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
          if (v57)
          {
            uint64_t v56 = *(void *)v64;
            do
            {
              for (uint64_t i = 0; i != v57; ++i)
              {
                if (*(void *)v64 != v56) {
                  objc_enumerationMutation(obj);
                }
                v17 = *(const __CTRun **)(*((void *)&v63 + 1) + 8 * i);
                CFIndex GlyphCount = CTRunGetGlyphCount(v17);
                if (CTRunGetFont()) {
                  BOOL v19 = GlyphCount < 1;
                }
                else {
                  BOOL v19 = 1;
                }
                if (!v19)
                {
                  CFIndex v20 = 0;
                  do
                  {
                    v70.location = v20;
                    v70.length = 1;
                    CTRunDraw(v17, v14, v70);
                    CGImageRef Image = CGBitmapContextCreateImage(v14);
                    if (Image)
                    {
                      v22 = Image;
                      v71.location = v20;
                      v71.length = 1;
                      CGRect v76 = CTRunGetImageBounds(v17, v14, v71);
                      CGRect v77 = CGRectInset(v76, -1.0, -1.0);
                      CGFloat v23 = v77.origin.x;
                      CGFloat v24 = v77.origin.y;
                      CGFloat v25 = v77.size.width;
                      CGFloat v26 = v77.size.height;
                      double v61 = (v77.origin.x - x) * a2;
                      double v27 = height * a2 - (CGRectGetHeight(v77) + v77.origin.y - y) * a2;
                      v78.origin.double x = v23;
                      v78.origin.double y = v24;
                      v78.size.double width = v25;
                      v78.size.double height = v26;
                      double v28 = CGRectGetWidth(v78) * a2;
                      v79.origin.double x = v23;
                      v79.origin.double y = v24;
                      CGFloat v62 = v25;
                      v79.size.double width = v25;
                      v79.size.double height = v26;
                      CGFloat v29 = CGRectGetHeight(v79);
                      v80.origin.double x = UIRectIntegralWithScale(v61, v27, v28, v29 * a2, 1.0);
                      v92.origin.double x = 0.0;
                      v92.origin.double y = 0.0;
                      v92.size.double width = width * a2;
                      v92.size.double height = height * a2;
                      CGRect v81 = CGRectIntersection(v80, v92);
                      double v30 = v81.origin.x;
                      double v31 = v81.origin.y;
                      CGImageRef v32 = CGImageCreateWithImageInRect(v22, v81);
                      if (v32)
                      {
                        v33 = v32;
                        v34 = +[UIImage imageWithCGImage:v32 scale:0 orientation:a2];
                        v35 = [[UIImageView alloc] initWithImage:v34];
                        [v34 size];
                        double v37 = v36;
                        [v34 size];
                        -[UIImageView setFrame:](v35, "setFrame:", v30 / a2, v31 / a2, v37, v38);
                        [v58 addObject:v35];
                        CGImageRelease(v33);
                      }
                      CGImageRelease(v22);
                      v82.origin.double x = v23;
                      v82.origin.double y = v24;
                      v82.size.double width = v62;
                      v82.size.double height = v26;
                      CGContextClearRect(v14, v82);
                    }
                    ++v20;
                  }
                  while (GlyphCount != v20);
                }
              }
              uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
            }
            while (v57);
          }

          a5 = v52;
          a4 = v50;
          v12 = v51;
        }
      }
      UIGraphicsEndImageContext();
      if (a4)
      {
        v83.origin.double x = x;
        v83.origin.double y = y;
        v83.size.double width = width;
        v83.size.double height = height;
        double v39 = 0.0 - (y + CGRectGetHeight(v83));
        v84.origin.double x = x;
        v84.origin.double y = y;
        v84.size.double width = width;
        v84.size.double height = height;
        CGFloat v40 = CGRectGetWidth(v84);
        v85.origin.double x = x;
        v85.origin.double y = y;
        v85.size.double width = width;
        v85.size.double height = height;
        CGFloat v41 = CGRectGetHeight(v85);
        *a4 = x;
        a4[1] = v39;
        a4[2] = v40;
        a4[3] = v41;
      }
      if (a5)
      {
        CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v12, 0x11uLL);
        v87.origin.double x = UIRectIntegralWithScale(BoundsWithOptions.origin.x, BoundsWithOptions.origin.y, BoundsWithOptions.size.width, BoundsWithOptions.size.height, a2);
        CGRect v88 = CGRectInset(v87, -1.0, -1.0);
        CGFloat v42 = v88.origin.x;
        CGFloat v43 = v88.origin.y;
        CGFloat v44 = v88.size.width;
        CGFloat v45 = v88.size.height;
        double v46 = 0.0 - (CGRectGetHeight(v88) + v88.origin.y);
        v89.origin.double x = v42;
        v89.origin.double y = v43;
        v89.size.double width = v44;
        v89.size.double height = v45;
        CGFloat v47 = CGRectGetWidth(v89);
        v90.origin.double x = v42;
        v90.origin.double y = v43;
        v90.size.double width = v44;
        v90.size.double height = v45;
        CGFloat v48 = CGRectGetHeight(v90);
        *a5 = v42;
        a5[1] = v46;
        a5[2] = v47;
        a5[3] = v48;
      }
      if (a6)
      {
        v91.origin.double x = x;
        v91.origin.double y = y;
        v91.size.double height = height;
        v91.size.double width = width;
        *a6 = y + CGRectGetHeight(v91);
      }
      CFRelease(v12);
    }
  }
  return v58;
}

@end