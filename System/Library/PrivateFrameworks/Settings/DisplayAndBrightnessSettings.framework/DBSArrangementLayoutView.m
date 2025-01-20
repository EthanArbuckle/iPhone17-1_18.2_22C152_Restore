@interface DBSArrangementLayoutView
- (CGSize)externalDisplaySize;
- (CGSize)nativeDisplaySize;
- (DBSArrangementLayoutView)initWithDataSource:(id)a3;
- (DBSArrangementLayoutViewController)dataSource;
- (DBSExternalDisplayIconView)externalDisplay;
- (DBSNativeDisplayIconView)eastDisplay;
- (DBSNativeDisplayIconView)northDisplay;
- (DBSNativeDisplayIconView)southDisplay;
- (DBSNativeDisplayIconView)westDisplay;
- (NSLayoutConstraint)nativeIconAspectRatioConstraint;
- (NSLayoutConstraint)widthRatioConstraint;
- (double)_pointDistanceFirst:(CGPoint)a3 second:(CGPoint)a4;
- (double)margin;
- (id)_placeHolderMainDisplayImageWithWidth:(double)a3 orientation:(int64_t)a4;
- (unint64_t)displayLocationForPointInView:(CGPoint)a3;
- (void)arrangeDisplayIcons;
- (void)placeCurrentDisplayAtLocation:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setEastDisplay:(id)a3;
- (void)setExternalDisplay:(id)a3;
- (void)setExternalDisplaySize:(CGSize)a3;
- (void)setMargin:(double)a3;
- (void)setNativeDisplaySize:(CGSize)a3;
- (void)setNativeIconAspectRatioConstraint:(id)a3;
- (void)setNorthDisplay:(id)a3;
- (void)setSouthDisplay:(id)a3;
- (void)setWestDisplay:(id)a3;
- (void)setWidthRatioConstraint:(id)a3;
- (void)updateForOrientation:(int64_t)a3;
- (void)updateNativeDisplayImagesWithOrientation:(int64_t)a3;
@end

@implementation DBSArrangementLayoutView

- (DBSArrangementLayoutView)initWithDataSource:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBSArrangementLayoutView;
  v5 = [(DBSArrangementLayoutView *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v6->_margin = 20.0;
    v7 = [MEMORY[0x263F825C8] tableCellGroupedBackgroundColor];
    [(DBSArrangementLayoutView *)v6 setBackgroundColor:v7];

    [(DBSArrangementLayoutView *)v6 arrangeDisplayIcons];
  }

  return v6;
}

