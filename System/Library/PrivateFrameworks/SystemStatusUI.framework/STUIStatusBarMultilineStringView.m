@interface STUIStatusBarMultilineStringView
- (NSArray)stringViews;
- (STUIStatusBarMultilineStringView)initWithFrame:(CGRect)a3;
- (UIStackView)stackView;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)numberOfLines;
- (void)applyStyleAttributes:(id)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setStackView:(id)a3;
@end

@implementation STUIStatusBarMultilineStringView

- (STUIStatusBarMultilineStringView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)STUIStatusBarMultilineStringView;
  v3 = -[STUIStatusBarMultilineStringView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = objc_alloc(MEMORY[0x1E4FB1C60]);
  [(STUIStatusBarMultilineStringView *)v3 bounds];
  uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
  stackView = v3->_stackView;
  v3->_stackView = (UIStackView *)v5;

  [(UIStackView *)v3->_stackView setAxis:1];
  [(UIStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(STUIStatusBarMultilineStringView *)v3 addSubview:v3->_stackView];
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [(STUIStatusBarMultilineStringView *)v3 leadingAnchor];
  v9 = [(UIStackView *)v3->_stackView leadingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v7 addObject:v10];

  v11 = [(STUIStatusBarMultilineStringView *)v3 trailingAnchor];
  v12 = [(UIStackView *)v3->_stackView trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  [v7 addObject:v13];

  v14 = [(STUIStatusBarMultilineStringView *)v3 topAnchor];
  v15 = [(UIStackView *)v3->_stackView topAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [v7 addObject:v16];

  v17 = [(STUIStatusBarMultilineStringView *)v3 bottomAnchor];
  v18 = [(UIStackView *)v3->_stackView bottomAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v7 addObject:v19];

  [MEMORY[0x1E4F28DC8] activateConstraints:v7];
  return v3;
}

- (void)setNumberOfLines:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_numberOfLines != a3)
  {
    int64_t v3 = a3;
    self->_numberOfLines = a3;
    uint64_t v5 = [(UIStackView *)self->_stackView arrangedSubviews];
    v6 = (void *)[v5 copy];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:", *(void *)(*((void *)&v13 + 1) + 8 * v11++), (void)v13);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    if (v3 >= 1)
    {
      do
      {
        v12 = objc_alloc_init(STUIStatusBarStringView);
        [(UIStackView *)self->_stackView addArrangedSubview:v12];

        --v3;
      }
      while (v3);
    }
  }
}

- (NSArray)stringViews
{
  return [(UIStackView *)self->_stackView arrangedSubviews];
}

- (void)applyStyleAttributes:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(STUIStatusBarMultilineStringView *)self stringViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) applyStyleAttributes:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)viewForFirstBaselineLayout
{
  v2 = [(STUIStatusBarMultilineStringView *)self stringViews];
  int64_t v3 = [v2 firstObject];

  return v3;
}

- (id)viewForLastBaselineLayout
{
  v2 = [(STUIStatusBarMultilineStringView *)self stringViews];
  int64_t v3 = [v2 lastObject];

  return v3;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end