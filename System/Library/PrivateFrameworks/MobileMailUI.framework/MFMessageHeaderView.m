@interface MFMessageHeaderView
+ (id)log;
- (BOOL)bottomSeparatorDrawsFlushWithLeadingEdge;
- (CGRect)draggableArea;
- (ConversationSearchOverlayView)findOverlayView;
- (MFMessageDisplayMetrics)displayMetrics;
- (MFMessageHeaderView)initWithFrame:(CGRect)a3;
- (MFMessageHeaderViewBlock)pinnedBlock;
- (MFMessageHeaderViewDelegate)delegate;
- (MessageHeaderViewModel)viewModel;
- (NSArray)headerBlocks;
- (id)_animationConstraintsForBlockAtIndex:(unint64_t)a3;
- (int64_t)_pinnedBlockIndex;
- (void)_layoutAnimatedWithCompletion:(id)a3;
- (void)_updateSeparators;
- (void)addConversationSearchOverlay;
- (void)addHeaderBlock:(id)a3 animated:(BOOL)a4;
- (void)displayMessageUsingViewModel:(id)a3;
- (void)drawRect:(CGRect)a3 forViewPrintFormatter:(id)a4;
- (void)insertHeaderBlock:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)insertHeaderBlock:(id)a3 before:(id)a4 animated:(BOOL)a5;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)removeAllHeaderBlocksAnimated:(BOOL)a3;
- (void)removeConversationSearchOverlay;
- (void)removeHeaderBlock:(id)a3 animated:(BOOL)a4;
- (void)setBottomSeparatorDrawsFlushWithLeadingEdge:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setDraggableArea:(CGRect)a3;
- (void)setFindOverlayView:(id)a3;
- (void)setHeaderBlocks:(id)a3;
- (void)setHeaderBlocks:(id)a3 animated:(BOOL)a4;
- (void)setMessageFlags:(unint64_t)a3 conversationFlags:(unint64_t)a4;
- (void)setPinnedBlock:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation MFMessageHeaderView

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__MFMessageHeaderView_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1) {
    dispatch_once(&log_onceToken_6, block);
  }
  v2 = (void *)log_log_6;
  return v2;
}

void __26__MFMessageHeaderView_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;
}

- (MFMessageHeaderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MFMessageHeaderView;
  id v3 = -[MFMessageHeaderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(MFMessageHeaderView *)v3 setBackgroundColor:v4];

    [(MFMessageHeaderView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFMessageHeaderView *)v3 setPreservesSuperviewLayoutMargins:1];
    [(MFMessageHeaderView *)v3 setInsetsLayoutMarginsFromSafeArea:0];
    [(MFMessageHeaderView *)v3 setDistribution:0];
    [(MFMessageHeaderView *)v3 setAxis:1];
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    headerBlocks = v3->_headerBlocks;
    v3->_headerBlocks = v5;

    CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v3->_draggableArea.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v3->_draggableArea.size = v7;
  }
  return v3;
}