- (void)placeCurrentDisplayAtLocation:(unint64_t)a3
{
  v22[4] = *MEMORY[0x263EF8340];
  v5 = [(DBSArrangementLayoutView *)self northDisplay];
  v22[0] = v5;
  v6 = [(DBSArrangementLayoutView *)self eastDisplay];
  v22[1] = v6;
  v7 = [(DBSArrangementLayoutView *)self southDisplay];
  v22[2] = v7;
  v8 = [(DBSArrangementLayoutView *)self westDisplay];
  v22[3] = v8;
  objc_super v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];

  switch(a3)
  {
    case 0uLL:
      uint64_t v10 = [(DBSArrangementLayoutView *)self northDisplay];
      goto LABEL_7;
    case 1uLL:
      uint64_t v10 = [(DBSArrangementLayoutView *)self eastDisplay];
      goto LABEL_7;
    case 2uLL:
      uint64_t v10 = [(DBSArrangementLayoutView *)self southDisplay];
      goto LABEL_7;
    case 3uLL:
      uint64_t v10 = [(DBSArrangementLayoutView *)self westDisplay];
LABEL_7:
      v11 = (void *)v10;
      break;
    default:
      v11 = 0;
      break;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16), "setIsCurrentDisplayLocation:", *(void *)(*((void *)&v17 + 1) + 8 * v16) == (void)v11, (void)v17);
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)arrangeDisplayIcons
{
  v3 = [(DBSArrangementLayoutView *)self dataSource];
  [v3 externalDisplaySize];
  double v5 = v4;
  double v7 = v6;

  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__0;
  v87 = __Block_byref_object_dispose__0;
  id v88 = 0;
  v8 = [MEMORY[0x263F82438] sharedApplication];
  objc_super v9 = [v8 connectedScenes];
  v82[0] = MEMORY[0x263EF8330];
  v82[1] = 3221225472;
  v82[2] = __47__DBSArrangementLayoutView_arrangeDisplayIcons__block_invoke;
  v82[3] = &unk_264C7A820;
  v82[4] = &v83;
  [v9 enumerateObjectsUsingBlock:v82];

  uint64_t v10 = [(DBSArrangementLayoutView *)self dataSource];
  [v10 nativeDisplaySize];
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = [DBSExternalDisplayIconView alloc];
  uint64_t v16 = [(DBSArrangementLayoutView *)self dataSource];
  long long v17 = [v16 externalDisplayName];
  long long v18 = -[DBSExternalDisplayIconView initWithFrame:displayName:](v15, "initWithFrame:displayName:", v17, 0.0, 0.0, v5, v7);

  long long v19 = [(DBSArrangementLayoutView *)self dataSource];
  uint64_t v20 = [v19 nativeDisplayName];

  v21 = -[DBSNativeDisplayIconView initWithFrame:displayName:]([DBSNativeDisplayIconView alloc], "initWithFrame:displayName:", v20, 0.0, 0.0, v12, v14);
  v22 = -[DBSNativeDisplayIconView initWithFrame:displayName:]([DBSNativeDisplayIconView alloc], "initWithFrame:displayName:", v20, 0.0, 0.0, v12, v14);
  v81 = (void *)v20;
  v23 = -[DBSNativeDisplayIconView initWithFrame:displayName:]([DBSNativeDisplayIconView alloc], "initWithFrame:displayName:", v20, 0.0, 0.0, v12, v14);
  v24 = -[DBSNativeDisplayIconView initWithFrame:displayName:]([DBSNativeDisplayIconView alloc], "initWithFrame:displayName:", v20, 0.0, 0.0, v12, v14);
  [(DBSExternalDisplayIconView *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(DBSArrangementLayoutView *)self addSubview:v18];
  [(DBSArrangementLayoutView *)self addSubview:v21];
  [(DBSArrangementLayoutView *)self addSubview:v22];
  [(DBSArrangementLayoutView *)self addSubview:v23];
  [(DBSArrangementLayoutView *)self addSubview:v24];
  v25 = NSNumber;
  [(DBSArrangementLayoutView *)self margin];
  v26 = objc_msgSend(v25, "numberWithDouble:");
  v27 = [(DBSExternalDisplayIconView *)v18 heightAnchor];
  v28 = [(DBSExternalDisplayIconView *)v18 widthAnchor];
  v29 = [v27 constraintEqualToAnchor:v28 multiplier:v7 / v5];
  [v29 setActive:1];

  v30 = [(DBSNativeDisplayIconView *)v22 heightAnchor];
  v31 = [(DBSNativeDisplayIconView *)v21 heightAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  v33 = [(DBSNativeDisplayIconView *)v23 heightAnchor];
  v34 = [(DBSNativeDisplayIconView *)v21 heightAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v35 setActive:1];

  v36 = [(DBSNativeDisplayIconView *)v24 heightAnchor];
  v37 = [(DBSNativeDisplayIconView *)v21 heightAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  [v38 setActive:1];

  v39 = [(DBSNativeDisplayIconView *)v22 widthAnchor];
  v40 = [(DBSNativeDisplayIconView *)v21 widthAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  [v41 setActive:1];

  v42 = [(DBSNativeDisplayIconView *)v23 widthAnchor];
  v43 = [(DBSNativeDisplayIconView *)v21 widthAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  [v44 setActive:1];

  v45 = [(DBSNativeDisplayIconView *)v24 widthAnchor];
  v46 = [(DBSNativeDisplayIconView *)v21 widthAnchor];
  v47 = [v45 constraintEqualToAnchor:v46];
  [v47 setActive:1];

  v48 = [(DBSExternalDisplayIconView *)v18 centerYAnchor];
  v49 = [(DBSArrangementLayoutView *)self centerYAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  [v50 setActive:1];

  v51 = [(DBSExternalDisplayIconView *)v18 centerYAnchor];
  v52 = [(DBSNativeDisplayIconView *)v21 centerYAnchor];
  v53 = [v51 constraintEqualToAnchor:v52];
  [v53 setActive:1];

  v54 = [(DBSExternalDisplayIconView *)v18 centerYAnchor];
  v55 = [(DBSNativeDisplayIconView *)v22 centerYAnchor];
  v56 = [v54 constraintEqualToAnchor:v55];
  [v56 setActive:1];

  v57 = [(DBSExternalDisplayIconView *)v18 centerXAnchor];
  v58 = [(DBSArrangementLayoutView *)self centerXAnchor];
  v59 = [v57 constraintEqualToAnchor:v58];
  [v59 setActive:1];

  v60 = [(DBSExternalDisplayIconView *)v18 centerXAnchor];
  v61 = [(DBSNativeDisplayIconView *)v23 centerXAnchor];
  v62 = [v60 constraintEqualToAnchor:v61];
  [v62 setActive:1];

  v63 = [(DBSExternalDisplayIconView *)v18 centerXAnchor];
  v64 = [(DBSNativeDisplayIconView *)v24 centerXAnchor];
  v65 = [v63 constraintEqualToAnchor:v64];
  [v65 setActive:1];

  v66 = (void *)MEMORY[0x263F08938];
  id firstValue = v26;
  v67 = _NSDictionaryOfVariableBindings(&cfstr_Margin.isa, v26, 0);
  v68 = _NSDictionaryOfVariableBindings(&cfstr_Nativeiconwest.isa, v21, v18, v22, 0);
  v80 = [v66 constraintsWithVisualFormat:@"H:|-margin@900-[nativeIconWest][externalIcon][nativeIconEast]-margin@900-|" options:0 metrics:v67 views:v68];

  [MEMORY[0x263F08938] activateConstraints:v80];
  v69 = [(DBSNativeDisplayIconView *)v21 leadingAnchor];
  v70 = [(DBSArrangementLayoutView *)self leadingAnchor];
  [(DBSArrangementLayoutView *)self margin];
  v71 = objc_msgSend(v69, "constraintGreaterThanOrEqualToAnchor:constant:", v70);
  [v71 setActive:1];

  v72 = (void *)MEMORY[0x263F08938];
  v73 = _NSDictionaryOfVariableBindings(&cfstr_Margin.isa, firstValue, 0);
  v74 = _NSDictionaryOfVariableBindings(&cfstr_Nativeiconnort.isa, v23, v18, v24, 0);
  v75 = [v72 constraintsWithVisualFormat:@"V:|-margin@900-[nativeIconNorth][externalIcon][nativeIconSouth]-margin@900-|" options:0 metrics:v73 views:v74];

  [MEMORY[0x263F08938] activateConstraints:v75];
  v76 = [(DBSNativeDisplayIconView *)v23 topAnchor];
  v77 = [(DBSArrangementLayoutView *)self topAnchor];
  [(DBSArrangementLayoutView *)self margin];
  v78 = objc_msgSend(v76, "constraintGreaterThanOrEqualToAnchor:constant:", v77);
  [v78 setActive:1];

  [(DBSArrangementLayoutView *)self setExternalDisplay:v18];
  [(DBSArrangementLayoutView *)self setNorthDisplay:v23];
  [(DBSArrangementLayoutView *)self setEastDisplay:v22];
  [(DBSArrangementLayoutView *)self setWestDisplay:v21];
  [(DBSArrangementLayoutView *)self setSouthDisplay:v24];
  -[DBSArrangementLayoutView updateForOrientation:](self, "updateForOrientation:", [(id)v84[5] interfaceOrientation]);

  _Block_object_dispose(&v83, 8);
}

void __47__DBSArrangementLayoutView_arrangeDisplayIcons__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v8 activationState])
  {
    double v6 = [v8 _sceneIdentifier];
    int v7 = [v6 isEqualToString:@"sceneID:com.apple.Preferences-default"];

    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a3 = 1;
    }
  }
}

- (void)updateForOrientation:(int64_t)a3
{
  double v5 = [(DBSArrangementLayoutView *)self dataSource];
  [v5 externalDisplaySize];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(DBSArrangementLayoutView *)self dataSource];
  [v10 nativeDisplaySize];
  double v12 = v11;
  double v14 = v13;

  -[DBSArrangementLayoutView setExternalDisplaySize:](self, "setExternalDisplaySize:", v7, v9);
  -[DBSArrangementLayoutView setNativeDisplaySize:](self, "setNativeDisplaySize:", v12, v14);
  uint64_t v15 = [(DBSArrangementLayoutView *)self widthRatioConstraint];
  [v15 setActive:0];

  uint64_t v16 = (void *)MEMORY[0x263F08938];
  long long v17 = [(DBSArrangementLayoutView *)self externalDisplay];
  long long v18 = [(DBSArrangementLayoutView *)self westDisplay];
  long long v19 = [v16 constraintWithItem:v17 attribute:7 relatedBy:0 toItem:v18 attribute:7 multiplier:v7 / v12 constant:0.0];
  [(DBSArrangementLayoutView *)self setWidthRatioConstraint:v19];

  uint64_t v20 = [(DBSArrangementLayoutView *)self widthRatioConstraint];
  [v20 setActive:1];

  v21 = [(DBSArrangementLayoutView *)self nativeIconAspectRatioConstraint];
  [v21 setActive:0];

  v22 = [(DBSArrangementLayoutView *)self westDisplay];
  v23 = [v22 heightAnchor];
  v24 = [(DBSArrangementLayoutView *)self westDisplay];
  v25 = [v24 widthAnchor];
  v26 = [v23 constraintEqualToAnchor:v25 multiplier:v14 / v12];
  [(DBSArrangementLayoutView *)self setNativeIconAspectRatioConstraint:v26];

  v27 = [(DBSArrangementLayoutView *)self nativeIconAspectRatioConstraint];
  [v27 setActive:1];

  [(DBSArrangementLayoutView *)self updateNativeDisplayImagesWithOrientation:a3];
}

- (id)_placeHolderMainDisplayImageWithWidth:(double)a3 orientation:(int64_t)a4
{
  if ((unint64_t)(a4 - 3) > 1) {
    double v5 = @"ipad";
  }
  else {
    double v5 = @"ipad.landscape";
  }
  double v6 = [MEMORY[0x263F827E8] systemImageNamed:v5 compatibleWithTraitCollection:0];
  double v7 = [MEMORY[0x263F82818] configurationWithPointSize:2 weight:a3];
  double v8 = [v6 imageWithSymbolConfiguration:v7];

  return v8;
}

- (void)updateNativeDisplayImagesWithOrientation:(int64_t)a3
{
  [(DBSArrangementLayoutView *)self nativeDisplaySize];
  double v6 = v5;
  double v8 = v7;
  [(DBSArrangementLayoutView *)self externalDisplaySize];
  double v10 = v9;
  double v12 = v11;
  [(DBSArrangementLayoutView *)self frame];
  if (v13 == 0.0) {
    double v15 = 364.0;
  }
  else {
    double v15 = v14;
  }
  if (v13 == 0.0) {
    double v16 = 560.0;
  }
  else {
    double v16 = v13;
  }
  [(DBSArrangementLayoutView *)self margin];
  double v18 = fmax(v16 + v17 * -2.0, 0.0) / (v10 + v6 * 2.0);
  [(DBSArrangementLayoutView *)self margin];
  double v20 = fmax(v15 + v19 * -2.0, 0.0) / (v12 + v8 * 2.0);
  if (v18 >= v20) {
    double v18 = v20;
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __69__DBSArrangementLayoutView_updateNativeDisplayImagesWithOrientation___block_invoke;
  v32[3] = &unk_264C7A968;
  v32[4] = self;
  v21 = (void (**)(void, void))MEMORY[0x237DF4780](v32);
  if (v18 > 0.0)
  {
    v22 = [(DBSArrangementLayoutView *)self northDisplay];
    v23 = [v22 imageView];
    v24 = [v23 image];

    if (!v24)
    {
      v25 = [(DBSArrangementLayoutView *)self _placeHolderMainDisplayImageWithWidth:a3 orientation:v6 * v18];
      ((void (**)(void, void *))v21)[2](v21, v25);
    }
    v26 = dispatch_get_global_queue(0, 0);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __69__DBSArrangementLayoutView_updateNativeDisplayImagesWithOrientation___block_invoke_2;
    v27[3] = &unk_264C7A9B8;
    v27[4] = self;
    double v29 = v18;
    double v30 = v6;
    double v31 = v8;
    v28 = v21;
    dispatch_async(v26, v27);
  }
}

void __69__DBSArrangementLayoutView_updateNativeDisplayImagesWithOrientation___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 northDisplay];
  double v6 = [v5 imageView];
  [v6 setImage:v4];

  double v7 = [*(id *)(a1 + 32) eastDisplay];
  double v8 = [v7 imageView];
  [v8 setImage:v4];

  double v9 = [*(id *)(a1 + 32) southDisplay];
  double v10 = [v9 imageView];
  [v10 setImage:v4];

  id v12 = [*(id *)(a1 + 32) westDisplay];
  double v11 = [v12 imageView];
  [v11 setImage:v4];
}

