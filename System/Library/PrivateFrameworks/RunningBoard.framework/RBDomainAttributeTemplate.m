@interface RBDomainAttributeTemplate
- (NSArray)attributeGroups;
- (NSDictionary)additionalRestrictions;
- (NSDictionary)targetBundleProperties;
- (NSString)description;
- (RBDomainRestriction)restriction;
- (RBEntitlementPredicate)originatorEntitlements;
- (RBEntitlementPredicate)targetEntitlements;
- (uint64_t)domain;
- (uint64_t)endowmentNamespace;
- (uint64_t)name;
- (void)setAdditionalRestrictions:(id)a3;
- (void)setAttributeGroups:(id)a3;
- (void)setDomain:(void *)a1;
- (void)setEndowmentNamespace:(void *)a1;
- (void)setName:(void *)a1;
- (void)setOriginatorEntitlements:(id)a3;
- (void)setRestriction:(id)a3;
- (void)setTargetBundleProperties:(id)a3;
- (void)setTargetEntitlements:(id)a3;
@end

@implementation RBDomainAttributeTemplate

- (NSArray)attributeGroups
{
  attributeGroups = self->_attributeGroups;
  if (attributeGroups)
  {
    v3 = attributeGroups;
  }
  else
  {
    v3 = [MEMORY[0x263EFF8C0] array];
  }
  return v3;
}

- (uint64_t)endowmentNamespace
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (RBEntitlementPredicate)originatorEntitlements
{
  return self->_originatorEntitlements;
}

- (RBDomainRestriction)restriction
{
  return self->_restriction;
}

- (NSDictionary)targetBundleProperties
{
  return self->_targetBundleProperties;
}

- (NSDictionary)additionalRestrictions
{
  return self->_additionalRestrictions;
}

- (RBEntitlementPredicate)targetEntitlements
{
  return self->_targetEntitlements;
}

- (NSString)description
{
  unint64_t v3 = [(RBEntitlementPredicate *)self->_originatorEntitlements count];
  unint64_t v4 = [(RBEntitlementPredicate *)self->_targetEntitlements count];
  NSUInteger v5 = [(NSDictionary *)self->_targetBundleProperties count];
  NSUInteger v6 = [(NSDictionary *)self->_additionalRestrictions count];
  id v33 = [NSString alloc];
  v36 = [(id)objc_opt_class() description];
  name = self->_name;
  domain = self->_domain;
  endowmentNamespace = self->_endowmentNamespace;
  v8 = @" endowmentNamespace:";
  v9 = &stru_26DA9D688;
  if (!endowmentNamespace) {
    v8 = &stru_26DA9D688;
  }
  v29 = v8;
  if (endowmentNamespace) {
    v10 = (__CFString *)self->_endowmentNamespace;
  }
  else {
    v10 = &stru_26DA9D688;
  }
  v11 = @"\n\t\t\toriginatorEntitlements: ";
  if (!v3) {
    v11 = &stru_26DA9D688;
  }
  v27 = v11;
  v28 = v10;
  unint64_t v38 = v3;
  if (v3)
  {
    v34 = [(RBEntitlementPredicate *)self->_originatorEntitlements description];
  }
  else
  {
    v34 = &stru_26DA9D688;
  }
  v12 = @"\n\t\t\ttargetEntitlements: ";
  if (!v4) {
    v12 = &stru_26DA9D688;
  }
  v26 = v12;
  if (v4)
  {
    v30 = [(RBEntitlementPredicate *)self->_targetEntitlements description];
  }
  else
  {
    v30 = &stru_26DA9D688;
  }
  v13 = @"\n\t\t\ttargetBundleProperties:{\n";
  if (!v5) {
    v13 = &stru_26DA9D688;
  }
  v25 = v13;
  if (v5)
  {
    v39 = [(NSDictionary *)self->_targetBundleProperties entriesToStringWithIndent:4 debug:1];
    v24 = @"\t\t\t}";
  }
  else
  {
    v24 = &stru_26DA9D688;
    v39 = &stru_26DA9D688;
  }
  if (v6) {
    v14 = @"\n\t\t\tadditionalRestrictions:{\n";
  }
  else {
    v14 = &stru_26DA9D688;
  }
  unint64_t v37 = v4;
  NSUInteger v35 = v6;
  if (v6)
  {
    v15 = [(NSDictionary *)self->_additionalRestrictions entriesToStringWithIndent:4 debug:1];
    v16 = @"\t\t\t}";
  }
  else
  {
    v16 = &stru_26DA9D688;
    v15 = &stru_26DA9D688;
  }
  NSUInteger v17 = v5;
  restriction = self->_restriction;
  if (restriction) {
    v19 = @"\n\t\t\t\t\trestrictions:{\n";
  }
  else {
    v19 = &stru_26DA9D688;
  }
  if (restriction)
  {
    v20 = [(RBDomainRestriction *)self->_restriction description];
    if (self->_restriction) {
      v9 = @"\n\t\t\t\t\t}";
    }
  }
  else
  {
    v20 = &stru_26DA9D688;
  }
  v21 = [(NSArray *)self->_attributeGroups componentsJoinedByString:@",\n\t\t\t\t"];
  v22 = objc_msgSend(v33, "initWithFormat:", @"<%@| domain:%@ name:%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@\n\t\t\tattributeGroups:[\n\t\t\t\t%@\n\t\t\t]>", v36, domain, name, v29, v28, v27, v34, v26, v30, v25, v39, v24, v14, v15, v16, v19,
                  v20,
                  v9,
                  v21);

  if (restriction) {
  if (v35)
  }

  if (v17) {
  if (v37)
  }

  if (v38) {
  return (NSString *)v22;
  }
}

- (void)setAttributeGroups:(id)a3
{
}

- (uint64_t)domain
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)setDomain:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16);
  }
}

- (uint64_t)name
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)setName:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 24);
  }
}

- (void)setOriginatorEntitlements:(id)a3
{
}

- (void)setTargetBundleProperties:(id)a3
{
}

- (void)setTargetEntitlements:(id)a3
{
}

- (void)setAdditionalRestrictions:(id)a3
{
}

- (void)setRestriction:(id)a3
{
}

- (void)setEndowmentNamespace:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 72);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
  objc_storeStrong((id *)&self->_restriction, 0);
  objc_storeStrong((id *)&self->_additionalRestrictions, 0);
  objc_storeStrong((id *)&self->_targetEntitlements, 0);
  objc_storeStrong((id *)&self->_targetBundleProperties, 0);
  objc_storeStrong((id *)&self->_originatorEntitlements, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_attributeGroups, 0);
}

@end