- (ConversationSearchOverlayView)findOverlayView
{
  findOverlayView = self->_findOverlayView;
  if (!findOverlayView)
  {
    v4 = [ConversationSearchOverlayView alloc];
    [(MFMessageHeaderView *)self bounds];
    v5 = -[ConversationSearchOverlayView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_findOverlayView;
    self->_findOverlayView = v5;

    [(MFMessageHeaderView *)self addSubview:self->_findOverlayView];
    findOverlayView = self->_findOverlayView;
  }
  return findOverlayView;
}

- (void)layoutSubviews
{
  id v3 = [(MFMessageHeaderView *)self displayMetrics];

  if (v3)
  {
    v13.receiver = self;
    v13.super_class = (Class)MFMessageHeaderView;
    [(MFMessageHeaderView *)&v13 layoutSubviews];
    [(MFMessageHeaderView *)self _updateSeparators];
    if (self->_findOverlayView)
    {
      [(MFMessageHeaderView *)self bounds];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      v12 = [(MFMessageHeaderView *)self findOverlayView];
      objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
    }
    -[MFMessageHeaderView setDraggableArea:](self, "setDraggableArea:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MFMessageHeaderView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v19.receiver = self;
  v19.super_class = (Class)MFMessageHeaderView;
  -[MFMessageHeaderView setBounds:](&v19, sel_setBounds_, x, y, width, height);
  v20.origin.double x = v9;
  v20.origin.double y = v11;
  v20.size.double width = v13;
  v20.size.double height = v15;
  double v16 = CGRectGetHeight(v20);
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  double v17 = v16 - CGRectGetHeight(v21);
  if (v17 < 0.0) {
    double v17 = -v17;
  }
  if (v17 >= 2.22044605e-16)
  {
    v18 = [(MFMessageHeaderView *)self delegate];
    [v18 headerViewDidChangeHeight:self];
  }
}

- (void)drawRect:(CGRect)a3 forViewPrintFormatter:(id)a4
{
  id v4 = [(MFMessageHeaderView *)self layer];
  [v4 renderInContext:UIGraphicsGetCurrentContext()];
}

- (CGRect)draggableArea
{
  p_draggableArea = &self->_draggableArea;
  if (CGRectIsEmpty(self->_draggableArea))
  {
    id v4 = [(MFMessageHeaderView *)self headerBlocks];
    double v5 = objc_msgSend(v4, "ef_firstObjectPassingTest:", &__block_literal_global_8);

    if (v5)
    {
      double v6 = [v5 separator];
      [v6 frame];
      -[MFMessageHeaderView convertRect:fromView:](self, "convertRect:fromView:", v5);
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;

      v23.origin.double x = v8;
      v23.origin.double y = v10;
      v23.size.double width = v12;
      v23.size.double height = v14;
      double MaxY = CGRectGetMaxY(v23);
      [(MFMessageHeaderView *)self bounds];
      p_draggableArea->origin.double x = v16;
      p_draggableArea->origin.double y = v17;
      p_draggableArea->size.double width = v18;
      p_draggableArea->size.double height = MaxY - v17;
    }
  }
  double x = p_draggableArea->origin.x;
  double y = p_draggableArea->origin.y;
  double width = p_draggableArea->size.width;
  double height = p_draggableArea->size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

uint64_t __36__MFMessageHeaderView_draggableArea__block_invoke(uint64_t a1, void *a2)
{
  return [a2 separatorIsHidden] ^ 1;
}

- (void)addHeaderBlock:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  double v6 = [(MFMessageHeaderView *)self headerBlocks];
  -[MFMessageHeaderView insertHeaderBlock:atIndex:animated:](self, "insertHeaderBlock:atIndex:animated:", v7, [v6 count], v4);
}

- (void)insertHeaderBlock:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = [(MFMessageHeaderView *)self headerBlocks];
  char v10 = [v9 containsObject:v8];

  if ((v10 & 1) == 0)
  {
    unint64_t v11 = [(MFMessageHeaderView *)self _pinnedBlockIndex];
    CGFloat v12 = [(MFMessageHeaderView *)self headerBlocks];
    if ([v12 count] > a4
      && ([(MFMessageHeaderView *)self pinnedBlock],
          (double v13 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v14 = [(MFMessageHeaderView *)self pinnedBlock];
      BOOL v16 = v14 != v8 && v11 <= a4;

      if (v16) {
        a4 = v11 + 1;
      }
    }
    else
    {
    }
    [(NSMutableArray *)self->_headerBlocks insertObject:v8 atIndex:a4];
    double v17 = [(MFMessageHeaderView *)self displayMetrics];
    [v8 setDisplayMetrics:v17];

    CGFloat v18 = [(MFMessageHeaderView *)self viewModel];

    if (v18)
    {
      objc_super v19 = [(MFMessageHeaderView *)self viewModel];
      [v8 displayMessageUsingViewModel:v19];
    }
    if (v5)
    {
      [(MFMessageHeaderView *)self insertSubview:v8 atIndex:0];
      CGRect v20 = [(MFMessageHeaderView *)self _animationConstraintsForBlockAtIndex:a4];
      [MEMORY[0x1E4F28DC8] activateConstraints:v20];
      [(MFMessageHeaderView *)self layoutIfNeeded];
      [MEMORY[0x1E4F28DC8] deactivateConstraints:v20];
      [(MFMessageHeaderView *)self insertArrangedSubview:v8 atIndex:a4];
      [(MFMessageHeaderView *)self _layoutAnimatedWithCompletion:0];
    }
    else
    {
      [(MFMessageHeaderView *)self insertArrangedSubview:v8 atIndex:a4];
    }
    CGRect v21 = +[MFMessageHeaderView log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_opt_class();
      CGRect v23 = [(MFMessageHeaderView *)self viewModel];
      v24 = [v23 itemID];
      int v25 = 138412802;
      uint64_t v26 = v22;
      __int16 v27 = 2048;
      id v28 = v8;
      __int16 v29 = 2114;
      v30 = v24;
      _os_log_impl(&dword_1DDF5A000, v21, OS_LOG_TYPE_DEFAULT, "Inserting headerView block <%@: %p> for itemID: %{public}@", (uint8_t *)&v25, 0x20u);
    }
  }
}

- (void)removeHeaderBlock:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MFMessageHeaderView *)self headerBlocks];
  int v8 = [v7 containsObject:v6];

  if (v8)
  {
    id v9 = [(MFMessageHeaderView *)self pinnedBlock];

    if (v9 == v6) {
      [(MFMessageHeaderView *)self setPinnedBlock:0];
    }
    if (v4)
    {
      [(MFMessageHeaderView *)self removeArrangedSubview:v6];
      char v10 = [(MFMessageHeaderView *)self headerBlocks];
      uint64_t v11 = [v10 indexOfObject:v6];

      CGFloat v12 = [(MFMessageHeaderView *)self _animationConstraintsForBlockAtIndex:v11];
      [MEMORY[0x1E4F28DC8] activateConstraints:v12];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __50__MFMessageHeaderView_removeHeaderBlock_animated___block_invoke;
      v13[3] = &unk_1E6D1B290;
      v13[4] = self;
      id v14 = v6;
      [(MFMessageHeaderView *)self _layoutAnimatedWithCompletion:v13];
    }
    else
    {
      [(NSMutableArray *)self->_headerBlocks removeObject:v6];
      [(MFMessageHeaderView *)self removeArrangedSubview:v6];
      [v6 removeFromSuperview];
    }
  }
}

uint64_t __50__MFMessageHeaderView_removeHeaderBlock_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) removeObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

