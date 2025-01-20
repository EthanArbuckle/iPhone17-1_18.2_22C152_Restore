@interface NSDictionary
+ (id)MCDictionaryFromFile:(id)a3;
+ (id)MCShortenedArray:(id)a3;
+ (id)MCShortenedData:(id)a3;
+ (id)MCShortenedDictionary:(id)a3;
+ (id)MCShortenedObject:(id)a3;
- (BOOL)MCValidateBoolRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5;
- (BOOL)MCValidateIntersectionRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5;
- (BOOL)MCValidateRestrictions;
- (BOOL)MCValidateUnionRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5;
- (BOOL)MCValidateValueRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5;
- (BOOL)MCWriteToBinaryFile:(id)a3;
- (BOOL)MCWriteToBinaryFile:(id)a3 atomically:(BOOL)a4;
- (id)MCDeepCopy;
- (id)MCDictionaryAdditiveDeltaToCreateDictionary:(id)a3;
- (id)MCDictionarySubtractiveDeltaToCreateDictionary:(id)a3;
- (id)MCDictionaryWithLeafValuesSetToValue:(id)a3;
- (id)MCInsertedKeysFromDictionary:(id)a3 withNewLeafValue:(id)a4;
- (id)MCMutableDeepCopy;
- (id)MCMutableDeepCopyWithZone:(_NSZone *)a3;
- (id)MCRemovedKeysFromDictionary:(id)a3;
- (id)MCRetainOptionalNonZeroLengthStringKey:(id)a3 errorDomain:(id)a4 invalidDataCode:(int64_t)a5 invalidDataErrorString:(id)a6 outError:(id *)a7;
- (id)MCRetainOptionalObjectKey:(id)a3 type:(Class)a4 errorDomain:(id)a5 invalidDataCode:(int64_t)a6 invalidDataErrorString:(id)a7 outError:(id *)a8;
- (id)MCRetainRequiredNonZeroLengthStringKey:(id)a3 errorDomain:(id)a4 missingDataCode:(int64_t)a5 missingDataErrorString:(id)a6 invalidDataCode:(int64_t)a7 invalidDataErrorString:(id)a8 outError:(id *)a9;
- (id)MCRetainRequiredObjectKey:(id)a3 type:(Class)a4 errorDomain:(id)a5 missingDataCode:(int64_t)a6 missingDataErrorString:(id)a7 invalidDataCode:(int64_t)a8 invalidDataErrorString:(id)a9 outError:(id *)a10;
- (id)MCShortenedPlistDescription;
@end

@implementation NSDictionary

- (BOOL)MCWriteToBinaryFile:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)MCDictionaryWriter) initWithDictionary:self path:v4];

  unsigned __int8 v6 = [v5 write];
  return v6;
}

- (BOOL)MCWriteToBinaryFile:(id)a3 atomically:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v17 = 0;
  v8 = +[NSPropertyListSerialization dataWithPropertyList:self format:200 options:0 error:&v17];
  id v9 = v17;
  if (v8)
  {
    id v16 = 0;
    unsigned __int8 v10 = [v8 writeToFile:v6 options:v4 error:&v16];
    id v11 = v16;
    if (v10)
    {
      BOOL v12 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Could not serialize data for %{public}@: %{public}@", buf, 0x16u);
    }
    id v11 = 0;
  }
  v14 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not write data to path %{public}@: %{public}@", buf, 0x16u);
  }
  BOOL v12 = 0;
LABEL_10:

  return v12;
}

+ (id)MCDictionaryFromFile:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[NSURL fileURLWithPath:v3];
  id v9 = 0;
  id v5 = +[NSDictionary dictionaryWithContentsOfURL:v4 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    v7 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v11 = v3;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to make dictionary from file at path: %{public}@ with error: %{public}@", buf, 0x16u);
    }
  }

  return v5;
}

