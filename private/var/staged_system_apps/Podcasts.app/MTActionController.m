@interface MTActionController
- (MTColorTheme)colorTheme;
- (id)createMoreAction;
- (void)setAvailableActions:(id)a3;
- (void)setColorTheme:(id)a3;
- (void)setupActions;
@end

@implementation MTActionController

- (void)setColorTheme:(id)a3
{
  v5 = (MTColorTheme *)a3;
  colorTheme = self->_colorTheme;
  if (colorTheme != v5 && ([(MTColorTheme *)colorTheme isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_colorTheme, a3);
    [(MTActionController *)self setupActions];
  }

  _objc_release_x1();
}

- (void)setAvailableActions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTActionController;
  [(IMActionController *)&v4 setAvailableActions:a3];
  [(MTActionController *)self setupActions];
}

- (void)setupActions
{
  v3 = [(IMActionController *)self availableActions];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000743B4;
  v4[3] = &unk_10054E180;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

- (id)createMoreAction
{
  return +[MTMoreActionSheetAction action];
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (void).cxx_destruct
{
}

@end