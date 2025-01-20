@interface SUICStreamingTextView
- (BOOL)animated;
- (BOOL)centerAlign;
- (BOOL)renderEmojis;
- (BOOL)renderEmojisOnly;
- (BOOL)showChevron;
- (BOOL)showEditTextImage;
- (CGImage)_imageRefForImage:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)words;
- (NSString)editTextSymbol;
- (NSString)text;
- (SUICStreamingTextView)initWithCoder:(id)a3;
- (SUICStreamingTextView)initWithFrame:(CGRect)a3;
- (SUICStreamingTextViewDelegate)streamingTextViewDelegate;
- (UIColor)endTextColor;
- (UIColor)startTextColor;
- (UIColor)textColor;
- (UIFont)font;
- (double)animationDuration;
- (double)hyphenationFactor;
- (id)_createEditTextImage;
- (id)_createGlyphImage:(CGRect)a3 glyphRange:(_NSRange)a4 layoutManager:(id)a5;
- (id)_glyphImageForWord:(id)a3 frame:(CGRect)a4 glyphRange:(_NSRange)a5 textColor:(id)a6;
- (id)_substringRangesContainingEmojiInString:(id)a3 startingIndex:(int64_t)a4;
- (void)_animateLayers;
- (void)_animateWordIn:(id)a3;
- (void)_animateWordOut:(id)a3;
- (void)_layoutFrames;
- (void)_resetState;
- (void)_sharedInit;
- (void)_updateAnimatedInternal;
- (void)_updateText:(id)a3;
- (void)layoutSubviews;
- (void)setAnimated:(BOOL)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenterAlign:(BOOL)a3;
- (void)setEditTextSymbol:(id)a3;
- (void)setEndTextColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHyphenationFactor:(double)a3;
- (void)setRenderEmojis:(BOOL)a3;
- (void)setRenderEmojisOnly:(BOOL)a3;
- (void)setShowEditTextImage:(BOOL)a3;
- (void)setStartTextColor:(id)a3;
- (void)setStreamingTextViewDelegate:(id)a3;
- (void)setWords:(id)a3;
@end

@implementation SUICStreamingTextView

- (SUICStreamingTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUICStreamingTextView;
  v3 = -[SUICStreamingTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SUICStreamingTextView *)v3 _sharedInit];
  }
  return v4;
}

- (SUICStreamingTextView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUICStreamingTextView;
  v3 = [(SUICStreamingTextView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(SUICStreamingTextView *)v3 _sharedInit];
  }
  return v4;
}

- (void)_sharedInit
{
  v3 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x1E4FB0840]);
  layoutManager = self->_layoutManager;
  self->_layoutManager = v3;

  v5 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E4FB08B8]);
  textStorage = self->_textStorage;
  self->_textStorage = v5;

  [(NSLayoutManager *)self->_layoutManager setTextStorage:self->_textStorage];
  [(NSTextStorage *)self->_textStorage addLayoutManager:self->_layoutManager];
  id v7 = objc_alloc(MEMORY[0x1E4FB0880]);
  [(SUICStreamingTextView *)self bounds];
  v8 = (NSTextContainer *)objc_msgSend(v7, "initWithSize:", CGRectGetWidth(v24), 1.79769313e308);
  textContainer = self->_textContainer;
  self->_textContainer = v8;

  [(NSTextContainer *)self->_textContainer setLineFragmentPadding:0.0];
  [(NSLayoutManager *)self->_layoutManager addTextContainer:self->_textContainer];
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  words = self->_words;
  self->_words = v10;

  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  wordsToShow = self->_wordsToShow;
  self->_wordsToShow = v12;

  v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  wordsToDelete = self->_wordsToDelete;
  self->_wordsToDelete = v14;

  self->_centerAlign = 0;
  self->_renderEmojis = 1;
  self->_animationDuration = 0.4;
  self->_animated = 1;
  self->_showEditTextImage = 0;
  editTextSymbol = self->_editTextSymbol;
  self->_editTextSymbol = (NSString *)@"chevron.forward";

  v17 = [MEMORY[0x1E4FB1618] colorWithRed:0.18 green:0.6 blue:0.82 alpha:1.0];
  startTextColor = self->_startTextColor;
  self->_startTextColor = v17;

  v19 = [MEMORY[0x1E4FB1618] whiteColor];
  endTextColor = self->_endTextColor;
  self->_endTextColor = v19;

  v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  font = self->_font;
  self->_font = v21;

  [(SUICStreamingTextView *)self setHyphenationFactor:1.0];

  [(SUICStreamingTextView *)self _updateAnimatedInternal];
}