void __69__DBSArrangementLayoutView_updateNativeDisplayImagesWithOrientation___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSource];
  v3 = [v2 nativeDisplayImageWithWidth:*(double *)(a1 + 48) * *(double *)(a1 + 56)];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__DBSArrangementLayoutView_updateNativeDisplayImagesWithOrientation___block_invoke_3;
  block[3] = &unk_264C7A990;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v10 = v4;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __69__DBSArrangementLayoutView_updateNativeDisplayImagesWithOrientation___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = [*(id *)(a1 + 40) northDisplay];
  [v2 setNeedsLayout];

  v3 = [*(id *)(a1 + 40) eastDisplay];
  [v3 setNeedsLayout];

  id v4 = [*(id *)(a1 + 40) southDisplay];
  [v4 setNeedsLayout];

  id v5 = [*(id *)(a1 + 40) westDisplay];
  [v5 setNeedsLayout];
}

- (double)_pointDistanceFirst:(CGPoint)a3 second:(CGPoint)a4
{
  return sqrt((a3.y - a4.y) * (a3.y - a4.y) + (a3.x - a4.x) * (a3.x - a4.x));
}

- (unint64_t)displayLocationForPointInView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v51[4] = *MEMORY[0x263EF8340];
  id v6 = [(DBSArrangementLayoutView *)self northDisplay];
  [v6 frame];
  double MidX = CGRectGetMidX(v52);
  id v8 = [(DBSArrangementLayoutView *)self northDisplay];
  [v8 frame];
  double MidY = CGRectGetMidY(v53);

  uint64_t v9 = [(DBSArrangementLayoutView *)self eastDisplay];
  [v9 frame];
  double v44 = CGRectGetMidX(v54);
  id v10 = [(DBSArrangementLayoutView *)self eastDisplay];
  [v10 frame];
  double v11 = CGRectGetMidY(v55);

  id v12 = [(DBSArrangementLayoutView *)self southDisplay];
  [v12 frame];
  double v13 = CGRectGetMidX(v56);
  double v14 = [(DBSArrangementLayoutView *)self southDisplay];
  [v14 frame];
  double v15 = CGRectGetMidY(v57);

  double v16 = [(DBSArrangementLayoutView *)self westDisplay];
  [v16 frame];
  double v17 = CGRectGetMidX(v58);
  double v18 = [(DBSArrangementLayoutView *)self westDisplay];
  [v18 frame];
  double v19 = CGRectGetMidY(v59);

  -[DBSArrangementLayoutView _pointDistanceFirst:second:](self, "_pointDistanceFirst:second:", x, y, MidX, MidY);
  double v21 = v20;
  -[DBSArrangementLayoutView _pointDistanceFirst:second:](self, "_pointDistanceFirst:second:", x, y, v44, v11);
  double v23 = v22;
  -[DBSArrangementLayoutView _pointDistanceFirst:second:](self, "_pointDistanceFirst:second:", x, y, v13, v15);
  double v25 = v24;
  -[DBSArrangementLayoutView _pointDistanceFirst:second:](self, "_pointDistanceFirst:second:", x, y, v17, v19);
  double v27 = v26;
  v28 = [NSNumber numberWithDouble:v21];
  v51[0] = v28;
  double v29 = [NSNumber numberWithDouble:v23];
  v51[1] = v29;
  double v30 = [NSNumber numberWithDouble:v25];
  v51[2] = v30;
  double v31 = [NSNumber numberWithDouble:v27];
  v51[3] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:4];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v33 = v32;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    unint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = *(void *)v47;
    double v39 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v47 != v38) {
          objc_enumerationMutation(v33);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * i) floatValue];
        double v42 = v41;
        if (v39 > v42)
        {
          unint64_t v36 = v37 + i;
          double v39 = v42;
        }
      }
      v37 += v35;
      uint64_t v35 = [v33 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v35);
  }
  else
  {
    unint64_t v36 = 0;
  }

  return v36;
}

