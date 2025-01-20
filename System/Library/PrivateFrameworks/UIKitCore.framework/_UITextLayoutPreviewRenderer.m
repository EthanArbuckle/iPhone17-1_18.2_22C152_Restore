@interface _UITextLayoutPreviewRenderer
- (BOOL)excludeBackground;
- (CGRect)bodyRect;
- (CGRect)firstLineRect;
- (CGRect)lastLineRect;
- (NSTextLayoutManager)textLayoutManager;
- (NSTextRange)range;
- (UIImage)image;
- (_UITextLayoutPreviewRenderer)initWithTextLayoutManager:(id)a3 range:(id)a4 unifyRects:(BOOL)a5;
- (void)_updateDataIfNeeded;
- (void)addRenderingAttributes:(id)a3;
- (void)removeRenderingAttributes:(id)a3;
- (void)setExcludeBackground:(BOOL)a3;
@end

@implementation _UITextLayoutPreviewRenderer

- (_UITextLayoutPreviewRenderer)initWithTextLayoutManager:(id)a3 range:(id)a4 unifyRects:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UITextLayoutPreviewRenderer;
  v11 = [(_UITextLayoutPreviewRenderer *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_textLayoutManager, a3);
    objc_storeStrong((id *)&v12->_range, a4);
    v12->_unifyRects = a5;
    v12->_calculated = 0;
  }

  return v12;
}

- (UIImage)image
{
  [(_UITextLayoutPreviewRenderer *)self _updateDataIfNeeded];
  image = self->_image;
  return image;
}