- (void)setWords:(id)a3
{
  [(SUICStreamingTextView *)self _updateText:a3];
  [(SUICStreamingTextView *)self setNeedsLayout];
  [(SUICStreamingTextView *)self layoutIfNeeded];

  [(SUICStreamingTextView *)self _resetState];
}

- (NSArray)words
{
  return (NSArray *)self->_words;
}

- (NSString)text
{
  return (NSString *)[(NSTextStorage *)self->_textStorage string];
}

- (void)setHyphenationFactor:(double)a3
{
  self->_hyphenationFactor = a3;
  -[NSLayoutManager setHyphenationFactor:](self->_layoutManager, "setHyphenationFactor:");
}

- (void)setEndTextColor:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  self->_animatedInternal = 0;
  objc_storeStrong((id *)&self->_endTextColor, a3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v6 = self->_wordsToShow;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "setInsertType:", 1, (void)v13);
        v12 = [v11 wordLayer];
        [v12 removeFromSuperlayer];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(SUICStreamingTextView *)self setNeedsLayout];
  [(SUICStreamingTextView *)self layoutIfNeeded];
  [(SUICStreamingTextView *)self _updateAnimatedInternal];
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
  [(SUICStreamingTextView *)self _updateAnimatedInternal];
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
  [(SUICStreamingTextView *)self _updateAnimatedInternal];
}

- (void)_updateAnimatedInternal
{
  BOOL animated = self->_animated;
  if (animated) {
    BOOL animated = self->_animationDuration > 0.00000011920929;
  }
  self->_animatedInternal = animated;
}

- (void)setFont:(id)a3
{
  id v5 = (UIFont *)a3;
  p_font = &self->_font;
  if (self->_font != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)p_font, a3);
    p_font = (UIFont **)[(SUICStreamingTextView *)self showEditTextImage];
    id v5 = v9;
    if (p_font)
    {
      uint64_t v7 = [(SUICStreamingTextView *)self _createEditTextImage];
      editTextImage = self->_editTextImage;
      self->_editTextImage = v7;

      id v5 = v9;
    }
  }

  MEMORY[0x1F41817F8](p_font, v5);
}

- (void)setShowEditTextImage:(BOOL)a3
{
  if (self->_showEditTextImage != a3)
  {
    self->_showEditTextImage = a3;
    if (a3)
    {
      v4 = [(SUICStreamingTextView *)self _createEditTextImage];
      editTextImage = self->_editTextImage;
      self->_editTextImage = v4;
    }
    else
    {
      editTextImage = self->_editTextImage;
      self->_editTextImage = 0;
    }

    objc_super v6 = [(NSMutableArray *)self->_wordsToShow lastObject];
    if (v6)
    {
      id v7 = v6;
      [v6 setInsertType:4];
      [(SUICStreamingTextView *)self setWords:self->_words];
      objc_super v6 = v7;
    }
  }
}

