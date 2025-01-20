@interface PXFloatingCardViewController
- (BOOL)_canShowWhileLocked;
- (CGRect)grabAreaBounds;
- (CGSize)size;
- (NSLayoutConstraint)heightConstraint;
- (PXFloatingCardViewController)initWithCoder:(id)a3;
- (PXFloatingCardViewController)initWithContentViewController:(id)a3;
- (PXFloatingCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXFloatingCardViewControllerDelegate)delegate;
- (UILabel)headerLabel;
- (UIView)backgroundView;
- (UIView)contentView;
- (UIView)grabberFooterView;
- (UIView)headerView;
- (UIViewController)contentViewController;
- (UIVisualEffectView)backgroundVisualEffectView;
- (_UIGrabber)grabber;
- (id)_systemFontWithTextStyle:(int64_t)a3 weight:(double)a4;
- (void)_dismissTapped;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)removeFromParentViewController;
- (void)setBackgroundVisualEffectView:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGrabber:(id)a3;
- (void)setHeaderLabel:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation PXFloatingCardViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_destroyWeak((id *)&self->_contentViewController);
  objc_storeStrong((id *)&self->_grabber, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_grabberFooterView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setContentViewController:(id)a3
{
}

- (UIViewController)contentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setGrabber:(id)a3
{
}

- (_UIGrabber)grabber
{
  return self->_grabber;
}

- (void)setHeaderLabel:(id)a3
{
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return self->_backgroundVisualEffectView;
}

- (void)setHeaderView:(id)a3
{
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setDelegate:(id)a3
{
}

- (PXFloatingCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXFloatingCardViewControllerDelegate *)WeakRetained;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIView)grabberFooterView
{
  return self->_grabberFooterView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v5 = [(PXFloatingCardViewController *)self _systemFontWithTextStyle:3 weight:*MEMORY[0x1E4FB09E0]];
  v4 = [(PXFloatingCardViewController *)self headerLabel];
  [v4 setFont:v5];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)backgroundView
{
  return (UIView *)self->_backgroundVisualEffectView;
}

- (CGRect)grabAreaBounds
{
  v3 = [(PXFloatingCardViewController *)self backgroundView];
  [v3 frame];
  CGFloat v4 = CGRectGetMaxY(v11) + -60.0;
  id v5 = [(PXFloatingCardViewController *)self backgroundView];
  [v5 bounds];
  CGFloat Width = CGRectGetWidth(v12);

  double v7 = 60.0;
  double v8 = 0.0;
  double v9 = v4;
  double v10 = Width;
  result.size.double height = v7;
  result.size.double width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_size.width != a3.width || self->_size.height != a3.height)
  {
    self->_size = a3;
    double v7 = [(PXFloatingCardViewController *)self view];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;

    id v12 = [(PXFloatingCardViewController *)self view];
    objc_msgSend(v12, "setFrame:", v9, v11, width, height);
  }
}

- (PXFloatingCardViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFloatingCardViewController.m", 197, @"%s is not available as initializer", "-[PXFloatingCardViewController initWithCoder:]");

  abort();
}

- (PXFloatingCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFloatingCardViewController.m", 193, @"%s is not available as initializer", "-[PXFloatingCardViewController initWithNibName:bundle:]");

  abort();
}

- (void)_dismissTapped
{
  id v3 = [(PXFloatingCardViewController *)self delegate];
  [v3 floatingCardViewControllerDismissTapped:self];
}

- (void)removeFromParentViewController
{
  id v3 = [(PXFloatingCardViewController *)self contentViewController];
  [v3 willMoveToParentViewController:0];

  CGFloat v4 = [(PXFloatingCardViewController *)self contentViewController];
  id v5 = [v4 view];
  [v5 removeFromSuperview];

  v6 = [(PXFloatingCardViewController *)self contentViewController];
  [v6 removeFromParentViewController];

  v7.receiver = self;
  v7.super_class = (Class)PXFloatingCardViewController;
  [(PXFloatingCardViewController *)&v7 removeFromParentViewController];
}

