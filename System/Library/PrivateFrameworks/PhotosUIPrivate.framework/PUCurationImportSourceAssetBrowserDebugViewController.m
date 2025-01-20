@interface PUCurationImportSourceAssetBrowserDebugViewController
- (NSString)importSourceName;
- (void)setImportSourceName:(id)a3;
- (void)viewDidLoad;
@end

@implementation PUCurationImportSourceAssetBrowserDebugViewController

- (void).cxx_destruct
{
}

- (void)setImportSourceName:(id)a3
{
}

- (NSString)importSourceName
{
  return self->_importSourceName;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUCurationImportSourceAssetBrowserDebugViewController;
  [(PUPhotosAlbumViewController *)&v4 viewDidLoad];
  v3 = [(PUCurationImportSourceAssetBrowserDebugViewController *)self navigationItem];
  [v3 setLeftItemsSupplementBackButton:1];
}

@end