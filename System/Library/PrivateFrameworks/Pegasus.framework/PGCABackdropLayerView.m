@interface PGCABackdropLayerView
+ (Class)layerClass;
+ (id)materialFilters;
+ (id)reducedTransparencyColor;
- (BOOL)_hasAnyDependentsThatWantsCapturedBlur;
- (BOOL)_isCaptureOnly;
- (BOOL)_isTransparentOrHasTransparentAncestor;
- (BOOL)_wantsCapturedBlur;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (NSHashTable)dependents;
- (PGCABackdropLayerView)groupLeader;
- (PGCABackdropLayerView)initWithCoder:(id)a3;
- (PGCABackdropLayerView)initWithFrame:(CGRect)a3;
- (PGCABackdropLayerView)initWithFrame:(CGRect)a3 captureOnly:(BOOL)a4;
- (UIColor)customBackgroundColor;
- (id)_preferredBackgroundColor;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)_preferredEffect;
- (void)_addDependent:(id)a3;
- (void)_ensureDependents;
- (void)_enumerateDependents:(id)a3;
- (void)_removeDependent:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)setCustomBackgroundColor:(id)a3;
- (void)setGroupLeader:(id)a3;
- (void)updateEffects;
@end

@implementation PGCABackdropLayerView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (id)materialFilters
{
  if (materialFilters_onceToken != -1) {
    dispatch_once(&materialFilters_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)materialFilters_materialFilters;

  return v2;
}

void __40__PGCABackdropLayerView_materialFilters__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v0 setValue:&unk_1F0E5D7C0 forKey:@"inputRadius"];
  [v0 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
  [v0 setValue:@"low" forKey:@"inputQuality"];
  [v0 setValue:@"low" forKey:@"inputIntermediateBitDepth"];
  v1 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
  CAColorMatrixMakeSaturation();
  CAColorMatrixMakeColorSourceOver();
  CAColorMatrixMakeColorSourceOver();
  memset(&v5[10], 0, 320);
  CAColorMatrixConcat();
  CAColorMatrixConcat();
  memset(v5, 0, 80);
  v2 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCAColorMatrix:", v5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  [v1 setValue:v2 forKey:@"inputColorMatrix"];

  v6[0] = v0;
  v6[1] = v1;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = (void *)materialFilters_materialFilters;
  materialFilters_materialFilters = v3;
}

