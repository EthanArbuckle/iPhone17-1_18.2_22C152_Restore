@interface PKDynamicListSectionController
- (NSArray)identifiers;
- (NSAttributedString)attributedFooterText;
- (NSAttributedString)attributedHeaderText;
- (NSString)footerText;
- (NSString)headerText;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)leadingSwipeActionsConfigurationProvider;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (id)trailingSwipeActionsConfigurationProvider;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)setAttributedFooterText:(id)a3;
- (void)setAttributedHeaderText:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setHeaderText:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setLeadingSwipeActionsConfigurationProvider:(id)a3;
- (void)setTrailingSwipeActionsConfigurationProvider:(id)a3;
@end

@implementation PKDynamicListSectionController

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1358]);

  return v4;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4FB1558];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithAppearance:2];
  v8 = [(PKDynamicListSectionController *)self headerText];
  if (v8)
  {
  }
  else
  {
    v9 = [(PKDynamicListSectionController *)self attributedHeaderText];

    if (!v9) {
      goto LABEL_5;
    }
  }
  [v7 setHeaderMode:1];
LABEL_5:
  v10 = [(PKDynamicListSectionController *)self footerText];
  if (v10)
  {
  }
  else
  {
    v11 = [(PKDynamicListSectionController *)self attributedFooterText];

    if (!v11) {
      goto LABEL_9;
    }
  }
  [v7 setFooterMode:1];
LABEL_9:
  v12 = [(PKDynamicListSectionController *)self leadingSwipeActionsConfigurationProvider];
  [v7 setLeadingSwipeActionsConfigurationProvider:v12];

  v13 = [(PKDynamicListSectionController *)self trailingSwipeActionsConfigurationProvider];
  [v7 setTrailingSwipeActionsConfigurationProvider:v13];

  v14 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v7 layoutEnvironment:v6];

  return v14;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((id)*MEMORY[0x1E4FB2770] == v8)
  {
    v10 = [MEMORY[0x1E4FB1948] groupedHeaderConfiguration];
    if (self->_attributedHeaderText)
    {
LABEL_7:
      objc_msgSend(v10, "setAttributedText:");
      goto LABEL_10;
    }
    headerText = self->_headerText;
  }
  else
  {
    if ((id)*MEMORY[0x1E4FB2760] != v8)
    {
      v10 = 0;
      goto LABEL_10;
    }
    v10 = [MEMORY[0x1E4FB1948] groupedFooterConfiguration];
    if (self->_attributedFooterText) {
      goto LABEL_7;
    }
    headerText = self->_footerText;
  }
  [v10 setText:headerText];
LABEL_10:
  [v12 setContentConfiguration:v10];
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSString)headerText
{
  return self->_headerText;
}

- (void)setHeaderText:(id)a3
{
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (NSAttributedString)attributedHeaderText
{
  return self->_attributedHeaderText;
}

- (void)setAttributedHeaderText:(id)a3
{
}

- (NSAttributedString)attributedFooterText
{
  return self->_attributedFooterText;
}

- (void)setAttributedFooterText:(id)a3
{
}

- (id)leadingSwipeActionsConfigurationProvider
{
  return self->_leadingSwipeActionsConfigurationProvider;
}

- (void)setLeadingSwipeActionsConfigurationProvider:(id)a3
{
}

- (id)trailingSwipeActionsConfigurationProvider
{
  return self->_trailingSwipeActionsConfigurationProvider;
}

- (void)setTrailingSwipeActionsConfigurationProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trailingSwipeActionsConfigurationProvider, 0);
  objc_storeStrong(&self->_leadingSwipeActionsConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_attributedFooterText, 0);
  objc_storeStrong((id *)&self->_attributedHeaderText, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerText, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end