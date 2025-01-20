@interface _BKEndOfBookCardTransitionSnapshotView
- (UIView)backgroundView;
- (UIView)closeButtonView;
- (UIView)snapshot;
- (_BKEndOfBookCardTransitionSnapshotView)initWithCompactViewController:(id)a3;
- (double)snapshotTopOffset;
- (void)setSnapshotTopOffset:(double)a3;
- (void)setupConstraintsToSuperview;
@end

@implementation _BKEndOfBookCardTransitionSnapshotView

- (_BKEndOfBookCardTransitionSnapshotView)initWithCompactViewController:(id)a3
{
  id v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)_BKEndOfBookCardTransitionSnapshotView;
  v5 = [(_BKEndOfBookToastBlurEffectView *)&v69 init];
  if (v5)
  {
    v6 = [v4 feedViewController];
    v7 = [v6 view];
    uint64_t v8 = [v7 backgroundColor];

    v9 = [v6 view];
    [v9 setBackgroundColor:0];

    v67 = v6;
    v10 = [v6 view];
    uint64_t v11 = [v10 snapshotViewAfterScreenUpdates:0];
    snapshot = v5->_snapshot;
    v5->_snapshot = (UIView *)v11;

    v13 = [v6 view];
    v66 = (void *)v8;
    [v13 setBackgroundColor:v8];

    [(UIView *)v5->_snapshot setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v5->_snapshot bounds];
    double x = v71.origin.x;
    double y = v71.origin.y;
    double width = v71.size.width;
    double height = v71.size.height;
    double v18 = CGRectGetHeight(v71);
    v72.origin.double x = x;
    v72.origin.double y = y;
    v72.size.double width = width;
    v72.size.double height = height;
    double v19 = v18 / CGRectGetWidth(v72);
    -[_BKEndOfBookCardTransitionSnapshotView setFrame:](v5, "setFrame:", x, y, width, height);
    v20 = [objc_alloc((Class)UIView) initWithFrame:x, y, width, height];
    backgroundView = v5->_backgroundView;
    v5->_backgroundView = v20;

    [(UIView *)v5->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v5->_backgroundView setBackgroundColor:v8];
    uint64_t v22 = +[BCCardGripperView cardGripperViewWithStyle:1];
    closeButtonView = v5->_closeButtonView;
    v5->_closeButtonView = (UIView *)v22;

    [(UIView *)v5->_closeButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_BKEndOfBookCardTransitionSnapshotView *)v5 addSubview:v5->_backgroundView];
    [(_BKEndOfBookCardTransitionSnapshotView *)v5 addSubview:v5->_snapshot];
    [(_BKEndOfBookCardTransitionSnapshotView *)v5 addSubview:v5->_closeButtonView];
    v24 = [(UIView *)v5->_snapshot topAnchor];
    [(UIView *)v5->_snapshot superview];
    v25 = id v68 = v4;
    v26 = [v25 topAnchor];
    uint64_t v27 = [v24 constraintEqualToAnchor:v26 constant:0.0];
    snapshotTopConstraint = v5->_snapshotTopConstraint;
    v5->_snapshotTopConstraint = (NSLayoutConstraint *)v27;

    v70[0] = v5->_snapshotTopConstraint;
    v64 = [(UIView *)v5->_snapshot leftAnchor];
    v65 = [(UIView *)v5->_snapshot superview];
    v63 = [v65 leftAnchor];
    v62 = [v64 constraintEqualToAnchor:v63];
    v70[1] = v62;
    v60 = [(UIView *)v5->_snapshot rightAnchor];
    v61 = [(UIView *)v5->_snapshot superview];
    v59 = [v61 rightAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v70[2] = v58;
    v57 = [(UIView *)v5->_snapshot heightAnchor];
    v56 = [(UIView *)v5->_snapshot widthAnchor];
    v55 = [v57 constraintEqualToAnchor:v56 multiplier:v19];
    v70[3] = v55;
    v53 = [(UIView *)v5->_backgroundView topAnchor];
    v54 = [(UIView *)v5->_backgroundView superview];
    v52 = [v54 topAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v70[4] = v51;
    v49 = [(UIView *)v5->_backgroundView leftAnchor];
    v50 = [(UIView *)v5->_backgroundView superview];
    v48 = [v50 leftAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v70[5] = v47;
    v45 = [(UIView *)v5->_backgroundView rightAnchor];
    v46 = [(UIView *)v5->_backgroundView superview];
    v44 = [v46 rightAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v70[6] = v43;
    v41 = [(UIView *)v5->_backgroundView bottomAnchor];
    v42 = [(UIView *)v5->_backgroundView superview];
    v40 = [v42 bottomAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v70[7] = v39;
    v29 = [(UIView *)v5->_closeButtonView topAnchor];
    v30 = [(UIView *)v5->_closeButtonView superview];
    v31 = [v30 topAnchor];
    v32 = [v29 constraintEqualToAnchor:v31 constant:15.0];
    v70[8] = v32;
    v33 = [(UIView *)v5->_closeButtonView trailingAnchor];
    v34 = [(UIView *)v5->_closeButtonView superview];
    v35 = [v34 trailingAnchor];
    v36 = [v33 constraintEqualToAnchor:v35 constant:-14.5];
    v70[9] = v36;
    v37 = +[NSArray arrayWithObjects:v70 count:10];
    +[NSLayoutConstraint activateConstraints:v37];

    id v4 = v68;
  }

  return v5;
}

- (double)snapshotTopOffset
{
  [(NSLayoutConstraint *)self->_snapshotTopConstraint constant];
  return result;
}

- (void)setSnapshotTopOffset:(double)a3
{
}

- (void)setupConstraintsToSuperview
{
  [(_BKEndOfBookCardTransitionSnapshotView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  double v18 = [(_BKEndOfBookCardTransitionSnapshotView *)self topAnchor];
  double v19 = [(_BKEndOfBookCardTransitionSnapshotView *)self superview];
  v17 = [v19 topAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v20[0] = v16;
  v14 = [(_BKEndOfBookCardTransitionSnapshotView *)self bottomAnchor];
  v15 = [(_BKEndOfBookCardTransitionSnapshotView *)self superview];
  v13 = [v15 bottomAnchor];
  v3 = [v14 constraintEqualToAnchor:v13];
  v20[1] = v3;
  id v4 = [(_BKEndOfBookCardTransitionSnapshotView *)self leftAnchor];
  v5 = [(_BKEndOfBookCardTransitionSnapshotView *)self superview];
  v6 = [v5 leftAnchor];
  v7 = [v4 constraintEqualToAnchor:v6];
  v20[2] = v7;
  uint64_t v8 = [(_BKEndOfBookCardTransitionSnapshotView *)self rightAnchor];
  v9 = [(_BKEndOfBookCardTransitionSnapshotView *)self superview];
  v10 = [v9 rightAnchor];
  uint64_t v11 = [v8 constraintEqualToAnchor:v10];
  v20[3] = v11;
  v12 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (UIView)snapshot
{
  return self->_snapshot;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)closeButtonView
{
  return self->_closeButtonView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButtonView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);

  objc_storeStrong((id *)&self->_snapshotTopConstraint, 0);
}

@end