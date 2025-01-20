@interface UIVectorTextLayoutRun
@end

@implementation UIVectorTextLayoutRun

void __52___UIVectorTextLayoutRun_enumerateGlyphsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v37.origin.CGFloat x = a5;
  v37.origin.CGFloat y = a6;
  v37.size.CGFloat width = a7;
  v37.size.CGFloat height = a8;
  if (!CGRectIsEmpty(v37))
  {
    v16 = objc_opt_new();
    [v16 setGlyph:a2];
    objc_msgSend(v16, "setRect:", a5, a6, a7, a8);
    v17 = *(const __CTFont **)(a1 + 40);
    if (v17 && (CGPathRef PathForGlyph = CTFontCreatePathForGlyph(v17, a2, (const CGAffineTransform *)(a1 + 48))) != 0)
    {
      v19 = PathForGlyph;
      CFAutorelease(PathForGlyph);
      PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(v19);
      CGFloat x = PathBoundingBox.origin.x;
      CGFloat y = PathBoundingBox.origin.y;
      CGFloat width = PathBoundingBox.size.width;
      CGFloat height = PathBoundingBox.size.height;
      memset(&transform, 0, sizeof(transform));
      CGFloat v24 = -CGRectGetMinX(PathBoundingBox);
      v39.origin.CGFloat x = x;
      v39.origin.CGFloat y = y;
      v39.size.CGFloat width = width;
      v39.size.CGFloat height = height;
      CGFloat MinY = CGRectGetMinY(v39);
      CGAffineTransformMakeTranslation(&transform, v24, -MinY);
      CGMutablePathRef v26 = CGPathCreateMutableCopyByTransformingPath(v19, &transform);
      v27 = +[UIBezierPath bezierPathWithCGPath:CFAutorelease(v26)];
      [v16 setPath:v27];

      CGAffineTransform v35 = transform;
      CGAffineTransformInvert(&v34, &v35);
      CGAffineTransformTranslate(&v35, &v34, a3, a4);
      CGAffineTransform transform = v35;
      CGAffineTransform v33 = v35;
      v28 = &v33;
    }
    else
    {
      [v16 setPath:0];
      long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v30 = *MEMORY[0x1E4F1DAB8];
      long long v31 = v29;
      long long v32 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      v28 = (CGAffineTransform *)&v30;
    }
    objc_msgSend(v16, "setPathTransform:", v28, v30, v31, v32, *(_OWORD *)&v33.a, *(_OWORD *)&v33.c, *(_OWORD *)&v33.tx);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end