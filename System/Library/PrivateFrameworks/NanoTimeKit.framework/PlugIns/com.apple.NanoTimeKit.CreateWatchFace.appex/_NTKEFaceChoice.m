@interface _NTKEFaceChoice
- (NSLayoutConstraint)titleBaselineConstraint;
- (NTKCFaceContainerView)faceContainer;
- (NTKCompanionFaceViewController)faceVC;
- (NTKFace)face;
- (UILabel)title;
- (_NTKEFaceChoice)initWithFace:(id)a3;
- (_NTKEFaceChoiceDelegate)delegate;
- (_NTKEFaceChoiceHighlightButton)faceButton;
- (_NTKEFaceChoiceHighlightButton)titleButton;
- (void)_selected;
- (void)_updateTitle;
- (void)button:(id)a3 didHighlight:(BOOL)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setFace:(id)a3;
- (void)setFaceButton:(id)a3;
- (void)setFaceContainer:(id)a3;
- (void)setFaceVC:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleBaselineConstraint:(id)a3;
- (void)setTitleButton:(id)a3;
@end

@implementation _NTKEFaceChoice

- (_NTKEFaceChoice)initWithFace:(id)a3
{
  id v52 = a3;
  v53.receiver = self;
  v53.super_class = (Class)_NTKEFaceChoice;
  v4 = -[_NTKEFaceChoice initWithFrame:](&v53, "initWithFrame:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  v5 = v4;
  if (v4)
  {
    [(_NTKEFaceChoice *)v4 setFace:v52];
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    v6 = (void *)qword_1000115C0;
    v62 = (void *)qword_1000115C0;
    if (!qword_1000115C0)
    {
      v54 = _NSConcreteStackBlock;
      uint64_t v55 = 3221225472;
      v56 = sub_100005D94;
      v57 = &unk_10000C348;
      v58 = &v59;
      sub_100005D94((uint64_t)&v54);
      v6 = (void *)v60[3];
    }
    v7 = v6;
    _Block_object_dispose(&v59, 8);
    id v8 = [[v7 alloc] initWithFace:v5->_face];
    [(_NTKEFaceChoice *)v5 setFaceVC:v8];

    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2050000000;
    v9 = (void *)qword_1000115C8;
    v62 = (void *)qword_1000115C8;
    if (!qword_1000115C8)
    {
      v54 = _NSConcreteStackBlock;
      uint64_t v55 = 3221225472;
      v56 = sub_100005DEC;
      v57 = &unk_10000C348;
      v58 = &v59;
      sub_100005DEC((uint64_t)&v54);
      v9 = (void *)v60[3];
    }
    v10 = v9;
    _Block_object_dispose(&v59, 8);
    id v11 = [v10 alloc];
    uint64_t v12 = sub_1000053D4();
    if (v12 == -1)
    {
      double v16 = 142.5;
      double v14 = 114.0;
    }
    else
    {
      v10 = +[CLKDevice currentDevice];
      [(objc_class *)v10 screenBounds];
      double v14 = v13;
      double v16 = v15;
    }
    id v17 = objc_msgSend(v11, "initWithFaceSize:style:", 2, v14, v16);
    [(_NTKEFaceChoice *)v5 setFaceContainer:v17];

    if (v12 != -1) {
    v18 = [(NTKCompanionFaceViewController *)v5->_faceVC view];
    }
    [(NTKCFaceContainerView *)v5->_faceContainer setFaceView:v18];

    LODWORD(v19) = 1148846080;
    [(NTKCFaceContainerView *)v5->_faceContainer setContentHuggingPriority:1 forAxis:v19];
    LODWORD(v20) = 1148846080;
    [(NTKCFaceContainerView *)v5->_faceContainer setContentHuggingPriority:0 forAxis:v20];
    LODWORD(v21) = 1148846080;
    [(NTKCFaceContainerView *)v5->_faceContainer setContentCompressionResistancePriority:1 forAxis:v21];
    LODWORD(v22) = 1148846080;
    [(NTKCFaceContainerView *)v5->_faceContainer setContentCompressionResistancePriority:0 forAxis:v22];
    [(_NTKEFaceChoice *)v5 addSubview:v5->_faceContainer];
    v23 = objc_opt_new();
    [(_NTKEFaceChoice *)v5 setTitle:v23];

    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2020000000;
    v24 = (void (*)(void))off_1000115D8;
    v62 = off_1000115D8;
    if (!off_1000115D8)
    {
      v54 = _NSConcreteStackBlock;
      uint64_t v55 = 3221225472;
      v56 = sub_100005E94;
      v57 = &unk_10000C348;
      v58 = &v59;
      v25 = (void *)sub_100005B80();
      v26 = dlsym(v25, "NTKCActionColor");
      *(void *)(v58[1] + 24) = v26;
      off_1000115D8 = *(_UNKNOWN **)(v58[1] + 24);
      v24 = (void (*)(void))v60[3];
    }
    _Block_object_dispose(&v59, 8);
    if (!v24)
    {
      sub_1000080B4();
      __break(1u);
    }
    v27 = v24();
    [(UILabel *)v5->_title setTextColor:v27];

    v28 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v5->_title setFont:v28];

    [(UILabel *)v5->_title setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_title setNumberOfLines:0];
    [(UILabel *)v5->_title setTextAlignment:1];
    LODWORD(v29) = 1148846080;
    [(UILabel *)v5->_title setContentHuggingPriority:1 forAxis:v29];
    LODWORD(v30) = 1148846080;
    [(UILabel *)v5->_title setContentCompressionResistancePriority:1 forAxis:v30];
    LODWORD(v31) = 1148846080;
    [(UILabel *)v5->_title setContentCompressionResistancePriority:0 forAxis:v31];
    [(_NTKEFaceChoice *)v5 addSubview:v5->_title];
    v32 = +[_NTKEFaceChoiceHighlightButton buttonWithType:1];
    [(_NTKEFaceChoice *)v5 setFaceButton:v32];

    [(_NTKEFaceChoiceHighlightButton *)v5->_faceButton setDelegate:v5];
    [(_NTKEFaceChoiceHighlightButton *)v5->_faceButton addTarget:v5 action:"_selected" forControlEvents:64];
    [(_NTKEFaceChoice *)v5 addSubview:v5->_faceButton];
    v33 = objc_opt_new();
    [(_NTKEFaceChoice *)v5 setTitleButton:v33];

    [(_NTKEFaceChoiceHighlightButton *)v5->_titleButton setDelegate:v5];
    [(_NTKEFaceChoiceHighlightButton *)v5->_titleButton addTarget:v5 action:"_selected" forControlEvents:64];
    [(_NTKEFaceChoice *)v5 addSubview:v5->_titleButton];
    [(_NTKEFaceChoice *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(NTKCFaceContainerView *)v5->_faceContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_title setTranslatesAutoresizingMaskIntoConstraints:0];
    v34 = [(UILabel *)v5->_title firstBaselineAnchor];
    v35 = [(NTKCFaceContainerView *)v5->_faceContainer bottomAnchor];
    v36 = [v34 constraintEqualToAnchor:v35 constant:0.0];
    [(_NTKEFaceChoice *)v5 setTitleBaselineConstraint:v36];

    [(_NTKEFaceChoice *)v5 _updateTitle];
    v50 = [(NTKCFaceContainerView *)v5->_faceContainer topAnchor];
    v51 = [(_NTKEFaceChoice *)v5 topAnchor];
    v49 = [v50 constraintEqualToAnchor:v51];
    v63[0] = v49;
    v48 = [(NTKCFaceContainerView *)v5->_faceContainer centerXAnchor];
    v37 = [(_NTKEFaceChoice *)v5 centerXAnchor];
    v38 = [v48 constraintEqualToAnchor:v37];
    v63[1] = v38;
    v39 = [(UILabel *)v5->_title centerXAnchor];
    v40 = [(NTKCFaceContainerView *)v5->_faceContainer centerXAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v63[2] = v41;
    v63[3] = v5->_titleBaselineConstraint;
    v42 = [(UILabel *)v5->_title bottomAnchor];
    v43 = [(_NTKEFaceChoice *)v5 bottomAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    v63[4] = v44;
    v45 = +[NSArray arrayWithObjects:v63 count:5];

    +[NSLayoutConstraint activateConstraints:v45];
    v46 = +[NSNotificationCenter defaultCenter];
    [v46 addObserver:v5 selector:"_fontSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)_NTKEFaceChoice;
  [(_NTKEFaceChoice *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_NTKEFaceChoice;
  [(_NTKEFaceChoice *)&v3 layoutSubviews];
  [(NTKCFaceContainerView *)self->_faceContainer frame];
  -[_NTKEFaceChoiceHighlightButton setFrame:](self->_faceButton, "setFrame:");
  [(UILabel *)self->_title frame];
  -[_NTKEFaceChoiceHighlightButton setFrame:](self->_titleButton, "setFrame:");
}

- (void)_updateTitle
{
  uint64_t v3 = sub_1000053D4();
  if (sub_100004998())
  {
    id v8 = [(NTKFace *)self->_face name];
    double v4 = 44.0;
    [(UILabel *)self->_title setText:v8];
  }
  else
  {
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"FORMAT_WATCH_FACE" value:&stru_10000C520 table:0];

    v7 = [(NTKFace *)self->_face name];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v3 == -1) {
      double v4 = 30.0;
    }
    else {
      double v4 = 36.0;
    }

    [(UILabel *)self->_title setText:v8];
  }
  [(NSLayoutConstraint *)self->_titleBaselineConstraint setConstant:v4];
}

- (void)_selected
{
  id v3 = [(_NTKEFaceChoice *)self delegate];
  [v3 didChooseFace:self->_face];
}

- (void)button:(id)a3 didHighlight:(BOOL)a4
{
  BOOL v4 = a4;
  [(NTKCFaceContainerView *)self->_faceContainer setHighlighted:a4];
  if (v4)
  {
    title = self->_title;
    [(UILabel *)title setAlpha:0.2];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100005844;
    v7[3] = &unk_10000C3A8;
    v7[4] = self;
    +[UIView animateWithDuration:327684 delay:v7 options:0 animations:0.2 completion:0.0];
  }
}

- (NTKFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
}

- (_NTKEFaceChoiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_NTKEFaceChoiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NTKCompanionFaceViewController)faceVC
{
  return self->_faceVC;
}

- (void)setFaceVC:(id)a3
{
}

- (NTKCFaceContainerView)faceContainer
{
  return self->_faceContainer;
}

- (void)setFaceContainer:(id)a3
{
}

- (_NTKEFaceChoiceHighlightButton)faceButton
{
  return self->_faceButton;
}

- (void)setFaceButton:(id)a3
{
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (_NTKEFaceChoiceHighlightButton)titleButton
{
  return self->_titleButton;
}

- (void)setTitleButton:(id)a3
{
}

- (NSLayoutConstraint)titleBaselineConstraint
{
  return self->_titleBaselineConstraint;
}

- (void)setTitleBaselineConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_faceButton, 0);
  objc_storeStrong((id *)&self->_faceContainer, 0);
  objc_storeStrong((id *)&self->_faceVC, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_face, 0);
}

@end