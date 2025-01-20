@interface SearchUICommandEnvironment
- (BOOL)shouldUseInsetRoundedSections;
- (BOOL)shouldUseStandardSectionInsets;
- (BOOL)threeDTouchEnabled;
- (NSString)searchString;
- (NSString)sectionTitle;
- (SFResultSection)section;
- (SearchUICardViewDelegate)cardViewDelegate;
- (SearchUICommandDelegate)commandDelegate;
- (SearchUICommandEnvironment)init;
- (SearchUIFeedbackDelegate)feedbackDelegate;
- (SearchUIResultsViewDelegate)resultsViewDelegate;
- (SearchUIRowModelViewDelegate)rowModelViewDelegate;
- (SearchUISectionModel)lastEngagedSection;
- (SearchUIWatchListDelegate)watchListDelegate;
- (UIView)sourceView;
- (UIViewController)presentingViewController;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)modifierFlags;
- (int64_t)selectableGridPunchoutIndex;
- (unint64_t)queryId;
- (void)setCardViewDelegate:(id)a3;
- (void)setCommandDelegate:(id)a3;
- (void)setFeedbackDelegate:(id)a3;
- (void)setLastEngagedSection:(id)a3;
- (void)setModifierFlags:(int64_t)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setQueryId:(unint64_t)a3;
- (void)setResultsViewDelegate:(id)a3;
- (void)setRowModelViewDelegate:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSection:(id)a3;
- (void)setSectionTitle:(id)a3;
- (void)setSelectableGridPunchoutIndex:(int64_t)a3;
- (void)setShouldUseInsetRoundedSections:(BOOL)a3;
- (void)setShouldUseStandardSectionInsets:(BOOL)a3;
- (void)setSourceView:(id)a3;
- (void)setThreeDTouchEnabled:(BOOL)a3;
- (void)setWatchListDelegate:(id)a3;
@end

@implementation SearchUICommandEnvironment

- (void)setSelectableGridPunchoutIndex:(int64_t)a3
{
  self->_selectableGridPunchoutIndex = a3;
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  self->_threeDTouchEnabled = a3;
}

- (void)setShouldUseStandardSectionInsets:(BOOL)a3
{
  self->_shouldUseStandardSectionInsets = a3;
}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  self->_shouldUseInsetRoundedSections = a3;
}

- (void)setRowModelViewDelegate:(id)a3
{
}

- (void)setResultsViewDelegate:(id)a3
{
}

- (void)setPresentingViewController:(id)a3
{
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (void)setCommandDelegate:(id)a3
{
}

- (void)setCardViewDelegate:(id)a3
{
}

- (SearchUICommandEnvironment)init
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUICommandEnvironment;
  v2 = [(SearchUICommandEnvironment *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SearchUICommandEnvironment *)v2 setSelectableGridPunchoutIndex:-1];
  }
  return v3;
}

