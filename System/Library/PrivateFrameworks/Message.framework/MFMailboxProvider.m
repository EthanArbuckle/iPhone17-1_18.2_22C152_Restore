@interface MFMailboxProvider
- (MFMailboxProvider)initWithAccountsProvider:(id)a3;
- (MFMailboxUidTransformer)mailboxUidTransformer;
- (id)_transformMailbox:(id)a3 legacyMailboxToMailboxMap:(id)a4 objectIDToLegacyMailboxMap:(id)a5;
- (id)legacyMailboxForObjectID:(id)a3;
- (void)_fetchMailboxesForAccount:(id)a3 kind:(int64_t)a4;
- (void)setMailboxUidTransformer:(id)a3;
- (void)test_tearDown;
@end

@implementation MFMailboxProvider

- (id)legacyMailboxForObjectID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFMailboxProvider;
  v3 = [(EDMailboxProvider *)&v5 legacyMailboxForObjectID:a3];
  return v3;
}

- (void)_fetchMailboxesForAccount:(id)a3 kind:(int64_t)a4
{
}

- (id)_transformMailbox:(id)a3 legacyMailboxToMailboxMap:(id)a4 objectIDToLegacyMailboxMap:(id)a5
{
  objc_super v5 = [(MFMailboxUidTransformer *)self->_mailboxUidTransformer transformMailboxUid:a3 uidToMailboxMap:a4 objectIDToUidMap:a5];
  return v5;
}

- (MFMailboxProvider)initWithAccountsProvider:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFMailboxProvider;
  objc_super v5 = [(EDMailboxProvider *)&v15 initWithAccountsProvider:v4];
  if (v5)
  {
    v6 = objc_alloc_init(MFMailboxUidTransformer);
    mailboxUidTransformer = v5->_mailboxUidTransformer;
    v5->_mailboxUidTransformer = v6;

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v5 selector:sel__mailboxInvalidated_ name:@"MailboxUidDidBecomeInvalidNotification" object:0];

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v5 selector:sel__didChangeMailboxList_ name:@"AccountMailboxListingDidChange" object:0];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v5 selector:sel__willReloadMailboxList_ name:@"AccountMailboxListingWillLoad" object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v5 selector:sel__didReloadMailboxList_ name:@"AccountMailboxListingDidLoad" object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v5 selector:sel__willFetchMailboxList_ name:@"AccountMailboxListingWillFetch" object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v5 selector:sel__didFetchMailboxList_ name:@"AccountMailboxListingDidFetch" object:0];
  }
  return v5;
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFMailboxProvider.m", 40, @"%s can only be called from unit tests", "-[MFMailboxProvider test_tearDown]");
  }
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)MFMailboxProvider;
  [(EDMailboxProvider *)&v6 test_tearDown];
}

- (MFMailboxUidTransformer)mailboxUidTransformer
{
  return self->_mailboxUidTransformer;
}

- (void)setMailboxUidTransformer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end