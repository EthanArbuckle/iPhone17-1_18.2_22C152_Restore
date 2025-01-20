@interface ICNotePrintActivityItemSource
- (CGSize)size;
- (ICNote)note;
- (ICNotePrintActivityItemSource)initWithNote:(id)a3 size:(CGSize)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setNote:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation ICNotePrintActivityItemSource

- (ICNotePrintActivityItemSource)initWithNote:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICNotePrintActivityItemSource;
  v8 = [(ICNotePrintActivityItemSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ICNotePrintActivityItemSource *)v8 setNote:v7];
    -[ICNotePrintActivityItemSource setSize:](v9, "setSize:", width, height);
  }

  return v9;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a3;
  v6 = [(ICNotePrintActivityItemSource *)self note];
  unsigned int v7 = [v6 isSharable];

  if (v7)
  {
    v8 = [v5 traitCollection];
    v9 = [v8 traitCollectionByModifyingTraits:&stru_10062A6C8];

    v10 = [(ICNotePrintActivityItemSource *)self note];
    objc_super v11 = [v10 textStorage];
    v12 = [v11 styler];

    if (!v12)
    {
      id v13 = objc_alloc_init((Class)ICTextController);
      v14 = [(ICNotePrintActivityItemSource *)self note];
      [(ICNotePrintActivityItemSource *)self size];
      id v15 = +[ICTextViewController createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:](ICTextViewController, "createTextViewUsingTextController:stylingTextUsingSeparateTextStorageForRendering:note:containerWidth:forManualRendering:scrollState:traitCollection:", v13, 0, v14, 0, 0, v9);
    }
    v16 = [(ICNotePrintActivityItemSource *)self note];
    [(ICNotePrintActivityItemSource *)self size];
    v17 = +[ICTextViewController printFormatterForNote:withSize:traitCollection:](ICTextViewController, "printFormatterForNote:withSize:traitCollection:", v16, v9);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v3 = objc_alloc_init((Class)UIPrintFormatter);

  return v3;
}

- (ICNote)note
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_note);

  return (ICNote *)WeakRetained;
}

- (void)setNote:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

@end