@interface SUUIToggleButton
- (BOOL)autoIncrement;
- (BOOL)isToggled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)nonToggledTitle;
- (NSString)toggleItemIdentifier;
- (NSString)toggledTitle;
- (SUUIButtonViewElement)element;
- (SUUIToggleButton)init;
- (SUUIToggleButtonDelegate)delegate;
- (id)_layoutForString:(id)a3;
- (id)_nonToggledLayout;
- (id)_titleAttributes;
- (id)_toggledLayout;
- (id)nonToggledContents;
- (id)toggledContents;
- (int64_t)autoIncrementCount;
- (int64_t)count;
- (int64_t)toggleButtonType;
- (void)_sendDidAnimate;
- (void)_sendWillAnimate;
- (void)_showToggleState:(BOOL)a3;
- (void)dealloc;
- (void)itemStateCenter:(id)a3 itemStateChanged:(id)a4;
- (void)setAutoIncrement:(BOOL)a3;
- (void)setAutoIncrementCount:(int64_t)a3;
- (void)setButtonTitleText:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setElement:(id)a3;
- (void)setNonToggledContents:(id)a3;
- (void)setNonToggledTitle:(id)a3;
- (void)setToggleButtonType:(int64_t)a3;
- (void)setToggleItemIdentifier:(id)a3;
- (void)setToggled:(BOOL)a3;
- (void)setToggled:(BOOL)a3 animated:(BOOL)a4;
- (void)setToggledContents:(id)a3;
- (void)setToggledTitle:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation SUUIToggleButton

- (SUUIToggleButton)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIToggleButton;
  v2 = [(SUUIToggleButton *)&v5 init];
  if (v2)
  {
    v3 = +[SUUIToggleStateCenter defaultCenter];
    [v3 addObserver:v2];

    v2->_toggled = 0;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[SUUIToggleStateCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SUUIToggleButton;
  [(SUUIStyledButton *)&v4 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_toggleButtonType)
  {
    v22.receiver = self;
    v22.super_class = (Class)SUUIToggleButton;
    -[SUUIStyledButton sizeThatFits:](&v22, sel_sizeThatFits_, a3.width, a3.height);
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    if (self->_toggled) {
      [(SUUIToggleButton *)self _toggledLayout];
    }
    else {
    v8 = [(SUUIToggleButton *)self _nonToggledLayout];
    }
    v9 = [v8 attributedString];
    [v9 size];
    double v5 = v10;
    double v7 = v11;

    v12 = [(SUUIStyledButton *)self borderStyle];
    v13 = v12;
    if (v12)
    {
      [v12 borderWidth];
      *(float *)&double v14 = v14 + v14;
      double v15 = floorf(*(float *)&v14);
      [v13 contentInset];
      double v7 = v7 + v17 + v16 + v15;
      double v5 = v5 + v18 + v19 + v15;
    }
  }
  double v20 = v5;
  double v21 = v7;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)setToggled:(BOOL)a3
{
  self->_toggled = a3;
  -[SUUIToggleButton setToggled:animated:](self, "setToggled:animated:");
}

- (void)setToggled:(BOOL)a3 animated:(BOOL)a4
{
  self->_toggled = a3;
  [(SUUIToggleButton *)self _showToggleState:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SUUIToggleButton *)self isTouchInside])
  {
    if (self->_toggleItemIdentifier)
    {
      v8 = +[SUUIToggleStateCenter defaultCenter];
      v9 = [v8 itemForIdentifier:self->_toggleItemIdentifier];
      double v10 = v9;
      if (self->_autoIncrement)
      {
        uint64_t autoIncrementCount = [v9 count];
        self->_count = autoIncrementCount;
        if (autoIncrementCount == -1) {
          uint64_t autoIncrementCount = self->_autoIncrementCount;
        }
        if (self->_toggled) {
          uint64_t v12 = autoIncrementCount - 1;
        }
        else {
          uint64_t v12 = autoIncrementCount + 1;
        }
        self->_count = v12 & ~(v12 >> 63);
        if (v12 < 1)
        {
          double v15 = @" ";
        }
        else
        {
          if (touchesEnded_withEvent__sOnceToken != -1) {
            dispatch_once(&touchesEnded_withEvent__sOnceToken, &__block_literal_global_7);
          }
          v13 = (void *)touchesEnded_withEvent__sNumberFormatter;
          double v14 = [NSNumber numberWithInteger:self->_count];
          double v15 = [v13 stringFromNumber:v14];
        }
        [v10 setToggledString:v15];
        [v10 setCount:self->_count];
      }
      [v10 setToggled:!self->_toggled];
      [v8 updateItem:v10];
    }
    else
    {
      [(SUUIToggleButton *)self setToggled:!self->_toggled];
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SUUIToggleButton;
  [(SUUIStyledButton *)&v16 touchesEnded:v6 withEvent:v7];
}

uint64_t __43__SUUIToggleButton_touchesEnded_withEvent___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)touchesEnded_withEvent__sNumberFormatter;
  touchesEnded_withEvent__sNumberFormatter = (uint64_t)v0;

  v2 = (void *)touchesEnded_withEvent__sNumberFormatter;
  return [v2 setNumberStyle:1];
}