+ (id)reducedTransparencyColor
{
  if (reducedTransparencyColor_onceToken != -1) {
    dispatch_once(&reducedTransparencyColor_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)reducedTransparencyColor_reducedTransparencyColor;

  return v2;
}

uint64_t __49__PGCABackdropLayerView_reducedTransparencyColor__block_invoke()
{
  reducedTransparencyColor_reducedTransparencyColor = [MEMORY[0x1E4F428B8] colorWithRed:0.168627451 green:0.180392157 blue:0.188235294 alpha:1.0];

  return MEMORY[0x1F41817F8]();
}

- (PGCABackdropLayerView)initWithCoder:(id)a3
{
  return -[PGCABackdropLayerView initWithFrame:captureOnly:](self, "initWithFrame:captureOnly:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PGCABackdropLayerView)initWithFrame:(CGRect)a3
{
  return -[PGCABackdropLayerView initWithFrame:captureOnly:](self, "initWithFrame:captureOnly:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PGCABackdropLayerView)initWithFrame:(CGRect)a3 captureOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGCABackdropLayerView;
  v5 = -[PGCABackdropLayerView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = [(PGCABackdropLayerView *)v5 layer];
      [v7 setCaptureOnly:1];

      v8 = [(PGCABackdropLayerView *)v6 layer];
      v9 = [MEMORY[0x1E4F29128] UUID];
      v10 = [v9 UUIDString];
      [v8 setGroupName:v10];
    }
    [(PGCABackdropLayerView *)v6 setUserInteractionEnabled:0];
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel_updateEffects name:*MEMORY[0x1E4F43480] object:0];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43480] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PGCABackdropLayerView;
  [(PGCABackdropLayerView *)&v4 dealloc];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PGCABackdropLayerView;
  [(PGCABackdropLayerView *)&v3 didMoveToWindow];
  [(PGCABackdropLayerView *)self updateEffects];
}

- (void)setCustomBackgroundColor:(id)a3
{
  v6 = (UIColor *)a3;
  if (([(UIColor *)self->_customBackgroundColor isEqual:v6] & 1) == 0
    && self->_customBackgroundColor != v6)
  {
    objc_super v4 = (UIColor *)[(UIColor *)v6 copy];
    customBackgroundColor = self->_customBackgroundColor;
    self->_customBackgroundColor = v4;

    [(PGCABackdropLayerView *)self updateEffects];
  }

  MEMORY[0x1F41817F8]();
}

- (void)updateEffects
{
  int64_t v3 = [(PGCABackdropLayerView *)self _preferredEffect];
  uint64_t v4 = [(PGCABackdropLayerView *)self _preferredBackgroundColor];
  if (v3 == 1) {
    double v5 = 0.25;
  }
  else {
    double v5 = 0.0;
  }
  id v27 = (id)v4;
  if (v3 == 1)
  {
    v6 = +[PGCABackdropLayerView materialFilters];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if ([(PGCABackdropLayerView *)self _isCaptureOnly])
  {
    v7 = [(PGCABackdropLayerView *)self layer];
    -[PGCABackdropLayerView setHidden:](self, "setHidden:", [v7 isEnabled] ^ 1);
  }
  else
  {
    v8 = [(UIView *)self PG_backdropGroupLeader];
    [(PGCABackdropLayerView *)self setGroupLeader:v8];

    if (v3 == 1)
    {
      v9 = [(PGCABackdropLayerView *)self groupLeader];
      v10 = [v9 layer];
      v7 = [v10 groupName];
    }
    else
    {
      v7 = 0;
    }
    v11 = [(PGCABackdropLayerView *)self layer];
    v12 = [v11 groupName];

    if (v7 != v12 && ([v7 isEqualToString:v12] & 1) == 0)
    {
      objc_super v13 = [(PGCABackdropLayerView *)self layer];
      [v13 setGroupName:v7];
    }
  }

  v14 = [(PGCABackdropLayerView *)self layer];
  [v14 scale];
  double v16 = v15;

  if (v16 != v5)
  {
    v17 = [(PGCABackdropLayerView *)self layer];
    [v17 setScale:v5];
  }
  v18 = [(PGCABackdropLayerView *)self layer];
  v19 = [v18 filters];
  char v20 = [v19 isEqualToArray:v6];

  if ((v20 & 1) == 0)
  {
    v21 = [(PGCABackdropLayerView *)self layer];
    [v21 setFilters:v6];
  }
  v22 = [(PGCABackdropLayerView *)self layer];
  int v23 = [v22 isEnabled];

  if ((v3 == 1) != v23)
  {
    v24 = [(PGCABackdropLayerView *)self layer];
    [v24 setEnabled:v3 == 1];
  }
  v25 = [(PGCABackdropLayerView *)self backgroundColor];
  if ([v27 isEqual:v25])
  {
  }
  else
  {
    id v26 = [(PGCABackdropLayerView *)self backgroundColor];

    if (v27 != v26) {
      [(PGCABackdropLayerView *)self setBackgroundColor:v27];
    }
  }
}

- (int64_t)_preferredEffect
{
  if ([(PGCABackdropLayerView *)self _isCaptureOnly]) {
    return [(PGCABackdropLayerView *)self _hasAnyDependentsThatWantsCapturedBlur];
  }
  uint64_t v4 = [(PGCABackdropLayerView *)self customBackgroundColor];

  if (v4) {
    return 0;
  }
  if (UIAccessibilityIsReduceTransparencyEnabled()) {
    return 2;
  }
  return 1;
}

- (id)_preferredBackgroundColor
{
  if ([(PGCABackdropLayerView *)self _isCaptureOnly])
  {
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_7;
  }
  int64_t v3 = [(PGCABackdropLayerView *)self _preferredEffect];
  if (v3 != 2)
  {
    if (!v3)
    {
      uint64_t v4 = [(PGCABackdropLayerView *)self customBackgroundColor];
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  uint64_t v4 = [(id)objc_opt_class() reducedTransparencyColor];
LABEL_7:

  return v4;
}

- (BOOL)_wantsCapturedBlur
{
  if ([(PGCABackdropLayerView *)self _preferredEffect] != 1) {
    return 0;
  }

  return [(UIView *)self PG_preferredVisibilityForView:self];
}

- (BOOL)_isCaptureOnly
{
  v2 = [(PGCABackdropLayerView *)self layer];
  char v3 = [v2 captureOnly];

  return v3;
}

- (void)setGroupLeader:(id)a3
{
  obj = (PGCABackdropLayerView *)a3;
  BOOL v5 = [(PGCABackdropLayerView *)obj _isCaptureOnly];
  v6 = obj;
  if (obj && !v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PGCABackdropLayerView.m", 210, @"Invalid parameter not satisfying: %@", @"[groupLeader _isCaptureOnly] || groupLeader == nil" object file lineNumber description];

    v6 = obj;
  }
  if (v6 == self)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, obj, @"PGCABackdropLayerView.m", 211, @"Invalid parameter not satisfying: %@", @"groupLeader != self" object file lineNumber description];
  }
  WeakRetained = (PGCABackdropLayerView *)objc_loadWeakRetained((id *)&self->_groupLeader);

  v8 = obj;
  if (WeakRetained != obj)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_groupLeader);
    [v9 _removeDependent:self];

    id v10 = objc_storeWeak((id *)&self->_groupLeader, obj);
    [(PGCABackdropLayerView *)obj _addDependent:self];

    v8 = obj;
  }
}

- (BOOL)_hasAnyDependentsThatWantsCapturedBlur
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__PGCABackdropLayerView__hasAnyDependentsThatWantsCapturedBlur__block_invoke;
  v4[3] = &unk_1E610C708;
  v4[4] = &v5;
  [(PGCABackdropLayerView *)self _enumerateDependents:v4];
  BOOL v2 = v6[3] > 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __63__PGCABackdropLayerView__hasAnyDependentsThatWantsCapturedBlur__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _wantsCapturedBlur];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

