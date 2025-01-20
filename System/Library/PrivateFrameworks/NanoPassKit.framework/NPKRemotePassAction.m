@interface NPKRemotePassAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isResponse;
- (BOOL)supportsCommutePlanRenewal;
- (BOOL)supportsTopUp;
- (MSMessage)underlyingMessage;
- (NPKProtoRemotePassActionEnvelope)protoEnvelope;
- (NPKRemotePassAction)initWithCoder:(id)a3;
- (NPKRemotePassAction)initWithMessage:(id)a3 protoEnvelope:(id)a4 image:(id)a5;
- (NPKRemotePassAction)initWithProtoEnvelope:(id)a3 image:(id)a4;
- (NPKRemotePassAction)initWithUnderlyingMessage:(id)a3;
- (NSString)caption;
- (NSString)passLocalizedDescription;
- (NSString)passOrganizationName;
- (UIImage)image;
- (id)_imageForMessage:(id)a3;
- (id)_messageDataURLWithData:(id)a3;
- (id)_messageDataWithDataURL:(id)a3;
- (id)description;
- (unint64_t)cardType;
- (void)_updateDataURL;
- (void)_updateLayoutContentsWithImage:(id)a3;
- (void)_updateSummaryText;
- (void)encodeWithCoder:(id)a3;
- (void)setProtoEnvelope:(id)a3;
- (void)setUnderlyingMessage:(id)a3;
@end

@implementation NPKRemotePassAction

- (NPKRemotePassAction)initWithUnderlyingMessage:(id)a3
{
  id v4 = a3;
  v5 = [v4 URL];
  v6 = [(NPKRemotePassAction *)self _messageDataWithDataURL:v5];

  if (v6) {
    v7 = [[NPKProtoRemotePassActionEnvelope alloc] initWithData:v6];
  }
  else {
    v7 = 0;
  }
  v8 = [(NPKRemotePassAction *)self _imageForMessage:v4];
  v9 = [(NPKRemotePassAction *)self initWithMessage:v4 protoEnvelope:v7 image:v8];

  return v9;
}

- (NPKRemotePassAction)initWithProtoEnvelope:(id)a3 image:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F12598];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = objc_alloc_init(MEMORY[0x263F125C0]);
  v11 = (void *)[v9 initWithSession:v10];

  v12 = [(NPKRemotePassAction *)self initWithMessage:v11 protoEnvelope:v8 image:v7];
  return v12;
}

