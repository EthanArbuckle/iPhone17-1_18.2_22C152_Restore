@interface PDNFSecureXPCAliroAccessKeyStatusUpdateEventContent
- (NSString)terminalReaderIdentifier;
- (PDNFSecureXPCAliroAccessKeyStatusUpdateEventContent)initWithTerminalReaderIdentifier:(id)a3 operationSource:(unint64_t)a4;
- (unint64_t)operationSource;
@end

@implementation PDNFSecureXPCAliroAccessKeyStatusUpdateEventContent

- (PDNFSecureXPCAliroAccessKeyStatusUpdateEventContent)initWithTerminalReaderIdentifier:(id)a3 operationSource:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDNFSecureXPCAliroAccessKeyStatusUpdateEventContent;
  v8 = [(PDNFSecureXPCAliroAccessKeyStatusUpdateEventContent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_terminalReaderIdentifier, a3);
    v9->_operationSource = a4;
  }

  return v9;
}

- (NSString)terminalReaderIdentifier
{
  return self->_terminalReaderIdentifier;
}

- (unint64_t)operationSource
{
  return self->_operationSource;
}

- (void).cxx_destruct
{
}

@end