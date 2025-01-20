@interface _PKProvisioningRequirementOracle
- (_PKProvisioningRequirementOracle)init;
- (id)recoverableRequirementsContainer;
- (id)requirementsForAddSecureElementPassConfiguration:(id)a3;
@end

@implementation _PKProvisioningRequirementOracle

- (_PKProvisioningRequirementOracle)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProvisioningRequirementOracle();
  return [(_PKProvisioningRequirementOracle *)&v3 init];
}

- (id)requirementsForAddSecureElementPassConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_190FE9980(v4);
  v7 = sub_190FE6C4C((uint64_t)v6);
  swift_bridgeObjectRelease();
  v8 = (objc_class *)type metadata accessor for ProvisioningRequirementsContainer();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = &v9[OBJC_IVAR____PKProvisioningRequirementsContainer_provisioningSID];
  *(void *)v10 = 0;
  *((void *)v10 + 1) = 0;
  *(void *)&v9[OBJC_IVAR____PKProvisioningRequirementsContainer_requirements] = v7;
  v14.receiver = v9;
  v14.super_class = v8;
  v11 = [(_PKProvisioningRequirementOracle *)&v14 init];
  id v12 = objc_msgSend(objc_allocWithZone((Class)PKProvisioningRequirementsContainer), sel_initWithContainer_, v11);

  return v12;
}

- (id)recoverableRequirementsContainer
{
  objc_super v3 = (objc_class *)type metadata accessor for ProvisioningRequirementsContainer();
  id v4 = (char *)objc_allocWithZone(v3);
  v5 = &v4[OBJC_IVAR____PKProvisioningRequirementsContainer_provisioningSID];
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v4[OBJC_IVAR____PKProvisioningRequirementsContainer_requirements] = &unk_1EE0DE258;
  v11.receiver = v4;
  v11.super_class = v3;
  v6 = self;
  v7 = [(_PKProvisioningRequirementOracle *)&v11 init];
  id v8 = objc_allocWithZone((Class)PKProvisioningRequirementsContainer);
  id v9 = objc_msgSend(v8, sel_initWithContainer_, v7, v11.receiver, v11.super_class);

  return v9;
}

@end