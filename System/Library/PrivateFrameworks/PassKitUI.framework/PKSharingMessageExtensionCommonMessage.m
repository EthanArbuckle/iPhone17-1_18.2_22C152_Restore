@interface PKSharingMessageExtensionCommonMessage
+ (id)_messageDataWithDataURL:(id)a3 prefix:(id)a4;
+ (id)messageTypeFromURL:(id)a3;
- (BOOL)isFromMe;
- (BOOL)isPending;
- (NSData)messageData;
- (NSData)rawThumbnailData;
- (NSString)buttonTitle;
- (NSString)description;
- (NSString)messageType;
- (NSString)subtitle;
- (NSString)title;
- (NSString)topLeftTitle;
- (NSString)topRightTitle;
- (NSURL)actionURL;
- (PKSharingMessageExtensionCommonMessage)init;
- (PKSharingMessageExtensionCommonMessage)initWithURL:(id)a3;
- (UIImage)thumbnail;
- (id)_initWithCommonMessage:(id)a3 url:(id)a4;
- (id)_messageDataURLWithData:(id)a3 prefix:(id)a4;
- (id)urlRepresentation;
- (void)setActionURL:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setIsPending:(BOOL)a3;
- (void)setMessageData:(id)a3;
- (void)setMessageType:(id)a3;
- (void)setRawThumbnailData:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopLeftTitle:(id)a3;
- (void)setTopRightTitle:(id)a3;
@end

@implementation PKSharingMessageExtensionCommonMessage

- (PKSharingMessageExtensionCommonMessage)init
{
  return [(PKSharingMessageExtensionCommonMessage *)self initWithURL:0];
}

- (PKSharingMessageExtensionCommonMessage)initWithURL:(id)a3
{
  id v4 = a3;
  v5 = +[PKSharingMessageExtensionCommonMessage _messageDataWithDataURL:v4 prefix:@"data:application/vnd.apple.pksim;base64,"];
  if (!v5)
  {
    v6 = 0;
LABEL_14:
    self = (PKSharingMessageExtensionCommonMessage *)[(PKSharingMessageExtensionCommonMessage *)self _initWithCommonMessage:v6 url:v4];
    v13 = self;
    goto LABEL_15;
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F84E90]) initWithData:v5];
  v7 = [v6 messageType];
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    v10 = @"pkrelayservermessage";
    if (v9 == v10)
    {
    }
    else
    {
      v11 = v10;
      if (!v10)
      {

LABEL_13:
        goto LABEL_14;
      }
      int v12 = [(__CFString *)v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_13;
      }
    }
    v13 = [[PKSharingMessageExtensionRelayServerMessage alloc] _initWithCommonMessage:v6 url:v4];
  }
  else
  {
    v13 = 0;
  }

LABEL_15:
  return v13;
}

- (id)_initWithCommonMessage:(id)a3 url:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKSharingMessageExtensionCommonMessage;
  v7 = [(PKSharingMessageExtensionCommonMessage *)&v17 init];
  v8 = v7;
  if (v7)
  {
    p_message = (id *)&v7->_message;
    objc_storeStrong((id *)&v7->_message, a3);
    if (!v8->_message)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F84E90]);
      id v11 = *p_message;
      id *p_message = v10;

      [*p_message setVersion:1];
      [*p_message setStatus:6];
      id v12 = objc_alloc_init(MEMORY[0x1E4F84428]);
      [v12 setIdentifier:@"identifier"];
      v13 = [MEMORY[0x1E4F29128] UUID];
      [v12 setSharingSessionIdentifier:v13];

      [v12 setPairedReaderIdentifier:@"pairedReaderIdentifier"];
      [v12 setSupportedRadioTechnologies:0];
      [v12 setPartnerIdentifier:@"partnerIdentifier"];
      [v12 setBrandIdentifier:@"brandIdentifier"];
      [v12 setForWatch:1];
      v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
      v15 = [v14 hexEncoding];
      [*p_message setWatchInvitation:v15];
    }
  }

  return v8;
}

