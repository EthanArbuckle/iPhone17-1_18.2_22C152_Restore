@interface MFCategorizationMenuTriageInteraction
- (id)_iconImageName;
- (id)cardActionWithCompletion:(id)a3;
- (id)menuActionWithPreparation:(id)a3 completion:(id)a4;
- (id)title;
- (id)triageAction;
- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4;
- (void)setTriageAction:(id)a3;
@end

@implementation MFCategorizationMenuTriageInteraction

- (id)title
{
  return (id)_EFLocalizedStringFromTable();
}

- (id)_iconImageName
{
  return MFImageGlyphCategorizationAction;
}

- (id)cardActionWithCompletion:(id)a3
{
  id v4 = objc_retainBlock(a3);
  v5 = [(MFTriageInteraction *)self cardTitle];
  v6 = [(MFCategorizationMenuTriageInteraction *)self _iconImageName];
  v7 = [(MFTriageInteraction *)self _tintColor];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10017CCD8;
  v11[3] = &unk_10060ABB8;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  v9 = +[MFCardAction cardActionWithTitle:v5 shortTitle:0 imageName:v6 tintColor:v7 handler:v11];

  return v9;
}

- (id)menuActionWithPreparation:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = [(MFTriageInteraction *)self cardTitle];
  v7 = [(MFCategorizationMenuTriageInteraction *)self _iconImageName];
  id v8 = +[UIImage systemImageNamed:v7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10017CE44;
  v12[3] = &unk_10060AD58;
  v12[4] = self;
  id v9 = v5;
  id v13 = v9;
  v10 = +[UIAction actionWithTitle:v6 image:v8 identifier:0 handler:v12];

  return v10;
}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  v25.receiver = self;
  v25.super_class = (Class)MFCategorizationMenuTriageInteraction;
  id v23 = a4;
  -[MFCategoryTriageInteraction _performInteractionAfterPreparation:completion:](&v25, "_performInteractionAfterPreparation:completion:", a3);
  v24.receiver = self;
  v24.super_class = (Class)MFCategorizationMenuTriageInteraction;
  v6 = [(MFTriageInteraction *)&v24 delegate];
  v7 = [(MFTriageInteraction *)self messageListItemSelection];
  id v8 = [v7 messageListItems];
  id v9 = [v8 firstObject];

  v10 = [v6 presentingViewControllerForCategorizationInteraction:self];
  v11 = [v6 actionViewHeaderForCategorizationInteraction:self messageListItem:v9];
  id v12 = [[MailRecategorizationViewController alloc] initWithMessageHeaderView:v11 messageListItem:v9 completion:v23];
  [(MailRecategorizationViewController *)v12 setDelegate:v6];
  id v13 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [v10 traitCollection];
    BOOL v15 = [v14 userInterfaceIdiom] == (id)1;
  }
  else
  {
    BOOL v15 = 0;
  }
  v16 = [v10 traitCollection];
  unsigned int v17 = [v16 mf_supportsPopoverPresentation] | v15;

  if (v17 == 1)
  {
    [v13 setModalPresentationStyle:7];
    v18 = [v13 popoverPresentationController];
    v19 = [(MFTriageInteraction *)self presentationSource];
    char v20 = objc_opt_respondsToSelector();

    v21 = [(MFTriageInteraction *)self presentationSource];
    if (v20) {
      [v21 mui_setAsSourceWithExtendedRectForPopoverPresentationController:v18];
    }
    else {
      [v21 mui_setAsSourceForPopoverPresentationController:v18];
    }

    [v10 presentViewController:v13 animated:1 completion:0];
  }
  else
  {
    [v13 setModalPresentationStyle:1];
    v18 = [v13 presentationController];
    [v18 _setShouldDismissWhenTappedOutside:1];
    v22 = [v18 presentedViewController];
    [v10 presentViewController:v22 animated:1 completion:0];
  }
}

- (id)triageAction
{
  return self->_triageAction;
}

- (void)setTriageAction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end