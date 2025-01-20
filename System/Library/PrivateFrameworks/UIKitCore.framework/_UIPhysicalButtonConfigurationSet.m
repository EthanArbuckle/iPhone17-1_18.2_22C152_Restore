@interface _UIPhysicalButtonConfigurationSet
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)_configurationSetFromNSSet:(uint64_t)a1;
- (BOOL)_isFull;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (_UIPhysicalButtonConfigurationSet)init;
- (_UIPhysicalButtonConfigurationSet)initWithBSXPCCoder:(id)a3;
- (_UIPhysicalButtonConfigurationSet)initWithCoder:(id)a3;
- (_UIPhysicalButtonConfigurationSet)initWithXPCDictionary:(id)a3;
- (id)_configurationForButton:(unint64_t)a3;
- (id)_configurationPassingTest:(id)a3;
- (id)_nsSetRepresentation;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)_validateRequirementsForCandidateButton:(void *)a3 andConfiguration:(char)a4 allowingNilRequiredConfiguration:(void *)a5 withOutErrorMessage:;
- (unint64_t)_count;
- (unint64_t)_countByEnumeratingWithState:(unint64_t)a3 objects:(unint64_t)a4 count:(unint64_t)a5 mutationPointer:;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_enumerateConfigurationsWithBlock:(id)a3;
- (void)_initWithConfigurationsDictionary:(void *)a1;
- (void)_validateButtonRequirements;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation _UIPhysicalButtonConfigurationSet

- (_UIPhysicalButtonConfigurationSet)initWithBSXPCCoder:(id)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__246;
  v13 = __Block_byref_object_dispose__246;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56___UIPhysicalButtonConfigurationSet_initWithBSXPCCoder___block_invoke;
  v8[3] = &unk_1E5311138;
  v8[5] = &v9;
  v8[6] = v5;
  v8[4] = a3;
  _UIPhysicalButtonEnumerateAllButtonsWithBlock((uint64_t)v8);
  v6 = (_UIPhysicalButtonConfigurationSet *)-[_UIPhysicalButtonConfigurationSet _initWithConfigurationsDictionary:](self, (void *)v10[5]);
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (id)_configurationSetFromNSSet:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  id v19 = 0;
  char IsMostlyValid = _UIPhysicalButtonConfigurationNSSetIsMostlyValid(a2, &v19);
  id v5 = v19;
  if (IsMostlyValid)
  {
    uint64_t v6 = objc_opt_new();
    v7 = (unsigned char *)v6;
    if (v6) {
      *(unsigned char *)(v6 + 16) = 1;
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = a2;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "_setConfiguration:forButton:", *(void *)(*((void *)&v15 + 1) + 8 * i), objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "_button"));
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }

    if (v7) {
      v7[16] = 0;
    }
    -[_UIPhysicalButtonConfigurationSet _validateButtonRequirements](v7);
    v13 = (void *)[v7 copy];
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__configurationSetFromNSSet_, v3, @"_UIPhysicalButtonConfiguration.m", 762, @"Invalid configurations set for reason: %@; set: %@",
      v5,
      a2);
    v13 = 0;
  }

  return v13;
}