- (CGRect)firstLineRect
{
  [(_UITextLayoutPreviewRenderer *)self _updateDataIfNeeded];
  double x = self->_firstRect.origin.x;
  double y = self->_firstRect.origin.y;
  double width = self->_firstRect.size.width;
  double height = self->_firstRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)bodyRect
{
  [(_UITextLayoutPreviewRenderer *)self _updateDataIfNeeded];
  double x = self->_middleRect.origin.x;
  double y = self->_middleRect.origin.y;
  double width = self->_middleRect.size.width;
  double height = self->_middleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)lastLineRect
{
  [(_UITextLayoutPreviewRenderer *)self _updateDataIfNeeded];
  double x = self->_lastRect.origin.x;
  double y = self->_lastRect.origin.y;
  double width = self->_lastRect.size.width;
  double height = self->_lastRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_updateDataIfNeeded
{
  if (!self->_calculated)
  {
    self->_calculated = 1;
    CGSize v47 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    CGPoint v48 = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->_firstRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->_firstRect.size = v47;
    self->_middleRect.origin = v48;
    self->_middleRect.size = v47;
    self->_lastRect.origin = v48;
    self->_lastRect.size = v47;
    v3 = objc_opt_new();
    v4 = +[UIBezierPath bezierPath];
    uint64_t v60 = 0;
    v61 = (double *)&v60;
    uint64_t v62 = 0x4010000000;
    v63 = &unk_186D7DBA7;
    CGPoint v64 = v48;
    CGSize v65 = v47;
    range = self->_range;
    if (range && ![(NSTextRange *)range isEmpty])
    {
      textLayoutManager = self->_textLayoutManager;
      v7 = self->_range;
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __51___UITextLayoutPreviewRenderer__updateDataIfNeeded__block_invoke;
      v56[3] = &unk_1E52F9C80;
      id v57 = v3;
      id v58 = v4;
      v59 = &v60;
      [(NSTextLayoutManager *)textLayoutManager enumerateTextSegmentsInRange:v7 type:0 options:67108865 usingBlock:v56];
    }
    if (objc_msgSend(v3, "count", v47, v48) == 1)
    {
      v8 = [v3 firstObject];
      [v8 CGRectValue];
      self->_middleRect.origin.double x = v9;
      self->_middleRect.origin.double y = v10;
      self->_middleRect.size.double width = v11;
      self->_middleRect.size.double height = v12;
    }
    else if ([v3 count])
    {
      v13 = [v3 firstObject];
      [v13 CGRectValue];
      self->_firstRect.origin.double x = v14;
      self->_firstRect.origin.double y = v15;
      self->_firstRect.size.double width = v16;
      self->_firstRect.size.double height = v17;

      v18 = [v3 lastObject];
      [v18 CGRectValue];
      self->_lastRect.origin.double x = v19;
      self->_lastRect.origin.double y = v20;
      self->_lastRect.size.double width = v21;
      self->_lastRect.size.double height = v22;

      if ((unint64_t)[v3 count] >= 3)
      {
        v23 = [v3 objectAtIndexedSubscript:1];
        [v23 CGRectValue];
        self->_middleRect.origin.double x = v24;
        self->_middleRect.origin.double y = v25;
        self->_middleRect.size.double width = v26;
        self->_middleRect.size.double height = v27;

        for (unint64_t i = 2; i < [v3 count] - 1; ++i)
        {
          v29 = [v3 objectAtIndexedSubscript:i];
          [v29 CGRectValue];
          v69.origin.double x = v30;
          v69.origin.double y = v31;
          v69.size.double width = v32;
          v69.size.double height = v33;
          self->_CGRect middleRect = CGRectUnion(self->_middleRect, v69);
        }
        if (self->_unifyRects)
        {
          double MinY = CGRectGetMinY(self->_middleRect);
          self->_firstRect.size.double height = MinY + 1.0 - CGRectGetMinY(self->_firstRect);
          double MaxY = CGRectGetMaxY(self->_lastRect);
          self->_lastRect.size.double height = MaxY - CGRectGetMaxY(self->_middleRect) + 1.0;
          self->_lastRect.origin.double y = CGRectGetMaxY(self->_middleRect) + -1.0;
        }
      }
    }
    double v36 = v61[4];
    double v37 = v61[5];
    memset(&v55, 0, sizeof(v55));
    CGAffineTransformMakeTranslation(&v55, -v36, -v37);
    if (!CGRectIsEmpty(self->_firstRect))
    {
      CGRect firstRect = self->_firstRect;
      CGAffineTransform v54 = v55;
      self->_CGRect firstRect = CGRectApplyAffineTransform(firstRect, &v54);
    }
    if (!CGRectIsEmpty(self->_middleRect))
    {
      CGRect middleRect = self->_middleRect;
      CGAffineTransform v54 = v55;
      self->_CGRect middleRect = CGRectApplyAffineTransform(middleRect, &v54);
    }
    if (!CGRectIsEmpty(self->_lastRect))
    {
      CGRect lastRect = self->_lastRect;
      CGAffineTransform v54 = v55;
      self->_CGRect lastRect = CGRectApplyAffineTransform(lastRect, &v54);
    }
    v38 = [UIGraphicsImageRenderer alloc];
    v39 = -[UIGraphicsImageRenderer initWithSize:](v38, "initWithSize:", v61[6], v61[7]);
    v40 = self->_textLayoutManager;
    v41 = self->_range;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    CGAffineTransform v53 = v55;
    v49[2] = __51___UITextLayoutPreviewRenderer__updateDataIfNeeded__block_invoke_2;
    v49[3] = &unk_1E52F9CA8;
    id v42 = v4;
    id v50 = v42;
    v43 = v40;
    v51 = v43;
    v44 = v41;
    v52 = v44;
    v45 = [(UIGraphicsImageRenderer *)v39 imageWithActions:v49];
    image = self->_image;
    self->_image = v45;

    _Block_object_dispose(&v60, 8);
  }
}

- (void)addRenderingAttributes:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55___UITextLayoutPreviewRenderer_addRenderingAttributes___block_invoke;
  v3[3] = &unk_1E52DD258;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

- (void)removeRenderingAttributes:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSTextLayoutManager *)self->_textLayoutManager removeRenderingAttribute:*(void *)(*((void *)&v9 + 1) + 8 * v8++) forTextRange:self->_range];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)excludeBackground
{
  return self->_excludeBackground;
}

- (void)setExcludeBackground:(BOOL)a3
{
  self->_excludeBackground = a3;
}

- (NSTextLayoutManager)textLayoutManager
{
  return self->_textLayoutManager;
}

- (NSTextRange)range
{
  return self->_range;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_textLayoutManager, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end