- (void)setButtonTitleText:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    objc_storeStrong((id *)&self->_titleToggleString, a3);
    double v5 = [(SUUIToggleButton *)self _layoutForString:v6];
    [(SUUIStyledButton *)self setTitleLayout:v5];

    [(SUUIToggleButton *)self setNeedsLayout];
    [(SUUIToggleButton *)self setNeedsDisplay];
  }
}

- (id)_layoutForString:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x263F086A0];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(SUUIToggleButton *)self _titleAttributes];
  v8 = (void *)[v6 initWithString:v5 attributes:v7];

  v9 = [[SUUIAttributedStringLayoutRequest alloc] initWithAttributedString:v8];
  [(SUUIAttributedStringLayoutRequest *)v9 setNumberOfLines:1];
  [(SUUIAttributedStringLayoutRequest *)v9 setWantsBaselineOffset:1];
  [v8 size];
  -[SUUIAttributedStringLayoutRequest setWidth:](v9, "setWidth:");
  double v10 = [[SUUIAttributedStringLayout alloc] initWithLayoutRequest:v9];

  return v10;
}

- (id)_nonToggledLayout
{
  nonToggledLayout = self->_nonToggledLayout;
  if (!nonToggledLayout)
  {
    double v4 = [(SUUIToggleButton *)self nonToggledTitle];
    id v5 = [(SUUIToggleButton *)self _layoutForString:v4];
    id v6 = self->_nonToggledLayout;
    self->_nonToggledLayout = v5;

    nonToggledLayout = self->_nonToggledLayout;
  }
  return nonToggledLayout;
}

- (void)_sendDidAnimate
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 toggleButtonDidAnimateTransition:self];
  }
}

- (void)_sendWillAnimate
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 toggleButtonWillAnimateTransition:self];
  }
}

- (void)_showToggleState:(BOOL)a3
{
  int64_t toggleButtonType = self->_toggleButtonType;
  if (toggleButtonType == 1)
  {
    BOOL toggled = self->_toggled;
    id v10 = [(SUUIStyledButton *)self imageView];
    if (toggled) {
      [(SUUIToggleButton *)self toggledContents];
    }
    else {
    v8 = [(SUUIToggleButton *)self nonToggledContents];
    }
    [v10 setContents:v8];
  }
  else if (!toggleButtonType)
  {
    BOOL v5 = a3;
    id v6 = [(SUUIToggleButton *)self window];

    [(SUUIToggleButton *)self _sendWillAnimate];
    if (v6 && v5)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __37__SUUIToggleButton__showToggleState___block_invoke;
      v12[3] = &unk_265400980;
      v12[4] = self;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __37__SUUIToggleButton__showToggleState___block_invoke_2;
      v11[3] = &unk_265400AC8;
      v11[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:v12 animations:v11 completion:0.4];
    }
    else
    {
      if (self->_toggled) {
        [(SUUIToggleButton *)self _toggledLayout];
      }
      else {
      v9 = [(SUUIToggleButton *)self _nonToggledLayout];
      }
      [(SUUIStyledButton *)self setTitleLayout:v9];

      [(SUUIToggleButton *)self _sendDidAnimate];
    }
  }
}

void __37__SUUIToggleButton__showToggleState___block_invoke(uint64_t a1)
{
  v1 = *(unsigned char **)(a1 + 32);
  if (v1[688]) {
    [*(id *)(a1 + 32) _toggledLayout];
  }
  else {
  id v2 = [*(id *)(a1 + 32) _nonToggledLayout];
  }
  [v1 setTitleLayout:v2];
}

uint64_t __37__SUUIToggleButton__showToggleState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendDidAnimate];
}

