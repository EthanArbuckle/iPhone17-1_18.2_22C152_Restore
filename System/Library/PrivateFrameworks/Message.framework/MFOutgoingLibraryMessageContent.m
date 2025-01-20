@interface MFOutgoingLibraryMessageContent
- (MFLibraryMessage)libraryMessage;
- (id)copy;
- (id)headers;
- (void)setLibraryMessage:(id)a3;
@end

@implementation MFOutgoingLibraryMessageContent

- (id)copy
{
  v5.receiver = self;
  v5.super_class = (Class)MFOutgoingLibraryMessageContent;
  id v3 = [(MFOutgoingMessageContent *)&v5 copy];
  [v3 setLibraryMessage:self->_libraryMessage];
  return v3;
}

- (id)headers
{
  v2 = [(MFOutgoingLibraryMessageContent *)self libraryMessage];
  id v3 = [v2 headers];
  v4 = (void *)[v3 mutableCopy];

  return v4;
}

- (MFLibraryMessage)libraryMessage
{
  return self->_libraryMessage;
}

- (void)setLibraryMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end