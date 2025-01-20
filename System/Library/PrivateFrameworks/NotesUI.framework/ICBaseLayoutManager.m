@interface ICBaseLayoutManager
+ (NSDictionary)defaultLinkTextAttributes;
- (UITextView)textView;
- (double)bulletYOffsetForCharacterAtIndex:(unint64_t)a3;
- (id)textContainer;
- (id)textController;
- (void)drawBulletsForListRange:(_NSRange)a3 paragraphStyle:(id)a4 atPoint:(CGPoint)a5;
- (void)drawListStylesForCharacterRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)setTextView:(id)a3;
@end

@implementation ICBaseLayoutManager

+ (NSDictionary)defaultLinkTextAttributes
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [MEMORY[0x1E4FB1618] tintColor];
  objc_msgSend(v2, "ic_setNonNilObject:forKey:", v3, *MEMORY[0x1E4FB0700]);

  objc_msgSend(v2, "ic_setNonNilObject:forKey:", &unk_1F09A4178, *MEMORY[0x1E4FB0808]);
  v4 = (void *)[v2 copy];

  return (NSDictionary *)v4;
}

- (id)textController
{
  v3 = [(ICBaseLayoutManager *)self textStorage];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(ICBaseLayoutManager *)self textStorage];
    v6 = [v5 styler];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)textContainer
{
  v2 = [(ICBaseLayoutManager *)self textContainers];
  v3 = [v2 lastObject];

  return v3;
}

- (void)drawListStylesForCharacterRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v9 = [(ICBaseLayoutManager *)self textStorage];
  uint64_t v10 = *MEMORY[0x1E4F83220];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__ICBaseLayoutManager_drawListStylesForCharacterRange_atPoint___block_invoke;
  v11[3] = &unk_1E5FD9AB0;
  v11[4] = self;
  *(CGFloat *)&v11[5] = x;
  *(CGFloat *)&v11[6] = y;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0, v11);
}

