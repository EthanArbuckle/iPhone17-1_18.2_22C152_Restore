@interface DeclineAcceptButtonsView
- (DeclineAcceptButtonsView)initWithDeclineTitle:(id)a3 declineAction:(id)a4 acceptTitle:(id)a5 acceptAction:(id)a6;
- (void)_acceptAction;
- (void)_declineAction;
@end

@implementation DeclineAcceptButtonsView

- (DeclineAcceptButtonsView)initWithDeclineTitle:(id)a3 declineAction:(id)a4 acceptTitle:(id)a5 acceptAction:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v66.receiver = self;
  v66.super_class = (Class)DeclineAcceptButtonsView;
  v14 = [(DeclineAcceptButtonsView *)&v66 init];
  if (v14)
  {
    id v15 = objc_retainBlock(v13);
    id v64 = v13;
    id acceptAction = v14->_acceptAction;
    v14->_id acceptAction = v15;

    id v17 = objc_retainBlock(v11);
    id declineAction = v14->_declineAction;
    v14->_id declineAction = v17;

    v19 = [[DeclineAcceptButton alloc] initWithAccept:0];
    [(DeclineAcceptButton *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DeclineAcceptButton *)v19 addTarget:v14 action:"_declineAction" forControlEvents:64];
    v20 = [(DeclineAcceptButton *)v19 titleLabel];
    +[DynamicTypeWizard autorefreshLabel:v20 withFontProvider:&stru_1013213A0];

    id v21 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v68 = NSForegroundColorAttributeName;
    v22 = [(DeclineAcceptButtonsView *)v14 mk_theme];
    [v22 tintColor];
    v23 = id v65 = v11;
    v69 = v23;
    v24 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    id v63 = [v21 initWithString:v10 attributes:v24];

    [(DeclineAcceptButton *)v19 setAttributedTitle:v63 forState:0];
    [(DeclineAcceptButtonsView *)v14 addSubview:v19];
    v25 = [[DeclineAcceptButton alloc] initWithAccept:1];
    [(DeclineAcceptButton *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DeclineAcceptButton *)v25 addTarget:v14 action:"_acceptAction" forControlEvents:64];
    v26 = [(DeclineAcceptButton *)v25 titleLabel];
    +[DynamicTypeWizard autorefreshLabel:v26 withFontProvider:&stru_1013213A0];

    [(DeclineAcceptButton *)v25 setTitle:v12 forState:0];
    [(DeclineAcceptButtonsView *)v14 addSubview:v25];
    v62 = [(DeclineAcceptButton *)v19 leadingAnchor];
    v61 = [(DeclineAcceptButtonsView *)v14 leadingAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v67[0] = v60;
    v59 = [(DeclineAcceptButton *)v19 trailingAnchor];
    v58 = [(DeclineAcceptButton *)v25 leadingAnchor];
    v57 = [v59 constraintEqualToAnchor:v58 constant:-8.0];
    v67[1] = v57;
    v56 = [(DeclineAcceptButton *)v19 topAnchor];
    v55 = [(DeclineAcceptButtonsView *)v14 topAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v67[2] = v54;
    v53 = [(DeclineAcceptButton *)v19 bottomAnchor];
    v52 = [(DeclineAcceptButtonsView *)v14 bottomAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v67[3] = v51;
    v50 = [(DeclineAcceptButton *)v19 heightAnchor];
    v49 = [v50 constraintGreaterThanOrEqualToConstant:53.0];
    v48 = +[DynamicTypeWizard autoscaledConstraint:v49 constant:&stru_1013213A0 withFontProvider:53.0];
    v67[4] = v48;
    v46 = [(DeclineAcceptButton *)v25 trailingAnchor];
    v45 = [(DeclineAcceptButtonsView *)v14 trailingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v67[5] = v44;
    v43 = [(DeclineAcceptButton *)v25 topAnchor];
    v42 = [(DeclineAcceptButton *)v19 topAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v67[6] = v41;
    v40 = [(DeclineAcceptButton *)v25 bottomAnchor];
    v39 = [(DeclineAcceptButton *)v19 bottomAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v67[7] = v38;
    v37 = [(DeclineAcceptButton *)v25 heightAnchor];
    v47 = v19;
    v27 = [(DeclineAcceptButton *)v19 heightAnchor];
    v28 = [v37 constraintEqualToAnchor:v27];
    v67[8] = v28;
    v29 = [(DeclineAcceptButton *)v25 widthAnchor];
    [(DeclineAcceptButton *)v19 widthAnchor];
    v31 = id v30 = v10;
    [v29 constraintEqualToAnchor:v31];
    v32 = v14;
    v34 = id v33 = v12;
    v67[9] = v34;
    v35 = +[NSArray arrayWithObjects:v67 count:10];
    +[NSLayoutConstraint activateConstraints:v35];

    id v13 = v64;
    id v12 = v33;
    v14 = v32;

    id v10 = v30;
    id v11 = v65;
  }
  return v14;
}

- (void)_acceptAction
{
}

- (void)_declineAction
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_declineAction, 0);

  objc_storeStrong(&self->_acceptAction, 0);
}

@end