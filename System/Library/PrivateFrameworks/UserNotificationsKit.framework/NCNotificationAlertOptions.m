@interface NCNotificationAlertOptions
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSuppress;
- (NCNotificationAlertOptions)initWithNotificationAlertOptions:(id)a3;
- (NSString)debugDescription;
- (NSUUID)activeModeUUID;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)intelligentBehavior;
- (unint64_t)reason;
- (unint64_t)suppression;
@end

@implementation NCNotificationAlertOptions

- (NCNotificationAlertOptions)initWithNotificationAlertOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationAlertOptions;
  v5 = [(NCNotificationAlertOptions *)&v10 init];
  if (v5)
  {
    v5->_suppression = [v4 suppression];
    v5->_intelligentBehavior = [v4 intelligentBehavior];
    v5->_reason = [v4 reason];
    v6 = [v4 activeModeUUID];
    uint64_t v7 = [v6 copy];
    activeModeUUID = v5->_activeModeUUID;
    v5->_activeModeUUID = (NSUUID *)v7;
  }
  return v5;
}

- (BOOL)shouldSuppress
{
  return [(NCNotificationAlertOptions *)self suppression] != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = 0;
LABEL_9:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  id v5 = v4;
  if (!v5) {
    goto LABEL_9;
  }
  unint64_t v6 = [(NCNotificationAlertOptions *)self suppression];
  if (v6 != [v5 suppression]) {
    goto LABEL_9;
  }
  unint64_t v7 = [(NCNotificationAlertOptions *)self intelligentBehavior];
  if (v7 != [v5 intelligentBehavior]) {
    goto LABEL_9;
  }
  unint64_t v8 = [(NCNotificationAlertOptions *)self reason];
  if (v8 != [v5 reason]) {
    goto LABEL_9;
  }
  v9 = [(NCNotificationAlertOptions *)self activeModeUUID];
  objc_super v10 = [v5 activeModeUUID];
  char v11 = NCIsEqual(v9, v10);

LABEL_10:
  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NCNotificationAlertOptions *)self suppression];
  unint64_t v4 = [(NCNotificationAlertOptions *)self intelligentBehavior] ^ v3;
  unint64_t v5 = v4 ^ [(NCNotificationAlertOptions *)self reason];
  unint64_t v6 = [(NCNotificationAlertOptions *)self activeModeUUID];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationAlertOptions *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [NCMutableNotificationAlertOptions alloc];

  return [(NCNotificationAlertOptions *)v4 initWithNotificationAlertOptions:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(NCNotificationAlertOptions *)self descriptionBuilderWithMultilinePrefix:a3];
  unint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  unint64_t v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__NCNotificationAlertOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_264559E60;
  id v7 = v6;
  id v11 = v7;
  v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __68__NCNotificationAlertOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) suppression];
  if (v3 > 2) {
    unint64_t v4 = @"<invalid>";
  }
  else {
    unint64_t v4 = off_264559FB0[v3];
  }
  [v2 appendString:v4 withName:@"suppression"];
  id v5 = *(void **)(a1 + 32);
  unint64_t v6 = [*(id *)(a1 + 40) intelligentBehavior];
  if (v6 > 3) {
    id v7 = 0;
  }
  else {
    id v7 = off_264559FC8[v6];
  }
  [v5 appendString:v7 withName:@"intelligentBehavior"];
  id v8 = *(void **)(a1 + 32);
  unint64_t v9 = [*(id *)(a1 + 40) reason];
  if (v9 > 4) {
    objc_super v10 = @"<invalid>";
  }
  else {
    objc_super v10 = off_264559FE8[v9];
  }
  [v8 appendString:v10 withName:@"reason"];
  id v11 = *(void **)(a1 + 32);
  id v13 = [*(id *)(a1 + 40) activeModeUUID];
  id v12 = (id)[v11 appendObject:v13 withName:@"activeModeUUID" skipIfNil:1];
}

- (id)succinctDescription
{
  v2 = [(NCNotificationAlertOptions *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (unint64_t)suppression
{
  return self->_suppression;
}

- (unint64_t)intelligentBehavior
{
  return self->_intelligentBehavior;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSUUID)activeModeUUID
{
  return self->_activeModeUUID;
}

- (void).cxx_destruct
{
}

@end