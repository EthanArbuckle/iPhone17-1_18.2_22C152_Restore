@interface PUCropAspectViewController
- (CEKEdgeGradientView)gradientMask;
- (CGSize)currentCropSize;
- (CGSize)originalSize;
- (NSArray)allAspectRatios;
- (NSArray)aspectButtons;
- (NSArray)aspectConstraints;
- (PUCropAspect)currentCropAspect;
- (PUCropAspectViewController)initWithLayoutOrientation:(int64_t)a3 originalSize:(CGSize)a4 currentSize:(CGSize)a5 currentCropAspect:(id)a6 spec:(id)a7;
- (PUCropAspectViewControllerDelegate)delegate;
- (PUCropToolControllerSpec)spec;
- (UIScrollView)scrollView;
- (UIView)buttonContainer;
- (UIView)scrollExtraLeftView;
- (UIView)scrollViewContainer;
- (id)matchingCropAspectTo:(id)a3 ignoreFreeform:(BOOL)a4;
- (int64_t)aspectOrientation;
- (int64_t)layoutOrientation;
- (void)_updateScrollViewContainerMask;
- (void)aspectButtonPressed:(id)a3;
- (void)setAllAspectRatios:(id)a3;
- (void)setAspectButtons:(id)a3;
- (void)setAspectConstraints:(id)a3;
- (void)setAspectOrientation:(int64_t)a3;
- (void)setButtonContainer:(id)a3;
- (void)setCurrentCropAspect:(id)a3;
- (void)setCurrentCropSize:(CGSize)a3;
- (void)setDelegate:(id)a3;
- (void)setGradientMask:(id)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setOriginalSize:(CGSize)a3;
- (void)setScrollExtraLeftView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setScrollViewContainer:(id)a3;
- (void)setSpec:(id)a3;
- (void)updateAspectButtonSelection;
- (void)updateAspectButtons;
- (void)updateAspectConstraints;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PUCropAspectViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectConstraints, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_allAspectRatios, 0);
  objc_storeStrong((id *)&self->_aspectButtons, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_buttonContainer, 0);
  objc_storeStrong((id *)&self->_scrollViewContainer, 0);
  objc_storeStrong((id *)&self->_gradientMask, 0);
  objc_storeStrong((id *)&self->_scrollExtraLeftView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentCropAspect, 0);
}

- (void)setAspectConstraints:(id)a3
{
}

- (NSArray)aspectConstraints
{
  return self->_aspectConstraints;
}

- (void)setSpec:(id)a3
{
}

- (PUCropToolControllerSpec)spec
{
  return self->_spec;
}

- (void)setOriginalSize:(CGSize)a3
{
  self->_originalSize = a3;
}

- (CGSize)originalSize
{
  double width = self->_originalSize.width;
  double height = self->_originalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAllAspectRatios:(id)a3
{
}

- (NSArray)allAspectRatios
{
  return self->_allAspectRatios;
}

- (void)setAspectButtons:(id)a3
{
}

- (NSArray)aspectButtons
{
  return self->_aspectButtons;
}

- (void)setScrollView:(id)a3
{
}

- (void)setButtonContainer:(id)a3
{
}

- (UIView)buttonContainer
{
  return self->_buttonContainer;
}

- (void)setScrollViewContainer:(id)a3
{
}

- (UIView)scrollViewContainer
{
  return self->_scrollViewContainer;
}

- (void)setGradientMask:(id)a3
{
}

- (CEKEdgeGradientView)gradientMask
{
  return self->_gradientMask;
}

- (UIView)scrollExtraLeftView
{
  return self->_scrollExtraLeftView;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (int64_t)aspectOrientation
{
  return self->_aspectOrientation;
}

- (void)setDelegate:(id)a3
{
}

- (PUCropAspectViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUCropAspectViewControllerDelegate *)WeakRetained;
}

- (PUCropAspect)currentCropAspect
{
  return self->_currentCropAspect;
}

- (void)setCurrentCropSize:(CGSize)a3
{
  self->_currentCropSize = a3;
}

- (CGSize)currentCropSize
{
  double width = self->_currentCropSize.width;
  double height = self->_currentCropSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_updateScrollViewContainerMask
{
  if ([(PUCropAspectViewController *)self layoutOrientation]
    || ([(PUCropAspectViewController *)self scrollExtraLeftView],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    gradientMask = 0;
  }
  else
  {
    gradientMask = self->_gradientMask;
  }
  scrollViewContainer = self->_scrollViewContainer;
  [(UIView *)scrollViewContainer setMaskView:gradientMask];
}

- (void)aspectButtonPressed:(id)a3
{
  uint64_t v4 = [a3 tag];
  v5 = [(PUCropAspectViewController *)self aspectButtons];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(PUCropAspectViewController *)self aspectButtons];
      v9 = [v8 objectAtIndexedSubscript:v7];

      objc_msgSend(v9, "setSelected:", objc_msgSend(v9, "tag") == v4);
      ++v7;
      v10 = [(PUCropAspectViewController *)self aspectButtons];
      unint64_t v11 = [v10 count];
    }
    while (v7 < v11);
  }
  v12 = [(PUCropAspectViewController *)self delegate];

  if (v12)
  {
    v13 = [(PUCropAspectViewController *)self allAspectRatios];
    id v15 = [v13 objectAtIndexedSubscript:v4];

    if ([v15 isFreeformCrop])
    {

      id v15 = 0;
    }
    v14 = [(PUCropAspectViewController *)self delegate];
    [v14 cropAspectController:self cropAspectSelected:v15];
  }
}

