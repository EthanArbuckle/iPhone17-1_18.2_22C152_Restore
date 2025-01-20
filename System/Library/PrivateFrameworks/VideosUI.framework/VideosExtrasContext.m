@interface VideosExtrasContext
+ (Class)extrasRootViewControllerClass;
+ (id)overriddenJavascriptURL;
+ (void)overrideJavascriptURL:(id)a3;
- (BOOL)isMenuItemElementMainFeature:(id)a3;
- (BOOL)isStarted;
- (BOOL)shouldExtrasBeVisibleForSize:(CGSize)a3;
- (BOOL)showsBuiltInNavigationControls;
- (BOOL)showsMenuBar;
- (MPMediaItem)mediaItem;
- (MPPlaybackContext)featurePlaybackContext;
- (NSArray)mainMenuItemElements;
- (NSString)buyParameters;
- (NSURL)javascriptURL;
- (TVPMediaItem)tvpMediaItem;
- (UIViewController)featurePlaybackViewController;
- (VideosExtrasContext)init;
- (VideosExtrasContext)initWithApplicationJavascriptURL:(id)a3 storeID:(int64_t)a4 buyParameters:(id)a5 mediaItem:(id)a6;
- (VideosExtrasContext)initWithMediaItem:(id)a3;
- (VideosExtrasContext)initWithTVPMediaItem:(id)a3;
- (VideosExtrasContextDelegate)delegate;
- (VideosExtrasRootViewController)extrasRootViewController;
- (int64_t)storeID;
- (unint64_t)selectedMainMenuIndex;
- (void)_configureForMediaItem:(id)a3;
- (void)clearNavStack;
- (void)extrasBackButtonPressed;
- (void)extrasDoneButtonPressed;
- (void)extrasMenuItemSelected:(id)a3 atIndex:(unint64_t)a4;
- (void)extrasRequestReloadWithContext:(id)a3;
- (void)extrasRequestsMediaPlayback:(id)a3 isBackground:(BOOL)a4;
- (void)extrasRequestsPlaybackStop;
- (void)extrasRootViewController:(id)a3 extrasVisibilityNeedsUpdate:(BOOL)a4;
- (void)extrasRootViewControllerDidLoadMainMenuItems:(id)a3;
- (void)failWithError:(id)a3;
- (void)setClearsStackOnNextPush;
- (void)setDelegate:(id)a3;
- (void)setFeaturePlaybackContext:(id)a3;
- (void)setFeaturePlaybackViewController:(id)a3;
- (void)setIsStarted:(BOOL)a3;
- (void)setSelectedMainMenuIndex:(unint64_t)a3;
- (void)setShowsBuiltInNavigationControls:(BOOL)a3;
- (void)setShowsMenuBar:(BOOL)a3;
- (void)startIfNecessary;
@end

@implementation VideosExtrasContext

- (VideosExtrasContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)VideosExtrasContext;
  v2 = [(VideosExtrasContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "extrasRootViewControllerClass")), "initWithContext:", v2);
    extrasRootViewController = v2->_extrasRootViewController;
    v2->_extrasRootViewController = (VideosExtrasRootViewController *)v3;

    [(VideosExtrasRootViewController *)v2->_extrasRootViewController setDelegate:v2];
  }
  return v2;
}

- (VideosExtrasContext)initWithMediaItem:(id)a3
{
  id v4 = a3;
  v5 = [(VideosExtrasContext *)self init];
  objc_super v6 = v5;
  if (v5) {
    [(VideosExtrasContext *)v5 _configureForMediaItem:v4];
  }

  return v6;
}

- (VideosExtrasContext)initWithTVPMediaItem:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(VideosExtrasContext *)self init];
  if (v6)
  {
    uint64_t v7 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EF0]];
    javascriptURL = v6->_javascriptURL;
    v6->_javascriptURL = (NSURL *)v7;

    v9 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E20]];
    uint64_t v10 = [v9 copy];
    buyParameters = v6->_buyParameters;
    v6->_buyParameters = (NSString *)v10;

    v12 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
    v6->_storeID = [v12 longLongValue];
    v6->_selectedMainMenuIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v6->_tvpMediaItem, a3);
  }
  return v6;
}

- (VideosExtrasContext)initWithApplicationJavascriptURL:(id)a3 storeID:(int64_t)a4 buyParameters:(id)a5 mediaItem:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [(VideosExtrasContext *)self init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    javascriptURL = v13->_javascriptURL;
    v13->_javascriptURL = (NSURL *)v14;

    v13->_storeID = a4;
    uint64_t v16 = [v11 copy];
    buyParameters = v13->_buyParameters;
    v13->_buyParameters = (NSString *)v16;

    v13->_selectedMainMenuIndex = 0x7FFFFFFFFFFFFFFFLL;
    objc_storeStrong((id *)&v13->_tvpMediaItem, a6);
  }

  return v13;
}

- (void)_configureForMediaItem:(id)a3
{
  id v4 = (MPMediaItem *)a3;
  id v5 = [(MPMediaItem *)v4 valueForProperty:*MEMORY[0x1E4F31500]];
  self->_storeID = [v5 longLongValue];

  objc_super v6 = [(MPMediaItem *)v4 valueForProperty:*MEMORY[0x1E4F31510]];
  buyParameters = self->_buyParameters;
  self->_buyParameters = v6;

  self->_selectedMainMenuIndex = 0x7FFFFFFFFFFFFFFFLL;
  v8 = [(id)objc_opt_class() overriddenJavascriptURL];
  javascriptURL = self->_javascriptURL;
  self->_javascriptURL = v8;

  if (!self->_javascriptURL)
  {
    id v10 = [(MPMediaItem *)v4 valueForProperty:*MEMORY[0x1E4F314F0]];
    id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
    id v12 = self->_javascriptURL;
    self->_javascriptURL = v11;
  }
  mediaItem = self->_mediaItem;
  self->_mediaItem = v4;
}