- (NPKRemotePassAction)initWithMessage:(id)a3 protoEnvelope:(id)a4 image:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NPKRemotePassAction;
  v12 = [(NPKRemotePassAction *)&v14 init];
  if (v12)
  {
    [v9 setRequiresValidation:1];
    objc_storeStrong((id *)&v12->_underlyingMessage, a3);
    objc_storeStrong((id *)&v12->_protoEnvelope, a4);
    [(NPKRemotePassAction *)v12 _updateDataURL];
    [(NPKRemotePassAction *)v12 _updateSummaryText];
    [(NPKRemotePassAction *)v12 _updateLayoutContentsWithImage:v11];
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(NPKRemotePassAction *)self isResponse]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v6 = [(NPKRemotePassAction *)self passLocalizedDescription];
  id v7 = [(NPKRemotePassAction *)self caption];
  id v8 = [(NPKRemotePassAction *)self image];
  id v9 = [v3 stringWithFormat:@"<%@: %p> isResponse: %@, passLocalizedDescription: %@, caption: %@, image: %@, underlyingMessage: %@", v4, self, v5, v6, v7, v8, self->_underlyingMessage];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKRemotePassAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPKRemotePassAction;
  v5 = [(NPKRemotePassAction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"underlyingMessage"];
    underlyingMessage = v5->_underlyingMessage;
    v5->_underlyingMessage = (MSMessage *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protoEnvelope"];
    protoEnvelope = v5->_protoEnvelope;
    v5->_protoEnvelope = (NPKProtoRemotePassActionEnvelope *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  underlyingMessage = self->_underlyingMessage;
  id v5 = a3;
  [v5 encodeObject:underlyingMessage forKey:@"underlyingMessage"];
  [v5 encodeObject:self->_protoEnvelope forKey:@"protoEnvelope"];
}

- (BOOL)isResponse
{
  return [(NPKProtoRemotePassActionEnvelope *)self->_protoEnvelope isResponse];
}

- (NSString)passLocalizedDescription
{
  return [(NPKProtoRemotePassActionEnvelope *)self->_protoEnvelope passLocalizedDescription];
}

- (NSString)caption
{
  return [(NPKProtoRemotePassActionEnvelope *)self->_protoEnvelope caption];
}

- (UIImage)image
{
  return (UIImage *)[(NPKRemotePassAction *)self _imageForMessage:self->_underlyingMessage];
}

- (NSString)passOrganizationName
{
  return [(NPKProtoRemotePassActionEnvelope *)self->_protoEnvelope passOrganizationName];
}

- (BOOL)supportsTopUp
{
  if ((PKIsPhone() & 1) != 0 || (PKIsPod() & 1) != 0 || (int v3 = PKIsWatch()) != 0) {
    LOBYTE(v3) = [(NPKProtoRemotePassActionEnvelope *)self->_protoEnvelope messageType] == 1;
  }
  return v3;
}

- (BOOL)supportsCommutePlanRenewal
{
  if ((PKIsPhone() & 1) != 0 || (PKIsPod() & 1) != 0 || (int v3 = PKIsWatch()) != 0) {
    LOBYTE(v3) = [(NPKProtoRemotePassActionEnvelope *)self->_protoEnvelope version] >= 2
  }
              && [(NPKProtoRemotePassActionEnvelope *)self->_protoEnvelope messageType] == 2;
  return v3;
}

- (unint64_t)cardType
{
  if (![(NPKProtoRemotePassActionEnvelope *)self->_protoEnvelope hasCardType]) {
    return 0;
  }
  int v3 = [(NPKProtoRemotePassActionEnvelope *)self->_protoEnvelope cardType];
  return NPKRemotePassActionCardTypeForNPKProtoRemotePassActionCardType(v3);
}

- (id)_messageDataURLWithData:(id)a3
{
  if (a3)
  {
    int v3 = [a3 base64EncodedStringWithOptions:0];
    if (v3)
    {
      id v4 = [NPKRemotePassActionMessageAbsoluteDataURLPrefix stringByAppendingString:v3];
      id v5 = (void *)[objc_alloc(NSURL) initWithString:v4];
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

- (id)_messageDataWithDataURL:(id)a3
{
  if (!a3)
  {
    id v7 = 0;
    goto LABEL_10;
  }
  id v3 = a3;
  id v4 = [v3 absoluteString];
  id v5 = [v3 scheme];

  if ([v5 isEqualToString:@"data"])
  {
    int v6 = [v4 hasPrefix:NPKRemotePassActionMessageAbsoluteDataURLPrefix];

    if (!v6)
    {
      id v7 = 0;
      goto LABEL_9;
    }
    id v5 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(NPKRemotePassActionMessageAbsoluteDataURLPrefix, "length"));
    id v7 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v5 options:1];
  }
  else
  {
    id v7 = 0;
  }

LABEL_9:
LABEL_10:
  return v7;
}

- (void)_updateDataURL
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(NPKProtoRemotePassActionEnvelope *)self->_protoEnvelope data];
  id v4 = [(NPKRemotePassAction *)self _messageDataURLWithData:v3];
  [(MSMessage *)self->_underlyingMessage setURL:v4];
  id v5 = [v4 absoluteString];
  unint64_t v6 = [v5 length];

  id v7 = pk_RemotePassAction_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = pk_RemotePassAction_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      unint64_t v14 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Data url has size %lu", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v6 >= 0x1401)
  {
    id v10 = pk_RemotePassAction_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      v12 = pk_RemotePassAction_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Warning: The data URL is too big! We may fail message size validation, causing issues when inserting this message into a conversation.", (uint8_t *)&v13, 2u);
      }
    }
  }
}

- (void)_updateSummaryText
{
  id v4 = [(NPKRemotePassAction *)self protoEnvelope];
  id v3 = [v4 summaryText];
  [(MSMessage *)self->_underlyingMessage setSummaryText:v3];
}

- (void)_updateLayoutContentsWithImage:(id)a3
{
  id v14 = a3;
  id v4 = [(MSMessage *)self->_underlyingMessage layout];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263F125A0]);
    id v8 = objc_alloc_init(MEMORY[0x263F125B0]);
    id v6 = (id)[v7 initWithAlternateLayout:v8];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = 0;
      id v9 = 0;
      goto LABEL_11;
    }
    id v10 = v6;
    id v9 = 0;
    if (!v10) {
      goto LABEL_11;
    }
LABEL_9:
    BOOL v11 = [(NPKRemotePassAction *)self passLocalizedDescription];
    [v10 setCaption:v11];

    v12 = [(NPKRemotePassAction *)self caption];
    [v10 setSubcaption:v12];

    [v10 setImage:v14];
    goto LABEL_11;
  }
  id v9 = v6;
  id v10 = [v9 alternateLayout];
  if (v10) {
    goto LABEL_9;
  }
LABEL_11:
  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = v10;
  }
  [(MSMessage *)self->_underlyingMessage setLayout:v13];
}

- (id)_imageForMessage:(id)a3
{
  id v3 = [a3 layout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 alternateLayout];
LABEL_5:
    id v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:
  id v6 = [v5 image];

  return v6;
}

- (MSMessage)underlyingMessage
{
  return self->_underlyingMessage;
}

- (void)setUnderlyingMessage:(id)a3
{
}

- (NPKProtoRemotePassActionEnvelope)protoEnvelope
{
  return self->_protoEnvelope;
}

- (void)setProtoEnvelope:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protoEnvelope, 0);
  objc_storeStrong((id *)&self->_underlyingMessage, 0);
}

@end