@interface TUIProactiveCandidateCell
+ (id)reuseIdentifier;
- (TIKeyboardCandidate)candidate;
- (TUIProactiveCandidateCell)initWithCoder:(id)a3;
- (TUIProactiveCandidateCell)initWithFrame:(CGRect)a3;
- (UIView)slotContentView;
- (void)commonInit;
- (void)layoutSubviews;
- (void)setCandidate:(id)a3;
- (void)setSlotContentView:(id)a3;
- (void)updateSlotContentView;
@end

@implementation TUIProactiveCandidateCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotContentView, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

- (void)setSlotContentView:(id)a3
{
}

- (UIView)slotContentView
{
  return self->_slotContentView;
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (void)updateSlotContentView
{
  id v40 = [(TUIProactiveCandidateCell *)self candidate];
  if (![v40 slotID])
  {
    v3 = [(TUIProactiveCandidateCell *)self slotContentView];
    v37 = [v3 layer];
    [v37 setContents:0];
    goto LABEL_14;
  }
  v3 = objc_msgSend(MEMORY[0x1E4F39B58], "objectForSlot:", objc_msgSend(v40, "slotID"));
  [(TUIProactiveCandidateCell *)self bounds];
  double x = v4;
  double y = v6;
  double width = v8;
  double height = v10;
  if ([v40 isStickerCandidate])
  {
    v12 = [(TUICandidateBaseCell *)self style];
    [v12 minimumCellPadding];
    CGFloat v14 = v13 * 0.5;
    v15 = [(TUICandidateBaseCell *)self style];
    [v15 minimumCellPadding];
    CGFloat v17 = v16 * 0.5;
    v42.origin.double x = x;
    v42.origin.double y = y;
    v42.size.double width = width;
    v42.size.double height = height;
    CGRect v43 = CGRectInset(v42, v14, v17);
    double x = v43.origin.x;
    double y = v43.origin.y;
    double width = v43.size.width;
    double height = v43.size.height;
  }
  v18 = [(TUICandidateBaseCell *)self style];
  [v18 extraCellPadding];
  double v20 = y + v19 * 0.5;

  v21 = [(TUIProactiveCandidateCell *)self slotContentView];
  objc_msgSend(v21, "setFrame:", x, v20, width, height);

  v22 = [(TUIProactiveCandidateCell *)self slotContentView];
  v23 = [v22 layer];
  [v23 setContents:v3];

  double v24 = TUIScreenScaleForView(self);
  v25 = [(TUIProactiveCandidateCell *)self slotContentView];
  v26 = [v25 layer];
  [v26 setContentsScale:v24];

  double v27 = TUIScreenScaleForView(self);
  v28 = [(TUIProactiveCandidateCell *)self slotContentView];
  v29 = [v28 layer];
  [v29 setRasterizationScale:v27];

  v30 = [(TUICandidateBaseCell *)self style];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_9;
  }
  v31 = [(TUICandidateBaseCell *)self style];
  v32 = [v31 proactiveCandidateContentsGravity];

  if (!v32)
  {
LABEL_9:
    if ([v40 isStickerCandidate]) {
      v38 = (uint64_t *)MEMORY[0x1E4F3A3D8];
    }
    else {
      v38 = (uint64_t *)MEMORY[0x1E4F3A3D0];
    }
    uint64_t v39 = *v38;
    v33 = [(TUIProactiveCandidateCell *)self slotContentView];
    v34 = [v33 layer];
    [v34 setContentsGravity:v39];
    goto LABEL_13;
  }
  v33 = [(TUICandidateBaseCell *)self style];
  v34 = [v33 proactiveCandidateContentsGravity];
  v35 = [(TUIProactiveCandidateCell *)self slotContentView];
  v36 = [v35 layer];
  [v36 setContentsGravity:v34];

LABEL_13:
  v37 = [(TUIProactiveCandidateCell *)self slotContentView];
  [v37 setAutoresizingMask:18];
LABEL_14:
}

- (void)setCandidate:(id)a3
{
  id v5 = a3;
  uint64_t candidate = (uint64_t)self->_candidate;
  if ((id)candidate != v5)
  {
    id v7 = v5;
    uint64_t candidate = [(id)candidate isEqual:v5];
    id v5 = v7;
    if ((candidate & 1) == 0)
    {
      objc_storeStrong((id *)&self->_candidate, a3);
      uint64_t candidate = [(TUIProactiveCandidateCell *)self updateSlotContentView];
      id v5 = v7;
    }
  }
  MEMORY[0x1F41817F8](candidate, v5);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUIProactiveCandidateCell;
  [(TUICandidateBaseCell *)&v3 layoutSubviews];
  [(TUIProactiveCandidateCell *)self updateSlotContentView];
}

- (TUIProactiveCandidateCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUIProactiveCandidateCell;
  objc_super v3 = [(TUIProactiveCandidateCell *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(TUIProactiveCandidateCell *)v3 commonInit];
  }
  return v4;
}

- (TUIProactiveCandidateCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUIProactiveCandidateCell;
  objc_super v3 = -[TUICandidateBaseCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(TUIProactiveCandidateCell *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(TUIProactiveCandidateCell *)self setSlotContentView:v3];

  id v5 = [(TUIProactiveCandidateCell *)self contentView];
  double v4 = [(TUIProactiveCandidateCell *)self slotContentView];
  [v5 addSubview:v4];
}

+ (id)reuseIdentifier
{
  return @"TUIProactiveCandidateCell";
}

@end