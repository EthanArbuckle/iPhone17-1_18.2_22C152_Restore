@interface _UIWTCProofreadingDecorationView
- (NSArray)decorationInformation;
- (_UIWTCProofreadingDecorationView)initWithFrame:(CGRect)a3;
- (void)addDecorationInfo:(id)a3;
- (void)clearAllDecorations;
- (void)clearAllDecorationsOfType:(int64_t)a3;
- (void)clearAllHighlights;
- (void)clearAllUnderlines;
- (void)layoutSubviews;
- (void)removeDecorationInfo:(id)a3;
- (void)setDecorationInformation:(id)a3;
@end

@implementation _UIWTCProofreadingDecorationView

- (_UIWTCProofreadingDecorationView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_UIWTCProofreadingDecorationView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:0];
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    underlineDecorations = v4->_underlineDecorations;
    v4->_underlineDecorations = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    underlineSubviews = v4->_underlineSubviews;
    v4->_underlineSubviews = (NSMutableDictionary *)v7;

    v9 = [_UIWTCHighlightContainerView alloc];
    [(UIView *)v4 bounds];
    uint64_t v10 = -[_UIWTCHighlightContainerView initWithFrame:](v9, "initWithFrame:");
    highlightContainer = v4->_highlightContainer;
    v4->_highlightContainer = (_UIWTCHighlightContainerView *)v10;

    [(UIView *)v4->_highlightContainer setAutoresizingMask:18];
    [(UIView *)v4 addSubview:v4->_highlightContainer];
  }
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    if (self->_needsLayoutForUnderlines)
    {
      if (!self->_underlineEffectView)
      {
        v3 = [UIVisualEffectView alloc];
        v4 = _UIWritingToolsProofreadingUnderlineEffect();
        uint64_t v5 = [(UIVisualEffectView *)v3 initWithEffect:v4];
        underlineEffectView = self->_underlineEffectView;
        self->_underlineEffectView = v5;

        [(UIView *)self bounds];
        -[UIView setFrame:](self->_underlineEffectView, "setFrame:");
        [(UIView *)self->_underlineEffectView setAutoresizingMask:18];
        [(UIView *)self addSubview:self->_underlineEffectView];
      }
      uint64_t v7 = self->_underlineDecorations;
      v8 = self->_underlineSubviews;
      v9 = [(UIVisualEffectView *)self->_underlineEffectView contentView];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      v34 = v7;
      obuint64_t j = [(NSMutableDictionary *)v7 keyEnumerator];
      uint64_t v35 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
      if (v35)
      {
        uint64_t v32 = *(void *)v56;
        v33 = v8;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v56 != v32) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void *)(*((void *)&v55 + 1) + 8 * v10);
            v39 = [(NSMutableDictionary *)v34 objectForKeyedSubscript:v11];
            v12 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v11];
            uint64_t v36 = v10;
            if (v12)
            {
              long long v53 = 0u;
              long long v54 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              id v42 = v12;
              uint64_t v13 = [v42 countByEnumeratingWithState:&v51 objects:v61 count:16];
              if (v13)
              {
                uint64_t v14 = v13;
                uint64_t v15 = *(void *)v52;
                do
                {
                  for (uint64_t i = 0; i != v14; ++i)
                  {
                    if (*(void *)v52 != v15) {
                      objc_enumerationMutation(v42);
                    }
                    [*(id *)(*((void *)&v51 + 1) + 8 * i) removeFromSuperview];
                  }
                  uint64_t v14 = [v42 countByEnumeratingWithState:&v51 objects:v61 count:16];
                }
                while (v14);
              }

              [v42 removeAllObjects];
            }
            else
            {
              id v42 = [MEMORY[0x1E4F1CA48] array];
              -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:");
            }
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v37 = [v39 ranges];
            uint64_t v40 = [v37 countByEnumeratingWithState:&v47 objects:v60 count:16];
            if (v40)
            {
              uint64_t v38 = *(void *)v48;
              do
              {
                uint64_t v17 = 0;
                do
                {
                  if (*(void *)v48 != v38) {
                    objc_enumerationMutation(v37);
                  }
                  uint64_t v41 = v17;
                  uint64_t v18 = *(void *)(*((void *)&v47 + 1) + 8 * v17);
                  v19 = [v39 containers];
                  v20 = [v19 objectForKey:v18];

                  v21 = [v39 paths];
                  v22 = [v21 objectForKeyedSubscript:v18];

                  long long v45 = 0u;
                  long long v46 = 0u;
                  long long v43 = 0u;
                  long long v44 = 0u;
                  id v23 = v22;
                  uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v59 count:16];
                  if (v24)
                  {
                    uint64_t v25 = v24;
                    uint64_t v26 = *(void *)v44;
                    do
                    {
                      for (uint64_t j = 0; j != v25; ++j)
                      {
                        if (*(void *)v44 != v26) {
                          objc_enumerationMutation(v23);
                        }
                        v28 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                        v29 = objc_alloc_init(_UIWTCUnderlineDrawingView);
                        [v42 addObject:v29];
                        [(_UIWTCUnderlineDrawingView *)v29 setPath:v28];
                        v30 = [(UIView *)self tintColor];
                        [(_UIWTCUnderlineDrawingView *)v29 setColor:v30];

                        [v28 bounds];
                        objc_msgSend(v9, "convertRect:fromView:", v20);
                        -[UIView setFrame:](v29, "setFrame:");
                        [v9 addSubview:v29];
                      }
                      uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v59 count:16];
                    }
                    while (v25);
                  }

                  uint64_t v17 = v41 + 1;
                }
                while (v41 + 1 != v40);
                uint64_t v40 = [v37 countByEnumeratingWithState:&v47 objects:v60 count:16];
              }
              while (v40);
            }

            uint64_t v10 = v36 + 1;
            v8 = v33;
          }
          while (v36 + 1 != v35);
          uint64_t v35 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
        }
        while (v35);
      }

      self->_needsLayoutForUnderlines = 0;
    }
    if (self->_needsLayoutForHighlights) {
      self->_needsLayoutForHighlights = 0;
    }
  }
}

