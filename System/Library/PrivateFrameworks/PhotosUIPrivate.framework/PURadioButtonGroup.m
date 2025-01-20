@interface PURadioButtonGroup
- (NSArray)images;
- (NSMutableArray)buttons;
- (NSMutableArray)horizontalConstraints;
- (NSMutableArray)verticalConstraints;
- (PURadioButtonGroup)initWithImages:(id)a3 delegate:(id)a4;
- (PURadioButtonGroupDelegate)radioButtonDelegate;
- (id)completion;
- (void)_didSelectButton:(id)a3;
- (void)deselectAllButtons;
- (void)disableButton:(int64_t)a3;
- (void)enableButton:(int64_t)a3;
- (void)selectButton:(int64_t)a3;
- (void)setButtons:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setHorizontalConstraints:(id)a3;
- (void)setImages:(id)a3;
- (void)setRadioButtonDelegate:(id)a3;
- (void)setVerticalConstraints:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PURadioButtonGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalConstraints, 0);
  objc_storeStrong((id *)&self->_horizontalConstraints, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_destroyWeak((id *)&self->_radioButtonDelegate);
  objc_storeStrong(&self->_completion, 0);
}

- (void)setVerticalConstraints:(id)a3
{
}

- (NSMutableArray)verticalConstraints
{
  return self->_verticalConstraints;
}

- (void)setHorizontalConstraints:(id)a3
{
}

- (NSMutableArray)horizontalConstraints
{
  return self->_horizontalConstraints;
}

- (void)setButtons:(id)a3
{
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setImages:(id)a3
{
}

- (NSArray)images
{
  return self->_images;
}

- (void)setRadioButtonDelegate:(id)a3
{
}

- (PURadioButtonGroupDelegate)radioButtonDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_radioButtonDelegate);
  return (PURadioButtonGroupDelegate *)WeakRetained;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)deselectAllButtons
{
  v3 = [(PURadioButtonGroup *)self buttons];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [(PURadioButtonGroup *)self buttons];
      v7 = [v6 objectAtIndexedSubscript:v5];
      [v7 setSelected:0];

      ++v5;
      v8 = [(PURadioButtonGroup *)self buttons];
      unint64_t v9 = [v8 count];
    }
    while (v9 > v5);
  }
}

- (void)selectButton:(int64_t)a3
{
  unint64_t v5 = [(PURadioButtonGroup *)self buttons];
  unint64_t v6 = [v5 count];

  if (v6 > a3)
  {
    v7 = [(PURadioButtonGroup *)self buttons];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = 0;
      do
      {
        v10 = [(PURadioButtonGroup *)self buttons];
        v11 = [v10 objectAtIndexedSubscript:v9];
        [v11 setSelected:0];

        ++v9;
        v12 = [(PURadioButtonGroup *)self buttons];
        unint64_t v13 = [v12 count];
      }
      while (v13 > v9);
    }
    id v15 = [(PURadioButtonGroup *)self buttons];
    v14 = [v15 objectAtIndexedSubscript:a3];
    [v14 setSelected:1];
  }
}

- (void)enableButton:(int64_t)a3
{
  if ([(NSMutableArray *)self->_buttons count] > (unint64_t)a3)
  {
    id v5 = [(NSMutableArray *)self->_buttons objectAtIndexedSubscript:a3];
    [v5 setEnabled:1];
  }
}

- (void)disableButton:(int64_t)a3
{
  if ([(NSMutableArray *)self->_buttons count] > (unint64_t)a3)
  {
    id v5 = [(NSMutableArray *)self->_buttons objectAtIndexedSubscript:a3];
    [v5 setEnabled:0];
  }
}

- (void)_didSelectButton:(id)a3
{
  id v16 = a3;
  objc_msgSend(v16, "setSelected:", objc_msgSend(v16, "isSelected") ^ 1);
  if (![v16 isSelected]) {
    goto LABEL_9;
  }
  uint64_t v4 = [(PURadioButtonGroup *)self buttons];
  uint64_t v5 = [v4 count];

  if (!v5) {
    goto LABEL_9;
  }
  unint64_t v6 = 0;
  uint64_t v7 = -1;
  do
  {
    uint64_t v8 = [(PURadioButtonGroup *)self buttons];
    id v9 = [v8 objectAtIndexedSubscript:v6];

    uint64_t v10 = v6;
    if (v9 != v16)
    {
      v11 = [(PURadioButtonGroup *)self buttons];
      v12 = [v11 objectAtIndexedSubscript:v6];
      [v12 setSelected:0];

      uint64_t v10 = v7;
    }
    ++v6;
    unint64_t v13 = [(PURadioButtonGroup *)self buttons];
    unint64_t v14 = [v13 count];

    uint64_t v7 = v10;
  }
  while (v14 > v6);
  if (v10 != -1)
  {
    id v15 = [(PURadioButtonGroup *)self radioButtonDelegate];
    [v15 radioGroupButtonSelectedWithIndex:v10];
  }
  else
  {
LABEL_9:
    id v15 = [(PURadioButtonGroup *)self radioButtonDelegate];
    [v15 radioButtonGroupNoneSelected];
  }
}

