@interface PKExtensionRequestHandler
- (BOOL)isInvalidated;
- (NSExtensionContext)extensionContext;
- (PKExtensionRequestHandler)init;
- (id)_initWithExtension:(id)a3 extensionRequestOptions:(unint64_t)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PKExtensionRequestHandler

- (PKExtensionRequestHandler)init
{
  return 0;
}

- (id)_initWithExtension:(id)a3 extensionRequestOptions:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    v23.receiver = self;
    v23.super_class = (Class)PKExtensionRequestHandler;
    v8 = [(PKExtensionRequestHandler *)&v23 init];
    v9 = v8;
    if (v8)
    {
      v8->_lock._os_unfair_lock_opaque = 0;
      p_extension = (id *)&v8->_extension;
      objc_storeStrong((id *)&v8->_extension, a3);
      extension = v9->_extension;
      id v22 = 0;
      uint64_t v12 = [(NSExtension *)extension beginExtensionRequestWithOptions:a4 inputItems:0 error:&v22];
      id v13 = v22;
      requestIdentifier = v9->_requestIdentifier;
      v9->_requestIdentifier = (NSCopying *)v12;

      if (v9->_requestIdentifier) {
        BOOL v15 = v13 == 0;
      }
      else {
        BOOL v15 = 0;
      }
      if (v15)
      {
        uint64_t v16 = -[NSExtension _extensionContextForUUID:](v9->_extension, "_extensionContextForUUID:");
        extensionContext = v9->_extensionContext;
        v9->_extensionContext = (NSExtensionContext *)v16;
      }
      if (!v9->_extensionContext)
      {
        v9->_invalidated = 1;
        v18 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = *p_extension;
          *(_DWORD *)buf = 138412546;
          id v25 = v19;
          __int16 v26 = 2112;
          id v27 = v13;
          _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "PKExtensionRequestHandler: failed to begin extension request for extension %@, with error %@", buf, 0x16u);
        }

        if (v9->_requestIdentifier) {
          objc_msgSend(*p_extension, "cancelExtensionRequestWithIdentifier:");
        }
      }
    }
    self = v9;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  [(PKExtensionRequestHandler *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKExtensionRequestHandler;
  [(PKExtensionRequestHandler *)&v3 dealloc];
}

- (NSExtensionContext)extensionContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_extensionContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  extensionContext = self->_extensionContext;
  self->_extensionContext = 0;

  if (self->_requestIdentifier)
  {
    v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      extension = self->_extension;
      int v8 = 138412290;
      v9 = extension;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Canceled extension request for extension %@", (uint8_t *)&v8, 0xCu);
    }

    [(NSExtension *)self->_extension cancelExtensionRequestWithIdentifier:self->_requestIdentifier];
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = 0;
  }
  self->_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isInvalidated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end