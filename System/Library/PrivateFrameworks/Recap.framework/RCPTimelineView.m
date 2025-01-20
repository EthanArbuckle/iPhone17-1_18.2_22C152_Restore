@interface RCPTimelineView
- (BOOL)isFlipped;
- (RCPMovie)recapMovie;
- (RCPTimelineViewDelegate)delegate;
- (double)xForTimestamp:(unint64_t)a3;
- (id)cropHead:(BOOL)a3;
- (unint64_t)endCropTimestamp;
- (unint64_t)startCropTimestamp;
- (void)dragAtLocation:(CGPoint)a3;
- (void)dragBeganAtLocation:(CGPoint)a3 hitThreshold:(double)a4;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEndCropTimestamp:(unint64_t)a3;
- (void)setRecapMovie:(id)a3;
- (void)setStartCropTimestamp:(unint64_t)a3;
- (void)setTime:(unint64_t)a3;
- (void)setup;
- (void)startPlayback;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateCropUI;
@end

@implementation RCPTimelineView

- (void)setRecapMovie:(id)a3
{
  p_recapMovie = &self->_recapMovie;
  objc_storeStrong((id *)&self->_recapMovie, a3);
  id v6 = a3;
  [(RCPTimelineView *)self setStartCropTimestamp:[(RCPMovie *)*p_recapMovie startTimestamp]];
  uint64_t v7 = [(RCPMovie *)*p_recapMovie endTimestamp];

  [(RCPTimelineView *)self setEndCropTimestamp:v7];
  [(RCPTimelineView *)self setup];
  [(RCPTimelineView *)self setNeedsDisplay:1];
}

- (BOOL)isFlipped
{
  return 1;
}

- (void)setup
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(RCPTimelineView *)self layer];
  [v3 setMasksToBounds:1];

  v4 = [(RCPTimelineView *)self layer];
  [v4 setCornerRadius:10.0];

  v5 = [(RCPTimelineView *)self cropHead:0];
  cropStartHead = self->_cropStartHead;
  self->_cropStartHead = v5;

  uint64_t v7 = [(RCPTimelineView *)self cropHead:1];
  cropEndHead = self->_cropEndHead;
  self->_cropEndHead = v7;

  v9 = [MEMORY[0x1E4F39BE8] layer];
  playbackHead = self->_playbackHead;
  self->_playbackHead = v9;

  [(RCPTimelineView *)self bounds];
  -[CALayer setFrame:](self->_playbackHead, "setFrame:", 0.0, 0.0, 2.0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v13[0] = xmmword_1A9077B30;
  v13[1] = unk_1A9077B40;
  [(CALayer *)self->_playbackHead setBackgroundColor:CGColorCreate(DeviceRGB, (const CGFloat *)v13)];
  v12 = [(RCPTimelineView *)self layer];
  [v12 addSublayer:self->_playbackHead];

  [(RCPTimelineView *)self setTime:[(RCPTimelineView *)self startCropTimestamp]];
  [(RCPTimelineView *)self startPlayback];
}

- (void)startPlayback
{
  v3 = [(RCPTimelineView *)self recapMovie];
  v4 = [v3 eventStream];
  v5 = [v4 environment];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  unint64_t v15 = 0;
  unint64_t v15 = [(RCPTimelineView *)self startCropTimestamp];
  unint64_t v6 = [(RCPTimelineView *)self endCropTimestamp];
  unint64_t v7 = [(RCPTimelineView *)self startCropTimestamp];
  unint64_t v8 = [(RCPTimelineView *)self endCropTimestamp];
  unint64_t v9 = [(RCPTimelineView *)self startCropTimestamp];
  [v5 timeScale];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  _OWORD v13[2] = __32__RCPTimelineView_startPlayback__block_invoke;
  v13[3] = &unk_1E5D77320;
  v13[5] = v14;
  v13[6] = (unint64_t)((double)(5 * (v6 - v7)) / (v10 * (double)(60 * (v8 - v9)) / 1000000000.0));
  v13[4] = self;
  v11 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:v13 block:0.0166666667];
  playbackTimer = self->_playbackTimer;
  self->_playbackTimer = v11;

  _Block_object_dispose(v14, 8);
}

void __32__RCPTimelineView_startPlayback__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += *(void *)(a1 + 48);
  [*(id *)(a1 + 32) setTime:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2 > [*(id *)(a1 + 32) endCropTimestamp])
  {
    [*(id *)(*(void *)(a1 + 32) + 448) invalidate];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 448);
    *(void *)(v3 + 448) = 0;
  }
}

