@interface PUVolumeGlyphView
+ (id)classSubstitions;
- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4;
- (NSString)stateName;
- (PUVolumeGlyphView)initWithFrame:(CGRect)a3;
- (void)_handleGlyphLayerDidLoad:(id)a3;
- (void)layoutSubviews;
- (void)setStateName:(id)a3;
@end

@implementation PUVolumeGlyphView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateName, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_glyphLayer, 0);
}

- (NSString)stateName
{
  return self->_stateName;
}

- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4
{
  id v4 = a4;
  v5 = [(id)objc_opt_class() classSubstitions];
  v6 = [v5 objectForKeyedSubscript:v4];

  return (Class)v6;
}

- (void)setStateName:(id)a3
{
  v10 = (NSString *)a3;
  id v4 = self->_stateName;
  v5 = v10;
  if (v4 != v10)
  {
    char v6 = [(NSString *)v10 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    v7 = (NSString *)[(NSString *)v10 copy];
    stateName = self->_stateName;
    self->_stateName = v7;

    v5 = [(CALayer *)self->_glyphLayer stateWithName:v10];
    LODWORD(v9) = 1.0;
    [(CAStateController *)self->_stateController setState:v5 ofLayer:self->_glyphLayer transitionSpeed:v9];
  }

LABEL_5:
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUVolumeGlyphView;
  [(PUVolumeGlyphView *)&v3 layoutSubviews];
  [(PUVolumeGlyphView *)self bounds];
  UIRectGetCenter();
  -[CALayer setPosition:](self->_glyphLayer, "setPosition:");
}

- (void)_handleGlyphLayerDidLoad:(id)a3
{
  p_glyphLayer = &self->_glyphLayer;
  objc_storeStrong((id *)&self->_glyphLayer, a3);
  id v6 = a3;
  v7 = (CAStateController *)[objc_alloc(MEMORY[0x1E4F39CB0]) initWithLayer:v6];
  stateController = self->_stateController;
  self->_stateController = v7;

  double v9 = [(PUVolumeGlyphView *)self layer];
  [v9 addSublayer:v6];

  [(PUVolumeGlyphView *)self setNeedsLayout];
  id v11 = [(PUVolumeGlyphView *)self stateName];
  v10 = [(CALayer *)*p_glyphLayer stateWithName:v11];
  [(CAStateController *)self->_stateController setState:v10 ofLayer:*p_glyphLayer];
}

- (PUVolumeGlyphView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PUVolumeGlyphView;
  objc_super v3 = -[PUVolumeGlyphView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.PUVolumeGlyphView", 0);
    loadingQueue = v3->_loadingQueue;
    v3->_loadingQueue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v3);
    id v6 = v3->_loadingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__PUVolumeGlyphView_initWithFrame___block_invoke;
    block[3] = &unk_1E5F2E4E8;
    double v9 = v3;
    objc_copyWeak(&v10, &location);
    dispatch_async(v6, block);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  return v3;
}

void __35__PUVolumeGlyphView_initWithFrame___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F28B50], "pu_PhotosUIFrameworkBundle");
  objc_super v3 = [v2 URLForResource:@"VolumeGlyph" withExtension:@"caml"];

  dispatch_queue_t v4 = [MEMORY[0x1E4F39BF8] parser];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 432);
  *(void *)(v5 + 432) = @"mute";

  [v4 setDelegate:*(void *)(a1 + 32)];
  [v4 parseContentsOfURL:v3];
  v7 = [v4 result];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__PUVolumeGlyphView_initWithFrame___block_invoke_2;
  v9[3] = &unk_1E5F2E4E8;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v11);
}

void __35__PUVolumeGlyphView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleGlyphLayerDidLoad:*(void *)(a1 + 32)];
}

+ (id)classSubstitions
{
  if (classSubstitions_onceToken != -1) {
    dispatch_once(&classSubstitions_onceToken, &__block_literal_global_62885);
  }
  v2 = (void *)classSubstitions_substitutions;
  return v2;
}

void __37__PUVolumeGlyphView_classSubstitions__block_invoke()
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v2[0] = @"LKState";
  v3[0] = objc_opt_class();
  v2[1] = @"LKEventHandler";
  v3[1] = objc_opt_class();
  v2[2] = @"LKStateAddAnimation";
  v3[2] = objc_opt_class();
  v2[3] = @"LKStateAddElement";
  v3[3] = objc_opt_class();
  v2[4] = @"LKStateElement";
  v3[4] = objc_opt_class();
  v2[5] = @"LKStateRemoveAnimation";
  v3[5] = objc_opt_class();
  v2[6] = @"LKStateRemoveElement";
  v3[6] = objc_opt_class();
  v2[7] = @"LKStateSetValue";
  v3[7] = objc_opt_class();
  v2[8] = @"LKStateSetProperty";
  v3[8] = objc_opt_class();
  v2[9] = @"LKStateTransition";
  v3[9] = objc_opt_class();
  v2[10] = @"LKStateTransitionElement";
  v3[10] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:11];
  v1 = (void *)classSubstitions_substitutions;
  classSubstitions_substitutions = v0;
}

@end