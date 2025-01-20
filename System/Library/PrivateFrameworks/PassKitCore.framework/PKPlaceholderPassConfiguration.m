@interface PKPlaceholderPassConfiguration
+ (BOOL)supportsSecureCoding;
- (NSArray)associatedApplicationIdentifiers;
- (NSArray)passFields;
- (PKAppletSubcredential)subcredential;
- (PKPassAutomaticSelectionCriterion)automaticSelectionCriterion;
- (PKPlaceholderPassConfiguration)initWithCoder:(id)a3;
- (PKPlaceholderPassConfiguration)initWithSubcredential:(id)a3 automaticSelectionCriterion:(id)a4;
- (id)description;
- (int64_t)paymentApplicationState;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedApplicationIdentifiers:(id)a3;
- (void)setPassFields:(id)a3;
@end

@implementation PKPlaceholderPassConfiguration

- (PKPlaceholderPassConfiguration)initWithSubcredential:(id)a3 automaticSelectionCriterion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = [(PKPlaceholderPassConfiguration *)self init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_subcredential, a3);
      objc_storeStrong((id *)&v10->_automaticSelectionCriterion, a4);
      v10->_paymentApplicationState = [(PKAppletSubcredential *)v10->_subcredential state];
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; Subcredential: %@, automaticSelectionCriterion: %@, paymentApplicationState: %ld. associatedApplicationIdentifiers: %@ >",
               objc_opt_class(),
               self,
               self->_subcredential,
               self->_automaticSelectionCriterion,
               self->_paymentApplicationState,
               self->_associatedApplicationIdentifiers);
}

- (void)encodeWithCoder:(id)a3
{
  subcredential = self->_subcredential;
  id v5 = a3;
  [v5 encodeObject:subcredential forKey:@"subcredential"];
  [v5 encodeObject:self->_automaticSelectionCriterion forKey:@"automaticSelectionCriterion"];
  [v5 encodeInteger:self->_paymentApplicationState forKey:@"paymentApplicationState"];
  [v5 encodeObject:self->_associatedApplicationIdentifiers forKey:@"associatedApplicationIdentifiers"];
}

- (PKPlaceholderPassConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPlaceholderPassConfiguration *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subcredential"];
    subcredential = v5->_subcredential;
    v5->_subcredential = (PKAppletSubcredential *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"automaticSelectionCriterion"];
    automaticSelectionCriterion = v5->_automaticSelectionCriterion;
    v5->_automaticSelectionCriterion = (PKPassAutomaticSelectionCriterion *)v8;

    v5->_paymentApplicationState = [v4 decodeIntegerForKey:@"paymentApplicationState"];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"associatedApplicationIdentifiers"];
    associatedApplicationIdentifiers = v5->_associatedApplicationIdentifiers;
    v5->_associatedApplicationIdentifiers = (NSArray *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppletSubcredential)subcredential
{
  return self->_subcredential;
}

- (PKPassAutomaticSelectionCriterion)automaticSelectionCriterion
{
  return self->_automaticSelectionCriterion;
}

- (int64_t)paymentApplicationState
{
  return self->_paymentApplicationState;
}

- (NSArray)associatedApplicationIdentifiers
{
  return self->_associatedApplicationIdentifiers;
}

- (void)setAssociatedApplicationIdentifiers:(id)a3
{
}

- (NSArray)passFields
{
  return self->_passFields;
}

- (void)setPassFields:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passFields, 0);
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_automaticSelectionCriterion, 0);
  objc_storeStrong((id *)&self->_subcredential, 0);
}

@end