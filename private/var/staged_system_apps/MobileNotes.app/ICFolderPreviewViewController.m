@interface ICFolderPreviewViewController
- (ICFolder)folder;
- (ICFolderPreviewViewController)initWithFolder:(id)a3;
- (ICNoteBrowseFolderThumbnailView)folderThumbnailView;
- (ICPreviewFooterView)previewFooterView;
- (UIStackView)stackView;
- (void)setFolderThumbnailView:(id)a3;
- (void)setPreviewFooterView:(id)a3;
- (void)setStackView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation ICFolderPreviewViewController

- (ICFolderPreviewViewController)initWithFolder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICFolderPreviewViewController;
  v5 = [(ICFolderPreviewViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_folder, v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)ICFolderPreviewViewController;
  [(ICFolderPreviewViewController *)&v17 viewDidLoad];
  v3 = [(ICFolderPreviewViewController *)self folderThumbnailView];
  [v3 setBackgroundColor:0];

  id v4 = [(ICFolderPreviewViewController *)self folderThumbnailView];
  [v4 setHasDropShadow:0];

  v5 = [(ICFolderPreviewViewController *)self folderThumbnailView];
  [v5 setAllowsCompactSizeMetrics:0];

  v6 = [(ICFolderPreviewViewController *)self folder];
  v7 = [v6 title];
  objc_super v8 = [(ICFolderPreviewViewController *)self previewFooterView];
  [v8 setTitle:v7];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"%lu Notes" value:&stru_10063F3D8 table:0];
  v11 = [(ICFolderPreviewViewController *)self folder];
  v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, [v11 visibleNotesCount]);
  v13 = [(ICFolderPreviewViewController *)self previewFooterView];
  [v13 setContentsSubtitle:v12];

  v14 = [(ICFolderPreviewViewController *)self folder];
  v15 = [v14 shareDescription];
  v16 = [(ICFolderPreviewViewController *)self previewFooterView];
  [v16 setSharingSubtitle:v15];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICFolderPreviewViewController;
  [(ICFolderPreviewViewController *)&v6 viewIsAppearing:a3];
  id v4 = [(ICFolderPreviewViewController *)self folder];
  v5 = [(ICFolderPreviewViewController *)self folderThumbnailView];
  [v5 setFolder:v4];
}

- (void)viewDidLayoutSubviews
{
  id v5 = [(ICFolderPreviewViewController *)self stackView];
  [v5 frame];
  -[ICFolderPreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", v3, v4);
}

- (ICFolder)folder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folder);

  return (ICFolder *)WeakRetained;
}

- (UIStackView)stackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackView);

  return (UIStackView *)WeakRetained;
}

- (void)setStackView:(id)a3
{
}

- (ICNoteBrowseFolderThumbnailView)folderThumbnailView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderThumbnailView);

  return (ICNoteBrowseFolderThumbnailView *)WeakRetained;
}

- (void)setFolderThumbnailView:(id)a3
{
}

- (ICPreviewFooterView)previewFooterView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewFooterView);

  return (ICPreviewFooterView *)WeakRetained;
}

- (void)setPreviewFooterView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previewFooterView);
  objc_destroyWeak((id *)&self->_folderThumbnailView);
  objc_destroyWeak((id *)&self->_stackView);

  objc_destroyWeak((id *)&self->_folder);
}

@end