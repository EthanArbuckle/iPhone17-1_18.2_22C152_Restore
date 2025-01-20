@interface THNotesSidebarTableCell
- (BOOL)bottomBorderVisible;
- (BOOL)imageBorderVisible;
- (BOOL)needsMigration;
- (BOOL)topBorderVisible;
- (NSLayoutConstraint)bottomBorderWidthConstraint;
- (NSLayoutConstraint)imageBorderWidthConstraint;
- (NSLayoutConstraint)topBorderWidthConstraint;
- (THNotesSidebarTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (THNotesSidebarTableCellDelegate)delegate;
- (UIImageView)chapterThumb;
- (UILabel)chapterLabel;
- (UILabel)chapterName;
- (UILabel)countLabel;
- (UILabel)noResultsLabel;
- (UIView)bottomBorder;
- (UIView)imageBorder;
- (UIView)topBorder;
- (double)p_borderWidth;
- (unint64_t)annotationCount;
- (void)_updateCountLabel;
- (void)p_handleHighlightChange:(BOOL)a3;
- (void)prepareForReuse;
- (void)setAnnotationCount:(unint64_t)a3;
- (void)setBottomBorder:(id)a3;
- (void)setBottomBorderVisible:(BOOL)a3;
- (void)setBottomBorderWidthConstraint:(id)a3;
- (void)setChapterLabel:(id)a3;
- (void)setChapterName:(id)a3;
- (void)setChapterThumb:(id)a3;
- (void)setCountLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setImageBorder:(id)a3;
- (void)setImageBorderVisible:(BOOL)a3;
- (void)setImageBorderWidthConstraint:(id)a3;
- (void)setNeedsMigration:(BOOL)a3;
- (void)setNoResultsLabel:(id)a3;
- (void)setSectionProvider:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setTopBorder:(id)a3;
- (void)setTopBorderVisible:(BOOL)a3;
- (void)setTopBorderWidthConstraint:(id)a3;
@end

@implementation THNotesSidebarTableCell

- (THNotesSidebarTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)THNotesSidebarTableCell;
  v4 = [(THNotesSidebarTableCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(THNotesSidebarTableCell *)v4 p_borderWidth];
    double v7 = v6;
    v8 = [(THNotesSidebarTableCell *)v5 imageBorderWidthConstraint];
    [v8 setConstant:v7];

    v9 = [(THNotesSidebarTableCell *)v5 topBorderWidthConstraint];
    [v9 setConstant:v7];

    v10 = [(THNotesSidebarTableCell *)v5 bottomBorderWidthConstraint];
    [v10 setConstant:v7];

    [(THNotesSidebarTableCell *)v5 p_handleHighlightChange:0];
  }
  return v5;
}

- (void)setNeedsMigration:(BOOL)a3
{
  if (self->_needsMigration != a3)
  {
    self->_needsMigration = a3;
    [(THNotesSidebarTableCell *)self _updateCountLabel];
  }
}

