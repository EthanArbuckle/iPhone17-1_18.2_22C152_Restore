@interface RAPInstructionIncorrectView
- (RAPInstructionIncorrectView)initWithFrame:(CGRect)a3;
- (UIImageView)flagView;
- (id)tapblock;
- (int)displayMode;
- (void)setDisplayMode:(int)a3;
- (void)setTapblock:(id)a3;
- (void)showFlag:(BOOL)a3;
- (void)viewTapped;
@end

@implementation RAPInstructionIncorrectView

- (RAPInstructionIncorrectView)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)RAPInstructionIncorrectView;
  v3 = -[RAPInstructionIncorrectView initWithFrame:](&v30, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIImageView);
    v5 = +[UIImage systemImageNamed:@"flag.fill"];
    v6 = (UIImageView *)[v4 initWithImage:v5];
    flagView = v3->_flagView;
    v3->_flagView = v6;

    v8 = +[UIColor systemRedColor];
    [(UIImageView *)v3->_flagView setTintColor:v8];

    [(UIImageView *)v3->_flagView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RAPInstructionIncorrectView *)v3 addSubview:v3->_flagView];
    v9 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    chevronView = v3->_chevronView;
    v3->_chevronView = v9;

    v11 = +[UIImage systemImageNamed:@"chevron.forward"];
    [(UIImageView *)v3->_chevronView setImage:v11];

    v12 = +[UIColor tertiaryLabelColor];
    [(UIImageView *)v3->_chevronView setTintColor:v12];

    [(UIImageView *)v3->_chevronView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RAPInstructionIncorrectView *)v3 addSubview:v3->_chevronView];
    id v13 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"viewTapped"];
    [(RAPInstructionIncorrectView *)v3 addGestureRecognizer:v13];
    v14 = +[NSMutableArray array];
    v15 = _NSDictionaryOfVariableBindings(@"_flagView, _chevronView", v3->_flagView, v3->_chevronView, 0);
    v16 = [(UIImageView *)v3->_flagView centerYAnchor];
    v17 = [(UIImageView *)v3->_chevronView centerYAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v14 addObject:v18];

    v19 = [(UIImageView *)v3->_chevronView centerYAnchor];
    v20 = [(RAPInstructionIncorrectView *)v3 centerYAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v14 addObject:v21];

    v22 = [(RAPInstructionIncorrectView *)v3 widthAnchor];
    v23 = [v22 constraintEqualToConstant:44.0];
    [v14 addObject:v23];

    v24 = [(RAPInstructionIncorrectView *)v3 heightAnchor];
    v25 = [v24 constraintEqualToConstant:44.0];
    [v14 addObject:v25];

    v26 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|->=0-[_flagView]-4-[_chevronView]-0-|", 0, 0, v15);
    [v14 addObjectsFromArray:v26];

    v27 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|->=0-[_flagView]->=0-|", 0, 0, v15);
    [v14 addObjectsFromArray:v27];

    v28 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|->=0-[_chevronView]->=0-|", 0, 0, v15);
    [v14 addObjectsFromArray:v28];

    +[NSLayoutConstraint activateConstraints:v14];
  }
  return v3;
}

- (void)viewTapped
{
  if (self->_tapblock)
  {
    if (self->_displayMode == 1) {
      uint64_t v3 = 10107;
    }
    else {
      uint64_t v3 = 10106;
    }
    if (self->_displayMode == 1) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    [(RAPInstructionIncorrectView *)self setDisplayMode:v4];
    +[GEOAPPortal captureUserAction:v3 target:1101 value:0];
    v5 = (void (*)(void))*((void *)self->_tapblock + 2);
    v5();
  }
}

- (void)showFlag:(BOOL)a3
{
}

- (void)setDisplayMode:(int)a3
{
  if (self->_displayMode != a3)
  {
    self->_displayMode = a3;
    switch(a3)
    {
      case 0:
        uint64_t v4 = +[UIImage systemImageNamed:@"chevron.forward"];
        [(UIImageView *)self->_chevronView setImage:v4];

        [(RAPInstructionIncorrectView *)self setUserInteractionEnabled:0];
        [(UIImageView *)self->_chevronView setAccessibilityIdentifier:0];
        CGAffineTransformMakeRotation(&v14, 0.0);
        chevronView = self->_chevronView;
        CGAffineTransform v13 = v14;
        v6 = &v13;
        goto LABEL_6;
      case 1:
        [(RAPInstructionIncorrectView *)self setUserInteractionEnabled:1];
        [(UIImageView *)self->_chevronView setAccessibilityIdentifier:@"Expand instructions"];
        v7 = +[UIImage systemImageNamed:@"chevron.forward.2"];
        [(UIImageView *)self->_chevronView setImage:v7];

        CGAffineTransformMakeRotation(&v12, 0.0);
        chevronView = self->_chevronView;
        CGAffineTransform v11 = v12;
        v6 = &v11;
        goto LABEL_6;
      case 2:
        [(RAPInstructionIncorrectView *)self setUserInteractionEnabled:1];
        [(UIImageView *)self->_chevronView setAccessibilityIdentifier:@"Collapse instructions"];
        v8 = +[UIImage systemImageNamed:@"chevron.forward.2"];
        [(UIImageView *)self->_chevronView setImage:v8];

        CGAffineTransformMakeRotation(&v10, 1.57079633);
        chevronView = self->_chevronView;
        CGAffineTransform v9 = v10;
        v6 = &v9;
LABEL_6:
        -[UIImageView setTransform:](chevronView, "setTransform:", v6, *(_OWORD *)&v9.a, *(_OWORD *)&v9.c, *(_OWORD *)&v9.tx);
        break;
      case 3:
        [(UIImageView *)self->_chevronView setHidden:1];
        [(RAPInstructionIncorrectView *)self setUserInteractionEnabled:0];
        break;
      default:
        return;
    }
  }
}

- (int)displayMode
{
  return self->_displayMode;
}

- (id)tapblock
{
  return self->_tapblock;
}

- (void)setTapblock:(id)a3
{
}

- (UIImageView)flagView
{
  return self->_flagView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagView, 0);
  objc_storeStrong(&self->_tapblock, 0);

  objc_storeStrong((id *)&self->_chevronView, 0);
}

@end