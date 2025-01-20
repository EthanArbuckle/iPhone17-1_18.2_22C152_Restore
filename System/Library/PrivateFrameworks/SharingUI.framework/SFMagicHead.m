@interface SFMagicHead
- (BOOL)highlighted;
- (BOOL)pointedAt;
- (BOOL)stateBeingRestored;
- (NSProgress)progress;
- (NSUUID)nodeIdentifier;
- (SFAirDropNode)node;
- (SFMagicHead)initWithNode:(id)a3 slotNode:(id)a4 containerRadius:(double)a5 delegate:(id)a6 settings:(id)a7;
- (SFMagicHeadDelegate)delegate;
- (SFMagicHeadSettings)settings;
- (UIAirDropNode)slotNode;
- (UIView)imageSlotView;
- (double)degreeOffset;
- (int64_t)position;
- (int64_t)size;
- (void)addObserverOfValuesForKeyPaths:(id)a3 ofObject:(id)a4;
- (void)dealloc;
- (void)handleKVOUpdateForProgress:(id)a3 keyPath:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserverOfValuesForKeyPaths:(id)a3 ofObject:(id)a4;
- (void)resetTransferState;
- (void)setCellState:(int64_t)a3 animated:(BOOL)a4 silent:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPointedAt:(BOOL)a3;
- (void)setPosition:(int64_t)a3;
- (void)setPosition:(int64_t)a3 withOffset:(double)a4;
- (void)setPositionDegreeOffsetWithOffset:(double)a3;
- (void)setProgress:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setStateBeingRestored:(BOOL)a3;
- (void)triggerKVOForKeyPaths:(id)a3 ofObject:(id)a4;
- (void)userDidCancel;
- (void)userDidSelect;
@end

@implementation SFMagicHead

