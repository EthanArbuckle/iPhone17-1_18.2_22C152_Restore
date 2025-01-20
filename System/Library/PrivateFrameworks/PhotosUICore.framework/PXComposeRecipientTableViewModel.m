@interface PXComposeRecipientTableViewModel
- (BOOL)canAddRecipients;
- (BOOL)canDeleteRecipients;
- (BOOL)canSelectRecipients;
- (BOOL)useGroupedBackgroundColor;
- (NSArray)composeRecipients;
- (NSArray)recipients;
- (NSString)footerTitle;
- (NSString)headerTitle;
- (PXComposeRecipientDataSourceManager)composeRecipientDataSourceManager;
- (PXComposeRecipientTableViewModel)init;
- (PXComposeRecipientTableViewModel)initWithComposeRecipientDataSourceManager:(id)a3;
- (PXPeopleSuggestionsMediaProvider)peopleSuggestionsMediaProvider;
- (void)performChanges:(id)a3;
- (void)setCanAddRecipients:(BOOL)a3;
- (void)setCanDeleteRecipients:(BOOL)a3;
- (void)setCanSelectRecipients:(BOOL)a3;
- (void)setComposeRecipients:(id)a3;
- (void)setFooterTitle:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setUseGroupedBackgroundColor:(BOOL)a3;
@end

@implementation PXComposeRecipientTableViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerTitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_composeRecipients, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionsMediaProvider, 0);
  objc_storeStrong((id *)&self->_composeRecipientDataSourceManager, 0);
}

- (BOOL)useGroupedBackgroundColor
{
  return self->_useGroupedBackgroundColor;
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (BOOL)canSelectRecipients
{
  return self->_canSelectRecipients;
}

- (BOOL)canDeleteRecipients
{
  return self->_canDeleteRecipients;
}

- (BOOL)canAddRecipients
{
  return self->_canAddRecipients;
}

- (NSArray)composeRecipients
{
  return self->_composeRecipients;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (PXPeopleSuggestionsMediaProvider)peopleSuggestionsMediaProvider
{
  return self->_peopleSuggestionsMediaProvider;
}

- (PXComposeRecipientDataSourceManager)composeRecipientDataSourceManager
{
  return self->_composeRecipientDataSourceManager;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXComposeRecipientTableViewModel;
  [(PXComposeRecipientTableViewModel *)&v3 performChanges:a3];
}

- (void)setUseGroupedBackgroundColor:(BOOL)a3
{
  if (self->_useGroupedBackgroundColor != a3)
  {
    self->_useGroupedBackgroundColor = a3;
    [(PXComposeRecipientTableViewModel *)self signalChange:128];
  }
}

- (void)setFooterTitle:(id)a3
{
  v11 = (NSString *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewModel.m", 93, @"Invalid parameter not satisfying: %@", @"footerTitle" object file lineNumber description];
  }
  v5 = self->_footerTitle;
  if (v5 == v11)
  {
  }
  else
  {
    v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v11];

    if (!v7)
    {
      v8 = (NSString *)[(NSString *)v11 copy];
      footerTitle = self->_footerTitle;
      self->_footerTitle = v8;

      [(PXComposeRecipientTableViewModel *)self signalChange:64];
    }
  }
}

- (void)setHeaderTitle:(id)a3
{
  v11 = (NSString *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewModel.m", 84, @"Invalid parameter not satisfying: %@", @"headerTitle" object file lineNumber description];
  }
  v5 = self->_headerTitle;
  if (v5 == v11)
  {
  }
  else
  {
    v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v11];

    if (!v7)
    {
      v8 = (NSString *)[(NSString *)v11 copy];
      headerTitle = self->_headerTitle;
      self->_headerTitle = v8;

      [(PXComposeRecipientTableViewModel *)self signalChange:32];
    }
  }
}

- (void)setCanSelectRecipients:(BOOL)a3
{
  if (self->_canSelectRecipients != a3)
  {
    self->_canSelectRecipients = a3;
    [(PXComposeRecipientTableViewModel *)self signalChange:16];
  }
}

- (void)setCanDeleteRecipients:(BOOL)a3
{
  if (self->_canDeleteRecipients != a3)
  {
    self->_canDeleteRecipients = a3;
    [(PXComposeRecipientTableViewModel *)self signalChange:8];
  }
}

- (void)setCanAddRecipients:(BOOL)a3
{
  if (self->_canAddRecipients != a3)
  {
    self->_canAddRecipients = a3;
    [(PXComposeRecipientTableViewModel *)self signalChange:4];
  }
}

- (void)setComposeRecipients:(id)a3
{
  v11 = (NSArray *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewModel.m", 51, @"Invalid parameter not satisfying: %@", @"composeRecipients" object file lineNumber description];
  }
  v5 = self->_composeRecipients;
  if (v5 == v11)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(NSArray *)v5 isEqual:v11];

    if ((v7 & 1) == 0)
    {
      v8 = (NSArray *)[(NSArray *)v11 copy];
      composeRecipients = self->_composeRecipients;
      self->_composeRecipients = v8;

      [(PXComposeRecipientTableViewModel *)self signalChange:2];
    }
  }
}

- (void)setRecipients:(id)a3
{
  v11 = (NSArray *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewModel.m", 42, @"Invalid parameter not satisfying: %@", @"recipients" object file lineNumber description];
  }
  v5 = self->_recipients;
  if (v5 == v11)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(NSArray *)v5 isEqual:v11];

    if ((v7 & 1) == 0)
    {
      v8 = (NSArray *)[(NSArray *)v11 copy];
      recipients = self->_recipients;
      self->_recipients = v8;

      [(PXComposeRecipientTableViewModel *)self signalChange:1];
    }
  }
}

- (PXComposeRecipientTableViewModel)initWithComposeRecipientDataSourceManager:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXComposeRecipientTableViewModel;
  v6 = [(PXComposeRecipientTableViewModel *)&v17 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_composeRecipientDataSourceManager, a3);
    recipients = v7->_recipients;
    v9 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v7->_recipients = (NSArray *)MEMORY[0x1E4F1CBF0];

    composeRecipients = v7->_composeRecipients;
    v7->_composeRecipients = v9;

    headerTitle = v7->_headerTitle;
    v7->_headerTitle = (NSString *)&stru_1F00B0030;

    footerTitle = v7->_footerTitle;
    v7->_footerTitle = (NSString *)&stru_1F00B0030;

    v13 = [(PXComposeRecipientDataSourceManager *)v7->_composeRecipientDataSourceManager peopleSuggestionsDataSourceManager];
    uint64_t v14 = [v13 mediaProvider];
    peopleSuggestionsMediaProvider = v7->_peopleSuggestionsMediaProvider;
    v7->_peopleSuggestionsMediaProvider = (PXPeopleSuggestionsMediaProvider *)v14;
  }
  return v7;
}

- (PXComposeRecipientTableViewModel)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXComposeRecipientTableViewModel.m", 22, @"%s is not available as initializer", "-[PXComposeRecipientTableViewModel init]");

  abort();
}

@end