- (id)MCMutableDeepCopyWithZone:(_NSZone *)a3
{
  id v5 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSDictionary count](self, "count")];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(NSDictionary *)self keyEnumerator];
  id v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v18 + 1) + 8 * (void)v9);
        id v11 = v10;
        if ([v10 conformsToProtocol:&OBJC_PROTOCOL___NSMutableCopying])
        {
          id v11 = [v10 mutableCopyWithZone:a3];
        }
        __int16 v12 = [(NSDictionary *)self objectForKey:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = [v12 MCMutableDeepCopyWithZone:a3];
LABEL_13:
          v14 = v13;
          [v5 setObject:v13 forKey:v11];

          goto LABEL_14;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || [v12 conformsToProtocol:&OBJC_PROTOCOL___NSMutableCopying])
        {
          id v13 = [v12 mutableCopyWithZone:a3];
          goto LABEL_13;
        }
        if ([v12 conformsToProtocol:&OBJC_PROTOCOL___NSCopying])
        {
          id v13 = [v12 copyWithZone:a3];
          goto LABEL_13;
        }
        [v5 setObject:v12 forKey:v11];
LABEL_14:

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v15 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      id v7 = v15;
    }
    while (v15);
  }

  return v5;
}

- (id)MCMutableDeepCopy
{
  return [(NSDictionary *)self MCMutableDeepCopyWithZone:0];
}

- (id)MCDeepCopy
{
  return [(NSDictionary *)self MCDeepCopyWithZone:0];
}

- (id)MCRetainRequiredObjectKey:(id)a3 type:(Class)a4 errorDomain:(id)a5 missingDataCode:(int64_t)a6 missingDataErrorString:(id)a7 invalidDataCode:(int64_t)a8 invalidDataErrorString:(id)a9 outError:(id *)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  long long v19 = [(NSDictionary *)self objectForKey:v15];
  if (v19)
  {
    if (objc_opt_isKindOfClass())
    {
      id v20 = v19;
      goto LABEL_10;
    }
    if (a10)
    {
      id v26 = v15;
      long long v21 = MCErrorArray();
      uint64_t v22 = MCErrorTypeFatal;
      id v23 = v16;
      int64_t v24 = a8;
      goto LABEL_8;
    }
  }
  else if (a10)
  {
    id v26 = v15;
    long long v21 = MCErrorArray();
    uint64_t v22 = MCErrorTypeFatal;
    id v23 = v16;
    int64_t v24 = a6;
LABEL_8:
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v23, v24, v21, v22, v26, 0);
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v20 = 0;
LABEL_10:

  return v20;
}

- (id)MCRetainOptionalObjectKey:(id)a3 type:(Class)a4 errorDomain:(id)a5 invalidDataCode:(int64_t)a6 invalidDataErrorString:(id)a7 outError:(id *)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(NSDictionary *)self objectForKey:v13];
  if (v16 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a8)
    {
      id v17 = MCErrorArray();
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v14, a6, v17, MCErrorTypeFatal, v13, 0);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      a8 = 0;
    }
  }
  else
  {
    a8 = v16;
  }

  return a8;
}

- (id)MCRetainRequiredNonZeroLengthStringKey:(id)a3 errorDomain:(id)a4 missingDataCode:(int64_t)a5 missingDataErrorString:(id)a6 invalidDataCode:(int64_t)a7 invalidDataErrorString:(id)a8 outError:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  long long v19 = [(NSDictionary *)self objectForKey:v15];
  if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a9)
    {
      id v26 = v15;
      long long v21 = MCErrorArray();
      uint64_t v22 = MCErrorTypeFatal;
      id v23 = v16;
      int64_t v24 = a7;
LABEL_9:
      +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v23, v24, v21, v22, v26, 0);
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if ([v19 length])
    {
      id v20 = v19;
      goto LABEL_11;
    }
    if (a9)
    {
      id v26 = v15;
      long long v21 = MCErrorArray();
      uint64_t v22 = MCErrorTypeFatal;
      id v23 = v16;
      int64_t v24 = a5;
      goto LABEL_9;
    }
  }
  id v20 = 0;
LABEL_11:

  return v20;
}

- (id)MCRetainOptionalNonZeroLengthStringKey:(id)a3 errorDomain:(id)a4 invalidDataCode:(int64_t)a5 invalidDataErrorString:(id)a6 outError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = [(NSDictionary *)self objectForKey:v12];
  if (!v15) {
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v15 length])
    {
LABEL_4:
      a7 = v15;
      goto LABEL_8;
    }
  }
  else
  {
    if (!a7) {
      goto LABEL_8;
    }
    id v16 = MCErrorArray();
    +[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v13, a5, v16, MCErrorTypeFatal, v12, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  a7 = 0;
LABEL_8:

  return a7;
}

- (id)MCShortenedPlistDescription
{
  v2 = [(id)objc_opt_class() MCShortenedDictionary:self];
  id v3 = [v2 description];

  return v3;
}

+ (id)MCShortenedObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [a1 MCShortenedArray:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [a1 MCShortenedDictionary:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = [a1 MCShortenedData:v4];
      }
      else
      {
        id v5 = v4;
      }
    }
  }
  id v6 = v5;

  return v6;
}