- (void)setScrollExtraLeftView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollExtraLeftView, a3);
  [(PUCropAspectViewController *)self _updateScrollViewContainerMask];
  [(PUCropAspectViewController *)self updateAspectConstraints];
}

- (void)updateAspectConstraints
{
  v3 = [(PUCropAspectViewController *)self aspectConstraints];

  if (v3)
  {
    uint64_t v4 = [(PUCropAspectViewController *)self view];
    v5 = [(PUCropAspectViewController *)self aspectConstraints];
    [v4 removeConstraints:v5];

    [(PUCropAspectViewController *)self setAspectConstraints:0];
  }
  id v121 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(UIScrollView *)self->_scrollView contentLayoutGuide];
  if ([(PUCropAspectViewController *)self layoutOrientation])
  {
    unint64_t v7 = [(PUCropAspectViewController *)self allAspectRatios];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      v9 = 0;
      unint64_t v10 = 0;
      do
      {
        unint64_t v11 = [(PUCropAspectViewController *)self aspectButtons];
        v12 = [v11 objectAtIndexedSubscript:v10];

        v13 = [(UIView *)self->_buttonContainer leftAnchor];
        v14 = [v12 leftAnchor];
        id v15 = [v13 constraintEqualToAnchor:v14 constant:-5.0];
        [v121 addObject:v15];

        v16 = [(UIView *)self->_buttonContainer rightAnchor];
        v17 = [v12 rightAnchor];
        v18 = [v16 constraintEqualToAnchor:v17 constant:5.0];
        [v121 addObject:v18];

        v19 = [v12 topAnchor];
        if (v9)
        {
          v20 = [v9 bottomAnchor];
          double v21 = 10.0;
        }
        else
        {
          v20 = [(UIView *)self->_buttonContainer topAnchor];
          double v21 = 0.0;
        }
        v22 = [v19 constraintEqualToAnchor:v20 constant:v21];
        [v121 addObject:v22];

        ++v10;
        v23 = [(PUCropAspectViewController *)self allAspectRatios];
        unint64_t v24 = [v23 count];

        v9 = v12;
      }
      while (v10 < v24);
      if (v12)
      {
        v25 = [v12 bottomAnchor];
        v26 = [(UIView *)self->_buttonContainer bottomAnchor];
        v27 = [v25 constraintEqualToAnchor:v26 constant:0.0];
        [v121 addObject:v27];
      }
    }
    else
    {
      v12 = 0;
    }
    v58 = [(UIScrollView *)self->_scrollView heightAnchor];
    v59 = [(UIView *)self->_buttonContainer heightAnchor];
    v60 = [v58 constraintEqualToAnchor:v59 constant:0.0];

    LODWORD(v61) = 1132068864;
    [v60 setPriority:v61];
    [v121 addObject:v60];
    v62 = [(UIView *)self->_buttonContainer leftAnchor];
    v63 = [(UIView *)self->_scrollViewContainer leftAnchor];
    v64 = [v62 constraintEqualToAnchor:v63];
    [v121 addObject:v64];

    v65 = [(UIView *)self->_buttonContainer rightAnchor];
    v66 = [(UIView *)self->_scrollViewContainer rightAnchor];
    v67 = [v65 constraintEqualToAnchor:v66];
    [v121 addObject:v67];

    v68 = [(UIView *)self->_buttonContainer topAnchor];
    v69 = [v6 topAnchor];
    v70 = [v68 constraintEqualToAnchor:v69];
    [v121 addObject:v70];

    v71 = [(UIView *)self->_buttonContainer bottomAnchor];
    v72 = [v6 bottomAnchor];
    v73 = [v71 constraintEqualToAnchor:v72];
    [v121 addObject:v73];

    v74 = [(UIScrollView *)self->_scrollView heightAnchor];
    v75 = [(UIView *)self->_scrollViewContainer heightAnchor];
    v76 = [v74 constraintLessThanOrEqualToAnchor:v75];
    [v121 addObject:v76];

    v77 = [(UIScrollView *)self->_scrollView centerYAnchor];
    v78 = [(UIView *)self->_scrollViewContainer centerYAnchor];
    v79 = [v77 constraintEqualToAnchor:v78];
    [v121 addObject:v79];

    v80 = [(UIScrollView *)self->_scrollView leftAnchor];
    v81 = [(UIView *)self->_scrollViewContainer leftAnchor];
    v82 = [v80 constraintEqualToAnchor:v81];
    [v121 addObject:v82];

    v83 = [(UIScrollView *)self->_scrollView rightAnchor];
    uint64_t v84 = [(UIView *)self->_scrollViewContainer rightAnchor];
    goto LABEL_31;
  }
  v28 = [(PUCropAspectViewController *)self scrollExtraLeftView];

  if (v28)
  {
    scrollView = self->_scrollView;
    v30 = [(PUCropAspectViewController *)self scrollExtraLeftView];
    [(UIScrollView *)scrollView addSubview:v30];

    v31 = [(PUCropAspectViewController *)self scrollExtraLeftView];
    v32 = [v31 leftAnchor];
    v33 = [(UIView *)self->_buttonContainer leftAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [v121 addObject:v34];

    v35 = [(PUCropAspectViewController *)self scrollExtraLeftView];
    v36 = [v35 centerYAnchor];
    v37 = [(UIView *)self->_buttonContainer centerYAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    [v121 addObject:v38];
  }
  v39 = [(PUCropAspectViewController *)self allAspectRatios];
  uint64_t v40 = [v39 count];

  if (!v40)
  {
    v12 = 0;
    goto LABEL_30;
  }
  v120 = v6;
  v12 = 0;
  unint64_t v41 = 0;
  do
  {
    v42 = v12;
    v43 = [(PUCropAspectViewController *)self aspectButtons];
    v12 = [v43 objectAtIndexedSubscript:v41];

    v44 = [(UIView *)self->_buttonContainer topAnchor];
    v45 = [v12 topAnchor];
    v46 = [v44 constraintEqualToAnchor:v45 constant:-5.0];
    [v121 addObject:v46];

    v47 = [(UIView *)self->_buttonContainer bottomAnchor];
    v48 = [v12 bottomAnchor];
    v49 = [v47 constraintEqualToAnchor:v48 constant:5.0];
    [v121 addObject:v49];

    if (v42)
    {
      v50 = [v12 leftAnchor];
      v51 = [v42 rightAnchor];
      double v52 = 10.0;
LABEL_18:
      v53 = [v50 constraintEqualToAnchor:v51 constant:v52];
      [v121 addObject:v53];
      goto LABEL_21;
    }
    v54 = [(PUCropAspectViewController *)self scrollExtraLeftView];

    v50 = [v12 leftAnchor];
    if (!v54)
    {
      v51 = [(UIView *)self->_buttonContainer leftAnchor];
      double v52 = 0.0;
      goto LABEL_18;
    }
    v51 = [(PUCropAspectViewController *)self scrollExtraLeftView];
    v53 = [v51 rightAnchor];
    v55 = [v50 constraintEqualToAnchor:v53 constant:10.0];
    [v121 addObject:v55];

LABEL_21:
    ++v41;
    v56 = [(PUCropAspectViewController *)self allAspectRatios];
    unint64_t v57 = [v56 count];
  }
  while (v41 < v57);
  if (v12)
  {
    v85 = [v12 rightAnchor];
    v86 = [(UIView *)self->_buttonContainer rightAnchor];
    v87 = [v85 constraintEqualToAnchor:v86 constant:0.0];
    [v121 addObject:v87];
  }
  uint64_t v6 = v120;
LABEL_30:
  v88 = [(PUCropAspectViewController *)self spec];
  [v88 cropAspectRatioScrollContentInset];
  double v90 = v89;
  double v92 = v91;

  v93 = [(UIScrollView *)self->_scrollView widthAnchor];
  v94 = [(UIView *)self->_buttonContainer widthAnchor];
  v60 = [v93 constraintEqualToAnchor:v94 constant:v90 + v92];

  LODWORD(v95) = 1132068864;
  [v60 setPriority:v95];
  [v121 addObject:v60];
  v96 = [(UIView *)self->_buttonContainer leftAnchor];
  v97 = [v6 leftAnchor];
  v98 = [v96 constraintEqualToAnchor:v97];
  [v121 addObject:v98];

  v99 = [(UIView *)self->_buttonContainer rightAnchor];
  v100 = [v6 rightAnchor];
  v101 = [v99 constraintEqualToAnchor:v100];
  [v121 addObject:v101];

  v102 = [(UIView *)self->_buttonContainer topAnchor];
  v103 = [(UIScrollView *)self->_scrollView topAnchor];
  v104 = [v102 constraintEqualToAnchor:v103];
  [v121 addObject:v104];

  v105 = [(UIView *)self->_buttonContainer bottomAnchor];
  v106 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v107 = [v105 constraintEqualToAnchor:v106];
  [v121 addObject:v107];

  v108 = [(UIScrollView *)self->_scrollView widthAnchor];
  v109 = [(UIView *)self->_scrollViewContainer widthAnchor];
  v110 = [v108 constraintLessThanOrEqualToAnchor:v109];
  [v121 addObject:v110];

  v111 = [(UIScrollView *)self->_scrollView centerXAnchor];
  v112 = [(UIView *)self->_scrollViewContainer centerXAnchor];
  v113 = [v111 constraintEqualToAnchor:v112];
  [v121 addObject:v113];

  v114 = [(UIScrollView *)self->_scrollView topAnchor];
  v115 = [(UIView *)self->_scrollViewContainer topAnchor];
  v116 = [v114 constraintEqualToAnchor:v115];
  [v121 addObject:v116];

  v83 = [(UIScrollView *)self->_scrollView bottomAnchor];
  uint64_t v84 = [(UIView *)self->_scrollViewContainer bottomAnchor];
LABEL_31:
  v117 = (void *)v84;
  v118 = [v83 constraintEqualToAnchor:v84];
  [v121 addObject:v118];

  v119 = [(PUCropAspectViewController *)self view];
  [v119 addConstraints:v121];

  [(PUCropAspectViewController *)self setAspectConstraints:v121];
}

- (void)updateAspectButtons
{
  v3 = +[PUCropAspect allAspectsWithOriginalSize:currentSize:](PUCropAspect, "allAspectsWithOriginalSize:currentSize:", self->_originalSize.width, self->_originalSize.height, self->_currentCropSize.width, self->_currentCropSize.height);
  [(PUCropAspectViewController *)self setAllAspectRatios:v3];

  uint64_t v4 = [(PUCropAspectViewController *)self aspectButtons];

  if (!v4)
  {
    v5 = objc_opt_new();
    uint64_t v6 = [(PUCropAspectViewController *)self scrollView];
    buttonContainer = self->_buttonContainer;
    if (buttonContainer)
    {
      [(UIView *)buttonContainer removeFromSuperview];
      uint64_t v8 = self->_buttonContainer;
      self->_buttonContainer = 0;
    }
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    unint64_t v10 = self->_buttonContainer;
    self->_buttonContainer = v9;

    [(UIView *)self->_buttonContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 addSubview:self->_buttonContainer];
    unint64_t v11 = [(PUCropAspectViewController *)self allAspectRatios];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      unint64_t v13 = 0;
      do
      {
        v14 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
        [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v14 setTag:v13];
        [v14 addTarget:self action:sel_aspectButtonPressed_ forControlEvents:0x2000];
        [(UIView *)self->_buttonContainer addSubview:v14];
        [v5 addObject:v14];

        ++v13;
        id v15 = [(PUCropAspectViewController *)self allAspectRatios];
        unint64_t v16 = [v15 count];
      }
      while (v13 < v16);
    }
    [(PUCropAspectViewController *)self setAspectButtons:v5];
  }
  [(PUCropAspectViewController *)self updateAspectConstraints];
  v17 = [MEMORY[0x1E4FB1618] labelColor];
  v18 = [(PUCropAspectViewController *)self traitCollection];
  v19 = [v17 resolvedColorWithTraitCollection:v18];
  id v44 = [v19 colorWithAlphaComponent:0.2];

  [MEMORY[0x1E4FB08E0] systemFontSize];
  v20 = PXMonospacedNumberFontWithSize();
  double v21 = [(PUCropAspectViewController *)self spec];
  v22 = [v21 cropAspectButtonColor];
  v23 = [(PUCropAspectViewController *)self traitCollection];
  unint64_t v24 = [v22 resolvedColorWithTraitCollection:v23];

  v25 = [(PUCropAspectViewController *)self spec];
  v26 = [v25 cropAspectButtonSelectedColor];
  v27 = [(PUCropAspectViewController *)self traitCollection];
  v28 = [v26 resolvedColorWithTraitCollection:v27];

  v29 = [(PUCropAspectViewController *)self allAspectRatios];
  uint64_t v30 = [v29 count];

  if (v30)
  {
    unint64_t v31 = 0;
    do
    {
      v32 = [(PUCropAspectViewController *)self allAspectRatios];
      v33 = [v32 objectAtIndexedSubscript:v31];

      v34 = [(PUCropAspectViewController *)self aspectButtons];
      v35 = [v34 objectAtIndexedSubscript:v31];

      v36 = [v33 localizedName];
      v37 = [v36 localizedUppercaseString];

      v38 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_imageWithIconImage:iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:inset:", 0, 0, v37, v20, v24, 0, 15.0, 7.0, 2.0, 0);
      objc_msgSend(MEMORY[0x1E4FB1818], "pu_imageWithIconImage:iconImageColor:text:font:textColor:fillColor:strokeColor:cornerRadius:inset:", 0, 0, v37, v20, v28, v44, 15.0, 7.0, 2.0, 0);
      v39 = v28;
      v41 = uint64_t v40 = v24;
      [v35 setImage:v38 forState:0];
      [v35 setImage:v41 forState:4];

      unint64_t v24 = v40;
      v28 = v39;

      ++v31;
      v42 = [(PUCropAspectViewController *)self allAspectRatios];
      unint64_t v43 = [v42 count];
    }
    while (v31 < v43);
  }
  [(PUCropAspectViewController *)self updateAspectButtonSelection];
}

