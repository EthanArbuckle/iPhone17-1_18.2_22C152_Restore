@interface RBMutableLaunchdProperties
- (RBMutableLaunchdProperties)initWithProperties:(id)a3;
- (void)setDoesOverrideManagement:(BOOL)a3;
- (void)setExecutablePath:(id)a3;
- (void)setHostPid:(int)a3;
- (void)setIsAngel;
- (void)setIsDaemon;
- (void)setJobLabel:(id)a3;
- (void)setMultiInstance:(BOOL)a3;
- (void)setOverrideManageFlags:(unsigned __int8)a3;
- (void)setPath:(id)a3;
- (void)setSpecifiedIdentity:(id)a3;
- (void)setUnderlyingAssertion:(id)a3;
- (void)setVariableEUID:(BOOL)a3;
@end

@implementation RBMutableLaunchdProperties

- (RBMutableLaunchdProperties)initWithProperties:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RBMutableLaunchdProperties;
  v5 = [(RBMutableLaunchdProperties *)&v16 init];
  v6 = v5;
  if (v4 && v5)
  {
    v5->super._type = *((void *)v4 + 1);
    v5->super._multiInstance = *((unsigned char *)v4 + 28);
    v5->super._variableEUID = *((unsigned char *)v4 + 29);
    v5->super._doesOverrideManagement = *((unsigned char *)v4 + 48);
    v5->super._overrideManageFlags = *((unsigned char *)v4 + 30);
    uint64_t v7 = [*((id *)v4 + 4) copy];
    jobLabel = v6->super._jobLabel;
    v6->super._jobLabel = (NSString *)v7;

    uint64_t v9 = [*((id *)v4 + 5) copy];
    executablePath = v6->super._executablePath;
    v6->super._executablePath = (NSString *)v9;

    uint64_t v11 = [*((id *)v4 + 2) copy];
    path = v6->super._path;
    v6->super._path = (NSString *)v11;

    v6->super._hostPid = *((_DWORD *)v4 + 6);
    uint64_t v13 = [*((id *)v4 + 7) copy];
    underlyingAssertion = v6->super._underlyingAssertion;
    v6->super._underlyingAssertion = (NSString *)v13;

    objc_storeStrong((id *)&v6->super._specifiedIdentity, *((id *)v4 + 8));
  }

  return v6;
}

- (void)setMultiInstance:(BOOL)a3
{
  self->super._multiInstance = a3;
}

- (void)setVariableEUID:(BOOL)a3
{
  self->super._variableEUID = a3;
}

- (void)setDoesOverrideManagement:(BOOL)a3
{
  self->super._doesOverrideManagement = a3;
}

- (void)setOverrideManageFlags:(unsigned __int8)a3
{
  self->super._overrideManageFlags = a3;
}

- (void)setJobLabel:(id)a3
{
  self->super._jobLabel = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setExecutablePath:(id)a3
{
  self->super._executablePath = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setPath:(id)a3
{
  self->super._path = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setHostPid:(int)a3
{
  self->super._hostPid = a3;
}

- (void)setUnderlyingAssertion:(id)a3
{
  self->super._underlyingAssertion = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setSpecifiedIdentity:(id)a3
{
}

- (void)setIsDaemon
{
  self->super._type = 2;
}

- (void)setIsAngel
{
  self->super._type = 4;
}

@end