@interface SBSRemoteAlertPresentationTarget
+ (BOOL)supportsSecureCoding;
- (BOOL)requiresFullscreenPresentation;
- (BOOL)shouldDismissInSwitcher;
- (BOOL)shouldDismissOnUILock;
- (BSProcessHandle)targetProcess;
- (NSString)description;
- (NSString)scenePersistentIdentifier;
- (SBSRemoteAlertPresentationTarget)initWithCoder:(id)a3;
- (SBSRemoteAlertPresentationTarget)initWithTargetPredicate:(id)a3;
- (SBSRemoteAlertPresentationTarget)initWithTargetProcess:(id)a3;
- (SBSRemoteAlertPresentationTarget)initWithXPCDictionary:(id)a3;
- (SBSRemoteAlertPresentationTargetPredicate)targetPredicate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setRequiresFullscreenPresentation:(BOOL)a3;
- (void)setScenePersistentIdentifier:(id)a3;
- (void)setShouldDismissInSwitcher:(BOOL)a3;
- (void)setShouldDismissOnUILock:(BOOL)a3;
@end

@implementation SBSRemoteAlertPresentationTarget

- (SBSRemoteAlertPresentationTarget)initWithTargetProcess:(id)a3
{
  v4 = +[SBSRemoteAlertPresentationTargetPredicate predicateForProcess:a3];
  v5 = [(SBSRemoteAlertPresentationTarget *)self initWithTargetPredicate:v4];

  return v5;
}

- (SBSRemoteAlertPresentationTarget)initWithTargetPredicate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSRemoteAlertPresentationTarget;
  v6 = [(SBSRemoteAlertPresentationTarget *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_targetPredicate, a3);
    v7->_shouldDismissInSwitcher = 1;
  }

  return v7;
}

- (SBSRemoteAlertPresentationTarget)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  if (v5
    && (self = [(SBSRemoteAlertPresentationTarget *)self initWithTargetPredicate:v5]) != 0)
  {
    [(SBSRemoteAlertPresentationTarget *)self setShouldDismissOnUILock:xpc_dictionary_get_BOOL(v4, "shouldDismissOnUILock")];
    [(SBSRemoteAlertPresentationTarget *)self setShouldDismissInSwitcher:xpc_dictionary_get_BOOL(v4, "shouldDismissInSwitcher")];
    [(SBSRemoteAlertPresentationTarget *)self setRequiresFullscreenPresentation:xpc_dictionary_get_BOOL(v4, "requiresFullscreenPresentation")];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "shouldDismissOnUILock", self->_shouldDismissOnUILock);
  xpc_dictionary_set_BOOL(xdict, "shouldDismissInSwitcher", self->_shouldDismissInSwitcher);
  xpc_dictionary_set_BOOL(xdict, "requiresFullscreenPresentation", self->_requiresFullscreenPresentation);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBSRemoteAlertPresentationTarget)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v11);
    v10, @"An %@ can only be decoded with an instance of NSXPCCoder; attempting to decode with %@",
      v5,
      v6);
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  id v5 = v4;
  v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"targetPredicate"];
  if (!v6) {
    goto LABEL_6;
  }
  self = [(SBSRemoteAlertPresentationTarget *)self initWithTargetPredicate:v6];
  if (!self) {
    goto LABEL_6;
  }
  -[SBSRemoteAlertPresentationTarget setShouldDismissOnUILock:](self, "setShouldDismissOnUILock:", [v5 decodeBoolForKey:@"shouldDismissOnUILock"]);
  -[SBSRemoteAlertPresentationTarget setShouldDismissInSwitcher:](self, "setShouldDismissInSwitcher:", [v5 decodeBoolForKey:@"shouldDismissInSwitcher"]);
  -[SBSRemoteAlertPresentationTarget setRequiresFullscreenPresentation:](self, "setRequiresFullscreenPresentation:", [v5 decodeBoolForKey:@"requiresFullscreenPresentation"]);
  v7 = self;
LABEL_7:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v12;
    id v5 = v4;
    targetPredicate = self->_targetPredicate;
    if (targetPredicate) {
      [v4 encodeObject:targetPredicate forKey:@"targetPredicate"];
    }
    [v5 encodeBool:self->_shouldDismissOnUILock forKey:@"shouldDismissOnUILock"];
    [v5 encodeBool:self->_shouldDismissInSwitcher forKey:@"shouldDismissInSwitcher"];
    [v5 encodeBool:self->_requiresFullscreenPresentation forKey:@"requiresFullscreenPresentation"];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v9);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v9, [v10 class]);
      v5,
      v11);
  }
}

- (BSProcessHandle)targetProcess
{
  return [(SBSRemoteAlertPresentationTargetPredicate *)self->_targetPredicate process];
}

- (NSString)scenePersistentIdentifier
{
  return [(SBSRemoteAlertPresentationTargetPredicate *)self->_targetPredicate scenePersistentIdentifier];
}

- (void)setScenePersistentIdentifier:(id)a3
{
}

- (NSString)description
{
  return (NSString *)[(SBSRemoteAlertPresentationTarget *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSRemoteAlertPresentationTarget *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSRemoteAlertPresentationTarget *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBSRemoteAlertPresentationTarget *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_targetPredicate withName:0];
  id v6 = (id)[v4 appendBool:self->_shouldDismissOnUILock withName:@"shouldDismissOnUILock"];
  id v7 = (id)[v4 appendBool:self->_shouldDismissInSwitcher withName:@"shouldDismissInSwitcher"];
  id v8 = (id)[v4 appendBool:self->_requiresFullscreenPresentation withName:@"requiresFullscreenPresentation"];
  return v4;
}

- (SBSRemoteAlertPresentationTargetPredicate)targetPredicate
{
  return self->_targetPredicate;
}

- (BOOL)shouldDismissOnUILock
{
  return self->_shouldDismissOnUILock;
}

- (void)setShouldDismissOnUILock:(BOOL)a3
{
  self->_shouldDismissOnUILock = a3;
}

- (BOOL)shouldDismissInSwitcher
{
  return self->_shouldDismissInSwitcher;
}

- (void)setShouldDismissInSwitcher:(BOOL)a3
{
  self->_shouldDismissInSwitcher = a3;
}

- (BOOL)requiresFullscreenPresentation
{
  return self->_requiresFullscreenPresentation;
}

- (void)setRequiresFullscreenPresentation:(BOOL)a3
{
  self->_requiresFullscreenPresentation = a3;
}

- (void).cxx_destruct
{
}

@end