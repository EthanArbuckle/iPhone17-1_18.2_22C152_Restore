@interface THNotesNoSearchResultsViewController
- (BOOL)p_shouldShowNoteIcon;
- (CGSize)sizeForContainerView:(id)a3;
- (THNotesNoSearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)firstLaunchView;
- (UIView)noResultsView;
- (double)p_getConstraint:(id)a3 onView:(id)a4;
- (id)p_findConstraint:(id)a3 onView:(id)a4;
- (int)footerType;
- (int)messageType;
- (unint64_t)chapterIndex;
- (unint64_t)results;
- (void)dealloc;
- (void)p_prepForFirstLaunchViewLayout;
- (void)p_releaseOutlets;
- (void)p_setConstraint:(id)a3 onView:(id)a4 toValue:(double)a5;
- (void)p_updateNoteIconVisibility;
- (void)setChapterIndex:(unint64_t)a3;
- (void)setFooterType:(int)a3;
- (void)setMessageType:(int)a3;
- (void)setResults:(unint64_t)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation THNotesNoSearchResultsViewController

- (THNotesNoSearchResultsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6 = THBundle();
  v8.receiver = self;
  v8.super_class = (Class)THNotesNoSearchResultsViewController;
  return [(THNotesNoSearchResultsViewController *)&v8 initWithNibName:a3 bundle:v6];
}

- (void)p_releaseOutlets
{
  self->mNoResultsView = 0;
  self->mNoResultsViewHeader = 0;

  self->mPercentFoundLabel = 0;
  self->mFirstLaunchView = 0;

  self->mFirstLaunchViewHeader = 0;
  self->mStepOneLabel = 0;

  self->mStepTwoLabel = 0;
  self->mStepThreeLabel = 0;

  self->mFooterLabel = 0;
  self->mNoteIcon = 0;

  self->mInlineNoteIcon = 0;
  self->mInstructionsView = 0;
}

- (void)dealloc
{
  [(THNotesNoSearchResultsViewController *)self p_releaseOutlets];
  v3.receiver = self;
  v3.super_class = (Class)THNotesNoSearchResultsViewController;
  [(THNotesNoSearchResultsViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)THNotesNoSearchResultsViewController;
  [(THNotesNoSearchResultsViewController *)&v25 viewDidLoad];
  [(THNotesNoSearchResultContainerView *)self->mNoResultsView setSizeProvider:self];
  [(THNotesNoSearchResultContainerView *)self->mFirstLaunchView setSizeProvider:self];
  [(THNotesNoSearchResultContainerView *)self->mInstructionsView setSizeProvider:self];
  [self view].bounds;
  [(UILabel *)self->mFirstLaunchViewHeader bounds];
  [(UILabel *)self->mFirstLaunchViewHeader setBounds:0.0];
  [(THNotesNoSearchResultsViewController *)self setChapterIndex:self->mChapterIndex];
  [(THNotesNoSearchResultsViewController *)self setResults:self->mResults];
  [(THNotesNoSearchResultsViewController *)self setFooterType:self->mFooterType];
  -[UILabel setText:](self->mStepOneLabel, "setText:", [(id)THBundle() localizedStringForKey:@"1. Tap and hold a word. Start dragging your finger to highlight text." value:&stru_46D7E8 table:0]);
  -[UILabel setText:](self->mStepTwoLabel, "setText:", [(id)THBundle() localizedStringForKey:@"2. You can extend your highlight to include an entire passage." value:&stru_46D7E8 table:0]);
  -[UILabel setText:](self->mStepThreeLabel, "setText:", [(id)THBundle() localizedStringForKey:@"3. To add a note, tap the highlight and select the Note icon.", &stru_46D7E8, 0 value table]);
  [(-[THNotesNoSearchResultsViewController view](self, "view")) setBackgroundColor:+[UIColor bc_booksBackground](UIColor, "bc_booksBackground")];
  mFirstLaunchView = self->mFirstLaunchView;
  v29[0] = self->mNoResultsView;
  v29[1] = mFirstLaunchView;
  v29[2] = self->mInstructionsView;
  v4 = +[NSArray arrayWithObjects:v29 count:3];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * i) setBackgroundColor:[UIColor bc_booksBackground]];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v6);
  }
  mPercentFoundLabel = self->mPercentFoundLabel;
  v27[0] = self->mNoResultsViewHeader;
  v27[1] = mPercentFoundLabel;
  mStepOneLabel = self->mStepOneLabel;
  v27[2] = self->mFirstLaunchViewHeader;
  v27[3] = mStepOneLabel;
  mStepThreeLabel = self->mStepThreeLabel;
  v27[4] = self->mStepTwoLabel;
  v27[5] = mStepThreeLabel;
  v27[6] = self->mFooterLabel;
  v12 = +[NSArray arrayWithObjects:v27 count:7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)j) setTextColor:[UIColor bc_booksSecondaryLabelColor]];
      }
      id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }
    while (v14);
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)THNotesNoSearchResultsViewController;
  [(THNotesNoSearchResultsViewController *)&v3 viewWillLayoutSubviews];
  [(THNotesNoSearchResultsViewController *)self p_prepForFirstLaunchViewLayout];
}