- (void)removeAllHeaderBlocksAnimated:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(MFMessageHeaderView *)self setPinnedBlock:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v4 = [(MFMessageHeaderView *)self headerBlocks];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 removeFromSuperview];
        [(MFMessageHeaderView *)self removeArrangedSubview:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_headerBlocks removeAllObjects];
}

- (void)insertHeaderBlock:(id)a3 before:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a3;
  id v9 = a4;
  if (!v14)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MFMessageHeaderView.m", 216, @"Invalid parameter not satisfying: %@", @"newBlock" object file lineNumber description];
  }
  long long v10 = [(MFMessageHeaderView *)self headerBlocks];
  uint64_t v11 = [v10 indexOfObject:v9];
  if ([v10 indexOfObject:v14] != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MFMessageHeaderView.m" lineNumber:220 description:@"newBlock cannot exist in headerBlocks."];
  }
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    [(MFMessageHeaderView *)self addHeaderBlock:v14 animated:v5];
  }
  else {
    [(MFMessageHeaderView *)self insertHeaderBlock:v14 atIndex:v11 animated:v5];
  }
}

- (void)setHeaderBlocks:(id)a3
{
}

- (void)setHeaderBlocks:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([(NSMutableArray *)self->_headerBlocks isEqualToArray:v6] & 1) == 0)
  {
    if ([(NSMutableArray *)self->_headerBlocks count])
    {
      id v7 = [v6 differenceFromArray:self->_headerBlocks];
      int v8 = [v7 removals];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __48__MFMessageHeaderView_setHeaderBlocks_animated___block_invoke;
      v21[3] = &unk_1E6D1B728;
      v21[4] = self;
      BOOL v22 = v4;
      [v8 enumerateObjectsWithOptions:2 usingBlock:v21];

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v9 = objc_msgSend(v7, "insertions", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v18;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v9);
            }
            double v13 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "index"));
            [(MFMessageHeaderView *)self addHeaderBlock:v13 animated:v4];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v27 count:16];
        }
        while (v10);
      }
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v7 = v6;
      uint64_t v14 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v24;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v7);
            }
            [(MFMessageHeaderView *)self addHeaderBlock:*(void *)(*((void *)&v23 + 1) + 8 * v16++) animated:v4];
          }
          while (v14 != v16);
          uint64_t v14 = [v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v14);
      }
    }
  }
}