- (void)setRenderEmojis:(BOOL)a3
{
  self->_renderEmojis = a3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(NSTextContainer *)self->_textContainer size];
  double v6 = v5;
  double v8 = v7;
  -[NSTextContainer setSize:](self->_textContainer, "setSize:", width, 1.79769313e308);
  [(NSLayoutManager *)self->_layoutManager ensureLayoutForTextContainer:self->_textContainer];
  [(NSLayoutManager *)self->_layoutManager usedRectForTextContainer:self->_textContainer];
  double v10 = v9;
  double v12 = v11;
  -[NSTextContainer setSize:](self->_textContainer, "setSize:", v6, v8);
  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.double width = v13;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[NSTextContainer setSize:](self->_textContainer, "setSize:", CGRectGetWidth(a3), 1.79769313e308);
  v8.receiver = self;
  v8.super_class = (Class)SUICStreamingTextView;
  -[SUICStreamingTextView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[NSTextContainer setSize:](self->_textContainer, "setSize:", CGRectGetWidth(a3), 1.79769313e308);
  v8.receiver = self;
  v8.super_class = (Class)SUICStreamingTextView;
  -[SUICStreamingTextView setBounds:](&v8, sel_setBounds_, x, y, width, height);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SUICStreamingTextView;
  [(SUICStreamingTextView *)&v3 layoutSubviews];
  [(SUICStreamingTextView *)self _layoutFrames];
}

- (void)_updateText:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = -1;
  double v5 = +[_SUICEditScriptIndexed editScriptFromArray:self->_words toArray:a3 orderAtomsAscending:1 operationPrecedence:-1];
  int CompositionLanguageForLanguage = CTParagraphStyleGetCompositionLanguageForLanguage();
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __37__SUICStreamingTextView__updateText___block_invoke;
  v43[3] = &unk_1E5C59C28;
  v43[4] = self;
  v31 = (void (**)(void, void, void))MEMORY[0x1AD0BCD30](v43);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __37__SUICStreamingTextView__updateText___block_invoke_2;
  v42[3] = &unk_1E5C59C50;
  v42[4] = self;
  uint64_t v7 = MEMORY[0x1AD0BCD30](v42);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __37__SUICStreamingTextView__updateText___block_invoke_3;
  v41[3] = &unk_1E5C59C50;
  v41[4] = self;
  uint64_t v8 = MEMORY[0x1AD0BCD30](v41);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v28 = v5;
  double v9 = [v5 script];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
  v29 = (void (**)(void, void))v8;
  v30 = (void (**)(void, void))v7;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v15 = [v14 editOperation];
        if (v15 == 3)
        {
          v17 = [v14 replacementText];
          unint64_t v16 = [v14 indexToEdit];
          [(NSMutableArray *)self->_words replaceObjectAtIndex:v16 withObject:v17];
          v31[2](v31, v16, 2);
          goto LABEL_12;
        }
        if (v15 == 2)
        {
          v17 = [v14 replacementText];
          unint64_t v16 = [v14 indexInArrayB];
          [(NSMutableArray *)self->_words insertObject:v17 atIndex:v16];
          v29[2](v29, v16);
LABEL_12:

          goto LABEL_13;
        }
        if (v15 != 1) {
          continue;
        }
        unint64_t v16 = [v14 indexToEdit];
        [(NSMutableArray *)self->_words removeObjectAtIndex:v16];
        v30[2](v30, v16);
LABEL_13:
        if (v16 < v4) {
          unint64_t v4 = v16;
        }
        if (CompositionLanguageForLanguage != 1 && v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          uint64_t v18 = -[NSMutableArray objectAtIndexedSubscript:](self->_wordsToShow, "objectAtIndexedSubscript:");
          [v18 setInsertType:4];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v11);
  }

  id v19 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  while (v4 < [(NSMutableArray *)self->_wordsToShow count])
    [v19 addIndex:v4++];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __37__SUICStreamingTextView__updateText___block_invoke_4;
  v35[3] = &unk_1E5C59C78;
  v35[4] = self;
  v20 = v31;
  id v36 = v20;
  [v19 enumerateIndexesUsingBlock:v35];
  id v21 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  if (self->_centerAlign) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = 2
  }
        * (objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[SUICStreamingTextView semanticContentAttribute](self, "semanticContentAttribute")) == 1);
  [v21 setAlignment:v22];
  v44[0] = *MEMORY[0x1E4FB06F8];
  v23 = [(SUICStreamingTextView *)self font];
  v44[1] = *MEMORY[0x1E4FB0738];
  v45[0] = v23;
  v45[1] = v21;
  CGRect v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];

  -[NSTextStorage deleteCharactersInRange:](self->_textStorage, "deleteCharactersInRange:", 0, [(NSTextStorage *)self->_textStorage length]);
  uint64_t v25 = [(NSMutableArray *)self->_words count];
  words = self->_words;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __37__SUICStreamingTextView__updateText___block_invoke_5;
  v32[3] = &unk_1E5C59CA0;
  id v33 = v24;
  uint64_t v34 = v25 - 1;
  v32[4] = self;
  id v27 = v24;
  [(NSMutableArray *)words enumerateObjectsUsingBlock:v32];
}

