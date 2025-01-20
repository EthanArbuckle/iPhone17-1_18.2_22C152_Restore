@interface SLFetchShareableContentAction
+ (BOOL)supportsSecureCoding;
- (NSString)requestedTypeIdentifier;
- (SLFetchShareableContentAction)initWithCoder:(id)a3;
- (SLFetchShareableContentAction)initWithSceneIdentifier:(id)a3 requestedTypeIdentifier:(id)a4 requestedItemProviderIndex:(int64_t)a5 responseHandler:(id)a6;
- (int64_t)requestedItemProviderIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SLFetchShareableContentAction

- (SLFetchShareableContentAction)initWithSceneIdentifier:(id)a3 requestedTypeIdentifier:(id)a4 requestedItemProviderIndex:(int64_t)a5 responseHandler:(id)a6
{
  v10 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v10);
  [v14 setObject:v13 forSetting:1];

  [v14 setObject:v12 forSetting:3];
  v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:a5];
  [v14 setObject:v15 forSetting:4];

  v16 = [(SLShareableContentAction *)self initWithInfo:v14 responseHandler:v11];
  return v16;
}

- (NSString)requestedTypeIdentifier
{
  p_requestedTypeIdentifier = &self->_requestedTypeIdentifier;
  requestedTypeIdentifier = self->_requestedTypeIdentifier;
  if (!requestedTypeIdentifier)
  {
    v4 = [(SLShareableContentAction *)self action];
    v5 = [v4 info];
    v6 = [v5 objectForSetting:3];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)p_requestedTypeIdentifier, v6);
    }

    requestedTypeIdentifier = *p_requestedTypeIdentifier;
  }
  return requestedTypeIdentifier;
}

- (int64_t)requestedItemProviderIndex
{
  v3 = [(SLShareableContentAction *)self action];
  v4 = [v3 info];
  v5 = [v4 objectForSetting:4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t requestedItemProviderIndex = [v5 integerValue];
    self->_uint64_t requestedItemProviderIndex = requestedItemProviderIndex;
  }
  else
  {
    uint64_t requestedItemProviderIndex = self->_requestedItemProviderIndex;
  }

  return requestedItemProviderIndex;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLFetchShareableContentAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLFetchShareableContentAction;
  v5 = [(SLShareableContentAction *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_requestedTypeIdentifier);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    requestedTypeIdentifier = v5->_requestedTypeIdentifier;
    v5->_requestedTypeIdentifier = (NSString *)v8;

    v10 = NSStringFromSelector(sel_requestedItemProviderIndex);
    v5->_uint64_t requestedItemProviderIndex = [v4 decodeIntegerForKey:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SLFetchShareableContentAction *)self requestedTypeIdentifier];
  uint64_t v6 = NSStringFromSelector(sel_requestedTypeIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(SLFetchShareableContentAction *)self requestedItemProviderIndex];
  uint64_t v8 = NSStringFromSelector(sel_requestedItemProviderIndex);
  [v4 encodeInteger:v7 forKey:v8];

  v9.receiver = self;
  v9.super_class = (Class)SLFetchShareableContentAction;
  [(SLShareableContentAction *)&v9 encodeWithCoder:v4];
}

- (void).cxx_destruct
{
}

@end