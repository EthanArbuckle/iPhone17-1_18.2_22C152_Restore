@interface SDPromptDelegate
- (BOOL)didPartnerTimeout;
- (BOOL)isCoSysdiagnoseResponse;
- (BOOL)isEarlyPrompt;
- (NSString)bundleID;
- (NSString)diagnosticID;
- (NSString)ttrOverrideURLStr;
- (id)copy;
- (id)description;
- (int64_t)openIssueFiler;
- (void)setBundleID:(id)a3;
- (void)setDiagnosticID:(id)a3;
- (void)setDidPartnerTimeout:(BOOL)a3;
- (void)setIsCoSysdiagnoseResponse:(BOOL)a3;
- (void)setIsEarlyPrompt:(BOOL)a3;
- (void)setOpenIssueFiler:(int64_t)a3;
- (void)setTtrOverrideURLStr:(id)a3;
@end

@implementation SDPromptDelegate

- (id)description
{
  unint64_t v3 = [(SDPromptDelegate *)self openIssueFiler];
  if (v3 > 2) {
    v4 = "unknown";
  }
  else {
    v4 = off_10009D9C8[v3];
  }
  v5 = [(SDPromptDelegate *)self diagnosticID];
  v6 = [(SDPromptDelegate *)self bundleID];
  v7 = +[NSString stringWithFormat:@"diagnosticID: %@, bundleID %@, issueFilerStatus %s, early %d, partnerTimeout %d, isResponse %d", v5, v6, v4, [(SDPromptDelegate *)self isEarlyPrompt], [(SDPromptDelegate *)self didPartnerTimeout], [(SDPromptDelegate *)self isCoSysdiagnoseResponse]];

  return v7;
}

- (id)copy
{
  unint64_t v3 = objc_alloc_init(SDPromptDelegate);
  [(SDPromptDelegate *)v3 setIsCoSysdiagnoseResponse:[(SDPromptDelegate *)self isCoSysdiagnoseResponse]];
  [(SDPromptDelegate *)v3 setDidPartnerTimeout:[(SDPromptDelegate *)self didPartnerTimeout]];
  [(SDPromptDelegate *)v3 setIsEarlyPrompt:[(SDPromptDelegate *)self isEarlyPrompt]];
  [(SDPromptDelegate *)v3 setOpenIssueFiler:[(SDPromptDelegate *)self openIssueFiler]];
  v4 = [(SDPromptDelegate *)self diagnosticID];
  id v5 = [v4 copy];
  [(SDPromptDelegate *)v3 setDiagnosticID:v5];

  v6 = [(SDPromptDelegate *)self bundleID];
  id v7 = [v6 copy];
  [(SDPromptDelegate *)v3 setBundleID:v7];

  v8 = [(SDPromptDelegate *)self ttrOverrideURLStr];
  id v9 = [v8 copy];
  [(SDPromptDelegate *)v3 setTtrOverrideURLStr:v9];

  return v3;
}

- (BOOL)isEarlyPrompt
{
  return self->_isEarlyPrompt;
}

- (void)setIsEarlyPrompt:(BOOL)a3
{
  self->_isEarlyPrompt = a3;
}

- (BOOL)didPartnerTimeout
{
  return self->_didPartnerTimeout;
}

- (void)setDidPartnerTimeout:(BOOL)a3
{
  self->_didPartnerTimeout = a3;
}

- (BOOL)isCoSysdiagnoseResponse
{
  return self->_isCoSysdiagnoseResponse;
}

- (void)setIsCoSysdiagnoseResponse:(BOOL)a3
{
  self->_isCoSysdiagnoseResponse = a3;
}

- (int64_t)openIssueFiler
{
  return self->_openIssueFiler;
}

- (void)setOpenIssueFiler:(int64_t)a3
{
  self->_openIssueFiler = a3;
}

- (NSString)diagnosticID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDiagnosticID:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSString)ttrOverrideURLStr
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTtrOverrideURLStr:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttrOverrideURLStr, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_diagnosticID, 0);
}

@end