@interface UIDraggingSystemSessionInfo
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsSystemDrag;
- (NSString)persistentSceneIdentifier;
- (UIDraggingSystemSessionInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)processIdentifier;
- (unint64_t)hash;
- (unsigned)sessionIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAuditToken:(id *)a3;
- (void)setPersistentSceneIdentifier:(id)a3;
- (void)setProcessIdentifier:(int)a3;
- (void)setSessionIdentifier:(unsigned int)a3;
- (void)setSupportsSystemDrag:(BOOL)a3;
@end

@implementation UIDraggingSystemSessionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDraggingSystemSessionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIDraggingSystemSessionInfo;
  v5 = [(UIDraggingSystemSessionInfo *)&v13 init];
  if (v5)
  {
    v5->_sessionIdentifier = [v4 decodeInt32ForKey:@"sessionIdentifier"];
    v5->_processIdentifier = [v4 decodeInt32ForKey:@"processIdentifier"];
    v5->_supportsSystemDrag = [v4 decodeBoolForKey:@"supportsSystemDrag"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];
    long long v11 = 0u;
    long long v12 = 0u;
    [v6 getValue:&v11 size:32];
    long long v7 = v12;
    *(_OWORD *)v5->_auditToken.val = v11;
    *(_OWORD *)&v5->_auditToken.val[4] = v7;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persistentSceneIdentifier"];
    persistentSceneIdentifier = v5->_persistentSceneIdentifier;
    v5->_persistentSceneIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t sessionIdentifier = self->_sessionIdentifier;
  id v5 = a3;
  [v5 encodeInt32:sessionIdentifier forKey:@"sessionIdentifier"];
  [v5 encodeInt32:self->_processIdentifier forKey:@"processIdentifier"];
  [v5 encodeBool:self->_supportsSystemDrag forKey:@"supportsSystemDrag"];
  [MEMORY[0x1E4F29238] value:&self->_auditToken withObjCType:"{?=[8I]}"];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"auditToken"];
  [v5 encodeObject:self->_persistentSceneIdentifier forKey:@"persistentSceneIdentifier"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p: sessionIdentifier=%i processIdentifier=%i supportsSystemDrag=%d sceneIdentifier=%@>", objc_opt_class(), self, self->_sessionIdentifier, self->_processIdentifier, self->_supportsSystemDrag, self->_persistentSceneIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int v6 = [(UIDraggingSystemSessionInfo *)self sessionIdentifier];
    int v7 = [v5 sessionIdentifier];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_sessionIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setSessionIdentifier:", -[UIDraggingSystemSessionInfo sessionIdentifier](self, "sessionIdentifier"));
  objc_msgSend(v4, "setProcessIdentifier:", -[UIDraggingSystemSessionInfo processIdentifier](self, "processIdentifier"));
  objc_msgSend(v4, "setSupportsSystemDrag:", -[UIDraggingSystemSessionInfo supportsSystemDrag](self, "supportsSystemDrag"));
  return v4;
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(unsigned int)a3
{
  self->_uint64_t sessionIdentifier = a3;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[1].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = v3;
}

- (BOOL)supportsSystemDrag
{
  return self->_supportsSystemDrag;
}

- (void)setSupportsSystemDrag:(BOOL)a3
{
  self->_supportsSystemDrag = a3;
}

- (NSString)persistentSceneIdentifier
{
  return self->_persistentSceneIdentifier;
}

- (void)setPersistentSceneIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end