- (void)setSearchString:(id)a3
{
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastEngagedSection);
  objc_destroyWeak((id *)&self->_resultsViewDelegate);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_destroyWeak((id *)&self->_watchListDelegate);
  objc_destroyWeak((id *)&self->_cardViewDelegate);
  objc_destroyWeak((id *)&self->_rowModelViewDelegate);
  objc_destroyWeak((id *)&self->_commandDelegate);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v4 = objc_opt_new();
  objc_super v5 = [(SearchUICommandEnvironment *)self feedbackDelegate];
  [v4 setFeedbackDelegate:v5];

  v6 = [(SearchUICommandEnvironment *)self commandDelegate];
  [v4 setCommandDelegate:v6];

  v7 = [(SearchUICommandEnvironment *)self cardViewDelegate];
  [v4 setCardViewDelegate:v7];

  v8 = [(SearchUICommandEnvironment *)self watchListDelegate];
  [v4 setWatchListDelegate:v8];

  objc_msgSend(v4, "setShouldUseInsetRoundedSections:", -[SearchUICommandEnvironment shouldUseInsetRoundedSections](self, "shouldUseInsetRoundedSections"));
  objc_msgSend(v4, "setShouldUseStandardSectionInsets:", -[SearchUICommandEnvironment shouldUseStandardSectionInsets](self, "shouldUseStandardSectionInsets"));
  objc_msgSend(v4, "setThreeDTouchEnabled:", -[SearchUICommandEnvironment threeDTouchEnabled](self, "threeDTouchEnabled"));
  objc_msgSend(v4, "setSelectableGridPunchoutIndex:", -[SearchUICommandEnvironment selectableGridPunchoutIndex](self, "selectableGridPunchoutIndex"));
  v9 = [(SearchUICommandEnvironment *)self searchString];
  [v4 setSearchString:v9];

  v10 = [(SearchUICommandEnvironment *)self sectionTitle];
  [v4 setSectionTitle:v10];

  v11 = [(SearchUICommandEnvironment *)self presentingViewController];
  [v4 setPresentingViewController:v11];

  v12 = [(SearchUICommandEnvironment *)self sourceView];
  [v4 setSourceView:v12];

  v13 = [(SearchUICommandEnvironment *)self rowModelViewDelegate];
  [v4 setRowModelViewDelegate:v13];

  objc_msgSend(v4, "setQueryId:", -[SearchUICommandEnvironment queryId](self, "queryId"));
  v14 = [(SearchUICommandEnvironment *)self section];
  [v4 setSection:v14];

  v15 = [(SearchUICommandEnvironment *)self resultsViewDelegate];
  [v4 setResultsViewDelegate:v15];

  v16 = [(SearchUICommandEnvironment *)self lastEngagedSection];
  [v4 setLastEngagedSection:v16];

  objc_msgSend(v4, "setModifierFlags:", -[SearchUICommandEnvironment modifierFlags](self, "modifierFlags"));
  return v4;
}

- (SearchUICommandDelegate)commandDelegate
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_commandDelegate);
  if (!WeakRetained)
  {
    v4 = [(SearchUICommandEnvironment *)self feedbackDelegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      v6 = [(SearchUICommandEnvironment *)self feedbackDelegate];
      WeakRetained = [v6 commandDelegate];
    }
    else
    {
      WeakRetained = 0;
    }
  }
  return (SearchUICommandDelegate *)WeakRetained;
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (SearchUIFeedbackDelegate *)WeakRetained;
}

- (SearchUIRowModelViewDelegate)rowModelViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rowModelViewDelegate);
  return (SearchUIRowModelViewDelegate *)WeakRetained;
}

- (SearchUICardViewDelegate)cardViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardViewDelegate);
  return (SearchUICardViewDelegate *)WeakRetained;
}

- (SearchUIWatchListDelegate)watchListDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_watchListDelegate);
  return (SearchUIWatchListDelegate *)WeakRetained;
}

- (void)setWatchListDelegate:(id)a3
{
}

- (BOOL)shouldUseInsetRoundedSections
{
  return self->_shouldUseInsetRoundedSections;
}

- (BOOL)shouldUseStandardSectionInsets
{
  return self->_shouldUseStandardSectionInsets;
}

- (BOOL)threeDTouchEnabled
{
  return self->_threeDTouchEnabled;
}

- (int64_t)selectableGridPunchoutIndex
{
  return self->_selectableGridPunchoutIndex;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (SFResultSection)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  return (UIView *)WeakRetained;
}

- (void)setSourceView:(id)a3
{
}

- (SearchUIResultsViewDelegate)resultsViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsViewDelegate);
  return (SearchUIResultsViewDelegate *)WeakRetained;
}

- (SearchUISectionModel)lastEngagedSection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastEngagedSection);
  return (SearchUISectionModel *)WeakRetained;
}

- (void)setLastEngagedSection:(id)a3
{
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void)setModifierFlags:(int64_t)a3
{
  self->_modifierFlags = a3;
}

@end