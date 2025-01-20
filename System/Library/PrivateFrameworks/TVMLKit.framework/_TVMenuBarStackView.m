@interface _TVMenuBarStackView
- (NSArray)tabBarItems;
- (_TVMenuBarStackView)initWithCoder:(id)a3;
- (_TVMenuBarStackView)initWithFrame:(CGRect)a3;
- (_TVMenuBarStackViewDelegate)delegate;
- (unint64_t)selectedIndex;
- (void)_buttonEventTouchUpInside:(id)a3;
- (void)_configureView;
- (void)setDelegate:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setTabBarItems:(id)a3;
@end

@implementation _TVMenuBarStackView

- (_TVMenuBarStackView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVMenuBarStackView;
  v3 = -[_TVMenuBarStackView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TVMenuBarStackView *)v3 _configureView];
  }
  return v4;
}

- (_TVMenuBarStackView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVMenuBarStackView;
  v3 = [(_TVMenuBarStackView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(_TVMenuBarStackView *)v3 _configureView];
  }
  return v4;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    v4 = [(_TVMenuBarStackView *)self arrangedSubviews];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __40___TVMenuBarStackView_setSelectedIndex___block_invoke;
    v5[3] = &unk_264BA69C8;
    v5[4] = self;
    [v4 enumerateObjectsUsingBlock:v5];
  }
}

- (void)setTabBarItems:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v4 = (NSArray *)a3;
  if (self->_tabBarItems != v4)
  {
    v5 = [(_TVMenuBarStackView *)self subviews];
    objc_super v6 = (void *)[v5 copy];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          [(_TVMenuBarStackView *)self removeArrangedSubview:*(void *)(*((void *)&v26 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }

    v21 = v4;
    v12 = (NSArray *)[(NSArray *)v4 copy];
    tabBarItems = self->_tabBarItems;
    self->_tabBarItems = v12;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v14 = self->_tabBarItems;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * v18);
          v20 = +[_TVMenuBarStackButton buttonWithType:1];
          [v20 setTabBarItem:v19];
          [v20 addTarget:self action:sel__buttonEventTouchUpInside_ forControlEvents:64];
          [(_TVMenuBarStackView *)self addArrangedSubview:v20];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }

    v4 = v21;
  }
}

- (void)_buttonEventTouchUpInside:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v5 = [(_TVMenuBarStackView *)self arrangedSubviews];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __49___TVMenuBarStackView__buttonEventTouchUpInside___block_invoke;
  v14 = &unk_264BA69F0;
  id v6 = v4;
  id v15 = v6;
  uint64_t v16 = &v17;
  [v5 enumerateObjectsUsingBlock:&v11];

  id v7 = [(_TVMenuBarStackView *)self delegate];

  if (v7)
  {
    unint64_t v8 = [(_TVMenuBarStackView *)self selectedIndex];
    if (v8 == v18[3])
    {
      uint64_t v9 = [(_TVMenuBarStackView *)self delegate];
      [v9 stackView:self poppedToRootForIndex:v18[3]];
    }
    uint64_t v10 = [(_TVMenuBarStackView *)self delegate];
    [v10 stackView:self selectedIndex:v18[3]];
  }
  [(_TVMenuBarStackView *)self setSelectedIndex:v18[3]];

  _Block_object_dispose(&v17, 8);
}

- (void)_configureView
{
  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  [(_TVMenuBarStackView *)self setAlignment:3];
  [(_TVMenuBarStackView *)self setAxis:0];
  LODWORD(v3) = 1132068864;
  [(_TVMenuBarStackView *)self setContentHuggingPriority:0 forAxis:v3];
  LODWORD(v4) = 1132068864;
  [(_TVMenuBarStackView *)self setContentHuggingPriority:1 forAxis:v4];
  [(_TVMenuBarStackView *)self setDistribution:0];
  [(_TVMenuBarStackView *)self setSpacing:36.0];
}

- (_TVMenuBarStackViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_TVMenuBarStackViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (NSArray)tabBarItems
{
  return self->_tabBarItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end