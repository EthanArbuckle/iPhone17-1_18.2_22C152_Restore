@interface _MFAddableMessage
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isServerSearchResult;
- (BOOL)respondsToSelector:(SEL)a3;
- (ECAngleBracketIDHash)messageIDHeaderHash;
- (ECMailbox)mailbox;
- (MFLibraryMessage)libraryMessage;
- (NSString)urlString;
- (_MFAddableMessage)initWithLibraryMessage:(id)a3 messageIDHash:(int64_t)a4 mailboxURL:(id)a5;
- (id)bestAlternativePart:(BOOL *)a3;
- (id)bestAlternativePartAsData:(BOOL *)a3 usingEncoding:(unint64_t)a4;
- (int64_t)messageIDHash;
@end

@implementation _MFAddableMessage

- (_MFAddableMessage)initWithLibraryMessage:(id)a3 messageIDHash:(int64_t)a4 mailboxURL:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_MFAddableMessage;
  v11 = [(_MFAddableMessage *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_libraryMessage, a3);
    v12->_messageIDHash = a4;
    uint64_t v13 = [v10 copy];
    urlString = v12->_urlString;
    v12->_urlString = (NSString *)v13;
  }
  return v12;
}

- (int64_t)messageIDHash
{
  uint64_t messageIDHash = self->_messageIDHash;
  if (!messageIDHash)
  {
    v3 = [(_MFAddableMessage *)self libraryMessage];
    uint64_t messageIDHash = [v3 messageIDHash];
  }
  return messageIDHash;
}

- (ECAngleBracketIDHash)messageIDHeaderHash
{
  if (self->_messageIDHash)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F607C0]) initWithHash:self->_messageIDHash];
  }
  else
  {
    v3 = [(_MFAddableMessage *)self libraryMessage];
    v2 = [v3 messageIDHeaderHash];
  }
  return (ECAngleBracketIDHash *)v2;
}

- (ECMailbox)mailbox
{
  v3 = [(_MFAddableMessage *)self urlString];

  if (v3)
  {
    v4 = [(_MFAddableMessage *)self urlString];
    +[MailAccount mailboxUidFromActiveAccountsForURL:v4];
  }
  else
  {
    v4 = [(_MFAddableMessage *)self libraryMessage];
    [v4 mailbox];
  v5 = };

  return (ECMailbox *)v5;
}

- (id)bestAlternativePart:(BOOL *)a3
{
  v4 = [(_MFAddableMessage *)self libraryMessage];
  v5 = [v4 bestAlternativePart:a3];

  return v5;
}

- (id)bestAlternativePartAsData:(BOOL *)a3 usingEncoding:(unint64_t)a4
{
  v6 = [(_MFAddableMessage *)self libraryMessage];
  v7 = [v6 bestAlternativePartAsData:a3 usingEncoding:a4];

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v3 = [(_MFAddableMessage *)self libraryMessage];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (BOOL)isServerSearchResult
{
  v2 = [(_MFAddableMessage *)self libraryMessage];
  char v3 = [v2 isServerSearchResult];

  return v3;
}

- (BOOL)isKindOfClass:(Class)a3
{
  char v3 = [(_MFAddableMessage *)self libraryMessage];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (MFLibraryMessage)libraryMessage
{
  return self->_libraryMessage;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_libraryMessage, 0);
}

@end