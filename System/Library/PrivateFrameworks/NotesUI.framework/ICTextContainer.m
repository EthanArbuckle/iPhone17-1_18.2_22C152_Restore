@interface ICTextContainer
- (BOOL)inPreviewMode;
- (BOOL)isSimpleRectangularTextContainer;
- (CGRect)lineFragmentRectForProposedRect:(CGRect)a3 atIndex:(unint64_t)a4 writingDirection:(int64_t)a5 remainingRect:(CGRect *)a6;
- (void)setInPreviewMode:(BOOL)a3;
@end

@implementation ICTextContainer

- (CGRect)lineFragmentRectForProposedRect:(CGRect)a3 atIndex:(unint64_t)a4 writingDirection:(int64_t)a5 remainingRect:(CGRect *)a6
{
  v35.receiver = self;
  v35.super_class = (Class)ICTextContainer;
  -[ICTextContainer lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](&v35, sel_lineFragmentRectForProposedRect_atIndex_writingDirection_remainingRect_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  objc_opt_class();
  v16 = [(ICTextContainer *)self layoutManager];
  v17 = ICDynamicCast();

  if (v17)
  {
    v18 = [v17 textStorage];
    unint64_t v19 = [v18 length];

    if (v19 >= a4)
    {
      v20 = [v17 textView];
      v21 = [v17 textStorage];
      uint64_t v22 = [v21 length];

      if (v22 == a4)
      {
        if (!v20)
        {
          v25 = 0;
LABEL_16:

          goto LABEL_17;
        }
        v23 = [v20 typingAttributes];
        uint64_t v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F83220]];
      }
      else
      {
        v23 = [v17 textStorage];
        uint64_t v24 = [v23 attribute:*MEMORY[0x1E4F83220] atIndex:a4 effectiveRange:0];
      }
      v25 = (void *)v24;

      if (v25 && [v25 isList])
      {
        uint64_t v26 = [v25 layoutWritingDirection];
        if (v26 == -1) {
          uint64_t v26 = [MEMORY[0x1E4FB0850] defaultWritingDirectionForLanguage:0];
        }
        v27 = [(ICTextContainer *)self layoutManager];
        v28 = [v27 textStorage];
        +[ICTextController indentForStyle:range:attributedString:textView:](ICTextController, "indentForStyle:range:attributedString:textView:", v25, a4, 0, v28, v20);
        double v30 = v29;

        if (v26)
        {
          double v13 = v13 - v30;
        }
        else
        {
          double v9 = v9 + v30;
          double v13 = v13 - v30;
          if ([v25 isBlockQuote])
          {
            double v9 = v9 + 16.0;
            double v13 = v13 + 16.0;
          }
        }
      }
      goto LABEL_16;
    }
  }
LABEL_17:

  double v31 = v9;
  double v32 = v11;
  double v33 = v13;
  double v34 = v15;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (BOOL)isSimpleRectangularTextContainer
{
  v3 = [(ICTextContainer *)self exclusionPaths];
  if ([v3 count] || -[ICTextContainer maximumNumberOfLines](self, "maximumNumberOfLines")) {
    LOBYTE(v4) = 0;
  }
  else {
    BOOL v4 = ![(ICTextContainer *)self inPreviewMode];
  }

  return v4;
}

- (BOOL)inPreviewMode
{
  return self->_inPreviewMode;
}

- (void)setInPreviewMode:(BOOL)a3
{
  self->_inPreviewMode = a3;
}

@end