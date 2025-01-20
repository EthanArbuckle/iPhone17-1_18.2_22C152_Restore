@interface UIDocumentUnavailableTitlePageView
@end

@implementation UIDocumentUnavailableTitlePageView

id __77___UIDocumentUnavailableTitlePageView__updateContentUnavailableConfiguration__block_invoke(void *a1, uint64_t a2, char a3, int a4)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7 = +[UIButtonConfiguration filledButtonConfiguration];
    [v7 setButtonSize:3];
    [v7 setTitleAlignment:2];
    [v7 _setAlwaysApplyTitleAlignment:1];
    [v7 setCornerStyle:3];
    v8 = +[UIColor tintColor];
    [v7 setBaseBackgroundColor:v8];
  }
  else
  {
    v7 = +[UIButtonConfiguration plainButtonConfiguration];
    [v7 setButtonSize:3];
    [v7 setTitleAlignment:2];
    [v7 _setAlwaysApplyTitleAlignment:1];
    v8 = +[UIColor tintColor];
    [v7 setBaseForegroundColor:v8];
  }

  if (a4)
  {
    [v7 setShowsActivityIndicator:1];
    goto LABEL_12;
  }
  uint64_t v18 = *(void *)off_1E52D2040;
  v9 = [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleBody" weight:*(double *)off_1E52D6C00];
  v19[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

  if (a1)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    v12 = [a1 title];
    v13 = (void *)[v11 initWithString:v12 attributes:v10];
    [v7 setAttributedTitle:v13];

    v14 = [a1 image];
    [v7 setImage:v14];
LABEL_10:

    goto LABEL_11;
  }
  if (a2)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
    v14 = _UILocalizedString(@"com.apple.documents.moreAction.title", @"The title of the button that presents additional actions.", @"More...");
    v16 = (void *)[v15 initWithString:v14 attributes:v10];
    [v7 setAttributedTitle:v16];

    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
  return v7;
}

@end