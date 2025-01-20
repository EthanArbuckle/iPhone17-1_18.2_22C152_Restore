@interface PUWallpaperPosterEditToolBar
- (NSArray)leadingMenuElements;
- (NSArray)trailingMenuElements;
- (PUWallpaperPosterEditToolBar)initWithFrame:(CGRect)a3;
- (PUWallpaperPosterEditToolbarDelegate)delegate;
- (UIButton)firstActionButton;
- (UIButton)fourthActionButton;
- (UIButton)secondActionButton;
- (UIButton)thirdActionButton;
- (id)_createActionButton;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)viewForMenuElementIdentifier:(id)a3;
- (void)_removeMenuElement:(id)a3 fromButton:(id)a4;
- (void)_setMenuElement:(id)a3 onButton:(id)a4;
- (void)_setMenuElements:(id)a3 oldMenuElements:(id)a4 onButtonOne:(id)a5 onButtonTwo:(id)a6;
- (void)_setupView;
- (void)setDelegate:(id)a3;
- (void)setFirstActionButton:(id)a3;
- (void)setFourthActionButton:(id)a3;
- (void)setLeadingMenuElements:(id)a3;
- (void)setSecondActionButton:(id)a3;
- (void)setThirdActionButton:(id)a3;
- (void)setTrailingMenuElements:(id)a3;
@end

@implementation PUWallpaperPosterEditToolBar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fourthActionButton, 0);
  objc_storeStrong((id *)&self->_thirdActionButton, 0);
  objc_storeStrong((id *)&self->_secondActionButton, 0);
  objc_storeStrong((id *)&self->_firstActionButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trailingMenuElements, 0);
  objc_storeStrong((id *)&self->_leadingMenuElements, 0);
}

- (void)setFourthActionButton:(id)a3
{
}

- (UIButton)fourthActionButton
{
  return self->_fourthActionButton;
}

- (void)setThirdActionButton:(id)a3
{
}

- (UIButton)thirdActionButton
{
  return self->_thirdActionButton;
}

- (void)setSecondActionButton:(id)a3
{
}

- (UIButton)secondActionButton
{
  return self->_secondActionButton;
}

- (void)setFirstActionButton:(id)a3
{
}

- (UIButton)firstActionButton
{
  return self->_firstActionButton;
}

- (void)setDelegate:(id)a3
{
}

- (PUWallpaperPosterEditToolbarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUWallpaperPosterEditToolbarDelegate *)WeakRetained;
}

- (NSArray)trailingMenuElements
{
  return self->_trailingMenuElements;
}

- (NSArray)leadingMenuElements
{
  return self->_leadingMenuElements;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperPosterEditToolBar;
  v4 = -[PUWallpaperPosterEditToolBar hitTest:withEvent:](&v6, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
  }
  return v4;
}

- (void)_removeMenuElement:(id)a3 fromButton:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setMenu:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 removeAction:v6 forControlEvents:0x2000];
    }
  }
}

- (void)_setMenuElement:(id)a3 onButton:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  id v6 = [v7 image];
  [v5 setImage:v6 forState:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setShowsMenuAsPrimaryAction:1];
    [v5 setMenu:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 setShowsMenuAsPrimaryAction:0];
      [v5 setMenu:0];
      [v5 addAction:v7 forControlEvents:0x2000];
    }
  }
}

- (void)_setMenuElements:(id)a3 oldMenuElements:(id)a4 onButtonOne:(id)a5 onButtonTwo:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 firstObject];
  if ((unint64_t)[v10 count] < 2)
  {
    v14 = 0;
    if (!v13) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v14 = [v10 objectAtIndex:1];
  if (v13) {
LABEL_5:
  }
    [(PUWallpaperPosterEditToolBar *)self _removeMenuElement:v13 fromButton:v11];
LABEL_6:
  if (v14) {
    [(PUWallpaperPosterEditToolBar *)self _removeMenuElement:v14 fromButton:v12];
  }
  v15 = [v17 firstObject];
  if ((unint64_t)[v17 count] < 2)
  {
    v16 = 0;
  }
  else
  {
    v16 = [v17 objectAtIndex:1];
  }
  [v11 setHidden:v15 == 0];
  [v12 setHidden:v16 == 0];
  if (v15) {
    [(PUWallpaperPosterEditToolBar *)self _setMenuElement:v15 onButton:v11];
  }
  if (v16) {
    [(PUWallpaperPosterEditToolBar *)self _setMenuElement:v16 onButton:v12];
  }
}

- (id)viewForMenuElementIdentifier:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_leadingMenuElements count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [(NSArray *)self->_leadingMenuElements objectAtIndex:v5];
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }

      id v8 = [v7 identifier];

      if (v8 == v4) {
        break;
      }

      if (++v5 >= [(NSArray *)self->_leadingMenuElements count]) {
        goto LABEL_9;
      }
    }
    if (v5) {
      [(PUWallpaperPosterEditToolBar *)self secondActionButton];
    }
    else {
      [(PUWallpaperPosterEditToolBar *)self firstActionButton];
    }
  }
  else
  {
LABEL_9:
    if (![(NSArray *)self->_trailingMenuElements count])
    {
LABEL_17:
      id v11 = 0;
      goto LABEL_25;
    }
    uint64_t v9 = 0;
    while (1)
    {
      id v6 = [(NSArray *)self->_trailingMenuElements objectAtIndex:v9];
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }

      id v10 = [v7 identifier];

      if (v10 == v4) {
        break;
      }

      if (++v9 >= [(NSArray *)self->_trailingMenuElements count]) {
        goto LABEL_17;
      }
    }
    if (v9) {
      [(PUWallpaperPosterEditToolBar *)self fourthActionButton];
    }
    else {
      [(PUWallpaperPosterEditToolBar *)self thirdActionButton];
    }
  uint64_t v12 = };
  id v11 = (void *)v12;

