@interface _TUIMicaPlayerLayer
- (NSString)triggerName;
- (double)triggerDelay;
- (unint64_t)targetTriggerState;
- (void)configWithURL:(id)a3 gravity:(id)a4 textKey:(id)a5 textValue:(id)a6 shouldStartAtEnd:(BOOL)a7 triggerName:(id)a8 targetTriggerState:(unint64_t)a9 triggerDelay:(double)a10 fontSpec:(id)a11 fileProvider:(id)a12;
- (void)didAddLayerWithFeedControllerHost:(id)a3;
- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5;
- (void)setTargetTriggerState:(unint64_t)a3;
- (void)setTriggerDelay:(double)a3;
- (void)setTriggerName:(id)a3;
- (void)updateContent;
- (void)willRemoveLayerWithFeedControllerHost:(id)a3;
@end

@implementation _TUIMicaPlayerLayer

- (void)configWithURL:(id)a3 gravity:(id)a4 textKey:(id)a5 textValue:(id)a6 shouldStartAtEnd:(BOOL)a7 triggerName:(id)a8 targetTriggerState:(unint64_t)a9 triggerDelay:(double)a10 fontSpec:(id)a11 fileProvider:(id)a12
{
  BOOL v48 = a7;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v47 = a8;
  id v22 = a11;
  id v50 = a12;
  objc_storeStrong((id *)&self->_triggerName, a8);
  self->_targetTriggerState = a9;
  self->_triggerDelay = a10;
  objc_storeStrong((id *)&self->_gravity, a4);
  player = self->_player;
  v49 = v18;
  if (player)
  {
    v24 = [(TUIMicaPlayer *)player path];
    v25 = [v18 path];
    unsigned __int8 v26 = [v24 isEqualToString:v25];

    v27 = v19;
    if (v26) {
      goto LABEL_6;
    }
    player = self->_player;
    id v18 = v49;
  }
  else
  {
    v27 = v19;
  }
  [(TUIMicaPlayer *)player removeFromSuperlayer];
  v28 = [TUIMicaPlayer alloc];
  v29 = [v18 path];
  v30 = [(TUIMicaPlayer *)v28 initWithPath:v29 retinaScale:v50 fileProvider:1.0];
  v31 = self->_player;
  self->_player = v30;

LABEL_6:
  [(TUIMicaPlayer *)self->_player addToLayer:self onTop:0 gravity:v27];
  v32 = +[TUIFontSpec defaultFontSpec];
  unsigned __int8 v33 = [v22 isEqual:v32];

  if (v20) {
    BOOL v34 = v21 == 0;
  }
  else {
    BOOL v34 = 1;
  }
  char v35 = v34;
  if (v34 || (v33 & 1) != 0)
  {
    if (v35) {
      goto LABEL_19;
    }
    v36 = [(TUIMicaPlayer *)self->_player publishedLayerWithKey:v20 required:1];
    uint64_t v43 = objc_opt_class();
    v37 = TUIDynamicCast(v43, v36);
    [(_TUIMicaPlayerLayer *)self contentsScale];
    [v37 setContentsScale:];
    [(_TUIMicaPlayerLayer *)self rasterizationScale];
    [v37 setRasterizationScale:];
    [v37 setString:v21];
    uint64_t v44 = objc_opt_class();
    v39 = TUIDynamicCast(v44, [v37 font]);
    if ([v39 isEqualToString:@"Serif UI Display Bold"])
    {
      [v37 fontSize];
      [v37 setFont:[UIFont systemFontOfSize:kCTFontUIFontDesignSerif]];
    }
  }
  else
  {
    v36 = [v22 font];
    v37 = [(TUIMicaPlayer *)self->_player publishedLayerWithKey:v20 required:1];
    uint64_t v38 = objc_opt_class();
    v39 = TUIDynamicCast(v38, v37);
    [(_TUIMicaPlayerLayer *)self contentsScale];
    [v39 setContentsScale:];
    [(_TUIMicaPlayerLayer *)self rasterizationScale];
    [v39 setRasterizationScale:];
    [v39 setString:v21];
    [v39 setFont:v36];
    [v22 pointSize];
    [v39 setFontSize:];
    NSAttributedStringKey v51 = NSFontAttributeName;
    v52 = v36;
    v40 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    [v21 sizeWithAttributes:v40];
    [v39 setBounds:0.0, 0.0, v41, v42];

    v27 = v19;
  }

LABEL_19:
  v45 = self->_player;
  if (v48)
  {
    [(TUIMicaPlayer *)v45 documentDuration];
    v45 = self->_player;
  }
  else
  {
    double v46 = 0.0;
  }
  [(TUIMicaPlayer *)v45 setPlaybackTime:v46];
}

- (void)updateContent
{
  player = self->_player;
  if (player)
  {
    [(TUIMicaPlayer *)player removeFromSuperlayer];
    [(TUIMicaPlayer *)self->_player addToLayer:self onTop:0 gravity:self->_gravity];
    [(TUIMicaPlayer *)self->_player documentDuration];
    -[TUIMicaPlayer setPlaybackTime:](self->_player, "setPlaybackTime:");
    v4 = self->_player;
    [(TUIMicaPlayer *)v4 play];
  }
}

- (void)didAddLayerWithFeedControllerHost:(id)a3
{
  id v12 = a3;
  v4 = [(_TUIMicaPlayerLayer *)self triggerName];
  id v5 = [v4 length];

  if (v5)
  {
    v6 = [v12 triggerStateManager];
    v7 = [(_TUIMicaPlayerLayer *)self triggerName];
    [v6 addObserver:self forTrigger:v7];

    v8 = [v12 triggerStateManager];
    v9 = [(_TUIMicaPlayerLayer *)self triggerName];
    id v10 = [v8 stateForTriggerWithName:v9];

    v11 = [(_TUIMicaPlayerLayer *)self triggerName];
    [(_TUIMicaPlayerLayer *)self handleTrigger:v11 didChangeState:v10 updateEvent:2];
  }
}

- (void)willRemoveLayerWithFeedControllerHost:(id)a3
{
  id v8 = a3;
  v4 = [(_TUIMicaPlayerLayer *)self triggerName];
  id v5 = [v4 length];

  if (v5)
  {
    v6 = [v8 triggerStateManager];
    v7 = [(_TUIMicaPlayerLayer *)self triggerName];
    [v6 removeObserver:self forTrigger:v7];
  }
}

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  id v7 = a3;
  unint64_t v8 = [(_TUIMicaPlayerLayer *)self targetTriggerState];
  if (a4)
  {
    if (v8 == a4)
    {
      v9 = [(_TUIMicaPlayerLayer *)self triggerName];
      unsigned int v10 = [v9 isEqualToString:v7];

      if (v10)
      {
        [(_TUIMicaPlayerLayer *)self triggerDelay];
        if (v11 <= 0.0)
        {
          [(TUIMicaPlayer *)self->_player play];
        }
        else
        {
          [(_TUIMicaPlayerLayer *)self triggerDelay];
          dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_9A718;
          block[3] = &unk_251990;
          block[4] = self;
          dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
        }
      }
    }
  }
}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (void)setTriggerName:(id)a3
{
}

- (unint64_t)targetTriggerState
{
  return self->_targetTriggerState;
}

- (void)setTargetTriggerState:(unint64_t)a3
{
  self->_targetTriggerState = a3;
}

- (double)triggerDelay
{
  return self->_triggerDelay;
}

- (void)setTriggerDelay:(double)a3
{
  self->_triggerDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerName, 0);
  objc_storeStrong((id *)&self->_gravity, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end