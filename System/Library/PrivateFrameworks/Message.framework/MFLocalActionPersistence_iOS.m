@interface MFLocalActionPersistence_iOS
- (BOOL)moveSupportedFromMailboxURL:(id)a3 toURL:(id)a4;
- (MFLocalActionPersistence_iOS)initWithDatabase:(id)a3;
- (MFLocalActionPersistence_iOS)initWithDatabase:(id)a3 gmailLabelPersistence:(id)a4;
- (MFLocalActionPersistence_iOS)initWithLibrary:(id)a3 database:(id)a4;
- (MFMailMessageLibrary)library;
- (id)labelNameForLabelID:(int64_t)a3;
- (id)mailboxURLForDatabaseID:(int64_t)a3;
- (id)messageForDatabaseID:(int64_t)a3;
- (int64_t)mailboxDatabaseIDForURL:(id)a3;
- (void)setLibrary:(id)a3;
@end

@implementation MFLocalActionPersistence_iOS

- (MFLocalActionPersistence_iOS)initWithDatabase:(id)a3 gmailLabelPersistence:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(MFLocalActionPersistence_iOS *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFLocalActionPersistence_iOS initWithDatabase:gmailLabelPersistence:]", "MFLocalActionPersistence_iOS.m", 24, "0");
}

- (MFLocalActionPersistence_iOS)initWithLibrary:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 persistence];
  v9 = [v8 gmailLabelPersistence];
  v12.receiver = self;
  v12.super_class = (Class)MFLocalActionPersistence_iOS;
  v10 = [(EDLocalActionPersistence *)&v12 initWithDatabase:v7 gmailLabelPersistence:v9];

  if (v10) {
    objc_storeWeak((id *)&v10->_library, v6);
  }

  return v10;
}

- (MFLocalActionPersistence_iOS)initWithDatabase:(id)a3
{
  id v5 = a3;
  [(MFLocalActionPersistence_iOS *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MFLocalActionPersistence_iOS initWithDatabase:]", "MFLocalActionPersistence_iOS.m", 36, "0");
}

- (id)messageForDatabaseID:(int64_t)a3
{
  v4 = [(MFLocalActionPersistence_iOS *)self library];
  id v5 = [v4 messageWithLibraryID:a3 options:7346239 inMailbox:0];

  return v5;
}

- (BOOL)moveSupportedFromMailboxURL:(id)a3 toURL:(id)a4
{
  id v5 = a4;
  id v6 = +[MailAccount accountWithURL:a3];
  id v7 = +[MailAccount accountWithURL:v5];
  if (v6 == v7) {
    char v8 = [v6 moveSupported];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (id)mailboxURLForDatabaseID:(int64_t)a3
{
  v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = [(MFLocalActionPersistence_iOS *)self library];
  id v6 = [v5 urlForMailboxID:a3];
  id v7 = [v4 URLWithString:v6];

  return v7;
}

- (int64_t)mailboxDatabaseIDForURL:(id)a3
{
  id v4 = a3;
  id v5 = [(MFLocalActionPersistence_iOS *)self library];
  id v6 = [v4 absoluteString];
  int64_t v7 = [v5 mailboxIDForURLString:v6 createIfNecessary:1];

  return v7;
}

- (id)labelNameForLabelID:(int64_t)a3
{
}

- (MFMailMessageLibrary)library
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  return (MFMailMessageLibrary *)WeakRetained;
}

- (void)setLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end