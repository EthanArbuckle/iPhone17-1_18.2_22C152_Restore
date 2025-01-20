@interface SBHPopoverView
- (SBHPopoverView)initWithArrowLocation:(int64_t)a3;
- (UIView)backgroundView;
- (id)_arrowViewForArrowLocation:(int64_t)a3 arrowSize:(double)a4;
- (id)_createBackgroundView;
- (void)setBackgroundView:(id)a3;
@end

@implementation SBHPopoverView

- (SBHPopoverView)initWithArrowLocation:(int64_t)a3
{
  v59[2] = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)SBHPopoverView;
  v4 = [(SBHPopoverView *)&v54 init];
  v5 = v4;
  if (v4)
  {
    [(SBHPopoverView *)v4 setClipsToBounds:1];
    [(SBHPopoverView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(SBHPopoverView *)v5 _createBackgroundView];
    [v6 _setOverrideUserInterfaceStyle:2];
    [v6 _setContinuousCornerRadius:26.0];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeStrong((id *)&v5->_backgroundView, v6);
    [(SBHPopoverView *)v5 addSubview:v6];
    v7 = [(SBHPopoverView *)v5 _arrowViewForArrowLocation:a3 arrowSize:36.0];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBHPopoverView *)v5 addSubview:v7];
    v8 = (void *)MEMORY[0x1E4F28DC8];
    v9 = [v7 widthAnchor];
    v10 = [v9 constraintEqualToConstant:36.0];
    v59[0] = v10;
    v53 = v7;
    v11 = [v7 heightAnchor];
    v12 = [v11 constraintEqualToConstant:36.0];
    v59[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    [v8 activateConstraints:v13];

    switch(a3)
    {
      case 0:
        v40 = (void *)MEMORY[0x1E4F28DC8];
        v14 = [v6 topAnchor];
        v51 = [(SBHPopoverView *)v5 topAnchor];
        v52 = v14;
        v50 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", 12.0);
        v58[0] = v50;
        v15 = [v6 bottomAnchor];
        v48 = [(SBHPopoverView *)v5 bottomAnchor];
        v49 = v15;
        v47 = objc_msgSend(v15, "constraintEqualToAnchor:");
        v58[1] = v47;
        v16 = [v6 leadingAnchor];
        v45 = [(SBHPopoverView *)v5 leadingAnchor];
        v46 = v16;
        v44 = objc_msgSend(v16, "constraintEqualToAnchor:");
        v58[2] = v44;
        v17 = [v6 trailingAnchor];
        v42 = [(SBHPopoverView *)v5 trailingAnchor];
        v43 = v17;
        v41 = objc_msgSend(v17, "constraintEqualToAnchor:");
        v58[3] = v41;
        v18 = [v53 centerYAnchor];
        v19 = [v6 topAnchor];
        v20 = [v18 constraintEqualToAnchor:v19];
        v58[4] = v20;
        v21 = [v53 centerXAnchor];
        v22 = [v6 centerXAnchor];
        v23 = [v21 constraintEqualToAnchor:v22];
        v58[5] = v23;
        v24 = (void *)MEMORY[0x1E4F1C978];
        v25 = v58;
        goto LABEL_7;
      case 1:
        v40 = (void *)MEMORY[0x1E4F28DC8];
        v26 = [v6 topAnchor];
        v51 = [(SBHPopoverView *)v5 topAnchor];
        v52 = v26;
        v50 = objc_msgSend(v26, "constraintEqualToAnchor:");
        v57[0] = v50;
        v27 = [v6 bottomAnchor];
        v48 = [(SBHPopoverView *)v5 bottomAnchor];
        v49 = v27;
        v47 = objc_msgSend(v27, "constraintEqualToAnchor:constant:", -12.0);
        v57[1] = v47;
        v28 = [v6 leadingAnchor];
        v45 = [(SBHPopoverView *)v5 leadingAnchor];
        v46 = v28;
        v44 = objc_msgSend(v28, "constraintEqualToAnchor:");
        v57[2] = v44;
        v29 = [v6 trailingAnchor];
        v42 = [(SBHPopoverView *)v5 trailingAnchor];
        v43 = v29;
        v41 = objc_msgSend(v29, "constraintEqualToAnchor:");
        v57[3] = v41;
        v18 = [v53 centerYAnchor];
        v19 = [v6 bottomAnchor];
        v20 = [v18 constraintEqualToAnchor:v19];
        v57[4] = v20;
        v21 = [v53 centerXAnchor];
        v22 = [v6 centerXAnchor];
        v23 = [v21 constraintEqualToAnchor:v22];
        v57[5] = v23;
        v24 = (void *)MEMORY[0x1E4F1C978];
        v25 = v57;
        goto LABEL_7;
      case 2:
        v40 = (void *)MEMORY[0x1E4F28DC8];
        v30 = [v6 topAnchor];
        v51 = [(SBHPopoverView *)v5 topAnchor];
        v52 = v30;
        v50 = objc_msgSend(v30, "constraintEqualToAnchor:");
        v56[0] = v50;
        v31 = [v6 bottomAnchor];
        v48 = [(SBHPopoverView *)v5 bottomAnchor];
        v49 = v31;
        v47 = objc_msgSend(v31, "constraintEqualToAnchor:");
        v56[1] = v47;
        v32 = [v6 leadingAnchor];
        v45 = [(SBHPopoverView *)v5 leadingAnchor];
        v46 = v32;
        v44 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", 12.0);
        v56[2] = v44;
        v33 = [v6 trailingAnchor];
        v42 = [(SBHPopoverView *)v5 trailingAnchor];
        v43 = v33;
        v41 = objc_msgSend(v33, "constraintEqualToAnchor:");
        v56[3] = v41;
        v18 = [v53 centerXAnchor];
        v19 = [v6 leadingAnchor];
        v20 = [v18 constraintEqualToAnchor:v19];
        v56[4] = v20;
        v21 = [v53 centerYAnchor];
        v22 = [v6 centerYAnchor];
        v23 = [v21 constraintEqualToAnchor:v22];
        v56[5] = v23;
        v24 = (void *)MEMORY[0x1E4F1C978];
        v25 = v56;
        goto LABEL_7;
      case 3:
        v40 = (void *)MEMORY[0x1E4F28DC8];
        v34 = [v6 topAnchor];
        v51 = [(SBHPopoverView *)v5 topAnchor];
        v52 = v34;
        v50 = objc_msgSend(v34, "constraintEqualToAnchor:");
        v55[0] = v50;
        v35 = [v6 bottomAnchor];
        v48 = [(SBHPopoverView *)v5 bottomAnchor];
        v49 = v35;
        v47 = objc_msgSend(v35, "constraintEqualToAnchor:");
        v55[1] = v47;
        v36 = [v6 leadingAnchor];
        v45 = [(SBHPopoverView *)v5 leadingAnchor];
        v46 = v36;
        v44 = objc_msgSend(v36, "constraintEqualToAnchor:");
        v55[2] = v44;
        v37 = [v6 trailingAnchor];
        v42 = [(SBHPopoverView *)v5 trailingAnchor];
        v43 = v37;
        v41 = objc_msgSend(v37, "constraintEqualToAnchor:constant:", -12.0);
        v55[3] = v41;
        v18 = [v53 centerXAnchor];
        v19 = [v6 trailingAnchor];
        v20 = [v18 constraintEqualToAnchor:v19];
        v55[4] = v20;
        v21 = [v53 centerYAnchor];
        v22 = [v6 centerYAnchor];
        v23 = [v21 constraintEqualToAnchor:v22];
        v55[5] = v23;
        v24 = (void *)MEMORY[0x1E4F1C978];
        v25 = v55;
LABEL_7:
        v38 = [v24 arrayWithObjects:v25 count:6];
        [v40 activateConstraints:v38];

        break;
      default:
        break;
    }
  }
  return v5;
}

- (id)_arrowViewForArrowLocation:(int64_t)a3 arrowSize:(double)a4
{
  v7 = (void *)MEMORY[0x1E4FB1818];
  v8 = SBHBundle();
  v9 = [v7 imageNamed:@"PopoverArrow" inBundle:v8];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
  v11 = [(SBHPopoverView *)self _createBackgroundView];
  [v11 setMaskView:v10];
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, a4, a4);
  objc_msgSend(v11, "setFrame:", 0.0, 0.0, a4, a4);
  if (a3 == 3 || a3 == 2) {
    [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  }
  memset(&v15, 0, sizeof(v15));
  BSDegreesToRadians();
  CGAffineTransformMakeRotation(&v15, v12);
  CGAffineTransform v14 = v15;
  [v11 setTransform:&v14];

  return v11;
}

- (id)_createBackgroundView
{
  v2 = +[SBIconView componentBackgroundView];
  [v2 _setOverrideUserInterfaceStyle:2];
  return v2;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end