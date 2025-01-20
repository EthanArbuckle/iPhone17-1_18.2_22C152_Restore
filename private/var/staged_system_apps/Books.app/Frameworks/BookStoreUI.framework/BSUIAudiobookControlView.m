@interface BSUIAudiobookControlView
+ (id)renderModelWithIdentifier:(id)a3 dynamicProgress:(id)a4 dynamicState:(id)a5;
- (BSUIAudiobookControlView)initWithFrame:(CGRect)a3;
- (BSUIDynamicAudiobookProgress)dynamicAudiobookProgress;
- (TUIDynamicProviding)dynamicState;
- (_BSUIAudiobookControlRenderModel)renderModel;
- (void)_updatePlayState;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)dynamicProgressChanged:(id)a3;
- (void)setDynamicAudiobookProgress:(id)a3;
- (void)setDynamicState:(id)a3;
- (void)setRenderModel:(id)a3;
- (void)togglePlayPause:(id)a3;
@end

@implementation BSUIAudiobookControlView

+ (id)renderModelWithIdentifier:(id)a3 dynamicProgress:(id)a4 dynamicState:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(_BSUIAudiobookControlRenderModel);
  [(_BSUIAudiobookControlRenderModel *)v10 setDynamicAudiobookProgress:v8];

  [(_BSUIAudiobookControlRenderModel *)v10 setDynamicState:v7];
  id v11 = [objc_alloc((Class)TUIRenderModelView) initWithReuseIdentifier:@"BSUIReuseIdentifierAudiobookControlView" identifier:v9 submodel:v10];

  return v11;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BSUIAudiobookControlView;
  [(BSUIAudiobookControlView *)&v18 applyLayoutAttributes:v4];
  v5 = [v4 renderModel];
  v6 = [v5 submodel];
  renderModel = self->_renderModel;
  self->_renderModel = v6;

  id v8 = [(_BSUIAudiobookControlRenderModel *)self->_renderModel dynamicAudiobookProgress];
  dynamicAudiobookProgress = self->_dynamicAudiobookProgress;
  self->_dynamicAudiobookProgress = v8;

  v10 = [(_BSUIAudiobookControlRenderModel *)self->_renderModel dynamicState];
  dynamicState = self->_dynamicState;
  self->_dynamicState = v10;

  v12 = [(BSUIAudiobookControlView *)self dynamicAudiobookProgress];
  [v12 registerProgressObserver:self];

  objc_opt_class();
  v13 = [(BSUIAudiobookControlView *)self dynamicState];
  TUIDynamicCast();
  v14 = (TUIDynamicValue *)objc_claimAutoreleasedReturnValue();
  dynamicValue = self->_dynamicValue;
  self->_dynamicValue = v14;

  v16 = [(TUIDynamicValue *)self->_dynamicValue instanceForObserver:self];
  instance = self->_instance;
  self->_instance = v16;

  [(BSUIAudiobookControlView *)self _updatePlayState];
}

- (BSUIAudiobookControlView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BSUIAudiobookControlView;
  v3 = -[BSUIAudiobookControlView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [BSUIAudiobookControl alloc];
    [(BSUIAudiobookControlView *)v3 bounds];
    v5 = -[BSUIAudiobookControl initWithFrame:](v4, "initWithFrame:");
    audiobookControl = v3->_audiobookControl;
    v3->_audiobookControl = v5;

    [(BSUIAudiobookControl *)v3->_audiobookControl setDelegate:v3];
    [(BSUIAudiobookControl *)v3->_audiobookControl setAutoresizingMask:18];
    [(BSUIAudiobookControlView *)v3 addSubview:v3->_audiobookControl];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(BSUIAudiobookControlView *)self dynamicAudiobookProgress];
  [v3 unregisterProgressObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BSUIAudiobookControlView;
  [(BSUIAudiobookControlView *)&v4 dealloc];
}

- (void)togglePlayPause:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    dynamicAudiobookProgress = self->_dynamicAudiobookProgress;
    [(BSUIDynamicAudiobookProgress *)dynamicAudiobookProgress togglePlayPause];
  }
}

- (void)_updatePlayState
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1415C;
  block[3] = &unk_38E738;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dynamicProgressChanged:(id)a3
{
  id v5 = [a3 progress];
  [v5 floatValue];
  [(BSUIAudiobookControl *)self->_audiobookControl setProgress:v4];
}

- (_BSUIAudiobookControlRenderModel)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (BSUIDynamicAudiobookProgress)dynamicAudiobookProgress
{
  return self->_dynamicAudiobookProgress;
}

- (void)setDynamicAudiobookProgress:(id)a3
{
}

- (TUIDynamicProviding)dynamicState
{
  return self->_dynamicState;
}

- (void)setDynamicState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicState, 0);
  objc_storeStrong((id *)&self->_dynamicAudiobookProgress, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_audiobookControl, 0);
  objc_storeStrong((id *)&self->_instance, 0);

  objc_storeStrong((id *)&self->_dynamicValue, 0);
}

@end