@interface ULBGSystemTaskRequest
- (BOOL)postInstall;
- (BOOL)requiresBuddyComplete;
- (BOOL)requiresUserInactivity;
- (BOOL)resourceIntensive;
- (NSString)identifier;
- (ULBGSystemTaskRequest)initWithIdentifier:(id)a3;
- (id)createRequestFromSelf;
- (int64_t)priority;
- (int64_t)requiresProtectionClass;
- (int64_t)resources;
- (void)setIdentifier:(id)a3;
- (void)setPostInstall:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
- (void)setRequiresBuddyComplete:(BOOL)a3;
- (void)setRequiresProtectionClass:(int64_t)a3;
- (void)setRequiresUserInactivity:(BOOL)a3;
- (void)setResourceIntensive:(BOOL)a3;
- (void)setResources:(int64_t)a3;
@end

@implementation ULBGSystemTaskRequest

- (ULBGSystemTaskRequest)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ULBGSystemTaskRequest;
  v5 = [(ULBGSystemTaskRequest *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ULBGSystemTaskRequest *)v5 setIdentifier:v4];
  }

  return v6;
}

- (id)createRequestFromSelf
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)requiresProtectionClass
{
  return self->_requiresProtectionClass;
}

- (void)setRequiresProtectionClass:(int64_t)a3
{
  self->_requiresProtectionClass = a3;
}

- (BOOL)resourceIntensive
{
  return self->_resourceIntensive;
}

- (void)setResourceIntensive:(BOOL)a3
{
  self->_resourceIntensive = a3;
}

- (int64_t)resources
{
  return self->_resources;
}

- (void)setResources:(int64_t)a3
{
  self->_resources = a3;
}

- (BOOL)requiresBuddyComplete
{
  return self->_requiresBuddyComplete;
}

- (void)setRequiresBuddyComplete:(BOOL)a3
{
  self->_requiresBuddyComplete = a3;
}

- (BOOL)requiresUserInactivity
{
  return self->_requiresUserInactivity;
}

- (void)setRequiresUserInactivity:(BOOL)a3
{
  self->_requiresUserInactivity = a3;
}

- (BOOL)postInstall
{
  return self->_postInstall;
}

- (void)setPostInstall:(BOOL)a3
{
  self->_postInstall = a3;
}

- (void).cxx_destruct
{
}

@end