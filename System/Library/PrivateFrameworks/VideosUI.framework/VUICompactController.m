@interface VUICompactController
- (void)viewDidLoad;
@end

@implementation VUICompactController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)VUICompactController;
  [(VUICompactController *)&v5 viewDidLoad];
  v3 = [(VUICompactController *)self view];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];
}

@end