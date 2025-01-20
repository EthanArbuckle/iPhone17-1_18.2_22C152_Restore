@interface SKUIInlineFlipContainerView
- (SKUIInlineFlipContainerView)initWithFrontView:(id)a3 backView:(id)a4;
- (void)flipToBackViewWithDuration:(double)a3 options:(unint64_t)a4 completionBlock:(id)a5;
@end

@implementation SKUIInlineFlipContainerView

- (SKUIInlineFlipContainerView)initWithFrontView:(id)a3 backView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIInlineFlipContainerView initWithFrontView:backView:]();
  }
  [v6 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v7 bounds];
  v36.origin.double x = v16;
  v36.origin.double y = v17;
  v36.size.double width = v18;
  v36.size.double height = v19;
  v34.origin.double x = v9;
  v34.origin.double y = v11;
  v34.size.double width = v13;
  v34.size.double height = v15;
  CGRect v35 = CGRectUnion(v34, v36);
  double x = v35.origin.x;
  double y = v35.origin.y;
  double width = v35.size.width;
  double height = v35.size.height;
  v33.receiver = self;
  v33.super_class = (Class)SKUIInlineFlipContainerView;
  v24 = -[SKUIInlineFlipContainerView initWithFrame:](&v33, sel_initWithFrame_);
  if (v24)
  {
    v25 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    v26 = [v6 backgroundColor];
    [(UIView *)v25 setBackgroundColor:v26];

    [v6 frame];
    float v28 = (width - v27) * 0.5;
    float v30 = (height - v29) * 0.5;
    objc_msgSend(v6, "setFrame:", floorf(v28), floorf(v30));
    [(UIView *)v25 addSubview:v6];
    [(SKUIInlineFlipContainerView *)v24 addSubview:v25];
    objc_storeStrong((id *)&v24->_backView, a4);
    frontView = v24->_frontView;
    v24->_frontView = v25;
  }
  return v24;
}

- (void)flipToBackViewWithDuration:(double)a3 options:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a5;
  [(SKUIInlineFlipContainerView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  CGFloat v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v13, v14, v9, v11);
  CGFloat v16 = [(UIView *)self->_backView backgroundColor];
  [v15 setBackgroundColor:v16];

  [(UIView *)self->_backView frame];
  float v18 = (v10 - v17) * 0.5;
  float v20 = (v12 - v19) * 0.5;
  -[UIView setFrame:](self->_backView, "setFrame:", floorf(v18), floorf(v20));
  [v15 addSubview:self->_backView];
  v21 = (void *)MEMORY[0x1E4FB1EB0];
  frontView = self->_frontView;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __82__SKUIInlineFlipContainerView_flipToBackViewWithDuration_options_completionBlock___block_invoke;
  v24[3] = &unk_1E64224E8;
  id v25 = v8;
  id v23 = v8;
  [v21 transitionFromView:frontView toView:v15 duration:a4 options:v24 completion:a3];
}

uint64_t __82__SKUIInlineFlipContainerView_flipToBackViewWithDuration_options_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontView, 0);

  objc_storeStrong((id *)&self->_backView, 0);
}

- (void)initWithFrontView:backView:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIInlineFlipContainerView initWithFrontView:backView:]";
}

@end