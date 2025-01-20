@interface RBAssertionDescriptorValidatorContext
+ (id)context;
- (BOOL)ignoreRestrictions;
- (BOOL)targetIsSystem;
- (NSDictionary)savedEndowments;
- (RBAssertionAcquisitionContext)acquisitionContext;
- (RBAssertionDescriptorValidator)assertionDescriptionValidator;
- (RBBundleProperties)originatorProperties;
- (RBBundleProperties)targetProperties;
- (RBBundlePropertiesManaging)bundlePropertiesManager;
- (RBConcreteTargeting)target;
- (RBDomainAttributeManaging)domainAttributeManager;
- (RBEntitlementManaging)entitlementManager;
- (RBEntitlementPossessing)originatorEntitlements;
- (RBEntitlementPossessing)targetEntitlements;
- (RBProcess)originatorProcess;
- (RBProcess)targetProcess;
- (RBProcessState)originatorState;
- (RBProcessState)targetState;
- (RBSAssertionDescriptor)assertionDescriptor;
- (RBSProcessIdentifier)targetIdentifier;
- (RBSProcessIdentity)originatorIdentity;
- (RBSProcessIdentity)targetIdentity;
- (RBSystemState)systemState;
- (id)copyWithZone:(_NSZone *)a3;
- (void)popIgnoreRestrictions;
- (void)pushIgnoreRestrictions;
- (void)setAcquisitionContext:(id)a3;
- (void)setAssertionDescriptionValidator:(id)a3;
- (void)setAssertionDescriptor:(id)a3;
- (void)setBundlePropertiesManager:(id)a3;
- (void)setDomainAttributeManager:(id)a3;
- (void)setEntitlementManager:(id)a3;
- (void)setOriginatorEntitlements:(id)a3;
- (void)setOriginatorProcess:(id)a3;
- (void)setOriginatorState:(id)a3;
- (void)setSavedEndowments:(id)a3;
- (void)setSystemState:(id)a3;
- (void)setTarget:(id)a3;
- (void)setTargetEntitlements:(id)a3;
- (void)setTargetIdentifier:(id)a3;
- (void)setTargetIdentity:(id)a3;
- (void)setTargetProcess:(id)a3;
- (void)setTargetProperties:(id)a3;
- (void)setTargetState:(id)a3;
@end

@implementation RBAssertionDescriptorValidatorContext

- (RBBundleProperties)targetProperties
{
  if (!self->_targetProperties)
  {
    targetIdentity = self->_targetIdentity;
    if (targetIdentity)
    {
      v4 = [(RBBundlePropertiesManaging *)self->_bundlePropertiesManager propertiesForIdentity:targetIdentity identifier:self->_targetIdentifier];
    }
    else
    {
      v4 = objc_alloc_init(RBBundleProperties);
    }
    targetProperties = self->_targetProperties;
    self->_targetProperties = v4;
  }
  v6 = self->_targetProperties;
  return v6;
}

- (RBSystemState)systemState
{
  return self->_systemState;
}

- (RBDomainAttributeManaging)domainAttributeManager
{
  return self->_domainAttributeManager;
}

- (void)setTargetState:(id)a3
{
}

- (void)setTargetProcess:(id)a3
{
}

- (void)setTargetIdentity:(id)a3
{
}

- (void)setTargetIdentifier:(id)a3
{
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
  id v5 = a3;
  char v6 = [v5 isSystem];

  self->_targetIsSystem = v6;
}

- (void)setSystemState:(id)a3
{
}

- (void)setSavedEndowments:(id)a3
{
}

- (void)setOriginatorState:(id)a3
{
}

- (void)setOriginatorProcess:(id)a3
{
}

- (void)setEntitlementManager:(id)a3
{
}

- (void)setDomainAttributeManager:(id)a3
{
}

- (void)setBundlePropertiesManager:(id)a3
{
}

- (void)setAssertionDescriptor:(id)a3
{
}

- (void)setAcquisitionContext:(id)a3
{
}

+ (id)context
{
  v2 = objc_alloc_init(RBAssertionDescriptorValidatorContext);
  return v2;
}

- (RBSAssertionDescriptor)assertionDescriptor
{
  return self->_assertionDescriptor;
}

- (void)setAssertionDescriptionValidator:(id)a3
{
}

- (RBEntitlementManaging)entitlementManager
{
  if ([(RBAssertionDescriptorValidatorContext *)self ignoreRestrictions]) {
    v3 = objc_alloc_init(RBIgnoreAllEntitlementsManager);
  }
  else {
    v3 = self->_entitlementManager;
  }
  return (RBEntitlementManaging *)v3;
}

- (RBBundlePropertiesManaging)bundlePropertiesManager
{
  return self->_bundlePropertiesManager;
}

- (RBEntitlementPossessing)originatorEntitlements
{
  if ([(RBAssertionDescriptorValidatorContext *)self ignoreRestrictions])
  {
    v3 = objc_alloc_init(RBIgnoreAllEntitlementsManager);
  }
  else
  {
    originatorEntitlements = self->_originatorEntitlements;
    if (!originatorEntitlements)
    {
      id v5 = [(RBEntitlementManaging *)self->_entitlementManager entitlementsForProcess:self->_originatorProcess];
      char v6 = self->_originatorEntitlements;
      self->_originatorEntitlements = v5;

      originatorEntitlements = self->_originatorEntitlements;
    }
    v3 = originatorEntitlements;
  }
  return (RBEntitlementPossessing *)v3;
}

