@interface PLUniformTypeIdentifierIntegratedLookup
+ (id)compactRepresentationForIdentifier:(id)a3;
+ (id)compactRepresentationsForIdentifiers:(id)a3;
+ (id)identifierFromCompactRepresentation:(id)a3;
+ (signed)conformanceHintForIdentifier:(id)a3;
@end

@implementation PLUniformTypeIdentifierIntegratedLookup

+ (id)identifierFromCompactRepresentation:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)[v3 length];
  if (v4)
  {
    if ([v3 hasPrefix:@"_"]
      && (unint64_t)v4 > [@"_" length])
    {
      v4 = [v3 substringFromIndex:objc_msgSend(@"_", "length")];
      goto LABEL_13;
    }
    uint64_t v5 = [v3 intValue];
    if ((int)v5 < 1)
    {
      v7 = PLBackendGetLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        v4 = 0;
        goto LABEL_13;
      }
      int v10 = 138543362;
      id v11 = v3;
      v8 = "Unable to decode compact UTI value (non natural number): %{public}@";
    }
    else
    {
      v6 = PLUTTypeFromUniformFileType(v5);
      v4 = [v6 identifier];

      if (v4) {
        goto LABEL_13;
      }
      v7 = PLBackendGetLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      int v10 = 138543362;
      id v11 = v3;
      v8 = "Unable to decode compact UTI value (not in list): %{public}@";
    }
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v10, 0xCu);
    goto LABEL_12;
  }
LABEL_13:

  return v4;
}

+ (id)compactRepresentationsForIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(a1, "compactRepresentationForIdentifier:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)compactRepresentationForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && (uint64_t v5 = PLFileTypeFromIdentifier(v3), v5))
  {
    id v6 = [NSNumber numberWithUnsignedInt:v5];
    uint64_t v7 = [v6 stringValue];
  }
  else
  {
    uint64_t v7 = [@"_" stringByAppendingString:v4];
  }

  return v7;
}

+ (signed)conformanceHintForIdentifier:(id)a3
{
  id v3 = a3;
  unsigned int v4 = PLFileTypeFromIdentifier(v3);
  if (v4)
  {
    signed __int16 v5 = 2;
    if (v4 <= 0x27)
    {
      if ((0xF800000uLL >> v4)) {
        __int16 v6 = 3;
      }
      else {
        __int16 v6 = 0;
      }
      if ((0x1DEuLL >> v4)) {
        __int16 v6 = 1;
      }
      if (v4 > 0x25) {
        __int16 v6 = 1;
      }
      if ((0x7FFE00uLL >> v4)) {
        signed __int16 v5 = 2;
      }
      else {
        signed __int16 v5 = v6;
      }
    }
  }
  else
  {
    uint64_t v7 = *MEMORY[0x1E4F44400];
    uint64_t v8 = [(id)*MEMORY[0x1E4F44400] identifier];
    char v9 = [v3 isEqualToString:v8];

    if (v9)
    {
      signed __int16 v5 = 1;
    }
    else
    {
      int v10 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
      if ([v10 conformsToType:*MEMORY[0x1E4F44498]])
      {
        signed __int16 v5 = 2;
      }
      else if ([v10 conformsToType:v7])
      {
        signed __int16 v5 = 1;
      }
      else if ([v10 conformsToType:*MEMORY[0x1E4F44448]])
      {
        signed __int16 v5 = 3;
      }
      else
      {
        signed __int16 v5 = 0;
      }
    }
  }

  return v5;
}

@end