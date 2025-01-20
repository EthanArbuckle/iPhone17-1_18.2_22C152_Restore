@interface TPNumberPad
- (BOOL)numberButtonsEnabled;
- (CGSize)intrinsicContentSize;
- (NSArray)buttons;
- (TPNumberPad)initWithButtons:(id)a3;
- (double)buttonBackgroundAlpha;
- (void)_addButton:(id)a3;
- (void)_layoutGrid;
- (void)buttonLongPressedViaGesture:(id)a3;
- (void)dealloc;
- (void)handleCurrentLocaleDidChangeNotification:(id)a3;
- (void)replaceButton:(id)a3 atIndex:(unint64_t)a4;
- (void)setButtonBackgroundAlpha:(double)a3;
- (void)setButtons:(id)a3;
- (void)setNumberButtonsEnabled:(BOOL)a3;
@end

@implementation TPNumberPad

- (TPNumberPad)initWithButtons:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  self->_numberButtonsEnabled = 1;
  if ((unint64_t)[v5 count] <= 0xB)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"TPNumberPad.m" lineNumber:29 description:@"Must have 12 buttons to use this class."];
  }
  v6 = [v5 objectAtIndex:0];
  [v6 frame];
  double v8 = v7 * 3.0;
  [v6 frame];
  v25.receiver = self;
  v25.super_class = (Class)TPNumberPad;
  v10 = -[TPNumberPad initWithFrame:](&v25, sel_initWithFrame_, 0.0, 0.0, v8, v9 * 4.0);
  v11 = v10;
  if (v10)
  {
    [(TPNumberPad *)v10 setButtons:v5];
    v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(TPNumberPad *)v11 setBackgroundColor:v12];

    [(TPNumberPad *)v11 setOpaque:0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v5;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          -[TPNumberPad _addButton:](v11, "_addButton:", *(void *)(*((void *)&v21 + 1) + 8 * v17++), (void)v21);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v15);
    }

    [(TPNumberPad *)v11 _layoutGrid];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v11 selector:sel_handleCurrentLocaleDidChangeNotification_ name:*MEMORY[0x1E4F1C370] object:0];
  }
  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TPNumberPad;
  [(TPNumberPad *)&v4 dealloc];
}

- (void)handleCurrentLocaleDidChangeNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(TPNumberPad *)self buttons];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 loadImagesForCurrentCharacter];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (CGSize)intrinsicContentSize
{
  v2 = [(TPNumberPad *)self buttons];
  v3 = [v2 objectAtIndex:0];

  [v3 frame];
  double v5 = v4 * 3.0;
  [v3 frame];
  double v7 = v6 * 4.0;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (NSArray)buttons
{
  return (NSArray *)self->_buttons;
}

- (void)setButtons:(id)a3
{
  id v8 = a3;
  buttons = self->_buttons;
  if (!buttons)
  {
    double v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v6 = self->_buttons;
    self->_buttons = v5;

    buttons = self->_buttons;
  }
  [(NSMutableArray *)buttons removeAllObjects];
  double v7 = v8;
  if (v8)
  {
    [(NSMutableArray *)self->_buttons addObjectsFromArray:v8];
    double v7 = v8;
  }
}

- (void)replaceButton:(id)a3 atIndex:(unint64_t)a4
{
  id v9 = a3;
  if (a4 >= 0xC)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TPNumberPad.m", 86, @"Index out of bounds: %u", a4);
  }
  double v7 = [(NSMutableArray *)self->_buttons objectAtIndex:a4];
  [v7 removeFromSuperview];
  [(NSMutableArray *)self->_buttons replaceObjectAtIndex:a4 withObject:v9];
  [(TPNumberPad *)self _addButton:v9];
  [(TPNumberPad *)self _layoutGrid];
}

- (void)_layoutGrid
{
  v3 = [(NSMutableArray *)self->_buttons objectAtIndex:0];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = 0;
  uint64_t v9 = 0;
  id v10 = 0;
  double v11 = 0.0;
  do
  {
    uint64_t v12 = 0;
    double v13 = 0.0;
    do
    {
      uint64_t v14 = v10;
      id v15 = [(NSMutableArray *)self->_buttons objectAtIndex:v8 + v12];

      [v15 frame];
      objc_msgSend(v15, "setFrame:", v13, v11);
      id v10 = v15;
      ++v12;
      double v13 = v5 + v13;
    }
    while (v12 != 3);
    ++v9;
    double v11 = v7 + v11;
    v8 += 3;
  }
  while (v9 != 4);
}

- (void)_addButton:(id)a3
{
  id v6 = a3;
  if ([v6 conformsToProtocol:&unk_1F1EA2500]) {
    BOOL v4 = [v6 character] == 13;
  }
  else {
    BOOL v4 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !v4)
  {
    [v6 setExclusiveTouch:1];
    [v6 addTarget:self action:sel_buttonTapped_ forControlEvents:64];
    [v6 addTarget:self action:sel_buttonDown_ forControlEvents:1];
    [v6 addTarget:self action:sel_buttonUp_ forControlEvents:64];
    [v6 addTarget:self action:sel_buttonUpOutside_ forControlEvents:128];
    [v6 addTarget:self action:sel_buttonCancelled_ forControlEvents:256];
  }
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_buttonLongPressedViaGesture_];
  [v5 setAllowableMovement:100.0];
  [v5 setMinimumPressDuration:1.0];
  [v6 addGestureRecognizer:v5];
  [(TPNumberPad *)self addSubview:v6];
}

- (void)setNumberButtonsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_numberButtonsEnabled != a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v5 = self->_buttons;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v10, "character", (void)v11) != 12) {
            [v10 setEnabled:v3];
          }
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  self->_numberButtonsEnabled = v3;
}

- (void)buttonLongPressedViaGesture:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 1)
  {
    BOOL v4 = [v5 view];
    [(TPNumberPad *)self buttonLongPressed:v4];
  }
}

- (BOOL)numberButtonsEnabled
{
  return self->_numberButtonsEnabled;
}

- (double)buttonBackgroundAlpha
{
  return self->_buttonBackgroundAlpha;
}

- (void)setButtonBackgroundAlpha:(double)a3
{
  self->_buttonBackgroundAlpha = a3;
}

- (void).cxx_destruct
{
}

@end