+ (id)MCShortenedData:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    if ((unint64_t)[v3 length] > 0x10)
    {
      id v4 = [v3 subdataWithRange:0, 8];
      id v6 = [v4 MCHexString];
      id v7 = [v3 subdataWithRange:[v3 length] - 8, 8];
      uint64_t v8 = [v7 MCHexString];
      id v5 = +[NSString stringWithFormat:@"0x%@ ... 0x%@", v6, v8];
    }
    else
    {
      id v4 = [v3 MCHexString];
      id v5 = +[NSString stringWithFormat:@"0x%@", v4];
    }
  }
  else
  {
    id v5 = @"<empty>";
  }
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Data { length = %lu, bytes = %@ }", [v3 length], v5);

  return v9;
}

+ (id)MCShortenedArray:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [a1 MCShortenedObject:*(void *)(*((void *)&v13 + 1) + 8 * i) :v13];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)MCShortenedDictionary:(id)a3
{
  id v4 = a3;
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015CE0;
  v7[3] = &unk_1000EB4E0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v5;
  id v9 = a1;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (BOOL)MCValidateRestrictions
{
  id v3 = +[MCRestrictionManager sharedManager];
  id v4 = [v3 defaultRestrictions];

  [(NSDictionary *)self objectForKeyedSubscript:MCRestrictedBoolKey];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v40;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        if (![(NSDictionary *)self MCValidateBoolRestriction:*(void *)(*((void *)&v39 + 1) + 8 * i) inRestrictions:v5 defaultRestrictions:v4])
        {
          BOOL v25 = 0;
          id v10 = v5;
          goto LABEL_41;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  [(NSDictionary *)self objectForKeyedSubscript:MCRestrictedValueKey];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v36;
    while (2)
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        if (![(NSDictionary *)self MCValidateValueRestriction:*(void *)(*((void *)&v35 + 1) + 8 * (void)j) inRestrictions:v10 defaultRestrictions:v4])
        {
          BOOL v25 = 0;
          id v15 = v10;
          goto LABEL_40;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  [(NSDictionary *)self objectForKeyedSubscript:MCIntersectionKey];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = [v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v32;
    while (2)
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        if (![(NSDictionary *)self MCValidateIntersectionRestriction:*(void *)(*((void *)&v31 + 1) + 8 * (void)k) inRestrictions:v15 defaultRestrictions:v4])
        {
          BOOL v25 = 0;
          id v20 = v15;
          goto LABEL_39;
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v31 objects:v44 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  [(NSDictionary *)self objectForKeyedSubscript:MCUnionKey];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = [v20 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    while (2)
    {
      for (m = 0; m != v22; m = (char *)m + 1)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        if (!-[NSDictionary MCValidateUnionRestriction:inRestrictions:defaultRestrictions:](self, "MCValidateUnionRestriction:inRestrictions:defaultRestrictions:", *(void *)(*((void *)&v27 + 1) + 8 * (void)m), v20, v4, (void)v27))
        {
          BOOL v25 = 0;
          goto LABEL_38;
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v27 objects:v43 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
  BOOL v25 = 1;
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
  return v25;
}

- (BOOL)MCValidateBoolRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 objectForKeyedSubscript:MCRestrictedBoolKey];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    id v11 = [v8 objectForKeyedSubscript:v7];
    id v12 = [v11 objectForKeyedSubscript:MCRestrictedBoolPreferenceKey];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:v7];
      uint64_t v13 = [(id)v10 objectForKeyedSubscript:MCRestrictedBoolValueKey];

      objc_opt_class();
      LOBYTE(v10) = objc_opt_isKindOfClass();
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10 & 1;
}

- (BOOL)MCValidateValueRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 objectForKeyedSubscript:MCRestrictedValueKey];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    id v11 = [v8 objectForKeyedSubscript:v7];
    id v12 = [v11 objectForKeyedSubscript:MCRestrictedValuePreferSmallerValuesKey];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:v7];
      uint64_t v13 = [(id)v10 objectForKeyedSubscript:MCRestrictedValueValueKey];

      objc_opt_class();
      LOBYTE(v10) = objc_opt_isKindOfClass();
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10 & 1;
}

- (BOOL)MCValidateIntersectionRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 objectForKeyedSubscript:MCIntersectionKey];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    id v11 = [v8 objectForKeyedSubscript:v7];
    id v12 = [v11 objectForKeyedSubscript:MCIntersectionValuesKey];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)MCValidateUnionRestriction:(id)a3 inRestrictions:(id)a4 defaultRestrictions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 objectForKeyedSubscript:MCUnionKey];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    id v11 = [v8 objectForKeyedSubscript:v7];
    id v12 = [v11 objectForKeyedSubscript:MCUnionValuesKey];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)MCDictionaryAdditiveDeltaToCreateDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = -[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v11, (void)v16);
        uint64_t v13 = [v6 objectForKeyedSubscript:v11];
        if (!v12) {
          goto LABEL_11;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_11;
        }
        if ([v13 isEqual:v12]) {
          goto LABEL_12;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v14 = [v12 MCDictionaryAdditiveDeltaToCreateDictionary:v13];
          [v5 setObject:v14 forKeyedSubscript:v11];
        }
        else
        {
LABEL_11:
          [v5 setObject:v13 forKeyedSubscript:v11];
        }