- (SFMagicHead)initWithNode:(id)a3 slotNode:(id)a4 containerRadius:(double)a5 delegate:(id)a6 settings:(id)a7
{
  unint64_t v13 = (unint64_t)a3;
  unint64_t v14 = (unint64_t)a4;
  id v15 = a6;
  id v16 = a7;
  if (v13 | v14)
  {
    v57.receiver = self;
    v57.super_class = (Class)SFMagicHead;
    v17 = -[SFMagicHead initWithFrame:](&v57, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    if (v17)
    {
      v18 = [MEMORY[0x263F825C8] clearColor];
      [(SFMagicHead *)v17 setBackgroundColor:v18];

      v17->_isMagicHead = v14 != 0;
      p_node = &v17->_node;
      objc_storeStrong((id *)&v17->_node, a3);
      objc_storeStrong((id *)&v17->_slotNode, a4);
      v52 = (id *)&v17->_node;
      uint64_t v20 = [(SFAirDropNode *)v17->_node nodeIdentifier];
      v21 = (void *)v20;
      if (v20)
      {
        int v22 = 0;
        v23 = (void *)v20;
      }
      else
      {
        uint64_t v25 = [(id)v14 identifier];
        p_node = (void *)v25;
        if (v25)
        {
          int v22 = 0;
          v23 = (void *)v25;
        }
        else
        {
          v23 = objc_opt_new();
          int v22 = 1;
        }
      }
      objc_storeStrong((id *)&v17->_nodeIdentifier, v23);
      if (v22) {

      }
      if (!v21) {
      v17->_containerRadius = a5;
      }
      objc_storeWeak((id *)&v17->_delegate, v15);
      v26 = v16;
      if (!v16)
      {
        p_node = [MEMORY[0x263F6C2C0] rootSettings];
        v26 = [p_node magicHeadSettings];
      }
      objc_storeStrong((id *)&v17->_settings, v26);
      if (!v16)
      {
      }
      v17->_pointedAt = 1;
      if (v17->_isMagicHead)
      {
        v27 = [MEMORY[0x263F82B60] mainScreen];
        [v27 _referenceBounds];
        if (v28 >= 414.0)
        {
          v30 = [MEMORY[0x263F82670] currentDevice];
          uint64_t v31 = [v30 userInterfaceIdiom];

          if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
            double v29 = 62.0;
          }
          else {
            double v29 = 66.0;
          }
        }
        else
        {
          double v29 = 62.0;
        }
      }
      else
      {
        double v29 = 128.0;
      }
      -[SFMagicHead setBounds:](v17, "setBounds:", 0.0, 0.0, v29, v29);
      progressKeyPaths = v17->_progressKeyPaths;
      v17->_progressKeyPaths = (NSArray *)&unk_26CE7E2C0;

      id v33 = objc_alloc(MEMORY[0x263F82E00]);
      [(SFMagicHead *)v17 bounds];
      uint64_t v34 = objc_msgSend(v33, "initWithFrame:");
      contentView = v17->_contentView;
      v17->_contentView = (UIView *)v34;

      [(UIView *)v17->_contentView setClipsToBounds:0];
      v36 = [MEMORY[0x263F825C8] clearColor];
      [(UIView *)v17->_contentView setBackgroundColor:v36];

      [(SFMagicHead *)v17 addSubview:v17->_contentView];
      if (v17->_isMagicHead)
      {
        v37 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
        imageSlotView = v17->_imageSlotView;
        v17->_imageSlotView = v37;

        [(UIView *)v17->_contentView bounds];
        -[UIView setFrame:](v17->_imageSlotView, "setFrame:");
        int v39 = [(UIAirDropNode *)v17->_slotNode avatarImageSlotID];
        id location = 0;
        objc_initWeak(&location, v17);
        v40 = (void *)*MEMORY[0x263F83300];
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __71__SFMagicHead_initWithNode_slotNode_containerRadius_delegate_settings___block_invoke;
        v53[3] = &unk_264472C48;
        objc_copyWeak(&v54, &location);
        int v55 = v39;
        [v40 _performBlockAfterCATransactionCommits:v53];
        [(UIView *)v17->_contentView addSubview:v17->_imageSlotView];
        objc_destroyWeak(&v54);
        objc_destroyWeak(&location);
      }
      else
      {
        v41 = [SFMagicHeadShadowView alloc];
        [(UIView *)v17->_contentView bounds];
        uint64_t v42 = -[SFMagicHeadShadowView initWithFrame:](v41, "initWithFrame:");
        shadowView = v17->_shadowView;
        v17->_shadowView = (SFMagicHeadShadowView *)v42;

        [(SFMagicHeadShadowView *)v17->_shadowView setClipsToBounds:0];
        [(UIView *)v17->_contentView addSubview:v17->_shadowView];
        v44 = objc_msgSend(objc_alloc(MEMORY[0x263F827E8]), "initWithCGImage:", objc_msgSend(*v52, "displayIcon"));
        v45 = -[SFPersonImageView initWithImage:isSquare:]([SFPersonImageView alloc], "initWithImage:isSquare:", v44, [*v52 isClassroom]);
        imageView = v17->_imageView;
        v17->_imageView = v45;

        [(SFMagicHeadSettings *)v17->_settings tapDarkeningAlpha];
        -[SFPersonImageView setHighlightDarkeningAlpha:](v17->_imageView, "setHighlightDarkeningAlpha:");
        [(SFMagicHeadShadowView *)v17->_shadowView bounds];
        -[SFPersonImageView setFrame:](v17->_imageView, "setFrame:");
        [(SFMagicHeadShadowView *)v17->_shadowView addSubview:v17->_imageView];
      }
      v47 = [SFCircleProgressView alloc];
      [(UIView *)v17->_contentView bounds];
      CGRect v59 = CGRectInset(v58, -9.0, -9.0);
      uint64_t v48 = -[SFCircleProgressView initWithFrame:](v47, "initWithFrame:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
      circleProgressView = v17->_circleProgressView;
      v17->_circleProgressView = (SFCircleProgressView *)v48;

      [(SFCircleProgressView *)v17->_circleProgressView setProgressLineWidth:3.0];
      [(SFCircleProgressView *)v17->_circleProgressView setShowProgressTray:1];
      [(SFCircleProgressView *)v17->_circleProgressView setAlpha:0.0];
      v50 = [MEMORY[0x263F825C8] clearColor];
      [(SFCircleProgressView *)v17->_circleProgressView setBackgroundColor:v50];

      [(UIView *)v17->_contentView addSubview:v17->_circleProgressView];
      [(SFMagicHead *)v17 setCellState:0 animated:0 silent:1];
    }
    self = v17;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __71__SFMagicHead_initWithNode_slotNode_containerRadius_delegate_settings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x263F15770] objectForSlot:*(unsigned int *)(a1 + 40)];
    uint64_t v3 = *MEMORY[0x263F15E10];
    v4 = [WeakRetained imageSlotView];
    v5 = [v4 layer];
    [v5 setContentsGravity:v3];

    v6 = [WeakRetained imageSlotView];
    v7 = [v6 layer];
    [v7 setContents:v2];

    v8 = [WeakRetained imageSlotView];
    [v8 setAlpha:1.0];
  }
}

