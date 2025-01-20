@interface PKSharingMesageProprietaryData
- (NSArray)displayableSharedEntitlements;
- (PKSharingMesageProprietaryData)init;
- (PKSharingMesageProprietaryData)initWithDictionary:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)accessType;
- (void)setAccessType:(int64_t)a3;
- (void)setDisplayableSharedEntitlements:(id)a3;
@end

@implementation PKSharingMesageProprietaryData

- (PKSharingMesageProprietaryData)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKSharingMesageProprietaryData;
  return [(PKSharingMesageProprietaryData *)&v3 init];
}

- (PKSharingMesageProprietaryData)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(PKSharingMesageProprietaryData *)self init];
    if (v5)
    {
      v6 = [v4 PKArrayContaining:objc_opt_class() forKey:@"displayableSharedEntitlements"];
      uint64_t v7 = objc_msgSend(v6, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_14);
      displayableSharedEntitlements = v5->_displayableSharedEntitlements;
      v5->_displayableSharedEntitlements = (NSArray *)v7;

      v9 = [v4 PKStringForKey:@"accessType"];
      v5->_accessType = PKSecureElementAccessPassTypeFromString(v9);
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

PKDisplayablePassEntitlement *__53__PKSharingMesageProprietaryData_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = [[PKDisplayablePassEntitlement alloc] initWithDictionary:v2];

  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NSArray *)self->_displayableSharedEntitlements pk_arrayByApplyingBlock:&__block_literal_global_21];
  [v3 setObject:v4 forKeyedSubscript:@"displayableSharedEntitlements"];

  v5 = PKSecureElementAccessPassTypeToString(self->_accessType);
  [v3 setObject:v5 forKeyedSubscript:@"accessType"];

  v6 = (void *)[v3 copy];
  return v6;
}

uint64_t __58__PKSharingMesageProprietaryData_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  objc_msgSend(v6, "appendFormat:", @"displayableSharedEntitlements: '%@'; ",
    self->_displayableSharedEntitlements);
  uint64_t v7 = PKSecureElementAccessPassTypeToString(self->_accessType);
  [v6 appendFormat:@"accessType: '%@'; ", v7];

  [v6 appendFormat:@">"];
  v8 = [NSString stringWithString:v6];

  return v8;
}

- (NSArray)displayableSharedEntitlements
{
  return self->_displayableSharedEntitlements;
}

- (void)setDisplayableSharedEntitlements:(id)a3
{
}

- (int64_t)accessType
{
  return self->_accessType;
}

- (void)setAccessType:(int64_t)a3
{
  self->_accessType = a3;
}

- (void).cxx_destruct
{
}

@end