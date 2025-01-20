@interface RBAttributeContext
- (BOOL)isActiveDueToInheritedEndowment;
- (BOOL)targetIsSystem;
- (NSDictionary)savedEndowments;
- (RBAssertion)assertion;
- (RBBundleProperties)originatorProperties;
- (RBBundleProperties)targetProperties;
- (RBBundlePropertiesManaging)bundlePropertiesManager;
- (RBConcreteTargeting)target;
- (RBDomainAttributeManaging)domainAttributeManager;
- (RBEntitlementManaging)entitlementManager;
- (RBEntitlementPossessing)originatorEntitlements;
- (RBEntitlementPossessing)targetEntitlements;
- (RBInheritanceCollection)availableInheritances;
- (RBProcess)originatorProcess;
- (RBProcess)targetProcess;
- (RBProcessState)initialProcessState;
- (RBSAssertionIdentifier)assertionID;
- (RBSProcessIdentity)targetIdentity;
- (RBSystemState)systemState;
- (void)popActiveDueToInheritedEndowment;
- (void)pushActiveDueToInheritedEndowment;
- (void)setAssertion:(id)a3;
- (void)setAvailableInheritances:(id)a3;
- (void)setBundlePropertiesManager:(id)a3;
- (void)setDomainAttributeManager:(id)a3;
- (void)setEntitlementManager:(id)a3;
- (void)setInitialProcessState:(id)a3;
- (void)setSavedEndowments:(id)a3;
- (void)setSystemState:(id)a3;
@end

@implementation RBAttributeContext

- (RBBundleProperties)targetProperties
{
  if (!self->_targetProperties)
  {
    targetIdentity = self->_targetIdentity;
    if (targetIdentity)
    {
      bundlePropertiesManager = self->_bundlePropertiesManager;
      v5 = [(RBProcess *)self->_targetProcess identifier];
      v6 = [(RBBundlePropertiesManaging *)bundlePropertiesManager propertiesForIdentity:targetIdentity identifier:v5];
      targetProperties = self->_targetProperties;
      self->_targetProperties = v6;
    }
    else
    {
      v8 = objc_alloc_init(RBBundleProperties);
      v5 = self->_targetProperties;
      self->_targetProperties = v8;
    }
  }
  v9 = self->_targetProperties;
  return v9;
}

- (RBDomainAttributeManaging)domainAttributeManager
{
  return self->_domainAttributeManager;
}

- (void)setSystemState:(id)a3
{
}

- (void)setSavedEndowments:(id)a3
{
}

- (void)setAvailableInheritances:(id)a3
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

- (void)setInitialProcessState:(id)a3
{
}

- (void)setAssertion:(id)a3
{
  id v25 = a3;
  objc_storeStrong((id *)&self->_assertion, a3);
  v5 = [v25 identifier];
  assertionID = self->_assertionID;
  self->_assertionID = v5;

  target = self->_target;
  v8 = [v25 target];
  if (target == v8) {
    goto LABEL_8;
  }
  v9 = v8;
  if (!target || !v8)
  {

    goto LABEL_7;
  }
  char v10 = [(RBConcreteTargeting *)target isEqual:v8];

  if ((v10 & 1) == 0)
  {
LABEL_7:
    v11 = [v25 target];
    v12 = self->_target;
    self->_target = v11;

    v13 = [(RBConcreteTargeting *)self->_target process];
    targetProcess = self->_targetProcess;
    self->_targetProcess = v13;

    v15 = [(RBConcreteTargeting *)self->_target identity];
    targetIdentity = self->_targetIdentity;
    self->_targetIdentity = v15;

    self->_targetIsSystem = [(RBConcreteTargeting *)self->_target isSystem];
    targetProperties = self->_targetProperties;
    self->_targetProperties = 0;

    target = self->_targetEntitlements;
    self->_targetEntitlements = 0;
LABEL_8:
  }
  originatorProcess = self->_originatorProcess;
  v19 = [v25 originator];
  if (originatorProcess == v19)
  {
LABEL_16:

    goto LABEL_17;
  }
  v20 = v19;
  if (!originatorProcess || !v19)
  {

    goto LABEL_15;
  }
  char v21 = [originatorProcess isEqual:v19];

  if ((v21 & 1) == 0)
  {
LABEL_15:
    v22 = [v25 originator];
    v23 = self->_originatorProcess;
    self->_originatorProcess = v22;

    originatorProperties = self->_originatorProperties;
    self->_originatorProperties = 0;

    originatorProcess = self->_originatorEntitlements;
    self->_originatorEntitlements = 0;
    goto LABEL_16;
  }
LABEL_17:
}