- (void)setAnnotationCount:(unint64_t)a3
{
  if (self->_annotationCount != a3)
  {
    self->_annotationCount = a3;
    [(THNotesSidebarTableCell *)self _updateCountLabel];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)THNotesSidebarTableCell;
  [(THNotesSidebarTableCell *)&v3 prepareForReuse];
  [(THNotesSidebarTableCell *)self setDelegate:0];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v7 = [(THNotesSidebarTableCell *)self isSelected];
  v9.receiver = self;
  v9.super_class = (Class)THNotesSidebarTableCell;
  [(THNotesSidebarTableCell *)&v9 setSelected:v5 animated:v4];
  [(THNotesSidebarTableCell *)self p_handleHighlightChange:v5];
  if (v7 != v5)
  {
    v8 = [(THNotesSidebarTableCell *)self delegate];
    [v8 notesSidebarCell:self selectionDidChange:v5];
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unsigned int v7 = [(THNotesSidebarTableCell *)self isHighlighted];
  v9.receiver = self;
  v9.super_class = (Class)THNotesSidebarTableCell;
  [(THNotesSidebarTableCell *)&v9 setHighlighted:v5 animated:v4];
  [(THNotesSidebarTableCell *)self p_handleHighlightChange:v5];
  if (v7 != v5)
  {
    v8 = [(THNotesSidebarTableCell *)self delegate];
    [v8 notesSidebarCell:self highlightDidChange:v5];
  }
}

- (void)setSectionProvider:(id)a3
{
  id v13 = a3;
  -[THNotesSidebarTableCell setAnnotationCount:](self, "setAnnotationCount:", [v13 annotationCount]);
  -[THNotesSidebarTableCell setNeedsMigration:](self, "setNeedsMigration:", [v13 needsMigration]);
  BOOL v4 = [v13 subtitle];

  if (v4)
  {
    BOOL v5 = [v13 subtitle];
    double v6 = [(THNotesSidebarTableCell *)self chapterLabel];
    [v6 setText:v5];
  }
  else
  {
    BOOL v5 = [(THNotesSidebarTableCell *)self chapterLabel];
    [v5 setText:&stru_46D7E8];
  }

  unsigned int v7 = [v13 title];
  v8 = [(THNotesSidebarTableCell *)self chapterName];
  [v8 setText:v7];

  objc_super v9 = [v13 image];

  v10 = [(THNotesSidebarTableCell *)self chapterThumb];
  v11 = v10;
  if (v9)
  {
    [v10 setHidden:0];

    v11 = [v13 image];
    objc_super v12 = [(THNotesSidebarTableCell *)self chapterThumb];
    [v12 setImage:v11];
  }
  else
  {
    [v10 setHidden:1];
  }
}

- (void)p_handleHighlightChange:(BOOL)a3
{
  BOOL v4 = +[UIColor bc_booksSecondaryLabelColor];
  BOOL v5 = [(THNotesSidebarTableCell *)self countLabel];
  [v5 setTextColor:v4];

  double v6 = +[UIColor bc_booksSecondaryLabelColor];
  unsigned int v7 = [(THNotesSidebarTableCell *)self chapterLabel];
  [v7 setTextColor:v6];

  v8 = +[UIColor bc_booksLabelColor];
  objc_super v9 = [(THNotesSidebarTableCell *)self chapterName];
  [v9 setTextColor:v8];

  v10 = +[UIColor bc_booksSeparatorColor];
  v11 = [(THNotesSidebarTableCell *)self topBorder];
  [v11 setBackgroundColor:v10];

  objc_super v12 = +[UIColor bc_booksSeparatorColor];
  id v13 = [(THNotesSidebarTableCell *)self bottomBorder];
  [v13 setBackgroundColor:v12];

  id v15 = +[UIColor bc_booksSeparatorColor];
  v14 = [(THNotesSidebarTableCell *)self imageBorder];
  [v14 setBackgroundColor:v15];
}

- (double)p_borderWidth
{
  TSUScreenScale();
  return 1.0 / v2;
}

- (BOOL)topBorderVisible
{
  double v2 = [(THNotesSidebarTableCell *)self topBorderWidthConstraint];
  [v2 constant];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)setTopBorderVisible:(BOOL)a3
{
  double v4 = 0.0;
  if (a3)
  {
    [(THNotesSidebarTableCell *)self p_borderWidth];
    double v4 = v5;
  }
  id v6 = [(THNotesSidebarTableCell *)self topBorderWidthConstraint];
  [v6 setConstant:v4];
}

- (BOOL)bottomBorderVisible
{
  double v2 = [(THNotesSidebarTableCell *)self bottomBorderWidthConstraint];
  [v2 constant];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)setBottomBorderVisible:(BOOL)a3
{
  double v4 = 0.0;
  if (a3)
  {
    [(THNotesSidebarTableCell *)self p_borderWidth];
    double v4 = v5;
  }
  id v6 = [(THNotesSidebarTableCell *)self bottomBorderWidthConstraint];
  [v6 setConstant:v4];
}

- (BOOL)imageBorderVisible
{
  double v2 = [(THNotesSidebarTableCell *)self imageBorderWidthConstraint];
  [v2 constant];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)setImageBorderVisible:(BOOL)a3
{
  double v4 = 0.0;
  if (a3)
  {
    [(THNotesSidebarTableCell *)self p_borderWidth];
    double v4 = v5;
  }
  id v6 = [(THNotesSidebarTableCell *)self imageBorderWidthConstraint];
  [v6 setConstant:v4];
}

- (void)_updateCountLabel
{
  if (![(THNotesSidebarTableCell *)self annotationCount])
  {
    CFStringRef v3 = &stru_46D7E8;
    goto LABEL_5;
  }
  if ([(THNotesSidebarTableCell *)self needsMigration])
  {
    CFStringRef v3 = +[NSString stringWithUTF8String:"…"];
LABEL_5:
    id v6 = (id)v3;
    goto LABEL_7;
  }
  double v4 = +[NSNumber numberWithUnsignedInteger:[(THNotesSidebarTableCell *)self annotationCount]];
  id v6 = +[NSNumberFormatter localizedStringFromNumber:v4 numberStyle:1];

LABEL_7:
  double v5 = [(THNotesSidebarTableCell *)self countLabel];
  [v5 setText:v6];
}

- (THNotesSidebarTableCellDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THNotesSidebarTableCellDelegate *)a3;
}

- (UILabel)noResultsLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noResultsLabel);

  return (UILabel *)WeakRetained;
}

- (void)setNoResultsLabel:(id)a3
{
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
}

- (UIImageView)chapterThumb
{
  return self->_chapterThumb;
}

- (void)setChapterThumb:(id)a3
{
}

- (UILabel)chapterLabel
{
  return self->_chapterLabel;
}

- (void)setChapterLabel:(id)a3
{
}

- (UILabel)chapterName
{
  return self->_chapterName;
}

- (void)setChapterName:(id)a3
{
}

- (UIView)topBorder
{
  return self->_topBorder;
}

- (void)setTopBorder:(id)a3
{
}

- (UIView)bottomBorder
{
  return self->_bottomBorder;
}

- (void)setBottomBorder:(id)a3
{
}

- (UIView)imageBorder
{
  return self->_imageBorder;
}

- (void)setImageBorder:(id)a3
{
}

- (unint64_t)annotationCount
{
  return self->_annotationCount;
}

- (BOOL)needsMigration
{
  return self->_needsMigration;
}

- (NSLayoutConstraint)imageBorderWidthConstraint
{
  return self->_imageBorderWidthConstraint;
}

- (void)setImageBorderWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)topBorderWidthConstraint
{
  return self->_topBorderWidthConstraint;
}

- (void)setTopBorderWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomBorderWidthConstraint
{
  return self->_bottomBorderWidthConstraint;
}

- (void)setBottomBorderWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomBorderWidthConstraint, 0);
  objc_storeStrong((id *)&self->_topBorderWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageBorderWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageBorder, 0);
  objc_storeStrong((id *)&self->_bottomBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_chapterName, 0);
  objc_storeStrong((id *)&self->_chapterLabel, 0);
  objc_storeStrong((id *)&self->_chapterThumb, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);

  objc_destroyWeak((id *)&self->_noResultsLabel);
}

@end