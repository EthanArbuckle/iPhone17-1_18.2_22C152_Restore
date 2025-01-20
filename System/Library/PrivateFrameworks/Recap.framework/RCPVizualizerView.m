@interface RCPVizualizerView
- (AVPlayer)player;
- (AVPlayerLayer)playerLayer;
- (BOOL)isFlipped;
- (CALayer)screenshotLayer;
- (CGRect)screenRect;
- (RCPMovie)recapMovie;
- (RCPTraceLayer)traceLayer;
- (unint64_t)time;
- (void)layout;
- (void)setFrame:(CGRect)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setRecapMovie:(id)a3;
- (void)setScreenshotLayer:(id)a3;
- (void)setTime:(unint64_t)a3;
- (void)setTraceLayer:(id)a3;
- (void)timelineView:(id)a3 didSetTime:(unint64_t)a4;
@end

@implementation RCPVizualizerView

- (void)setRecapMovie:(id)a3
{
  objc_storeStrong((id *)&self->_recapMovie, a3);
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F16620]);
  v7 = [(RCPVizualizerView *)self recapMovie];
  v8 = [v7 screenRecording];
  id v29 = (id)[v6 initWithAsset:v8];

  v9 = [MEMORY[0x1E4F16608] playerWithPlayerItem:v29];
  [(RCPVizualizerView *)self setPlayer:v9];

  v10 = (void *)MEMORY[0x1E4F16650];
  v11 = [(RCPVizualizerView *)self player];
  v12 = [v10 playerLayerWithPlayer:v11];
  [(RCPVizualizerView *)self setPlayerLayer:v12];

  v13 = [(RCPVizualizerView *)self layer];
  v14 = [(RCPVizualizerView *)self playerLayer];
  [v13 addSublayer:v14];

  v15 = [(RCPVizualizerView *)self player];
  [v15 pause];

  id v16 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  [(RCPVizualizerView *)self setScreenshotLayer:v16];

  v17 = [(RCPVizualizerView *)self layer];
  v18 = [(RCPVizualizerView *)self screenshotLayer];
  [v17 addSublayer:v18];

  v19 = objc_alloc_init(RCPTraceLayer);
  [(RCPVizualizerView *)self setTraceLayer:v19];

  v20 = [(RCPVizualizerView *)self recapMovie];
  v21 = [v20 eventStream];
  v22 = [(RCPVizualizerView *)self traceLayer];
  [v22 setEventStream:v21];

  v23 = [(RCPVizualizerView *)self recapMovie];
  uint64_t v24 = [v23 interfaceOrientation];
  v25 = [(RCPVizualizerView *)self traceLayer];
  [v25 setInterfaceOrientation:v24];

  v26 = [(RCPVizualizerView *)self layer];
  v27 = [(RCPVizualizerView *)self traceLayer];
  [v26 addSublayer:v27];

  v28 = [(RCPVizualizerView *)self recapMovie];
  -[RCPVizualizerView setTime:](self, "setTime:", [v28 startTimestamp]);
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCPVizualizerView;
  -[RCPVizualizerView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(RCPVizualizerView *)self layout];
}

- (void)layout
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(RCPVizualizerView *)self screenRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(RCPVizualizerView *)self traceLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(RCPVizualizerView *)self screenshotLayer];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  v13 = [(RCPVizualizerView *)self playerLayer];
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  v14 = (void *)MEMORY[0x1E4F39CF8];
  [v14 commit];
}

- (void)timelineView:(id)a3 didSetTime:(unint64_t)a4
{
}

