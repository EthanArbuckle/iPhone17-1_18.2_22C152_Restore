@interface CardTestContainee
- (CardTestContainee)initWithContext:(id)a3;
- (double)heightForLayout:(unint64_t)a3;
- (id)description;
- (void)_createSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CardTestContainee

- (CardTestContainee)initWithContext:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CardTestContainee;
  v5 = [(CardTestContainee *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    [(ContaineeViewController *)v6 setContaineeDelegate:v4];
    v7 = [(ContaineeViewController *)v6 cardPresentationController];
    [v7 setAllowResizeInFloatingStyle:1];

    v8 = [(ContaineeViewController *)v6 cardPresentationController];
    [v8 setDefaultContaineeLayout:2];

    v9 = [(ContaineeViewController *)v6 cardPresentationController];
    [v9 setBlurInCardView:0];

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_context);
    if (WeakRetained)
    {
      id v11 = objc_loadWeakRetained((id *)&v6->_context);
      v12 = [v11 containees];
      double v13 = (float)((float)((unint64_t)[v12 count] % 0xA) * 0.1);
    }
    else
    {
      double v13 = 0.0;
    }

    v14 = +[UIColor colorWithHue:v13 saturation:0.699999988 brightness:0.899999976 alpha:1.0];
    v15 = [(ContaineeViewController *)v6 cardPresentationController];
    [v15 setCardColor:v14];
  }
  return v6;
}