- (void)_initWithConfigurationsDictionary:(void *)a1
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v3 = a1;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class() || v4 == objc_opt_class())
  {
    if (a2)
    {
LABEL_5:
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v5 = a2;
      uint64_t v37 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v37)
      {
        uint64_t v6 = 0;
        uint64_t v38 = *(void *)v44;
        v35 = v3;
        v36 = a2;
        while (2)
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v44 != v38) {
              objc_enumerationMutation(v5);
            }
            id v8 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            uint64_t v9 = [v8 unsignedIntegerValue];
            uint64_t v10 = [v5 objectForKey:v8];
            if ((_UIPhysicalButtonIsValid(v9) & 1) == 0)
            {
              objc_msgSend(NSString, "stringWithFormat:", @"Invalid dictionary key button value: %lu; configuration: %@",
                v9,
                v10);
              id v22 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_30;
            }
            int IsValid = _UIPhysicalButtonIsValid(v9);
            if (v10)
            {
              uint64_t v39 = [v10 _button];
              uint64_t v12 = [v10 _button];
              uint64_t v13 = [v10 _behavior];
              int v14 = _UIPhysicalButtonIsValid(v12);
              int IsValidForButton = _UIPhysicalButtonBehaviorIsValidForButton(v13, v12);
              long long v16 = [v10 _behaviorOptions];
              BOOL IsValidForBehavior = _UIPhysicalButtonBehaviorOptionsIsValidForBehavior(v16, v13);

              if (v39 == v9) {
                int v18 = v14;
              }
              else {
                int v18 = 0;
              }
              int v19 = v18 & IsValidForButton & IsValidForBehavior;
            }
            else
            {
              int v19 = 1;
            }
            if ((IsValid & v19 & 1) == 0)
            {
              v23 = NSString;
              v24 = _NSStringFromUIPhysicalButton(v9);
              [v23 stringWithFormat:@"Invalid configuration for %@: %@", v24, v10];
              goto LABEL_29;
            }
            if ((unint64_t)(v9 - 1) >= 5) {
              uint64_t v20 = 0;
            }
            else {
              uint64_t v20 = 1 << v9;
            }
            if ((v20 & ~v6) == 0)
            {
              v25 = NSString;
              v24 = _NSStringFromUIPhysicalButton(v9);
              [v25 stringWithFormat:@"Configuration dictionary contains more than one %@ button", v24, v34];
LABEL_29:
              id v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_30:
              id v21 = v22;
              v26 = [MEMORY[0x1E4F28B00] currentHandler];
              uint64_t v3 = v35;
              objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithConfigurationsDictionary_, v35, @"_UIPhysicalButtonConfiguration.m", 799, @"Invalid configurations dictionary for reason: %@; dictionary: %@",
                v21,
                v5);

              a2 = v36;
              goto LABEL_31;
            }
            v6 |= v20;
          }
          uint64_t v3 = v35;
          a2 = v36;
          uint64_t v37 = [v5 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v37) {
            continue;
          }
          break;
        }
      }
    }
  }
  else
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:sel__initWithConfigurationsDictionary_ object:v3 file:@"_UIPhysicalButtonConfiguration.m" lineNumber:795 description:@"_UIPhysicalButtonConfigurationSet cannot be subclassed"];

    if (a2) {
      goto LABEL_5;
    }
  }
  id v21 = 0;
LABEL_31:
  v42.receiver = v3;
  v42.super_class = (Class)_UIPhysicalButtonConfigurationSet;
  v27 = objc_msgSendSuper2(&v42, sel_init);
  if (v27)
  {
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
    v29 = (void *)v27[1];
    v27[1] = v28;

    if (a2)
    {
      if ([a2 count])
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __71___UIPhysicalButtonConfigurationSet__initWithConfigurationsDictionary___block_invoke;
        v40[3] = &unk_1E52DADC0;
        v40[4] = a2;
        v30 = v27;
        id v41 = v30;
        _UIPhysicalButtonEnumerateAllButtonsWithBlock((uint64_t)v40);
        -[_UIPhysicalButtonConfigurationSet _validateButtonRequirements](v30);
      }
    }
  }
  v31 = v27;

  return v31;
}

