@interface PKSharingMessageExtensionRelayServerMessage
- (NSString)carKeyReaderIdentifier;
- (NSString)description;
- (NSString)provisioningCredentialHash;
- (NSURL)overrideURL;
- (NSURL)phoneMailboxURL;
- (NSURL)watchMailboxURL;
- (PKSharingMessageExtensionRelayServerLocalProperties)localProperties;
- (PKSharingMessageExtensionRelayServerMessage)init;
- (id)_initWithCommonMessage:(id)a3 url:(id)a4;
- (id)_messageDataURLWithData:(id)a3;
- (id)_messageDataWithDataURL:(id)a3;
- (id)urlRepresentation;
- (unint64_t)status;
- (void)setCarKeyReaderIdentifier:(id)a3;
- (void)setLocalProperties:(id)a3;
- (void)setMailboxURLS:(id)a3;
- (void)setOverrideURL:(id)a3;
- (void)setProvisioningCredentialHash:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation PKSharingMessageExtensionRelayServerMessage

- (PKSharingMessageExtensionRelayServerMessage)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKSharingMessageExtensionRelayServerMessage;
  v2 = [(PKSharingMessageExtensionCommonMessage *)&v8 init];
  if (v2)
  {
    int v3 = PKSharingUseCommonIMessageExtensionPayloadFormat();
    v4 = PKLogFacilityTypeGetObject();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Using common imessage extension payload format.", v7, 2u);
      }

      v2->_useLegacyMessageFormat = 0;
      [(PKSharingMessageExtensionCommonMessage *)v2 setMessageType:@"pkrelayservermessage"];
    }
    else
    {
      if (v5)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "iMessage Extension: Using legacy imessage extension payload format.", v7, 2u);
      }
    }
  }
  return v2;
}

- (id)_initWithCommonMessage:(id)a3 url:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKSharingMessageExtensionRelayServerMessage;
  id v7 = [(PKSharingMessageExtensionCommonMessage *)&v19 _initWithCommonMessage:a3 url:v6];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 messageData];
    if (v9
      || ([v8 _messageDataWithDataURL:v6], (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F84EA8]) initWithData:v9];
      v11 = (void *)*((void *)v8 + 3);
      *((void *)v8 + 3) = v10;
    }
    else
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F84EA8]);
      v18 = (void *)*((void *)v8 + 3);
      *((void *)v8 + 3) = v17;

      [*((id *)v8 + 3) setVersion:1];
    }
    v12 = [v8 messageType];
    *((unsigned char *)v8 + 32) = v12 == 0;

    if (*((unsigned char *)v8 + 32))
    {
      [v8 setMessageType:@"pkrelayservermessage"];
      v13 = [*((id *)v8 + 3) thumbnailImage];
      [v8 setRawThumbnailData:v13];

      [*((id *)v8 + 3) setThumbnailImage:0];
      v14 = [*((id *)v8 + 3) title];
      [v8 setTitle:v14];

      [*((id *)v8 + 3) setTitle:0];
      v15 = [*((id *)v8 + 3) subtitle];
      [v8 setSubtitle:v15];

      [*((id *)v8 + 3) setSubtitle:0];
    }
  }

  return v8;
}

- (id)urlRepresentation
{
  overrideURL = self->_overrideURL;
  if (overrideURL)
  {
    int v3 = overrideURL;
LABEL_3:
    v4 = v3;
    goto LABEL_6;
  }
  BOOL useLegacyMessageFormat = self->_useLegacyMessageFormat;
  message = self->_message;
  if (!useLegacyMessageFormat)
  {
    v14 = [(PKProtobufRelaySharingMessage *)message data];
    [(PKSharingMessageExtensionCommonMessage *)self setMessageData:v14];

    v15.receiver = self;
    v15.super_class = (Class)PKSharingMessageExtensionRelayServerMessage;
    int v3 = [(PKSharingMessageExtensionCommonMessage *)&v15 urlRepresentation];
    goto LABEL_3;
  }
  id v8 = (void *)[(PKProtobufRelaySharingMessage *)message copy];
  v9 = [(PKSharingMessageExtensionCommonMessage *)self rawThumbnailData];
  [v8 setThumbnailImage:v9];

  uint64_t v10 = [(PKSharingMessageExtensionCommonMessage *)self title];
  [v8 setTitle:v10];

  v11 = [(PKSharingMessageExtensionCommonMessage *)self subtitle];
  [v8 setSubtitle:v11];

  v12 = [v8 data];
  v4 = [(PKSharingMessageExtensionRelayServerMessage *)self _messageDataURLWithData:v12];

LABEL_6:

  return v4;
}

