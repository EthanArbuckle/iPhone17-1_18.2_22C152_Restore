@interface VUIPrimaryController
- (void)viewDidLoad;
@end

@implementation VUIPrimaryController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)VUIPrimaryController;
  [(VUIPrimaryController *)&v5 viewDidLoad];
  v3 = [(VUIPrimaryController *)self view];
  v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v3 setBackgroundColor:v4];
}

@end