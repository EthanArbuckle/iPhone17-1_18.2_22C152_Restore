@interface ICNotePreviewViewController
- (ICNotePreviewViewController)initWithNote:(id)a3;
- (ICNoteResultsThumbnailView)noteResultsThumbnailView;
- (ICSearchIndexableNote)note;
- (UIStackView)stackView;
- (void)setNoteResultsThumbnailView:(id)a3;
- (void)setStackView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation ICNotePreviewViewController

- (ICNotePreviewViewController)initWithNote:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNotePreviewViewController;
  v5 = [(ICNotePreviewViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_note, v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)ICNotePreviewViewController;
  [(ICNotePreviewViewController *)&v4 viewDidLoad];
  v3 = [(ICNotePreviewViewController *)self noteResultsThumbnailView];
  [v3 setPreviewing:1];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNotePreviewViewController;
  [(ICNotePreviewViewController *)&v6 viewIsAppearing:a3];
  objc_super v4 = [(ICNotePreviewViewController *)self note];
  v5 = [(ICNotePreviewViewController *)self noteResultsThumbnailView];
  [v5 setNote:v4];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)ICNotePreviewViewController;
  [(ICNotePreviewViewController *)&v8 viewDidLayoutSubviews];
  v3 = [(ICNotePreviewViewController *)self stackView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  -[ICNotePreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
}

- (ICSearchIndexableNote)note
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_note);

  return (ICSearchIndexableNote *)WeakRetained;
}

- (UIStackView)stackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackView);

  return (UIStackView *)WeakRetained;
}

- (void)setStackView:(id)a3
{
}

- (ICNoteResultsThumbnailView)noteResultsThumbnailView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noteResultsThumbnailView);

  return (ICNoteResultsThumbnailView *)WeakRetained;
}

- (void)setNoteResultsThumbnailView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_noteResultsThumbnailView);
  objc_destroyWeak((id *)&self->_stackView);

  objc_destroyWeak((id *)&self->_note);
}

@end