void __48__MFMessageHeaderView_setHeaderBlocks_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(id **)(a1 + 32);
  id v6 = v3;
  BOOL v5 = objc_msgSend(v4[55], "objectAtIndexedSubscript:", objc_msgSend(v3, "index"));
  [v4 removeHeaderBlock:v5 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setPinnedBlock:(id)a3
{
  p_pinnedBlock = &self->_pinnedBlock;
  uint64_t v10 = (MFMessageHeaderViewBlock *)a3;
  if (*p_pinnedBlock != v10)
  {
    objc_storeStrong((id *)&self->_pinnedBlock, a3);
    if (*p_pinnedBlock)
    {
      id v7 = [(MFMessageHeaderView *)self headerBlocks];
      uint64_t v8 = [v7 indexOfObject:*p_pinnedBlock];

      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"MFMessageHeaderView.m" lineNumber:263 description:@"Blocks must be added to MFMessageHeaderViewBlock before they can be pinned."];
      }
      else if (v8 < 1)
      {
        goto LABEL_6;
      }
      [(NSMutableArray *)self->_headerBlocks removeObject:*p_pinnedBlock];
      [(MFMessageHeaderView *)self removeArrangedSubview:*p_pinnedBlock];
      [(NSMutableArray *)self->_headerBlocks insertObject:*p_pinnedBlock atIndex:0];
      [(MFMessageHeaderView *)self insertArrangedSubview:*p_pinnedBlock atIndex:0];
      [(MFMessageHeaderView *)self setNeedsLayout];
    }
  }
LABEL_6:
}

- (int64_t)_pinnedBlockIndex
{
  if (!self->_pinnedBlock) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v3 = [(MFMessageHeaderView *)self headerBlocks];
  int64_t v4 = [v3 indexOfObject:self->_pinnedBlock];

  return v4;
}

- (id)_animationConstraintsForBlockAtIndex:(unint64_t)a3
{
  v25[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v5 = [(MFMessageHeaderView *)self headerBlocks];
    id v6 = [v5 objectAtIndexedSubscript:a3 - 1];

    long long v24 = v6;
    [v6 bottomAnchor];
  }
  else
  {
    long long v24 = 0;
    [(MFMessageHeaderView *)self topAnchor];
  long long v23 = };
  id v7 = [(MFMessageHeaderView *)self headerBlocks];
  uint64_t v8 = [v7 objectAtIndexedSubscript:a3];

  BOOL v22 = [v8 bottomAnchor];
  id v9 = [v22 constraintEqualToAnchor:v23];
  v25[0] = v9;
  uint64_t v10 = [v8 leadingAnchor];
  uint64_t v11 = [(MFMessageHeaderView *)self leadingAnchor];
  uint64_t v12 = [v10 constraintEqualToAnchor:v11];
  v25[1] = v12;
  uint64_t v13 = [v8 trailingAnchor];
  uint64_t v14 = [(MFMessageHeaderView *)self trailingAnchor];
  uint64_t v15 = [(id)v13 constraintEqualToAnchor:v14];
  v25[2] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  long long v17 = (void *)[v16 mutableCopy];

  long long v18 = [v24 backgroundColor];
  LOBYTE(v13) = objc_msgSend(v18, "mf_isTranslucent");

  if (v13)
  {
    long long v19 = [v8 heightAnchor];
    long long v20 = [v19 constraintEqualToConstant:0.0];
    [v17 addObject:v20];
  }
  return v17;
}

