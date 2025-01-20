@interface SSDownloadPolicyApplicationState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSSet)applicationStates;
- (NSString)applicationIdentifier;
- (SSDownloadPolicyApplicationState)initWithApplicationIdentifier:(id)a3;
- (SSDownloadPolicyApplicationState)initWithCoder:(id)a3;
- (SSDownloadPolicyApplicationState)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (unint64_t)hash;
- (void)addApplicationState:(int64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setApplicationStates:(id)a3;
- (void)setNotRunningApplicationStates;
@end

@implementation SSDownloadPolicyApplicationState

- (SSDownloadPolicyApplicationState)initWithApplicationIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSDownloadPolicyApplicationState;
  v4 = [(SSDownloadPolicyApplicationState *)&v7 init];
  v5 = v4;
  if (v4) {
    [(SSDownloadPolicyApplicationState *)v4 setApplicationIdentifier:a3];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadPolicyApplicationState;
  [(SSDownloadPolicyApplicationState *)&v3 dealloc];
}

- (void)addApplicationState:(int64_t)a3
{
  applicationStates = self->_applicationStates;
  if (applicationStates)
  {
    id v7 = (id)[(NSSet *)applicationStates mutableCopy];
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", a3));

    self->_applicationStates = (NSSet *)[v7 copy];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    self->_applicationStates = (NSSet *)objc_msgSend(v6, "initWithObjects:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", a3), 0);
  }
}

- (void)setNotRunningApplicationStates
{
  id v3 = (id)[(NSSet *)self->_applicationStates mutableCopy];
  if (!v3) {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  id v6 = v3;
  for (uint64_t i = 0; i != 5; ++i)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInteger:dword_1A52F6520[i]];
    [v6 addObject:v5];
  }
  self->_applicationStates = (NSSet *)[v6 copy];
}

- (unint64_t)hash
{
  return [(NSString *)self->_applicationIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = [(SSDownloadPolicyApplicationState *)self applicationIdentifier];
    if (v7 == (NSString *)[a3 applicationIdentifier]
      || (BOOL v6 = -[NSString isEqualToString:](-[SSDownloadPolicyApplicationState applicationIdentifier](self, "applicationIdentifier"), "isEqualToString:", [a3 applicationIdentifier])))
    {
      v8 = [(SSDownloadPolicyApplicationState *)self applicationStates];
      if (v8 == (NSSet *)[a3 applicationStates])
      {
        LOBYTE(v6) = 1;
      }
      else
      {
        v9 = [(SSDownloadPolicyApplicationState *)self applicationStates];
        uint64_t v10 = [a3 applicationStates];
        LOBYTE(v6) = [(NSSet *)v9 isEqualToSet:v10];
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_applicationIdentifier forKey:@"appid"];
  uint64_t v5 = [(NSSet *)self->_applicationStates allObjects];
  [a3 encodeObject:v5 forKey:@"appsts"];
}

- (SSDownloadPolicyApplicationState)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SSDownloadPolicyApplicationState;
  v4 = [(SSDownloadPolicyApplicationState *)&v10 init];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"appsts");
    v4->_applicationIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"appid"];
    if (v7) {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v7];
    }
    else {
      uint64_t v8 = 0;
    }
    v4->_applicationStates = (NSSet *)v8;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(NSString *)self->_applicationIdentifier copyWithZone:a3];
  v5[2] = [(NSSet *)self->_applicationStates copyWithZone:a3];
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_applicationIdentifier);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)[(NSSet *)self->_applicationStates allObjects]);
  return v3;
}

- (SSDownloadPolicyApplicationState)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v9.receiver = self;
    v9.super_class = (Class)SSDownloadPolicyApplicationState;
    uint64_t v5 = [(SSDownloadPolicyApplicationState *)&v9 init];
    if (v5)
    {
      objc_opt_class();
      CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
      objc_opt_class();
      v5->_applicationIdentifier = (NSString *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      if (v7) {
        uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v7];
      }
      else {
        uint64_t v8 = 0;
      }
      v5->_applicationStates = (NSSet *)v8;
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSSet)applicationStates
{
  return self->_applicationStates;
}

- (void)setApplicationStates:(id)a3
{
}

@end