@interface MSVolumeViewController
- (void)loadView;
@end

@implementation MSVolumeViewController

- (void)loadView
{
  id v3 = objc_alloc_init(MEMORY[0x263F12350]);
  [v3 sizeToFit];
  [(MSVolumeViewController *)self setView:v3];
}

@end