- (void)_layoutAnimatedWithCompletion:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__MFMessageHeaderView__layoutAnimatedWithCompletion___block_invoke;
  v3[3] = &unk_1E6D1AB40;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v3 usingSpringWithDamping:a3 initialSpringVelocity:0.349999994 options:0.0 animations:1.0 completion:0.0];
}

uint64_t __53__MFMessageHeaderView__layoutAnimatedWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)displayMessageUsingViewModel:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MFMessageHeaderView *)self viewModel];

  if (v5 != v4)
  {
    [(MFMessageHeaderView *)self setViewModel:v4];
    id v6 = +[MFMessageHeaderView log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [v4 itemID];
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v7;
      __int16 v20 = 2048;
      CGRect v21 = self;
      __int16 v22 = 2114;
      long long v23 = v8;
      _os_log_impl(&dword_1DDF5A000, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Setting up view model for itemID: %{public}@", buf, 0x20u);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = [(MFMessageHeaderView *)self headerBlocks];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v12++) displayMessageUsingViewModel:v4];
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    [(MFMessageHeaderView *)self setNeedsLayout];
  }
}

- (void)setMessageFlags:(unint64_t)a3 conversationFlags:(unint64_t)a4
{
  uint64_t v7 = [(MFMessageHeaderView *)self viewModel];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__MFMessageHeaderView_setMessageFlags_conversationFlags___block_invoke;
  v9[3] = &__block_descriptor_48_e44_v16__0___MessageItemFlagsViewModelBuilder__8l;
  v9[4] = a3;
  v9[5] = a4;
  uint64_t v8 = [v7 updatedFlagsModelWithBuilder:v9];
  [(MFMessageHeaderView *)self setViewModel:v8];
}

void __57__MFMessageHeaderView_setMessageFlags_conversationFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setRead:*(_DWORD *)(a1 + 32) & 1];
  [v3 setFlagged:(*(void *)(a1 + 32) >> 4) & 1];
  [v3 setReplied:(*(void *)(a1 + 32) >> 2) & 1];
  [v3 setForwarded:(*(void *)(a1 + 32) >> 8) & 1];
  [v3 setRedirected:(*(void *)(a1 + 32) >> 9) & 1];
  [v3 setJunk:(*(void *)(a1 + 32) >> 21) & 1];
  [v3 setVIP:(*(void *)(a1 + 32) >> 24) & 1];
  [v3 setNotify:*(_DWORD *)(a1 + 40) & 1];
  [v3 setMute:(*(void *)(a1 + 40) >> 2) & 1];
}

- (void)setDisplayMetrics:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(MFMessageDisplayMetrics *)self->_displayMetrics isEqual:v5])
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(MFMessageHeaderView *)self headerBlocks];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          uint64_t v11 = [(MFMessageHeaderView *)self displayMetrics];
          [v10 setDisplayMetrics:v11];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [(MFMessageHeaderView *)self setNeedsUpdateConstraints];
    [(MFMessageHeaderView *)self setNeedsLayout];
  }
}

