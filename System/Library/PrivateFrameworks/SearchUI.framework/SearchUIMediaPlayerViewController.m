@interface SearchUIMediaPlayerViewController
- (BOOL)_canShowWhileLocked;
- (SearchUIMediaPlayerViewController)initWithDestination:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SearchUIMediaPlayerViewController

- (SearchUIMediaPlayerViewController)initWithDestination:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SearchUIMediaPlayerViewController;
  v5 = [(SearchUIMediaPlayerViewController *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F16608];
    v7 = [v4 urls];
    v8 = [v7 firstObject];
    v9 = [v6 playerWithURL:v8];

    v10 = [MEMORY[0x1E4F153E0] auxiliarySession];
    [v9 setAudioSession:v10];

    v11 = [v9 audioSession];
    [v11 setCategory:*MEMORY[0x1E4F14F98] error:0];

    [(SearchUIMediaPlayerViewController *)v5 setAllowsPictureInPicturePlayback:0];
    [(SearchUIMediaPlayerViewController *)v5 setPlayer:v9];
  }
  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIMediaPlayerViewController;
  [(SearchUIMediaPlayerViewController *)&v5 viewDidAppear:a3];
  id v4 = [(SearchUIMediaPlayerViewController *)self player];
  [v4 play];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end