- (id)matchingCropAspectTo:(id)a3 ignoreFreeform:(BOOL)a4
{
  BOOL v23 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = [(PUCropAspectViewController *)self allAspectRatios];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v25;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v25 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
      unint64_t v13 = [(PUCropAspectViewController *)self currentCropAspect];
      if ([v12 isEqualToCropAspect:v13]) {
        break;
      }

      if (!v9) {
        goto LABEL_12;
      }
LABEL_19:
      if (v8 == ++v11)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_23;
      }
    }
    if (!v23)
    {

LABEL_25:
      id v21 = v12;

      goto LABEL_26;
    }
    char v14 = [v12 isFreeformCrop];

    if ((v14 & 1) == 0) {
      goto LABEL_25;
    }
    if (v9) {
      goto LABEL_19;
    }
LABEL_12:
    id v15 = v12;
    unint64_t v16 = v15;
    if ([v15 allowOrientationChange])
    {
      [v15 ratio];
      BOOL v18 = v17 >= 1.0;
      [v5 ratio];
      char v20 = v18 ^ (v19 < 1.0);
      unint64_t v16 = v15;
      if ((v20 & 1) == 0)
      {
        unint64_t v16 = [v15 inverseAspect];
      }
    }
    if ([v16 isEquivalentToCropAspect:v5]) {
      id v9 = v15;
    }
    else {
      id v9 = 0;
    }

    goto LABEL_19;
  }
  id v9 = 0;
