@interface SiriCoreAceConnectionAnalysisInfo
- (BOOL)wwanPreferred;
- (NSNumber)sendBufferSize;
- (NSString)policyId;
- (NSURL)connectionURL;
- (SiriCoreAceConnectionAnalysisInfo)initWithConnectionURL:(id)a3 interfaceIndex:(int)a4 sendBufferSize:(id)a5 wwanPreferred:(BOOL)a6 connectionType:(id)a7 policyId:(id)a8;
- (SiriCoreConnectionType)connectionType;
- (int)interfaceIndex;
- (void)setPolicyId:(id)a3;
@end

@implementation SiriCoreAceConnectionAnalysisInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyId, 0);
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_sendBufferSize, 0);

  objc_storeStrong((id *)&self->_connectionURL, 0);
}

- (void)setPolicyId:(id)a3
{
}

- (NSString)policyId
{
  return self->_policyId;
}

- (SiriCoreConnectionType)connectionType
{
  return self->_connectionType;
}

- (BOOL)wwanPreferred
{
  return self->_wwanPreferred;
}

- (NSNumber)sendBufferSize
{
  return self->_sendBufferSize;
}

- (int)interfaceIndex
{
  return self->_interfaceIndex;
}

- (NSURL)connectionURL
{
  return self->_connectionURL;
}

- (SiriCoreAceConnectionAnalysisInfo)initWithConnectionURL:(id)a3 interfaceIndex:(int)a4 sendBufferSize:(id)a5 wwanPreferred:(BOOL)a6 connectionType:(id)a7 policyId:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)SiriCoreAceConnectionAnalysisInfo;
  v19 = [(SiriCoreAceConnectionAnalysisInfo *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_connectionURL, a3);
    v20->_interfaceIndex = a4;
    uint64_t v21 = [v16 copy];
    sendBufferSize = v20->_sendBufferSize;
    v20->_sendBufferSize = (NSNumber *)v21;

    v20->_wwanPreferred = a6;
    objc_storeStrong((id *)&v20->_connectionType, a7);
    uint64_t v23 = [v18 copy];
    policyId = v20->_policyId;
    v20->_policyId = (NSString *)v23;
  }
  return v20;
}

@end