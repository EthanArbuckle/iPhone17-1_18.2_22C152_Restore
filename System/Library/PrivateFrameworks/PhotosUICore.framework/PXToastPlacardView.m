@interface PXToastPlacardView
- (NSString)message;
- (void)addActionWithTitle:(id)a3 action:(id)a4;
- (void)didMoveToSuperview;
- (void)setMessage:(id)a3;
@end

@implementation PXToastPlacardView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)didMoveToSuperview
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  v77.receiver = self;
  v77.super_class = (Class)PXToastPlacardView;
  [(PXToastPlacardView *)&v77 didMoveToSuperview];
  if (!self->_didLoad)
  {
    self->_didLoad = 1;
    v3 = self->_actions;
    v4 = self;
    v5 = [(PXToastPlacardView *)v4 layer];
    [v5 setCornerRadius:8.0];
    LODWORD(v6) = 1050253722;
    [v5 setShadowOpacity:v6];
    [v5 setShadowRadius:10.0];
    v51 = v5;
    objc_msgSend(v5, "setShadowOffset:", 3.0, 3.0);
    v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(PXToastPlacardView *)v4 setBackgroundColor:v7];

    [(PXToastPlacardView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v9 = [(PXToastPlacardView *)v4 message];
    [v8 setText:v9];

    [v8 setNumberOfLines:0];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v57 = v4;
    v52 = v8;
    [(PXToastPlacardView *)v4 addSubview:v8];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    obj = v3;
    uint64_t v58 = [(NSMutableArray *)obj countByEnumeratingWithState:&v73 objects:v80 count:16];
    v10 = 0;
    if (v58)
    {
      uint64_t v55 = *(void *)v74;
      do
      {
        uint64_t v11 = 0;
        v12 = v10;
        do
        {
          if (*(void *)v74 != v55) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v73 + 1) + 8 * v11);
          v14 = (void *)MEMORY[0x1E4FB14D0];
          v15 = (void *)MEMORY[0x1E4FB13F0];
          v16 = [v13 title];
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __40__PXToastPlacardView_didMoveToSuperview__block_invoke;
          v72[3] = &unk_1E5DC9A58;
          v72[4] = v13;
          v17 = [v15 actionWithTitle:v16 image:0 identifier:0 handler:v72];
          v10 = [v14 buttonWithType:1 primaryAction:v17];

          [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
          [(PXToastPlacardView *)v57 addSubview:v10];
          v18 = (void *)MEMORY[0x1E4F28DC8];
          v19 = [v10 trailingAnchor];
          v70 = v19;
          v64 = v18;
          v66 = v12;
          if (v12)
          {
            uint64_t v20 = [v12 leadingAnchor];
            double v21 = -10.0;
          }
          else
          {
            uint64_t v20 = [(PXToastPlacardView *)v57 trailingAnchor];
            double v21 = -20.0;
          }
          v68 = (void *)v20;
          v62 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21);
          v79[0] = v62;
          v60 = [v10 centerYAnchor];
          v22 = [(PXToastPlacardView *)v57 centerYAnchor];
          v23 = [v60 constraintEqualToAnchor:v22];
          v79[1] = v23;
          v24 = [v10 widthAnchor];
          [v10 intrinsicContentSize];
          v25 = objc_msgSend(v24, "constraintGreaterThanOrEqualToConstant:");
          v79[2] = v25;
          v26 = [v10 heightAnchor];
          v27 = [(PXToastPlacardView *)v57 heightAnchor];
          v28 = [v26 constraintLessThanOrEqualToAnchor:v27 constant:-40.0];
          v79[3] = v28;
          v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:4];
          [v64 activateConstraints:v29];

          ++v11;
          v12 = v10;
        }
        while (v58 != v11);
        uint64_t v58 = [(NSMutableArray *)obj countByEnumeratingWithState:&v73 objects:v80 count:16];
      }
      while (v58);
    }

    v30 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v30 bounds];
    double v32 = v31;
    double v34 = v33;

    if (v32 >= v34) {
      double v35 = v34;
    }
    else {
      double v35 = v32;
    }
    double v36 = v35 + -40.0;
    v59 = (void *)MEMORY[0x1E4F28DC8];
    v37 = [v52 leadingAnchor];
    v69 = [(PXToastPlacardView *)v57 leadingAnchor];
    v71 = v37;
    v67 = objc_msgSend(v37, "constraintEqualToAnchor:constant:", 20.0);
    v78[0] = v67;
    v38 = [v52 trailingAnchor];
    v65 = v38;
    v61 = v10;
    if (v10)
    {
      uint64_t v39 = [v10 leadingAnchor];
      double v40 = -10.0;
    }
    else
    {
      uint64_t v39 = [(PXToastPlacardView *)v57 trailingAnchor];
      double v40 = -20.0;
    }
    v63 = (void *)v39;
    v56 = objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40);
    v78[1] = v56;
    v54 = [v52 centerYAnchor];
    v41 = [(PXToastPlacardView *)v57 centerYAnchor];
    v42 = [v54 constraintEqualToAnchor:v41];
    v78[2] = v42;
    v43 = [v52 heightAnchor];
    v44 = [(PXToastPlacardView *)v57 heightAnchor];
    v45 = [v43 constraintLessThanOrEqualToAnchor:v44 constant:-40.0];
    v78[3] = v45;
    v46 = [(PXToastPlacardView *)v57 heightAnchor];
    v47 = [v46 constraintGreaterThanOrEqualToConstant:80.0];
    v78[4] = v47;
    v48 = [(PXToastPlacardView *)v57 widthAnchor];
    v49 = [v48 constraintEqualToConstant:v36];
    v78[5] = v49;
    v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:6];
    [v59 activateConstraints:v50];
  }
}

void __40__PXToastPlacardView_didMoveToSuperview__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) action];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) action];
    v3[2]();
  }
}

- (void)addActionWithTitle:(id)a3 action:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  actions = self->_actions;
  if (!actions)
  {
    id v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = self->_actions;
    self->_actions = v8;

    actions = self->_actions;
  }
  v10 = [[_PXToastAction alloc] initWithTitle:v11 action:v6];
  [(NSMutableArray *)actions addObject:v10];
}

@end