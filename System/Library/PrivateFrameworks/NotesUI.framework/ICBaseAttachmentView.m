@interface ICBaseAttachmentView
- (BOOL)cancelDidScrollIntoVisibleRange;
- (BOOL)selected;
- (CGSize)attachmentContentSize;
- (ICAttachment)attachment;
- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder;
- (ICTextAttachment)textAttachment;
- (UIColor)highlightColor;
- (UIImage)imageForPrinting;
- (double)foregroundAlpha;
- (void)addKVObserversForAttachment:(id)a3;
- (void)attachmentWillBeDeleted:(id)a3;
- (void)dealloc;
- (void)didChangeSize;
- (void)mediaDidLoad:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeKVOObserversForAttachment:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setAttachmentContentSize:(CGSize)a3;
- (void)setForegroundAlpha:(double)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTextAttachment:(id)a3;
- (void)updateHighlights;
@end

@implementation ICBaseAttachmentView

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)updateHighlights
{
  BOOL v3 = [(ICBaseAttachmentView *)self selected];
  [(ICBaseAttachmentView *)self foregroundAlpha];
  if (v3) {
    double v4 = v4 * 0.5;
  }
  [(UIView *)self ic_setAlpha:v4];
}

- (BOOL)selected
{
  return self->_selected;
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (void)setForegroundAlpha:(double)a3
{
  self->_foregroundAlpha = a3;
  [(ICBaseAttachmentView *)self updateHighlights];
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
}

- (void)setHighlightColor:(id)a3
{
}

- (void)setAttachment:(id)a3
{
  id v3 = a3;
  p_attachment = &self->_attachment;
  v27 = (ICAttachment *)a3;
  if (*p_attachment != v27)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *MEMORY[0x1E4F83010];
    [v6 removeObserver:self name:*MEMORY[0x1E4F83010] object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = *MEMORY[0x1E4F83040];
    [v8 removeObserver:self name:*MEMORY[0x1E4F83040] object:0];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v11 = *MEMORY[0x1E4F83000];
    [v10 removeObserver:self name:*MEMORY[0x1E4F83000] object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4F830F8];
    [v12 removeObserver:self name:*MEMORY[0x1E4F830F8] object:0];

    v14 = (void *)MEMORY[0x1E4F830A8];
    if (*p_attachment)
    {
      -[ICBaseAttachmentView removeKVOObserversForAttachment:](self, "removeKVOObserversForAttachment:");
      v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 removeObserver:self name:*v14 object:*p_attachment];
    }
    if (v27)
    {
      id v26 = v3;
      [(ICAttachment *)v27 ic_obtainPermanentObjectIDIfNecessary];
      [(ICBaseAttachmentView *)self addKVObserversForAttachment:v27];
      v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v17 = [(ICAttachment *)v27 objectID];
      [v16 addObserver:self selector:sel_attachmentDidLoad_ name:v7 object:v17];

      v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v19 = [(ICAttachment *)v27 objectID];
      [v18 addObserver:self selector:sel_attachmentPreviewImagesDidUpdate_ name:v9 object:v19];

      v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v21 = [(ICAttachment *)v27 objectID];
      [v20 addObserver:self selector:sel_attachmentDidChangeSize_ name:v11 object:v21];

      v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v22 addObserver:self selector:sel_attachmentWillBeDeleted_ name:*MEMORY[0x1E4F830A8] object:v27];

      v23 = [(ICAttachment *)v27 media];
      if (v23)
      {
        v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v25 = objc_msgSend(v23, "ic_permanentObjectID");
        [v24 addObserver:self selector:sel_mediaDidLoad_ name:v13 object:v25];
      }
      id v3 = v26;
    }
    [(ICBaseAttachmentView *)self willChangeAttachment];
    objc_storeStrong((id *)&self->_attachment, v3);
    [(ICBaseAttachmentView *)self didChangeAttachment];
  }
}

- (void)addKVObserversForAttachment:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"title", &compoundliteral_3);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"media", &compoundliteral_3);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"mergeableData", &compoundliteral_3);
  objc_msgSend(v4, "ic_addObserver:forKeyPath:context:", self, @"markedForDeletion", &compoundliteral_3);
}

- (void)setTextAttachment:(id)a3
{
}

- (ICTextAttachment)textAttachment
{
  p_textAttachment = &self->_textAttachment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);
  if (WeakRetained)
  {
  }
  else if (self->_attachment)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__58;
    v20 = __Block_byref_object_dispose__58;
    id v21 = 0;
    v5 = self->_attachment;
    v6 = [(ICAttachment *)v5 note];
    uint64_t v7 = [v6 textStorage];

    uint64_t v8 = [v7 length];
    uint64_t v9 = *MEMORY[0x1E4FB06B8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __38__ICBaseAttachmentView_textAttachment__block_invoke;
    v13[3] = &unk_1E5FDD460;
    v10 = v5;
    v14 = v10;
    v15 = &v16;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v13);
    objc_storeWeak((id *)p_textAttachment, (id)v17[5]);

    _Block_object_dispose(&v16, 8);
  }
  id v11 = objc_loadWeakRetained((id *)p_textAttachment);
  return (ICTextAttachment *)v11;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if (self->_attachment) {
    -[ICBaseAttachmentView removeKVOObserversForAttachment:](self, "removeKVOObserversForAttachment:");
  }
  v4.receiver = self;
  v4.super_class = (Class)ICBaseAttachmentView;
  [(ICBaseAttachmentView *)&v4 dealloc];
}

