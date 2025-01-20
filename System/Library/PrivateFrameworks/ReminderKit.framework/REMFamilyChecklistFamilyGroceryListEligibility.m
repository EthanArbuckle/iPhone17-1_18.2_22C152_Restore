@interface REMFamilyChecklistFamilyGroceryListEligibility
+ (BOOL)supportsSecureCoding;
- (BOOL)isEligible;
- (BOOL)isEqual:(id)a3;
- (REMFamilyChecklistFamilyGroceryListEligibility)initWithCoder:(id)a3;
- (REMFamilyChecklistFamilyGroceryListEligibility)initWithIsEligible:(BOOL)a3 ineligibilityReasons:(int64_t)a4;
- (id)description;
- (int64_t)ineligibilityReasons;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMFamilyChecklistFamilyGroceryListEligibility

- (REMFamilyChecklistFamilyGroceryListEligibility)initWithIsEligible:(BOOL)a3 ineligibilityReasons:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)REMFamilyChecklistFamilyGroceryListEligibility;
  result = [(REMFamilyChecklistFamilyGroceryListEligibility *)&v7 init];
  if (result)
  {
    result->_isEligible = a3;
    result->_ineligibilityReasons = a4;
  }
  return result;
}

- (id)description
{
  v3 = objc_opt_new();
  if (([(REMFamilyChecklistFamilyGroceryListEligibility *)self ineligibilityReasons] & 4) != 0) {
    [v3 addObject:@".noActivePrimaryCloudKitAccount"];
  }
  if (([(REMFamilyChecklistFamilyGroceryListEligibility *)self ineligibilityReasons] & 0x10) != 0) {
    [v3 addObject:@".unsupportedLocale"];
  }
  if (([(REMFamilyChecklistFamilyGroceryListEligibility *)self ineligibilityReasons] & 0x100) != 0) {
    [v3 addObject:@".primaryCloudKitAccountNotMigrated"];
  }
  v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[REMFamilyChecklistFamilyGroceryListEligibility isEligible](self, "isEligible"));
  objc_super v7 = [v4 stringWithFormat:@"<%@: %p isEligible: %@, ineligibilityReasons: %@>", v5, self, v6, v3];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v5 = [(REMFamilyChecklistFamilyGroceryListEligibility *)self isEligible],
        v5 == [v4 isEligible]))
  {
    int64_t v7 = [(REMFamilyChecklistFamilyGroceryListEligibility *)self ineligibilityReasons];
    BOOL v6 = v7 == [v4 ineligibilityReasons];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", -[REMFamilyChecklistFamilyGroceryListEligibility isEligible](self, "isEligible"));
  uint64_t v4 = [v3 hash];
  int v5 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", -[REMFamilyChecklistFamilyGroceryListEligibility ineligibilityReasons](self, "ineligibilityReasons"));
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFamilyChecklistFamilyGroceryListEligibility)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"isEligible"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"ineligibilityReasons"];

  return [(REMFamilyChecklistFamilyGroceryListEligibility *)self initWithIsEligible:v5 ineligibilityReasons:v6];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[REMFamilyChecklistFamilyGroceryListEligibility isEligible](self, "isEligible"), @"isEligible");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMFamilyChecklistFamilyGroceryListEligibility ineligibilityReasons](self, "ineligibilityReasons"), @"ineligibilityReasons");
}

- (BOOL)isEligible
{
  return self->_isEligible;
}

- (int64_t)ineligibilityReasons
{
  return self->_ineligibilityReasons;
}

@end