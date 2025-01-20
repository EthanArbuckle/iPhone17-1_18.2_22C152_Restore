@interface SUScriptMediaPlayerViewController
- (SUScriptMediaPlayerViewController)initWithMediaPlayerItem:(id)a3;
- (id)_className;
@end

@implementation SUScriptMediaPlayerViewController

- (SUScriptMediaPlayerViewController)initWithMediaPlayerItem:(id)a3
{
  if (!a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Must provide a media item"];
  }
  v6.receiver = self;
  v6.super_class = (Class)SUScriptMediaPlayerViewController;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4) {
    WebThreadRunOnMainThread();
  }
  return v4;
}

void __61__SUScriptMediaPlayerViewController_initWithMediaPlayerItem___block_invoke(uint64_t a1)
{
  id v3 = (id)[*(id *)(a1 + 32) copyNativeMediaPlayerItem];
  v2 = [[SUMediaPlayerViewController alloc] initWithMediaPlayerItem:v3];
  [*(id *)(a1 + 40) setNativeViewController:v2];
}

- (id)_className
{
  return @"iTunesMediaPlayerViewController";
}

@end