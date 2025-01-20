@interface PXHUDView
+ (Class)visualizationClassToViewClass:(Class)a3;
- (NSMapTable)visualizationToView;
- (PXHUDView)initWithCoder:(id)a3;
- (PXHUDView)initWithFrame:(CGRect)a3;
- (UIStackView)stackView;
- (void)addVisualization:(id)a3;
- (void)removeVisualization:(id)a3;
- (void)setStackView:(id)a3;
- (void)setVisualizationToView:(id)a3;
@end

@implementation PXHUDView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_visualizationToView, 0);
}

- (void)setStackView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setVisualizationToView:(id)a3
{
}

- (NSMapTable)visualizationToView
{
  return self->_visualizationToView;
}

- (void)removeVisualization:(id)a3
{
  id v8 = a3;
  v4 = [(PXHUDView *)self visualizationToView];
  v5 = [v4 objectForKey:v8];

  if (v5)
  {
    v6 = [(PXHUDView *)self visualizationToView];
    [v6 removeObjectForKey:v8];

    v7 = [(PXHUDView *)self stackView];
    [v7 removeArrangedSubview:v5];

    [v5 removeFromSuperview];
  }
}

- (void)addVisualization:(id)a3
{
  id v9 = a3;
  v4 = [(PXHUDView *)self visualizationToView];
  id v5 = [v4 objectForKey:v9];

  if (!v5)
  {
    v6 = objc_opt_class();
    id v5 = objc_alloc_init((Class)[v6 visualizationClassToViewClass:objc_opt_class()]);
    [v5 setVisualization:v9];
    v7 = [(PXHUDView *)self stackView];
    [v7 addArrangedSubview:v5];

    id v8 = [(PXHUDView *)self visualizationToView];
    [v8 setObject:v5 forKey:v9];
  }
}

- (PXHUDView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXHUDView;
  v3 = -[PXHUDView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    commonInit(v3);
  }
  return v4;
}

- (PXHUDView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXHUDView;
  v3 = [(PXHUDView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    commonInit(v3);
  }
  return v4;
}

+ (Class)visualizationClassToViewClass:(Class)a3
{
  if (visualizationClassToViewClass__onceToken != -1) {
    dispatch_once(&visualizationClassToViewClass__onceToken, &__block_literal_global_203263);
  }
  v4 = (void *)visualizationClassToViewClass__visualizationClassToViewClass;
  return (Class)[v4 objectForKey:a3];
}

uint64_t __43__PXHUDView_visualizationClassToViewClass___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v1 = (void *)visualizationClassToViewClass__visualizationClassToViewClass;
  visualizationClassToViewClass__visualizationClassToViewClass = v0;

  v2 = (void *)visualizationClassToViewClass__visualizationClassToViewClass;
  uint64_t v3 = objc_opt_class();
  [v2 setObject:v3 forKey:objc_opt_class()];
  v4 = (void *)visualizationClassToViewClass__visualizationClassToViewClass;
  uint64_t v5 = objc_opt_class();
  [v4 setObject:v5 forKey:objc_opt_class()];
  objc_super v6 = (void *)visualizationClassToViewClass__visualizationClassToViewClass;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  return [v6 setObject:v7 forKey:v8];
}

@end