- (void)_updateSeparators
{
  id v3 = [(MFMessageHeaderView *)self displayMetrics];
  if ([v3 hasCompactLayout]) {
    char v4 = 0;
  }
  else {
    char v4 = ![(MFMessageHeaderView *)self bottomSeparatorDrawsFlushWithLeadingEdge];
  }

  id v5 = [(MFMessageHeaderView *)self headerBlocks];
  id v6 = [v5 lastObject];

  uint64_t v7 = [(MFMessageHeaderView *)self headerBlocks];
  uint64_t v8 = objc_msgSend(v7, "ef_firstObjectPassingTest:", &__block_literal_global_44);

  if (v8)
  {
    uint64_t v9 = [(MFMessageHeaderView *)self headerBlocks];
    uint64_t v10 = [v9 indexOfObject:v8];
  }
  else
  {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v11 = [(MFMessageHeaderView *)self headerBlocks];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__MFMessageHeaderView__updateSeparators__block_invoke_2;
  v13[3] = &unk_1E6D1B770;
  v13[4] = self;
  id v12 = v6;
  char v16 = v4;
  id v14 = v12;
  uint64_t v15 = v10;
  [v11 enumerateObjectsUsingBlock:v13];
}

uint64_t __40__MFMessageHeaderView__updateSeparators__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __40__MFMessageHeaderView__updateSeparators__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v20 = a2;
  id v5 = [*(id *)(a1 + 32) displayMetrics];
  uint64_t v6 = [v5 prefersFlushSeparator];

  uint64_t v7 = v20;
  if (*(id *)(a1 + 40) == v20)
  {
    uint64_t v9 = *(unsigned char *)(a1 + 56) != 0;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) pinnedBlock];

    uint64_t v7 = v20;
    if (v8 == v20)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v10 headerBlocks];
      id v12 = [v11 objectAtIndexedSubscript:a3 + 1];
      uint64_t v9 = [v10 _blockHasWhiteOrClearBackground:v12];

      uint64_t v6 = 1;
      uint64_t v7 = v20;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  if (*(void *)(a1 + 48) != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v13 = [*(id *)(a1 + 32) headerBlocks];
    uint64_t v14 = [v13 indexOfObject:v20];

    uint64_t v15 = [*(id *)(a1 + 32) headerBlocks];
    uint64_t v16 = [v15 indexOfObject:v20];

    uint64_t v17 = [*(id *)(a1 + 32) headerBlocks];
    uint64_t v18 = [v17 indexOfObject:v20];

    uint64_t v7 = v20;
    if (v14 == v16 + 1 || v14 == v18 - 1 || v14 == *(void *)(a1 + 48)) {
      uint64_t v9 = 1;
    }
  }
  [v7 setSeparatorIsHidden:v9];
  [v20 setSeparatorDrawsFlushWithTrailingEdge:v6];
  uint64_t v19 = [*(id *)(a1 + 32) displayMetrics];
  objc_msgSend(v20, "setSeparatorDrawsFlushWithLeadingEdge:", objc_msgSend(v19, "prefersFlushSeparatorForLeadingEdge"));
}

- (void)prepareForReuse
{
}

- (void)addConversationSearchOverlay
{
  id v3 = [(MFMessageHeaderView *)self findOverlayView];
  -[MFMessageHeaderView bringSubviewToFront:](self, "bringSubviewToFront:");

  id v4 = [(MFMessageHeaderView *)self findOverlayView];
  [v4 show];
}

- (void)removeConversationSearchOverlay
{
  id v3 = [(MFMessageHeaderView *)self findOverlayView];
  [v3 hide];

  id v4 = [(MFMessageHeaderView *)self findOverlayView];
  -[MFMessageHeaderView sendSubviewToBack:](self, "sendSubviewToBack:");
}

- (MFMessageHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFMessageHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (MFMessageHeaderViewBlock)pinnedBlock
{
  return self->_pinnedBlock;
}

- (NSArray)headerBlocks
{
  return &self->_headerBlocks->super;
}

- (BOOL)bottomSeparatorDrawsFlushWithLeadingEdge
{
  return self->_bottomSeparatorDrawsFlushWithLeadingEdge;
}

- (void)setBottomSeparatorDrawsFlushWithLeadingEdge:(BOOL)a3
{
  self->_bottomSeparatorDrawsFlushWithLeadingEdge = a3;
}

- (MessageHeaderViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (void)setDraggableArea:(CGRect)a3
{
  self->_draggableArea = a3;
}

- (void)setFindOverlayView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findOverlayView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_pinnedBlock, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headerBlocks, 0);
}

@end