- (void)setTime:(unint64_t)a3
{
  self->_unint64_t time = a3;
  double v5 = [(RCPVizualizerView *)self traceLayer];
  [v5 setTime:a3];

  double v6 = [(RCPVizualizerView *)self recapMovie];
  uint64_t v7 = [v6 startTimestamp];
  double v8 = [(RCPVizualizerView *)self recapMovie];
  double v9 = v8;
  if (v7)
  {
    unint64_t v10 = [v8 startTimestamp];
  }
  else
  {
    v11 = [v8 eventStream];
    v12 = [v11 events];
    v13 = [v12 firstObject];
    unint64_t v10 = [v13 timestamp];
  }
  v14 = [(RCPVizualizerView *)self recapMovie];
  v15 = [v14 eventStream];
  id v16 = [v15 environment];

  v17 = [(RCPVizualizerView *)self player];
  v18 = [v17 currentItem];
  v19 = [v18 asset];
  v20 = v19;
  if (v19)
  {
    [v19 duration];
    int32_t v21 = v45;
  }
  else
  {
    int32_t v21 = 0;
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
  }

  unint64_t v22 = a3 - v10;
  if (a3 < v10) {
    unint64_t v22 = 0;
  }
  memset(&v43, 0, sizeof(v43));
  double v23 = (double)v22;
  [v16 timeScale];
  CMTimeMakeWithSeconds(&v43, v24 * v23 / 1000000000.0, v21);
  v25 = [(RCPVizualizerView *)self player];
  v26 = [v25 currentItem];
  CMTime v42 = v43;
  long long v40 = *MEMORY[0x1E4F1FA48];
  uint64_t v41 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  long long v38 = v40;
  uint64_t v39 = v41;
  [v26 seekToTime:&v42 toleranceBefore:&v40 toleranceAfter:&v38 completionHandler:0];

  v27 = [(RCPVizualizerView *)self recapMovie];
  uint64_t v28 = [v27 screenshot];
  if (!v28)
  {

    goto LABEL_13;
  }
  id v29 = (void *)v28;
  unint64_t time = self->_time;
  v31 = [(RCPVizualizerView *)self recapMovie];
  unint64_t v32 = [v31 endTimestamp];

  if (time < v32)
  {
LABEL_13:
    v33 = [(RCPVizualizerView *)self screenshotLayer];
    [v33 setContents:0];
    goto LABEL_14;
  }
  v33 = [(RCPVizualizerView *)self recapMovie];
  id v34 = [v33 screenshot];
  uint64_t v35 = [v34 CGImage];
  v36 = [(RCPVizualizerView *)self screenshotLayer];
  [v36 setContents:v35];

LABEL_14:
  v37 = [(RCPVizualizerView *)self traceLayer];
  [v37 setNeedsDisplay];
}

- (BOOL)isFlipped
{
  return 1;
}

- (CGRect)screenRect
{
  double v3 = [(RCPVizualizerView *)self recapMovie];
  double v4 = [v3 eventStream];
  double v5 = [v4 environment];
  double v6 = [v5 screens];
  uint64_t v7 = [v6 firstObject];
  [v7 pointSize];
  double v9 = v8;
  double v11 = v10;

  v12 = [(RCPVizualizerView *)self recapMovie];
  if ([v12 interfaceOrientation])
  {
    v13 = [(RCPVizualizerView *)self recapMovie];
    uint64_t v14 = [v13 interfaceOrientation];

    if (v14 == 1) {
      double v15 = v11;
    }
    else {
      double v15 = v9;
    }
    if (v14 != 1) {
      double v9 = v11;
    }
    double v11 = v15;
  }
  else
  {
  }
  [(RCPVizualizerView *)self bounds];
  double v18 = v17 / v9;
  if (v17 / v9 >= v16 / v11) {
    double v18 = v16 / v11;
  }
  double v19 = v9 * v18;
  double v20 = v11 * v18;
  [(RCPVizualizerView *)self bounds];
  double v25 = DKDCenterRectOverRect(0.0, 0.0, v19, v20, v21, v22, v23, v24);
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (unint64_t)time
{
  return self->_time;
}

- (RCPMovie)recapMovie
{
  return self->_recapMovie;
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (RCPTraceLayer)traceLayer
{
  return self->_traceLayer;
}

- (void)setTraceLayer:(id)a3
{
}

- (CALayer)screenshotLayer
{
  return self->_screenshotLayer;
}

- (void)setScreenshotLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshotLayer, 0);
  objc_storeStrong((id *)&self->_traceLayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_recapMovie, 0);
}

@end