@interface SSSoftwareUpdatesContext
- (BOOL)isForced;
- (NSArray)softwareTypes;
- (NSString)clientIdentifierHeader;
- (SSSoftwareUpdatesContext)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation SSSoftwareUpdatesContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSSoftwareUpdatesContext;
  [(SSSoftwareUpdatesContext *)&v3 dealloc];
}

- (NSArray)softwareTypes
{
  result = self->_softwareTypes;
  if (!result)
  {
    result = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"newsstand", @"regular", 0);
    self->_softwareTypes = result;
  }
  return result;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, "0", self->_forced);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)[(SSSoftwareUpdatesContext *)self softwareTypes]);
  return v3;
}

- (SSSoftwareUpdatesContext)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSSoftwareUpdatesContext;
    v5 = [(SSSoftwareUpdatesContext *)&v7 init];
    if (v5)
    {
      v5->_forced = xpc_dictionary_get_BOOL(a3, "0");
      objc_opt_class();
      v5->_softwareTypes = (NSArray *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[SSSoftwareUpdatesContext allocWithZone:](SSSoftwareUpdatesContext, "allocWithZone:") init];
  v5->_clientIdentifierHeader = (NSString *)[(NSString *)self->_clientIdentifierHeader copyWithZone:a3];
  v5->_forced = self->_forced;
  v5->_softwareTypes = (NSArray *)[(NSArray *)self->_softwareTypes copyWithZone:a3];
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [+[SSMutableSoftwareUpdatesContext allocWithZone:](SSMutableSoftwareUpdatesContext, "allocWithZone:") init];
  v5->super._clientIdentifierHeader = (NSString *)[(NSString *)self->_clientIdentifierHeader copyWithZone:a3];
  v5->super._forced = self->_forced;
  v5->super._softwareTypes = (NSArray *)[(NSArray *)self->_softwareTypes copyWithZone:a3];
  return v5;
}

- (NSString)clientIdentifierHeader
{
  return self->_clientIdentifierHeader;
}

- (BOOL)isForced
{
  return self->_forced;
}

@end