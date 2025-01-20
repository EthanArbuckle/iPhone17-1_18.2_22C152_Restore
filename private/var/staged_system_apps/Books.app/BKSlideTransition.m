@interface BKSlideTransition
+ (id)transitionWithDirection:(unint64_t)a3;
- (BKSlideTransition)init;
- (BKSlideTransition)initWithDirection:(unint64_t)a3;
- (double)transitionDuration:(id)a3;
- (unint64_t)direction;
- (void)animateTransition:(id)a3;
- (void)setDirection:(unint64_t)a3;
@end

@implementation BKSlideTransition

- (BKSlideTransition)initWithDirection:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKSlideTransition;
  result = [(BKSlideTransition *)&v5 init];
  if (result) {
    result->_direction = a3;
  }
  return result;
}

+ (id)transitionWithDirection:(unint64_t)a3
{
  id v3 = [objc_alloc((Class)a1) initWithDirection:a3];

  return v3;
}

- (BKSlideTransition)init
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = NSStringFromSelector("initWithDirection:");
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"Please use the designated initializer -[%@ %@]", v4, v5);

  return 0;
}

- (double)transitionDuration:(id)a3
{
  return 0.300000012;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 viewForKey:UITransitionContextFromViewKey];
  v6 = [v4 viewForKey:UITransitionContextToViewKey];
  v7 = [v4 containerView];
  [(BKSlideTransition *)self transitionDuration:v4];
  double v9 = v8;
  if ((id)[(BKSlideTransition *)self direction] == (id)2) {
    [v7 insertSubview:v6 belowSubview:v5];
  }
  else {
    [v7 insertSubview:v6 aboveSubview:v5];
  }
  [v5 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  unint64_t v18 = [(BKSlideTransition *)self direction];
  switch(v18)
  {
    case 0uLL:
      v43.origin.x = v11;
      v43.origin.y = v13;
      v43.size.width = v15;
      v43.size.height = v17;
      double Width = CGRectGetWidth(v43);
      v44.origin.x = v11;
      v44.origin.y = v13;
      v44.size.width = v15;
      v44.size.height = v17;
      double v21 = -CGRectGetWidth(v44);
LABEL_10:
      double v19 = v13;
      goto LABEL_13;
    case 1uLL:
      v45.origin.x = v11;
      v45.origin.y = v13;
      v45.size.width = v15;
      v45.size.height = v17;
      double Width = -CGRectGetWidth(v45);
      v46.origin.x = v11;
      v46.origin.y = v13;
      v46.size.width = v15;
      v46.size.height = v17;
      double v21 = CGRectGetWidth(v46);
      goto LABEL_10;
    case 2uLL:
      v42.origin.x = v11;
      v42.origin.y = v13;
      v42.size.width = v15;
      v42.size.height = v17;
      double v19 = v13 + CGRectGetHeight(v42);
      break;
    default:
      double v19 = v13;
      break;
  }
  double v21 = v11;
  double Width = v11;
LABEL_13:
  [v5 setFrame:v11, v13, v15, v17];
  [v6 setFrame:v21, v13, v15, v17];
  v22 = [v7 window];
  [v22 setUserInteractionEnabled:0];

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1001097DC;
  v31[3] = &unk_100A47438;
  double v34 = Width;
  double v35 = v19;
  double v36 = v15;
  double v37 = v17;
  id v32 = v5;
  id v33 = v6;
  double v38 = v11;
  double v39 = v13;
  double v40 = v15;
  double v41 = v17;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100109828;
  v27[3] = &unk_100A46930;
  id v28 = v32;
  id v29 = v7;
  id v30 = v4;
  id v23 = v4;
  id v24 = v7;
  id v25 = v32;
  id v26 = v6;
  +[UIView animateWithDuration:v31 animations:v27 completion:v9];
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

@end