- (id)cropHead:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F39C88]);
  Mutable = CGPathCreateMutable();
  unint64_t v7 = Mutable;
  if (v3) {
    double v8 = -5.0;
  }
  else {
    double v8 = 5.0;
  }
  if (v3) {
    double v9 = 1.0;
  }
  else {
    double v9 = -10001.0;
  }
  CGPathMoveToPoint(Mutable, 0, v8, 4.0);
  CGPathAddLineToPoint(v7, 0, 0.0, 4.0);
  [(RCPTimelineView *)self bounds];
  CGPathAddLineToPoint(v7, 0, 0.0, v10 + -4.0);
  [(RCPTimelineView *)self bounds];
  CGPathAddLineToPoint(v7, 0, v8, v11 + -4.0);
  [v5 setPath:v7];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)components = xmmword_1A9077B50;
  long long v21 = unk_1A9077B60;
  objc_msgSend(v5, "setStrokeColor:", CGColorCreate(DeviceRGB, components));
  [v5 setLineWidth:2.0];
  [v5 setFillColor:0];
  LODWORD(v13) = 1.0;
  [v5 setShadowOpacity:v13];
  [v5 setShadowRadius:1.0];
  objc_msgSend(v5, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  id v14 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  [(RCPTimelineView *)self bounds];
  objc_msgSend(v14, "setFrame:", v9, 0.0, 10000.0);
  unint64_t v15 = CGColorSpaceCreateDeviceRGB();
  v19[0] = xmmword_1A9077B70;
  v19[1] = unk_1A9077B80;
  objc_msgSend(v14, "setBackgroundColor:", CGColorCreate(v15, (const CGFloat *)v19));
  id v16 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  [v16 addSublayer:v14];
  [v16 addSublayer:v5];
  v17 = [(RCPTimelineView *)self layer];
  [v17 addSublayer:v16];

  return v16;
}

- (double)xForTimestamp:(unint64_t)a3
{
  [(RCPTimelineView *)self bounds];
  double v6 = (double)a3;
  double v7 = 8.0 / (v5 + -32.0);
  double v8 = [(RCPTimelineView *)self recapMovie];
  double v9 = v6 - (double)(unint64_t)[v8 startTimestamp];
  double v10 = [(RCPTimelineView *)self recapMovie];
  uint64_t v11 = [v10 endTimestamp];
  v12 = [(RCPTimelineView *)self recapMovie];
  double v13 = v9 / (double)(unint64_t)(v11 - [v12 startTimestamp]);

  double v14 = v7 + 1.0;
  if (v7 + 1.0 >= v13) {
    double v14 = v13;
  }
  if (v14 <= -v7) {
    double v15 = -v7;
  }
  else {
    double v15 = v14;
  }
  [(RCPTimelineView *)self bounds];
  return (v16 + -48.0) * v15 + 24.0;
}

- (void)setTime:(unint64_t)a3
{
  unint64_t v5 = [(RCPTimelineView *)self startCropTimestamp];
  unint64_t v6 = [(RCPTimelineView *)self endCropTimestamp];
  if (v6 >= a3) {
    unint64_t v7 = a3;
  }
  else {
    unint64_t v7 = v6;
  }
  if (v5 <= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v5;
  }
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  self->_time = v8;
  double v9 = [(RCPTimelineView *)self recapMovie];
  double v10 = [v9 eventStream];
  uint64_t v11 = [v10 events];
  unint64_t v12 = [v11 count];

  if (v12 >= 2)
  {
    [(RCPTimelineView *)self xForTimestamp:v8];
    double v14 = v13 + -1.0;
    [(RCPTimelineView *)self bounds];
    -[CALayer setFrame:](self->_playbackHead, "setFrame:", v14, 0.0, 2.0);
    double v15 = [(RCPTimelineView *)self delegate];
    [v15 timelineView:self didSetTime:v8];

    [(RCPTimelineView *)self updateCropUI];
  }
  double v16 = (void *)MEMORY[0x1E4F39CF8];
  [v16 commit];
}

