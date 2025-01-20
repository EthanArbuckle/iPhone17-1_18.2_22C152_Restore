@interface UIKBArbiterClientFocusContext
+ (BOOL)supportsSecureCoding;
+ (id)focusContextForSceneIdentity:(id)a3 contextID:(unsigned int)a4;
+ (id)focusContextForSceneIdentity:(id)a3 window:(id)a4;
- (BOOL)isEqual:(id)a3;
- (FBSSceneIdentityToken)layeringSceneIdentity;
- (FBSSceneIdentityToken)sceneIdentity;
- (UIKBArbiterClientFocusContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)contextID;
- (void)encodeWithCoder:(id)a3;
- (void)setContextID:(unsigned int)a3;
- (void)setLayeringSceneIdentity:(id)a3;
- (void)setSceneIdentity:(id)a3;
@end

@implementation UIKBArbiterClientFocusContext

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  if ([(UIKBArbiterClientFocusContext *)self contextID]) {
    objc_msgSend(v3, "appendFormat:", @"; contextID = %x",
  }
      [(UIKBArbiterClientFocusContext *)self contextID]);
  v4 = [(UIKBArbiterClientFocusContext *)self sceneIdentity];

  if (v4)
  {
    v5 = [(UIKBArbiterClientFocusContext *)self sceneIdentity];
    [v3 appendFormat:@"; sceneIdentity = %@", v5];
  }
  v6 = [(UIKBArbiterClientFocusContext *)self layeringSceneIdentity];

  if (v6)
  {
    v7 = [(UIKBArbiterClientFocusContext *)self layeringSceneIdentity];
    [v3 appendFormat:@"; layeringSceneIdentity = %@", v7];
  }
  [v3 appendString:@" >"];
  return v3;
}

- (FBSSceneIdentityToken)sceneIdentity
{
  return self->_sceneIdentity;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (FBSSceneIdentityToken)layeringSceneIdentity
{
  return self->_layeringSceneIdentity;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)focusContextForSceneIdentity:(id)a3 window:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(UIKBArbiterClientFocusContext);
  [(UIKBArbiterClientFocusContext *)v7 setSceneIdentity:v6];

  if (v5) {
    uint64_t v8 = [v5 _contextId];
  }
  else {
    uint64_t v8 = 0;
  }
  [(UIKBArbiterClientFocusContext *)v7 setContextID:v8];
  v9 = [v5 windowScene];
  v10 = [v9 keyboardSceneDelegate];
  v11 = [v10 responder];

  if (objc_opt_respondsToSelector())
  {
    v12 = [v11 _layeringSceneIdentity];
    [(UIKBArbiterClientFocusContext *)v7 setLayeringSceneIdentity:v12];
  }
  return v7;
}

- (void)setSceneIdentity:(id)a3
{
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (void)setLayeringSceneIdentity:(id)a3
{
}

- (UIKBArbiterClientFocusContext)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v11.receiver = self;
  v11.super_class = (Class)UIKBArbiterClientFocusContext;
  id v5 = [(UIKBArbiterClientFocusContext *)&v11 init];
  if (v5)
  {
    v5->_contextID = [v4 decodeInt32ForKey:@"ctxId"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneId"];
    sceneIdentity = v5->_sceneIdentity;
    v5->_sceneIdentity = (FBSSceneIdentityToken *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layeringSceneId"];
    layeringSceneIdentity = v5->_layeringSceneIdentity;
    v5->_layeringSceneIdentity = (FBSSceneIdentityToken *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if (([v8 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  uint64_t contextID = self->_contextID;
  if (contextID) {
    [v8 encodeInt32:contextID forKey:@"ctxId"];
  }
  sceneIdentity = self->_sceneIdentity;
  uint64_t v6 = v8;
  if (sceneIdentity)
  {
    [v8 encodeObject:sceneIdentity forKey:@"sceneId"];
    uint64_t v6 = v8;
  }
  layeringSceneIdentity = self->_layeringSceneIdentity;
  if (layeringSceneIdentity)
  {
    [v8 encodeObject:layeringSceneIdentity forKey:@"layeringSceneId"];
    uint64_t v6 = v8;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layeringSceneIdentity, 0);
  objc_storeStrong((id *)&self->_sceneIdentity, 0);
}

+ (id)focusContextForSceneIdentity:(id)a3 contextID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(UIKBArbiterClientFocusContext);
  [(UIKBArbiterClientFocusContext *)v6 setSceneIdentity:v5];

  [(UIKBArbiterClientFocusContext *)v6 setContextID:v4];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[UIKBArbiterClientFocusContext allocWithZone:a3] init];
  v4->_uint64_t contextID = self->_contextID;
  uint64_t v5 = [(FBSSceneIdentityToken *)self->_sceneIdentity copy];
  sceneIdentity = v4->_sceneIdentity;
  v4->_sceneIdentity = (FBSSceneIdentityToken *)v5;

  uint64_t v7 = [(FBSSceneIdentityToken *)self->_layeringSceneIdentity copy];
  layeringSceneIdentity = v4->_layeringSceneIdentity;
  v4->_layeringSceneIdentity = (FBSSceneIdentityToken *)v7;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (UIKBArbiterClientFocusContext *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unsigned int v6 = [(UIKBArbiterClientFocusContext *)self contextID];
      if (v6 == [(UIKBArbiterClientFocusContext *)v5 contextID]
        && ([(UIKBArbiterClientFocusContext *)self sceneIdentity],
            uint64_t v7 = objc_claimAutoreleasedReturnValue(),
            [(UIKBArbiterClientFocusContext *)v5 sceneIdentity],
            id v8 = objc_claimAutoreleasedReturnValue(),
            int v9 = [v7 isEqual:v8],
            v8,
            v7,
            v9))
      {
        v10 = [(UIKBArbiterClientFocusContext *)self layeringSceneIdentity];
        objc_super v11 = [(UIKBArbiterClientFocusContext *)v5 layeringSceneIdentity];
        char v12 = [v10 isEqual:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

@end