- (void)removeKVOObserversForAttachment:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"title", &compoundliteral_3);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"media", &compoundliteral_3);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"mergeableData", &compoundliteral_3);
  objc_msgSend(v4, "ic_removeObserver:forKeyPath:context:", self, @"markedForDeletion", &compoundliteral_3);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  if ([(ICBaseAttachmentView *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/SharedUI/Text/TextAttachments/ICBaseAttachmentView.m"])
  {
    char v13 = [(ICBaseAttachmentView *)self ic_shouldIgnoreObserveValue:v11 ofObject:v12 forKeyPath:v10];

    if (a6 == &compoundliteral_3 && (v13 & 1) == 0)
    {
      v14 = [(ICBaseAttachmentView *)self attachment];
      uint64_t v15 = [v14 faultingState];

      if (!v15)
      {
        if ([v10 isEqualToString:@"media"])
        {
          uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v17 = *MEMORY[0x1E4F830F8];
          [v16 removeObserver:self name:*MEMORY[0x1E4F830F8] object:0];

          uint64_t v18 = [(ICBaseAttachmentView *)self attachment];
          v19 = [v18 media];

          if (v19)
          {
            objc_msgSend(v19, "ic_obtainPermanentObjectIDIfNecessary");
            v20 = [v19 objectID];
            id v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v21 addObserver:self selector:sel_mediaDidLoad_ name:v17 object:v20];
          }
          if (([v19 needsInitialFetchFromCloud] & 1) == 0) {
            [(ICBaseAttachmentView *)self didChangeMedia];
          }
        }
        else if ([v10 isEqualToString:@"mergeableData"])
        {
          [(ICBaseAttachmentView *)self didChangeMergeableData];
        }
        else if ([v10 isEqualToString:@"title"])
        {
          [(ICBaseAttachmentView *)self didChangeAttachmentTitle];
        }
        else if ([v10 isEqualToString:@"markedForDeletion"])
        {
          [(ICBaseAttachmentView *)self didChangeMedia];
        }
      }
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)ICBaseAttachmentView;
    [(ICBaseAttachmentView *)&v22 observeValueForKeyPath:v10 ofObject:v12 change:v11 context:a6];
  }
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  [(ICBaseAttachmentView *)self updateHighlights];
}

uint64_t __38__ICBaseAttachmentView_textAttachment__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v12;
    uint64_t v9 = [v8 attachment];
    id v10 = *(void **)(a1 + 32);

    if (v9 == v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a5 = 1;
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (void)didChangeSize
{
  objc_opt_class();
  id v3 = [(ICBaseAttachmentView *)self attachment];
  id v4 = [v3 note];
  v5 = [v4 textStorage];
  v6 = ICCheckedDynamicCast();

  if (([v6 isEditing] & 1) == 0)
  {
    uint64_t v7 = *MEMORY[0x1E4FB06B8];
    uint64_t v8 = [v6 length];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__ICBaseAttachmentView_didChangeSize__block_invoke;
    v9[3] = &unk_1E5FDA0A8;
    v9[4] = self;
    id v10 = v6;
    objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, v9);
  }
}

void __37__ICBaseAttachmentView_didChangeSize__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v7 attachment];
    uint64_t v9 = [*(id *)(a1 + 32) attachment];

    if (v8 == v9)
    {
      if (ICInternalSettingsIsTextKit2Enabled())
      {
        long long v28 = 0uLL;
        long long v29 = 0uLL;
        long long v26 = 0uLL;
        long long v27 = 0uLL;
        id v10 = [*(id *)(a1 + 40) textLayoutManagers];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v27 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              uint64_t v16 = objc_msgSend(v15, "ic_textRangeForRange:", a3, a4);
              [v15 invalidateLayoutForRange:v16];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
          }
          while (v12);
        }
      }
      else
      {
        long long v24 = 0uLL;
        long long v25 = 0uLL;
        long long v22 = 0uLL;
        long long v23 = 0uLL;
        id v10 = objc_msgSend(*(id *)(a1 + 40), "layoutManagers", 0);
        uint64_t v17 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v23 != v19) {
                objc_enumerationMutation(v10);
              }
              id v21 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              objc_msgSend(v21, "invalidateLayoutForCharacterRange:actualCharacterRange:", a3, a4, 0);
              objc_msgSend(v21, "ensureLayoutForCharacterRange:", a3, a4);
            }
            uint64_t v18 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v18);
        }
      }
    }
  }
}

- (BOOL)cancelDidScrollIntoVisibleRange
{
  return 0;
}

- (UIImage)imageForPrinting
{
  [(ICBaseAttachmentView *)self layoutIfNeeded];
  return (UIImage *)[(UIView *)self ic_imageRenderedFromLayer];
}

- (void)mediaDidLoad:(id)a3
{
  id v4 = [a3 object];
  v5 = [(ICBaseAttachmentView *)self attachment];
  v6 = [v5 media];
  id v7 = [v6 objectID];

  if (v4 == v7)
  {
    [(ICBaseAttachmentView *)self didChangeMedia];
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ICBaseAttachmentView mediaDidLoad:](v8);
    }
  }
}

- (void)attachmentWillBeDeleted:(id)a3
{
  id v4 = a3;
  v5 = [(ICBaseAttachmentView *)self attachment];
  v6 = [v4 object];

  if (v5 == v6)
  {
    [(ICBaseAttachmentView *)self willDeleteAttachment];
    [(ICBaseAttachmentView *)self setAttachment:0];
  }
}

- (CGSize)attachmentContentSize
{
  double width = self->_attachmentContentSize.width;
  double height = self->_attachmentContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAttachmentContentSize:(CGSize)a3
{
  self->_attachmentContentSize = a3;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_destroyWeak((id *)&self->_textAttachment);
  objc_storeStrong((id *)&self->_attachment, 0);
}

- (void)mediaDidLoad:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Got a media did change notification for the wrong media.", v1, 2u);
}

@end