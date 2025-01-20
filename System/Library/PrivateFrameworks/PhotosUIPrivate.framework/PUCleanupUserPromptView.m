@interface PUCleanupUserPromptView
- (BOOL)isIpadLayout;
- (BOOL)isPortrait;
- (CABasicAnimation)animation;
- (CGPoint)animationCenter;
- (NSLayoutConstraint)containerBottomPaddingConstraint;
- (NSLayoutConstraint)containerWidthConstraint;
- (NSLayoutConstraint)handBottomPaddingConstraint;
- (NSLayoutConstraint)promptLabelBottomPaddingConstraint;
- (NSMutableArray)constraints;
- (PUCleanupUserPromptView)initWithType:(unint64_t)a3;
- (PUCleanupUserPromptViewLayoutDelegate)layoutDelegate;
- (UIImageView)handView;
- (UILabel)promptLabel;
- (UIView)container;
- (UIView)handGuideView;
- (UIVisualEffectView)visualEffectView;
- (unint64_t)type;
- (void)enableAnimation:(BOOL)a3;
- (void)layoutSubviews;
- (void)setAnimation:(id)a3;
- (void)setAnimationCenter:(CGPoint)a3;
- (void)setConstraints:(id)a3;
- (void)setContainer:(id)a3;
- (void)setContainerBottomPaddingConstraint:(id)a3;
- (void)setContainerWidthConstraint:(id)a3;
- (void)setHandBottomPaddingConstraint:(id)a3;
- (void)setHandGuideView:(id)a3;
- (void)setHandView:(id)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setPromptLabel:(id)a3;
- (void)setPromptLabelBottomPaddingConstraint:(id)a3;
- (void)setVisualEffectView:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PUCleanupUserPromptView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_handBottomPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_promptLabelBottomPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_containerBottomPaddingConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_handView, 0);
  objc_storeStrong((id *)&self->_handGuideView, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
}

- (void)setContainerWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)containerWidthConstraint
{
  return self->_containerWidthConstraint;
}

- (void)setHandBottomPaddingConstraint:(id)a3
{
}

- (NSLayoutConstraint)handBottomPaddingConstraint
{
  return self->_handBottomPaddingConstraint;
}

- (void)setPromptLabelBottomPaddingConstraint:(id)a3
{
}

- (NSLayoutConstraint)promptLabelBottomPaddingConstraint
{
  return self->_promptLabelBottomPaddingConstraint;
}

- (void)setContainerBottomPaddingConstraint:(id)a3
{
}

- (NSLayoutConstraint)containerBottomPaddingConstraint
{
  return self->_containerBottomPaddingConstraint;
}

- (void)setConstraints:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setAnimation:(id)a3
{
}

- (CABasicAnimation)animation
{
  return self->_animation;
}

- (void)setHandView:(id)a3
{
}

- (UIImageView)handView
{
  return self->_handView;
}

- (void)setHandGuideView:(id)a3
{
}

- (UIView)handGuideView
{
  return self->_handGuideView;
}

- (void)setPromptLabel:(id)a3
{
}

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (void)setVisualEffectView:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setContainer:(id)a3
{
}

- (UIView)container
{
  return self->_container;
}

- (void)setAnimationCenter:(CGPoint)a3
{
  self->_animationCenter = a3;
}

