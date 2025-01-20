@interface ICAudioPlayPauseView
- (AVAsset)audio;
- (BOOL)isAccessibilityElement;
- (BOOL)isPlaying;
- (CALayer)backgroundLayer;
- (CGSize)intrinsicContentSize;
- (ICAttachment)audioAttachment;
- (ICAudioPlayPauseView)initWithCoder:(id)a3;
- (ICAudioPlayPauseView)initWithFrame:(CGRect)a3;
- (ICNoteEditorIconImageView)pauseView;
- (ICNoteEditorIconImageView)playView;
- (id)accessibilityLabel;
- (id)addSubImageViewForImage:(id)a3;
- (id)foregroundStrokeColor;
- (void)audioDidChange;
- (void)audioPlaybackPauseNotification:(id)a3;
- (void)audioPlaybackPlayNotification:(id)a3;
- (void)audioPlaybackStopNotification:(id)a3;
- (void)audioPlaybackTimeChangedNotification:(id)a3;
- (void)audioWillChange;
- (void)createPlayPauseViews;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)didPlayToEndNotification:(id)a3;
- (void)pause;
- (void)play;
- (void)setAudioAttachment:(id)a3;
- (void)setBackgroundLayer:(id)a3;
- (void)setImageNamed:(id)a3 onLayer:(id)a4 adjustLayerSize:(BOOL)a5;
- (void)setPauseView:(id)a3;
- (void)setPlayView:(id)a3;
- (void)sharedInit;
- (void)showPaused;
- (void)showPlaying;
- (void)tapGesture:(id)a3;
- (void)tintColorDidChange;
- (void)togglePlayPause;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation ICAudioPlayPauseView

- (ICAudioPlayPauseView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICAudioPlayPauseView;
  v3 = -[ICAudioPlayPauseView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(ICAudioPlayPauseView *)v3 sharedInit];
  }
  return v4;
}

- (ICAudioPlayPauseView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICAudioPlayPauseView;
  v3 = [(ICAudioPlayPauseView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(ICAudioPlayPauseView *)v3 sharedInit];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICAudioPlayPauseView;
  [(ICAudioPlayPauseView *)&v4 dealloc];
}

- (void)setAudioAttachment:(id)a3
{
  v5 = (ICAttachment *)a3;
  if (self->_audioAttachment != v5)
  {
    objc_super v6 = v5;
    [(ICAudioPlayPauseView *)self audioWillChange];
    objc_storeStrong((id *)&self->_audioAttachment, a3);
    [(ICAudioPlayPauseView *)self audioDidChange];
    v5 = v6;
  }
}

- (AVAsset)audio
{
  v3 = +[ICAudioController sharedAudioController];
  objc_super v4 = [v3 currentAttachment];
  v5 = [(ICAudioPlayPauseView *)self audioAttachment];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v7 = +[ICAudioController sharedAudioController];
    v8 = [v7 currentAsset];
  }
  else
  {
    v8 = 0;
  }
  return (AVAsset *)v8;
}

- (BOOL)isPlaying
{
  v3 = +[ICAudioController sharedAudioController];
  objc_super v4 = [v3 currentAttachment];
  v5 = [(ICAudioPlayPauseView *)self audioAttachment];
  int v6 = [v4 isEqual:v5];

  if (!v6) {
    return 0;
  }
  v7 = +[ICAudioController sharedAudioController];
  char v8 = [v7 isPlaying];

  return v8;
}

- (void)play
{
  id v4 = +[ICAudioController sharedAudioController];
  v3 = [(ICAudioPlayPauseView *)self audioAttachment];
  [v4 play:v3];
}

- (void)pause
{
  v3 = +[ICAudioController sharedAudioController];
  id v4 = [v3 currentAttachment];
  v5 = [(ICAudioPlayPauseView *)self audioAttachment];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = +[ICAudioController sharedAudioController];
    [v7 pause];
  }
}

- (void)togglePlayPause
{
  if ([(ICAudioPlayPauseView *)self isPlaying])
  {
    [(ICAudioPlayPauseView *)self pause];
  }
  else
  {
    [(ICAudioPlayPauseView *)self play];
  }
}

- (void)sharedInit
{
  LODWORD(v2) = 1144750080;
  [(ICAudioPlayPauseView *)self setContentHuggingPriority:0 forAxis:v2];
  LODWORD(v4) = 1144750080;
  [(ICAudioPlayPauseView *)self setContentHuggingPriority:1 forAxis:v4];
  LODWORD(v5) = 1148846080;
  [(ICAudioPlayPauseView *)self setContentCompressionResistancePriority:0 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [(ICAudioPlayPauseView *)self setContentCompressionResistancePriority:1 forAxis:v6];
  [(ICAudioPlayPauseView *)self createBackgroundLayer];
  [(ICAudioPlayPauseView *)self createPlayPauseViews];
  [(ICAudioPlayPauseView *)self showStopped];
  id v8 = (id)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_tapGesture_];
  [(ICAudioPlayPauseView *)self addGestureRecognizer:v8];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_didPlayToEndNotification_ name:*MEMORY[0x1E4F16020] object:0];
}

