@interface _UIPhysicalButtonMutableConfigurationSet
+ (id)new;
- (_UIPhysicalButtonMutableConfigurationSet)init;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_setConfiguration:(id)a3 forButton:(unint64_t)a4;
- (void)_unionWithConfigurationSet:(id)a3;
@end

@implementation _UIPhysicalButtonMutableConfigurationSet

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [_UIPhysicalButtonConfigurationSet alloc];
  v5 = (void *)[(NSMutableDictionary *)self->super._configurationsByButton copy];
  v6 = -[_UIPhysicalButtonConfigurationSet _initWithConfigurationsDictionary:](v4, v5);

  return v6;
}

- (void)_setConfiguration:(id)a3 forButton:(unint64_t)a4
{
  ++self->_mutationDetector;
  id v13 = 0;
  char v8 = -[_UIPhysicalButtonConfigurationSet _validateRequirementsForCandidateButton:andConfiguration:allowingNilRequiredConfiguration:withOutErrorMessage:](self, a4, a3, 1, &v13);
  id v9 = v13;
  if (v8)
  {
    configurationsByButton = self->super._configurationsByButton;
    if (a3)
    {
      v11 = (void *)[a3 copy];
      v12 = [NSNumber numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)configurationsByButton setObject:v11 forKey:v12];
    }
    else
    {
      v11 = [NSNumber numberWithUnsignedInteger:a4];
      [(NSMutableDictionary *)configurationsByButton removeObjectForKey:v11];
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIPhysicalButtonConfiguration.m", 1236, @"Invalid button and configuration pair for reason: %@", v9 object file lineNumber description];
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[_UIPhysicalButtonConfigurationSet _countByEnumeratingWithState:objects:count:mutationPointer:](self, &a3->var0, (unint64_t)a4, a5, (unint64_t)&self->_mutationDetector);
}

- (_UIPhysicalButtonMutableConfigurationSet)init
{
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UIPhysicalButtonConfiguration.m" lineNumber:1220 description:@"_UIPhysicalButtonMutableConfigurationSet cannot be subclassed"];
  }
  return (_UIPhysicalButtonMutableConfigurationSet *)-[_UIPhysicalButtonConfigurationSet _initWithConfigurationsDictionary:](self, 0);
}

+ (id)new
{
  return objc_alloc_init(_UIPhysicalButtonMutableConfigurationSet);
}

- (void)_unionWithConfigurationSet:(id)a3
{
  if (self)
  {
    if (a3)
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __87___UIPhysicalButtonMutableConfigurationSet__unionWithConfigurationSet_acceptanceBlock___block_invoke;
      v3[3] = &unk_1E5311160;
      v3[4] = self;
      v3[5] = a3;
      v3[6] = 0;
      _UIPhysicalButtonEnumerateAllButtonsWithBlock((uint64_t)v3);
    }
  }
}

@end