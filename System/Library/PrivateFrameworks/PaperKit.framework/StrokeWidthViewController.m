@interface StrokeWidthViewController
- (BOOL)_canShowWhileLocked;
- (_TtC8PaperKit25StrokeWidthViewController)initWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation StrokeWidthViewController

- (void)viewDidLoad
{
  v2 = self;
  StrokeWidthViewController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8PaperKit25StrokeWidthViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ValueEditingViewController *)&v5 initWithCoder:a3];
}

@end