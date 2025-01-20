@interface TUITrackTimeRemainingView
+ (id)renderModelWithIdentifier:(id)a3 dynamicProgress:(id)a4 style:(id)a5;
- (TUIDynamicProgress)dynamicProgress;
- (TUITextContentStyler)style;
- (TUITrackTimeRemainingView)initWithFrame:(CGRect)a3;
- (UILabel)textView;
- (_TUITrackTimeRemainingRenderModel)renderModel;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)dynamicProgressChanged:(id)a3;
- (void)setDynamicProgress:(id)a3;
- (void)setRenderModel:(id)a3;
- (void)setStyle:(id)a3;
- (void)setTextView:(id)a3;
@end

@implementation TUITrackTimeRemainingView

+ (id)renderModelWithIdentifier:(id)a3 dynamicProgress:(id)a4 style:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(_TUITrackTimeRemainingRenderModel);
  [(_TUITrackTimeRemainingRenderModel *)v10 setDynamicProgress:v8];

  [(_TUITrackTimeRemainingRenderModel *)v10 setStyle:v7];
  v11 = [[TUIRenderModelView alloc] initWithReuseIdentifier:@"TUIReuseIdentifierTrackTimeRemainingView" identifier:v9 submodel:v10];

  return v11;
}

- (void)applyLayoutAttributes:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TUITrackTimeRemainingView;
  id v4 = a3;
  [(TUIReusableBaseView *)&v15 applyLayoutAttributes:v4];
  v5 = [v4 renderModel];

  v6 = [v5 submodel];
  renderModel = self->_renderModel;
  self->_renderModel = v6;

  id v8 = [(_TUITrackTimeRemainingRenderModel *)self->_renderModel dynamicProgress];
  dynamicProgress = self->_dynamicProgress;
  self->_dynamicProgress = v8;

  v10 = [(_TUITrackTimeRemainingRenderModel *)self->_renderModel style];
  style = self->_style;
  self->_style = v10;

  v12 = [(TUITextContentStyler *)self->_style textColor];
  [(UILabel *)self->_textView setTextColor:v12];

  v13 = [(TUITextContentStyler *)self->_style font];
  [(UILabel *)self->_textView setFont:v13];

  v14 = [(TUITrackTimeRemainingView *)self dynamicProgress];
  [v14 registerProgressObserver:self];
}

- (TUITrackTimeRemainingView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TUITrackTimeRemainingView;
  v3 = -[TUITrackTimeRemainingView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UILabel);
    [(TUITrackTimeRemainingView *)v3 bounds];
    v5 = [v4 initWithFrame:];
    textView = v3->_textView;
    v3->_textView = v5;

    id v7 = +[UIColor clearColor];
    [(UILabel *)v3->_textView setBackgroundColor:v7];

    [(UILabel *)v3->_textView setAutoresizingMask:18];
    [(UILabel *)v3->_textView setBaselineAdjustment:1];
    [(TUITrackTimeRemainingView *)v3 addSubview:v3->_textView];
  }
  return v3;
}

- (void)dynamicProgressChanged:(id)a3
{
  id v4 = [a3 formattedProgress];
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F00A8;
  block[3] = &unk_251A78;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v3 = [(TUITrackTimeRemainingView *)self dynamicProgress];
  [v3 unregisterProgressObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TUITrackTimeRemainingView;
  [(TUITrackTimeRemainingView *)&v4 dealloc];
}

- (_TUITrackTimeRemainingRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
}

- (TUITextContentStyler)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (UILabel)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_dynamicProgress, 0);

  objc_storeStrong((id *)&self->_renderModel, 0);
}

@end