- (void)addDecorationInfo:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 type])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v28 = v4;
    uint64_t v5 = [v4 paths];
    v6 = [v5 objectEnumerator];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v31 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * j);
                if (v9) {
                  [v9 appendPath:v18];
                }
                else {
                  id v9 = v18;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v15);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    v21 = [(_UIWTCHighlightContainerView *)self->_highlightContainer highlightSubview];
    id v22 = v9;
    objc_msgSend(v21, "setPath:", objc_msgSend(v22, "CGPath"));
    id v23 = [(UIView *)self->_highlightContainer tintColor];
    uint64_t v24 = [v23 colorWithAlphaComponent:0.2];
    [v21 setSelectionColor:v24];

    self->_needsLayoutForHighlights = 1;
    id v4 = v28;
  }
  else
  {
    v19 = self->_underlineDecorations;
    v20 = [v4 identifier];
    [(NSMutableDictionary *)v19 setObject:v4 forKeyedSubscript:v20];

    self->_needsLayoutForUnderlines = 1;
  }
  [(UIView *)self setNeedsLayout];
  uint64_t v25 = [(UIView *)self window];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    BOOL v27 = +[UIView _isInAnimationBlockWithAnimationsEnabled];

    if (v27)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __54___UIWTCProofreadingDecorationView_addDecorationInfo___block_invoke;
      v29[3] = &unk_1E52D9F70;
      v29[4] = self;
      +[UIView performWithoutAnimation:v29];
    }
  }
}

- (void)removeDecorationInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  if ([v4 type])
  {
    v6 = [(_UIWTCHighlightContainerView *)self->_highlightContainer highlightSubview];
    [(NSMutableDictionary *)v6 setPath:0];
  }
  else
  {
    v6 = self->_underlineDecorations;
    uint64_t v7 = self->_underlineSubviews;
    [(NSMutableDictionary *)v6 removeObjectForKey:v5];
    uint64_t v8 = [(NSMutableDictionary *)v7 objectForKeyedSubscript:v5];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v12++) removeFromSuperview];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
    [v8 removeAllObjects];
  }
}

- (void)clearAllDecorationsOfType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = self->_underlineDecorations;
  uint64_t v5 = (void *)[(NSMutableDictionary *)v4 copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = objc_msgSend(v5, "objectEnumerator", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(_UIWTCProofreadingDecorationView *)self removeDecorationInfo:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)clearAllUnderlines
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableDictionary *)self->_underlineDecorations copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(v3, "objectEnumerator", 0);
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
        [(_UIWTCProofreadingDecorationView *)self removeDecorationInfo:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)clearAllHighlights
{
  id v2 = [(_UIWTCHighlightContainerView *)self->_highlightContainer highlightSubview];
  [v2 setPath:0];
}

- (void)clearAllDecorations
{
  [(_UIWTCProofreadingDecorationView *)self clearAllUnderlines];
  [(_UIWTCProofreadingDecorationView *)self clearAllHighlights];
}

- (NSArray)decorationInformation
{
  return self->_decorationInformation;
}

- (void)setDecorationInformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationInformation, 0);
  objc_storeStrong((id *)&self->_highlightContainer, 0);
  objc_storeStrong((id *)&self->_underlineEffectView, 0);
  objc_storeStrong((id *)&self->_highlightInfo, 0);
  objc_storeStrong((id *)&self->_underlineSubviews, 0);
  objc_storeStrong((id *)&self->_underlineDecorations, 0);
}

@end