- (DBSArrangementLayoutViewController)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DBSArrangementLayoutViewController *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (CGSize)externalDisplaySize
{
  double width = self->_externalDisplaySize.width;
  double height = self->_externalDisplaySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setExternalDisplaySize:(CGSize)a3
{
  self->_externalDisplaySize = a3;
}

- (CGSize)nativeDisplaySize
{
  double width = self->_nativeDisplaySize.width;
  double height = self->_nativeDisplaySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNativeDisplaySize:(CGSize)a3
{
  self->_nativeDisplaySize = a3;
}

- (double)margin
{
  return self->_margin;
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
}

- (DBSExternalDisplayIconView)externalDisplay
{
  return self->_externalDisplay;
}

- (void)setExternalDisplay:(id)a3
{
}

- (DBSNativeDisplayIconView)northDisplay
{
  return self->_northDisplay;
}

- (void)setNorthDisplay:(id)a3
{
}

- (DBSNativeDisplayIconView)eastDisplay
{
  return self->_eastDisplay;
}

- (void)setEastDisplay:(id)a3
{
}

- (DBSNativeDisplayIconView)southDisplay
{
  return self->_southDisplay;
}

- (void)setSouthDisplay:(id)a3
{
}

- (DBSNativeDisplayIconView)westDisplay
{
  return self->_westDisplay;
}

- (void)setWestDisplay:(id)a3
{
}

- (NSLayoutConstraint)nativeIconAspectRatioConstraint
{
  return self->_nativeIconAspectRatioConstraint;
}

- (void)setNativeIconAspectRatioConstraint:(id)a3
{
}

- (NSLayoutConstraint)widthRatioConstraint
{
  return self->_widthRatioConstraint;
}

- (void)setWidthRatioConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthRatioConstraint, 0);
  objc_storeStrong((id *)&self->_nativeIconAspectRatioConstraint, 0);
  objc_storeStrong((id *)&self->_westDisplay, 0);
  objc_storeStrong((id *)&self->_southDisplay, 0);
  objc_storeStrong((id *)&self->_eastDisplay, 0);
  objc_storeStrong((id *)&self->_northDisplay, 0);
  objc_storeStrong((id *)&self->_externalDisplay, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end