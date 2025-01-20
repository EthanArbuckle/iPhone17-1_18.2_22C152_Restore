@interface CHActivityHistoryNavigationController
- (CHActivityHistoryNavigationController)initWithDateCache:(id)a3 pauseRingsCoordinator:(id)a4;
- (PaletteViewController)paletteVC;
- (void)attachPaletteWithHeight:(double)a3;
- (void)detachPalette;
- (void)reattachPaletteIfNeededExpanded:(BOOL)a3;
- (void)scrollToTop;
- (void)setPaletteExpanded:(BOOL)a3;
- (void)setPaletteVC:(id)a3;
@end

@implementation CHActivityHistoryNavigationController

- (CHActivityHistoryNavigationController)initWithDateCache:(id)a3 pauseRingsCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHActivityHistoryNavigationController;
  v9 = [(CHActivityHistoryNavigationController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dateCache, a3);
    objc_storeStrong((id *)&v10->_pauseRingsCoordinator, a4);
  }

  return v10;
}

- (void)detachPalette
{
  [(CHActivityHistoryNavigationController *)self detachPalette:self->_palette];
  palette = self->_palette;
  self->_palette = 0;
}

- (void)attachPaletteWithHeight:(double)a3
{
  if (!self->_palette)
  {
    v5 = [(CHActivityHistoryNavigationController *)self view];
    [v5 bounds];
    double v7 = v6;

    -[CHActivityHistoryNavigationController paletteForEdge:size:](self, "paletteForEdge:size:", 2, v7, a3);
    id v8 = (_UINavigationControllerPalette *)objc_claimAutoreleasedReturnValue();
    palette = self->_palette;
    self->_palette = v8;

    paletteVC = self->_paletteVC;
    if (!paletteVC)
    {
      v11 = objc_alloc_init(CHPaletteViewControllerSizingDelegate);
      [(CHPaletteViewControllerSizingDelegate *)v11 setView:self->_palette];
      objc_super v12 = [[PaletteViewController alloc] initWithSizingDelegate:v11 dateProvider:self->_dateCache pauseRingsCoordinator:self->_pauseRingsCoordinator];
      v13 = self->_paletteVC;
      self->_paletteVC = v12;

      paletteVC = self->_paletteVC;
    }
    v14 = self->_palette;
    v15 = [(PaletteViewController *)paletteVC view];
    [(_UINavigationControllerPalette *)v14 addSubview:v15];

    v16 = [(PaletteViewController *)self->_paletteVC view];
    [v16 setFrame:0.0, 0.0, v7, a3];

    v17 = self->_palette;
    [(CHActivityHistoryNavigationController *)self attachPalette:v17 isPinned:1];
  }
}

- (void)reattachPaletteIfNeededExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_palette)
  {
    -[CHActivityHistoryNavigationController detachPalette:](self, "detachPalette:");
    palette = self->_palette;
    self->_palette = 0;
  }
  double v6 = 70.0;
  if (!v3) {
    double v6 = 20.0;
  }
  [(CHActivityHistoryNavigationController *)self attachPaletteWithHeight:v6];

  [(CHActivityHistoryNavigationController *)self setPaletteExpanded:v3];
}

- (void)setPaletteExpanded:(BOOL)a3
{
}

- (void)scrollToTop
{
  BOOL v3 = [(CHActivityHistoryNavigationController *)self topViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CHActivityHistoryNavigationController *)self topViewController];
    [v5 performSelector:"scrollToTop"];
  }
}

- (PaletteViewController)paletteVC
{
  return self->_paletteVC;
}

- (void)setPaletteVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paletteVC, 0);
  objc_storeStrong((id *)&self->_pauseRingsCoordinator, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);

  objc_storeStrong((id *)&self->_palette, 0);
}

@end