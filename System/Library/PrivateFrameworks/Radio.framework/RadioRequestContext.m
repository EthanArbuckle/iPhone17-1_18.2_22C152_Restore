@interface RadioRequestContext
- (BOOL)usesLocalNetworking;
- (SSVFairPlaySAPSession)SAPSession;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setSAPSession:(id)a3;
- (void)setUsesLocalNetworking:(BOOL)a3;
@end

@implementation RadioRequestContext

- (void).cxx_destruct
{
}

- (void)setUsesLocalNetworking:(BOOL)a3
{
  self->_usesLocalNetworking = a3;
}

- (BOOL)usesLocalNetworking
{
  return self->_usesLocalNetworking;
}

- (void)setSAPSession:(id)a3
{
}

- (SSVFairPlaySAPSession)SAPSession
{
  return self->_SAPSession;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setUsesLocalNetworking:self->_usesLocalNetworking];
  [v4 setSAPSession:self->_SAPSession];
  return v4;
}

@end