- (BOOL)ignoreRestrictions
{
  return self->_ignoreRestrictions != 0;
}

- (BOOL)targetIsSystem
{
  return self->_targetIsSystem;
}

- (void)pushIgnoreRestrictions
{
}

- (void)popIgnoreRestrictions
{
}

- (RBAssertionAcquisitionContext)acquisitionContext
{
  return self->_acquisitionContext;
}

- (RBProcess)targetProcess
{
  return self->_targetProcess;
}

- (RBProcess)originatorProcess
{
  return self->_originatorProcess;
}

- (RBEntitlementPossessing)targetEntitlements
{
  if ([(RBAssertionDescriptorValidatorContext *)self ignoreRestrictions])
  {
    v3 = objc_alloc_init(RBIgnoreAllEntitlementsManager);
  }
  else
  {
    if (!self->_targetEntitlements)
    {
      targetProcess = self->_targetProcess;
      if ((!targetProcess || [(RBProcess *)targetProcess isTerminating])
        && [(RBAssertionAcquisitionContext *)self->_acquisitionContext allowAbstractTarget])
      {
        id v5 = objc_alloc_init(RBIgnoreAllEntitlementsManager);
      }
      else
      {
        id v5 = [(RBEntitlementManaging *)self->_entitlementManager entitlementsForProcess:self->_targetProcess];
      }
      targetEntitlements = self->_targetEntitlements;
      self->_targetEntitlements = (RBEntitlementPossessing *)v5;
    }
    v3 = self->_targetEntitlements;
  }
  return (RBEntitlementPossessing *)v3;
}

- (RBConcreteTargeting)target
{
  return self->_target;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_domainAttributeManager, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_acquisitionContext, 0);
  objc_storeStrong((id *)&self->_targetState, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong((id *)&self->_targetIdentity, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_originatorState, 0);
  objc_storeStrong((id *)&self->_assertionDescriptor, 0);
  objc_storeStrong((id *)&self->_assertionDescriptionValidator, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_originatorEntitlements, 0);
  objc_storeStrong((id *)&self->_originatorProperties, 0);
  objc_storeStrong((id *)&self->_originatorProcess, 0);
  objc_storeStrong((id *)&self->_targetEntitlements, 0);
  objc_storeStrong((id *)&self->_targetProperties, 0);
  objc_storeStrong((id *)&self->_targetProcess, 0);
}

- (RBSProcessIdentity)targetIdentity
{
  return self->_targetIdentity;
}

- (void)setTargetProperties:(id)a3
{
}

- (RBSProcessIdentity)originatorIdentity
{
  return [(RBProcess *)self->_originatorProcess identity];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[RBAssertionDescriptorValidatorContext allocWithZone:a3] init];
  [(RBAssertionDescriptorValidatorContext *)v4 setAssertionDescriptionValidator:self->_assertionDescriptionValidator];
  [(RBAssertionDescriptorValidatorContext *)v4 setAssertionDescriptor:self->_assertionDescriptor];
  [(RBAssertionDescriptorValidatorContext *)v4 setOriginatorProcess:self->_originatorProcess];
  [(RBAssertionDescriptorValidatorContext *)v4 setOriginatorState:self->_originatorState];
  [(RBAssertionDescriptorValidatorContext *)v4 setTarget:self->_target];
  [(RBAssertionDescriptorValidatorContext *)v4 setTargetProcess:self->_targetProcess];
  [(RBAssertionDescriptorValidatorContext *)v4 setTargetIdentity:self->_targetIdentity];
  [(RBAssertionDescriptorValidatorContext *)v4 setTargetIdentifier:self->_targetIdentifier];
  [(RBAssertionDescriptorValidatorContext *)v4 setTargetState:self->_targetState];
  [(RBAssertionDescriptorValidatorContext *)v4 setBundlePropertiesManager:self->_bundlePropertiesManager];
  [(RBAssertionDescriptorValidatorContext *)v4 setDomainAttributeManager:self->_domainAttributeManager];
  [(RBAssertionDescriptorValidatorContext *)v4 setEntitlementManager:self->_entitlementManager];
  v4->_ignoreRestrictions = self->_ignoreRestrictions;
  objc_storeStrong((id *)&v4->_acquisitionContext, self->_acquisitionContext);
  return v4;
}

- (void)setTargetEntitlements:(id)a3
{
}

- (RBBundleProperties)originatorProperties
{
  return self->_originatorProperties;
}

- (void)setOriginatorEntitlements:(id)a3
{
}

- (RBAssertionDescriptorValidator)assertionDescriptionValidator
{
  return self->_assertionDescriptionValidator;
}

- (RBProcessState)originatorState
{
  return self->_originatorState;
}

- (RBSProcessIdentifier)targetIdentifier
{
  return self->_targetIdentifier;
}

- (RBProcessState)targetState
{
  return self->_targetState;
}

- (NSDictionary)savedEndowments
{
  return self->_savedEndowments;
}

@end