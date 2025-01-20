@interface CellContextsFromRequiredPersonalizationFields
@end

@implementation CellContextsFromRequiredPersonalizationFields

id ___CellContextsFromRequiredPersonalizationFields_block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v2 style:2 options:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void ___CellContextsFromRequiredPersonalizationFields_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [v4 name];
  v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  }
  id v14 = v8;

  v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v10 = [v5 componentsSeparatedByCharactersInSet:v9];

  if ([v10 count])
  {
    v11 = [v10 objectAtIndexedSubscript:0];
  }
  else
  {
    v11 = 0;
  }
  if ((unint64_t)[v10 count] < 2)
  {
    v13 = 0;
  }
  else
  {
    v12 = objc_msgSend(v10, "pk_arrayByRemovingObject:", v11);
    v13 = [v12 componentsJoinedByString:@" "];
  }
  [v14 setGivenName:v11];
  [v14 setFamilyName:v13];
  [v4 setName:v14];
}

id ___CellContextsFromRequiredPersonalizationFields_block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 postalAddress];
  v3 = [v2 postalCode];

  return v3;
}

void ___CellContextsFromRequiredPersonalizationFields_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [v4 postalAddress];
  v7 = [v6 dictionaryRepresentation];
  id v8 = v7;
  if (!v7) {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v10 = (id)[v7 mutableCopy];

  [v10 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F1B7B0]];
  v9 = [MEMORY[0x1E4F1BA80] postalAddressWithDictionaryRepresentation:v10];
  [v4 setPostalAddress:v9];
}

uint64_t ___CellContextsFromRequiredPersonalizationFields_block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 emailAddress];
}

uint64_t ___CellContextsFromRequiredPersonalizationFields_block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setEmailAddress:a2];
}

id ___CellContextsFromRequiredPersonalizationFields_block_invoke_7(uint64_t a1, void *a2)
{
  v2 = [a2 phoneNumber];
  v3 = [v2 formattedStringValue];

  return v3;
}

void ___CellContextsFromRequiredPersonalizationFields_block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (void *)MEMORY[0x1E4F1BA70];
  id v5 = a3;
  id v6 = [v4 phoneNumberWithStringValue:a2];
  [v5 setPhoneNumber:v6];
}

@end