- (id)description
{
  v16.receiver = self;
  v16.super_class = (Class)CardTestContainee;
  v14 = [(CardTestContainee *)&v16 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v3 = [WeakRetained chromeViewController];
  id v4 = [v3 contexts];
  id v5 = objc_loadWeakRetained((id *)&self->_context);
  id v6 = [v4 indexOfObject:v5];
  id v7 = objc_loadWeakRetained((id *)&self->_context);
  v8 = [v7 containees];
  id v9 = [v8 indexOfObject:self];
  if ((id)[(ContaineeViewController *)self preferredPresentationStyle] == (id)3) {
    v10 = "popover";
  }
  else {
    v10 = "card";
  }
  id v11 = objc_loadWeakRetained((id *)&self->_context);
  v12 = +[NSString stringWithFormat:@"%@ %lu.%lu %s (context: %@)", v14, v6, v9, v10, v11];

  return v12;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CardTestContainee;
  [(ContaineeViewController *)&v5 viewDidLoad];
  v3 = +[UIColor colorWithHue:(float)((float)(arc4random() % 0x64) / 100.0) saturation:0.800000012 brightness:0.800000012 alpha:1.0];
  id v4 = [(CardTestContainee *)self view];
  [v4 setBackgroundColor:v3];

  [(CardTestContainee *)self _createSubviews];
}

- (void)_createSubviews
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_1005C14DC;
  v90[3] = &unk_1012EBC40;
  v90[4] = self;
  id v4 = +[UIAction actionWithTitle:@"Pop" image:0 identifier:0 handler:v90];
  objc_super v5 = +[UIButton buttonWithType:1 primaryAction:v4];
  [v3 addObject:v5];

  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_1005C1528;
  v89[3] = &unk_1012EBC40;
  v89[4] = self;
  id v6 = +[UIAction actionWithTitle:@"Push" image:0 identifier:0 handler:v89];
  id v7 = +[UIButton buttonWithType:1 primaryAction:v6];
  [v3 addObject:v7];

  id v8 = objc_alloc_init((Class)NSMutableArray);
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_1005C1574;
  v88[3] = &unk_1012EBC40;
  v88[4] = self;
  id v9 = +[UIAction actionWithTitle:@"Pop" image:0 identifier:0 handler:v88];
  v10 = +[UIButton buttonWithType:1 primaryAction:v9];
  [v8 addObject:v10];

  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_1005C15C0;
  v87[3] = &unk_1012EBC40;
  v87[4] = self;
  id v11 = +[UIAction actionWithTitle:@"Push" image:0 identifier:0 handler:v87];
  v12 = +[UIButton buttonWithType:1 primaryAction:v11];
  [v8 addObject:v12];

  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_1005C160C;
  v86[3] = &unk_1012EBC40;
  v86[4] = self;
  double v13 = +[UIAction actionWithTitle:@"Push (No Floating Controls)" image:0 identifier:0 handler:v86];
  v14 = +[UIButton buttonWithType:1 primaryAction:v13];
  [v8 addObject:v14];

  v75 = v3;
  [v3 enumerateObjectsUsingBlock:&stru_1012F11C8];
  [v8 enumerateObjectsUsingBlock:&stru_1012F11C8];
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_1005C16F4;
  v85[3] = &unk_1012F11F0;
  v85[4] = self;
  v15 = objc_retainBlock(v85);
  objc_super v16 = (void (**)(char *))(v15 + 16);
  objc_super v17 = v15;
  v79 = v15;
  (*((void (**)(void))v15 + 2))();
  v18 = (UILabel *)objc_claimAutoreleasedReturnValue();
  containeeLabel = self->_containeeLabel;
  self->_containeeLabel = v18;

  v20 = [(CardTestContainee *)self view];
  [v20 addSubview:self->_containeeLabel];

  (*v16)(v17);
  v21 = (UILabel *)objc_claimAutoreleasedReturnValue();
  contextLabel = self->_contextLabel;
  self->_contextLabel = v21;

  v23 = [(CardTestContainee *)self view];
  [v23 addSubview:self->_contextLabel];

  id v24 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v3];
  [v24 setDistribution:2];
  [v24 setAxis:1];
  v78 = v24;
  [v24 setSpacing:20.0];
  v76 = v8;
  id v77 = [objc_alloc((Class)UIStackView) initWithArrangedSubviews:v8];
  [v77 setDistribution:2];
  [v77 setAxis:1];
  [v77 setSpacing:20.0];
  id v25 = objc_alloc((Class)UIStackView);
  v92[0] = v77;
  v92[1] = v24;
  v26 = +[NSArray arrayWithObjects:v92 count:2];
  id v27 = [v25 initWithArrangedSubviews:v26];

  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v27 setDistribution:1];
  [v27 setAlignment:1];
  [v27 setAxis:0];
  [v27 setSpacing:20.0];
  v28 = [(CardTestContainee *)self view];
  [v28 addSubview:v27];

  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_1005C1804;
  v83[3] = &unk_1012EBD58;
  id v29 = objc_alloc_init((Class)NSMutableArray);
  id v84 = v29;
  [v8 enumerateObjectsUsingBlock:v83];
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_1005C1874;
  v81[3] = &unk_1012EBD58;
  id v82 = v29;
  id v80 = v29;
  [v3 enumerateObjectsUsingBlock:v81];
  v73 = [(UILabel *)self->_contextLabel topAnchor];
  v74 = [(CardTestContainee *)self view];
  v72 = [v74 topAnchor];
  v71 = [v73 constraintEqualToAnchor:v72 constant:20.0];
  v91[0] = v71;
  v70 = [(UILabel *)self->_containeeLabel topAnchor];
  v69 = [(UILabel *)self->_contextLabel topAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v91[1] = v68;
  v67 = [(UILabel *)self->_containeeLabel bottomAnchor];
  v66 = [(UILabel *)self->_contextLabel bottomAnchor];
  v65 = [v67 constraintEqualToAnchor:v66];
  v91[2] = v65;
  v63 = [(UILabel *)self->_contextLabel leadingAnchor];
  v64 = [(CardTestContainee *)self view];
  v62 = [v64 leadingAnchor];
  v61 = [v63 constraintEqualToAnchor:v62 constant:20.0];
  v91[3] = v61;
  v60 = [(UILabel *)self->_containeeLabel leadingAnchor];
  v59 = [(UILabel *)self->_contextLabel trailingAnchor];
  v58 = [v60 constraintEqualToAnchor:v59 constant:10.0];
  v91[4] = v58;
  v57 = [(CardTestContainee *)self view];
  v56 = [v57 trailingAnchor];
  v55 = [(UILabel *)self->_containeeLabel trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:20.0];
  v91[5] = v54;
  v53 = [(UILabel *)self->_contextLabel widthAnchor];
  v52 = [(UILabel *)self->_containeeLabel widthAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v91[6] = v51;
  v50 = [v27 heightAnchor];
  v49 = [v50 constraintGreaterThanOrEqualToConstant:100.0];
  v91[7] = v49;
  v48 = [v27 heightAnchor];
  v47 = [v48 constraintLessThanOrEqualToConstant:200.0];
  v91[8] = v47;
  v46 = [v27 topAnchor];
  v45 = [(UILabel *)self->_contextLabel bottomAnchor];
  v44 = [v46 constraintEqualToAnchor:v45 constant:20.0];
  v91[9] = v44;
  v42 = [v27 leadingAnchor];
  v43 = [(CardTestContainee *)self view];
  v41 = [v43 leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41 constant:20.0];
  v91[10] = v40;
  v30 = [(CardTestContainee *)self view];
  v31 = [v30 trailingAnchor];
  v32 = [v27 trailingAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 constant:20.0];
  v91[11] = v33;
  v34 = [(CardTestContainee *)self view];
  v35 = [v34 bottomAnchor];
  v36 = [v27 bottomAnchor];
  LODWORD(v37) = 1144733696;
  v38 = [v35 constraintEqualToAnchor:v36 constant:60.0 priority:v37];
  v91[12] = v38;
  v39 = +[NSArray arrayWithObjects:v91 count:13];
  [v80 addObjectsFromArray:v39];

  +[NSLayoutConstraint activateConstraints:v80];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CardTestContainee;
  [(ContaineeViewController *)&v8 viewWillAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  objc_super v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Containee %lu", [WeakRetained indexOfContainee:self]);
  [(UILabel *)self->_containeeLabel setText:v5];

  id v6 = objc_loadWeakRetained((id *)&self->_context);
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Context %lu", [v6 indexOfContext]);
  [(UILabel *)self->_contextLabel setText:v7];
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 - 3 < 2)
  {
    objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
    [v5 availableHeight];
    double v7 = v6;

    return v7;
  }
  else if (a3 == 1)
  {
    return 88.0;
  }
  else if (a3 == 2)
  {
    sub_10002197C();
  }
  else
  {
    return -1.0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containeeLabel, 0);
  objc_storeStrong((id *)&self->_contextLabel, 0);

  objc_destroyWeak((id *)&self->_context);
}

@end