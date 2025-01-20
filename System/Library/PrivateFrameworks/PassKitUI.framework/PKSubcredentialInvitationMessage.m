@interface PKSubcredentialInvitationMessage
- (BOOL)isFromMe;
- (BOOL)isPending;
- (NSString)dataString;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (PKAppletSubcredentialSharingInvitation)phoneInvitation;
- (PKAppletSubcredentialSharingInvitation)watchInvitation;
- (PKSubcredentialInvitationMessage)init;
- (PKSubcredentialInvitationMessage)initWithURL:(id)a3;
- (UIImage)passThumbnailImage;
- (id)_subcredentialInvitationMessageDataURLWithData:(id)a3;
- (id)_subcredentialInvitationMessageDataWithDataURL:(id)a3;
- (id)urlRepresentation;
- (unint64_t)status;
- (void)setDataString:(id)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setIsPending:(BOOL)a3;
- (void)setPassThumbnailImage:(id)a3;
- (void)setPhoneInvitation:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setWatchInvitation:(id)a3;
@end

@implementation PKSubcredentialInvitationMessage

- (PKSubcredentialInvitationMessage)init
{
  return [(PKSubcredentialInvitationMessage *)self initWithURL:0];
}

- (PKSubcredentialInvitationMessage)initWithURL:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKSubcredentialInvitationMessage;
  v5 = [(PKSubcredentialInvitationMessage *)&v14 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      uint64_t v7 = [(PKSubcredentialInvitationMessage *)v5 _subcredentialInvitationMessageDataWithDataURL:v4];
      if (v7)
      {
        v8 = (void *)v7;
        uint64_t v9 = [objc_alloc(MEMORY[0x1E4F84EB8]) initWithData:v7];
        protoMessage = v6->_protoMessage;
        v6->_protoMessage = (PKProtobufSubcredentialInvitationMessage *)v9;
      }
    }
    if (!v6->_protoMessage)
    {
      v11 = (PKProtobufSubcredentialInvitationMessage *)objc_alloc_init(MEMORY[0x1E4F84EB8]);
      v12 = v6->_protoMessage;
      v6->_protoMessage = v11;

      [(PKProtobufSubcredentialInvitationMessage *)v6->_protoMessage setVersion:1];
    }
  }

  return v6;
}

- (id)urlRepresentation
{
  v3 = [(PKProtobufSubcredentialInvitationMessage *)self->_protoMessage data];
  id v4 = [(PKSubcredentialInvitationMessage *)self _subcredentialInvitationMessageDataURLWithData:v3];

  return v4;
}

- (PKAppletSubcredentialSharingInvitation)phoneInvitation
{
  v2 = [(PKProtobufSubcredentialInvitationMessage *)self->_protoMessage phoneInvitation];
  v3 = objc_msgSend(v2, "pk_decodeHexadecimal");

  id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];

  return (PKAppletSubcredentialSharingInvitation *)v4;
}

- (PKAppletSubcredentialSharingInvitation)watchInvitation
{
  v2 = [(PKProtobufSubcredentialInvitationMessage *)self->_protoMessage watchInvitation];
  v3 = objc_msgSend(v2, "pk_decodeHexadecimal");

  id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];

  return (PKAppletSubcredentialSharingInvitation *)v4;
}

- (NSString)dataString
{
  return (NSString *)[(PKProtobufSubcredentialInvitationMessage *)self->_protoMessage dataString];
}

- (unint64_t)status
{
  unsigned int v2 = [(PKProtobufSubcredentialInvitationMessage *)self->_protoMessage status];
  if (v2 > 5) {
    return 0;
  }
  else {
    return qword_1A04455E8[v2];
  }
}

- (NSString)uniqueIdentifier
{
  return (NSString *)[(PKProtobufSubcredentialInvitationMessage *)self->_protoMessage uniqueIdentifier];
}

- (UIImage)passThumbnailImage
{
  unsigned int v2 = [(PKProtobufSubcredentialInvitationMessage *)self->_protoMessage passThumbnailImage];
  v3 = v2;
  if (v2 && (uint64_t v4 = PKCreateCGImage(v2)) != 0)
  {
    v5 = (CGImage *)v4;
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v4];
    CGImageRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return (UIImage *)v6;
}

- (void)setPhoneInvitation:(id)a3
{
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  uint64_t v4 = [v5 hexEncoding];
  [(PKProtobufSubcredentialInvitationMessage *)self->_protoMessage setPhoneInvitation:v4];
}

- (void)setWatchInvitation:(id)a3
{
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  uint64_t v4 = [v5 hexEncoding];
  [(PKProtobufSubcredentialInvitationMessage *)self->_protoMessage setWatchInvitation:v4];
}

- (void)setDataString:(id)a3
{
}

- (void)setStatus:(unint64_t)a3
{
  if (a3 > 9) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = dword_1A0445618[a3];
  }
  [(PKProtobufSubcredentialInvitationMessage *)self->_protoMessage setStatus:v3];
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setPassThumbnailImage:(id)a3
{
  protoMessage = self->_protoMessage;
  UIImagePNGRepresentation((UIImage *)a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKProtobufSubcredentialInvitationMessage *)protoMessage setPassThumbnailImage:v4];
}

- (id)_subcredentialInvitationMessageDataURLWithData:(id)a3
{
  if (a3)
  {
    uint64_t v3 = [a3 base64EncodedStringWithOptions:0];
    if (v3)
    {
      id v4 = [PKSubcredentialInvitationMessageAbsoluteDataURLPrefix stringByAppendingString:v3];
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

- (id)_subcredentialInvitationMessageDataWithDataURL:(id)a3
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
    int v6 = [v4 hasPrefix:PKSubcredentialInvitationMessageAbsoluteDataURLPrefix];

    if (!v6)
    {
      uint64_t v7 = 0;
      goto LABEL_9;
    }
    id v5 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(PKSubcredentialInvitationMessageAbsoluteDataURLPrefix, "length"));
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

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(PKSubcredentialInvitationMessage *)self phoneInvitation];
  int v6 = [v5 identifier];
  uint64_t v7 = [(PKSubcredentialInvitationMessage *)self watchInvitation];
  v8 = [v7 identifier];
  [(PKSubcredentialInvitationMessage *)self status];
  uint64_t v9 = PKShareStatusToString();
  v10 = [v3 stringWithFormat:@"<%@: %p> phoneIdentifier: %@, watchIdentifier: %@, status: %@", v4, self, v6, v8, v9];

  return (NSString *)v10;
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