void __37__SUICStreamingTextView__updateText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = [*(id *)(*(void *)(a1 + 32) + 440) objectAtIndexedSubscript:a2];
  double v6 = objc_alloc_init(_SUICStreamingWord);
  [(_SUICStreamingWord *)v6 setPrevious:v7];
  [(_SUICStreamingWord *)v6 setInsertType:a3];
  [*(id *)(*(void *)(a1 + 32) + 440) replaceObjectAtIndex:a2 withObject:v6];
  [*(id *)(*(void *)(a1 + 32) + 448) addObject:v7];
}

void __37__SUICStreamingTextView__updateText___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 440) objectAtIndexedSubscript:a2];
  [*(id *)(*(void *)(a1 + 32) + 440) removeObjectAtIndex:a2];
  [*(id *)(*(void *)(a1 + 32) + 448) addObject:v4];
}

void __37__SUICStreamingTextView__updateText___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(_SUICStreamingWord);
  [(_SUICStreamingWord *)v4 setInsertType:1];
  [*(id *)(*(void *)(a1 + 32) + 440) insertObject:v4 atIndex:a2];
}

void __37__SUICStreamingTextView__updateText___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 440) objectAtIndexedSubscript:a2];
  if (![v3 insertType]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __37__SUICStreamingTextView__updateText___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  double v5 = [*(id *)(*(void *)(a1 + 32) + 440) objectAtIndexedSubscript:a3];
  if ([*(id *)(a1 + 32) showEditTextImage] && *(void *)(a1 + 48) == a3)
  {
    objc_msgSend(v5, "setTextRange:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "length"), objc_msgSend(v13, "length") + 2);
    double v6 = objc_msgSend(*(id *)(a1 + 32), "_substringRangesContainingEmojiInString:startingIndex:", v13, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "length"));
    [v5 setEmojiRangesInText:v6];

    id v7 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    [v7 setImage:*(void *)(*(void *)(a1 + 32) + 464)];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v13 attributes:*(void *)(a1 + 40)];
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:*(void *)(a1 + 40)];
    [v8 appendAttributedString:v9];

    uint64_t v10 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v7];
    [v8 appendAttributedString:v10];

    [*(id *)(*(void *)(a1 + 32) + 416) appendAttributedString:v8];
  }
  else
  {
    objc_msgSend(v5, "setTextRange:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "length"), objc_msgSend(v13, "length"));
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "_substringRangesContainingEmojiInString:startingIndex:", v13, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "length"));
    [v5 setEmojiRangesInText:v11];

    uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 416);
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13 attributes:*(void *)(a1 + 40)];
    [v12 appendAttributedString:v7];
  }
}

