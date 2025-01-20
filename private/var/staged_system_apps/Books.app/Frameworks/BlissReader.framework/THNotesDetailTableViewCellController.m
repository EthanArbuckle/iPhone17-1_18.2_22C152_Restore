@interface THNotesDetailTableViewCellController
- (CGRect)highlightTextFrame;
- (THAnnotation)annotation;
- (THNotesDetailTableViewCellController)initWithSizingDelegate:(id)a3;
- (THNotesDetailTableViewCellHighlightView)highlightView;
- (TSWButton)returnToBook;
- (UIImageView)divider;
- (UILabel)dateLabel;
- (UILabel)noteLabel;
- (UIView)highlightColorBar;
- (void)dealloc;
- (void)populateWithAnnotation:(id)a3 cellWidth:(double)a4 highlightLayer:(id)a5 highlightTextFrame:(CGRect)a6 editingHighlightLayer:(id)a7 pageNumberString:(id)a8 topAdjustment:(double)a9 showDivider:(BOOL)a10;
- (void)setAnnotation:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setDivider:(id)a3;
- (void)setHighlightColorBar:(id)a3;
- (void)setHighlightTextFrame:(CGRect)a3;
- (void)setHighlightView:(id)a3;
- (void)setNoteLabel:(id)a3;
- (void)setReturnToBook:(id)a3;
@end

@implementation THNotesDetailTableViewCellController

- (THNotesDetailTableViewCellController)initWithSizingDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THNotesDetailTableViewCellController;
  result = [(THNotesDetailTableViewCellController *)&v5 init];
  if (result) {
    result->mSizingDelegate = (THNotesDetailSizingDelegate *)a3;
  }
  return result;
}

- (void)dealloc
{
  self->mNoteLabel = 0;
  self->mReturnToBook = 0;

  self->mDateLabel = 0;
  self->mDivider = 0;

  self->mAnnotation = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNotesDetailTableViewCellController;
  [(THNotesDetailTableViewCellController *)&v3 dealloc];
}

