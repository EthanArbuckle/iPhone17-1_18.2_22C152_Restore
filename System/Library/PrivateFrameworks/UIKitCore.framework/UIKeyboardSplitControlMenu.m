@interface UIKeyboardSplitControlMenu
+ (id)activeInstance;
+ (id)sharedInstance;
- (BOOL)usesDeviceLanguageForItemAtIndex:(unint64_t)a3;
- (CGSize)preferredSize;
- (UIKeyboardSplitControlMenu)initWithFrame:(CGRect)a3;
- (id)finishSplitTransitionBlock;
- (id)titleForItemAtIndex:(unint64_t)a3;
- (int)visibleItemForIndex:(unint64_t)a3;
- (unint64_t)defaultSelectedIndex;
- (unint64_t)numberOfItems;
- (void)actionForItem:(id)a3;
- (void)didFinishSplitTransition;
- (void)didSelectItemAtIndex:(unint64_t)a3;
- (void)setFinishSplitTransitionBlock:(id)a3;
- (void)setSplitAndUndocked:(BOOL)a3;
@end

@implementation UIKeyboardSplitControlMenu

- (UIKeyboardSplitControlMenu)initWithFrame:(CGRect)a3
{
  v29[6] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)UIKeyboardSplitControlMenu;
  v3 = -[UIKeyboardMenuView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    v29[3] = objc_opt_class();
    v29[4] = objc_opt_class();
    uint64_t v4 = 0;
    v29[5] = objc_opt_class();
    memset(v28, 0, sizeof(v28));
    do
    {
      id v5 = objc_alloc_init((Class)v29[v4]);
      v6 = *(void **)((char *)v28 + v4 * 8);
      *(void *)((char *)v28 + v4 * 8) = v5;

      ++v4;
    }
    while (v4 != 6);
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:6];
    items = v3->_items;
    v3->_items = (NSArray *)v7;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v9 = v3->_items;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      double v13 = 175.0;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "label", (void)v22);
          v16 = [(UIKeyboardMenuView *)v3 font];
          objc_msgSend(v15, "_legacy_sizeWithFont:", v16);
          double v18 = v17;

          if (v18 + 48.0 > v13) {
            double v13 = v18 + 48.0;
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v11);
    }
    else
    {
      double v13 = 175.0;
    }

    v3->m_preferredSize.width = v13;
    v3->m_preferredSize.height = 100.0;
    v19 = v3;
    for (uint64_t j = 40; j != -8; j -= 8)
  }
  return v3;
}

+ (id)sharedInstance
{
  if (+[UIKeyboardImpl rivenTranslationPreference])
  {
    v2 = (void *)gSharedSplitControlMenu;
    if (!gSharedSplitControlMenu)
    {
      v3 = [UIKeyboardSplitControlMenu alloc];
      uint64_t v4 = -[UIKeyboardSplitControlMenu initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      id v5 = (void *)gSharedSplitControlMenu;
      gSharedSplitControlMenu = v4;

      v2 = (void *)gSharedSplitControlMenu;
    }
    id v6 = v2;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)activeInstance
{
  if (+[UIKeyboardImpl rivenTranslationPreference]) {
    id v2 = (id)gSharedSplitControlMenu;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (void)actionForItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_items;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "label", (void)v13);
        int v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          [v10 actionForMenu:self];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (unint64_t)numberOfItems
{
  return [(UIKeyboardSplitControlMenu *)self visibleItemForIndex:-1];
}

- (CGSize)preferredSize
{
  CGFloat width = self->m_preferredSize.width;
  double v3 = (double)[(UIKeyboardSplitControlMenu *)self numberOfItems] * 50.0;
  double v4 = width;
  result.height = v3;
  result.CGFloat width = v4;
  return result;
}

- (unint64_t)defaultSelectedIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int)visibleItemForIndex:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v4 = self->_items;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v6 + v8;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "visible", (void)v13))
        {
          if (v7 == a3)
          {
            LODWORD(v7) = v8 + v10;
            goto LABEL_14;
          }
          ++v7;
        }
        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v8 = v11;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    LODWORD(v7) = 0;
  }
LABEL_14:

  return v7;
}

