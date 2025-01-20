@interface PXComposeRecipientDataSource
- (NSArray)composeRecipients;
- (NSSet)recipients;
- (PXComposeRecipientDataSource)init;
- (PXComposeRecipientDataSource)initWithComposeRecipients:(id)a3 recipients:(id)a4;
- (unint64_t)indexOfComposeRecipientForRecipient:(id)a3;
- (void)setRecipients:(id)a3;
@end

@implementation PXComposeRecipientDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_composeRecipients, 0);
}

- (void)setRecipients:(id)a3
{
}

- (NSSet)recipients
{
  return self->_recipients;
}

- (NSArray)composeRecipients
{
  return self->_composeRecipients;
}

- (unint64_t)indexOfComposeRecipientForRecipient:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(NSSet *)self->_recipients containsObject:v4])
  {
    composeRecipients = self->_composeRecipients;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PXComposeRecipientDataSource_indexOfComposeRecipientForRecipient___block_invoke;
    v8[3] = &unk_1E5DB7C30;
    id v9 = v4;
    v10 = &v11;
    [(NSArray *)composeRecipients enumerateObjectsUsingBlock:v8];
  }
  unint64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __68__PXComposeRecipientDataSource_indexOfComposeRecipientForRecipient___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = [a2 recipient];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (PXComposeRecipientDataSource)initWithComposeRecipients:(id)a3 recipients:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXComposeRecipientDataSource;
  int v8 = [(PXComposeRecipientDataSource *)&v16 init];
  if (v8)
  {
    id v9 = PLSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [v6 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "Initializing PXComposeRecipientDataSource with %lu compose recipients", buf, 0xCu);
    }

    uint64_t v11 = [v6 copy];
    composeRecipients = v8->_composeRecipients;
    v8->_composeRecipients = (NSArray *)v11;

    uint64_t v13 = [v7 copy];
    recipients = v8->_recipients;
    v8->_recipients = (NSSet *)v13;
  }
  return v8;
}

- (PXComposeRecipientDataSource)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXComposeRecipientDataSourceManager.m", 47, @"%s is not available as initializer", "-[PXComposeRecipientDataSource init]");

  abort();
}

@end