@interface ICCommaSeparatedStringsContentMapping
- (BOOL)skipURLEncoding;
- (BOOL)supportsMultipleItems;
- (id)allowedCharacterSet;
- (id)contentItemClasses;
- (id)escapedCharacters;
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
@end

@implementation ICCommaSeparatedStringsContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__ICCommaSeparatedStringsContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v9[3] = &unk_1E6558040;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [a4 getStringRepresentations:v9];
}

void __86__ICCommaSeparatedStringsContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__ICCommaSeparatedStringsContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
  v8[3] = &unk_1E65503E0;
  uint64_t v4 = *(void *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v5 = a3;
  v6 = objc_msgSend(a2, "if_map:", v8);
  id v7 = [v6 componentsJoinedByString:@","];
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v7, v5);
}

id __86__ICCommaSeparatedStringsContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 allowedCharacterSet];
  id v5 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v4];

  return v5;
}

- (id)allowedCharacterSet
{
  id v3 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 removeCharactersInString:@"?&="];
  id v5 = [(ICCommaSeparatedStringsContentMapping *)self escapedCharacters];
  [v4 removeCharactersInString:v5];

  return v4;
}

- (id)escapedCharacters
{
  v2 = [(ICContentMapping *)self definition];
  id v3 = [v2 objectForKey:@"EscapedCharacters"];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = @",";
  }
  id v5 = v3;

  return v5;
}

- (BOOL)skipURLEncoding
{
  return 1;
}

- (id)contentItemClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 orderedSetWithObject:v3];
}

- (BOOL)supportsMultipleItems
{
  return 1;
}

@end