LABEL_25:
  return v11;
}

- (void)setTrailingMenuElements:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  trailingMenuElements = self->_trailingMenuElements;
  uint64_t v9 = v5;
  if (trailingMenuElements != v5)
  {
    id v7 = [(PUWallpaperPosterEditToolBar *)self thirdActionButton];
    id v8 = [(PUWallpaperPosterEditToolBar *)self fourthActionButton];
    [(PUWallpaperPosterEditToolBar *)self _setMenuElements:v9 oldMenuElements:trailingMenuElements onButtonOne:v7 onButtonTwo:v8];

    objc_storeStrong((id *)&self->_trailingMenuElements, a3);
  }
}

- (void)setLeadingMenuElements:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  leadingMenuElements = self->_leadingMenuElements;
  uint64_t v9 = v5;
  if (leadingMenuElements != v5)
  {
    id v7 = [(PUWallpaperPosterEditToolBar *)self firstActionButton];
    id v8 = [(PUWallpaperPosterEditToolBar *)self secondActionButton];
    [(PUWallpaperPosterEditToolBar *)self _setMenuElements:v9 oldMenuElements:leadingMenuElements onButtonOne:v7 onButtonTwo:v8];

    objc_storeStrong((id *)&self->_leadingMenuElements, a3);
  }
}

- (id)_createActionButton
{
  v3 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  id v4 = [MEMORY[0x1E4FB1830] configurationWithPointSize:20.0];
  [v3 setPreferredSymbolConfiguration:v4 forImageInState:0];

  uint64_t v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setTintColor:v5];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PUWallpaperPosterEditToolBar *)self addSubview:v3];
  return v3;
}

- (void)_setupView
{
  v49[12] = *MEMORY[0x1E4F143B8];
  v3 = [(PUWallpaperPosterEditToolBar *)self _createActionButton];
  firstActionButton = self->_firstActionButton;
  self->_firstActionButton = v3;

  uint64_t v5 = [(PUWallpaperPosterEditToolBar *)self _createActionButton];
  secondActionButton = self->_secondActionButton;
  self->_secondActionButton = v5;

  id v7 = [(PUWallpaperPosterEditToolBar *)self _createActionButton];
  thirdActionButton = self->_thirdActionButton;
  self->_thirdActionButton = v7;

  uint64_t v9 = [(PUWallpaperPosterEditToolBar *)self _createActionButton];
  fourthActionButton = self->_fourthActionButton;
  self->_fourthActionButton = v9;

  v34 = (void *)MEMORY[0x1E4F28DC8];
  v48 = [(UIButton *)self->_firstActionButton leadingAnchor];
  v47 = [(PUWallpaperPosterEditToolBar *)self leadingAnchor];
  v46 = [v48 constraintEqualToAnchor:v47 constant:20.0];
  v49[0] = v46;
  v45 = [(UIButton *)self->_firstActionButton bottomAnchor];
  v44 = [(PUWallpaperPosterEditToolBar *)self bottomAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v49[1] = v43;
  v42 = [(UIButton *)self->_firstActionButton topAnchor];
  v41 = [(PUWallpaperPosterEditToolBar *)self topAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v49[2] = v40;
  v39 = [(UIButton *)self->_secondActionButton leadingAnchor];
  v38 = [(UIButton *)self->_firstActionButton trailingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:20.0];
  v49[3] = v37;
  v36 = [(UIButton *)self->_secondActionButton bottomAnchor];
  v35 = [(PUWallpaperPosterEditToolBar *)self bottomAnchor];
  v33 = [v36 constraintEqualToAnchor:v35];
  v49[4] = v33;
  v32 = [(UIButton *)self->_secondActionButton topAnchor];
  v31 = [(PUWallpaperPosterEditToolBar *)self topAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v49[5] = v30;
  v29 = [(UIButton *)self->_fourthActionButton trailingAnchor];
  v28 = [(PUWallpaperPosterEditToolBar *)self trailingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28 constant:-20.0];
  v49[6] = v27;
  v26 = [(UIButton *)self->_fourthActionButton bottomAnchor];
  v25 = [(PUWallpaperPosterEditToolBar *)self bottomAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v49[7] = v24;
  v23 = [(UIButton *)self->_fourthActionButton topAnchor];
  v22 = [(PUWallpaperPosterEditToolBar *)self topAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v49[8] = v21;
  id v11 = [(UIButton *)self->_thirdActionButton trailingAnchor];
  uint64_t v12 = [(UIButton *)self->_fourthActionButton leadingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:-20.0];
  v49[9] = v13;
  v14 = [(UIButton *)self->_thirdActionButton bottomAnchor];
  v15 = [(PUWallpaperPosterEditToolBar *)self bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v49[10] = v16;
  id v17 = [(UIButton *)self->_thirdActionButton topAnchor];
  v18 = [(PUWallpaperPosterEditToolBar *)self topAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v49[11] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:12];
  [v34 activateConstraints:v20];
}

- (PUWallpaperPosterEditToolBar)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperPosterEditToolBar;
  v3 = -[PUWallpaperPosterEditToolBar initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(PUWallpaperPosterEditToolBar *)v3 _setupView];
  }
  return v4;
}

@end