LABEL_12:
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)MCDictionarySubtractiveDeltaToCreateDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self;
  id v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v11, (void)v16);
        uint64_t v13 = [v4 objectForKeyedSubscript:v11];
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([v13 isEqual:v12] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v14 = [v12 MCDictionarySubtractiveDeltaToCreateDictionary:v13];
              if ([v14 count]) {
                [v5 setObject:v14 forKeyedSubscript:v11];
              }
            }
          }
        }
        else
        {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      id v8 = [(NSDictionary *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)MCRemovedKeysFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionaryWithDictionary:self];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    long long v18 = self;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [(NSDictionary *)self objectForKeyedSubscript:v11];
        uint64_t v13 = [v6 objectForKeyedSubscript:v11];
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            long long v14 = v5;
            id v15 = +[NSMutableDictionary dictionaryWithDictionary:v12];
            long long v16 = [v15 MCRemovedKeysFromDictionary:v13];

            id v5 = v14;
            if ([v16 count]) {
              [v14 setObject:v16 forKeyedSubscript:v11];
            }
            else {
              [v14 removeObjectForKey:v11];
            }

            self = v18;
          }
          else
          {
            [v5 removeObjectForKey:v11];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)MCInsertedKeysFromDictionary:(id)a3 withNewLeafValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v23 = +[NSMutableDictionary dictionaryWithDictionary:self];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v6;
  id v24 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v24)
  {
    long long v21 = self;
    uint64_t v22 = *(void *)v26;
    id v20 = v8;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = [(NSDictionary *)self objectForKeyedSubscript:v10];
        uint64_t v12 = [v8 objectForKeyedSubscript:v10];
        uint64_t v13 = (void *)v12;
        if (v7) {
          long long v14 = v7;
        }
        else {
          long long v14 = (void *)v12;
        }
        id v15 = v14;
        long long v16 = v13;
        if (v7)
        {
          objc_opt_class();
          long long v16 = v7;
          if (objc_opt_isKindOfClass())
          {
            long long v16 = [v13 MCDictionaryWithLeafValuesSetToValue:v7];
          }
        }
        if (v11
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          long long v17 = +[NSMutableDictionary dictionaryWithDictionary:v11];
          long long v18 = [v17 MCInsertedKeysFromDictionary:v13 withNewLeafValue:v7];

          id v8 = v20;
          [v23 setObject:v18 forKeyedSubscript:v10];

          self = v21;
        }
        else
        {
          [v23 setObject:v16 forKeyedSubscript:v10];
        }
      }
      id v24 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v24);
  }

  return v23;
}

- (id)MCDictionaryWithLeafValuesSetToValue:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionaryWithDictionary:self];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self;
  id v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v11, (void)v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v12 MCDictionaryWithLeafValuesSetToValue:v4];
          [v5 setObject:v13 forKeyedSubscript:v11];
        }
        else
        {
          [v5 setObject:v4 forKeyedSubscript:v11];
        }
      }
      id v8 = [(NSDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

@end