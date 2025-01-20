@interface PNPSqueezeController
+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6;
- (BOOL)pencilLayerHiddenByInteraction;
- (CALayer)pencilLayer;
- (CGPoint)paletteHoverLocation;
- (PKCanvasView)canvasView;
- (PKToolPicker)toolPicker;
- (id)loadSqueezeAnimationPackage;
- (void)dealloc;
- (void)loadSqueezeAnimationLayer;
- (void)setCanvasView:(id)a3;
- (void)setPaletteHoverLocation:(CGPoint)a3;
- (void)setPencilLayer:(id)a3;
- (void)setPencilLayerHiddenByInteraction:(BOOL)a3;
- (void)setToolPicker:(id)a3;
- (void)toolPickerSelectedToolDidChange:(id)a3;
- (void)toolPickerVisibilityDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PNPSqueezeController

+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v9 = a6;
  v10 = [PNPSqueezeController alloc];
  v11 = PencilPairingUIBundle();
  v12 = [v11 localizedStringForKey:@"SQUEEZE_TITLE" value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];
  v13 = PencilPairingUIBundle();
  v14 = [v13 localizedStringForKey:@"SQUEEZE_DESCRIPTION" value:&stru_26ECD9920 table:@"PencilPairingSqueeze-B532"];
  v15 = [(PNPSqueezeController *)v10 initWithTitle:v12 detailText:v14 icon:0];

  [(PNPWelcomeController *)v15 setControllerType:a3 buttonType:a4 deviceType:a5 delegate:v9];
  return v15;
}

- (void)dealloc
{
  v3 = [(PNPSqueezeController *)self toolPicker];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PNPSqueezeController;
  [(PNPSqueezeController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)PNPSqueezeController;
  [(OBBaseWelcomeController *)&v23 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x263F14AD0]);
  objc_super v4 = [(PNPSqueezeController *)self view];
  [v4 frame];
  v5 = objc_msgSend(v3, "initWithFrame:");

  [v5 setAutoresizingMask:18];
  [v5 setDrawingPolicy:2];
  v6 = [(PNPSqueezeController *)self view];
  [v6 addSubview:v5];

  [(PNPSqueezeController *)self setCanvasView:v5];
  v7 = [(PNPSqueezeController *)self canvasView];
  [v7 setHidden:1];

  v8 = [MEMORY[0x263F1C550] clearColor];
  id v9 = [(PNPSqueezeController *)self canvasView];
  [v9 setBackgroundColor:v8];

  id v10 = objc_alloc_init(MEMORY[0x263F14C08]);
  [(PNPSqueezeController *)self setToolPicker:v10];

  v11 = [(PNPSqueezeController *)self toolPicker];
  v12 = [(PNPSqueezeController *)self canvasView];
  [v11 setVisible:0 forFirstResponder:v12];

  v13 = [(PNPSqueezeController *)self toolPicker];
  [v13 addObserver:self];

  [(PNPSqueezeController *)self loadSqueezeAnimationLayer];
  v14 = [(PNPSqueezeController *)self pencilLayer];
  [v14 setHidden:1];

  v15 = [(PNPSqueezeController *)self view];
  v16 = [v15 layer];
  v17 = [(PNPSqueezeController *)self pencilLayer];
  [v16 addSublayer:v17];

  id v18 = objc_alloc(MEMORY[0x263F14B50]);
  uint64_t v19 = *MEMORY[0x263F14CC0];
  v20 = [MEMORY[0x263F1C550] labelColor];
  v21 = (void *)[v18 initWithInkType:v19 color:v20];
  v22 = [(PNPSqueezeController *)self toolPicker];
  [v22 setSelectedTool:v21];
}

