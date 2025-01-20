@interface PXComposeRecipientSelectionSnapshot
- (NSArray)selectedComposeRecipients;
- (NSArray)selectedRecipients;
- (PXComposeRecipientSelectionSnapshot)init;
- (PXComposeRecipientSelectionSnapshot)initWithSelectedComposeRecipients:(id)a3 selectedRecipients:(id)a4;
@end

@implementation PXComposeRecipientSelectionSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedRecipients, 0);
  objc_storeStrong((id *)&self->_selectedComposeRecipients, 0);
}

- (NSArray)selectedRecipients
{
  return self->_selectedRecipients;
}

- (NSArray)selectedComposeRecipients
{
  return self->_selectedComposeRecipients;
}

- (PXComposeRecipientSelectionSnapshot)initWithSelectedComposeRecipients:(id)a3 selectedRecipients:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXComposeRecipientSelectionSnapshot;
  v8 = [(PXComposeRecipientSelectionSnapshot *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    selectedComposeRecipients = v8->_selectedComposeRecipients;
    v8->_selectedComposeRecipients = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    selectedRecipients = v8->_selectedRecipients;
    v8->_selectedRecipients = (NSArray *)v11;
  }
  return v8;
}

- (PXComposeRecipientSelectionSnapshot)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXComposeRecipientSelectionManager.m", 27, @"%s is not available as initializer", "-[PXComposeRecipientSelectionSnapshot init]");

  abort();
}

@end