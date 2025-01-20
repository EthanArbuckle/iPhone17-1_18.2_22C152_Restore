@interface SSMutableSoftwareUpdatesContext
- (SSMutableSoftwareUpdatesContext)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setForced:(BOOL)a3;
- (void)setSoftwareTypes:(id)a3;
@end

@implementation SSMutableSoftwareUpdatesContext

- (void)setClientIdentifierHeader:(id)a3
{
  clientIdentifierHeader = self->super._clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->super._clientIdentifierHeader = (NSString *)[a3 copy];
  }
}

- (void)setForced:(BOOL)a3
{
  self->super._forced = a3;
}

- (void)setSoftwareTypes:(id)a3
{
  softwareTypes = self->super._softwareTypes;
  if (softwareTypes != a3)
  {

    self->super._softwareTypes = (NSArray *)[a3 copy];
  }
}

- (id)copyXPCEncoding
{
  v3.receiver = self;
  v3.super_class = (Class)SSMutableSoftwareUpdatesContext;
  return [(SSSoftwareUpdatesContext *)&v3 copyXPCEncoding];
}

- (SSMutableSoftwareUpdatesContext)initWithXPCEncoding:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SSMutableSoftwareUpdatesContext;
  return [(SSSoftwareUpdatesContext *)&v4 initWithXPCEncoding:a3];
}

@end