- (void)dealloc
{
  [(SFMagicHead *)self setProgress:0];
  v3.receiver = self;
  v3.super_class = (Class)SFMagicHead;
  [(SFMagicHead *)&v3 dealloc];
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)highlighted
{
  return [(SFPersonImageView *)self->_imageView isHighlighted];
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
  if ((unint64_t)(a3 - 1) > 2) {
    CGFloat v4 = 0.00000011920929;
  }
  else {
    CGFloat v4 = dbl_21DBB2310[a3 - 1];
  }
  [(SFMagicHeadShadowView *)self->_shadowView setVisible:a3 != 1];
  CGAffineTransformMakeScale(&v7, v4, v4);
  contentView = self->_contentView;
  CGAffineTransform v6 = v7;
  [(UIView *)contentView setTransform:&v6];
}

- (void)setPosition:(int64_t)a3
{
}

- (void)setPositionDegreeOffsetWithOffset:(double)a3
{
}

- (void)setPosition:(int64_t)a3 withOffset:(double)a4
{
  self->_position = a3;
  self->_degreeOffset = a4;
  double v5 = 0.0;
  if (self->_position != 1) {
    double v5 = -self->_containerRadius;
  }
  float v6 = a4;
  float v7 = v6 * 0.0174532925;
  double v8 = v7;
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeRotation(&v17, v7);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, 0.0, v5);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeRotation(&v15, -v8);
  long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v14.c = v9;
  *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransform t1 = v17;
  *(_OWORD *)&t2.a = *(_OWORD *)&v14.a;
  *(_OWORD *)&t2.c = v9;
  *(_OWORD *)&t2.tx = *(_OWORD *)&v14.tx;
  CGAffineTransformConcat(&v14, &t1, &t2);
  CGAffineTransform t2 = v16;
  CGAffineTransform v11 = v14;
  CGAffineTransformConcat(&t1, &t2, &v11);
  CGAffineTransform v14 = t1;
  CGAffineTransform t2 = v15;
  CGAffineTransform v11 = t1;
  CGAffineTransformConcat(&t1, &t2, &v11);
  CGAffineTransform v14 = t1;
  CGAffineTransform v10 = t1;
  [(SFMagicHead *)self setTransform:&v10];
}

- (void)resetTransferState
{
  [(SFMagicHead *)self setCellState:0 animated:1 silent:1];
  id v3 = [(SFMagicHead *)self delegate];
  [v3 magicHead:self requestingSubtitleTextChangeForState:self->_cellState];
}

- (void)userDidSelect
{
  [(SFMagicHead *)self resetTransferState];
  [(SFMagicHead *)self setCellState:2 animated:1 silent:0];
}

- (void)userDidCancel
{
  if ((self->_cellState | 2) != 6)
  {
    [(NSProgress *)self->_progress cancel];
    [(SFMagicHead *)self setCellState:0 animated:1 silent:1];
    id v3 = [(SFMagicHead *)self delegate];
    [v3 magicHead:self requestingSubtitleTextChangeForState:self->_cellState];
  }
}

- (void)setProgress:(id)a3
{
  double v5 = (NSProgress *)a3;
  p_progress = &self->_progress;
  if (self->_progress != v5)
  {
    float v7 = v5;
    -[SFMagicHead removeObserverOfValuesForKeyPaths:ofObject:](self, "removeObserverOfValuesForKeyPaths:ofObject:", self->_progressKeyPaths);
    objc_storeStrong((id *)&self->_progress, a3);
    [(SFMagicHead *)self addObserverOfValuesForKeyPaths:self->_progressKeyPaths ofObject:*p_progress];
    [(SFMagicHead *)self triggerKVOForKeyPaths:self->_progressKeyPaths ofObject:*p_progress];
    double v5 = v7;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = [MEMORY[0x263F08B88] mainThread];

  if (v13)
  {
    if ([v11 isEqual:self->_progress])
    {
      [(SFMagicHead *)self handleKVOUpdateForProgress:self->_progress keyPath:v10];
    }
    else
    {
      CGAffineTransform v14 = airdrop_ui_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SFMagicHead observeValueForKeyPath:ofObject:change:context:]((uint64_t)self, (uint64_t)v10, v14);
      }
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__SFMagicHead_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_264472B20;
    block[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    v19 = a6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __62__SFMagicHead_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) observeValueForKeyPath:*(void *)(a1 + 40) ofObject:*(void *)(a1 + 48) change:*(void *)(a1 + 56) context:*(void *)(a1 + 64)];
}

