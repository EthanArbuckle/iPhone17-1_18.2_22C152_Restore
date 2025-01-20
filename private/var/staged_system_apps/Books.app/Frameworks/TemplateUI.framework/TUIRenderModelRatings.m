@interface TUIRenderModelRatings
- (BOOL)isEqualToRenderModel:(id)a3;
- (NSString)backgroundImageName;
- (NSString)foregroundImageName;
- (TUIRenderModelRatings)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 rating:(double)a10 direction:(unint64_t)a11 color:(id)a12 startColor:(id)a13 backgroundColor:(id)a14 backgroundImageName:(id)a15 foregroundImageName:(id)a16 starWidth:(double)a17 starPadding:(double)a18;
- (UIColor)backgroundColor;
- (UIColor)color;
- (UIColor)startColor;
- (double)rating;
- (double)starPadding;
- (double)starWidth;
- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4;
- (unint64_t)direction;
@end

@implementation TUIRenderModelRatings

- (TUIRenderModelRatings)initWithReuseIdentifier:(id)a3 identifier:(id)a4 elementStates:(id)a5 actionHandler:(id)a6 viewState:(id)a7 enabled:(BOOL)a8 name:(id)a9 rating:(double)a10 direction:(unint64_t)a11 color:(id)a12 startColor:(id)a13 backgroundColor:(id)a14 backgroundImageName:(id)a15 foregroundImageName:(id)a16 starWidth:(double)a17 starPadding:(double)a18
{
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  id v27 = a15;
  id v28 = a16;
  v42.receiver = self;
  v42.super_class = (Class)TUIRenderModelRatings;
  v29 = -[TUIRenderModelInteractive initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:](&v42, "initWithReuseIdentifier:identifier:style:elementStates:imageModelIDToResource:actionHandler:viewState:enabled:pressScale:touchInsets:pointer:focusStyle:menu:name:", a3, a4, 0, a5, 0, a6, 1.0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, a7, a8, 0, 0, 0,
          a9);
  v30 = v29;
  if (v29)
  {
    v29->_rating = a10;
    v29->_direction = a11;
    v29->_starWidth = a17;
    v29->_starPadding = a18;
    objc_storeStrong((id *)&v29->_color, a12);
    if (v25) {
      v31 = v25;
    }
    else {
      v31 = v24;
    }
    objc_storeStrong((id *)&v30->_startColor, v31);
    if (v26) {
      v32 = v26;
    }
    else {
      v32 = v24;
    }
    objc_storeStrong((id *)&v30->_backgroundColor, v32);
    v33 = (NSString *)[v27 copy];
    backgroundImageName = v30->_backgroundImageName;
    v30->_backgroundImageName = v33;

    v35 = (NSString *)[v28 copy];
    foregroundImageName = v30->_foregroundImageName;
    v30->_foregroundImageName = v35;
  }
  return v30;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TUIDynamicCast(v5, v4);

  v40.receiver = self;
  v40.super_class = (Class)TUIRenderModelRatings;
  if (![(TUIRenderModelInteractive *)&v40 isEqualToRenderModel:v6]) {
    goto LABEL_20;
  }
  double rating = self->_rating;
  [v6 rating];
  if (rating != v8) {
    goto LABEL_20;
  }
  id direction = self->_direction;
  if (direction != [v6 direction]) {
    goto LABEL_20;
  }
  double starWidth = self->_starWidth;
  [v6 starWidth];
  if (starWidth != v11) {
    goto LABEL_20;
  }
  double starPadding = self->_starPadding;
  [v6 starPadding];
  if (starPadding != v13) {
    goto LABEL_20;
  }
  color = self->_color;
  uint64_t v15 = [v6 color];
  if (color == (UIColor *)v15)
  {
  }
  else
  {
    v16 = (void *)v15;
    v17 = self->_color;
    v18 = [v6 color];
    LODWORD(v17) = [(UIColor *)v17 isEqual:v18];

    if (!v17) {
      goto LABEL_20;
    }
  }
  startColor = self->_startColor;
  uint64_t v20 = [v6 startColor];
  if (startColor == (UIColor *)v20)
  {
  }
  else
  {
    v21 = (void *)v20;
    v22 = self->_startColor;
    v23 = [v6 startColor];
    LODWORD(v22) = [(UIColor *)v22 isEqual:v23];

    if (!v22) {
      goto LABEL_20;
    }
  }
  backgroundColor = self->_backgroundColor;
  uint64_t v25 = [v6 backgroundColor];
  if (backgroundColor == (UIColor *)v25)
  {
  }
  else
  {
    id v26 = (void *)v25;
    id v27 = self->_backgroundColor;
    id v28 = [v6 backgroundColor];
    LODWORD(v27) = [(UIColor *)v27 isEqual:v28];

    if (!v27) {
      goto LABEL_20;
    }
  }
  backgroundImageName = self->_backgroundImageName;
  uint64_t v30 = [v6 backgroundImageName];
  if (backgroundImageName == (NSString *)v30)
  {
  }
  else
  {
    v31 = (void *)v30;
    v32 = self->_backgroundImageName;
    v33 = [v6 backgroundImageName];
    LODWORD(v32) = [(NSString *)v32 isEqualToString:v33];

    if (!v32)
    {
LABEL_20:
      unsigned __int8 v34 = 0;
      goto LABEL_21;
    }
  }
  foregroundImageName = self->_foregroundImageName;
  v37 = [v6 foregroundImageName];
  if (foregroundImageName == v37)
  {
    unsigned __int8 v34 = 1;
  }
  else
  {
    v38 = self->_foregroundImageName;
    v39 = [v6 foregroundImageName];
    unsigned __int8 v34 = [(NSString *)v38 isEqualToString:v39];
  }
LABEL_21:

  return v34;
}

- (id)_copyAppearanceWithFlags:(unint64_t)a3 statesCopyProc:(void *)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());
  double v8 = [(TUIRenderModelInteractive *)self reuseIdentifier];
  v9 = [(TUIRenderModelInteractive *)self identifier];
  v10 = [(TUIRenderModelInteractive *)self stateToModel];
  double v11 = ((void (*)(void *, unint64_t))a4)(v10, a3);
  v12 = [(TUIRenderModelInteractive *)self actionHandler];
  double v13 = [(TUIRenderModelInteractive *)self viewState];
  BOOL v14 = [(TUIRenderModelInteractive *)self enabled];
  uint64_t v15 = [(TUIRenderModelInteractive *)self name];
  id v16 = [v7 initWithReuseIdentifier:v8 identifier:v9 elementStates:v11 actionHandler:v12 viewState:v13 enabled:v14 name:self->_rating rating:self->_starWidth direction:self->_starPadding color:v15 startColor:self->_direction backgroundColor:self->_color backgroundImageName:self->_startColor foregroundImageName:self->_backgroundColor starWidth:self->_backgroundImageName starPadding:self->_foregroundImageName];

  TUIRenderModelCopyProperties(v16, self);
  v17 = self;

  return v17;
}

- (double)rating
{
  return self->_rating;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (UIColor)color
{
  return self->_color;
}

- (UIColor)startColor
{
  return self->_startColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)backgroundImageName
{
  return self->_backgroundImageName;
}

- (NSString)foregroundImageName
{
  return self->_foregroundImageName;
}

- (double)starWidth
{
  return self->_starWidth;
}

- (double)starPadding
{
  return self->_starPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundImageName, 0);
  objc_storeStrong((id *)&self->_backgroundImageName, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_startColor, 0);

  objc_storeStrong((id *)&self->_color, 0);
}

@end