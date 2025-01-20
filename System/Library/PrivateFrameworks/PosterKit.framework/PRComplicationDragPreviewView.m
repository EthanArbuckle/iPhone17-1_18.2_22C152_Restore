@interface PRComplicationDragPreviewView
- (PRComplicationDragPreviewView)initWithWidgetHostView:(id)a3;
@end

@implementation PRComplicationDragPreviewView

- (PRComplicationDragPreviewView)initWithWidgetHostView:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PRComplicationDragPreviewView;
  v5 = [(PRComplicationDragPreviewView *)&v28 init];
  if (v5)
  {
    v6 = PRFindLUTFilterView(v4);
    v7 = v6;
    if (v6)
    {
      v8 = [v6 layer];
      v9 = [v8 filters];

      v10 = [v7 layer];
      v11 = [v10 filters];
      v12 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_21];
      v13 = [v11 filteredArrayUsingPredicate:v12];

      v14 = [v7 layer];
      [v14 setFilters:v13];
    }
    else
    {
      v9 = 0;
    }
    [MEMORY[0x1E4F5E4A8] complicationEdgeInset];
    CGFloat v16 = v15;
    double v17 = v15 + v15;
    [v4 bounds];
    double v19 = v17 + v18;
    [v4 bounds];
    -[PRComplicationDragPreviewView setFrame:](v5, "setFrame:", 0.0, 0.0, v19, v17 + v20);
    [(PRComplicationDragPreviewView *)v5 bounds];
    CGRect v30 = CGRectInset(v29, v16, v16);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
    v22 = [MEMORY[0x1E4FB1618] blackColor];
    v23 = [v22 colorWithAlphaComponent:0.6];
    [v21 setBackgroundColor:v23];

    [v21 _setContinuousCornerRadius:PRWidgetPlatterCornerRadius()];
    [(PRComplicationDragPreviewView *)v5 addSubview:v21];
    if (v7) {
      [v4 snapshotViewAfterScreenUpdates:1];
    }
    else {
    v24 = [v4 snapshotView];
    }
    [(PRComplicationDragPreviewView *)v5 addSubview:v24];
    [(PRComplicationDragPreviewView *)v5 bounds];
    double MidX = CGRectGetMidX(v31);
    [(PRComplicationDragPreviewView *)v5 bounds];
    objc_msgSend(v24, "setCenter:", MidX, CGRectGetMidY(v32));
    if (v7 && v9)
    {
      v26 = [v7 layer];
      [v26 setFilters:v9];
    }
  }

  return v5;
}

uint64_t __56__PRComplicationDragPreviewView_initWithWidgetHostView___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  uint64_t v3 = [v2 isEqual:*MEMORY[0x1E4F3A278]] ^ 1;

  return v3;
}

@end