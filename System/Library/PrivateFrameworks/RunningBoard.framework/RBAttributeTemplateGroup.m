@interface RBAttributeTemplateGroup
- (NSArray)attributes;
- (NSDictionary)additionalRestrictions;
- (NSDictionary)targetBundleProperties;
- (NSString)description;
- (RBDomainRestriction)restriction;
- (RBEntitlementPredicate)originatorEntitlements;
- (RBEntitlementPredicate)targetEntitlements;
- (void)setAdditionalRestrictions:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setOriginatorEntitlements:(id)a3;
- (void)setRestriction:(id)a3;
- (void)setTargetBundleProperties:(id)a3;
- (void)setTargetEntitlements:(id)a3;
@end

@implementation RBAttributeTemplateGroup

- (NSArray)attributes
{
  attributes = self->_attributes;
  if (attributes)
  {
    v3 = attributes;
  }
  else
  {
    v3 = [MEMORY[0x263EFF8C0] array];
  }
  return v3;
}

- (NSDictionary)targetBundleProperties
{
  return self->_targetBundleProperties;
}

- (RBDomainRestriction)restriction
{
  return self->_restriction;
}

- (NSString)description
{
  unint64_t v3 = [(RBEntitlementPredicate *)self->_originatorEntitlements count];
  unint64_t v4 = [(RBEntitlementPredicate *)self->_targetEntitlements count];
  NSUInteger v5 = [(NSDictionary *)self->_targetBundleProperties count];
  NSUInteger v6 = [(NSDictionary *)self->_additionalRestrictions count];
  id v37 = [NSString alloc];
  v7 = [(id)objc_opt_class() description];
  uint64_t v39 = [(NSArray *)self->_attributes componentsJoinedByString:@",\n\t\t\t\t\t\t"];
  v8 = @"\n\t\t\t\t\toriginatorEntitlements: ";
  if (!v3) {
    v8 = &stru_26DA9D688;
  }
  v35 = v8;
  if (v3)
  {
    v9 = [(RBEntitlementPredicate *)self->_originatorEntitlements description];
  }
  else
  {
    v9 = &stru_26DA9D688;
  }
  v10 = @"\n\t\t\t\t\ttargetEntitlements: ";
  if (!v4) {
    v10 = &stru_26DA9D688;
  }
  v34 = v10;
  if (v4)
  {
    v11 = [(RBEntitlementPredicate *)self->_targetEntitlements description];
  }
  else
  {
    v11 = &stru_26DA9D688;
  }
  v12 = @"\n\t\t\t\t\ttargetBundleProperties:{\n";
  if (!v5) {
    v12 = &stru_26DA9D688;
  }
  v33 = v12;
  v38 = v9;
  if (v5)
  {
    v40 = [(NSDictionary *)self->_targetBundleProperties entriesToStringWithIndent:6 debug:1];
    v32 = @"\n\t\t\t\t\t}";
  }
  else
  {
    v32 = &stru_26DA9D688;
    v40 = &stru_26DA9D688;
  }
  v36 = v11;
  if (v6) {
    v13 = @"\n\t\t\t\t\tadditionalRestrictions:{\n";
  }
  else {
    v13 = &stru_26DA9D688;
  }
  if (v6)
  {
    v14 = [(NSDictionary *)self->_additionalRestrictions entriesToStringWithIndent:6 debug:1];
    v15 = @"\n\t\t\t\t\t}";
  }
  else
  {
    v15 = &stru_26DA9D688;
    v14 = &stru_26DA9D688;
  }
  restriction = self->_restriction;
  if (restriction)
  {
    uint64_t v17 = [(RBDomainRestriction *)restriction description];
    NSUInteger v31 = v6;
    NSUInteger v18 = v5;
    unint64_t v19 = v3;
    v20 = (void *)v17;
    v21 = @"\n\t\t\t\t\t}";
    if (!self->_restriction) {
      v21 = &stru_26DA9D688;
    }
    v29 = v15;
    v27 = v13;
    v22 = v36;
    v23 = v38;
    v24 = (void *)v39;
    v25 = (void *)[v37 initWithFormat:@"<%@|\n\t\t\t\t\tattributes:[\n\t\t\t\t\t\t%@\n\t\t\t\t\t]%@%@%@%@%@%@%@%@%@%@%@%@%@>", v7, v39, v35, v38, v34, v36, v33, v40, v32, v27, v14, v29, @"\n\t\t\t\t\trestrictions:{\n", v17, v21];

    unint64_t v3 = v19;
    NSUInteger v5 = v18;
    if (v31) {
      goto LABEL_26;
    }
  }
  else
  {
    v30 = v15;
    v28 = v13;
    v22 = v36;
    v23 = v38;
    v24 = (void *)v39;
    v25 = (void *)[v37 initWithFormat:@"<%@|\n\t\t\t\t\tattributes:[\n\t\t\t\t\t\t%@\n\t\t\t\t\t]%@%@%@%@%@%@%@%@%@%@%@%@%@>", v7, v39, v35, v38, v34, v36, v33, v40, v32, v28, v14, v30, &stru_26DA9D688, &stru_26DA9D688, &stru_26DA9D688];
    if (v6) {
LABEL_26:
    }
  }
  if (v5) {

  }
  if (v4) {
  if (v3)
  }

  return (NSString *)v25;
}

- (void)setAttributes:(id)a3
{
}

- (void)setTargetBundleProperties:(id)a3
{
}

- (RBEntitlementPredicate)originatorEntitlements
{
  return self->_originatorEntitlements;
}

- (void)setOriginatorEntitlements:(id)a3
{
}

- (RBEntitlementPredicate)targetEntitlements
{
  return self->_targetEntitlements;
}

- (void)setTargetEntitlements:(id)a3
{
}

- (NSDictionary)additionalRestrictions
{
  return self->_additionalRestrictions;
}

- (void)setAdditionalRestrictions:(id)a3
{
}

- (void)setRestriction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restriction, 0);
  objc_storeStrong((id *)&self->_additionalRestrictions, 0);
  objc_storeStrong((id *)&self->_targetEntitlements, 0);
  objc_storeStrong((id *)&self->_originatorEntitlements, 0);
  objc_storeStrong((id *)&self->_targetBundleProperties, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end