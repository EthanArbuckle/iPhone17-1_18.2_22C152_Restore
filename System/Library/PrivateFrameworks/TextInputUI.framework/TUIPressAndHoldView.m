@interface TUIPressAndHoldView
+ (CGSize)requiredPopoverSizeForKeyString:(id)a3;
+ (id)accentedCharactersForKeyString:(id)a3;
- (BOOL)handleNumberKey:(unint64_t)a3;
- (BOOL)handleSelection;
- (BOOL)hasAccentVariantInForwardDirection:(BOOL)a3;
- (BOOL)pressAndHoldGridHasSelectedIndexPath;
- (NSArray)accentVariants;
- (NSIndexPath)selectedIndexPath;
- (NSString)currentKeyString;
- (NSString)selectedAccentVariant;
- (TUIPressAndHoldGrid)pressAndHoldGrid;
- (TUIPressAndHoldView)initWithFrame:(CGRect)a3 keyString:(id)a4;
- (TUIPressAndHoldViewDelegate)delegate;
- (void)pressAndHoldGridDidAcceptAccentVariant:(id)a3 atIndexPath:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPressAndHoldGrid:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)showAccentVariantInForwardDirection:(BOOL)a3;
@end

@implementation TUIPressAndHoldView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressAndHoldGrid, 0);
  objc_storeStrong((id *)&self->_currentKeyString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_accentVariants, 0);
}

- (void)setPressAndHoldGrid:(id)a3
{
}

- (TUIPressAndHoldGrid)pressAndHoldGrid
{
  return self->_pressAndHoldGrid;
}

- (NSString)currentKeyString
{
  return self->_currentKeyString;
}

- (void)setDelegate:(id)a3
{
}

- (TUIPressAndHoldViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TUIPressAndHoldViewDelegate *)WeakRetained;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (NSArray)accentVariants
{
  return self->_accentVariants;
}

- (void)pressAndHoldGridDidAcceptAccentVariant:(id)a3 atIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(TUIPressAndHoldView *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(TUIPressAndHoldView *)self delegate];
    [v9 pressAndHoldViewDidAcceptAccentVariant:v10 atIndexPath:v6];
  }
}

- (NSString)selectedAccentVariant
{
  v2 = [(TUIPressAndHoldView *)self pressAndHoldGrid];
  v3 = [v2 selectedAccentVariant];

  return (NSString *)v3;
}

- (BOOL)handleSelection
{
  v2 = [(TUIPressAndHoldView *)self pressAndHoldGrid];
  char v3 = [v2 handleSelection];

  return v3;
}

- (BOOL)pressAndHoldGridHasSelectedIndexPath
{
  v2 = [(TUIPressAndHoldView *)self pressAndHoldGrid];
  char v3 = [v2 selectedIndexPath];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setSelectedIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIPressAndHoldView *)self pressAndHoldGrid];
  [v5 setSelectedIndexPath:v4];
}

- (BOOL)handleNumberKey:(unint64_t)a3
{
  id v4 = [(TUIPressAndHoldView *)self pressAndHoldGrid];
  LOBYTE(a3) = [v4 handleNumberKey:a3];

  return a3;
}

- (void)showAccentVariantInForwardDirection:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TUIPressAndHoldView *)self pressAndHoldGrid];
  id v4 = (id)[v5 showAccentVariantInForwardDirection:v3];
}

- (BOOL)hasAccentVariantInForwardDirection:(BOOL)a3
{
  uint64_t v3 = a3;
  id v4 = [(TUIPressAndHoldView *)self pressAndHoldGrid];
  LOBYTE(v3) = [v4 hasAccentVariantInForwardDirection:v3];

  return v3;
}

- (TUIPressAndHoldView)initWithFrame:(CGRect)a3 keyString:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TUIPressAndHoldView;
  v11 = -[TUIPressAndHoldView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_currentKeyString, a4);
    v13 = +[TUIPressAndHoldView accentedCharactersForKeyString:v10];
    accentVariants = v12->_accentVariants;
    v12->_accentVariants = v13;
    v15 = v13;

    v16 = [TUIPressAndHoldGrid alloc];
    [(TUIPressAndHoldView *)v12 bounds];
    uint64_t v17 = -[TUIPressAndHoldGrid initWithFrame:accentVariants:](v16, "initWithFrame:accentVariants:", v15);
    pressAndHoldGrid = v12->_pressAndHoldGrid;
    v12->_pressAndHoldGrid = (TUIPressAndHoldGrid *)v17;

    [(TUIPressAndHoldGrid *)v12->_pressAndHoldGrid setDelegate:v12];
    [(TUIPressAndHoldView *)v12 addSubview:v12->_pressAndHoldGrid];
  }
  return v12;
}

+ (CGSize)requiredPopoverSizeForKeyString:(id)a3
{
  uint64_t v3 = [a1 accentedCharactersForKeyString:a3];
  [v3 count];
  double v4 = (double)(unint64_t)[v3 count];
  double v5 = (double)(unint64_t)([v3 count] + 1) * 5.0 + v4 * 30.0 + 0.0;

  double v6 = 56.0;
  double v7 = v5;
  result.double height = v6;
  result.double width = v7;
  return result;
}

+ (id)accentedCharactersForKeyString:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    double v4 = UIKeyboardGetCurrentInputMode();
    double v5 = [@"Roman-Accent-" stringByAppendingString:v3];
    double v6 = UIKeyboardLocalizedObject();

    objc_opt_class();
    double v7 = 0;
    if (objc_opt_isKindOfClass())
    {
      char v8 = [v6 objectForKey:*MEMORY[0x1E4FB2C40]];
      if (v8)
      {
        v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        id v10 = [v8 componentsSeparatedByCharactersInSet:v9];

        double v7 = (void *)[v10 mutableCopy];
        [v7 removeObject:v3];
      }
      else
      {
        double v7 = 0;
      }
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

@end