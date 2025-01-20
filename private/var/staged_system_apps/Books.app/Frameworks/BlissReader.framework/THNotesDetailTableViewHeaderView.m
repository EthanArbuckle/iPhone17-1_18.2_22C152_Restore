@interface THNotesDetailTableViewHeaderView
- (BOOL)editing;
- (BOOL)selected;
- (CGSize)editControlImageSize;
- (THNotesDetailTableViewHeaderView)initWithReuseIdentifier:(id)a3;
- (THNotesDetailTableViewHeaderViewDelegate)delegate;
- (UIButton)selectionButton;
- (UIImageView)editControlImage;
- (UILabel)chapterLabel;
- (UILabel)sectionLabel;
- (UIView)cellContentView;
- (UIView)cellView;
- (UIView)editControlView;
- (UIView)separator;
- (id)backgroundView;
- (unint64_t)section;
- (void)addChapterLabel:(id)a3;
- (void)addSectionLabel:(id)a3;
- (void)dealloc;
- (void)headerCellPressed:(id)a3;
- (void)p_positionViewsForEditing:(BOOL)a3;
- (void)prepareForReuse;
- (void)setCellView:(id)a3;
- (void)setChapterLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditControlImage:(id)a3;
- (void)setEditControlImageSize:(CGSize)a3;
- (void)setEditControlView:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFrame:(CGRect)a3;
- (void)setSection:(unint64_t)a3;
- (void)setSectionLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionButton:(id)a3;
- (void)setSeparator:(id)a3;
@end

@implementation THNotesDetailTableViewHeaderView

- (THNotesDetailTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)THNotesDetailTableViewHeaderView;
  v3 = [(THNotesDetailTableViewHeaderView *)&v8 initWithReuseIdentifier:a3];
  if (v3)
  {
    v3->_cellView = (UIView *)objc_alloc_init((Class)UIView);
    [v3->_cellView addSubview:[v3 contentView]];
    v3->_editControlView = (UIView *)objc_alloc_init((Class)UIView);
    [v3->_editControlView addSubview:[v3 contentView]];
    v3->_editControlImage = [objc_alloc((Class)UIImageView) initWithImage:+[UIImage th_imageNamed:@"notes-detail-header-edit-N"] highlightedImage:+[UIImage th_imageNamed:@"notes-detail-header-edit-A"].imageWithRenderingMode:2];
    [(UIImageView *)v3->_editControlImage setTintColor:+[UIColor bc_booksBlue]];
    [(UIImageView *)v3->_editControlImage setContentMode:4];
    [(UIView *)v3->_editControlView addSubview:v3->_editControlImage];
    [[(UIImageView *)v3->_editControlImage image] size];
    v3->_editControlImageSize.width = v4;
    v3->_editControlImageSize.height = v5;
    v3->_separator = (UIView *)objc_alloc_init((Class)UIView);
    [(UIView *)v3->_separator setBackgroundColor:+[UIColor bc_booksSeparatorColor]];
    [v3->contentView addSubview:v3->_separator];
    v6 = (UIButton *)objc_alloc_init((Class)UIButton);
    v3->_selectionButton = v6;
    [(UIButton *)v6 addTarget:v3 action:"headerCellPressed:" forControlEvents:64];
    [v3->_contentView addSubview:v3->_selectionButton];
    [v3 contentView].backgroundColor = +[UIColor bc_booksBackground];
    [v3 backgroundView].backgroundColor = [UIColor bc_booksBackground];
  }
  return v3;
}

- (void)prepareForReuse
{
  v12.receiver = self;
  v12.super_class = (Class)THNotesDetailTableViewHeaderView;
  [(THNotesDetailTableViewHeaderView *)&v12 prepareForReuse];
  self->_editing = 0;
  self->_selected = 0;
  self->_section = 0x7FFFFFFFFFFFFFFFLL;
  [(UIImageView *)self->_editControlImage setHighlighted:0];
  id v3 = [(NSArray *)[(UIView *)[(THNotesDetailTableViewHeaderView *)self cellView] subviews] copy];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) removeFromSuperview];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)dealloc
{
  self->_cellView = 0;
  self->_editControlView = 0;

  self->_editControlImage = 0;
  self->_separator = 0;

  self->_selectionButton = 0;
  self->_chapterLabel = 0;

  self->_sectionLabel = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNotesDetailTableViewHeaderView;
  [(THNotesDetailTableViewHeaderView *)&v3 dealloc];
}