- (CGPoint)animationCenter
{
  double x = self->_animationCenter.x;
  double y = self->_animationCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (PUCleanupUserPromptViewLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  return (PUCleanupUserPromptViewLayoutDelegate *)WeakRetained;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)enableAnimation:(BOOL)a3
{
  if (self->_type == 1)
  {
    BOOL v3 = a3;
    if (self->_animation)
    {
      v5 = [(UIImageView *)self->_handView layer];
      [v5 removeAllAnimations];

      v6 = [(UIImageView *)self->_handView layer];
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v14[0] = *MEMORY[0x1E4F1DAB8];
      v14[1] = v7;
      v14[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v6 setAffineTransform:v14];
    }
    if (v3)
    {
      v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation.z"];
      animation = self->_animation;
      self->_animation = v8;

      [(CABasicAnimation *)self->_animation setFromValue:&unk_1F078D1F0];
      [(CABasicAnimation *)self->_animation setToValue:&unk_1F078D200];
      v10 = self->_animation;
      v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      [(CABasicAnimation *)v10 setTimingFunction:v11];

      [(CABasicAnimation *)self->_animation setDuration:0.75];
      [(CABasicAnimation *)self->_animation setAutoreverses:1];
      LODWORD(v12) = 8.0;
      [(CABasicAnimation *)self->_animation setRepeatCount:v12];
      v13 = [(UIImageView *)self->_handView layer];
      [v13 addAnimation:self->_animation forKey:@"rotation"];
    }
  }
}

- (BOOL)isIpadLayout
{
  v2 = [(PUCleanupUserPromptView *)self layoutDelegate];
  BOOL v3 = [v2 currentLayoutStyle] == 4;

  return v3;
}

- (BOOL)isPortrait
{
  v2 = [(PUCleanupUserPromptView *)self layoutDelegate];
  BOOL v3 = [v2 layoutOrientation] == 1;

  return v3;
}

- (void)layoutSubviews
{
  v91[22] = *MEMORY[0x1E4F143B8];
  v90.receiver = self;
  v90.super_class = (Class)PUCleanupUserPromptView;
  [(PUCleanupUserPromptView *)&v90 layoutSubviews];
  BOOL v3 = [(PUCleanupUserPromptView *)self layoutDelegate];
  [v3 currentRenderViewWidth];
  double v5 = v4;

  v6 = &OBJC_IVAR___PUEditActionActivity__canPerformActivityActionHandler;
  long long v7 = &OBJC_IVAR___PUEditActionActivity__canPerformActivityActionHandler;
  if (!self->_constraints)
  {
    v8 = [(UILabel *)self->_promptLabel bottomAnchor];
    v9 = [(UIView *)self->_container bottomAnchor];
    v10 = [v8 constraintEqualToAnchor:v9 constant:-14.0];
    promptLabelBottomPaddingConstraint = self->_promptLabelBottomPaddingConstraint;
    self->_promptLabelBottomPaddingConstraint = v10;

    double v12 = [(UIView *)self->_handGuideView bottomAnchor];
    v13 = [(UILabel *)self->_promptLabel topAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 constant:-8.0];
    handBottomPaddingConstraint = self->_handBottomPaddingConstraint;
    self->_handBottomPaddingConstraint = v14;

    v16 = [(UIView *)self->_container bottomAnchor];
    v17 = [(PUCleanupUserPromptView *)self bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 constant:-13.0];
    containerBottomPaddingConstraint = self->_containerBottomPaddingConstraint;
    self->_containerBottomPaddingConstraint = v18;

    v20 = [(UIView *)self->_container widthAnchor];
    objc_msgSend(v20, "constraintLessThanOrEqualToConstant:", fmax(v5 + -48.0, 400.0));
    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    containerWidthConstraint = self->_containerWidthConstraint;
    self->_containerWidthConstraint = v21;

    CGFloat v23 = (self->_animationCenter.x + -0.5) * 35.0;
    CGFloat v24 = (self->_animationCenter.y + -0.5) * 35.0;
    v25 = [MEMORY[0x1E4F1CA48] array];
    constraints = self->_constraints;
    self->_constraints = v25;

    v71 = self->_constraints;
    v89 = [(UIView *)self->_container centerXAnchor];
    v88 = [(PUCleanupUserPromptView *)self centerXAnchor];
    v87 = [v89 constraintEqualToAnchor:v88];
    v91[0] = v87;
    v86 = [(UIView *)self->_container leadingAnchor];
    v85 = [(PUCleanupUserPromptView *)self leadingAnchor];
    v84 = [v86 constraintGreaterThanOrEqualToAnchor:v85 constant:4.0];
    v91[1] = v84;
    v83 = [(UIView *)self->_container trailingAnchor];
    v82 = [(PUCleanupUserPromptView *)self trailingAnchor];
    v81 = [v83 constraintLessThanOrEqualToAnchor:v82 constant:-4.0];
    v27 = self->_containerBottomPaddingConstraint;
    v91[2] = v81;
    v91[3] = v27;
    v91[4] = self->_containerWidthConstraint;
    v80 = [(UIVisualEffectView *)self->_visualEffectView leadingAnchor];
    v79 = [(UIView *)self->_container leadingAnchor];
    v78 = [v80 constraintEqualToAnchor:v79];
    v91[5] = v78;
    v77 = [(UIVisualEffectView *)self->_visualEffectView trailingAnchor];
    v76 = [(UIView *)self->_container trailingAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    v91[6] = v75;
    v74 = [(UIVisualEffectView *)self->_visualEffectView topAnchor];
    v73 = [(UIView *)self->_container topAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v91[7] = v72;
    v70 = [(UIVisualEffectView *)self->_visualEffectView bottomAnchor];
    v68 = [(UIView *)self->_container bottomAnchor];
    v67 = [v70 constraintEqualToAnchor:v68];
    v91[8] = v67;
    v66 = [(UILabel *)self->_promptLabel centerXAnchor];
    v65 = [(UIView *)self->_container centerXAnchor];
    v64 = [v66 constraintEqualToAnchor:v65];
    v91[9] = v64;
    v63 = [(UILabel *)self->_promptLabel leadingAnchor];
    v62 = [(UIView *)self->_container leadingAnchor];
    v61 = [v63 constraintEqualToAnchor:v62 constant:28.0];
    v91[10] = v61;
    v60 = [(UILabel *)self->_promptLabel trailingAnchor];
    v59 = [(UIView *)self->_container trailingAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:-28.0];
    v28 = self->_promptLabelBottomPaddingConstraint;
    v91[11] = v58;
    v91[12] = v28;
    v57 = [(UIView *)self->_handGuideView widthAnchor];
    v56 = [v57 constraintEqualToConstant:35.0];
    v91[13] = v56;
    v55 = [(UIView *)self->_handGuideView heightAnchor];
    v54 = [v55 constraintEqualToConstant:35.0];
    v91[14] = v54;
    v53 = [(UIView *)self->_handGuideView centerXAnchor];
    v52 = [(UIView *)self->_container centerXAnchor];
    v51 = [v53 constraintEqualToAnchor:v52 constant:0.0];
    v29 = self->_handBottomPaddingConstraint;
    v91[15] = v51;
    v91[16] = v29;
    v69 = [(UIView *)self->_handGuideView topAnchor];
    v50 = [(UIView *)self->_container topAnchor];
    v49 = [v69 constraintEqualToAnchor:v50 constant:8.0];
    v91[17] = v49;
    v48 = [(UIImageView *)self->_handView widthAnchor];
    v47 = [v48 constraintEqualToConstant:35.0];
    v91[18] = v47;
    v30 = [(UIImageView *)self->_handView heightAnchor];
    v31 = [v30 constraintEqualToConstant:35.0];
    v91[19] = v31;
    v32 = [(UIImageView *)self->_handView centerXAnchor];
    v33 = [(UIView *)self->_handGuideView centerXAnchor];
    v34 = [v32 constraintEqualToAnchor:v33 constant:v23];
    v91[20] = v34;
    v35 = [(UIImageView *)self->_handView centerYAnchor];
    v36 = [(UIView *)self->_handGuideView centerYAnchor];
    v37 = [v35 constraintEqualToAnchor:v36 constant:v24];
    v91[21] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:22];
    [(NSMutableArray *)v71 addObjectsFromArray:v38];

    v6 = &OBJC_IVAR___PUEditActionActivity__canPerformActivityActionHandler;
    long long v7 = &OBJC_IVAR___PUEditActionActivity__canPerformActivityActionHandler;

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
  }
  [*(id *)((char *)&self->super.super.super.isa + v6[240]) frame];
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v7[241]), "setFrame:");
  BOOL v39 = [(PUCleanupUserPromptView *)self isPortrait];
  int v40 = !v39 | [(PUCleanupUserPromptView *)self isIpadLayout];
  [(UIVisualEffectView *)self->_visualEffectView setHidden:([(PUCleanupUserPromptView *)self isIpadLayout] | v40) ^ 1];
  if (self->_type - 3 <= 1) {
    [(UIVisualEffectView *)self->_visualEffectView setHidden:0];
  }
  if ([(PUCleanupUserPromptView *)self isIpadLayout])
  {
    [(NSLayoutConstraint *)self->_promptLabelBottomPaddingConstraint setConstant:-14.0];
    [(NSLayoutConstraint *)self->_handBottomPaddingConstraint setConstant:-8.0];
    [(NSLayoutConstraint *)self->_containerBottomPaddingConstraint setConstant:-13.0];
    double v41 = fmax(v5 + -48.0, 400.0);
    v42 = self->_containerWidthConstraint;
  }
  else
  {
    [(NSLayoutConstraint *)self->_containerWidthConstraint setConstant:3.40282347e38];
    v43 = self->_promptLabelBottomPaddingConstraint;
    if (v40)
    {
      [(NSLayoutConstraint *)v43 setConstant:-14.0];
      [(NSLayoutConstraint *)self->_handBottomPaddingConstraint setConstant:-8.0];
      [(NSLayoutConstraint *)self->_containerBottomPaddingConstraint setConstant:-13.0];
      if (self->_type - 3 >= 2) {
        return;
      }
      v44 = self->_promptLabelBottomPaddingConstraint;
      [(NSLayoutConstraint *)v44 constant];
      double v46 = 8.0;
    }
    else
    {
      [(NSLayoutConstraint *)v43 setConstant:-25.0];
      [(NSLayoutConstraint *)self->_handBottomPaddingConstraint setConstant:-8.0];
      [(NSLayoutConstraint *)self->_containerBottomPaddingConstraint setConstant:-13.0];
      if (self->_type - 3 >= 2) {
        return;
      }
      v44 = self->_promptLabelBottomPaddingConstraint;
      [(NSLayoutConstraint *)v44 constant];
      double v46 = 12.0;
    }
    double v41 = v45 + v46;
    v42 = v44;
  }
  [(NSLayoutConstraint *)v42 setConstant:v41];
}

