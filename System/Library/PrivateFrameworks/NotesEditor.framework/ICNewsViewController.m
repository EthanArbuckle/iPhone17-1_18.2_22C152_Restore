@interface ICNewsViewController
- (BOOL)_canShowWhileLocked;
- (ICAttachment)attachment;
- (ICNewsViewController)initWithURL:(id)a3;
- (NSSNewsViewController)newsViewController;
- (NSURL)url;
- (void)setAttachment:(id)a3;
- (void)setNewsViewController:(id)a3;
- (void)setUrl:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICNewsViewController

- (ICNewsViewController)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNewsViewController;
  v5 = [(ICNewsViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICNewsViewController *)v5 setUrl:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)ICNewsViewController;
  [(ICNewsViewController *)&v22 viewDidLoad];
  id v3 = objc_alloc((Class)getNSSNewsViewControllerClass());
  id v4 = [(ICNewsViewController *)self url];
  v5 = (void *)[v3 initWithURL:v4];
  [(ICNewsViewController *)self setNewsViewController:v5];

  v6 = [(ICNewsViewController *)self newsViewController];
  [v6 setLinkPreviewing:1];

  v7 = [(ICNewsViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(ICNewsViewController *)self newsViewController];
  v17 = [v16 view];
  objc_msgSend(v17, "setFrame:", v9, v11, v13, v15);

  v18 = [(ICNewsViewController *)self view];
  v19 = [(ICNewsViewController *)self newsViewController];
  v20 = [v19 view];
  [v18 addSubview:v20];

  v21 = [(ICNewsViewController *)self newsViewController];
  [(ICNewsViewController *)self addChildViewController:v21];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSSNewsViewController)newsViewController
{
  return self->_newsViewController;
}

- (void)setNewsViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newsViewController, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_attachment, 0);
}

@end