- (void)updateViewConstraints
{
  v3 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v4 = [(PURadioButtonGroup *)self horizontalConstraints];
  [v3 deactivateConstraints:v4];

  uint64_t v5 = (void *)MEMORY[0x1E4F28DC8];
  unint64_t v6 = [(PURadioButtonGroup *)self verticalConstraints];
  [v5 deactivateConstraints:v6];

  uint64_t v7 = [(PURadioButtonGroup *)self radioButtonDelegate];
  uint64_t v8 = [v7 layoutDirection];

  id v9 = (void *)MEMORY[0x1E4F28DC8];
  if (v8) {
    [(PURadioButtonGroup *)self verticalConstraints];
  }
  else {
  uint64_t v10 = [(PURadioButtonGroup *)self horizontalConstraints];
  }
  [v9 activateConstraints:v10];

  v11.receiver = self;
  v11.super_class = (Class)PURadioButtonGroup;
  [(PURadioButtonGroup *)&v11 updateViewConstraints];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PURadioButtonGroup;
  id v7 = a4;
  -[PURadioButtonGroup viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PURadioButtonGroup_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5F2B9D0;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __73__PURadioButtonGroup_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setNeedsUpdateConstraints];
}

- (void)viewDidLoad
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  v127.receiver = self;
  v127.super_class = (Class)PURadioButtonGroup;
  [(PURadioButtonGroup *)&v127 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
  uint64_t v4 = [(PURadioButtonGroup *)self view];
  [v4 setBackgroundColor:v3];

  uint64_t v5 = [(PURadioButtonGroup *)self view];
  unint64_t v6 = [v5 layer];
  [v6 setCornerRadius:8.0];

  id v7 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v8 = [(PURadioButtonGroup *)self view];
  [v8 setTintColor:v7];

  objc_super v9 = [MEMORY[0x1E4F1CA48] array];
  [(PURadioButtonGroup *)self setButtons:v9];

  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  uint64_t v10 = [(PURadioButtonGroup *)self images];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v123 objects:v138 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v124;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v124 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v123 + 1) + 8 * i);
        id v16 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
        [v16 addTarget:self action:sel__didSelectButton_ forControlEvents:64];
        [v16 setImage:v15 forState:0];
        [v16 setPointerInteractionEnabled:1];
        [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
        v17 = [(PURadioButtonGroup *)self view];
        [v17 addSubview:v16];

        v18 = [(PURadioButtonGroup *)self buttons];
        [v18 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v123 objects:v138 count:16];
    }
    while (v12);
  }

  v19 = [MEMORY[0x1E4F1CA48] array];
  [(PURadioButtonGroup *)self setVerticalConstraints:v19];

  v20 = [MEMORY[0x1E4F1CA48] array];
  [(PURadioButtonGroup *)self setHorizontalConstraints:v20];

  v21 = [(PURadioButtonGroup *)self horizontalConstraints];
  v22 = [(PURadioButtonGroup *)self buttons];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    uint64_t v24 = 0;
    do
    {
      uint64_t v121 = v24;
      v25 = [(PURadioButtonGroup *)self buttons];
      v26 = [v25 objectAtIndexedSubscript:v24];

      v117 = [v26 heightAnchor];
      v119 = [(PURadioButtonGroup *)self view];
      v27 = [v119 heightAnchor];
      v28 = [v117 constraintLessThanOrEqualToAnchor:v27 constant:-20.0];
      v137[0] = v28;
      [v26 centerYAnchor];
      v30 = v29 = v21;
      v31 = [(PURadioButtonGroup *)self view];
      v32 = [v31 centerYAnchor];
      v33 = [v30 constraintEqualToAnchor:v32];
      v137[1] = v33;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:2];
      [v29 addObjectsFromArray:v34];

      v21 = v29;
      if (!v121)
      {
        v35 = [v26 leadingAnchor];
        v36 = [(PURadioButtonGroup *)self view];
        v37 = [v36 leadingAnchor];
        v38 = [v35 constraintEqualToAnchor:v37 constant:10.0];
        v136 = v38;
        v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v136 count:1];
        [v21 addObjectsFromArray:v39];

        v40 = [(PURadioButtonGroup *)self buttons];
        unint64_t v41 = [v40 count];

        if (v41 >= 2)
        {
          v42 = [v26 trailingAnchor];
          v43 = [(PURadioButtonGroup *)self buttons];
          v44 = [v43 objectAtIndexedSubscript:1];
          v45 = [v44 leadingAnchor];
          v46 = [v42 constraintEqualToAnchor:v45 constant:-24.0];
          v135 = v46;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v135 count:1];
          v48 = v47 = v26;
          [v21 addObjectsFromArray:v48];

          v26 = v47;
        }
      }
      v49 = [(PURadioButtonGroup *)self buttons];
      uint64_t v50 = [v49 count] - 1;

      if (v121 == v50)
      {
        v51 = [v26 trailingAnchor];
        v52 = [(PURadioButtonGroup *)self view];
        v53 = [v52 trailingAnchor];
        v54 = [v51 constraintEqualToAnchor:v53 constant:-10.0];
        v134 = v54;
        v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:1];
        [v21 addObjectsFromArray:v55];
      }
      if (v121)
      {
        v56 = [(PURadioButtonGroup *)self buttons];
        uint64_t v57 = [v56 count] - 1;

        if (v121 != v57)
        {
          v58 = [v26 trailingAnchor];
          v59 = [(PURadioButtonGroup *)self buttons];
          v60 = [v59 objectAtIndexedSubscript:v121 + 1];
          v61 = [v60 leadingAnchor];
          v62 = [v58 constraintEqualToAnchor:v61 constant:-24.0];
          v133 = v62;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
          v64 = v63 = v26;
          [v21 addObjectsFromArray:v64];

          v26 = v63;
        }
      }

      uint64_t v24 = v121 + 1;
      v65 = [(PURadioButtonGroup *)self buttons];
      unint64_t v66 = [v65 count];
    }
    while (v66 > v121 + 1);
  }

  v67 = [(PURadioButtonGroup *)self verticalConstraints];
  v68 = [(PURadioButtonGroup *)self buttons];
  uint64_t v69 = [v68 count];

  if (v69)
  {
    uint64_t v70 = 0;
    do
    {
      uint64_t v122 = v70;
      v71 = [(PURadioButtonGroup *)self buttons];
      v72 = [v71 objectAtIndexedSubscript:v70];

      v118 = [v72 widthAnchor];
      v120 = [(PURadioButtonGroup *)self view];
      v73 = [v120 widthAnchor];
      v74 = [v118 constraintLessThanOrEqualToAnchor:v73 constant:-20.0];
      v132[0] = v74;
      [v72 centerXAnchor];
      v76 = v75 = v67;
      v77 = [(PURadioButtonGroup *)self view];
      v78 = [v77 centerXAnchor];
      v79 = [v76 constraintEqualToAnchor:v78];
      v132[1] = v79;
      v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:2];
      [v75 addObjectsFromArray:v80];

      v67 = v75;
      if (!v122)
      {
        v81 = [v72 topAnchor];
        v82 = [(PURadioButtonGroup *)self view];
        v83 = [v82 topAnchor];
        v84 = [v81 constraintEqualToAnchor:v83 constant:14.0];
        v131 = v84;
        v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1];
        [v67 addObjectsFromArray:v85];

        v86 = [(PURadioButtonGroup *)self buttons];
        unint64_t v87 = [v86 count];

        if (v87 >= 2)
        {
          v88 = [v72 bottomAnchor];
          v89 = [(PURadioButtonGroup *)self buttons];
          v90 = [v89 objectAtIndexedSubscript:1];
          v91 = [v90 topAnchor];
          v92 = [v88 constraintEqualToAnchor:v91 constant:-24.0];
          v130 = v92;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1];
          v94 = v93 = v72;
          [v67 addObjectsFromArray:v94];

          v72 = v93;
        }
      }
      v95 = [(PURadioButtonGroup *)self buttons];
      uint64_t v96 = [v95 count] - 1;

      if (v122 == v96)
      {
        v97 = [v72 bottomAnchor];
        v98 = [(PURadioButtonGroup *)self view];
        v99 = [v98 bottomAnchor];
        v100 = [v97 constraintEqualToAnchor:v99 constant:-14.0];
        v129 = v100;
        v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
        [v67 addObjectsFromArray:v101];
      }
      if (v122)
      {
        v102 = [(PURadioButtonGroup *)self buttons];
        uint64_t v103 = [v102 count] - 1;

        if (v122 != v103)
        {
          v104 = [v72 bottomAnchor];
          v105 = [(PURadioButtonGroup *)self buttons];
          v106 = [v105 objectAtIndexedSubscript:v122 + 1];
          v107 = [v106 topAnchor];
          v108 = [v104 constraintEqualToAnchor:v107 constant:-24.0];
          v128 = v108;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v128 count:1];
          v110 = v109 = v72;
          [v67 addObjectsFromArray:v110];

          v72 = v109;
        }
      }

      uint64_t v70 = v122 + 1;
      v111 = [(PURadioButtonGroup *)self buttons];
      unint64_t v112 = [v111 count];
    }
    while (v112 > v122 + 1);
  }

  v113 = [(PURadioButtonGroup *)self radioButtonDelegate];
  uint64_t v114 = [v113 layoutDirection];

  v115 = (void *)MEMORY[0x1E4F28DC8];
  if (v114) {
    [(PURadioButtonGroup *)self verticalConstraints];
  }
  else {
  v116 = [(PURadioButtonGroup *)self horizontalConstraints];
  }
  [v115 activateConstraints:v116];
}

- (PURadioButtonGroup)initWithImages:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PURadioButtonGroup;
  uint64_t v8 = [(PURadioButtonGroup *)&v13 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_radioButtonDelegate, v7);
    uint64_t v10 = [v6 copy];
    images = v9->_images;
    v9->_images = (NSArray *)v10;
  }
  return v9;
}

@end