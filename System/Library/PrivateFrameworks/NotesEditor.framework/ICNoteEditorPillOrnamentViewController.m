@interface ICNoteEditorPillOrnamentViewController
- (ICNoteEditorPillOrnamentViewController)initWithRootViewController:(id)a3;
- (NSArray)toolbarItems;
- (UIToolbar)toolbar;
- (void)setToolbar:(id)a3;
- (void)setToolbarItems:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ICNoteEditorPillOrnamentViewController

- (ICNoteEditorPillOrnamentViewController)initWithRootViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICNoteEditorPillOrnamentViewController;
  v3 = -[ICPillOrnamentViewController initWithRootViewController:contentAnchorPoint:sceneAnchorPoint:offset:cornerRadius:](&v7, sel_initWithRootViewController_contentAnchorPoint_sceneAnchorPoint_offset_cornerRadius_, a3, 0.5, 0.0, 0.5, 1.0, 0.0, -20.0, 0.0);
  if (v3)
  {
    v4 = (UIToolbar *)objc_alloc_init(MEMORY[0x263F82D70]);
    toolbar = v3->_toolbar;
    v3->_toolbar = v4;

    [(UIToolbar *)v3->_toolbar setItems:MEMORY[0x263EFFA68]];
  }
  return v3;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoteEditorPillOrnamentViewController;
  [(ICNoteEditorPillOrnamentViewController *)&v6 viewDidLoad];
  v3 = [(ICPillOrnamentViewController *)self contentView];
  v4 = [(ICNoteEditorPillOrnamentViewController *)self toolbar];
  [v3 addSubview:v4];

  v5 = [(ICNoteEditorPillOrnamentViewController *)self toolbar];
  objc_msgSend(v5, "ic_addAnchorsToFillSuperview");
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICNoteEditorPillOrnamentViewController;
  [(ICNoteEditorPillOrnamentViewController *)&v3 viewDidLayoutSubviews];
  -[ICPillOrnamentViewController setPreferredContentSize:](self, "setPreferredContentSize:", 445.0, 68.0);
}

- (NSArray)toolbarItems
{
  v2 = [(ICNoteEditorPillOrnamentViewController *)self toolbar];
  objc_super v3 = [v2 items];

  return (NSArray *)v3;
}

- (void)setToolbarItems:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteEditorPillOrnamentViewController *)self toolbar];
  [v5 setItems:v4];
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void)setToolbar:(id)a3
{
}

- (void).cxx_destruct
{
}

@end