- (void)addObserverOfValuesForKeyPaths:(id)a3 ofObject:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v6);
          }
          [v7 addObserver:self forKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * v11++) options:0 context:0];
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)removeObserverOfValuesForKeyPaths:(id)a3 ofObject:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v6);
          }
          [v7 removeObserver:self forKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)triggerKVOForKeyPaths:(id)a3 ofObject:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v6);
          }
          [(SFMagicHead *)self observeValueForKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * v11++) ofObject:v7 change:0 context:0];
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)handleKVOUpdateForProgress:(id)a3 keyPath:(id)a4
{
  id v5 = a4;
  BOOL stateBeingRestored = self->_stateBeingRestored;
  BOOL v7 = !self->_stateBeingRestored;
  id v18 = v5;
  if ([v5 isEqualToString:@"userInfo.sendState"])
  {
    switch([(NSProgress *)self->_progress sf_transferState])
    {
      case 0:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained magicHeadDidStartTransferForHead:self];

        uint64_t v9 = self;
        uint64_t v10 = 2;
        BOOL v11 = v7;
        BOOL v12 = stateBeingRestored;
        goto LABEL_10;
      case 1:
        BOOL v12 = stateBeingRestored;
        uint64_t v9 = self;
        uint64_t v10 = 1;
        goto LABEL_9;
      case 2:
        BOOL v12 = stateBeingRestored;
        uint64_t v9 = self;
        uint64_t v10 = 2;
        goto LABEL_9;
      case 3:
        BOOL v12 = stateBeingRestored;
        uint64_t v9 = self;
        uint64_t v10 = 3;
LABEL_9:
        BOOL v11 = v7;
LABEL_10:
        [(SFMagicHead *)v9 setCellState:v10 animated:v11 silent:v12];
        break;
      case 4:
        BOOL v14 = stateBeingRestored;
        long long v15 = self;
        uint64_t v16 = 5;
        goto LABEL_13;
      case 5:
        BOOL v14 = stateBeingRestored;
        long long v15 = self;
        uint64_t v16 = 6;
LABEL_13:
        [(SFMagicHead *)v15 setCellState:v16 animated:v7 silent:v14];
        [(SFCircleProgressView *)self->_circleProgressView setProgress:v7 animated:0 completion:0.0];
        id v17 = objc_loadWeakRetained((id *)&self->_delegate);
        [v17 magicHeadDidTerminateTransferForHead:self];
        goto LABEL_15;
      case 6:
        [(SFMagicHead *)self setCellState:4 animated:v7 silent:stateBeingRestored];
        id v17 = objc_loadWeakRetained((id *)&self->_delegate);
        [v17 magicHeadDidFinishTransferForHead:self];
LABEL_15:

        break;
      default:
        break;
    }
  }
  else if ([v18 isEqualToString:@"fractionCompleted"])
  {
    circleProgressView = self->_circleProgressView;
    [(NSProgress *)self->_progress fractionCompleted];
    -[SFCircleProgressView setProgress:animated:completion:](circleProgressView, "setProgress:animated:completion:", v7, 0);
  }
}

