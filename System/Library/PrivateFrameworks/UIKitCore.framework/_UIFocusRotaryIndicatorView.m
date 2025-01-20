@interface _UIFocusRotaryIndicatorView
+ (id)createRotaryIndicatorInView:(id)a3;
- (CGAffineTransform)_transformForWheelPosition:(SEL)a3;
- (_UIFocusRotaryIndicatorView)initWithFrame:(CGRect)a3;
- (unint64_t)_calculateCurrentRotaryAxis;
- (void)_updateArrowDisplay;
- (void)_updateArrowsForCurrentFocus;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)showArrowsForAxis:(unint64_t)a3;
- (void)toggleVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)updateFailedMovementHeading:(unint64_t)a3;
- (void)updateWheelPosition:(double)a3;
@end

@implementation _UIFocusRotaryIndicatorView

+ (id)createRotaryIndicatorInView:(id)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_11_1, @"RotaryFocusRingDiameter", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v4 = 80.0; {
  else
  }
    double v4 = *(double *)&qword_1EB257B80;
  int v5 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257BC8, @"RotaryFocusRingInset", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v6 = *(double *)&qword_1EB257BD0 + *(double *)&qword_1EB257BD0;
  if (v5) {
    double v6 = 44.0;
  }
  double v7 = v4 + v6;
  v8 = -[_UIFocusRotaryIndicatorView initWithFrame:]([_UIFocusRotaryIndicatorView alloc], "initWithFrame:", 0.0, 0.0, v7, v7);
  [(_UIFocusRotaryIndicatorView *)v8 toggleVisible:0 animated:0];
  [(UIView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v8 setUserInteractionEnabled:0];
  v9 = [(UIView *)v8 layer];
  [v9 setZPosition:100.0];

  [v3 addSubview:v8];
  v23 = (void *)MEMORY[0x1E4F5B268];
  v26 = [(UIView *)v8 widthAnchor];
  v25 = [v26 constraintEqualToConstant:v7];
  v27[0] = v25;
  v24 = [(UIView *)v8 heightAnchor];
  v10 = [v24 constraintEqualToConstant:v7];
  v27[1] = v10;
  v11 = [(UIView *)v8 topAnchor];
  v12 = [v3 topAnchor];
  int v13 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257BB8, @"RotaryFocusRingMargin", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v14 = *(double *)&qword_1EB257BC0;
  if (v13) {
    double v14 = 40.0;
  }
  v15 = [v11 constraintEqualToAnchor:v12 constant:v14];
  v27[2] = v15;
  v16 = [v3 trailingAnchor];

  v17 = [(UIView *)v8 trailingAnchor];
  int v18 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257BB8, @"RotaryFocusRingMargin", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v19 = *(double *)&qword_1EB257BC0;
  if (v18) {
    double v19 = 40.0;
  }
  v20 = [v16 constraintEqualToAnchor:v17 constant:v19];
  v27[3] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  [v23 activateConstraints:v21];

  return v8;
}

