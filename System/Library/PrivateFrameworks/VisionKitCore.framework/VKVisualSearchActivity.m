@interface VKVisualSearchActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (CGImage)imageToProcess;
- (NSString)title;
- (UIImage)image;
- (UIViewController)presentingViewController;
- (VKVisualSearchActivity)initWithImage:(CGImage *)a3 presentingViewController:(id)a4;
- (id)activityType;
- (void)performActivity;
- (void)setImage:(id)a3;
- (void)setImageToProcess:(CGImage *)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VKVisualSearchActivity

- (VKVisualSearchActivity)initWithImage:(CGImage *)a3 presentingViewController:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VKVisualSearchActivity;
  v7 = [(UIActivity *)&v16 init];
  if (v7)
  {
    v8 = VKBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"VK_LOOK_UP_VISUAL_SEARCH_ITEM_TITLE" value:@"VK_LOOK_UP_VISUAL_SEARCH_ITEM_TITLE" table:@"Localizable"];
    title = v7->_title;
    v7->_title = (NSString *)v9;

    v11 = [MEMORY[0x1E4F42A80] systemImageNamed:@"info.circle"];
    v12 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F438F0] scale:2];
    uint64_t v13 = [v11 imageWithSymbolConfiguration:v12];
    image = v7->_image;
    v7->_image = (UIImage *)v13;

    objc_storeWeak((id *)&v7->_presentingViewController, v6);
    v7->_imageToProcess = a3;
  }

  return v7;
}

- (id)activityType
{
  return @"com.apple.visionkit.visualSearch";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  v4 = [[VKVisualSearchViewController alloc] initWithImage:[(VKVisualSearchActivity *)self imageToProcess]];
  [(VKVisualSearchViewController *)v4 setModalPresentationStyle:2];
  v3 = [(VKVisualSearchActivity *)self presentingViewController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (CGImage)imageToProcess
{
  return self->_imageToProcess;
}

- (void)setImageToProcess:(CGImage *)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end