- (uint64_t)_validateRequirementsForCandidateButton:(void *)a3 andConfiguration:(char)a4 allowingNilRequiredConfiguration:(void *)a5 withOutErrorMessage:
{
  if (!a1) {
    return 0;
  }
  int IsValid = _UIPhysicalButtonIsValid(a2);
  if (a3)
  {
    uint64_t v10 = [a3 _button];
    uint64_t v11 = [a3 _button];
    uint64_t v12 = [a3 _behavior];
    uint64_t v13 = a5;
    int v14 = _UIPhysicalButtonIsValid(v11);
    int IsValidForButton = _UIPhysicalButtonBehaviorIsValidForButton(v12, v11);
    long long v16 = [a3 _behaviorOptions];
    BOOL IsValidForBehavior = _UIPhysicalButtonBehaviorOptionsIsValidForBehavior(v16, v12);

    if (v10 == a2) {
      int v18 = v14;
    }
    else {
      int v18 = 0;
    }
    a5 = v13;
    int v19 = v18 & IsValidForButton & IsValidForBehavior;
  }
  else
  {
    int v19 = 1;
  }
  if ((IsValid & v19 & 1) == 0)
  {
    if (a5)
    {
      id v21 = NSString;
      id v22 = _NSStringFromUIPhysicalButton(a2);
      *a5 = [v21 stringWithFormat:@"Invalid configuration for %@: %@", v22, a3];
    }
    return 0;
  }
  if (a1[16]) {
    return 1;
  }
  v23 = _UIPhysicalButtonRequiredButtonsForButton(a2);
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__246;
  v40 = __Block_byref_object_dispose__246;
  id v41 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __147___UIPhysicalButtonConfigurationSet__validateRequirementsForCandidateButton_andConfiguration_allowingNilRequiredConfiguration_withOutErrorMessage___block_invoke;
  aBlock[3] = &unk_1E5311098;
  char v35 = a4;
  aBlock[4] = a1;
  aBlock[5] = a3;
  aBlock[6] = &v36;
  aBlock[7] = a2;
  v24 = _Block_copy(aBlock);
  v25 = v24;
  if (v23)
  {
    uint64_t v20 = (*((unsigned int (**)(void *, void *))v24 + 2))(v24, v23) ^ 1;
    if (a5) {
      char v26 = v20;
    }
    else {
      char v26 = 1;
    }
    if ((v26 & 1) == 0)
    {
      v27 = NSString;
      uint64_t v28 = [a1 succinctDescription];
      v29 = _NSStringFromUIPhysicalButton(a2);
      v30 = [a3 succinctDescription];
      v31 = [(id)v37[5] succinctDescription];
      objc_msgSend(v27, "stringWithFormat:", @"The candidate button configuration is not valid as its behavior differs from an existing configuration of a required button: self: %@; candidateButton: %@; candidateConfiguration: %@; configurationWithFailingRequirement: %@",
        v28,
        v29,
        v30,
        v31);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v20 = 1;
  }

  _Block_object_dispose(&v36, 8);
  return v20;
}

- (unint64_t)_countByEnumeratingWithState:(unint64_t)a3 objects:(unint64_t)a4 count:(unint64_t)a5 mutationPointer:
{
  if (!a1) {
    return 0;
  }
  unint64_t v9 = *a2;
  if (!*a2) {
    a2[2] = a5;
  }
  uint64_t v10 = _UIPhysicalButtonAllAvailableButtons();
  unint64_t v11 = [v10 count];
  if (v9 >= v11)
  {
    unint64_t v13 = 0;
  }
  else
  {
    int v19 = a2;
    a2[1] = a3;
    if (a4)
    {
      unint64_t v12 = v11;
      unint64_t v13 = 0;
      unint64_t v14 = v9;
      do
      {
        long long v15 = [v10 objectAtIndexedSubscript:v14];
        uint64_t v16 = [v15 unsignedIntegerValue];

        long long v17 = [a1 _configurationForButton:v16];
        if (v17) {
          *(void *)(a3 + 8 * v13++) = v17;
        }

        ++v14;
      }
      while (v14 < v12 && v13 < a4);
    }
    else
    {
      unint64_t v13 = 0;
    }
    *int v19 = v13 + v9;
  }

  return v13;
}

- (id)_configurationForButton:(unint64_t)a3
{
  configurationsByButton = self->_configurationsByButton;
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  id v5 = [(NSMutableDictionary *)configurationsByButton objectForKey:v4];

  return v5;
}

- (void)_validateButtonRequirements
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v1 = a1;
    uint64_t v2 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      id v4 = 0;
      uint64_t v5 = *(void *)v14;
      while (2)
      {
        uint64_t v6 = 0;
        v7 = v4;
        do
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v1);
          }
          id v8 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
          unint64_t v9 = [v8 _button];
          id v12 = v7;
          int v10 = -[_UIPhysicalButtonConfigurationSet _validateRequirementsForCandidateButton:andConfiguration:allowingNilRequiredConfiguration:withOutErrorMessage:](v1, v9, v8, 0, &v12);
          id v4 = v12;

          if (!v10)
          {

            unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
            [v11 handleFailureInMethod:sel__validateButtonRequirements, v1, @"_UIPhysicalButtonConfiguration.m", 912, @"Invalid for reason: %@", v4 object file lineNumber description];
            v1 = v11;
            goto LABEL_12;
          }
          ++v6;
          v7 = v4;
        }
        while (v3 != v6);
        uint64_t v3 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v3) {
          continue;
        }
        break;
      }