- (_UIFocusRotaryIndicatorView)initWithFrame:(CGRect)a3
{
  v142[20] = *MEMORY[0x1E4F143B8];
  v141.receiver = self;
  v141.super_class = (Class)_UIFocusRotaryIndicatorView;
  id v3 = -[UIView initWithFrame:](&v141, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_visible = 1;
    int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__updateArrowsForCurrentFocus name:@"UIFocusDidUpdateNotification" object:0];

    if (_UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_11_1, @"RotaryFocusRingDiameter", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v6 = 80.0; {
    else
    }
      double v6 = *(double *)&qword_1EB257B80;
    int v7 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257B88, @"RotaryFocusRingBorderWidth", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v8 = *(double *)&qword_1EB257B90 + *(double *)&qword_1EB257B90;
    if (v7) {
      double v8 = 32.0;
    }
    double v9 = v6 - v8;
    v10 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, v9, v9);
    rotaryScrubCenterPunchout = v4->_rotaryScrubCenterPunchout;
    v4->_rotaryScrubCenterPunchout = v10;

    v12 = v4->_rotaryScrubCenterPunchout;
    int v13 = +[UIColor blackColor];
    [(UIView *)v12 setBackgroundColor:v13];

    double v14 = [(UIView *)v4->_rotaryScrubCenterPunchout layer];
    v15 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
    [v14 setCompositingFilter:v15];

    [(UIView *)v4->_rotaryScrubCenterPunchout setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4 addSubview:v4->_rotaryScrubCenterPunchout];
    v16 = objc_alloc_init(UIView);
    roundPointerView = v4->_roundPointerView;
    v4->_roundPointerView = v16;

    int v18 = v4->_roundPointerView;
    double v19 = +[UIColor whiteColor];
    [(UIView *)v18 setBackgroundColor:v19];

    v20 = [(UIView *)v4->_roundPointerView layer];
    int v21 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257BA8, @"RotaryFocusRingPointerDiameter", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v22 = *(double *)&qword_1EB257BB0 * 0.5;
    if (v21) {
      double v22 = 12.0;
    }
    [v20 setCornerRadius:v22];

    [(UIView *)v4->_roundPointerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(UIView *)v4->_roundPointerView layer];
    _UIFocusRotaryRingConfigureShadowForLayer(v23);

    [(UIView *)v4 addSubview:v4->_roundPointerView];
    v24 = objc_alloc_init(UIView);
    ringView = v4->_ringView;
    v4->_ringView = v24;

    id v26 = +[UIColor whiteColor];
    uint64_t v27 = [v26 CGColor];
    v28 = [(UIView *)v4->_ringView layer];
    [v28 setBorderColor:v27];

    if (_UIInternalPreferenceUsesDefault((int *)algn_1EB257B88, @"RotaryFocusRingBorderWidth", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v29 = 16.0; {
    else
    }
      double v29 = *(double *)&qword_1EB257B90;
    v30 = [(UIView *)v4->_ringView layer];
    [v30 setBorderWidth:v29];

    if (_UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_11_1, @"RotaryFocusRingDiameter", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v31 = 40.0; {
    else
    }
      double v31 = *(double *)&qword_1EB257B80 * 0.5;
    v32 = [(UIView *)v4->_ringView layer];
    [v32 setCornerRadius:v31];

    [(UIView *)v4->_ringView setTranslatesAutoresizingMaskIntoConstraints:0];
    v33 = [(UIView *)v4->_ringView layer];
    _UIFocusRotaryRingConfigureShadowForLayer(v33);

    [(UIView *)v4 addSubview:v4->_ringView];
    v34 = [UIView alloc];
    [(UIView *)v4 bounds];
    double v36 = v35;
    [(UIView *)v4 bounds];
    uint64_t v37 = -[UIView initWithFrame:](v34, "initWithFrame:", 0.0, 0.0, v36);
    fingerPositionContainerView = v4->_fingerPositionContainerView;
    v4->_fingerPositionContainerView = (UIView *)v37;

    [(UIView *)v4->_fingerPositionContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4 addSubview:v4->_fingerPositionContainerView];
    v39 = objc_alloc_init(UIView);
    fingerPositionView = v4->_fingerPositionView;
    v4->_fingerPositionView = v39;

    v41 = v4->_fingerPositionView;
    v42 = +[UIColor blackColor];
    [(UIView *)v41 setBackgroundColor:v42];

    v43 = [(UIView *)v4->_fingerPositionView layer];
    int v44 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257B98, @"RotaryFocusRingFingerPositionDiameter", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v45 = *(double *)&qword_1EB257BA0 * 0.5;
    if (v44) {
      double v45 = 6.0;
    }
    [v43 setCornerRadius:v45];

    [(UIView *)v4->_fingerPositionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_fingerPositionContainerView addSubview:v4->_fingerPositionView];
    uint64_t v46 = +[UIColor whiteColor];
    if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB257BD8, @"RotaryFocusRingArrowWidth", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v47 = 40.0; {
    else
    }
      double v47 = *(double *)&qword_1EB257BE0;
    if (_UIInternalPreferenceUsesDefault((int *)algn_1EB257BE8, @"RotaryFocusRingArrowHeight", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v48 = 14.0; {
    else
    }
      double v48 = *(double *)&qword_1EB257BF0;
    v49 = -[_UIFocusRotaryRingArrowView initWithFrame:color:]([_UIFocusRotaryRingArrowView alloc], "initWithFrame:color:", v46, 0.0, 0.0, v47, v48);
    upArrow = v4->_upArrow;
    v4->_upArrow = v49;

    [(UIView *)v4 addSubview:v4->_upArrow];
    v51 = -[_UIFocusRotaryRingArrowView initWithFrame:color:]([_UIFocusRotaryRingArrowView alloc], "initWithFrame:color:", v46, 0.0, 0.0, v47, v48);
    downArrow = v4->_downArrow;
    v4->_downArrow = v51;

    CGAffineTransformMakeRotation(&v140, 3.14159265);
    v53 = v4->_downArrow;
    CGAffineTransform v139 = v140;
    [(UIView *)v53 setTransform:&v139];
    [(UIView *)v4 addSubview:v4->_downArrow];
    v134 = (void *)v46;
    v54 = -[_UIFocusRotaryRingArrowView initWithFrame:color:]([_UIFocusRotaryRingArrowView alloc], "initWithFrame:color:", v46, 0.0, 0.0, v47, v48);
    leftArrow = v4->_leftArrow;
    v4->_leftArrow = v54;

    CGAffineTransformMakeRotation(&v138, 4.71238898);
    v56 = v4->_leftArrow;
    CGAffineTransform v137 = v138;
    [(UIView *)v56 setTransform:&v137];
    [(UIView *)v4 addSubview:v4->_leftArrow];
    v57 = -[_UIFocusRotaryRingArrowView initWithFrame:color:]([_UIFocusRotaryRingArrowView alloc], "initWithFrame:color:", v46, 0.0, 0.0, v47, v48);
    rightArrow = v4->_rightArrow;
    v4->_rightArrow = v57;

    CGAffineTransformMakeRotation(&v136, 1.57079633);
    v59 = v4->_rightArrow;
    CGAffineTransform v135 = v136;
    [(UIView *)v59 setTransform:&v135];
    [(UIView *)v4 addSubview:v4->_rightArrow];
    v133 = [(UIView *)v4->_rotaryScrubCenterPunchout centerXAnchor];
    v132 = [(UIView *)v4 centerXAnchor];
    v131 = [v133 constraintEqualToAnchor:v132];
    v142[0] = v131;
    v130 = [(UIView *)v4->_rotaryScrubCenterPunchout centerYAnchor];
    v129 = [(UIView *)v4 centerYAnchor];
    v128 = [v130 constraintEqualToAnchor:v129];
    v142[1] = v128;
    v126 = [(UIView *)v4->_rotaryScrubCenterPunchout widthAnchor];
    v125 = [v126 constraintEqualToConstant:v9];
    v142[2] = v125;
    v124 = [(UIView *)v4->_rotaryScrubCenterPunchout heightAnchor];
    v123 = [v124 constraintEqualToConstant:v9];
    v142[3] = v123;
    v60 = [(UIView *)v4->_roundPointerView widthAnchor];
    v122 = v60;
    int v61 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257BA8, @"RotaryFocusRingPointerDiameter", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v62 = *(double *)&qword_1EB257BB0;
    if (v61) {
      double v62 = 24.0;
    }
    v121 = [v60 constraintEqualToConstant:v62];
    v142[4] = v121;
    v63 = [(UIView *)v4->_roundPointerView heightAnchor];
    v120 = v63;
    int v64 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257BA8, @"RotaryFocusRingPointerDiameter", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v65 = *(double *)&qword_1EB257BB0;
    if (v64) {
      double v65 = 24.0;
    }
    v127 = [v63 constraintEqualToConstant:v65];
    v142[5] = v127;
    v119 = [(UIView *)v4->_roundPointerView centerXAnchor];
    v118 = [(UIView *)v4 centerXAnchor];
    v117 = [v119 constraintEqualToAnchor:v118];
    v142[6] = v117;
    v116 = [(UIView *)v4->_roundPointerView centerYAnchor];
    v115 = [(UIView *)v4 centerYAnchor];
    v114 = [v116 constraintEqualToAnchor:v115];
    v142[7] = v114;
    v66 = [(UIView *)v4->_ringView widthAnchor];
    v113 = v66;
    int v67 = _UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_11_1, @"RotaryFocusRingDiameter", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v68 = *(double *)&qword_1EB257B80;
    if (v67) {
      double v68 = 80.0;
    }
    v112 = [v66 constraintEqualToConstant:v68];
    v142[8] = v112;
    v69 = [(UIView *)v4->_ringView heightAnchor];
    v111 = v69;
    int v70 = _UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_11_1, @"RotaryFocusRingDiameter", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v71 = *(double *)&qword_1EB257B80;
    if (v70) {
      double v71 = 80.0;
    }
    v110 = [v69 constraintEqualToConstant:v71];
    v142[9] = v110;
    v109 = [(UIView *)v4->_ringView centerXAnchor];
    v108 = [(UIView *)v4 centerXAnchor];
    v107 = [v109 constraintEqualToAnchor:v108];
    v142[10] = v107;
    v106 = [(UIView *)v4->_ringView centerYAnchor];
    v105 = [(UIView *)v4 centerYAnchor];
    v104 = [v106 constraintEqualToAnchor:v105];
    v142[11] = v104;
    v103 = [(UIView *)v4->_fingerPositionContainerView widthAnchor];
    v102 = [(UIView *)v4 widthAnchor];
    v101 = [v103 constraintEqualToAnchor:v102];
    v142[12] = v101;
    v100 = [(UIView *)v4->_fingerPositionContainerView heightAnchor];
    v99 = [(UIView *)v4 heightAnchor];
    v98 = [v100 constraintEqualToAnchor:v99];
    v142[13] = v98;
    v97 = [(UIView *)v4->_fingerPositionContainerView centerXAnchor];
    v96 = [(UIView *)v4 centerXAnchor];
    v95 = [v97 constraintEqualToAnchor:v96];
    v142[14] = v95;
    v94 = [(UIView *)v4->_fingerPositionContainerView centerYAnchor];
    v93 = [(UIView *)v4 centerYAnchor];
    v92 = [v94 constraintEqualToAnchor:v93];
    v142[15] = v92;
    v72 = [(UIView *)v4->_fingerPositionView widthAnchor];
    v91 = v72;
    int v73 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257B98, @"RotaryFocusRingFingerPositionDiameter", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v74 = *(double *)&qword_1EB257BA0;
    if (v73) {
      double v74 = 12.0;
    }
    v90 = [v72 constraintEqualToConstant:v74];
    v142[16] = v90;
    v75 = [(UIView *)v4->_fingerPositionView heightAnchor];
    int v76 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257B98, @"RotaryFocusRingFingerPositionDiameter", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v77 = *(double *)&qword_1EB257BA0;
    if (v76) {
      double v77 = 12.0;
    }
    v78 = [v75 constraintEqualToConstant:v77];
    v142[17] = v78;
    v79 = [(UIView *)v4->_fingerPositionView centerXAnchor];
    v80 = [(UIView *)v4->_fingerPositionContainerView centerXAnchor];
    v81 = [v79 constraintEqualToAnchor:v80];
    v142[18] = v81;
    v82 = [(UIView *)v4->_fingerPositionView centerYAnchor];
    v83 = [(UIView *)v4->_fingerPositionContainerView centerYAnchor];
    if (_UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_11_1, @"RotaryFocusRingDiameter", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v84 = 80.0; {
    else
    }
      double v84 = *(double *)&qword_1EB257B80;
    int v85 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257B88, @"RotaryFocusRingBorderWidth", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v86 = *(double *)&qword_1EB257B90;
    if (v85) {
      double v86 = 16.0;
    }
    v87 = [v82 constraintEqualToAnchor:v83 constant:(v84 - v86) * -0.5];
    v142[19] = v87;
    v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:20];

    [MEMORY[0x1E4F5B268] activateConstraints:v88];
  }
  return v4;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIFocusDidUpdateNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIFocusRotaryIndicatorView;
  [(UIView *)&v4 dealloc];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusRotaryIndicatorView;
  [(UIView *)&v3 didMoveToWindow];
  [(_UIFocusRotaryIndicatorView *)self _updateArrowsForCurrentFocus];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusRotaryIndicatorView;
  [(UIView *)&v12 layoutSubviews];
  [(UIView *)self bounds];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v14);
  _UIInternalPreferenceUsesDefault((int *)&unk_1EB257BD8, @"RotaryFocusRingArrowWidth", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  int v9 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257BE8, @"RotaryFocusRingArrowHeight", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v10 = *(double *)&qword_1EB257BF0 * 0.5;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v15);
  if (v9) {
    double v10 = 7.0;
  }
  -[UIView setCenter:](self->_upArrow, "setCenter:", MidX, MinY + v10);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  -[UIView setCenter:](self->_downArrow, "setCenter:", MidX, CGRectGetMaxY(v16) - v10);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  -[UIView setCenter:](self->_leftArrow, "setCenter:", v10 + CGRectGetMinX(v17), MidY);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  -[UIView setCenter:](self->_rightArrow, "setCenter:", CGRectGetMaxX(v18) - v10, MidY);
}

- (void)updateFailedMovementHeading:(unint64_t)a3
{
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_RotaryFocusRingHidesArrowsOnFailedMovement, @"RotaryFocusRingHidesArrowsOnFailedMovement", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1E8FD567C)
  {
    self->_failedMovementHeading = a3;
    [(_UIFocusRotaryIndicatorView *)self _updateArrowDisplay];
  }
}

- (void)showArrowsForAxis:(unint64_t)a3
{
  self->_activeAxis = a3;
  [(_UIFocusRotaryIndicatorView *)self _updateArrowDisplay];
}

- (void)_updateArrowDisplay
{
  unint64_t activeAxis = self->_activeAxis;
  if ((activeAxis & 2) != 0)
  {
    [(UIView *)self->_upArrow setHidden:self->_failedMovementHeading & 1];
    uint64_t v4 = (LOBYTE(self->_failedMovementHeading) >> 1) & 1;
  }
  else
  {
    uint64_t v4 = 1;
    [(UIView *)self->_upArrow setHidden:1];
  }
  [(UIView *)self->_downArrow setHidden:v4];
  if (activeAxis)
  {
    [(UIView *)self->_leftArrow setHidden:(self->_failedMovementHeading >> 2) & 1];
    uint64_t v5 = (LOBYTE(self->_failedMovementHeading) >> 3) & 1;
  }
  else
  {
    uint64_t v5 = 1;
    [(UIView *)self->_leftArrow setHidden:1];
  }
  rightArrow = self->_rightArrow;
  [(UIView *)rightArrow setHidden:v5];
}

- (void)toggleVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_visible == a3)
  {
    if (self->_rotaryScrubHideAnimator)
    {
      BOOL v5 = 0;
      if (a4) {
        return;
      }
    }
    else
    {
      BOOL v5 = self->_rotaryScrubUnhideAnimator == 0;
      if (a4) {
        return;
      }
    }
    if (v5) {
      return;
    }
  }
  self->_visible = a3;
  if (a4)
  {
    if (a3)
    {
      memset(&v47, 0, sizeof(v47));
      [(_UIFocusRotaryIndicatorView *)self _transformForWheelPosition:self->_wheelPosition];
      memset(&v46, 0, sizeof(v46));
      CGAffineTransform v45 = v47;
      CGAffineTransformRotate(&v46, &v45, -3.92699082);
      memset(&v45, 0, sizeof(v45));
      if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RotaryFocusRingHiddenScale, @"RotaryFocusRingHiddenScale", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v6 = 0.1; {
      else
      }
        double v6 = *(double *)&qword_1E8FD5688;
      if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RotaryFocusRingHiddenScale, @"RotaryFocusRingHiddenScale", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v7 = 0.1; {
      else
      }
        double v7 = *(double *)&qword_1E8FD5688;
      CGAffineTransformMakeScale(&v45, v6, v7);
      rotaryScrubHideAnimator = self->_rotaryScrubHideAnimator;
      if (!rotaryScrubHideAnimator)
      {
        fingerPositionContainerView = self->_fingerPositionContainerView;
        CGAffineTransform v44 = v46;
        [(UIView *)fingerPositionContainerView setTransform:&v44];
        CGAffineTransform v44 = v45;
        [(UIView *)self setTransform:&v44];
        double v10 = [(UIView *)self->_rotaryScrubCenterPunchout layer];
        v11 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
        [v10 setCompositingFilter:v11];

        rotaryScrubHideAnimator = self->_rotaryScrubHideAnimator;
      }
      [(UIViewPropertyAnimator *)rotaryScrubHideAnimator stopAnimation:1];
      objc_super v12 = self->_rotaryScrubHideAnimator;
      self->_rotaryScrubHideAnimator = 0;

      CGRect v13 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 160.0, 16.0, 0.0, 0.0);
      CGRect v14 = [UIViewPropertyAnimator alloc];
      [(UISpringTimingParameters *)v13 settlingDuration];
      CGRect v15 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v14, "initWithDuration:timingParameters:", v13);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke;
      v43[3] = &unk_1E52D9F70;
      v43[4] = self;
      [(UIViewPropertyAnimator *)v15 addAnimations:v43];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_3;
      v42[3] = &unk_1E52DC698;
      v42[4] = self;
      [(UIViewPropertyAnimator *)v15 addCompletion:v42];
      CGRect v16 = [UIViewPropertyAnimator alloc];
      [(UISpringTimingParameters *)v13 settlingDuration];
      CGRect v17 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v16, "initWithDuration:timingParameters:", v13);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      CGAffineTransform v41 = v46;
      v40[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_4;
      v40[3] = &unk_1E52E7948;
      v40[4] = self;
      [(UIViewPropertyAnimator *)v17 addAnimations:v40];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_5;
      v39[3] = &unk_1E52D9F70;
      v39[4] = self;
      [(UIViewPropertyAnimator *)v17 addAnimations:v39 delayFactor:0.15];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_6;
      v38[3] = &unk_1E52DC698;
      v38[4] = self;
      [(UIViewPropertyAnimator *)v17 addCompletion:v38];
      rotaryScrubUnhideAnimator = self->_rotaryScrubUnhideAnimator;
      self->_rotaryScrubUnhideAnimator = v15;
      double v19 = v15;

      rotaryScrubBackwardsFingerPositionAnimator = self->_rotaryScrubBackwardsFingerPositionAnimator;
      self->_rotaryScrubBackwardsFingerPositionAnimator = v17;
      int v21 = v17;

      [(UIViewPropertyAnimator *)v19 startAnimation];
      [(UIViewPropertyAnimator *)v21 startAnimation];
    }
    else
    {
      CGRect v13 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 1.0, 160.0, 16.0, 0.0, 0.0);
      double v29 = [UIViewPropertyAnimator alloc];
      [(UISpringTimingParameters *)v13 settlingDuration];
      v30 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v29, "initWithDuration:timingParameters:", v13);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_7;
      v37[3] = &unk_1E52D9F70;
      v37[4] = self;
      [(UIViewPropertyAnimator *)v30 addAnimations:v37];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __54___UIFocusRotaryIndicatorView_toggleVisible_animated___block_invoke_8;
      v36[3] = &unk_1E52DC698;
      v36[4] = self;
      [(UIViewPropertyAnimator *)v30 addCompletion:v36];
      double v31 = self->_rotaryScrubHideAnimator;
      self->_rotaryScrubHideAnimator = v30;
      v32 = v30;

      [(UIViewPropertyAnimator *)v32 startAnimation];
    }
  }
  else
  {
    [(UIViewPropertyAnimator *)self->_rotaryScrubHideAnimator stopAnimation:1];
    double v22 = self->_rotaryScrubHideAnimator;
    self->_rotaryScrubHideAnimator = 0;

    [(UIViewPropertyAnimator *)self->_rotaryScrubUnhideAnimator stopAnimation:1];
    v23 = self->_rotaryScrubUnhideAnimator;
    self->_rotaryScrubUnhideAnimator = 0;

    [(UIViewPropertyAnimator *)self->_rotaryScrubBackwardsFingerPositionAnimator stopAnimation:1];
    v24 = self->_rotaryScrubBackwardsFingerPositionAnimator;
    self->_rotaryScrubBackwardsFingerPositionAnimator = 0;

    if (self->_visible)
    {
      v25 = self->_fingerPositionContainerView;
      [(_UIFocusRotaryIndicatorView *)self _transformForWheelPosition:self->_wheelPosition];
      [(UIView *)v25 setTransform:v35];
      long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v47.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v47.c = v26;
      *(_OWORD *)&v47.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIView *)self setTransform:&v47];
      [(UIView *)self setAlpha:1.0];
      uint64_t v27 = [(UIView *)self->_rotaryScrubCenterPunchout layer];
      v28 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A098]];
      [v27 setCompositingFilter:v28];
    }
    else
    {
      memset(&v47, 0, sizeof(v47));
      if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RotaryFocusRingHiddenScale, @"RotaryFocusRingHiddenScale", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v33 = 0.1; {
      else
      }
        double v33 = *(double *)&qword_1E8FD5688;
      if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_RotaryFocusRingHiddenScale, @"RotaryFocusRingHiddenScale", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v34 = 0.1; {
      else
      }
        double v34 = *(double *)&qword_1E8FD5688;
      CGAffineTransformMakeScale(&v47, v33, v34);
      CGAffineTransform v46 = v47;
      [(UIView *)self setTransform:&v46];
      [(UIView *)self setAlpha:0.0];
      uint64_t v27 = [(UIView *)self->_rotaryScrubCenterPunchout layer];
      [v27 setCompositingFilter:0];
    }
  }
}

