@interface ICStartupBaseViewController
- (BOOL)didSetupChoices;
- (ICStartupNavigationController)startupNavigationController;
- (unint64_t)numChoices;
- (void)choicesUpdated;
- (void)hideChoices;
- (void)primaryButtonPressed:(id)a3;
- (void)secondaryButtonPressed:(id)a3;
- (void)setDidSetupChoices:(BOOL)a3;
- (void)updateChoiceButtons;
- (void)viewDidLoad;
@end

@implementation ICStartupBaseViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ICStartupBaseViewController;
  [(ICStartupBaseViewController *)&v3 viewDidLoad];
  [(ICStartupBaseViewController *)self choicesUpdated];
}

- (void)choicesUpdated
{
}

- (void)hideChoices
{
  id v2 = [(ICStartupBaseViewController *)self buttonTray];
  [v2 setHidden:1];
}

- (unint64_t)numChoices
{
  id v2 = [(ICStartupBaseViewController *)self choiceLabels];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)updateChoiceButtons
{
  unint64_t v3 = [(ICStartupBaseViewController *)self numChoices];
  if (![(ICStartupBaseViewController *)self didSetupChoices] && v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      v5 = [(ICStartupBaseViewController *)self choiceLabels];
      v6 = [v5 objectAtIndexedSubscript:i];

      if (i)
      {
        v7 = +[OBTrayButton buttonWithType:1];
        v8 = v7;
        v9 = self;
        v10 = "secondaryButtonPressed:";
      }
      else
      {
        v7 = +[OBBoldTrayButton boldButton];
        v8 = v7;
        v9 = self;
        v10 = "primaryButtonPressed:";
      }
      [v7 addTarget:v9 action:v10 forControlEvents:64];
      [v8 setTitle:v6 forState:0];
      v11 = [(ICStartupBaseViewController *)self buttonTray];
      [v11 addButton:v8];
    }
    [(ICStartupBaseViewController *)self setDidSetupChoices:1];
    goto LABEL_10;
  }
  if (v3)
  {
LABEL_10:
    id v12 = [(ICStartupBaseViewController *)self buttonTray];
    [v12 setHidden:0];

    return;
  }

  [(ICStartupBaseViewController *)self hideChoices];
}

- (ICStartupNavigationController)startupNavigationController
{
  objc_opt_class();
  unint64_t v3 = [(ICStartupBaseViewController *)self navigationController];
  v4 = ICCheckedDynamicCast();

  return (ICStartupNavigationController *)v4;
}

- (void)primaryButtonPressed:(id)a3
{
  if ([(ICStartupBaseViewController *)self numChoices] < 2)
  {
    uint64_t v6 = 0;
  }
  else
  {
    v4 = [(ICStartupBaseViewController *)self startupNavigationController];
    unsigned int v5 = [v4 shouldSwapChoices];

    uint64_t v6 = v5;
  }

  [(ICStartupBaseViewController *)self choiceSelected:v6];
}

- (void)secondaryButtonPressed:(id)a3
{
  v4 = [(ICStartupBaseViewController *)self startupNavigationController];
  uint64_t v5 = [v4 shouldSwapChoices] ^ 1;

  [(ICStartupBaseViewController *)self choiceSelected:v5];
}

- (BOOL)didSetupChoices
{
  return self->_didSetupChoices;
}

- (void)setDidSetupChoices:(BOOL)a3
{
  self->_didSetupChoices = a3;
}

@end