- (BOOL)p_shouldShowNoteIcon
{
  [self view].bounds
  return v2 > 524.0;
}

- (void)p_updateNoteIconVisibility
{
  unsigned int v3 = [(THNotesNoSearchResultsViewController *)self p_shouldShowNoteIcon];
  [(UIImageView *)self->mNoteIcon setHidden:v3 ^ 1];
  mFirstLaunchViewHeader = self->mFirstLaunchViewHeader;
  double v5 = 158.0;
  if (!v3) {
    double v5 = 0.0;
  }

  [(THNotesNoSearchResultsViewController *)self p_setConstraint:@"FirstLaunchViewHeaderVerticalSpace" onView:mFirstLaunchViewHeader toValue:v5];
}

- (id)p_findConstraint:(id)a3 onView:(id)a4
{
  if (!a4) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [a4 constraints];
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
      if (objc_msgSend(objc_msgSend(v12, "identifier"), "isEqualToString:", a3)) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_4;
        }
        return -[THNotesNoSearchResultsViewController p_findConstraint:onView:](self, "p_findConstraint:onView:", a3, [a4 superview]);
      }
    }
    if (v12) {
      return v12;
    }
  }
  return -[THNotesNoSearchResultsViewController p_findConstraint:onView:](self, "p_findConstraint:onView:", a3, [a4 superview]);
}

- (void)p_setConstraint:(id)a3 onView:(id)a4 toValue:(double)a5
{
  id v7 = [(THNotesNoSearchResultsViewController *)self p_findConstraint:a3 onView:a4];
  if (!v7) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesNoSearchResultsViewController p_setConstraint:onView:toValue:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesNoSearchResultsViewController.m") lineNumber:224 description:@"Constraint not found: %@", a3];
  }

  [v7 setConstant:a5];
}

- (double)p_getConstraint:(id)a3 onView:(id)a4
{
  id v5 = [(THNotesNoSearchResultsViewController *)self p_findConstraint:a3 onView:a4];
  if (!v5) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesNoSearchResultsViewController p_getConstraint:onView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesNoSearchResultsViewController.m") lineNumber:231 description:@"Constraint not found: %@", a3];
  }

  [v5 constant];
  return result;
}