- (void)updateWheelPosition:(double)a3
{
  if (self->_wheelPosition != a3)
  {
    self->_wheelPosition = a3;
    if (self->_visible)
    {
      rotaryScrubBackwardsFingerPositionAnimator = self->_rotaryScrubBackwardsFingerPositionAnimator;
      if (rotaryScrubBackwardsFingerPositionAnimator)
      {
        [(UIViewPropertyAnimator *)rotaryScrubBackwardsFingerPositionAnimator stopAnimation:0];
        [(UIViewPropertyAnimator *)self->_rotaryScrubBackwardsFingerPositionAnimator finishAnimationAtPosition:0];
      }
      long long v8 = 0u;
      long long v9 = 0u;
      long long v7 = 0u;
      [(_UIFocusRotaryIndicatorView *)self _transformForWheelPosition:a3];
      v6[0] = v7;
      v6[1] = v8;
      v6[2] = v9;
      [(UIView *)self->_fingerPositionContainerView setTransform:v6];
    }
  }
}

- (CGAffineTransform)_transformForWheelPosition:(SEL)a3
{
  return CGAffineTransformMakeRotation(retstr, (a4 + a4) * 3.14159265);
}

- (void)_updateArrowsForCurrentFocus
{
  unint64_t v3 = [(_UIFocusRotaryIndicatorView *)self _calculateCurrentRotaryAxis];
  [(_UIFocusRotaryIndicatorView *)self showArrowsForAxis:v3];
}