- (void)setCellState:(int64_t)a3 animated:(BOOL)a4 silent:(BOOL)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int64_t cellState = self->_cellState;
  if (cellState != a3)
  {
    BOOL v6 = a4;
    unint64_t v9 = a3 - 2;
    if ((unint64_t)a3 >= 2 && cellState > a3)
    {
      uint64_t v10 = airdrop_ui_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v11 = self->_cellState;
        if (v11 > 6) {
          BOOL v12 = @"?";
        }
        else {
          BOOL v12 = off_264472C90[v11];
        }
        if (v9 > 4) {
          uint64_t v20 = @"?";
        }
        else {
          uint64_t v20 = off_264472C68[v9];
        }
        v21 = [(SFAirDropNode *)self->_node displayName];
        *(_DWORD *)buf = 138412803;
        v27 = v12;
        __int16 v28 = 2112;
        double v29 = v20;
        __int16 v30 = 2113;
        uint64_t v31 = v21;
        _os_log_impl(&dword_21DB23000, v10, OS_LOG_TYPE_DEFAULT, "MagicHead: unsupported cell state transition %@ -> %@ for person %{private}@. Ignoring", buf, 0x20u);
      }
LABEL_31:

      return;
    }
    progress = self->_progress;
    if (!progress || ([(NSProgress *)progress sf_initiator] & 2) != 0)
    {
      int v14 = 1;
    }
    else
    {
      if ((unint64_t)(a3 - 3) >= 4 && a3) {
        return;
      }
      [(SFCircleProgressView *)self->_circleProgressView setAlpha:0.0];
      int v14 = 0;
    }
    switch(a3)
    {
      case 0:
      case 5:
      case 6:
        [(SFCircleProgressView *)self->_circleProgressView setProgress:v6 animated:0 completion:0.0];
        circleProgressView = self->_circleProgressView;
        double v16 = 0.0;
        goto LABEL_16;
      case 1:
      case 3:
        [(SFCircleProgressView *)self->_circleProgressView setProgress:v6 animated:0 completion:0.0];
        if (v14)
        {
          circleProgressView = self->_circleProgressView;
          double v16 = 1.0;
LABEL_16:
          [(SFCircleProgressView *)circleProgressView setAlpha:v16];
        }
        break;
      case 4:
        v24 = self->_circleProgressView;
        if (v6)
        {
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __44__SFMagicHead_setCellState_animated_silent___block_invoke;
          v25[3] = &unk_264471EE0;
          v25[4] = self;
          [(SFCircleProgressView *)v24 animateProgressCompletedWithCompletion:v25];
        }
        else
        {
          [(SFCircleProgressView *)v24 setAlpha:0.0];
          [(SFCircleProgressView *)self->_circleProgressView setProgress:1.0];
        }
        break;
      default:
        break;
    }
    id v17 = airdrop_ui_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v18 = self->_cellState;
      if (v18 > 6) {
        v19 = @"?";
      }
      else {
        v19 = off_264472C90[v18];
      }
      if ((unint64_t)a3 > 6) {
        int v22 = @"?";
      }
      else {
        int v22 = off_264472C90[a3];
      }
      v23 = [(SFAirDropNode *)self->_node displayName];
      *(_DWORD *)buf = 138412803;
      v27 = v19;
      __int16 v28 = 2112;
      double v29 = v22;
      __int16 v30 = 2113;
      uint64_t v31 = v23;
      _os_log_impl(&dword_21DB23000, v17, OS_LOG_TYPE_DEFAULT, "MagicHead: changing cell state %@ -> %@ for person %{private}@", buf, 0x20u);
    }
    self->_int64_t cellState = a3;
    uint64_t v10 = [(SFMagicHead *)self delegate];
    [v10 magicHead:self requestingSubtitleTextChangeForState:self->_cellState];
    goto LABEL_31;
  }
}

uint64_t __44__SFMagicHead_setCellState_animated_silent___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __44__SFMagicHead_setCellState_animated_silent___block_invoke_2;
  v2[3] = &unk_264471EE0;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F82E00] animateWithDuration:v2 animations:0.5];
}

uint64_t __44__SFMagicHead_setCellState_animated_silent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.0];
}

- (SFMagicHeadDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFMagicHeadDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SFMagicHeadSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (SFAirDropNode)node
{
  return (SFAirDropNode *)objc_getProperty(self, a2, 488, 1);
}

- (UIAirDropNode)slotNode
{
  return (UIAirDropNode *)objc_getProperty(self, a2, 496, 1);
}

- (NSUUID)nodeIdentifier
{
  return self->_nodeIdentifier;
}

- (double)degreeOffset
{
  return self->_degreeOffset;
}

- (BOOL)pointedAt
{
  return self->_pointedAt;
}

- (void)setPointedAt:(BOOL)a3
{
  self->_pointedAt = a3;
}

- (int64_t)size
{
  return self->_size;
}

- (int64_t)position
{
  return self->_position;
}

- (BOOL)stateBeingRestored
{
  return self->_stateBeingRestored;
}

- (void)setStateBeingRestored:(BOOL)a3
{
  self->_BOOL stateBeingRestored = a3;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (UIView)imageSlotView
{
  return self->_imageSlotView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSlotView, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
  objc_storeStrong((id *)&self->_slotNode, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressKeyPaths, 0);
  objc_storeStrong((id *)&self->_circleProgressView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)observeValueForKeyPath:(NSObject *)a3 ofObject:change:context:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_21DB23000, a3, OS_LOG_TYPE_ERROR, "%@: incorrect object for keypath %@", (uint8_t *)&v7, 0x16u);
}

@end