- (void)_layoutFrames
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 424;
  [(NSTextContainer *)self->_textContainer size];
  if (v4 == 0.0)
  {
    double v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 bounds];
    double v7 = v6;

    textContainer = self->_textContainer;
    [(NSTextContainer *)textContainer size];
    [(NSTextContainer *)textContainer setSize:v7];
  }
  [(NSTextContainer *)self->_textContainer size];
  if (v9 == 0.0)
  {
    uint64_t v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 bounds];

    uint64_t v11 = self->_textContainer;
    [(NSTextContainer *)v11 size];
    -[NSTextContainer setSize:](v11, "setSize:");
  }
  [(NSLayoutManager *)self->_layoutManager ensureLayoutForTextContainer:self->_textContainer];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = self->_wordsToShow;
  uint64_t v61 = [(NSMutableArray *)obj countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v61)
  {
    uint64_t v60 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v61; ++i)
      {
        if (*(void *)v67 != v60) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        layoutManager = self->_layoutManager;
        uint64_t v15 = [v13 textRange];
        uint64_t v17 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](layoutManager, "glyphRangeForCharacterRange:actualCharacterRange:", v15, v16, 0);
        uint64_t v19 = v18;
        uint64_t v20 = v3;
        -[NSLayoutManager boundingRectForGlyphRange:inTextContainer:](self->_layoutManager, "boundingRectForGlyphRange:inTextContainer:", v17, v18, *(Class *)((char *)&self->super.super.super.isa + v3));
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        [(NSLayoutManager *)self->_layoutManager locationForGlyphAtIndex:v17];
        double v30 = v29;
        v31 = [v13 previous];
        if (v31)
        {
          id v32 = [v13 previous];
        }
        else
        {
          id v32 = v13;
        }
        id v33 = v32;
        float v34 = v30 - v22;
        double v35 = roundf(v34);

        if ([(SUICStreamingTextView *)self showEditTextImage])
        {
          BOOL v36 = 0;
        }
        else
        {
          [v33 glyphLocationInWordX];
          BOOL v36 = vabdd_f64(v37, v35) < 0.00000011920929;
        }
        [v13 setGlyphLocationInWordX:v35];
        switch([v13 insertType])
        {
          case 0:
            if (v36) {
              goto LABEL_21;
            }
            long long v38 = -[SUICStreamingTextView _glyphImageForWord:frame:glyphRange:textColor:](self, "_glyphImageForWord:frame:glyphRange:textColor:", v13, v17, v19, self->_startTextColor, v22, v24, v26, v28);
            long long v39 = -[SUICStreamingTextView _glyphImageForWord:frame:glyphRange:textColor:](self, "_glyphImageForWord:frame:glyphRange:textColor:", v13, v17, v19, self->_endTextColor, v22, v24, v26, v28);
            v44 = [v13 wordLayer];
            [v44 removeFromSuperlayer];

            v45 = [MEMORY[0x1E4F39BE8] layer];
            [v13 setWordLayer:v45];

            [v13 setInsertType:1];
            break;
          case 1:
          case 2:
          case 4:
            goto LABEL_17;
          case 3:
            if (v36)
            {
              long long v40 = [v13 previous];
              v41 = [v40 beginImage];
              long long v38 = (void *)[v41 copy];

              v42 = [v13 previous];
              v43 = [v42 endImage];
              long long v39 = (void *)[v43 copy];
            }
            else
            {
LABEL_17:
              long long v38 = -[SUICStreamingTextView _glyphImageForWord:frame:glyphRange:textColor:](self, "_glyphImageForWord:frame:glyphRange:textColor:", v13, v17, v19, self->_startTextColor, v22, v24, v26, v28);
              long long v39 = -[SUICStreamingTextView _glyphImageForWord:frame:glyphRange:textColor:](self, "_glyphImageForWord:frame:glyphRange:textColor:", v13, v17, v19, self->_endTextColor, v22, v24, v26, v28);
            }
            break;
          default:
LABEL_21:
            long long v38 = 0;
            long long v39 = 0;
            break;
        }
        v46 = [v13 wordLayer];
        objc_msgSend(v46, "setFrame:", v22, v24, v26, v28);

        if (v38) {
          [v13 setBeginImage:v38];
        }
        if (v39)
        {
          [v13 setEndImage:v39];
          uint64_t v47 = [v13 wordLayer];
          v48 = [v13 endImage];
          objc_msgSend(v47, "setContents:", -[SUICStreamingTextView _imageRefForImage:](self, "_imageRefForImage:", v48));
        }
        v49 = [v13 wordLayer];
        v50 = [v49 superlayer];

        if (!v50)
        {
          v51 = [(SUICStreamingTextView *)self layer];
          v52 = [v13 wordLayer];
          [v51 addSublayer:v52];
        }
        uint64_t v3 = v20;
      }
      uint64_t v61 = [(NSMutableArray *)obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v61);
  }

  if (self->_animatedInternal)
  {
    [(SUICStreamingTextView *)self _animateLayers];
  }
  else
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v53 = self->_wordsToDelete;
    uint64_t v54 = [(NSMutableSet *)v53 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v63;
      do
      {
        for (uint64_t j = 0; j != v55; ++j)
        {
          if (*(void *)v63 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = [*(id *)(*((void *)&v62 + 1) + 8 * j) wordLayer];
          [v58 removeFromSuperlayer];
        }
        uint64_t v55 = [(NSMutableSet *)v53 countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v55);
    }
  }
}

