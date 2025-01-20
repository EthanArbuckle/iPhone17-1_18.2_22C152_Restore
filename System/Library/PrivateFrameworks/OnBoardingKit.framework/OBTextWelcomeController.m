@interface OBTextWelcomeController
- (BOOL)shouldInlineButtonTray;
- (OBTextBulletedList)currentBulletedList;
- (OBTextWelcomeController)initWithTitle:(id)a3;
- (OBTextWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 contentLayout:(int64_t)a5;
- (OBTextWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (OBTextWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (UIStackView)stackView;
- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4;
- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 accessoryButton:(id)a5;
- (void)addSectionWithHeader:(id)a3 content:(id)a4;
- (void)addSectionWithHeader:(id)a3 content:(id)a4 accessoryButton:(id)a5;
- (void)loadView;
- (void)setCurrentBulletedList:(id)a3;
- (void)setStackView:(id)a3;
@end

@implementation OBTextWelcomeController

- (OBTextWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  v7.receiver = self;
  v7.super_class = (Class)OBTextWelcomeController;
  return [(OBWelcomeController *)&v7 initWithTitle:a3 detailText:a4 icon:a5 contentLayout:a6];
}

- (OBTextWelcomeController)initWithTitle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBTextWelcomeController;
  return [(OBWelcomeController *)&v4 initWithTitle:a3 detailText:0 icon:0 contentLayout:2];
}

- (OBTextWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 contentLayout:(int64_t)a5
{
  return [(OBTextWelcomeController *)self initWithTitle:a3 detailText:a4 icon:0 contentLayout:a5];
}

- (OBTextWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  v7.receiver = self;
  v7.super_class = (Class)OBTextWelcomeController;
  return [(OBWelcomeController *)&v7 initWithTitle:a3 detailText:a4 symbolName:a5 contentLayout:a6];
}

- (void)loadView
{
  v33[4] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)OBTextWelcomeController;
  [(OBWelcomeController *)&v32 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  objc_super v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBTextWelcomeController *)self setStackView:v4];

  v5 = [(OBTextWelcomeController *)self stackView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(OBTextWelcomeController *)self stackView];
  [v6 setAxis:1];

  objc_super v7 = [(OBTextWelcomeController *)self stackView];
  [v7 setSpacing:22.0];

  v8 = [(OBWelcomeController *)self contentView];
  v9 = [(OBTextWelcomeController *)self stackView];
  [v8 addSubview:v9];

  v22 = (void *)MEMORY[0x1E4F28DC8];
  v31 = [(OBTextWelcomeController *)self stackView];
  v29 = [v31 topAnchor];
  v30 = [(OBWelcomeController *)self contentView];
  v28 = [v30 topAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v33[0] = v27;
  v26 = [(OBTextWelcomeController *)self stackView];
  v24 = [v26 leftAnchor];
  v25 = [(OBWelcomeController *)self contentView];
  v23 = [v25 leftAnchor];
  v21 = [v24 constraintEqualToAnchor:v23];
  v33[1] = v21;
  v20 = [(OBTextWelcomeController *)self stackView];
  v10 = [v20 rightAnchor];
  v11 = [(OBWelcomeController *)self contentView];
  v12 = [v11 rightAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v33[2] = v13;
  v14 = [(OBTextWelcomeController *)self stackView];
  v15 = [v14 bottomAnchor];
  v16 = [(OBWelcomeController *)self contentView];
  v17 = [v16 bottomAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  v33[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  [v22 activateConstraints:v19];
}

- (void)addSectionWithHeader:(id)a3 content:(id)a4
{
}

- (void)addSectionWithHeader:(id)a3 content:(id)a4 accessoryButton:(id)a5
{
  id v12 = a5;
  id v8 = a4;
  id v9 = a3;
  [(OBTextWelcomeController *)self loadViewIfNeeded];
  v10 = [[OBTextSectionView alloc] initWithHeader:v9 content:v8];

  if (v12) {
    [(OBTextSectionView *)v10 addAccessoryButton:v12];
  }
  v11 = [(OBTextWelcomeController *)self stackView];
  [v11 addArrangedSubview:v10];

  [(OBTextWelcomeController *)self setCurrentBulletedList:0];
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4
{
}

- (void)addBulletedListItemWithTitle:(id)a3 description:(id)a4 accessoryButton:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(OBTextWelcomeController *)self loadViewIfNeeded];
  v11 = [(OBTextWelcomeController *)self currentBulletedList];

  if (!v11)
  {
    id v12 = [OBTextBulletedList alloc];
    v13 = -[OBBulletedList initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v14 = [(OBTextWelcomeController *)self stackView];
    [v14 addArrangedSubview:v13];

    [(OBTextWelcomeController *)self setCurrentBulletedList:v13];
  }
  id v15 = [(OBTextWelcomeController *)self currentBulletedList];
  [v15 addItemWithTitle:v10 description:v9 accessoryButton:v8];
}

- (BOOL)shouldInlineButtonTray
{
  v5.receiver = self;
  v5.super_class = (Class)OBTextWelcomeController;
  if ([(OBWelcomeController *)&v5 contentViewUnderButtonTray]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)OBTextWelcomeController;
  return [(OBWelcomeController *)&v4 shouldInlineButtonTray];
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (OBTextBulletedList)currentBulletedList
{
  return self->_currentBulletedList;
}

- (void)setCurrentBulletedList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBulletedList, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end