LABEL_23:

  id v9 = v9;
  id v21 = v9;
LABEL_26:

  return v21;
}

- (void)updateAspectButtonSelection
{
  v3 = [(PUCropAspectViewController *)self currentCropAspect];
  id v13 = [(PUCropAspectViewController *)self matchingCropAspectTo:v3 ignoreFreeform:0];

  uint64_t v4 = [(PUCropAspectViewController *)self allAspectRatios];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = [(PUCropAspectViewController *)self allAspectRatios];
      id v8 = [v7 objectAtIndexedSubscript:v6];

      id v9 = [(PUCropAspectViewController *)self aspectButtons];
      uint64_t v10 = [v9 objectAtIndexedSubscript:v6];

      [v10 setSelected:v8 == v13];
      ++v6;
      uint64_t v11 = [(PUCropAspectViewController *)self allAspectRatios];
      unint64_t v12 = [v11 count];
    }
    while (v6 < v12);
  }
}

- (void)setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    [(PUCropAspectViewController *)self _updateScrollViewContainerMask];
    [(PUCropAspectViewController *)self updateAspectConstraints];
  }
}

- (void)setCurrentCropAspect:(id)a3
{
  objc_storeStrong((id *)&self->_currentCropAspect, a3);
  [(PUCropAspectViewController *)self updateAspectButtonSelection];
}