uint64_t __63__ICBaseLayoutManager_drawListStylesForCharacterRange_atPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    v9 = v7;
    if ([v7 isList])
    {
      if ([v9 style] != 103) {
        objc_msgSend(*(id *)(a1 + 32), "drawBulletsForListRange:paragraphStyle:atPoint:", a3, a4, v9, *(double *)(a1 + 40), *(double *)(a1 + 48));
      }
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (void)drawBulletsForListRange:(_NSRange)a3 paragraphStyle:(id)a4 atPoint:(CGPoint)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v66 = a4;
  if (drawBulletsForListRange_paragraphStyle_atPoint__onceToken != -1) {
    dispatch_once(&drawBulletsForListRange_paragraphStyle_atPoint__onceToken, &__block_literal_global_11);
  }
  NSUInteger v60 = location + length;
  if (location < location + length)
  {
    uint64_t v59 = *MEMORY[0x1E4FB06F8];
    uint64_t v58 = *MEMORY[0x1E4FB0700];
    *(double *)&uint64_t v57 = 9.2;
    do
    {
      v8 = [(ICBaseLayoutManager *)self textStorage];
      v9 = [v8 string];
      uint64_t v10 = objc_msgSend(v9, "paragraphRangeForRange:", location, 0);
      uint64_t v12 = v11;

      uint64_t v64 = v12;
      uint64_t v65 = v10;
      -[ICBaseLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", -[ICBaseLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v10, v12, 0), 0);
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = a5.x + v17;
      CGFloat v20 = a5.y + v19;
      v21 = [(ICBaseLayoutManager *)self textContainer];
      [v21 lineFragmentPadding];
      CGFloat v23 = v22;
      v68.origin.CGFloat x = v18;
      v68.origin.double y = v20;
      v68.size.CGFloat width = v14;
      v68.size.double height = v16;
      CGRect v69 = CGRectInset(v68, v23, 0.0);
      CGFloat x = v69.origin.x;
      double y = v69.origin.y;
      CGFloat width = v69.size.width;
      CGFloat rect = v69.size.height;

      CurrentContext = UIGraphicsGetCurrentContext();
      v28 = [(ICBaseLayoutManager *)self textStorage];
      v29 = [v28 attribute:v59 atIndex:location effectiveRange:0];

      uint64_t v30 = +[ICTTTextStorage bulletTextAttributesWithTextFont:v29 paragraphStyle:v66 zoomFactor:1.0];
      v31 = [(ICBaseLayoutManager *)self textStorage];
      v32 = [v66 listBulletInAttributedString:v31 atIndex:location];

      v63 = (void *)v30;
      CFAttributedStringRef v33 = (const __CFAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v32 attributes:v30];
      v34 = [(id)drawBulletsForListRange_paragraphStyle_atPoint__bulletCTLineCache objectForKey:v33];
      v35 = v34;
      if (!v34 || (v36 = (const __CTLine *)CFRetain((CFTypeRef)[v34 ref])) == 0)
      {
        v36 = CTLineCreateWithAttributedString(v33);
        v37 = (void *)drawBulletsForListRange_paragraphStyle_atPoint__bulletCTLineCache;
        v38 = (void *)[objc_alloc(MEMORY[0x1E4F83710]) initWithCFTypeRef:v36];
        [v37 setObject:v38 forKey:v33];
      }
      double v39 = 0.0;
      CGContextSetTextPosition(CurrentContext, 0.0, 0.0);
      CGRect ImageBounds = CTLineGetImageBounds(v36, CurrentContext);
      double v40 = ImageBounds.origin.y;
      double height = ImageBounds.size.height;
      double TypographicBounds = CTLineGetTypographicBounds(v36, 0, 0, 0);
      [(ICBaseLayoutManager *)self bulletYOffsetForCharacterAtIndex:location];
      double v44 = y + v43;
      int v45 = [v66 style];
      if ((v45 - 100) >= 2)
      {
        if (v45 == 102) {
          double v39 = *(double *)&v57;
        }
      }
      else
      {
        double v39 = (36.0 - TypographicBounds) * 0.5 + 1.0;
        [v29 capHeight];
        double v44 = v44 - ((v46 - height) * 0.5 - v40);
      }
      uint64_t v47 = [v66 layoutWritingDirection];
      CGFloat v48 = x;
      double v49 = y;
      CGFloat v50 = width;
      CGFloat v51 = rect;
      if (v47) {
        double v52 = v39 + CGRectGetMaxX(*(CGRect *)&v48);
      }
      else {
        double v52 = CGRectGetMinX(*(CGRect *)&v48) - v39 - TypographicBounds;
      }
      uint64_t v53 = [(ICBaseLayoutManager *)self textStorage];
      v54 = [(id)v53 attribute:v58 atIndex:location effectiveRange:0];

      v55 = [MEMORY[0x1E4FB1618] clearColor];
      LOBYTE(v53) = [v54 isEqual:v55];

      if ((v53 & 1) == 0)
      {
        CGContextSetGrayFillColor(CurrentContext, 0.0, 1.0);
        [v54 alphaComponent];
        CGContextSetAlpha(CurrentContext, v56);
        CGAffineTransformMakeScale(&v67, 1.0, -1.0);
        CGContextSetTextMatrix(CurrentContext, &v67);
        CGContextSetTextPosition(CurrentContext, v52, v44);
        CTLineDraw(v36, CurrentContext);
        CGContextFillPath(CurrentContext);
        CGContextSetAlpha(CurrentContext, 1.0);
      }
      CFRelease(v36);
      NSUInteger location = v65 + v64;
    }
    while (v65 + v64 < v60);
  }
}

uint64_t __70__ICBaseLayoutManager_drawBulletsForListRange_paragraphStyle_atPoint___block_invoke()
{
  drawBulletsForListRange_paragraphStyle_atPoint__bulletCTLineCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F83718]);
  return MEMORY[0x1F41817F8]();
}

- (double)bulletYOffsetForCharacterAtIndex:(unint64_t)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v18 = 0;
  v5 = [(ICBaseLayoutManager *)self textStorage];
  v6 = [v5 string];
  objc_msgSend(v6, "getLineStart:end:contentsEnd:forRange:", &v20, &v19, &v18, a3, 0);

  if (v18 == v20)
  {
    id v7 = [(ICBaseLayoutManager *)self textStorage];
    v8 = [v7 attribute:*MEMORY[0x1E4FB06F8] atIndex:a3 effectiveRange:0];

    [v8 ascender];
    double v10 = v9;
LABEL_6:

    return v10;
  }
  [(ICBaseLayoutManager *)self locationForGlyphAtIndex:[(ICBaseLayoutManager *)self glyphIndexForCharacterAtIndex:a3]];
  double v10 = v11;
  uint64_t v12 = [(ICBaseLayoutManager *)self textStorage];
  double v13 = [v12 string];
  int v14 = [v13 characterAtIndex:a3];

  if (v14 == 65532)
  {
    double v15 = [(ICBaseLayoutManager *)self textStorage];
    v8 = [v15 attribute:*MEMORY[0x1E4FB06F8] atIndex:a3 effectiveRange:0];

    if (v8)
    {
      [v8 descender];
      double v10 = v10 + v16;
    }
    goto LABEL_6;
  }
  return v10;
}

- (UITextView)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (UITextView *)WeakRetained;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end