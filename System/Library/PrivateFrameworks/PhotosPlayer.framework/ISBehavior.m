@interface ISBehavior
- (BOOL)isActive;
- (BOOL)prerollVideoAtRate:(float)a3 completionHandler:(id)a4;
- (BOOL)seekVideoPlayerToTime:(id *)a3 completionHandler:(id)a4;
- (BOOL)seekVideoPlayerToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6;
- (ISBehavior)initWithInitialLayoutInfo:(id)a3;
- (ISBehaviorDelegate)delegate;
- (ISPlayerState)initialLayoutInfo;
- (int64_t)behaviorType;
- (void)becomeActive;
- (void)resignActive;
- (void)setDelegate:(id)a3;
- (void)setOutputInfo:(id)a3 withTransitionOptions:(id)a4 completion:(id)a5;
- (void)setVideoForwardPlaybackEndTime:(id *)a3;
- (void)setVideoPlayRate:(float)a3;
- (void)setVideoVolume:(float)a3;
@end

@implementation ISBehavior

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialLayoutInfo, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)becomeActive
{
  self->_active = 1;
  [(ISBehavior *)self activeDidChange];
}

- (BOOL)isActive
{
  return self->_active;
}

- (ISPlayerState)initialLayoutInfo
{
  return self->_initialLayoutInfo;
}

- (ISBehaviorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ISBehaviorDelegate *)WeakRetained;
}

- (void)setVideoForwardPlaybackEndTime:(id *)a3
{
  v5 = [(ISBehavior *)self delegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [v5 behavior:self setVideoForwardPlaybackEndTime:&v6];
}

- (BOOL)prerollVideoAtRate:(float)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = [(ISBehavior *)self delegate];
  *(float *)&double v8 = a3;
  LOBYTE(self) = [v7 behavior:self prerollVideoAtRate:v6 completionHandler:v8];

  return (char)self;
}

- (BOOL)seekVideoPlayerToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v11 = [(ISBehavior *)self delegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a5;
  LOBYTE(a5) = [v11 behavior:self seekVideoPlayerToTime:&v15 toleranceBefore:&v14 toleranceAfter:&v13 completionHandler:v10];

  return (char)a5;
}

- (BOOL)seekVideoPlayerToTime:(id *)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = [(ISBehavior *)self delegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  LOBYTE(a3) = [v7 behavior:self seekVideoPlayerToTime:&v9 completionHandler:v6];

  return (char)a3;
}

- (void)setVideoVolume:(float)a3
{
  id v6 = [(ISBehavior *)self delegate];
  *(float *)&double v5 = a3;
  [v6 behavior:self setVideoVolume:v5];
}

- (void)setVideoPlayRate:(float)a3
{
  id v6 = [(ISBehavior *)self delegate];
  *(float *)&double v5 = a3;
  [v6 behavior:self setVideoPlayRate:v5];
}

- (void)setOutputInfo:(id)a3 withTransitionOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ISBehavior *)self delegate];
  [v11 behavior:self didSetOutputInfo:v10 withTransitionOptions:v9 completion:v8];
}

- (void)resignActive
{
  self->_active = 0;
  [(ISBehavior *)self activeDidChange];
}

- (int64_t)behaviorType
{
  return 0;
}

- (ISBehavior)initWithInitialLayoutInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISBehavior;
  id v6 = [(ISBehavior *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_initialLayoutInfo, a3);
  }

  return v7;
}

@end