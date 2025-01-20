@interface MNNavigationServiceEmptyProxy
- (BOOL)_isSelectorValidForForwarding:(SEL)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (MNNavigationServiceEmptyProxy)initWithPeer:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation MNNavigationServiceEmptyProxy

- (MNNavigationServiceEmptyProxy)initWithPeer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MNNavigationServiceEmptyProxy;
  v6 = [(MNNavigationServiceEmptyProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_peer, a3);
  }

  return v7;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = (const char *)[a3 selector];
  if ([(MNNavigationServiceEmptyProxy *)self _isSelectorValidForForwarding:v4])
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = NSStringFromSelector(v4);
      peer = self->_peer;
      int v8 = 138412546;
      objc_super v9 = v6;
      __int16 v10 = 2112;
      v11 = peer;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "%@ is not allowed because %@ is missing the required entitlement.", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [(MNNavigationServiceEmptyProxy *)self doesNotRecognizeSelector:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (-[MNNavigationServiceEmptyProxy _isSelectorValidForForwarding:](self, "_isSelectorValidForForwarding:"))
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA38], "_navigation_methodSignatureForEmptyMethod");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MNNavigationServiceEmptyProxy;
    id v5 = [(MNNavigationServiceEmptyProxy *)&v7 methodSignatureForSelector:a3];
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (-[MNNavigationServiceEmptyProxy _isSelectorValidForForwarding:](self, "_isSelectorValidForForwarding:")) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MNNavigationServiceEmptyProxy;
  return [(MNNavigationServiceEmptyProxy *)&v6 respondsToSelector:a3];
}

- (BOOL)_isSelectorValidForForwarding:(SEL)a3
{
  return MNProtocolDeclaresSelector(&unk_1F0E3FFE0, a3);
}

- (void).cxx_destruct
{
}

@end