- (id)urlRepresentation
{
  v3 = [(PKProtobufCommonSharingMessage *)self->_message data];
  id v4 = [(PKSharingMessageExtensionCommonMessage *)self _messageDataURLWithData:v3 prefix:@"data:application/vnd.apple.pksim;base64,"];

  return v4;
}

+ (id)messageTypeFromURL:(id)a3
{
  v3 = +[PKSharingMessageExtensionCommonMessage _messageDataWithDataURL:a3 prefix:@"data:application/vnd.apple.pksim;base64,"];
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F84E98]) initWithData:v3];
    v5 = [v4 messageType];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)messageType
{
  return (NSString *)[(PKProtobufCommonSharingMessage *)self->_message messageType];
}

- (void)setMessageType:(id)a3
{
}

- (NSData)messageData
{
  return (NSData *)[(PKProtobufCommonSharingMessage *)self->_message messageData];
}

- (void)setMessageData:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(PKProtobufCommonSharingMessage *)self->_message title];
}

- (void)setTitle:(id)a3
{
}

- (NSString)topLeftTitle
{
  return (NSString *)[(PKProtobufCommonSharingMessage *)self->_message topLeftTitle];
}

- (void)setTopLeftTitle:(id)a3
{
}

- (NSString)topRightTitle
{
  return (NSString *)[(PKProtobufCommonSharingMessage *)self->_message topRightTitle];
}

- (void)setTopRightTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)[(PKProtobufCommonSharingMessage *)self->_message subtitle];
}

- (void)setSubtitle:(id)a3
{
}

- (UIImage)thumbnail
{
  v2 = [(PKProtobufCommonSharingMessage *)self->_message thumbnailImage];
  v3 = v2;
  if (v2 && (uint64_t v4 = PKCreateCGImage(v2)) != 0)
  {
    v5 = (CGImage *)v4;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:v4];
    CGImageRelease(v5);
  }
  else
  {
    id v6 = 0;
  }

  return (UIImage *)v6;
}

- (void)setThumbnail:(id)a3
{
  message = self->_message;
  UIImagePNGRepresentation((UIImage *)a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKProtobufCommonSharingMessage *)message setThumbnailImage:v4];
}

- (NSData)rawThumbnailData
{
  return (NSData *)[(PKProtobufCommonSharingMessage *)self->_message thumbnailImage];
}

- (void)setRawThumbnailData:(id)a3
{
}

- (NSURL)actionURL
{
  v2 = [(PKProtobufCommonSharingMessage *)self->_message actionURL];
  if (v2) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v2];
  }
  else {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (void)setActionURL:(id)a3
{
  message = self->_message;
  id v4 = [a3 absoluteString];
  [(PKProtobufCommonSharingMessage *)message setActionURL:v4];
}

- (NSString)buttonTitle
{
  return (NSString *)[(PKProtobufCommonSharingMessage *)self->_message buttonTitle];
}

- (void)setButtonTitle:(id)a3
{
}

- (id)_messageDataURLWithData:(id)a3 prefix:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = [a3 base64EncodedStringWithOptions:0];
    if (v6)
    {
      v7 = [v5 stringByAppendingString:v6];
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v7];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_messageDataWithDataURL:(id)a3 prefix:(id)a4
{
  id v5 = a4;
  if (!a3)
  {
    id v10 = 0;
    goto LABEL_10;
  }
  id v6 = a3;
  v7 = [v6 absoluteString];
  v8 = [v6 scheme];

  if ([v8 isEqualToString:@"data"])
  {
    int v9 = [v7 hasPrefix:v5];

    if (!v9)
    {
      id v10 = 0;
      goto LABEL_9;
    }
    v8 = objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v5, "length"));
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:1];
  }
  else
  {
    id v10 = 0;
  }

LABEL_9:
LABEL_10:

  return v10;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  v7 = [(PKSharingMessageExtensionCommonMessage *)self title];
  [v6 appendFormat:@"title: '%@'; ", v7];

  v8 = [(PKSharingMessageExtensionCommonMessage *)self subtitle];
  [v6 appendFormat:@"subtitle: '%@'; ", v8];

  [v6 appendFormat:@">"];
  int v9 = [NSString stringWithString:v6];

  return (NSString *)v9;
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