- (void)_animateLayers
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v3 = self->_wordsToShow;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ((unint64_t)([v8 insertType] - 1) <= 2) {
          [(SUICStreamingTextView *)self _animateWordIn:v8];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  if ([(NSMutableSet *)self->_wordsToDelete count])
  {
    [MEMORY[0x1E4F39CF8] begin];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v10 = (void *)MEMORY[0x1E4F39CF8];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__SUICStreamingTextView__animateLayers__block_invoke;
    v23[3] = &unk_1E5C59470;
    id v11 = v9;
    id v24 = v11;
    [v10 setCompletionBlock:v23];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = self->_wordsToDelete;
    uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * j);
          -[SUICStreamingTextView _animateWordOut:](self, "_animateWordOut:", v17, (void)v19);
          uint64_t v18 = [v17 wordLayer];
          [v11 addObject:v18];
        }
        uint64_t v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v19 objects:v29 count:16];
      }
      while (v14);
    }

    [MEMORY[0x1E4F39CF8] commit];
  }
}

void __39__SUICStreamingTextView__animateLayers__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "removeFromSuperlayer", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_animateWordIn:(id)a3
{
  id v15 = a3;
  if (AFDeviceSupportsSystemAssistantExperience())
  {
    if (self->_editTextImage) {
      goto LABEL_6;
    }
    uint64_t v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.blurFilter.inputRadius"];
    [v4 setAdditive:1];
    [v4 setDuration:self->_animationDuration];
    uint64_t v5 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [v4 setTimingFunction:v5];

    [v4 setFromValue:&unk_1EFB50398];
    [v4 setToValue:&unk_1EFB50238];
    long long v6 = [v15 wordLayer];
    [v6 addAnimation:v4 forKey:@"blurIn"];

    long long v7 = (void *)[objc_alloc(MEMORY[0x1E4F39C90]) initWithPerceptualDuration:self->_animationDuration bounce:0.35];
    [v7 setKeyPath:@"transform.translation.y"];
    [v7 setFromValue:&unk_1EFB503A8];
    [v7 setToValue:&unk_1EFB50238];
    long long v8 = [v15 wordLayer];
    long long v9 = v8;
    uint64_t v10 = @"moveUp";
    uint64_t v11 = v7;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"contents"];
    [v4 setDuration:self->_animationDuration];
    uint64_t v12 = [v15 beginImage];
    objc_msgSend(v4, "setFromValue:", -[SUICStreamingTextView _imageRefForImage:](self, "_imageRefForImage:", v12));

    uint64_t v13 = [v15 endImage];
    objc_msgSend(v4, "setToValue:", -[SUICStreamingTextView _imageRefForImage:](self, "_imageRefForImage:", v13));

    uint64_t v14 = [v15 wordLayer];
    [v14 addAnimation:v4 forKey:@"contents"];

    long long v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v7 setDuration:self->_animationDuration];
    [v7 setFromValue:&unk_1EFB503B8];
    [v7 setToValue:&unk_1EFB503C8];
    long long v8 = [v15 wordLayer];
    long long v9 = v8;
    uint64_t v11 = v7;
    uint64_t v10 = @"opacity";
  }
  [v8 addAnimation:v11 forKey:v10];

LABEL_6:
}