- (id)addSubImageViewForImage:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = objc_alloc_init(ICNoteEditorIconImageView);
  [(ICNoteEditorIconImageView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v6 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_largeSystemImageNamed:", v4);

  [(ICNoteEditorIconImageView *)v5 setImage:v6];
  [(ICAudioPlayPauseView *)self addSubview:v5];
  id v7 = (void *)MEMORY[0x1E4F28DC8];
  id v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
  v17[0] = v8;
  v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [v7 activateConstraints:v10];

  v11 = [(ICNoteEditorIconImageView *)v5 image];
  [v11 size];
  double v13 = v12;
  v14 = [(ICNoteEditorIconImageView *)v5 image];
  [v14 size];
  -[ICNoteEditorIconImageView setFrame:](v5, "setFrame:", 0.0, 0.0, v13, v15);

  return v5;
}

- (void)createPlayPauseViews
{
  v3 = [(ICAudioPlayPauseView *)self addSubImageViewForImage:@"play.fill"];
  [(ICAudioPlayPauseView *)self setPlayView:v3];

  id v4 = [(ICAudioPlayPauseView *)self addSubImageViewForImage:@"pause.fill"];
  [(ICAudioPlayPauseView *)self setPauseView:v4];
}

- (void)didMoveToWindow
{
  v10.receiver = self;
  v10.super_class = (Class)ICAudioPlayPauseView;
  [(ICAudioPlayPauseView *)&v10 didMoveToWindow];
  v3 = [(ICAudioPlayPauseView *)self window];
  id v4 = [v3 screen];

  if (v4)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3A5A8]];
    double v5 = [(ICAudioPlayPauseView *)self window];
    double v6 = [v5 screen];
    [v6 scale];
    double v8 = v7;
    v9 = [(ICAudioPlayPauseView *)self backgroundLayer];
    [v9 setContentsScale:v8];

    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (CGSize)intrinsicContentSize
{
  v3 = [(ICAudioPlayPauseView *)self playView];
  [v3 bounds];
  double v5 = v4;

  double v6 = [(ICAudioPlayPauseView *)self pauseView];
  [v6 bounds];
  double v8 = v7;

  if (v5 < v8) {
    double v5 = v8;
  }
  v9 = [(ICAudioPlayPauseView *)self playView];
  [v9 bounds];
  double v11 = v10;

  double v12 = [(ICAudioPlayPauseView *)self pauseView];
  [v12 bounds];
  double v14 = v13;

  if (v11 >= v14) {
    double v15 = v11;
  }
  else {
    double v15 = v14;
  }
  double v16 = v5;
  result.height = v15;
  result.width = v16;
  return result;
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)ICAudioPlayPauseView;
  [(ICAudioPlayPauseView *)&v7 tintColorDidChange];
  v3 = [(ICAudioPlayPauseView *)self tintColor];
  double v4 = [(ICAudioPlayPauseView *)self playView];
  [v4 setTintColor:v3];

  double v5 = [(ICAudioPlayPauseView *)self tintColor];
  double v6 = [(ICAudioPlayPauseView *)self pauseView];
  [v6 setTintColor:v5];
}

- (void)tapGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    [(ICAudioPlayPauseView *)self togglePlayPause];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICAudioPlayPauseView;
  [(ICAudioPlayPauseView *)&v5 touchesBegan:a3 withEvent:a4];
  [(ICAudioPlayPauseView *)self showPressed:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICAudioPlayPauseView;
  [(ICAudioPlayPauseView *)&v5 touchesEnded:a3 withEvent:a4];
  [(ICAudioPlayPauseView *)self showPressed:0];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ICAudioPlayPauseView;
  [(ICAudioPlayPauseView *)&v5 touchesCancelled:a3 withEvent:a4];
  [(ICAudioPlayPauseView *)self showPressed:0];
}

- (void)setImageNamed:(id)a3 onLayer:(id)a4 adjustLayerSize:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a4;
  id v7 = [MEMORY[0x1E4FB1818] imageNamed:a3];
  objc_msgSend(v14, "setContents:", objc_msgSend(v7, "CGImage"));
  if (v5)
  {
    [v14 bounds];
    double v9 = v8;
    double v11 = v10;
    [v7 size];
    objc_msgSend(v14, "setBounds:", v9, v11, v12, v13);
  }
}

- (void)audioWillChange
{
  v3 = [(ICAudioPlayPauseView *)self audioAttachment];

  if (v3)
  {
    double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v5 = [(ICAudioPlayPauseView *)self audioAttachment];
    [v4 removeObserver:self name:@"ICAudioPlaybackPlayNotification" object:v5];

    double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = [(ICAudioPlayPauseView *)self audioAttachment];
    [v6 removeObserver:self name:@"ICAudioPlaybackPauseNotification" object:v7];

    double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v9 = [(ICAudioPlayPauseView *)self audioAttachment];
    [v8 removeObserver:self name:@"ICAudioPlaybackStopNotification" object:v9];

    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v10 = [(ICAudioPlayPauseView *)self audioAttachment];
    [v11 removeObserver:self name:@"ICAudioPlaybackTimeChangedNotification" object:v10];
  }
}