- (void)willMoveToSuperview:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUCleanupUserPromptView;
  [(PUCleanupUserPromptView *)&v3 willMoveToSuperview:a3];
}

- (PUCleanupUserPromptView)initWithType:(unint64_t)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)PUCleanupUserPromptView;
  double v4 = -[PUCleanupUserPromptView initWithFrame:](&v40, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v5 = v4;
  if (!v4) {
    return v5;
  }
  v4->_unint64_t type = a3;
  if (a3 - 2 < 3) {
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    p_animationCenter = &v4->_animationCenter;
    v4->_animationCenter.double x = 0.7;
    double v7 = 0.8;
    goto LABEL_7;
  }
  if (!a3)
  {
LABEL_5:
    p_animationCenter = &v4->_animationCenter;
    v4->_animationCenter.double x = 0.5;
    double v7 = 0.5;
LABEL_7:
    p_animationCenter->double y = v7;
  }
  v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  container = v5->_container;
  v5->_container = v8;

  [(UIView *)v5->_container setBackgroundColor:0];
  [(UIView *)v5->_container setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PUCleanupUserPromptView *)v5 addSubview:v5->_container];
  v10 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v10];
  visualEffectView = v5->_visualEffectView;
  v5->_visualEffectView = (UIVisualEffectView *)v11;

  v13 = [(UIVisualEffectView *)v5->_visualEffectView layer];
  [v13 setCornerRadius:20.0];

  v14 = [(UIVisualEffectView *)v5->_visualEffectView layer];
  [v14 setMasksToBounds:1];

  [(UIVisualEffectView *)v5->_visualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v5->_container addSubview:v5->_visualEffectView];
  v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  promptLabel = v5->_promptLabel;
  v5->_promptLabel = v15;

  v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v5->_promptLabel setTextColor:v17];

  [(UILabel *)v5->_promptLabel setNumberOfLines:0];
  switch(v5->_type)
  {
    case 0uLL:
      v18 = @"PHOTOEDIT_CLEANUP_IOS_SCANNING";
      goto LABEL_15;
    case 1uLL:
      v19 = @"PHOTOEDIT_CLEANUP_IOS_PROMPT";
      goto LABEL_12;
    case 2uLL:
      v19 = @"PHOTOEDIT_CLEANUP_IOS_PROMPT_REDACTION";
LABEL_12:
      v20 = PULocalizedString(v19);
      [(UILabel *)v5->_promptLabel setText:v20];

      v21 = [(UILabel *)v5->_promptLabel text];
      v22 = [v21 stringByAppendingString:@"\n"];
      [(UILabel *)v5->_promptLabel setText:v22];

      CGFloat v23 = [(UILabel *)v5->_promptLabel text];
      CGFloat v24 = PULocalizedString(@"PHOTOEDIT_CLEANUP_IOS_PAN_INSTRUCTION");
      v25 = [v23 stringByAppendingString:v24];
      [(UILabel *)v5->_promptLabel setText:v25];

      goto LABEL_16;
    case 3uLL:
      v18 = @"PHOTOEDIT_CLEANUP_IOS_PROMPT_SAFETY_FILTER_APPLIED";
      goto LABEL_15;
    case 4uLL:
      v18 = @"PHOTOEDIT_CLEANUP_IOS_PROMPT_INPAINT_SIZE_EXCEEDED";
LABEL_15:
      CGFloat v23 = PULocalizedString(v18);
      [(UILabel *)v5->_promptLabel setText:v23];
LABEL_16:

      break;
    default:
      break;
  }
  v26 = [(UILabel *)v5->_promptLabel font];
  v27 = [v26 fontWithSize:14.0];
  [(UILabel *)v5->_promptLabel setFont:v27];

  [(UILabel *)v5->_promptLabel setTextAlignment:1];
  [(UILabel *)v5->_promptLabel setLineBreakMode:0];
  [(UILabel *)v5->_promptLabel setNumberOfLines:0];
  [(UILabel *)v5->_promptLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v5->_container addSubview:v5->_promptLabel];
  v28 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  handGuideView = v5->_handGuideView;
  v5->_handGuideView = v28;

  [(UIView *)v5->_handGuideView setBackgroundColor:0];
  [(UIView *)v5->_handGuideView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v5->_container addSubview:v5->_handGuideView];
  v30 = (void *)MEMORY[0x1E4FB1830];
  v31 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v41[0] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  v33 = [v30 configurationWithPaletteColors:v32];

  v34 = 0;
  unint64_t type = v5->_type;
  if (type <= 4)
  {
    v34 = [MEMORY[0x1E4FB1818] systemImageNamed:off_1E5F24330[type] withConfiguration:v33];
  }
  v36 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  handView = v5->_handView;
  v5->_handView = v36;

  [(UIImageView *)v5->_handView setImage:v34];
  [(UIImageView *)v5->_handView setContentMode:1];
  v38 = [(UIImageView *)v5->_handView layer];
  objc_msgSend(v38, "setAnchorPoint:", v5->_animationCenter.x, v5->_animationCenter.y);

  [(UIImageView *)v5->_handView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v5->_container addSubview:v5->_handView];

  return v5;
}

@end