- (void)updateCropUI
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(RCPTimelineView *)self xForTimestamp:[(RCPTimelineView *)self startCropTimestamp]];
  -[CALayer setPosition:](self->_cropStartHead, "setPosition:");
  [(RCPTimelineView *)self xForTimestamp:[(RCPTimelineView *)self endCropTimestamp]];
  -[CALayer setPosition:](self->_cropEndHead, "setPosition:");
  BOOL v3 = (void *)MEMORY[0x1E4F39CF8];
  [v3 commit];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RCPTimelineView;
  [(RCPTimelineView *)&v3 layoutSubviews];
  [(RCPTimelineView *)self setTime:self->_time];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = [a3 anyObject];
  [v5 locationInView:self];
  -[RCPTimelineView dragBeganAtLocation:hitThreshold:](self, "dragBeganAtLocation:hitThreshold:");
}

- (void)dragBeganAtLocation:(CGPoint)a3 hitThreshold:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(NSTimer *)self->_playbackTimer invalidate];
  playbackTimer = self->_playbackTimer;
  self->_playbackTimer = 0;

  [(CALayer *)self->_cropStartHead position];
  if (vabdd_f64(x + a4, v9) < a4) {
    goto LABEL_2;
  }
  [(CALayer *)self->_cropEndHead position];
  if (vabdd_f64(x - a4, v11) < a4) {
    goto LABEL_4;
  }
  [(CALayer *)self->_playbackHead position];
  if (vabdd_f64(x, v12) >= a4)
  {
    [(CALayer *)self->_cropStartHead position];
    if (vabdd_f64(x, v13) < a4)
    {
LABEL_2:
      int64_t v10 = 1;
LABEL_5:
      self->_draggingHandle = v10;
      goto LABEL_6;
    }
    [(CALayer *)self->_cropEndHead position];
    if (vabdd_f64(x, v14) < a4)
    {
LABEL_4:
      int64_t v10 = 2;
      goto LABEL_5;
    }
  }
  self->_draggingHandle = 0;
LABEL_6:
  -[RCPTimelineView dragAtLocation:](self, "dragAtLocation:", x, y);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = [a3 anyObject];
  [v5 locationInView:self];
  -[RCPTimelineView dragAtLocation:](self, "dragAtLocation:");
}