- (void)p_prepForFirstLaunchViewLayout
{
  [self view].bounds;
  CGFloat v3 = CGRectGetWidth(v12) + -20.0;
  [[(UIImageView *)self->mInlineNoteIcon image] size];
  double v5 = v4 + 0.0;
  [(UILabel *)self->mStepOneLabel setPreferredMaxLayoutWidth:v3];
  [(UILabel *)self->mStepTwoLabel setPreferredMaxLayoutWidth:v3];
  [(UILabel *)self->mStepThreeLabel setPreferredMaxLayoutWidth:v3 - v5];
  [(UILabel *)self->mStepOneLabel intrinsicContentSize];
  double v7 = v6;
  self->mInstructionsViewWidth = v6;
  [(UILabel *)self->mStepTwoLabel intrinsicContentSize];
  if (v7 < v8) {
    double v7 = v8;
  }
  self->mInstructionsViewWidth = v7;
  [(UILabel *)self->mStepThreeLabel intrinsicContentSize];
  double v10 = v5 + v9;
  if (v7 >= v10) {
    double v10 = v7;
  }
  self->mInstructionsViewWidth = v10;
  [(UILabel *)self->mStepOneLabel setPreferredMaxLayoutWidth:"setPreferredMaxLayoutWidth:"];
  [(UILabel *)self->mStepTwoLabel setPreferredMaxLayoutWidth:self->mInstructionsViewWidth];
  [(UILabel *)self->mStepThreeLabel setPreferredMaxLayoutWidth:self->mInstructionsViewWidth - v5];
  [(THNotesNoSearchResultContainerView *)self->mInstructionsView invalidateIntrinsicContentSize];
  [(THNotesNoSearchResultContainerView *)self->mFirstLaunchView invalidateIntrinsicContentSize];

  [(THNotesNoSearchResultsViewController *)self p_updateNoteIconVisibility];
}

- (void)setChapterIndex:(unint64_t)a3
{
  self->mChapterIndex = a3;
  int mMessageType = self->mMessageType;
  double v5 = (void *)THBundle();
  if (mMessageType == 1) {
    CFStringRef v6 = @"No Highlights or Notes in this Chapter";
  }
  else {
    CFStringRef v6 = @"No Results";
  }
  id v7 = [v5 localizedStringForKey:v6 value:&stru_46D7E8 table:0];
  mNoResultsViewHeader = self->mNoResultsViewHeader;

  [(UILabel *)mNoResultsViewHeader setText:v7];
}

- (void)setResults:(unint64_t)a3
{
  self->mResults = a3;
  int mMessageType = self->mMessageType;
  mPercentFoundLabel = self->mPercentFoundLabel;
  if (mMessageType == 1)
  {
    [(UILabel *)mPercentFoundLabel setHidden:1];
    return;
  }
  [(UILabel *)mPercentFoundLabel setHidden:0];
  if (a3)
  {
    if (self->mResults != 1)
    {
      double v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"%lu results found total" value:&stru_46D7E8 table:0], self->mResults);
      goto LABEL_11;
    }
    id v7 = (void *)THBundle();
    CFStringRef v8 = @"1 result found total";
  }
  else
  {
    id v7 = (void *)THBundle();
    CFStringRef v8 = @"No results found total";
  }
  double v9 = (NSString *)[v7 localizedStringForKey:v8 value:&stru_46D7E8 table:0];
LABEL_11:
  double v10 = v9;
  uint64_t v11 = self->mPercentFoundLabel;

  [(UILabel *)v11 setText:v10];
}

- (void)setFooterType:(int)a3
{
  self->mFooterType = a3;
  if (a3 == 1)
  {
    mFooterLabel = self->mFooterLabel;
    -[UILabel setHidden:](mFooterLabel, "setHidden:");
  }
  else if (a3)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THNotesNoSearchResultsViewController setFooterType:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesNoSearchResultsViewController.m"] lineNumber:308 description:[NSString stringWithFormat:@"Unknown No Results footer type: %d", a3]];
  }
  else
  {
    [(UILabel *)self->mFooterLabel setHidden:0];
    id v4 = [(id)THBundle() localizedStringForKey:@"Tap the Study Cards button to view this chapter’s glossary terms." value:&stru_46D7E8 table:0];
    double v5 = self->mFooterLabel;
    [(UILabel *)v5 setText:v4];
  }
}