- (id)_titleAttributes
{
  v3 = [(SUUIStyledButton *)self titleLayout];
  double v4 = [v3 attributedString];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [(SUUIStyledButton *)self titleLayout];
    id v7 = [v6 attributedString];
    v8 = [v7 attributesAtIndex:0 effectiveRange:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_element);
    id v6 = [WeakRetained style];

    id v7 = SUUIViewElementFontWithStyle(v6);
    if (!v7)
    {
      id v7 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
    }
    id v10 = [v6 ikColor];
    double v11 = [v10 color];

    if (!v11)
    {
      double v11 = [MEMORY[0x263F825C8] blackColor];
    }
    uint64_t v12 = [MEMORY[0x263F81658] defaultParagraphStyle];
    v13 = (void *)[v12 mutableCopy];

    [v13 setLineBreakMode:4];
    id v14 = objc_alloc(NSDictionary);
    v8 = objc_msgSend(v14, "initWithObjectsAndKeys:", v7, *MEMORY[0x263F814F0], v13, *MEMORY[0x263F81540], v11, *MEMORY[0x263F81500], 0);
  }
  return v8;
}

- (id)_toggledLayout
{
  toggledLayout = self->_toggledLayout;
  if (!toggledLayout)
  {
    double v4 = [(SUUIToggleButton *)self toggledTitle];
    uint64_t v5 = [(SUUIToggleButton *)self _layoutForString:v4];
    id v6 = self->_toggledLayout;
    self->_toggledLayout = v5;

    toggledLayout = self->_toggledLayout;
  }
  return toggledLayout;
}

- (void)itemStateCenter:(id)a3 itemStateChanged:(id)a4
{
  id v5 = a4;
  id v6 = [v5 itemIdentifier];
  int v7 = [v6 isEqualToString:self->_toggleItemIdentifier];

  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__SUUIToggleButton_itemStateCenter_itemStateChanged___block_invoke;
    v8[3] = &unk_265400890;
    id v9 = v5;
    id v10 = self;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
}

void __53__SUUIToggleButton_itemStateCenter_itemStateChanged___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) toggled] & 0x80000000) == 0)
  {
    unsigned __int8 v2 = [*(id *)(a1 + 32) toggled];
    v3 = *(unsigned __int8 **)(a1 + 40);
    if (v3[688] != v2) {
      objc_msgSend(v3, "setToggled:", objc_msgSend(*(id *)(a1 + 32), "toggled") == 1);
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(v4 + 736) == 1 && *(unsigned char *)(v4 + 616))
  {
    id v8 = [*(id *)(a1 + 32) toggledString];
    if ([v8 length])
    {
      id v5 = [*(id *)(a1 + 32) toggledString];
      char v6 = [v5 isEqualToString:*(void *)(*(void *)(a1 + 40) + 672)];

      if (v6) {
        return;
      }
      int v7 = *(void **)(a1 + 40);
      id v8 = [*(id *)(a1 + 32) toggledString];
      objc_msgSend(v7, "setButtonTitleText:");
    }
  }
}

- (BOOL)autoIncrement
{
  return self->_autoIncrement;
}

- (void)setAutoIncrement:(BOOL)a3
{
  self->_autoIncrement = a3;
}

- (int64_t)autoIncrementCount
{
  return self->_autoIncrementCount;
}

- (void)setAutoIncrementCount:(int64_t)a3
{
  self->_uint64_t autoIncrementCount = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (SUUIButtonViewElement)element
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_element);
  return (SUUIButtonViewElement *)WeakRetained;
}

- (void)setElement:(id)a3
{
}

- (NSString)toggleItemIdentifier
{
  return self->_toggleItemIdentifier;
}

- (void)setToggleItemIdentifier:(id)a3
{
}

- (BOOL)isToggled
{
  return self->_toggled;
}

- (SUUIToggleButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIToggleButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)nonToggledTitle
{
  return self->_nonToggledTitle;
}

- (void)setNonToggledTitle:(id)a3
{
}

- (NSString)toggledTitle
{
  return self->_toggledTitle;
}

- (void)setToggledTitle:(id)a3
{
}

- (id)nonToggledContents
{
  return self->_nonToggledContents;
}

- (void)setNonToggledContents:(id)a3
{
}

- (id)toggledContents
{
  return self->_toggledContents;
}

- (void)setToggledContents:(id)a3
{
}

- (int64_t)toggleButtonType
{
  return self->_toggleButtonType;
}

- (void)setToggleButtonType:(int64_t)a3
{
  self->_int64_t toggleButtonType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_toggledContents, 0);
  objc_storeStrong(&self->_nonToggledContents, 0);
  objc_storeStrong((id *)&self->_toggledTitle, 0);
  objc_storeStrong((id *)&self->_nonToggledTitle, 0);
  objc_storeStrong((id *)&self->_toggleItemIdentifier, 0);
  objc_storeStrong((id *)&self->_toggledLayout, 0);
  objc_storeStrong((id *)&self->_titleToggleString, 0);
  objc_storeStrong((id *)&self->_nonToggledLayout, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_element);
}

@end