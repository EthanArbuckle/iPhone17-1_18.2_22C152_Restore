@interface QLToolbarButtonItemRepresentation
- (BOOL)disappearsOnTap;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (QLToolbarButton)originalButton;
- (QLToolbarButtonDelegate)presentingViewController;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (unint64_t)placement;
- (void)setDisappearsOnTap:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setLongPressTarget:(id)a3 action:(SEL)a4;
- (void)setOriginalButton:(id)a3;
- (void)setPlacement:(unint64_t)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation QLToolbarButtonItemRepresentation

- (BOOL)isEqual:(id)a3
{
  v4 = (QLToolbarButtonItemRepresentation *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(QLToolbarButtonItemRepresentation *)self identifier];
      v7 = [(QLToolbarButtonItemRepresentation *)v5 identifier];
      int v8 = [v6 isEqualToString:v7];

      if (!v8) {
        goto LABEL_7;
      }
      uint64_t v9 = [(QLToolbarButtonItemRepresentation *)self action];
      if (v9 != [(QLToolbarButtonItemRepresentation *)v5 action]) {
        goto LABEL_7;
      }
      unint64_t v10 = [(QLToolbarButtonItemRepresentation *)self placement];
      if (v10 == [(QLToolbarButtonItemRepresentation *)v5 placement]
        && ([(QLToolbarButtonItemRepresentation *)self target],
            v11 = objc_claimAutoreleasedReturnValue(),
            [(QLToolbarButtonItemRepresentation *)v5 target],
            v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v11,
            v11 == v12))
      {
        v15 = [(QLToolbarButtonItemRepresentation *)self originalButton];
        uint64_t v16 = [(QLToolbarButtonItemRepresentation *)v5 originalButton];
        if (v15 == (void *)v16)
        {
          char v13 = 1;
          v17 = v15;
        }
        else
        {
          v17 = (void *)v16;
          v18 = [(QLToolbarButtonItemRepresentation *)self originalButton];
          v19 = [(QLToolbarButtonItemRepresentation *)v5 originalButton];
          char v13 = [v18 isEqual:v19];
        }
      }
      else
      {
LABEL_7:
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (void)setLongPressTarget:(id)a3 action:(SEL)a4
{
  id v11 = a3;
  v6 = [(QLToolbarButtonItemRepresentation *)self longPressGestureRecognizer];

  if (!v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v11 action:a4];
    [(QLToolbarButtonItemRepresentation *)self setLongPressGestureRecognizer:v7];
    int v8 = [(QLToolbarButtonItemRepresentation *)self _gestureRecognizers];
    uint64_t v9 = (void *)[v8 mutableCopy];

    unint64_t v10 = [(QLToolbarButtonItemRepresentation *)self longPressGestureRecognizer];
    [v9 addObject:v10];

    [(QLToolbarButtonItemRepresentation *)self _setGestureRecognizers:v9];
  }
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 408, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)placement
{
  return self->_placement;
}

- (void)setPlacement:(unint64_t)a3
{
  self->_placement = a3;
}

- (BOOL)disappearsOnTap
{
  return self->_disappearsOnTap;
}

- (void)setDisappearsOnTap:(BOOL)a3
{
  self->_disappearsOnTap = a3;
}

- (QLToolbarButtonDelegate)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (QLToolbarButtonDelegate *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (QLToolbarButton)originalButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalButton);
  return (QLToolbarButton *)WeakRetained;
}

- (void)setOriginalButton:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_originalButton);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end