- (void)audioDidChange
{
  uint64_t v3 = [(ICAudioPlayPauseView *)self audioAttachment];
  if (!v3) {
    goto LABEL_3;
  }
  double v4 = (void *)v3;
  BOOL v5 = +[ICAudioController sharedAudioController];
  double v6 = [v5 currentAttachment];
  id v7 = [(ICAudioPlayPauseView *)self audioAttachment];

  if (v6 == v7)
  {
    double v15 = +[ICAudioController sharedAudioController];
    int v16 = [v15 isPlaying];

    if (v16) {
      [(ICAudioPlayPauseView *)self showPlaying];
    }
    else {
      [(ICAudioPlayPauseView *)self showPaused];
    }
  }
  else
  {
LABEL_3:
    [(ICAudioPlayPauseView *)self showStopped];
  }
  double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v9 = [(ICAudioPlayPauseView *)self audioAttachment];
  [v8 addObserver:self selector:sel_audioPlaybackPlayNotification_ name:@"ICAudioPlaybackPlayNotification" object:v9];

  double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v11 = [(ICAudioPlayPauseView *)self audioAttachment];
  [v10 addObserver:self selector:sel_audioPlaybackPauseNotification_ name:@"ICAudioPlaybackPauseNotification" object:v11];

  double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v13 = [(ICAudioPlayPauseView *)self audioAttachment];
  [v12 addObserver:self selector:sel_audioPlaybackStopNotification_ name:@"ICAudioPlaybackStopNotification" object:v13];

  id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v14 = [(ICAudioPlayPauseView *)self audioAttachment];
  [v17 addObserver:self selector:sel_audioPlaybackTimeChangedNotification_ name:@"ICAudioPlaybackTimeChangedNotification" object:v14];
}

- (void)showPlaying
{
  uint64_t v3 = [(ICAudioPlayPauseView *)self playView];
  [v3 setHidden:1];

  id v4 = [(ICAudioPlayPauseView *)self pauseView];
  [v4 setHidden:0];
}

- (void)showPaused
{
  uint64_t v3 = [(ICAudioPlayPauseView *)self playView];
  [v3 setHidden:0];

  id v4 = [(ICAudioPlayPauseView *)self pauseView];
  [v4 setHidden:1];
}

- (void)audioPlaybackPlayNotification:(id)a3
{
  id v6 = [a3 object];
  id v4 = [(ICAudioPlayPauseView *)self audioAttachment];

  BOOL v5 = v6;
  if (v6 == v4)
  {
    [(ICAudioPlayPauseView *)self showPlaying];
    BOOL v5 = v6;
  }
}

- (void)audioPlaybackPauseNotification:(id)a3
{
  id v6 = [a3 object];
  id v4 = [(ICAudioPlayPauseView *)self audioAttachment];

  BOOL v5 = v6;
  if (v6 == v4)
  {
    [(ICAudioPlayPauseView *)self showPaused];
    BOOL v5 = v6;
  }
}

- (void)audioPlaybackStopNotification:(id)a3
{
  id v6 = [a3 object];
  id v4 = [(ICAudioPlayPauseView *)self audioAttachment];

  BOOL v5 = v6;
  if (v6 == v4)
  {
    [(ICAudioPlayPauseView *)self showStopped];
    BOOL v5 = v6;
  }
}

- (void)audioPlaybackTimeChangedNotification:(id)a3
{
  id v13 = a3;
  id v4 = [v13 object];
  BOOL v5 = [(ICAudioPlayPauseView *)self audioAttachment];

  if (v4 == v5)
  {
    id v6 = [v13 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"ICAudioPlaybackNotificationTimeKey"];

    double v8 = [v13 userInfo];
    double v9 = [v8 objectForKeyedSubscript:@"ICAudioPlaybackNotificationDurationKey"];

    [v7 doubleValue];
    double v11 = v10;
    [v9 doubleValue];
    [(ICAudioPlayPauseView *)self updateTime:v11 duration:v12];
  }
}

- (void)didPlayToEndNotification:(id)a3
{
  id v4 = +[ICAudioController sharedAudioController];
  BOOL v5 = [v4 currentAttachment];
  id v6 = [(ICAudioPlayPauseView *)self audioAttachment];

  if (v5 == v6)
  {
    [(ICAudioPlayPauseView *)self showStopped];
  }
}

- (id)foregroundStrokeColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
}

- (ICAttachment)audioAttachment
{
  return self->_audioAttachment;
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (ICNoteEditorIconImageView)playView
{
  return self->_playView;
}

- (void)setPlayView:(id)a3
{
}

- (ICNoteEditorIconImageView)pauseView
{
  return self->_pauseView;
}

- (void)setPauseView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseView, 0);
  objc_storeStrong((id *)&self->_playView, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_audioAttachment, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(ICAudioPlayPauseView *)self isPlaying]) {
    double v2 = @"Pause";
  }
  else {
    double v2 = @"Play";
  }
  uint64_t v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v2 value:v2 table:0 allowSiri:1];
  return v3;
}

@end