- (unint64_t)_calculateCurrentRotaryAxis
{
  v2 = +[UIFocusSystem focusSystemForEnvironment:self];
  unint64_t v3 = [v2 focusedItem];
  if (v3)
  {
    uint64_t v4 = +[_UIFocusItemInfo infoWithItem:v3];
    uint64_t v5 = [v4 rotaryFocusMovementAxis];
    if ((unint64_t)(v5 - 1) > 2) {
      unint64_t v6 = 0;
    }
    else {
      unint64_t v6 = qword_186B9E850[v5 - 1];
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftArrow, 0);
  objc_storeStrong((id *)&self->_downArrow, 0);
  objc_storeStrong((id *)&self->_rightArrow, 0);
  objc_storeStrong((id *)&self->_upArrow, 0);
  objc_storeStrong((id *)&self->_rotaryScrubBackwardsFingerPositionAnimator, 0);
  objc_storeStrong((id *)&self->_rotaryScrubUnhideAnimator, 0);
  objc_storeStrong((id *)&self->_rotaryScrubHideAnimator, 0);
  objc_storeStrong((id *)&self->_rotaryScrubCenterPunchout, 0);
  objc_storeStrong((id *)&self->_roundPointerView, 0);
  objc_storeStrong((id *)&self->_fingerPositionView, 0);
  objc_storeStrong((id *)&self->_fingerPositionContainerView, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
}

@end