- (RBInheritanceCollection)availableInheritances
{
  return self->_availableInheritances;
}

- (RBSystemState)systemState
{
  return self->_systemState;
}

- (RBProcess)targetProcess
{
  return self->_targetProcess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_domainAttributeManager, 0);
  objc_storeStrong((id *)&self->_availableInheritances, 0);
  objc_storeStrong((id *)&self->_initialProcessState, 0);
  objc_storeStrong((id *)&self->_targetIdentity, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_assertionID, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_originatorEntitlements, 0);
  objc_storeStrong((id *)&self->_originatorProperties, 0);
  objc_storeStrong((id *)&self->_originatorProcess, 0);
  objc_storeStrong((id *)&self->_targetEntitlements, 0);
  objc_storeStrong((id *)&self->_targetProperties, 0);
  objc_storeStrong((id *)&self->_targetProcess, 0);
}

- (BOOL)isActiveDueToInheritedEndowment
{
  return self->_activeDueToInheritedEndowmentCount != 0;
}

- (RBProcessState)initialProcessState
{
  return self->_initialProcessState;
}

- (void)pushActiveDueToInheritedEndowment
{
}

- (void)popActiveDueToInheritedEndowment
{
}

- (RBConcreteTargeting)target
{
  return self->_target;
}

- (RBAssertion)assertion
{
  return self->_assertion;
}

- (RBSAssertionIdentifier)assertionID
{
  return self->_assertionID;
}

- (RBSProcessIdentity)targetIdentity
{
  return self->_targetIdentity;
}

- (RBEntitlementPossessing)targetEntitlements
{
  if (!self->_targetEntitlements)
  {
    if (self->_targetProcess)
    {
      -[RBEntitlementManaging entitlementsForProcess:](self->_entitlementManager, "entitlementsForProcess:");
      v3 = (RBEntitlementPossessing *)objc_claimAutoreleasedReturnValue();
      targetEntitlements = self->_targetEntitlements;
      self->_targetEntitlements = v3;
    }
    else
    {
      v5 = [RBEntitlements alloc];
      targetEntitlements = [MEMORY[0x263EFFA08] set];
      v6 = [(RBEntitlements *)v5 _initWithEntitlements:targetEntitlements];
      v7 = self->_targetEntitlements;
      self->_targetEntitlements = v6;
    }
  }
  v8 = self->_targetEntitlements;
  return v8;
}

- (RBBundleProperties)originatorProperties
{
  if (!self->_originatorProperties)
  {
    v3 = [(RBProcess *)self->_originatorProcess identity];

    if (v3)
    {
      bundlePropertiesManager = self->_bundlePropertiesManager;
      v5 = [(RBProcess *)self->_originatorProcess identity];
      v6 = [(RBProcess *)self->_originatorProcess identifier];
      v7 = [(RBBundlePropertiesManaging *)bundlePropertiesManager propertiesForIdentity:v5 identifier:v6];
      originatorProperties = self->_originatorProperties;
      self->_originatorProperties = v7;
    }
    else
    {
      v9 = objc_alloc_init(RBBundleProperties);
      v5 = self->_originatorProperties;
      self->_originatorProperties = v9;
    }
  }
  char v10 = self->_originatorProperties;
  return v10;
}

- (RBEntitlementPossessing)originatorEntitlements
{
  if (!self->_originatorEntitlements)
  {
    if (self->_originatorProcess)
    {
      -[RBEntitlementManaging entitlementsForProcess:](self->_entitlementManager, "entitlementsForProcess:");
      v3 = (RBEntitlementPossessing *)objc_claimAutoreleasedReturnValue();
      originatorEntitlements = self->_originatorEntitlements;
      self->_originatorEntitlements = v3;
    }
    else
    {
      v5 = [RBEntitlements alloc];
      originatorEntitlements = [MEMORY[0x263EFFA08] set];
      v6 = [(RBEntitlements *)v5 _initWithEntitlements:originatorEntitlements];
      v7 = self->_originatorEntitlements;
      self->_originatorEntitlements = v6;
    }
  }
  v8 = self->_originatorEntitlements;
  return v8;
}

- (RBProcess)originatorProcess
{
  return self->_originatorProcess;
}

- (BOOL)targetIsSystem
{
  return self->_targetIsSystem;
}

- (RBBundlePropertiesManaging)bundlePropertiesManager
{
  return self->_bundlePropertiesManager;
}

- (RBEntitlementManaging)entitlementManager
{
  return self->_entitlementManager;
}

- (NSDictionary)savedEndowments
{
  return self->_savedEndowments;
}

@end