- (void)toolPickerSelectedToolDidChange:(id)a3
{
  id v5 = [a3 selectedTool];
  objc_super v4 = [(PNPSqueezeController *)self canvasView];
  [v4 setTool:v5];
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4 = a3;
  if ([v4 isVisible]
    && ![(PNPSqueezeController *)self pencilLayerHiddenByInteraction])
  {
    id v5 = [(PNPSqueezeController *)self toolPicker];
    v6 = [v5 _paletteView];
    [v6 setAutoHideEnabled:1];

    v7 = [(PNPSqueezeController *)self toolPicker];
    v8 = [(PNPSqueezeController *)self canvasView];
    [v7 setVisible:1 forFirstResponder:v8];

    id v9 = [(PNPSqueezeController *)self toolPicker];
    id v10 = [v9 selectedTool];
    v11 = [(PNPSqueezeController *)self canvasView];
    [v11 setTool:v10];

    [(PNPSqueezeController *)self setPencilLayerHiddenByInteraction:1];
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setAnimationDuration:0.25];
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x263F158F8];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __54__PNPSqueezeController_toolPickerVisibilityDidChange___block_invoke;
    v16 = &unk_264DA5B48;
    objc_copyWeak(&v17, &location);
    [v12 setCompletionBlock:&v13];
    objc_msgSend(MEMORY[0x263F158F8], "commit", v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __54__PNPSqueezeController_toolPickerVisibilityDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = [WeakRetained pencilLayer];
    [v2 setHidden:1];

    id v3 = [v5 pencilLayer];
    LODWORD(v4) = 1.0;
    [v3 setOpacity:v4];

    id WeakRetained = v5;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PNPSqueezeController;
  [(PNPSqueezeController *)&v14 viewWillAppear:a3];
  id v4 = objc_alloc_init(MEMORY[0x263F14AE0]);
  id v5 = [(PNPSqueezeController *)self canvasView];
  [v5 setDrawing:v4];

  v6 = [(PNPSqueezeController *)self view];
  v7 = [(PNPSqueezeController *)self pencilLayer];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [v6 bounds];
  double v9 = v8;
  double v11 = v10;
  objc_msgSend(v7, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  CGAffineTransformMakeScale(&v13, 0.5, 0.5);
  CGAffineTransform v12 = v13;
  [v7 setAffineTransform:&v12];
  objc_msgSend(v7, "setPosition:", v9 * 0.5, v11 * 0.5);
  [v7 setHidden:0];
  [MEMORY[0x263F158F8] commit];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PNPSqueezeController;
  [(OBBaseWelcomeController *)&v6 viewDidAppear:a3];
  id v4 = [(PNPSqueezeController *)self canvasView];
  [v4 setHidden:0];

  id v5 = [(PNPSqueezeController *)self canvasView];
  [v5 becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PNPSqueezeController;
  [(PNPSqueezeController *)&v11 viewWillDisappear:a3];
  id v4 = [(PNPSqueezeController *)self canvasView];
  [v4 resignFirstResponder];

  id v5 = (void *)MEMORY[0x263F14B98];
  objc_super v6 = [(PNPSqueezeController *)self view];
  v7 = [v6 window];
  double v8 = [v7 windowScene];
  double v9 = [v5 _existingInteractionForWindowScene:v8];

  double v10 = [(PNPSqueezeController *)self view];
  +[PNPPreDeclare squeezeInteraction:setMiniPaletteVisible:hoverLocation:inView:](PNPPreDeclare, "squeezeInteraction:setMiniPaletteVisible:hoverLocation:inView:", v9, 0, v10, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (void)loadSqueezeAnimationLayer
{
  id v5 = [(PNPSqueezeController *)self loadSqueezeAnimationPackage];
  id v3 = [v5 rootLayer];
  [(PNPSqueezeController *)self setPencilLayer:v3];

  id v4 = [(PNPSqueezeController *)self pencilLayer];
  [v4 setGeometryFlipped:1];
}

- (id)loadSqueezeAnimationPackage
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 URLForResource:@"welcomeSqueezePane-B532" withExtension:@"caar"];

  uint64_t v4 = *MEMORY[0x263F15EE0];
  id v9 = 0;
  id v5 = [MEMORY[0x263F15838] packageWithContentsOfURL:v3 type:v4 options:0 error:&v9];
  id v6 = v9;
  if (v6)
  {
    v7 = os_log_create("com.apple.pencilpairingui", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_2397CD000, v7, OS_LOG_TYPE_DEFAULT, "Error getting squeeze animation package: %@", buf, 0xCu);
    }
  }
  return v5;
}

- (CALayer)pencilLayer
{
  return self->_pencilLayer;
}

- (void)setPencilLayer:(id)a3
{
}

- (PKCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
}

- (PKToolPicker)toolPicker
{
  return self->_toolPicker;
}

- (void)setToolPicker:(id)a3
{
}

- (CGPoint)paletteHoverLocation
{
  double x = self->_paletteHoverLocation.x;
  double y = self->_paletteHoverLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPaletteHoverLocation:(CGPoint)a3
{
  self->_paletteHoverLocation = a3;
}

- (BOOL)pencilLayerHiddenByInteraction
{
  return self->_pencilLayerHiddenByInteraction;
}

- (void)setPencilLayerHiddenByInteraction:(BOOL)a3
{
  self->_pencilLayerHiddenByInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolPicker, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_pencilLayer, 0);
}

@end