@interface SHEntitlements
- (BOOL)BOOLValueOfEntitlement:(id)a3 fromConnection:(id)a4;
- (BOOL)BOOLValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4;
- (BOOL)entitlementArray:(id)a3 containsEntitlementValue:(id)a4 fromConnection:(id)a5;
- (BOOL)entitlementArray:(id)a3 containsEntitlementValue:(id)a4 fromSecTask:(__SecTask *)a5;
- (BOOL)hasRequiredEntitlements:(id)a3;
- (BOOL)isEntitledForInternalClient;
- (BOOL)isEntitledForMicrophone;
- (BOOL)isEntitledForStorefront;
- (BOOL)tccBoolValueOfEntitlement:(id)a3 fromConnection:(id)a4;
- (SHEntitlements)init;
- (SHEntitlements)initWithConnection:(id)a3;
- (void)configureEntitlementsForConnection:(id)a3;
- (void)configureEntitlementsForTask:(__SecTask *)a3;
- (void)copyValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4;
- (void)setIsEntitledForStorefront:(BOOL)a3;
@end

@implementation SHEntitlements

- (SHEntitlements)init
{
  v5.receiver = self;
  v5.super_class = (Class)SHEntitlements;
  v2 = [(SHEntitlements *)&v5 init];
  if (v2)
  {
    SecTaskRef v3 = SecTaskCreateFromSelf(0);
    [(SHEntitlements *)v2 configureEntitlementsForTask:v3];
    CFRelease(v3);
  }
  return v2;
}

- (SHEntitlements)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SHEntitlements;
  objc_super v5 = [(SHEntitlements *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SHEntitlements *)v5 configureEntitlementsForConnection:v4];
  }

  return v6;
}

- (void)configureEntitlementsForTask:(__SecTask *)a3
{
  self->_isEntitledForStorefront = [(SHEntitlements *)self entitlementArray:@"com.apple.private.tcc.allow" containsEntitlementValue:@"kTCCServiceMediaLibrary" fromSecTask:a3];
  self->_isEntitledForMicrophone = [(SHEntitlements *)self entitlementArray:@"com.apple.private.tcc.allow" containsEntitlementValue:@"kTCCServiceMicrophone" fromSecTask:a3];
  self->_isEntitledForInternalClient = [(SHEntitlements *)self BOOLValueOfEntitlement:@"com.apple.private.ShazamKit" fromSecTask:a3];
}

- (void)configureEntitlementsForConnection:(id)a3
{
  id v5 = a3;
  self->_isEntitledForStorefront = [(SHEntitlements *)self entitlementArray:@"com.apple.private.tcc.allow" containsEntitlementValue:@"kTCCServiceMediaLibrary" fromConnection:v5];
  BOOL v4 = [(SHEntitlements *)self entitlementArray:@"com.apple.private.tcc.allow" containsEntitlementValue:@"kTCCServiceMicrophone" fromConnection:v5]|| [(SHEntitlements *)self tccBoolValueOfEntitlement:@"kTCCServiceMicrophone" fromConnection:v5];
  self->_isEntitledForMicrophone = v4;
  self->_isEntitledForInternalClient = [(SHEntitlements *)self BOOLValueOfEntitlement:@"com.apple.private.ShazamKit" fromConnection:v5];
}

- (BOOL)hasRequiredEntitlements:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  if ([(SHEntitlements *)self isEntitledForStorefront]) {
    [v5 addObject:@"kTCCServiceMediaLibrary"];
  }
  if ([(SHEntitlements *)self isEntitledForMicrophone]) {
    [v5 addObject:@"kTCCServiceMicrophone"];
  }
  if ([(SHEntitlements *)self isEntitledForInternalClient]) {
    [v5 addObject:@"com.apple.private.ShazamKit"];
  }
  v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
  char v7 = [v6 isSubsetOfSet:v5];

  return v7;
}

- (BOOL)BOOLValueOfEntitlement:(id)a3 fromConnection:(id)a4
{
  id v4 = [a4 valueForEntitlement:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)entitlementArray:(id)a3 containsEntitlementValue:(id)a4 fromConnection:(id)a5
{
  id v7 = a4;
  objc_super v8 = [a5 valueForEntitlement:a3];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v9 = [v8 containsObject:v7];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)tccBoolValueOfEntitlement:(id)a3 fromConnection:(id)a4
{
  id v5 = a3;
  if (a4) {
    [a4 auditToken];
  }
  BOOL v6 = tcc_authorization_check_audit_token() == 2;

  return v6;
}

- (void)copyValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CFErrorRef error = 0;
  CFTypeRef v4 = SecTaskCopyValueForEntitlement(a4, (CFStringRef)a3, &error);
  if (error)
  {
    id v5 = shcore_log_object();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v9 = error;
      _os_log_impl(&dword_226D94000, v5, OS_LOG_TYPE_ERROR, "Client does not have entitlement: %@", buf, 0xCu);
    }

    CFRelease(error);
  }
  return (void *)v4;
}

- (BOOL)BOOLValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  CFBooleanRef v4 = [(SHEntitlements *)self copyValueOfEntitlement:a3 fromSecTask:a4];
  if (!v4) {
    return 0;
  }
  CFBooleanRef v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
  CFRelease(v5);
  return v7;
}

- (BOOL)entitlementArray:(id)a3 containsEntitlementValue:(id)a4 fromSecTask:(__SecTask *)a5
{
  id v8 = a4;
  CFErrorRef v9 = [(SHEntitlements *)self copyValueOfEntitlement:a3 fromSecTask:a5];
  if (v9)
  {
    uint64_t v10 = v9;
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 == CFArrayGetTypeID()) {
      char v12 = [v10 containsObject:v8];
    }
    else {
      char v12 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)isEntitledForStorefront
{
  return self->_isEntitledForStorefront;
}

- (void)setIsEntitledForStorefront:(BOOL)a3
{
  self->_isEntitledForStorefront = a3;
}

- (BOOL)isEntitledForMicrophone
{
  return self->_isEntitledForMicrophone;
}

- (BOOL)isEntitledForInternalClient
{
  return self->_isEntitledForInternalClient;
}

@end