@interface _MFDALibraryConsumerFactory
- (MFMailMessageLibrary)library;
- (MFMessage)message;
- (id)dataConsumerForPart:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation _MFDALibraryConsumerFactory

- (id)dataConsumerForPart:(id)a3
{
  id v4 = a3;
  v5 = [(_MFDALibraryConsumerFactory *)self library];
  v6 = [(_MFDALibraryConsumerFactory *)self message];
  v7 = [v5 dataConsumerForMessage:v6 part:v4];

  return v7;
}

- (MFMailMessageLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (MFMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

@end