- (id)_systemFontWithTextStyle:(int64_t)a3 weight:(double)a4
{
}

- (PXFloatingCardViewController)initWithContentViewController:(id)a3
{
  v203[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v194.receiver = self;
  v194.super_class = (Class)PXFloatingCardViewController;
  id v5 = [(PXFloatingCardViewController *)&v194 initWithNibName:0 bundle:0];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4FB1618] blackColor];
    id obj = v4;
    uint64_t v7 = [v6 CGColor];
    id v8 = [(PXFloatingCardViewController *)v5 view];
    double v9 = [v8 layer];
    [v9 setShadowColor:v7];

    double v10 = [(PXFloatingCardViewController *)v5 view];
    double v11 = [v10 layer];
    LODWORD(v12) = 1036831949;
    [v11 setShadowOpacity:v12];

    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v15 = [(PXFloatingCardViewController *)v5 view];
    v16 = [v15 layer];
    objc_msgSend(v16, "setShadowOffset:", v13, v14);

    v17 = [(PXFloatingCardViewController *)v5 view];
    v18 = [v17 layer];
    [v18 setShadowRadius:5.0];

    v19 = [MEMORY[0x1E4FB1618] clearColor];
    v20 = [(PXFloatingCardViewController *)v5 view];
    [v20 setBackgroundColor:v19];

    v21 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    backgroundVisualEffectView = v5->_backgroundVisualEffectView;
    v5->_backgroundVisualEffectView = v21;

    v23 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
    [(UIVisualEffectView *)v5->_backgroundVisualEffectView setEffect:v23];

    v24 = [(UIVisualEffectView *)v5->_backgroundVisualEffectView layer];
    [v24 setCornerRadius:10.0];

    v25 = [(UIVisualEffectView *)v5->_backgroundVisualEffectView layer];
    [v25 setMasksToBounds:1];

    v26 = [(PXFloatingCardViewController *)v5 view];
    [v26 addSubview:v5->_backgroundVisualEffectView];

    [(UIVisualEffectView *)v5->_backgroundVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    v147 = (void *)MEMORY[0x1E4F28DC8];
    v181 = [(UIVisualEffectView *)v5->_backgroundVisualEffectView topAnchor];
    v189 = [(PXFloatingCardViewController *)v5 view];
    v177 = [v189 topAnchor];
    v169 = [v181 constraintEqualToAnchor:v177];
    v203[0] = v169;
    v155 = [(UIVisualEffectView *)v5->_backgroundVisualEffectView bottomAnchor];
    v162 = [(PXFloatingCardViewController *)v5 view];
    v150 = [v162 bottomAnchor];
    v144 = [v155 constraintEqualToAnchor:v150];
    v203[1] = v144;
    v27 = [(UIVisualEffectView *)v5->_backgroundVisualEffectView leadingAnchor];
    v28 = [(PXFloatingCardViewController *)v5 view];
    v29 = [v28 leadingAnchor];
    v30 = [v27 constraintEqualToAnchor:v29];
    v203[2] = v30;
    v31 = [(UIVisualEffectView *)v5->_backgroundVisualEffectView trailingAnchor];
    v32 = [(PXFloatingCardViewController *)v5 view];
    v33 = [v32 trailingAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];
    v203[3] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v203 count:4];
    [v147 activateConstraints:v35];

    id v36 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v37 = *MEMORY[0x1E4F1DB28];
    double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v40 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v41 = objc_msgSend(v36, "initWithFrame:", *MEMORY[0x1E4F1DB28], v38, v39, v40);
    contentView = v5->_contentView;
    v5->_contentView = (UIView *)v41;

    v43 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v5->_grabberFooterView setBackgroundColor:v43];

    [(UIView *)v5->_contentView setClipsToBounds:1];
    v44 = [(UIVisualEffectView *)v5->_backgroundVisualEffectView contentView];
    [v44 addSubview:v5->_contentView];

    [(UIView *)v5->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v151 = (void *)MEMORY[0x1E4F28DC8];
    v170 = [(UIView *)v5->_contentView topAnchor];
    v178 = [(PXFloatingCardViewController *)v5 backgroundView];
    v163 = [v178 topAnchor];
    v156 = [v170 constraintEqualToAnchor:v163];
    v202[0] = v156;
    v45 = [(UIView *)v5->_contentView leadingAnchor];
    v46 = [(PXFloatingCardViewController *)v5 backgroundView];
    v47 = [v46 leadingAnchor];
    v48 = [v45 constraintEqualToAnchor:v47];
    v202[1] = v48;
    v49 = [(UIView *)v5->_contentView trailingAnchor];
    v50 = [(PXFloatingCardViewController *)v5 backgroundView];
    v51 = [v50 trailingAnchor];
    v52 = [v49 constraintEqualToAnchor:v51];
    v202[2] = v52;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v202 count:3];
    [v151 activateConstraints:v53];

    uint64_t v54 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v37, v38, v39, v40);
    grabberFooterView = v5->_grabberFooterView;
    v5->_grabberFooterView = (UIView *)v54;

    [(UIView *)v5->_grabberFooterView setTranslatesAutoresizingMaskIntoConstraints:0];
    v56 = [(UIVisualEffectView *)v5->_backgroundVisualEffectView contentView];
    [v56 addSubview:v5->_grabberFooterView];

    v145 = (void *)MEMORY[0x1E4F28DC8];
    v186 = [(UIView *)v5->_grabberFooterView topAnchor];
    v179 = [(UIView *)v5->_contentView bottomAnchor];
    v171 = [v186 constraintEqualToAnchor:v179];
    v201[0] = v171;
    v157 = [(UIView *)v5->_grabberFooterView bottomAnchor];
    v164 = [(PXFloatingCardViewController *)v5 backgroundView];
    v152 = [v164 bottomAnchor];
    v148 = [v157 constraintEqualToAnchor:v152];
    v201[1] = v148;
    v141 = [(UIView *)v5->_grabberFooterView leadingAnchor];
    v142 = [(PXFloatingCardViewController *)v5 backgroundView];
    v140 = [v142 leadingAnchor];
    v57 = [v141 constraintEqualToAnchor:v140];
    v201[2] = v57;
    v58 = [(UIView *)v5->_grabberFooterView trailingAnchor];
    v59 = [(PXFloatingCardViewController *)v5 backgroundView];
    v60 = [v59 trailingAnchor];
    v61 = [v58 constraintEqualToAnchor:v60];
    v201[3] = v61;
    v62 = [(UIView *)v5->_grabberFooterView heightAnchor];
    v63 = [v62 constraintEqualToConstant:21.0];
    v201[4] = v63;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v201 count:5];
    [v145 activateConstraints:v64];

    v65 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v37, v38, v39, v40);
    v66 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    [v65 setBackgroundColor:v66];

    [v65 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v5->_grabberFooterView addSubview:v65];
    v158 = (void *)MEMORY[0x1E4F28DC8];
    v187 = [v65 topAnchor];
    v172 = [(UIView *)v5->_grabberFooterView topAnchor];
    v165 = [v187 constraintEqualToAnchor:v172];
    v200[0] = v165;
    v67 = v65;
    v68 = [v65 leadingAnchor];
    v69 = [(UIView *)v5->_grabberFooterView leadingAnchor];
    v70 = [v68 constraintEqualToAnchor:v69];
    v200[1] = v70;
    v180 = v67;
    v71 = [v67 trailingAnchor];
    v72 = [(UIView *)v5->_grabberFooterView trailingAnchor];
    v73 = [v71 constraintEqualToAnchor:v72];
    v200[2] = v73;
    v74 = [v67 heightAnchor];
    v75 = [v74 constraintEqualToConstant:1.0];
    v200[3] = v75;
    v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v200 count:4];
    [v158 activateConstraints:v76];

    v77 = (_UIGrabber *)objc_alloc_init(MEMORY[0x1E4FB2138]);
    grabber = v5->_grabber;
    v5->_grabber = v77;

    [(_UIGrabber *)v5->_grabber sizeToFit];
    [(UIView *)v5->_grabberFooterView addSubview:v5->_grabber];
    [(_UIGrabber *)v5->_grabber setTranslatesAutoresizingMaskIntoConstraints:0];
    v79 = (void *)MEMORY[0x1E4F28DC8];
    v80 = [(_UIGrabber *)v5->_grabber centerXAnchor];
    v81 = [(UIView *)v5->_grabberFooterView centerXAnchor];
    v82 = [v80 constraintEqualToAnchor:v81];
    v199[0] = v82;
    v83 = [(_UIGrabber *)v5->_grabber centerYAnchor];
    v84 = [(UIView *)v5->_grabberFooterView centerYAnchor];
    v85 = [v83 constraintEqualToAnchor:v84];
    v199[1] = v85;
    v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v199 count:2];
    [v79 activateConstraints:v86];

    objc_storeWeak((id *)&v5->_contentViewController, obj);
    v87 = [MEMORY[0x1E4FB1618] clearColor];
    v88 = [obj view];
    [v88 setBackgroundColor:v87];

    v89 = v5->_contentView;
    v90 = [obj view];
    [(UIView *)v89 addSubview:v90];

    [(PXFloatingCardViewController *)v5 addChildViewController:obj];
    [obj didMoveToParentViewController:v5];
    objc_msgSend(obj, "setAdditionalSafeAreaInsets:", 62.0, 0.0, 21.0, 0.0);
    v91 = [obj view];
    [v91 setTranslatesAutoresizingMaskIntoConstraints:0];

    v159 = (void *)MEMORY[0x1E4F28DC8];
    v188 = [obj view];
    v182 = [v188 bottomAnchor];
    v173 = [(UIView *)v5->_contentView bottomAnchor];
    v166 = [v182 constraintEqualToAnchor:v173];
    v198[0] = v166;
    v92 = [obj view];
    v93 = [v92 leadingAnchor];
    v94 = [(UIView *)v5->_contentView leadingAnchor];
    v95 = [v93 constraintEqualToAnchor:v94];
    v198[1] = v95;
    v96 = [obj view];
    v97 = [v96 trailingAnchor];
    v98 = [(UIView *)v5->_contentView trailingAnchor];
    v99 = [v97 constraintEqualToAnchor:v98];
    v198[2] = v99;
    v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v198 count:3];
    [v159 activateConstraints:v100];

    uint64_t v101 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v37, v38, v39, v40);
    headerView = v5->_headerView;
    v5->_headerView = (UIView *)v101;

    v103 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v5->_headerView setBackgroundColor:v103];

    [(UIView *)v5->_contentView addSubview:v5->_headerView];
    [(UIView *)v5->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v146 = (void *)MEMORY[0x1E4F28DC8];
    v183 = [(UIView *)v5->_headerView topAnchor];
    v174 = [(UIView *)v5->_contentView topAnchor];
    v167 = [v183 constraintEqualToAnchor:v174];
    v197[0] = v167;
    v153 = [(UIView *)v5->_headerView bottomAnchor];
    v160 = [obj view];
    v149 = [v160 topAnchor];
    v143 = [v153 constraintEqualToAnchor:v149];
    v197[1] = v143;
    v104 = [(UIView *)v5->_headerView leadingAnchor];
    v105 = [(UIView *)v5->_contentView leadingAnchor];
    v106 = [v104 constraintEqualToAnchor:v105];
    v197[2] = v106;
    v107 = [(UIView *)v5->_headerView trailingAnchor];
    v108 = [(UIView *)v5->_contentView trailingAnchor];
    v109 = [v107 constraintEqualToAnchor:v108];
    v197[3] = v109;
    v110 = [(UIView *)v5->_headerView heightAnchor];
    v111 = [v110 constraintEqualToConstant:62.0];
    v197[4] = v111;
    v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:v197 count:5];
    [v146 activateConstraints:v112];

    v113 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    v114 = PXLocalizedStringFromTable(@"PXInfoPanelFloatingTitle", @"PhotosUICore");
    [(UILabel *)v113 setText:v114];

    [(UILabel *)v113 setAccessibilityTraits:*MEMORY[0x1E4FB2550]];
    [(UILabel *)v113 setAccessibilityIdentifier:@"com.apple.photos.infoPanel.title"];
    v115 = [(PXFloatingCardViewController *)v5 _systemFontWithTextStyle:3 weight:*MEMORY[0x1E4FB09E0]];
    [(UILabel *)v113 setFont:v115];

    headerLabel = v5->_headerLabel;
    v5->_headerLabel = v113;
    v117 = v113;

    [(UIView *)v5->_headerView addSubview:v117];
    [(UILabel *)v117 setTranslatesAutoresizingMaskIntoConstraints:0];
    v175 = (void *)MEMORY[0x1E4F28DC8];
    v184 = [(UILabel *)v117 topAnchor];
    v118 = [(UIView *)v5->_headerView topAnchor];
    v119 = [v184 constraintEqualToAnchor:v118];
    v196[0] = v119;
    v190 = v117;
    v120 = [(UILabel *)v117 bottomAnchor];
    v121 = [(UIView *)v5->_headerView bottomAnchor];
    v122 = [v120 constraintEqualToAnchor:v121];
    v196[1] = v122;
    v123 = [(UILabel *)v117 leadingAnchor];
    v124 = [(UIView *)v5->_headerView leadingAnchor];
    v125 = [v123 constraintEqualToAnchor:v124 constant:16.0];
    v196[2] = v125;
    v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:3];
    [v175 activateConstraints:v126];

    v127 = (void *)MEMORY[0x1E4FB13F0];
    v192[0] = MEMORY[0x1E4F143A8];
    v192[1] = 3221225472;
    v192[2] = __62__PXFloatingCardViewController_initWithContentViewController___block_invoke;
    v192[3] = &unk_1E5DC9A58;
    v176 = v5;
    v193 = v176;
    v185 = [v127 actionWithHandler:v192];
    v128 = [MEMORY[0x1E4FB14D0] buttonWithType:7 primaryAction:v185];
    v129 = PXLocalizedStringFromTable(@"PXInfoPanelCloseButtonAXHint", @"PhotosUICore");
    [v128 setAccessibilityHint:v129];

    [v128 setAccessibilityIdentifier:@"com.apple.photos.infoPanel.dismiss"];
    [(UIView *)v5->_headerView addSubview:v128];
    [v128 setTranslatesAutoresizingMaskIntoConstraints:0];
    v154 = (void *)MEMORY[0x1E4F28DC8];
    v168 = [v128 centerYAnchor];
    v161 = [(UIView *)v5->_headerView centerYAnchor];
    v130 = [v168 constraintEqualToAnchor:v161];
    v195[0] = v130;
    v131 = [v128 leadingAnchor];
    v132 = [(UILabel *)v190 trailingAnchor];
    v133 = [v131 constraintEqualToAnchor:v132 constant:16.0];
    v195[1] = v133;
    v134 = [v128 trailingAnchor];
    v135 = [(UIView *)v5->_headerView trailingAnchor];
    v136 = [v134 constraintEqualToAnchor:v135 constant:-16.0];
    v195[2] = v136;
    v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:3];
    [v154 activateConstraints:v137];

    id v4 = obj;
    v138 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v138 addObserver:v176 selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v5;
}

uint64_t __62__PXFloatingCardViewController_initWithContentViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissTapped];
}

@end