- (void)_animateWordOut:(id)a3
{
  id v9 = a3;
  if (AFDeviceSupportsSystemAssistantExperience())
  {
    uint64_t v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.blurFilter.inputRadius"];
    [v4 setAdditive:1];
    [v4 setDuration:self->_animationDuration];
    [v4 setByValue:&unk_1EFB50398];
    uint64_t v5 = [v9 wordLayer];
    [v5 addAnimation:v4 forKey:@"blurOut"];
  }
  long long v6 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  long long v7 = [v9 wordLayer];
  [v7 setOpacity:0.0];

  [v6 setDuration:self->_animationDuration];
  [v6 setFromValue:&unk_1EFB503C8];
  [v6 setToValue:&unk_1EFB503B8];
  long long v8 = [v9 wordLayer];
  [v8 addAnimation:v6 forKey:@"opacity"];
}

- (void)_resetState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_wordsToShow;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_msgSend(v8, "setPrevious:", 0, (void)v9);
        [v8 setInsertType:0];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_wordsToDelete removeAllObjects];
}

- (id)_substringRangesContainingEmojiInString:(id)a3 startingIndex:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = +[SUICUtilities substringRangesContainingEmojiInString:v5];
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__2;
  uint64_t v14 = __Block_byref_object_dispose__2;
  id v15 = [MEMORY[0x1E4F1CA48] array];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__SUICStreamingTextView__substringRangesContainingEmojiInString_startingIndex___block_invoke;
  v9[3] = &unk_1E5C59CC8;
  v9[4] = &v10;
  v9[5] = a4;
  [v6 enumerateObjectsUsingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __79__SUICStreamingTextView__substringRangesContainingEmojiInString_startingIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v4 = (void *)MEMORY[0x1E4F29238];
  id v5 = a2;
  uint64_t v6 = [v5 rangeValue] + *(void *)(a1 + 40);
  [v5 rangeValue];
  uint64_t v8 = v7;

  objc_msgSend(v4, "valueWithRange:", v6, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v9];
}

- (id)_glyphImageForWord:(id)a3 frame:(CGRect)a4 glyphRange:(_NSRange)a5 textColor:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  BOOL v16 = [(SUICStreamingTextView *)self renderEmojisOnly];
  textStorage = self->_textStorage;
  uint64_t v18 = *MEMORY[0x1E4FB0700];
  if (v16)
  {
    long long v19 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v20 = [v14 textRange];
    -[NSTextStorage addAttribute:value:range:](textStorage, "addAttribute:value:range:", v18, v19, v20, v21);

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v22 = [v14 emojiRangesInText];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      id v45 = v14;
      NSUInteger v47 = location;
      uint64_t v25 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v54 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = self->_textStorage;
          uint64_t v28 = [*(id *)(*((void *)&v53 + 1) + 8 * i) rangeValue];
          -[NSTextStorage addAttribute:value:range:](v27, "addAttribute:value:range:", v18, v15, v28, v29);
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v24);
      id v14 = v45;
      NSUInteger location = v47;
    }
  }
  else
  {
    uint64_t v30 = [v14 textRange];
    -[NSTextStorage addAttribute:value:range:](textStorage, "addAttribute:value:range:", v18, v15, v30, v31);
    if ([(SUICStreamingTextView *)self renderEmojis]) {
      goto LABEL_20;
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v22 = [v14 emojiRangesInText];
    uint64_t v32 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      id v43 = v15;
      NSUInteger v44 = length;
      id v46 = v14;
      NSUInteger v48 = location;
      uint64_t v34 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v50 != v34) {
            objc_enumerationMutation(v22);
          }
          BOOL v36 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          double v37 = self->_textStorage;
          long long v38 = objc_msgSend(MEMORY[0x1E4FB1618], "clearColor", v43, v44);
          uint64_t v39 = [v36 rangeValue];
          -[NSTextStorage addAttribute:value:range:](v37, "addAttribute:value:range:", v18, v38, v39, v40);
        }
        uint64_t v33 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v33);
      NSUInteger length = v44;
      id v14 = v46;
      NSUInteger location = v48;
      id v15 = v43;
    }
  }

LABEL_20:
  v41 = -[SUICStreamingTextView _createGlyphImage:glyphRange:layoutManager:](self, "_createGlyphImage:glyphRange:layoutManager:", location, length, self->_layoutManager, x, y, width, height);

  return v41;
}