- (unint64_t)status
{
  v2 = [(PKProtobufRelaySharingMessage *)self->_message status];
  unint64_t v3 = PKShareStatusFromString();

  return v3;
}

- (void)setStatus:(unint64_t)a3
{
  message = self->_message;
  PKShareStatusToString();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PKProtobufRelaySharingMessage *)message setStatus:v4];
}

- (NSURL)phoneMailboxURL
{
  if ([(PKProtobufRelaySharingMessage *)self->_message mailboxURLsCount])
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
    id v4 = [(PKProtobufRelaySharingMessage *)self->_message mailboxURLsAtIndex:0];
    BOOL v5 = [v3 URLWithString:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return (NSURL *)v5;
}

- (NSURL)watchMailboxURL
{
  if ((unint64_t)[(PKProtobufRelaySharingMessage *)self->_message mailboxURLsCount] < 2)
  {
    BOOL v5 = 0;
  }
  else
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
    id v4 = [(PKProtobufRelaySharingMessage *)self->_message mailboxURLsAtIndex:1];
    BOOL v5 = [v3 URLWithString:v4];
  }

  return (NSURL *)v5;
}

- (void)setMailboxURLS:(id)a3
{
  message = self->_message;
  objc_msgSend(a3, "pk_arrayByApplyingBlock:", &__block_literal_global_209);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (void *)[v5 mutableCopy];
  [(PKProtobufRelaySharingMessage *)message setMailboxURLs:v4];
}

uint64_t __62__PKSharingMessageExtensionRelayServerMessage_setMailboxURLS___block_invoke(uint64_t a1, void *a2)
{
  return [a2 absoluteString];
}

- (PKSharingMessageExtensionRelayServerLocalProperties)localProperties
{
  v2 = [(PKProtobufRelaySharingMessage *)self->_message localData];
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (PKSharingMessageExtensionRelayServerLocalProperties *)v3;
}

- (void)setLocalProperties:(id)a3
{
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  [(PKProtobufRelaySharingMessage *)self->_message setLocalData:v4];
}

- (NSString)provisioningCredentialHash
{
  return (NSString *)[(PKProtobufRelaySharingMessage *)self->_message provisioningCredentialHash];
}

- (void)setProvisioningCredentialHash:(id)a3
{
}

- (NSString)carKeyReaderIdentifier
{
  return (NSString *)[(PKProtobufRelaySharingMessage *)self->_message carKeyReaderIdentifier];
}

- (void)setCarKeyReaderIdentifier:(id)a3
{
}

- (id)_messageDataURLWithData:(id)a3
{
  if (a3)
  {
    unint64_t v3 = [a3 base64EncodedStringWithOptions:0];
    if (v3)
    {
      id v4 = [@"data:application/vnd.apple.pkrelayservermessage;base64," stringByAppendingString:v3];
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
    int v6 = [v4 hasPrefix:@"data:application/vnd.apple.pkrelayservermessage;base64,"];

    if (!v6)
    {
      id v7 = 0;
      goto LABEL_9;
    }
    id v5 = [v4 substringFromIndex:objc_msgSend(@"data:application/vnd.apple.pkrelayservermessage;base64,", "length")];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v5 options:1];
  }
  else
  {
    id v7 = 0;
  }

LABEL_9:
LABEL_10:

  return v7;
}

- (NSString)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  id v7 = [(PKSharingMessageExtensionCommonMessage *)self title];
  [v6 appendFormat:@"title: '%@'; ", v7];

  id v8 = [(PKSharingMessageExtensionCommonMessage *)self subtitle];
  [v6 appendFormat:@"subtitle: '%@'; ", v8];

  [(PKSharingMessageExtensionRelayServerMessage *)self status];
  v9 = PKShareStatusToString();
  [v6 appendFormat:@"status: '%@'; ", v9];

  uint64_t v10 = [(PKSharingMessageExtensionRelayServerMessage *)self localProperties];
  [v6 appendFormat:@"localProperties: '%@'; ", v10];

  [v6 appendFormat:@">"];
  v11 = [NSString stringWithString:v6];

  return (NSString *)v11;
}

- (NSURL)overrideURL
{
  return self->_overrideURL;
}

- (void)setOverrideURL:(id)a3
{
  self->_overrideURL = (NSURL *)a3;
}

- (void).cxx_destruct
{
}

@end