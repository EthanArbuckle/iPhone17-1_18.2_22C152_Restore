@interface PREditingPosterContentStyleCoordinator
+ (id)_legibleIconColorForLuminance:(double)a3;
+ (id)coordinatorForColorWellView:(id)a3 vibrant:(BOOL)a4;
+ (id)coordinatorImplForStyle:(id)a3;
- (BOOL)isSuggested;
- (PREditingPosterContentStyleCoordinator)initWithInitialStyle:(id)a3 suggested:(BOOL)a4;
- (PREditingPosterContentStyleCoordinator)initWithInitialStyle:(id)a3 suggested:(BOOL)a4 coordinator:(id)a5;
- (PRPosterContentStyle)style;
- (UIView)itemView;
- (UIView)variationSliderThumbView;
- (UIView)variationSliderTrackView;
- (double)contentsLuminance;
- (double)itemViewLuminance;
- (double)variation;
- (void)setContentsLuminance:(double)a3;
- (void)setVariation:(double)a3;
@end

@implementation PREditingPosterContentStyleCoordinator

+ (id)coordinatorForColorWellView:(id)a3 vibrant:(BOOL)a4
{
  BOOL v4 = a4;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 colorWell];
  v8 = [v7 selectedColor];

  v9 = [PRPosterContentDiscreteColorsStyle alloc];
  v16[0] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  double v11 = 0.0;
  if (v4) {
    double v11 = 1.0;
  }
  v12 = [(PRPosterContentDiscreteColorsStyle *)v9 initWithColors:v10 vibrant:v4 supportsVariation:1 variationValue:v11];

  v13 = [[_PREditingPosterContentUIColorWellCoordinatorImpl alloc] initWithStyle:v12 colorWellView:v6];
  v14 = (void *)[objc_alloc((Class)a1) initWithInitialStyle:v12 suggested:0 coordinator:v13];

  return v14;
}

+ (id)coordinatorImplForStyle:(id)a3
{
  id v3 = a3;
  switch([v3 type])
  {
    case 0:
      id v4 = v3;
      v5 = [v4 colors];
      unint64_t v6 = [v5 count];

      if (v6 <= 1)
      {
        int v10 = [v4 isVibrant];
        v7 = off_1E54DA6B8;
        if (v10) {
          v7 = off_1E54DA6E0;
        }
      }
      else
      {
        v7 = off_1E54DA6C0;
      }
      v9 = (void *)[objc_alloc(*v7) initWithStyle:v4];

      break;
    case 1:
      v8 = _PREditingPosterContentGradientStyleCoordinatorImpl;
      goto LABEL_8;
    case 2:
      v8 = _PREditingPosterContentVibrantMaterialStyleCoordinatorImpl;
      goto LABEL_8;
    case 3:
      v8 = _PREditingPosterContentVibrantMonochromeStyleCoordinatorImpl;
LABEL_8:
      v9 = (void *)[[v8 alloc] initWithStyle:v3];
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

+ (id)_legibleIconColorForLuminance:(double)a3
{
  if (a3 >= 0.9) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  return v3;
}

- (PREditingPosterContentStyleCoordinator)initWithInitialStyle:(id)a3 suggested:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() coordinatorImplForStyle:v6];
  v8 = [(PREditingPosterContentStyleCoordinator *)self initWithInitialStyle:v6 suggested:v4 coordinator:v7];

  return v8;
}

- (PREditingPosterContentStyleCoordinator)initWithInitialStyle:(id)a3 suggested:(BOOL)a4 coordinator:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PREditingPosterContentStyleCoordinator;
  double v11 = [(PREditingPosterContentStyleCoordinator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_style, a3);
    v12->_suggested = a4;
    objc_storeStrong((id *)&v12->_coordinatorImpl, a5);
  }

  return v12;
}

- (PRPosterContentStyle)style
{
  style = [(_PREditingPosterContentStyleCoordinatorImpl *)self->_coordinatorImpl style];
  BOOL v4 = style;
  if (!style) {
    style = self->_style;
  }
  v5 = style;

  return v5;
}

- (void)setVariation:(double)a3
{
  [(_PREditingPosterContentStyleCoordinatorImpl *)self->_coordinatorImpl setVariation:a3];
  BOOL v4 = [(_PREditingPosterContentStyleCoordinatorImpl *)self->_coordinatorImpl style];
  style = self->_style;
  self->_style = v4;
  MEMORY[0x1F41817F8](v4, style);
}

- (double)variation
{
  [(_PREditingPosterContentStyleCoordinatorImpl *)self->_coordinatorImpl variation];
  return result;
}

- (void)setContentsLuminance:(double)a3
{
  if (self->_contentsLuminance != a3)
  {
    self->_contentsLuminance = a3;
    -[_PREditingPosterContentStyleCoordinatorImpl setContentsLuminance:](self->_coordinatorImpl, "setContentsLuminance:");
  }
  if ([(PREditingPosterContentStyleCoordinator *)self isSuggested] && self->_symbolImageView)
  {
    BOOL v4 = objc_opt_class();
    [(PREditingPosterContentStyleCoordinator *)self itemViewLuminance];
    objc_msgSend(v4, "_legibleIconColorForLuminance:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = [(UIImageView *)self->_symbolImageView tintColor];
    char v6 = [v7 isEqual:v5];

    if ((v6 & 1) == 0) {
      [(UIImageView *)self->_symbolImageView setTintColor:v7];
    }
  }
}

- (double)itemViewLuminance
{
  coordinatorImpl = self->_coordinatorImpl;
  if (!coordinatorImpl) {
    return 0.5;
  }
  [(_PREditingPosterContentStyleCoordinatorImpl *)coordinatorImpl itemViewLuminance];
  return result;
}

- (UIView)itemView
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
  BOOL v4 = [(_PREditingPosterContentStyleCoordinatorImpl *)self->_coordinatorImpl itemView];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [v3 bounds];
    BOOL v4 = objc_msgSend(v5, "initWithFrame:");
  }
  [v4 setAutoresizingMask:18];
  [v3 addSubview:v4];
  if ([(PREditingPosterContentStyleCoordinator *)self isSuggested])
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
    id v7 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"sparkles"];
    v8 = (UIImageView *)[v6 initWithImage:v7];

    [v3 bounds];
    -[UIImageView setFrame:](v8, "setFrame:");
    id v9 = objc_opt_class();
    [(PREditingPosterContentStyleCoordinator *)self itemViewLuminance];
    id v10 = objc_msgSend(v9, "_legibleIconColorForLuminance:");
    [(UIImageView *)v8 setTintColor:v10];
    [v3 bounds];
    CGRect v15 = CGRectInset(v14, 6.0, 6.0);
    -[UIImageView setFrame:](v8, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    [(UIImageView *)v8 setContentMode:1];
    [v3 addSubview:v8];
    [(UIImageView *)v8 setAutoresizingMask:18];
    symbolImageView = self->_symbolImageView;
    self->_symbolImageView = v8;
  }
  return (UIView *)v3;
}

- (UIView)variationSliderThumbView
{
  return [(_PREditingPosterContentStyleCoordinatorImpl *)self->_coordinatorImpl variationSliderThumbView];
}

- (UIView)variationSliderTrackView
{
  return [(_PREditingPosterContentStyleCoordinatorImpl *)self->_coordinatorImpl variationSliderTrackView];
}

- (BOOL)isSuggested
{
  return self->_suggested;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinatorImpl, 0);
  objc_storeStrong((id *)&self->_symbolImageView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end