LABEL_12:
    }
    else
    {
      id v4 = v1;
    }
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[_UIPhysicalButtonConfigurationSet _countByEnumeratingWithState:objects:count:mutationPointer:](self, &a3->var0, (unint64_t)a4, a5, (unint64_t)&countByEnumeratingWithState_objects_count__mutations);
}

- (BOOL)_isFull
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 8) count];
  uint64_t v2 = _UIPhysicalButtonAllAvailableButtons();
  BOOL v3 = v1 == [v2 count];

  return v3;
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3 || !_NSIsNSObject()) {
    return 0;
  }
  uint64_t v5 = a3;
  uint64_t v6 = objc_opt_class();
  if ((v6 == objc_opt_class() || (uint64_t v7 = objc_opt_class(), v7 == objc_opt_class()))
    && (unint64_t v8 = -[_UIPhysicalButtonConfigurationSet hash](self, "hash"), v8 == [v5 hash]))
  {
    configurationsByButton = self->_configurationsByButton;
    int v10 = (void *)v5[1];
    unint64_t v11 = configurationsByButton;
    id v12 = v10;
    long long v13 = v12;
    if (v11 == v12)
    {
      char v14 = 1;
    }
    else
    {
      char v14 = 0;
      if (v11 && v12) {
        char v14 = [(NSMutableDictionary *)v11 isEqual:v12];
      }
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)_count
{
  return [(NSMutableDictionary *)self->_configurationsByButton count];
}

- (unint64_t)hash
{
  BOOL v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_configurationsByButton];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58___UIPhysicalButtonConfigurationSet_encodeWithBSXPCCoder___block_invoke;
  v3[3] = &unk_1E53110C0;
  v3[4] = a3;
  [(_UIPhysicalButtonConfigurationSet *)self _enumerateConfigurationsWithBlock:v3];
}

- (void)_enumerateConfigurationsWithBlock:(id)a3
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  char v5 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71___UIPhysicalButtonConfigurationSet__enumerateConfigurationsWithBlock___block_invoke;
  v3[3] = &unk_1E53110E8;
  v3[4] = self;
  void v3[5] = a3;
  v3[6] = v4;
  _UIPhysicalButtonEnumerateAllButtonsWithBlock((uint64_t)v3);
  _Block_object_dispose(v4, 8);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_UIPhysicalButtonConfigurationSet)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIPhysicalButtonConfiguration.m", 788, @"%s: init is not allowed on %@", "-[_UIPhysicalButtonConfigurationSet init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)_nsSetRepresentation
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = (void *)a1[1];
    if (v2 && [v2 count])
    {
      BOOL v3 = objc_opt_new();
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __57___UIPhysicalButtonConfigurationSet__nsSetRepresentation__block_invoke;
      v6[3] = &unk_1E53110C0;
      id v7 = v3;
      id v4 = v3;
      [v1 _enumerateConfigurationsWithBlock:v6];
      id v1 = (id)[v4 copy];
    }
    else
    {
      id v1 = (id)objc_opt_new();
    }
  }
  return v1;
}