- (void)dragAtLocation:(CGPoint)a3
{
  CGFloat v4 = a3.x + -24.0;
  [(RCPTimelineView *)self bounds];
  CGFloat v6 = v4 / (v5 + -48.0);
  unint64_t v7 = [(RCPTimelineView *)self recapMovie];
  double v8 = (double)(unint64_t)[v7 startTimestamp];
  double v9 = [(RCPTimelineView *)self recapMovie];
  uint64_t v10 = [v9 endTimestamp];
  double v11 = [(RCPTimelineView *)self recapMovie];
  double v12 = v8 + v6 * (double)(unint64_t)(v10 - [v11 startTimestamp]);

  int64_t draggingHandle = self->_draggingHandle;
  if (draggingHandle == 2)
  {
    unint64_t v14 = (unint64_t)v12;
    [(RCPTimelineView *)self setEndCropTimestamp:(unint64_t)v12];
  }
  else
  {
    if (draggingHandle != 1)
    {
      if (!draggingHandle)
      {
        [(RCPTimelineView *)self setTime:(unint64_t)v12];
      }
      return;
    }
    unint64_t v14 = (unint64_t)v12;
    [(RCPTimelineView *)self setStartCropTimestamp:(unint64_t)v12];
  }
  [(RCPTimelineView *)self setTime:v14];
  [(RCPTimelineView *)self updateCropUI];
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v67.receiver = self;
  v67.super_class = (Class)RCPTimelineView;
  -[RCPTimelineView drawRect:](&v67, sel_drawRect_);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetRGBFillColor(CurrentContext, 0.2, 0.2, 0.2, 1.0);
  v71.origin.CGFloat x = x;
  v71.origin.CGFloat y = y;
  v71.size.CGFloat width = width;
  v71.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v71);
  double v9 = [(RCPTimelineView *)self recapMovie];
  uint64_t v10 = [v9 eventStream];
  double v11 = [v10 events];
  unint64_t v12 = [v11 count];

  if (v12 >= 2)
  {
    v58 = [MEMORY[0x1E4F1CA48] array];
    double v13 = [MEMORY[0x1E4F1CA60] dictionary];
    [(RCPTimelineView *)self bounds];
    double v15 = v14;
    c = CurrentContext;
    CGContextSetRGBFillColor(CurrentContext, 1.0, 1.0, 1.0, 0.7);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    double v16 = [(RCPTimelineView *)self recapMovie];
    v17 = [v16 eventStream];
    v18 = [v17 events];

    id obj = v18;
    uint64_t v56 = [v18 countByEnumeratingWithState:&v63 objects:v69 count:16];
    if (v56)
    {
      uint64_t v54 = *(void *)v64;
      double v19 = v15 + -48.0;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v64 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v57 = v20;
          long long v21 = *(void **)(*((void *)&v63 + 1) + 8 * v20);
          uint64_t v22 = [v21 timestamp];
          v23 = [(RCPTimelineView *)self recapMovie];
          double v24 = (double)(unint64_t)(v22 - [v23 startTimestamp]);
          v25 = [(RCPTimelineView *)self recapMovie];
          uint64_t v26 = [v25 endTimestamp];
          v27 = [(RCPTimelineView *)self recapMovie];
          double v28 = v24 / (double)(unint64_t)(v26 - [v27 startTimestamp]) * v19 + 24.0;

          v72.origin.CGFloat x = v28 + -3.0;
          v72.origin.CGFloat y = 3.0;
          v72.size.CGFloat width = 6.0;
          v72.size.CGFloat height = 6.0;
          CGContextFillEllipseInRect(c, v72);
          [v21 hidEvent];
          v29 = IOHIDEventGetChildren();
          if ([v29 count])
          {
            unint64_t v30 = 0;
            do
            {
              v31 = [v29 objectAtIndexedSubscript:v30];
              uint64_t IntegerValue = IOHIDEventGetIntegerValue();

              v33 = [v29 objectAtIndexedSubscript:v30];
              char v34 = IOHIDEventGetIntegerValue();

              v35 = [NSNumber numberWithInteger:IntegerValue];
              v36 = [v13 objectForKeyedSubscript:v35];

              -[RCPTimelineView xForTimestamp:](self, "xForTimestamp:", [v21 timestamp]);
              if (v34)
              {
                v39 = [NSNumber numberWithInteger:IntegerValue];
                [v13 removeObjectForKey:v39];
              }
              else
              {
                double v38 = v37;
                if (v36)
                {
                  [(RCPEventTrack *)v36 setEndX:v37];
                }
                else
                {
                  v36 = objc_alloc_init(RCPEventTrack);
                  [(RCPEventTrack *)v36 setStartX:v38];
                  [(RCPEventTrack *)v36 setEndX:v38 + 2.0];
                  -[RCPEventTrack setTrackY:](v36, "setTrackY:", [v13 count]);
                  v40 = [NSNumber numberWithInteger:IntegerValue];
                  [v13 setObject:v36 forKeyedSubscript:v40];

                  [v58 addObject:v36];
                }
              }

              ++v30;
            }
            while (v30 < [v29 count]);
          }

          uint64_t v20 = v57 + 1;
        }
        while (v57 + 1 != v56);
        uint64_t v56 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
      }
      while (v56);
    }

    CGContextSetRGBFillColor(c, 0.0, 0.59, 1.0, 1.0);
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v41 = v58;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v59 objects:v68 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v60 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          CGFloat v47 = (double)[v46 trackY] * 10.0 + 5.0 + 8.0;
          [v46 startX];
          CGFloat v49 = v48;
          [v46 endX];
          double v51 = v50;
          [v46 startX];
          v73.size.CGFloat width = v51 - v52;
          v73.size.CGFloat height = 8.0;
          v73.origin.CGFloat x = v49;
          v73.origin.CGFloat y = v47;
          CGContextFillRect(c, v73);
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v59 objects:v68 count:16];
      }
      while (v43);
    }
  }
}

- (RCPTimelineViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RCPTimelineViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RCPMovie)recapMovie
{
  return self->_recapMovie;
}

- (unint64_t)startCropTimestamp
{
  return self->_startCropTimestamp;
}

- (void)setStartCropTimestamp:(unint64_t)a3
{
  self->_startCropTimestamp = a3;
}

- (unint64_t)endCropTimestamp
{
  return self->_endCropTimestamp;
}

- (void)setEndCropTimestamp:(unint64_t)a3
{
  self->_endCropTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recapMovie, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playbackTimer, 0);
  objc_storeStrong((id *)&self->_cropEndHead, 0);
  objc_storeStrong((id *)&self->_cropStartHead, 0);
  objc_storeStrong((id *)&self->_playbackHead, 0);
}

@end