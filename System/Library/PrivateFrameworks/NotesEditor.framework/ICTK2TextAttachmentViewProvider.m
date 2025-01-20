@interface ICTK2TextAttachmentViewProvider
- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder;
- (ICTK2TextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6;
- (NSTextLocation)updatedLocationForRecycledViewProvider;
- (void)loadView;
- (void)setHighlightPatternRegexFinder:(id)a3;
- (void)setUpdatedLocationForRecycledViewProvider:(id)a3;
@end

@implementation ICTK2TextAttachmentViewProvider

- (void)setHighlightPatternRegexFinder:(id)a3
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
  id v5 = a3;
  objc_opt_class();
  id v7 = [(NSTextAttachmentViewProvider *)self view];
  v6 = ICDynamicCast();
  [v6 setHighlightPatternRegexFinder:v5];
}

- (void)loadView
{
  objc_opt_class();
  v3 = [(NSTextAttachmentViewProvider *)self textLayoutManager];
  ICDynamicCast();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = [(NSTextAttachmentViewProvider *)self textAttachment];
  id v5 = ICDynamicCast();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v13 tableViewControllerForAttachment:v5 createIfNeeded:1];
    objc_opt_class();
    id v7 = [v6 view];
    v8 = ICDynamicCast();

    v9 = [0 highlightColor];
    [v6 setHighlightColor:v9];
  }
  else
  {
    objc_opt_class();
    v10 = [v13 textContainer];
    v11 = [v5 newlyCreatedViewForTextContainer:v10];
    v8 = ICDynamicCast();

    v6 = [(ICTK2TextAttachmentViewProvider *)self highlightPatternRegexFinder];
    [v8 setHighlightPatternRegexFinder:v6];
  }

  v12 = [v13 attachmentViewDelegate];
  [v8 setDelegate:v12];

  [(NSTextAttachmentViewProvider *)self setView:v8];
}

- (ICTK2TextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)ICTK2TextAttachmentViewProvider;
  v12 = [(NSTextAttachmentViewProvider *)&v15 initWithTextAttachment:a3 parentView:a4 textLayoutManager:a5 location:v11];
  id v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_updatedLocationForRecycledViewProvider, a6);
  }

  return v13;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (void)setUpdatedLocationForRecycledViewProvider:(id)a3
{
}

- (NSTextLocation)updatedLocationForRecycledViewProvider
{
  return self->_updatedLocationForRecycledViewProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);

  objc_storeStrong((id *)&self->_updatedLocationForRecycledViewProvider, 0);
}

@end