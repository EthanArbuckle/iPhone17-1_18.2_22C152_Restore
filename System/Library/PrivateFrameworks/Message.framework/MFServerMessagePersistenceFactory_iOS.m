@interface MFServerMessagePersistenceFactory_iOS
- (MFMailMessageLibrary)library;
- (MFServerMessagePersistenceFactory_iOS)initWithLibrary:(id)a3 database:(id)a4;
- (int64_t)mailboxIDForMailboxURL:(id)a3 useNumericSearch:(BOOL *)a4 supportsLabels:(BOOL *)a5;
- (void)setLibrary:(id)a3;
@end

@implementation MFServerMessagePersistenceFactory_iOS

- (MFServerMessagePersistenceFactory_iOS)initWithLibrary:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 persistence];
  v9 = [v8 gmailLabelPersistence];
  v12.receiver = self;
  v12.super_class = (Class)MFServerMessagePersistenceFactory_iOS;
  v10 = [(EDServerMessagePersistenceFactory *)&v12 initWithDatabase:v7 gmailLabelPersistence:v9];

  if (v10) {
    objc_storeWeak((id *)&v10->_library, v6);
  }

  return v10;
}

- (int64_t)mailboxIDForMailboxURL:(id)a3 useNumericSearch:(BOOL *)a4 supportsLabels:(BOOL *)a5
{
  id v8 = a3;
  v9 = v8;
  if (a4)
  {
    v10 = [v8 scheme];
    *a4 = [v10 isEqualToString:*MEMORY[0x1E4F5FC38]];
  }
  if (a5) {
    *a5 = 0;
  }
  v11 = [(MFServerMessagePersistenceFactory_iOS *)self library];
  objc_super v12 = [v9 absoluteString];
  int64_t v13 = [v11 mailboxIDForURLString:v12 createIfNecessary:1];

  return v13;
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