- (void)populateWithAnnotation:(id)a3 cellWidth:(double)a4 highlightLayer:(id)a5 highlightTextFrame:(CGRect)a6 editingHighlightLayer:(id)a7 pageNumberString:(id)a8 topAdjustment:(double)a9 showDivider:(BOOL)a10
{
  BOOL v10 = a10;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  if (!qword_5732B0)
  {
    qword_5732B0 = (uint64_t)objc_alloc_init((Class)NSDateFormatter);
    [(id)qword_5732B0 setDateStyle:2];
    [(id)qword_5732B0 setTimeStyle:1];
    [(id)qword_5732B0 setDoesRelativeDateFormatting:1];
  }
  -[THNotesDetailTableViewCellController setAnnotation:](self, "setAnnotation:", a3, a4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a9);
  [(THNotesDetailTableViewCellHighlightView *)[(THNotesDetailTableViewCellController *)self highlightView] populateWithHighlgihtLayer:a5 editingHighlightLayer:a7];
  [(THNotesDetailTableViewCellHighlightView *)[(THNotesDetailTableViewCellController *)self highlightView] setTag:4];
  [(THNotesDetailTableViewCellHighlightView *)[(THNotesDetailTableViewCellController *)self highlightView] setBackgroundColor:+[UIColor bc_booksBackground]];
  [(THNotesDetailTableViewCellHighlightView *)[(THNotesDetailTableViewCellController *)self highlightView] frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [(THNotesDetailTableViewCellHighlightView *)[(THNotesDetailTableViewCellController *)self highlightView] intrinsicContentSize];
  CGFloat v27 = v26;
  -[THNotesDetailTableViewCellHighlightView setFrame:]([(THNotesDetailTableViewCellController *)self highlightView], "setFrame:", v21, v23, v25, v26);
  -[THNotesDetailTableViewCellController setHighlightTextFrame:](self, "setHighlightTextFrame:", x, y, width, height);
  id v28 = objc_msgSend(objc_msgSend(a3, "annotationNote"), "length");
  if (v28)
  {
    -[UILabel setText:](-[THNotesDetailTableViewCellController noteLabel](self, "noteLabel"), "setText:", [a3 annotationNote]);
    [(UILabel *)[(THNotesDetailTableViewCellController *)self noteLabel] setNumberOfLines:[(THNotesDetailSizingDelegate *)self->mSizingDelegate maxNoteLabelLines]];
    [(THNotesDetailSizingDelegate *)self->mSizingDelegate noteLabelHorizontalInset];
    double v30 = v29;
    v82.origin.double x = v21;
    v82.origin.double y = v23;
    v82.size.double width = v25;
    v82.size.double height = v27;
    double MaxY = CGRectGetMaxY(v82);
    [(THNotesDetailSizingDelegate *)self->mSizingDelegate marginAboveNote];
    double v33 = MaxY + v32;
    [(THNotesDetailSizingDelegate *)self->mSizingDelegate rightMargin];
    double v35 = a4 - v30 - v34;
    -[UILabel sizeThatFits:]([(THNotesDetailTableViewCellController *)self noteLabel], "sizeThatFits:", v35, 100000.0);
    double v37 = v36;
  }
  else
  {
    [(UILabel *)[(THNotesDetailTableViewCellController *)self noteLabel] frame];
    double v30 = v38;
    double v33 = v39;
    double v35 = v40;
    double v37 = 0.0;
  }
  -[UILabel setFrame:]([(THNotesDetailTableViewCellController *)self noteLabel], "setFrame:", v30, v33, v35, v37);
  [(UILabel *)[(THNotesDetailTableViewCellController *)self noteLabel] setTag:6];
  [(UILabel *)[(THNotesDetailTableViewCellController *)self noteLabel] setTextColor:+[UIColor bc_booksLabelColor]];
  -[UIView setBackgroundColor:](-[THNotesDetailTableViewCellController highlightColorBar](self, "highlightColorBar"), "setBackgroundColor:", objc_msgSend(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", objc_msgSend(a3, "annotationStyle"), 4, objc_msgSend(a3, "annotationIsUnderline")), "notesSidebarBarColor"));
  [(UIView *)[(THNotesDetailTableViewCellController *)self highlightColorBar] frame];
  double v42 = v41;
  double v44 = v43;
  [(THNotesDetailSizingDelegate *)self->mSizingDelegate colorBarHorizontalInset];
  double v46 = v45;
  v83.origin.double x = v21;
  v83.origin.double y = v23;
  v83.size.double width = v25;
  v83.size.double height = v27;
  double v47 = CGRectGetMaxY(v83);
  [(THNotesDetailSizingDelegate *)self->mSizingDelegate highlightColorBarDescent];
  -[UIView setFrame:]([(THNotesDetailTableViewCellController *)self highlightColorBar], "setFrame:", v46, v42, v44, v47 + v48 - v42);
  id v49 = [a3 annotationCreationDate];
  -[UILabel setText:](-[THNotesDetailTableViewCellController dateLabel](self, "dateLabel"), "setText:", [(id)qword_5732B0 stringFromDate:v49]);
  [(UILabel *)[(THNotesDetailTableViewCellController *)self dateLabel] sizeToFit];
  [(UILabel *)[(THNotesDetailTableViewCellController *)self dateLabel] setTag:7];
  [(UILabel *)[(THNotesDetailTableViewCellController *)self dateLabel] frame];
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  [(THNotesDetailSizingDelegate *)self->mSizingDelegate dateLabelHorizontalInset];
  -[UILabel setFrame:]([(THNotesDetailTableViewCellController *)self dateLabel], "setFrame:", v56, v51, v53, v55);
  if (!a8) {
    a8 = &stru_46D7E8;
  }
  [(TSWButton *)[(THNotesDetailTableViewCellController *)self returnToBook] setTitle:a8 forState:0];
  unsigned __int8 v57 = [(THAnnotation *)[(THNotesDetailTableViewCellController *)self annotation] annotationIsOrphan];
  v58 = [(THNotesDetailTableViewCellController *)self returnToBook];
  if (v57)
  {
    [(TSWButton *)v58 setEnabled:0];
    [(TSWButton *)[(THNotesDetailTableViewCellController *)self returnToBook] setAlpha:0.0];
  }
  else
  {
    [(TSWButton *)v58 setTag:5];
    [(TSWButton *)[(THNotesDetailTableViewCellController *)self returnToBook] frame];
    if (v59 + -32.0 >= 0.0) {
      double v60 = 0.0;
    }
    else {
      double v60 = (v59 + -32.0) * 0.5;
    }
    [(TSWButton *)[(THNotesDetailTableViewCellController *)self returnToBook] frame];
    -[TSWButton setHitRegionEdgeInsets:]([(THNotesDetailTableViewCellController *)self returnToBook], "setHitRegionEdgeInsets:", v60, fmin(v61 + -32.0, 0.0), v60, 0.0);
  }
  BOOL v62 = !v10;
  [(UIImageView *)[(THNotesDetailTableViewCellController *)self divider] setHidden:v62];
  if (!v62)
  {
    [(UIImageView *)[(THNotesDetailTableViewCellController *)self divider] setBackgroundColor:+[UIColor bc_booksSeparatorColor]];
    [(UIImageView *)[(THNotesDetailTableViewCellController *)self divider] frame];
    double v64 = v63;
    double v66 = v65;
    double v68 = v67;
    TSUScreenScale();
    -[UIImageView setFrame:]([(THNotesDetailTableViewCellController *)self divider], "setFrame:", v64, v66 - 1.0 / v69, v68, 1.0 / v69);
  }
  [(UIImageView *)[(THNotesDetailTableViewCellController *)self divider] setTag:3];
  [self view].frame;
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  if (v28) {
    v76 = [(THNotesDetailTableViewCellController *)self noteLabel];
  }
  else {
    v76 = [(THNotesDetailTableViewCellController *)self highlightView];
  }
  [(UILabel *)v76 frame];
  double v77 = CGRectGetMaxY(v84);
  [(THNotesDetailSizingDelegate *)self->mSizingDelegate marginAboveSeparator];
  [self view].frame = CGRectMake(v71, v73, v75, v77 + v78);
  id v79 = [(THNotesDetailTableViewCellController *)self view];

  [v79 setTag:9];
}

- (UILabel)noteLabel
{
  return self->mNoteLabel;
}

- (void)setNoteLabel:(id)a3
{
}

- (CGRect)highlightTextFrame
{
  double x = self->mHighlightTextFrame.origin.x;
  double y = self->mHighlightTextFrame.origin.y;
  double width = self->mHighlightTextFrame.size.width;
  double height = self->mHighlightTextFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHighlightTextFrame:(CGRect)a3
{
  self->mHighlightTextFrame = a3;
}

- (UILabel)dateLabel
{
  return self->mDateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (UIImageView)divider
{
  return self->mDivider;
}

- (void)setDivider:(id)a3
{
}

- (THAnnotation)annotation
{
  return self->mAnnotation;
}

- (void)setAnnotation:(id)a3
{
}

- (TSWButton)returnToBook
{
  return self->mReturnToBook;
}

- (void)setReturnToBook:(id)a3
{
}

- (UIView)highlightColorBar
{
  return self->_highlightColorBar;
}

- (void)setHighlightColorBar:(id)a3
{
}

- (THNotesDetailTableViewCellHighlightView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

@end