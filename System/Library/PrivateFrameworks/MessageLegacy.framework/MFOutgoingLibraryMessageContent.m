@interface MFOutgoingLibraryMessageContent
- (MFLibraryMessage)libraryMessage;
- (id)copy;
- (id)headers;
- (void)dealloc;
- (void)setLibraryMessage:(id)a3;
@end

@implementation MFOutgoingLibraryMessageContent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingLibraryMessageContent;
  [(MFOutgoingMessageContent *)&v3 dealloc];
}

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
  v2 = objc_msgSend((id)-[MFLibraryMessage headers](-[MFOutgoingLibraryMessageContent libraryMessage](self, "libraryMessage"), "headers"), "mutableCopy");
  return v2;
}

- (MFLibraryMessage)libraryMessage
{
  return self->_libraryMessage;
}

- (void)setLibraryMessage:(id)a3
{
}

@end