- (id)titleForItemAtIndex:(unint64_t)a3
{
  double v3 = [(NSArray *)self->_items objectAtIndexedSubscript:[(UIKeyboardSplitControlMenu *)self visibleItemForIndex:a3]];
  double v4 = [v3 label];

  return v4;
}

- (BOOL)usesDeviceLanguageForItemAtIndex:(unint64_t)a3
{
  return 1;
}

- (void)setSplitAndUndocked:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[UIKeyboardImpl isSplit] != a3) {
    UIKeyboardSetSplit(v3);
  }
  uint64_t v5 = +[UIPeripheralHost sharedInstance];
  int v6 = [v5 isUndocked];

  if (v6 != v3)
  {
    if (+[UIKeyboardImpl isSplit] == v3)
    {
      UIKeyboardSetUndocked(v3);
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __50__UIKeyboardSplitControlMenu_setSplitAndUndocked___block_invoke;
      v7[3] = &__block_descriptor_33_e5_v8__0l;
      BOOL v8 = v3;
      [(UIKeyboardSplitControlMenu *)self setFinishSplitTransitionBlock:v7];
    }
  }
}

void __50__UIKeyboardSplitControlMenu_setSplitAndUndocked___block_invoke(uint64_t a1)
{
}

- (void)didSelectItemAtIndex:(unint64_t)a3
{
  [(UIKeyboardMenuView *)self hide];
  id v5 = [(NSArray *)self->_items objectAtIndexedSubscript:[(UIKeyboardSplitControlMenu *)self visibleItemForIndex:a3]];
  [v5 actionForMenu:self];
}

- (void)didFinishSplitTransition
{
  BOOL v3 = [(UIKeyboardSplitControlMenu *)self finishSplitTransitionBlock];

  if (v3)
  {
    double v4 = [(UIKeyboardSplitControlMenu *)self finishSplitTransitionBlock];
    v4[2]();

    [(UIKeyboardSplitControlMenu *)self setFinishSplitTransitionBlock:0];
  }
}

- (id)finishSplitTransitionBlock
{
  return self->_finishSplitTransitionBlock;
}

- (void)setFinishSplitTransitionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishSplitTransitionBlock, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

void __53__UIKeyboardSplitControlMenu_Floating_actionForMenu___block_invoke()
{
  v0 = +[UIKeyboardImpl activeInstance];
  [v0 setSplit:0 animated:0];

  UIKeyboardSetUndocked(1);
}

void __49__UIKeyboardSplitControlMenu_Dock_actionForMenu___block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) setFinishSplitTransitionBlock:0];
  if (a2)
  {
    +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    UIKeyboardForceOrderInAutomatic();
  }
  else
  {
    UIKeyboardSetUndocked(0);
  }
}

void __50__UIKeyboardSplitControlMenu_Split_actionForMenu___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    +[UIKeyboardImpl setPersistentSplitProgress:1.0];
    UIKeyboardForceOrderInAutomatic();
  }
  else
  {
    UIKeyboardSetSplit(1);
    [*(id *)(a1 + 32) setFinishSplitTransitionBlock:0];
    BOOL v3 = +[UIPeripheralHost sharedInstance];
    char v4 = [v3 isUndocked];

    if ((v4 & 1) == 0)
    {
      id v5 = *(void **)(a1 + 32);
      [v5 setFinishSplitTransitionBlock:&__block_literal_global_463_0];
    }
  }
}

void __50__UIKeyboardSplitControlMenu_Split_actionForMenu___block_invoke_2()
{
}

void __57__UIKeyboardSplitControlMenu_DockAndMerge_actionForMenu___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    +[UIKeyboardImpl setPersistentSplitProgress:0.0];
    +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    UIKeyboardForceOrderInAutomatic();
  }
  else
  {
    UIKeyboardSetSplit(0);
    [*(id *)(a1 + 32) setFinishSplitTransitionBlock:0];
    BOOL v3 = +[UIPeripheralHost sharedInstance];
    int v4 = [v3 isUndocked];

    if (v4) {
      +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
    id v5 = *(void **)(a1 + 32);
    [v5 setFinishSplitTransitionBlock:&__block_literal_global_479];
  }
}

void __57__UIKeyboardSplitControlMenu_DockAndMerge_actionForMenu___block_invoke_2()
{
}

@end