- (id)_configurationPassingTest:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unint64_t v9 = __Block_byref_object_copy__246;
  int v10 = __Block_byref_object_dispose__246;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63___UIPhysicalButtonConfigurationSet__configurationPassingTest___block_invoke;
  v5[3] = &unk_1E5311110;
  v5[4] = a3;
  v5[5] = &v6;
  [(_UIPhysicalButtonConfigurationSet *)self _enumerateConfigurationsWithBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIPhysicalButtonConfigurationSet *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(_UIPhysicalButtonConfigurationSet *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = _UIPhysicalButtonSuccinctConfigurationsDescriptionForSet(self);
  id v5 = (id)[v3 appendObject:v4 withName:@"configurations"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(_UIPhysicalButtonConfigurationSet *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(_UIPhysicalButtonConfigurationSet *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  if (!self
    || (configurationsByButton = self->_configurationsByButton) != 0
    && [(NSMutableDictionary *)configurationsByButton count])
  {
    uint64_t v6 = [MEMORY[0x1E4F4F718] builderWithObject:self];
    [v6 setActiveMultilinePrefix:a3];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75___UIPhysicalButtonConfigurationSet_descriptionBuilderWithMultilinePrefix___block_invoke;
    v10[3] = &unk_1E52D9F98;
    id v7 = v6;
    id v11 = v7;
    id v12 = self;
    id v8 = (id)[v7 modifyBody:v10];
  }
  else
  {
    id v7 = [(_UIPhysicalButtonConfigurationSet *)self succinctDescriptionBuilder];
  }
  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [_UIPhysicalButtonMutableConfigurationSet alloc];
  id v5 = (void *)[(NSMutableDictionary *)self->_configurationsByButton copy];
  uint64_t v6 = -[_UIPhysicalButtonConfigurationSet _initWithConfigurationsDictionary:](v4, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53___UIPhysicalButtonConfigurationSet_encodeWithCoder___block_invoke;
  v3[3] = &unk_1E53110C0;
  v3[4] = a3;
  [(_UIPhysicalButtonConfigurationSet *)self _enumerateConfigurationsWithBlock:v3];
}

- (_UIPhysicalButtonConfigurationSet)initWithCoder:(id)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__246;
  long long v13 = __Block_byref_object_dispose__246;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___UIPhysicalButtonConfigurationSet_initWithCoder___block_invoke;
  v8[3] = &unk_1E5311138;
  v8[5] = &v9;
  v8[6] = v5;
  v8[4] = a3;
  _UIPhysicalButtonEnumerateAllButtonsWithBlock((uint64_t)v8);
  uint64_t v6 = (_UIPhysicalButtonConfigurationSet *)-[_UIPhysicalButtonConfigurationSet _initWithConfigurationsDictionary:](self, (void *)v10[5]);
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61___UIPhysicalButtonConfigurationSet_encodeWithXPCDictionary___block_invoke;
  v3[3] = &unk_1E53110C0;
  v3[4] = a3;
  [(_UIPhysicalButtonConfigurationSet *)self _enumerateConfigurationsWithBlock:v3];
}

- (_UIPhysicalButtonConfigurationSet)initWithXPCDictionary:(id)a3
{
  objc_opt_class();
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__246;
  id v12 = __Block_byref_object_dispose__246;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59___UIPhysicalButtonConfigurationSet_initWithXPCDictionary___block_invoke;
  v7[3] = &unk_1E52E08B0;
  v7[4] = a3;
  v7[5] = &v8;
  _UIPhysicalButtonEnumerateAllButtonsWithBlock((uint64_t)v7);
  uint64_t v5 = (_UIPhysicalButtonConfigurationSet *)-[_UIPhysicalButtonConfigurationSet _initWithConfigurationsDictionary:](self, (void *)v9[5]);
  _Block_object_dispose(&v8, 8);

  return v5;
}

@end