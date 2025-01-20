@interface SSKDisplayDriverRecord
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (FBSDisplayIdentity)displayIdentity;
- (NSString)description;
- (NSString)state;
- (SSKDisplayAssertion)assertion;
- (SSKDisplayControlling)controller;
- (SSKDisplayDriverRecord)initWithProfile:(id)a3;
- (SSKDisplayDriverRecord)initWithProfile:(id)a3 rootDisplay:(id)a4;
- (SSKDisplayProfile)profile;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)associateController:(id)a3 assertion:(id)a4;
- (void)associateDisplay:(id)a3;
- (void)dissociateFromController;
@end

@implementation SSKDisplayDriverRecord

- (SSKDisplayDriverRecord)initWithProfile:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SSKDisplayDriverRecord.m", 22, @"Invalid parameter not satisfying: %@", @"profile" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SSKDisplayDriverRecord;
  v7 = [(SSKDisplayDriverRecord *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_profile, a3);
    v8->_dissociated = 0;
  }

  return v8;
}

- (SSKDisplayDriverRecord)initWithProfile:(id)a3 rootDisplay:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v8 isRootIdentity] & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SSKDisplayDriverRecord.m", 31, @"Invalid parameter not satisfying: %@", @"[rootDisplay isRootIdentity]" object file lineNumber description];
  }
  v9 = [(SSKDisplayDriverRecord *)self initWithProfile:v7];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_displayIdentity, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  return [(SSKDisplayProfile *)self->_profile hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:self ofExpectedClass:objc_opt_class()];
  profile = self->_profile;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__SSKDisplayDriverRecord_isEqual___block_invoke;
  v10[3] = &unk_2654B16E0;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:profile counterpart:v10];
  LOBYTE(profile) = [v5 isEqual];

  return (char)profile;
}

id __34__SSKDisplayDriverRecord_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (void)associateDisplay:(id)a3
{
  v5 = (FBSDisplayIdentity *)a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SSKDisplayDriverRecord.m", 56, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];
  }
  if (self->_displayIdentity)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SSKDisplayDriverRecord.m", 57, @"can't call twice. first: %@; second: %@",
      self->_displayIdentity,
      v5);
  }
  if (self->_controller)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SSKDisplayDriverRecord.m", 58, @"associating display after controller. %@", self->_controller object file lineNumber description];
  }
  displayIdentity = self->_displayIdentity;
  self->_displayIdentity = v5;
}

- (void)associateController:(id)a3 assertion:(id)a4
{
  id v7 = (SSKDisplayControlling *)a3;
  id v8 = (SSKDisplayAssertion *)a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SSKDisplayDriverRecord.m", 66, @"Invalid parameter not satisfying: %@", @"controller" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x263F08690] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"SSKDisplayDriverRecord.m", 67, @"Invalid parameter not satisfying: %@", @"assertion" object file lineNumber description];

LABEL_3:
  if (self->_controller)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SSKDisplayDriverRecord.m", 68, @"can't call twice.\nfirst: %@\nsecond: %@", self->_controller, v7 object file lineNumber description];
  }
  if (!self->_displayIdentity)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SSKDisplayDriverRecord.m", 69, @"associating controller before display. %@", v7 object file lineNumber description];
  }
  controller = self->_controller;
  self->_controller = v7;
  v16 = v7;

  assertion = self->_assertion;
  self->_assertion = v9;
}

- (void)dissociateFromController
{
  if (self->_dissociated)
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SSKDisplayDriverRecord.m" lineNumber:75 description:@"can't call twice."];
  }
  if (!self->_controller)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SSKDisplayDriverRecord.m" lineNumber:76 description:@"no controller to dissociate from"];
  }
  self->_dissociated = 1;
}

- (BOOL)isValid
{
  return !self->_dissociated;
}

- (NSString)state
{
  if (!self->_displayIdentity) {
    return (NSString *)@".ProfileAdded";
  }
  if (!self->_controller) {
    return (NSString *)@".DisplayTransformed";
  }
  if (self->_dissociated) {
    return (NSString *)@".AwaitingDisconnect";
  }
  return (NSString *)@".DisplayConnected";
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x263F29C48] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __55__SSKDisplayDriverRecord_appendDescriptionToFormatter___block_invoke;
  v13 = &unk_2654B15F8;
  id v5 = v4;
  id v14 = v5;
  v15 = self;
  [v5 appendProem:self block:&v10];
  id v6 = (id)objc_msgSend(v5, "appendObject:withName:", self->_profile, 0, v10, v11, v12, v13);
  id v7 = (id)[v5 appendObject:self->_displayIdentity withName:0];
  controller = self->_controller;
  if (controller)
  {
    [v5 appendProem:controller block:&__block_literal_global_0];
    id v9 = (id)[v5 appendBool:self->_dissociated withName:@"dissociated" ifEqualTo:1];
  }
}

void __55__SSKDisplayDriverRecord_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) state];
  [v1 appendString:v2 withName:0];
}

- (SSKDisplayProfile)profile
{
  return self->_profile;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (SSKDisplayControlling)controller
{
  return self->_controller;
}

- (SSKDisplayAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end