- (void)extrasRequestsMediaPlayback:(id)a3 isBackground:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(VideosExtrasContext *)self delegate];
  [v7 extrasRequestsMediaPlayback:v6 isBackground:v4];
}

- (void)extrasRequestsPlaybackStop
{
  id v2 = [(VideosExtrasContext *)self delegate];
  [v2 extrasRequestsPlaybackStop];
}

- (void)extrasBackButtonPressed
{
  uint64_t v3 = [(VideosExtrasContext *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(VideosExtrasContext *)self delegate];
    [v5 extrasBackButtonPressed];
  }
}

- (void)extrasMenuItemSelected:(id)a3 atIndex:(unint64_t)a4
{
  id v9 = a3;
  id v6 = [(VideosExtrasContext *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(VideosExtrasContext *)self delegate];
    [v8 extrasMenuItemSelected:v9 atIndex:a4];
  }
}

- (void)extrasDoneButtonPressed
{
  uint64_t v3 = [(VideosExtrasContext *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(VideosExtrasContext *)self delegate];
    [v5 extrasDoneButtonPressed];
  }
}

- (void)extrasRequestReloadWithContext:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(VideosExtrasContext *)self featurePlaybackContext];
  }
  id v6 = v4;
  id v5 = [(VideosExtrasContext *)self delegate];
  [v5 extrasRequestReloadWithContext:v6];
}

- (void)failWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasContext *)self delegate];
  [v5 extrasContext:self hadFatalError:v4];
}

- (void)startIfNecessary
{
  if (![(VideosExtrasContext *)self isStarted])
  {
    [(VideosExtrasContext *)self setIsStarted:1];
    extrasRootViewController = self->_extrasRootViewController;
    [(VideosExtrasRootViewController *)extrasRootViewController start];
  }
}

- (void)setShowsBuiltInNavigationControls:(BOOL)a3
{
}

- (BOOL)showsBuiltInNavigationControls
{
  return [(VideosExtrasRootViewController *)self->_extrasRootViewController showsBuiltInNavigationControls];
}

- (void)setShowsMenuBar:(BOOL)a3
{
}

- (BOOL)showsMenuBar
{
  return [(VideosExtrasRootViewController *)self->_extrasRootViewController showsMenuBar];
}

- (void)setClearsStackOnNextPush
{
}

- (void)setSelectedMainMenuIndex:(unint64_t)a3
{
  unint64_t selectedMainMenuIndex = self->_selectedMainMenuIndex;
  if (selectedMainMenuIndex != a3)
  {
    self->_unint64_t selectedMainMenuIndex = a3;
    id v5 = [(VideosExtrasContext *)self extrasRootViewController];
    [v5 updateMenuButtonForSelectionAtIndex:self->_selectedMainMenuIndex deselectedIndex:selectedMainMenuIndex];
  }
}

- (void)clearNavStack
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(VideosExtrasRootViewController *)self->_extrasRootViewController navigationController];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  v5[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 setViewControllers:v4 animated:0];
}

- (NSArray)mainMenuItemElements
{
  return [(VideosExtrasRootViewController *)self->_extrasRootViewController mainMenuItemElements];
}

- (BOOL)isMenuItemElementMainFeature:(id)a3
{
  id v3 = [a3 attributes];
  id v4 = [v3 objectForKey:@"type"];
  char v5 = [v4 isEqualToString:@"video"];

  return v5;
}

- (BOOL)shouldExtrasBeVisibleForSize:(CGSize)a3
{
  return -[VideosExtrasRootViewController shouldExtrasBeVisibleForViewSize:](self->_extrasRootViewController, "shouldExtrasBeVisibleForViewSize:", a3.width, a3.height);
}

- (void)extrasRootViewControllerDidLoadMainMenuItems:(id)a3
{
  id v4 = [(VideosExtrasContext *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VideosExtrasContext *)self delegate];
    [v6 extrasContextDidLoadMainMenuItems:self];
  }
}

- (void)extrasRootViewController:(id)a3 extrasVisibilityNeedsUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(VideosExtrasContext *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(VideosExtrasContext *)self delegate];
    [v8 extrasContext:self extrasVisibilityNeedsUpdate:v4];
  }
}

+ (void)overrideJavascriptURL:(id)a3
{
}

+ (id)overriddenJavascriptURL
{
  return (id)VideosExtrasOverrideURL;
}

+ (Class)extrasRootViewControllerClass
{
  return (Class)objc_opt_class();
}

- (VideosExtrasContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VideosExtrasContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)featurePlaybackViewController
{
  return self->_featurePlaybackViewController;
}

- (void)setFeaturePlaybackViewController:(id)a3
{
}

- (MPPlaybackContext)featurePlaybackContext
{
  return self->_featurePlaybackContext;
}

- (void)setFeaturePlaybackContext:(id)a3
{
}

- (VideosExtrasRootViewController)extrasRootViewController
{
  return self->_extrasRootViewController;
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (TVPMediaItem)tvpMediaItem
{
  return self->_tvpMediaItem;
}

- (NSURL)javascriptURL
{
  return self->_javascriptURL;
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (int64_t)storeID
{
  return self->_storeID;
}

- (unint64_t)selectedMainMenuIndex
{
  return self->_selectedMainMenuIndex;
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (void)setIsStarted:(BOOL)a3
{
  self->_isStarted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_javascriptURL, 0);
  objc_storeStrong((id *)&self->_tvpMediaItem, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_extrasRootViewController, 0);
  objc_storeStrong((id *)&self->_featurePlaybackContext, 0);
  objc_storeStrong((id *)&self->_featurePlaybackViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end