@interface ICAudioPlaybackScrubberView
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)wasPlaying;
- (ICAttachment)audioAttachment;
- (ICAudioPlaybackScrubberView)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (void)audioPlaybackTimeChangedNotification:(id)a3;
- (void)dealloc;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setAudioAttachment:(id)a3;
- (void)setWasPlaying:(BOOL)a3;
- (void)updateTime:(double)a3 duration:(double)a4;
@end

@implementation ICAudioPlaybackScrubberView

- (id)accessibilityLabel
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 localizedStringForKey:@"Playback progress" value:&stru_26C10E100 table:0];

  return v3;
}

- (ICAudioPlaybackScrubberView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICAudioPlaybackScrubberView;
  v3 = -[ICAudioPlaybackScrubberView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    LODWORD(v5) = 1132068864;
    [(ICAudioPlaybackScrubberView *)v3 setContentHuggingPriority:0 forAxis:v5];
    if ((objc_msgSend(MEMORY[0x263F82670], "ic_isVision") & 1) == 0)
    {
      v6 = [MEMORY[0x263F827E8] imageNamed:@"audio_scrubber_thumb" inBundle:v4 withConfiguration:0];
      [(ICAudioPlaybackScrubberView *)v3 setThumbImage:v6 forState:0];

      v7 = [MEMORY[0x263F827E8] imageNamed:@"audio_scrubber_track" inBundle:v4 withConfiguration:0];
      [(ICAudioPlaybackScrubberView *)v3 setMinimumTrackImage:v7 forState:0];

      v8 = [MEMORY[0x263F827E8] imageNamed:@"audio_scrubber_track" inBundle:v4 withConfiguration:0];
      [(ICAudioPlaybackScrubberView *)v3 setMaximumTrackImage:v8 forState:0];
    }
    [(ICAudioPlaybackScrubberView *)v3 setSemanticContentAttribute:1];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICAudioPlaybackScrubberView;
  [(ICAudioPlaybackScrubberView *)&v4 dealloc];
}

- (void)setAudioAttachment:(id)a3
{
  double v5 = (ICAttachment *)a3;
  if (self->_audioAttachment != v5)
  {
    v11 = v5;
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v7 = *MEMORY[0x263F5B028];
    v8 = [(ICAudioPlaybackScrubberView *)self audioAttachment];
    [v6 removeObserver:self name:v7 object:v8];

    objc_storeStrong((id *)&self->_audioAttachment, a3);
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    objc_super v10 = [(ICAudioPlaybackScrubberView *)self audioAttachment];
    [v9 addObserver:self selector:sel_audioPlaybackTimeChangedNotification_ name:v7 object:v10];

    double v5 = v11;
  }
}

- (ICAttachment)audioAttachment
{
  return self->_audioAttachment;
}

- (void)audioPlaybackTimeChangedNotification:(id)a3
{
  id v13 = a3;
  objc_super v4 = [v13 object];
  double v5 = [(ICAudioPlaybackScrubberView *)self audioAttachment];

  if (v4 == v5)
  {
    v6 = [v13 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F5B008]];

    v8 = [v13 userInfo];
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F5B000]];

    [v7 doubleValue];
    double v11 = v10;
    [v9 doubleValue];
    [(ICAudioPlaybackScrubberView *)self updateTime:v11 duration:v12];
  }
}

- (void)updateTime:(double)a3 duration:(double)a4
{
  double v4 = a3;
  *(float *)&a3 = a4;
  [(ICAudioPlaybackScrubberView *)self setMaximumValue:a3];

  *(float *)&double v6 = v4;
  [(ICAudioPlaybackScrubberView *)self setValue:1 animated:v6];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ICAudioPlaybackScrubberView;
  BOOL v5 = [(ICAudioPlaybackScrubberView *)&v9 beginTrackingWithTouch:a3 withEvent:a4];
  double v6 = [MEMORY[0x263F5B240] sharedAudioController];
  -[ICAudioPlaybackScrubberView setWasPlaying:](self, "setWasPlaying:", [v6 isPlaying]);

  if ([(ICAudioPlaybackScrubberView *)self wasPlaying])
  {
    uint64_t v7 = [MEMORY[0x263F5B240] sharedAudioController];
    [v7 pause];
  }
  return v5;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  int v6 = [(ICAudioPlaybackScrubberView *)self isTracking];
  if (v6)
  {
    [v5 locationInView:self];
    double v8 = v7;
    double v10 = v9;
    [v5 previousLocationInView:self];
    double v12 = v11;
    [(ICAudioPlaybackScrubberView *)self frame];
    double v13 = v10 + CGRectGetHeight(v26) * -0.5;
    if (v13 < 0.0) {
      double v13 = -v13;
    }
    float v14 = 0.25;
    float v15 = 1.0;
    if (v13 > 50.0) {
      float v15 = 0.5;
    }
    if (v13 <= 120.0) {
      float v14 = v15;
    }
    if (v13 <= 170.0) {
      float v16 = v14;
    }
    else {
      float v16 = 0.1;
    }
    [(ICAudioPlaybackScrubberView *)self frame];
    double v17 = (v8 - v12) / CGRectGetWidth(v27);
    [(ICAudioPlaybackScrubberView *)self maximumValue];
    float v19 = v18;
    [(ICAudioPlaybackScrubberView *)self minimumValue];
    float v21 = v17 * (float)(v19 - v20);
    float v22 = v16 * v21;
    [(ICAudioPlaybackScrubberView *)self value];
    *(float *)&double v24 = v23 + v22;
    [(ICAudioPlaybackScrubberView *)self setValue:v24];
    if ([(ICAudioPlaybackScrubberView *)self isContinuous]) {
      [(ICAudioPlaybackScrubberView *)self sendActionsForControlEvents:4096];
    }
  }

  return v6;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICAudioPlaybackScrubberView *)self value];
  int v9 = v8;
  v14.receiver = self;
  v14.super_class = (Class)ICAudioPlaybackScrubberView;
  [(ICAudioPlaybackScrubberView *)&v14 endTrackingWithTouch:v7 withEvent:v6];

  LODWORD(v10) = v9;
  [(ICAudioPlaybackScrubberView *)self setValue:v10];
  double v11 = [MEMORY[0x263F5B240] sharedAudioController];
  [(ICAudioPlaybackScrubberView *)self value];
  [v11 seekToTime:0 completion:v12];

  if ([(ICAudioPlaybackScrubberView *)self wasPlaying])
  {
    double v13 = [MEMORY[0x263F5B240] sharedAudioController];
    [v13 play];
  }
}

- (BOOL)wasPlaying
{
  return self->_wasPlaying;
}

- (void)setWasPlaying:(BOOL)a3
{
  self->_wasPlaying = a3;
}

- (void).cxx_destruct
{
}

@end