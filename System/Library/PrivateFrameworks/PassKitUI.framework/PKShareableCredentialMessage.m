@interface PKShareableCredentialMessage
- (BOOL)isFromMe;
- (BOOL)isPassInLibrary;
- (BOOL)isPending;
- (BOOL)isShareAcceptable;
- (NSArray)shareableCredentials;
- (NSString)caption;
- (NSString)dataString;
- (NSString)description;
- (NSString)policyIdentifier;
- (PKShareableCredentialMessage)init;
- (PKShareableCredentialMessage)initWithURL:(id)a3;
- (UIImage)passThumbnailImage;
- (id)_shareableCredentialMessageDataURLWithData:(id)a3;
- (id)_shareableCredentialMessageDataWithDataURL:(id)a3;
- (id)urlRepresentation;
- (void)setCaption:(id)a3;
- (void)setDataString:(id)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setIsPassInLibrary:(BOOL)a3;
- (void)setIsPending:(BOOL)a3;
- (void)setPassThumbnailImage:(id)a3;
- (void)setPolicyIdentifier:(id)a3;
- (void)setShareableCredentials:(id)a3;
@end

@implementation PKShareableCredentialMessage

- (PKShareableCredentialMessage)init
{
  return [(PKShareableCredentialMessage *)self initWithURL:0];
}

- (PKShareableCredentialMessage)initWithURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKShareableCredentialMessage;
  v5 = [(PKShareableCredentialMessage *)&v13 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(PKShareableCredentialMessage *)v5 _shareableCredentialMessageDataWithDataURL:v4];
    if (v7)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F84EB0]) initWithData:v7];
      protoMessage = v6->_protoMessage;
      v6->_protoMessage = (PKProtobufShareableCredentialMessage *)v8;
    }
    if (!v6->_protoMessage)
    {
      v10 = (PKProtobufShareableCredentialMessage *)objc_alloc_init(MEMORY[0x1E4F84EB0]);
      v11 = v6->_protoMessage;
      v6->_protoMessage = v10;

      [(PKProtobufShareableCredentialMessage *)v6->_protoMessage setVersion:1];
    }
  }
  return v6;
}

- (id)urlRepresentation
{
  v3 = [(PKProtobufShareableCredentialMessage *)self->_protoMessage data];
  id v4 = [(PKShareableCredentialMessage *)self _shareableCredentialMessageDataURLWithData:v3];

  return v4;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKShareableCredentialMessage *)self caption];
  [v3 appendFormat:@"caption: '%@'; ", v4];

  v5 = [(PKShareableCredentialMessage *)self policyIdentifier];
  [v3 appendFormat:@"policy identifier: '%@'; ", v5];

  v6 = [(PKShareableCredentialMessage *)self shareableCredentials];
  [v3 appendFormat:@"credentials: '%@'; ", v6];

  [v3 appendFormat:@">"];
  v7 = (void *)[v3 copy];

  return (NSString *)v7;
}

- (NSArray)shareableCredentials
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(PKProtobufShareableCredentialMessage *)self->_protoMessage shareableCredentials];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)[objc_alloc(MEMORY[0x1E4F85008]) initWithProtoCredential:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (NSString)dataString
{
  return (NSString *)[(PKProtobufShareableCredentialMessage *)self->_protoMessage dataString];
}

- (NSString)caption
{
  return (NSString *)[(PKProtobufShareableCredentialMessage *)self->_protoMessage messageCaption];
}

- (NSString)policyIdentifier
{
  return (NSString *)[(PKProtobufShareableCredentialMessage *)self->_protoMessage policyIdentifier];
}

- (UIImage)passThumbnailImage
{
  v2 = [(PKProtobufShareableCredentialMessage *)self->_protoMessage passThumbnailImage];
  v3 = v2;
  if (v2 && (uint64_t v4 = PKCreateCGImage(v2)) != 0)
  {
    uint64_t v5 = (CGImage *)v4;
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v4];
    CGImageRelease(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (UIImage *)v6;
}

- (BOOL)isShareAcceptable
{
  v3 = [(PKShareableCredentialMessage *)self shareableCredentials];
  uint64_t v4 = [v3 firstObject];
  unint64_t v5 = [v4 status];

  BOOL v6 = self->_isFromMe || v5 >= 2;
  return !v6;
}

- (BOOL)isPassInLibrary
{
  return [(PKProtobufShareableCredentialMessage *)self->_protoMessage isPassInLibrary];
}

- (void)setDataString:(id)a3
{
}

- (void)setShareableCredentials:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKProtobufShareableCredentialMessage *)self->_protoMessage clearShareableCredentials];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        protoMessage = self->_protoMessage;
        v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "protoCredential", (void)v12);
        [(PKProtobufShareableCredentialMessage *)protoMessage addShareableCredentials:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)setCaption:(id)a3
{
}

- (void)setPolicyIdentifier:(id)a3
{
}

- (void)setPassThumbnailImage:(id)a3
{
  protoMessage = self->_protoMessage;
  UIImagePNGRepresentation((UIImage *)a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKProtobufShareableCredentialMessage *)protoMessage setPassThumbnailImage:v4];
}

- (void)setIsPassInLibrary:(BOOL)a3
{
}

- (id)_shareableCredentialMessageDataURLWithData:(id)a3
{
  if (a3)
  {
    v3 = [a3 base64EncodedStringWithOptions:0];
    if (v3)
    {
      id v4 = [@"data:application/vnd.apple.pkshareablecredential;base64," stringByAppendingString:v3];
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_shareableCredentialMessageDataWithDataURL:(id)a3
{
  if (!a3)
  {
    uint64_t v7 = 0;
    goto LABEL_10;
  }
  id v3 = a3;
  id v4 = [v3 absoluteString];
  id v5 = [v3 scheme];

  if ([v5 isEqualToString:@"data"])
  {
    int v6 = [v4 hasPrefix:@"data:application/vnd.apple.pkshareablecredential;base64,"];

    if (!v6)
    {
      uint64_t v7 = 0;
      goto LABEL_9;
    }
    id v5 = [v4 substringFromIndex:objc_msgSend(@"data:application/vnd.apple.pkshareablecredential;base64,", "length")];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v5 options:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

LABEL_9:
LABEL_10:

  return v7;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (BOOL)isPending
{
  return self->_isPending;
}

- (void)setIsPending:(BOOL)a3
{
  self->_isPending = a3;
}

- (void).cxx_destruct
{
}

@end