- (void)_addDependent:(id)a3
{
  id v4 = a3;
  [(PGCABackdropLayerView *)self _ensureDependents];
  [(NSHashTable *)self->_dependents addObject:v4];
}

- (void)_removeDependent:(id)a3
{
  [(NSHashTable *)self->_dependents removeObject:a3];

  [(PGCABackdropLayerView *)self updateEffects];
}

- (void)_ensureDependents
{
  if (!self->_dependents)
  {
    self->_dependents = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    MEMORY[0x1F41817F8]();
  }
}

- (void)_enumerateDependents:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = (void *)[(NSHashTable *)self->_dependents copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)_isTransparentOrHasTransparentAncestor
{
  [(PGCABackdropLayerView *)self alpha];
  double v4 = v3;
  uint64_t v5 = [(PGCABackdropLayerView *)self superview];
  while (v5)
  {
    if (v4 <= 0.0) {
      break;
    }
    id v6 = v5;
    [v5 alpha];
    if (v4 >= v7) {
      double v4 = v7;
    }
    uint64_t v5 = [v5 superview];
  }
  return v4 == 0.0;
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (PGCABackdropLayerView)groupLeader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupLeader);

  return (PGCABackdropLayerView *)WeakRetained;
}

- (NSHashTable)dependents
{
  return self->_dependents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependents, 0);
  objc_destroyWeak((id *)&self->_groupLeader);

  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
}

@end