@interface SBFPhysicalButtonTarget
+ (id)targetWithPhysicalButton:(unint64_t)a3 generation:(unint64_t)a4 auditToken:(id)a5;
+ (id)targetWithPhysicalButton:(unint64_t)a3 generation:(unint64_t)a4 auditToken:(id)a5 identifier:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (BSAuditToken)auditToken;
- (NSString)description;
- (id)_initWithPhysicalButton:(void *)a3 generation:(void *)a4 auditToken:(void *)a5 identifier:;
- (unint64_t)button;
- (unint64_t)generation;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation SBFPhysicalButtonTarget

id __53__SBFPhysicalButtonTarget_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = _NSStringFromUIPhysicalButton();
  [v2 appendString:v3 withName:0];

  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendVersionedPID:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "versionedPID"), @"vpid");
  id result = (id)[*(id *)(a1 + 32) appendUInt64:*(void *)(*(void *)(a1 + 40) + 16) withName:@"generation"];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 32);
  if (v6) {
    return (id)[*(id *)(a1 + 32) appendUnsignedInteger:v6 withName:@"id"];
  }
  return result;
}

- (unint64_t)button
{
  return self->_button;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

+ (id)targetWithPhysicalButton:(unint64_t)a3 generation:(unint64_t)a4 auditToken:(id)a5
{
  return (id)[a1 targetWithPhysicalButton:a3 generation:a4 auditToken:a5 identifier:0];
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F728] collectionLineBreakNoneStyle];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SBFPhysicalButtonTarget_appendDescriptionToStream___block_invoke;
  v7[3] = &unk_1E548CBA0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v6 overlayStyle:v5 block:v7];
}

+ (id)targetWithPhysicalButton:(unint64_t)a3 generation:(unint64_t)a4 auditToken:(id)a5 identifier:(unint64_t)a6
{
  id v10 = a5;
  v11 = -[SBFPhysicalButtonTarget _initWithPhysicalButton:generation:auditToken:identifier:]((id *)objc_alloc((Class)a1), (void *)a3, (void *)a4, v10, (void *)a6);

  return v11;
}

- (id)_initWithPhysicalButton:(void *)a3 generation:(void *)a4 auditToken:(void *)a5 identifier:
{
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)SBFPhysicalButtonTarget;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      v11[1] = a2;
      v11[2] = a3;
      v11[4] = a5;
      objc_storeStrong(v11 + 3, a4);
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBFPhysicalButtonTarget *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      id v8 = v7;
      if (self->_button == v7->_button && self->_generation == v7->_generation && self->_identifier == v7->_identifier) {
        char v9 = BSEqualObjects();
      }
      else {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_generation ^ self->_button ^ self->_identifier;
  return v2 ^ [(BSAuditToken *)self->_auditToken hash];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (unint64_t)generation
{
  return self->_generation;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
}

@end