- (void)setAspectOrientation:(int64_t)a3
{
  if (self->_aspectOrientation != a3)
  {
    double width = self->_originalSize.width;
    double height = self->_originalSize.height;
    if ((!a3 && width < height || a3 == 1 && height < width)
      && self->_currentCropSize.width != self->_currentCropSize.height)
    {
      self->_originalSize.double width = height;
      self->_originalSize.double height = width;
    }
    self->_aspectOrientation = a3;
    [(PUCropAspectViewController *)self updateAspectButtons];
  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PUCropAspectViewController;
  [(PUCropAspectViewController *)&v4 viewDidLayoutSubviews];
  v3 = [(PUCropAspectViewController *)self view];
  [v3 bounds];
  -[CEKEdgeGradientView setFrame:](self->_gradientMask, "setFrame:");

  [(CEKEdgeGradientView *)self->_gradientMask setGradientDirection:0];
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  [(CEKEdgeGradientView *)self->_gradientMask setGradientDimensions:0.0];
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)PUCropAspectViewController;
  [(PUCropAspectViewController *)&v24 viewDidLoad];
  v3 = [(PUCropAspectViewController *)self view];
  objc_super v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  scrollViewContainer = self->_scrollViewContainer;
  self->_scrollViewContainer = v4;

  [(UIView *)self->_scrollViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_scrollViewContainer];
  unint64_t v6 = [(UIView *)self->_scrollViewContainer topAnchor];
  uint64_t v7 = [v3 topAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  id v9 = [(UIView *)self->_scrollViewContainer bottomAnchor];
  uint64_t v10 = [v3 bottomAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  unint64_t v12 = [(UIView *)self->_scrollViewContainer leftAnchor];
  id v13 = [v3 leftAnchor];
  char v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  id v15 = [(UIView *)self->_scrollViewContainer rightAnchor];
  unint64_t v16 = [v3 rightAnchor];
  double v17 = [v15 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  id v18 = objc_alloc(MEMORY[0x1E4F57D48]);
  double v19 = (CEKEdgeGradientView *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  gradientMask = self->_gradientMask;
  self->_gradientMask = v19;

  [(CEKEdgeGradientView *)self->_gradientMask setEdgeGradientStyleMask];
  [(PUCropAspectViewController *)self _updateScrollViewContainerMask];
  id v21 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v21;

  [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setUserInteractionEnabled:1];
  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
  BOOL v23 = [(PUCropAspectViewController *)self spec];
  [v23 cropAspectRatioScrollContentInset];
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");

  [(UIView *)self->_scrollViewContainer addSubview:self->_scrollView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  self->_aspectOrientation = -1;
  [(PUCropAspectViewController *)self setAspectOrientation:self->_currentCropSize.width < self->_currentCropSize.height];
}

- (PUCropAspectViewController)initWithLayoutOrientation:(int64_t)a3 originalSize:(CGSize)a4 currentSize:(CGSize)a5 currentCropAspect:(id)a6 spec:(id)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v11 = a4.height;
  CGFloat v12 = a4.width;
  v24[3] = *MEMORY[0x1E4F143B8];
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PUCropAspectViewController;
  double v17 = [(PUCropAspectViewController *)&v23 initWithNibName:0 bundle:0];
  id v18 = v17;
  if (v17)
  {
    v17->_layoutOrientation = a3;
    v17->_currentCropSize.CGFloat width = width;
    v17->_currentCropSize.CGFloat height = height;
    v17->_originalSize.CGFloat width = v12;
    v17->_originalSize.CGFloat height = v11;
    objc_storeStrong((id *)&v17->_currentCropAspect, a6);
    objc_storeStrong((id *)&v18->_spec, a7);
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    id v20 = (id)[(PUCropAspectViewController *)v18 registerForTraitChanges:v19 withAction:sel_traitEnvironment_didChangeTraitCollection_];

    id v21 = v18;
  }

  return v18;
}

@end