- (id)_createGlyphImage:(CGRect)a3 glyphRange:(_NSRange)a4 layoutManager:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a5;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGRect v30 = CGRectIntegral(v29);
  CGFloat v12 = v30.origin.x;
  CGFloat v13 = v30.origin.y;
  CGFloat v14 = v30.size.width;
  CGFloat v15 = v30.size.height;
  BOOL v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v30.size.width, v30.size.height);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__SUICStreamingTextView__createGlyphImage_glyphRange_layoutManager___block_invoke;
  v20[3] = &unk_1E5C59CF0;
  CGFloat v22 = v12;
  CGFloat v23 = v13;
  CGFloat v24 = v14;
  CGFloat v25 = v15;
  id v21 = v11;
  NSUInteger v26 = location;
  NSUInteger v27 = length;
  id v17 = v11;
  uint64_t v18 = [v16 imageWithActions:v20];

  return v18;
}

uint64_t __68__SUICStreamingTextView__createGlyphImage_glyphRange_layoutManager___block_invoke(uint64_t a1, void *a2)
{
  CGContextTranslateCTM((CGContextRef)[a2 CGContext], -*(double *)(a1 + 40), -*(double *)(a1 + 48));
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 80);
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);

  return objc_msgSend(v3, "drawGlyphsForGlyphRange:atPoint:", v4, v5, v6, v7);
}

- (id)_createEditTextImage
{
  if (AFDeviceSupportsSystemAssistantExperience()) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  uint64_t v4 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v5 = [(SUICStreamingTextView *)self font];
  double v6 = [v4 configurationWithFont:v5 scale:v3];

  if (AFDeviceSupportsSystemAssistantExperience())
  {
    double v7 = [MEMORY[0x1E4FB1830] configurationWithHierarchicalColor:self->_startTextColor];
    uint64_t v8 = [v6 configurationByApplyingConfiguration:v7];

    double v6 = (void *)v8;
  }
  id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:self->_editTextSymbol withConfiguration:v6];

  return v9;
}

- (CGImage)_imageRefForImage:(id)a3
{
  id v3 = a3;

  return (CGImage *)[v3 CGImage];
}

- (SUICStreamingTextViewDelegate)streamingTextViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_streamingTextViewDelegate);

  return (SUICStreamingTextViewDelegate *)WeakRetained;
}

- (void)setStreamingTextViewDelegate:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (double)hyphenationFactor
{
  return self->_hyphenationFactor;
}

- (UIColor)startTextColor
{
  return self->_startTextColor;
}

- (void)setStartTextColor:(id)a3
{
}

- (UIColor)endTextColor
{
  return self->_endTextColor;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (BOOL)animated
{
  return self->_animated;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (BOOL)centerAlign
{
  return self->_centerAlign;
}

- (void)setCenterAlign:(BOOL)a3
{
  self->_centerAlign = a3;
}

- (BOOL)showEditTextImage
{
  return self->_showEditTextImage;
}

- (NSString)editTextSymbol
{
  return self->_editTextSymbol;
}

- (void)setEditTextSymbol:(id)a3
{
}

- (BOOL)showChevron
{
  return self->_showChevron;
}

- (BOOL)renderEmojisOnly
{
  return self->_renderEmojisOnly;
}

- (void)setRenderEmojisOnly:(BOOL)a3
{
  self->_renderEmojisOnlCGFloat y = a3;
}

- (BOOL)renderEmojis
{
  return self->_renderEmojis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editTextSymbol, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_endTextColor, 0);
  objc_storeStrong((id *)&self->_startTextColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_streamingTextViewDelegate);
  objc_storeStrong((id *)&self->_editTextImage, 0);
  objc_storeStrong((id *)&self->_wordsToDelete, 0);
  objc_storeStrong((id *)&self->_wordsToShow, 0);
  objc_storeStrong((id *)&self->_words, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);

  objc_storeStrong((id *)&self->_layoutManager, 0);
}

@end