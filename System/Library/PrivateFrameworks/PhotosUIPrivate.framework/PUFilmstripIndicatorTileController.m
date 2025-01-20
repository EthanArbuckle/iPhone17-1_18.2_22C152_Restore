@interface PUFilmstripIndicatorTileController
- (id)loadView;
- (void)applyLayoutInfo:(id)a3;
@end

@implementation PUFilmstripIndicatorTileController

- (void)applyLayoutInfo:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUFilmstripIndicatorTileController;
  [(PUTileViewController *)&v14 applyLayoutInfo:v5];
  id v6 = v5;
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PUFilmstripView.m", 765, @"%@ should be an instance inheriting from %@, but it is nil", @"layoutInfo", v11 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PUFilmstripView.m", 765, @"%@ should be an instance inheriting from %@, but it is %@", @"layoutInfo", v11, v13 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  v7 = [v6 highlightColor];
  v8 = [(PUTileViewController *)self view];
  [v8 setPreferredHighlightColor:v7];
}

- (id)loadView
{
  v2 = [PUPlayheadView alloc];
  v3 = -[PUPlayheadView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return v3;
}

@end