@interface SLShareableContentLoadResult
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (SLShareableContentLoadResult)resultWithData:(id)a3 archivedObjectClass:(Class)a4 urlWrapper:(id)a5 wasOpenedInPlace:(BOOL)a6 error:(id)a7;
+ (SLShareableContentLoadResult)resultWithError:(id)a3;
- (BOOL)wasOpenedInPlace;
- (Class)archivedObjectClass;
- (NSData)data;
- (NSError)error;
- (NSString)archivedObjectClassName;
- (SLSecurityScopedURL)urlWrapper;
- (SLShareableContentLoadResult)initWithBSXPCCoder:(id)a3;
- (SLShareableContentLoadResult)initWithCoder:(id)a3;
- (SLShareableContentLoadResult)initWithWithData:(id)a3 archivedObjectClassName:(id)a4 urlWrapper:(id)a5 wasOpenedInPlace:(BOOL)a6 error:(id)a7;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SLShareableContentLoadResult

- (SLShareableContentLoadResult)initWithWithData:(id)a3 archivedObjectClassName:(id)a4 urlWrapper:(id)a5 wasOpenedInPlace:(BOOL)a6 error:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SLShareableContentLoadResult;
  v17 = [(SLShareableContentLoadResult *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_data, a3);
    objc_storeStrong((id *)&v18->_archivedObjectClassName, a4);
    objc_storeStrong((id *)&v18->_urlWrapper, a5);
    v18->_wasOpenedInPlace = a6;
    objc_storeStrong((id *)&v18->_error, a7);
  }

  return v18;
}

+ (SLShareableContentLoadResult)resultWithData:(id)a3 archivedObjectClass:(Class)a4 urlWrapper:(id)a5 wasOpenedInPlace:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = objc_alloc((Class)a1);
  id v16 = v15;
  if (a4)
  {
    v17 = NSStringFromClass(a4);
    v18 = (void *)[v16 initWithWithData:v12 archivedObjectClassName:v17 urlWrapper:v13 wasOpenedInPlace:v8 error:v14];
  }
  else
  {
    v18 = (void *)[v15 initWithWithData:v12 archivedObjectClassName:0 urlWrapper:v13 wasOpenedInPlace:v8 error:v14];
  }

  return (SLShareableContentLoadResult *)v18;
}

+ (SLShareableContentLoadResult)resultWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithWithData:0 archivedObjectClassName:0 urlWrapper:0 wasOpenedInPlace:0 error:v4];

  return (SLShareableContentLoadResult *)v5;
}

- (Class)archivedObjectClass
{
  v2 = [(SLShareableContentLoadResult *)self archivedObjectClassName];
  v3 = v2;
  if (v2)
  {
    if (SLShareableContentIsArchivedObjectClassNameAllowed_onceToken != -1) {
      dispatch_once(&SLShareableContentIsArchivedObjectClassNameAllowed_onceToken, &__block_literal_global_9);
    }
    if ([(id)SLShareableContentIsArchivedObjectClassNameAllowed_allowedArchivedObjectClassNames containsObject:v3])v2 = (NSString *)NSClassFromString(v3); {
    else
    }
      v2 = 0;
  }
  id v4 = v2;

  return v4;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLShareableContentLoadResult)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_data);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_archivedObjectClass);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  id v12 = NSStringFromSelector(sel_urlWrapper);
  id v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  id v14 = NSStringFromSelector(sel_wasOpenedInPlace);
  uint64_t v15 = [v4 decodeBoolForKey:v14];

  uint64_t v16 = objc_opt_class();
  v17 = NSStringFromSelector(sel_error);
  v18 = [v4 decodeObjectOfClass:v16 forKey:v17];

  v19 = [(SLShareableContentLoadResult *)self initWithWithData:v7 archivedObjectClassName:v10 urlWrapper:v13 wasOpenedInPlace:v15 error:v18];
  return v19;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLShareableContentLoadResult *)self data];
  v6 = NSStringFromSelector(sel_data);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(SLShareableContentLoadResult *)self archivedObjectClassName];
  uint64_t v8 = NSStringFromSelector(sel_archivedObjectClassName);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(SLShareableContentLoadResult *)self urlWrapper];
  v10 = NSStringFromSelector(sel_urlWrapper);
  [v4 encodeObject:v9 forKey:v10];

  BOOL v11 = [(SLShareableContentLoadResult *)self wasOpenedInPlace];
  id v12 = NSStringFromSelector(sel_wasOpenedInPlace);
  [v4 encodeBool:v11 forKey:v12];

  id v14 = [(SLShareableContentLoadResult *)self error];
  id v13 = NSStringFromSelector(sel_error);
  [v4 encodeObject:v14 forKey:v13];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLShareableContentLoadResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_data);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_archivedObjectClass);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  id v12 = NSStringFromSelector(sel_urlWrapper);
  id v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  id v14 = NSStringFromSelector(sel_wasOpenedInPlace);
  uint64_t v15 = [v4 decodeBoolForKey:v14];

  uint64_t v16 = objc_opt_class();
  v17 = NSStringFromSelector(sel_error);
  v18 = [v4 decodeObjectOfClass:v16 forKey:v17];

  v19 = [(SLShareableContentLoadResult *)self initWithWithData:v7 archivedObjectClassName:v10 urlWrapper:v13 wasOpenedInPlace:v15 error:v18];
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLShareableContentLoadResult *)self data];
  v6 = NSStringFromSelector(sel_data);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(SLShareableContentLoadResult *)self archivedObjectClassName];
  uint64_t v8 = NSStringFromSelector(sel_archivedObjectClassName);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(SLShareableContentLoadResult *)self urlWrapper];
  v10 = NSStringFromSelector(sel_urlWrapper);
  [v4 encodeObject:v9 forKey:v10];

  BOOL v11 = [(SLShareableContentLoadResult *)self wasOpenedInPlace];
  id v12 = NSStringFromSelector(sel_wasOpenedInPlace);
  [v4 encodeBool:v11 forKey:v12];

  id v14 = [(SLShareableContentLoadResult *)self error];
  id v13 = NSStringFromSelector(sel_error);
  [v4 encodeObject:v14 forKey:v13];
}

- (NSData)data
{
  return self->_data;
}

- (SLSecurityScopedURL)urlWrapper
{
  return self->_urlWrapper;
}

- (BOOL)wasOpenedInPlace
{
  return self->_wasOpenedInPlace;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)archivedObjectClassName
{
  return self->_archivedObjectClassName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivedObjectClassName, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_urlWrapper, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end