- (void)setMessageType:(int)a3
{
  self->int mMessageType = a3;
  if (a3 >= 2) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THNotesNoSearchResultsViewController setMessageType:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesNoSearchResultsViewController.m"] lineNumber:322 description:[NSString stringWithFormat:@"Unknown No Results message type: %d", a3];
  }
}

- (CGSize)sizeForContainerView:(id)a3
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = [a3 subviews];
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v29;
    double v9 = 0.0;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v10);
        CGRect v12 = (char *)[v11 tag];
        if ((unint64_t)(v12 - 3) < 7
          || v12 == (unsigned char *)&dword_0 + 1
          && [(THNotesNoSearchResultsViewController *)self p_shouldShowNoteIcon])
        {
          [v11 intrinsicContentSize];
          double v9 = v9 + v13;
        }
        double v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v14 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
      id v7 = v14;
    }
    while (v14);
  }
  else
  {
    double v9 = 0.0;
  }
  CGFloat mInstructionsViewWidth = UIViewNoIntrinsicMetric;
  if (self->mNoResultsView == a3)
  {
    [(THNotesNoSearchResultsViewController *)self p_getConstraint:@"NoResultsViewHeaderVerticalSpace" onView:self->mNoResultsViewHeader];
    double v9 = v9 + v21;
    CFStringRef v19 = @"NoResultsViewPercentFoundVerticalSpace";
    long long v20 = &OBJC_IVAR___THNotesNoSearchResultsViewController_mPercentFoundLabel;
    goto LABEL_24;
  }
  if (self->mFirstLaunchView == a3)
  {
    if ([(THNotesNoSearchResultsViewController *)self p_shouldShowNoteIcon])
    {
      [(THNotesNoSearchResultsViewController *)self p_getConstraint:@"FirstLaunchViewHeaderVerticalSpace" onView:self->mFirstLaunchViewHeader];
      double v23 = v22;
      [[(UIImageView *)self->mNoteIcon image] size];
      double v9 = v9 + v23 - v24;
    }
    CFStringRef v19 = @"FirstLaunchViewInstructionsViewVerticalSpace";
    long long v20 = &OBJC_IVAR___THNotesNoSearchResultsViewController_mInstructionsView;
    goto LABEL_24;
  }
  if (self->mInstructionsView == a3)
  {
    CGFloat mInstructionsViewWidth = self->mInstructionsViewWidth;
    [(THNotesNoSearchResultsViewController *)self p_getConstraint:@"FirstLaunchViewStepOneVerticalSpace" onView:self->mStepOneLabel];
    double v17 = v9 + v16;
    [(THNotesNoSearchResultsViewController *)self p_getConstraint:@"FirstLaunchViewStepTwoVerticalSpace" onView:self->mStepTwoLabel];
    double v9 = v17 + v18;
    CFStringRef v19 = @"FirstLaunchViewStepThreeVerticalSpace";
    long long v20 = &OBJC_IVAR___THNotesNoSearchResultsViewController_mStepThreeLabel;
LABEL_24:
    [(THNotesNoSearchResultsViewController *)self p_getConstraint:v19 onView:*(Class *)((char *)&self->super.super.super.isa + *v20)];
    double v9 = v9 + v25;
  }
  double v26 = mInstructionsViewWidth;
  double v27 = v9;
  result.height = v27;
  result.width = v26;
  return result;
}

- (UIView)noResultsView
{
  return &self->mNoResultsView->super;
}

- (UIView)firstLaunchView
{
  return &self->mFirstLaunchView->super;
}

- (unint64_t)chapterIndex
{
  return self->mChapterIndex;
}

- (unint64_t)results
{
  return self->mResults;
}

- (int)footerType
{
  return self->mFooterType;
}

- (int)messageType
{
  return self->mMessageType;
}

@end