- (id)backgroundView
{
  v6.receiver = self;
  v6.super_class = (Class)THNotesDetailTableViewHeaderView;
  id v3 = [(THNotesDetailTableViewHeaderView *)&v6 backgroundView];
  if (!v3
    || (NSClassFromString(@"_UITableViewHeaderFooterViewBackground"), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = objc_alloc((Class)UIView);
    [v3 frame];
    id v3 = [v4 initWithFrame:];
    [(THNotesDetailTableViewHeaderView *)self setBackgroundView:v3];
  }
  return v3;
}

- (void)addChapterLabel:(id)a3
{
  [(UILabel *)[(THNotesDetailTableViewHeaderView *)self chapterLabel] removeFromSuperview];
  [(THNotesDetailTableViewHeaderView *)self setChapterLabel:a3];
  if (a3)
  {
    cellView = self->_cellView;
    [(UIView *)cellView addSubview:a3];
  }
}

- (void)addSectionLabel:(id)a3
{
  [(UILabel *)[(THNotesDetailTableViewHeaderView *)self sectionLabel] removeFromSuperview];
  [(THNotesDetailTableViewHeaderView *)self setSectionLabel:a3];
  if (a3)
  {
    cellView = self->_cellView;
    [(UIView *)cellView addSubview:a3];
  }
}

- (void)p_positionViewsForEditing:(BOOL)a3
{
  [(THNotesDetailTableViewHeaderView *)self bounds];
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  if (a3)
  {
    if (+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(THNotesDetailTableViewHeaderView *)self semanticContentAttribute]] == UIUserInterfaceLayoutDirectionLeftToRight)double v9 = 35.0; {
    double v13 = v11 + -50.0;
    }
    -[UIView setFrame:](self->_cellView, "setFrame:", v9, v10, v13, v12);
    double v14 = 0.0;
    double v15 = 1.0;
  }
  else
  {
    double v13 = v7 + -15.0;
    -[UIView setFrame:](self->_cellView, "setFrame:", v5, v6, v7 + -15.0, v8);
    double v14 = -55.0;
    double v15 = 0.0;
  }
  -[UIView setFrame:](self->_editControlView, "setFrame:", v14, 0.0, 35.0, v12);
  [(UIImageView *)self->_editControlImage setAlpha:v15];
  -[UIImageView setFrame:](self->_editControlImage, "setFrame:", 15.0, 0.0, self->_editControlImageSize.width, v12);
  v29.origin.x = v9;
  v29.origin.y = v10;
  v29.size.width = v13;
  v29.size.height = v12;
  double Width = CGRectGetWidth(v29);
  if ([(THNotesDetailTableViewHeaderView *)self chapterLabel])
  {
    [(UILabel *)[(THNotesDetailTableViewHeaderView *)self chapterLabel] frame];
    -[UILabel setFrame:]([(THNotesDetailTableViewHeaderView *)self chapterLabel], "setFrame:", v17, v18, Width - v17, v19);
  }
  if ([(THNotesDetailTableViewHeaderView *)self sectionLabel])
  {
    [(UILabel *)[(THNotesDetailTableViewHeaderView *)self sectionLabel] frame];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v26 = Width - v20;
    v27 = [(THNotesDetailTableViewHeaderView *)self sectionLabel];
    -[UILabel setFrame:](v27, "setFrame:", v21, v23, v26, v25);
  }
}

- (void)setFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)THNotesDetailTableViewHeaderView;
  -[THNotesDetailTableViewHeaderView setFrame:](&v13, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(THNotesDetailTableViewHeaderView *)self p_positionViewsForEditing:self->_editing];
  [(THNotesDetailTableViewHeaderView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  TSUScreenScale();
  -[UIView setFrame:](self->_separator, "setFrame:", 0.0, v11 - 1.0 / v12, v9);
  -[UIButton setFrame:](self->_selectionButton, "setFrame:", v5, v7, v9, v11);
}

- (void)setEditing:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (a4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_8FA4;
      v5[3] = &unk_456DE0;
      v5[4] = self;
      +[UIView animateWithDuration:v5 animations:0.3];
    }
    else
    {
      -[THNotesDetailTableViewHeaderView p_positionViewsForEditing:](self, "p_positionViewsForEditing:");
    }
    [(THNotesDetailTableViewHeaderView *)self setSelected:0];
    [(THNotesDetailTableViewHeaderView *)self setNeedsLayout];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    -[UIImageView setHighlighted:](self->_editControlImage, "setHighlighted:");
  }
}

- (UIView)cellContentView
{
  return self->_cellView;
}

- (void)headerCellPressed:(id)a3
{
}

- (BOOL)editing
{
  return self->_editing;
}

- (BOOL)selected
{
  return self->_selected;
}

- (unint64_t)section
{
  return self->_section;
}

- (void)setSection:(unint64_t)a3
{
  self->_section = a3;
}

- (THNotesDetailTableViewHeaderViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THNotesDetailTableViewHeaderViewDelegate *)a3;
}

- (UIView)cellView
{
  return self->_cellView;
}

- (void)setCellView:(id)a3
{
}

- (UIView)editControlView
{
  return self->_editControlView;
}

- (void)setEditControlView:(id)a3
{
}

- (UIImageView)editControlImage
{
  return self->_editControlImage;
}

- (void)setEditControlImage:(id)a3
{
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (UIButton)selectionButton
{
  return self->_selectionButton;
}

- (void)setSelectionButton:(id)a3
{
}

- (CGSize)editControlImageSize
{
  double width = self->_editControlImageSize.width;
  double height = self->_editControlImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEditControlImageSize:(CGSize)a3
{
  self->_editControlImageSize = a3;
}

- (UILabel)chapterLabel
{
  return self->_chapterLabel;
}

- (void)setChapterLabel:(id)a3
{
}

- (UILabel)sectionLabel
{
  return self->_sectionLabel;
}

- (void)setSectionLabel:(id)a3
{
}

@end