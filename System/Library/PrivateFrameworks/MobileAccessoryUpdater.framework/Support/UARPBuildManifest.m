@interface UARPBuildManifest
- (BOOL)isChipEntryKey:(id)a3;
- (BOOL)parseBuildManifest:(id)a3;
- (NSArray)bundleIdentities;
- (UARPBuildManifest)initWithPlist:(id)a3;
- (id)chipNameForKey:(id)a3;
- (id)createBundleIdentity:(id)a3;
- (id)createChipEntryFromChipEntryDict:(id)a3 chipName:(id)a4;
- (id)createManifestEntryForKey:(id)a3 dictionary:(id)a4;
- (id)createNumberTupleForKey:(id)a3 object:(id)a4;
- (id)generateChipEntries:(id)a3;
- (id)numberForObject:(id)a3;
@end

@implementation UARPBuildManifest

- (UARPBuildManifest)initWithPlist:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UARPBuildManifest;
  v4 = [(UARPBuildManifest *)&v7 init];
  if (!v4
    || (v5 = +[NSDictionary dictionaryWithContentsOfURL:a3]) == 0|| ![(UARPBuildManifest *)v4 parseBuildManifest:v5])
  {

    return 0;
  }
  return v4;
}

- (BOOL)isChipEntryKey:(id)a3
{
  if ([a3 hasSuffix:@"BoardID"]) {
    return 1;
  }
  unint64_t v5 = 0;
  do
  {
    unint64_t v6 = v5;
    if (v5 == 3) {
      break;
    }
    unsigned int v7 = [a3 hasSuffix:off_10007DB80[v5 + 1]];
    unint64_t v5 = v6 + 1;
  }
  while (!v7);
  return v6 < 3;
}

- (BOOL)parseBuildManifest:(id)a3
{
  id v5 = +[NSMutableArray array];
  id v6 = [a3 objectForKeyedSubscript:@"BuildIdentities"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v7)
    {
LABEL_11:
      self->_bundleIdentities = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v5];
      LOBYTE(v12) = 1;
      return (char)v12;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v12 = [(UARPBuildManifest *)self createBundleIdentity:v11];
      if (!v12) {
        return (char)v12;
      }
      v13 = v12;
      [v5 addObject:v12];

      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_4;
        }
        goto LABEL_11;
      }
    }
  }
  LOBYTE(v12) = 0;
  return (char)v12;
}

- (id)chipNameForKey:(id)a3
{
  id v3 = objc_msgSend(a3, "componentsSeparatedByCharactersInSet:", +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", @","));
  if ([v3 count] == (id)1) {
    return @"Ap";
  }
  return [v3 firstObject];
}

- (id)createBundleIdentity:(id)a3
{
  id v31 = +[NSMutableDictionary dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v36 objects:v41 count:16];
  id v6 = &ADClientAddValueForScalarKey_ptr;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v37;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v37 != v8) {
        objc_enumerationMutation(a3);
      }
      uint64_t v10 = *(void *)(*((void *)&v36 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if ([(UARPBuildManifest *)self isChipEntryKey:v10])
      {
        id v11 = [(UARPBuildManifest *)self chipNameForKey:v10];
        id v12 = [v31 objectForKeyedSubscript:v11];
        if (!v12)
        {
          id v12 = +[NSMutableDictionary dictionary];
          [v31 setObject:v12 forKeyedSubscript:v11];
        }
        objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", v10), v10);
      }
      if (v7 == (id)++v9)
      {
        id v7 = [a3 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    id v13 = [a3 objectForKeyedSubscript:@"Manifest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v29 = a3;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v33;
        CFStringRef v17 = @"Info";
        v30 = self;
LABEL_16:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * v18);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          id result = objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", v19), "objectForKeyedSubscript:", v17);
          if (!result) {
            return result;
          }
          if (objc_msgSend(objc_msgSend(result, "objectForKeyedSubscript:", @"Personalize"), "BOOLValue"))
          {
            v21 = v6;
            id result = objc_msgSend(v31, "objectForKeyedSubscript:", -[UARPBuildManifest chipNameForKey:](self, "chipNameForKey:", v19));
            if (!result) {
              return result;
            }
            id v22 = result;
            CFStringRef v23 = v17;
            id v24 = [result objectForKeyedSubscript:@"Manifest"];
            if (!v24)
            {
              id v24 = +[NSMutableDictionary dictionary];
              [v22 setObject:v24 forKeyedSubscript:@"Manifest"];
            }
            objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(v13, "objectForKeyedSubscript:", v19), v19);
            id v6 = v21;
            CFStringRef v17 = v23;
            self = v30;
          }
          if (v15 == (id)++v18)
          {
            id v15 = [v13 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v15) {
              goto LABEL_16;
            }
            goto LABEL_28;
          }
        }
      }
      else
      {
LABEL_28:
        id v25 = [(UARPBuildManifest *)self generateChipEntries:v31];
        id result = [v25 count];
        if (!result) {
          return result;
        }
        id v26 = [v29 objectForKeyedSubscript:@"Info"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = [v26 objectForKeyedSubscript:@"BuildTrain"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v28 = [v26 objectForKeyedSubscript:@"BuildNumber"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              return -[UARPBundleIdentity initWithBuild:chipEntries:]([UARPBundleIdentity alloc], "initWithBuild:chipEntries:", [v6[325] stringWithFormat:@"%@%@", v27, v28], v25);
            }
          }
        }
      }
    }
  }
  return 0;
}

- (id)numberForObject:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = 0;
    if (sscanf((const char *)objc_msgSend(objc_msgSend(a3, "lowercaseString"), "UTF8String"), "0x%x", &v5) == 1) {
      return +[NSNumber numberWithUnsignedInt:v5];
    }
    else {
      return 0;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return a3;
    }
    else {
      return 0;
    }
  }
}

- (id)createNumberTupleForKey:(id)a3 object:(id)a4
{
  id result = [(UARPBuildManifest *)self numberForObject:a4];
  if (result)
  {
    id v6 = result;
    id v7 = [UARPPersonalizationNumberTuple32 alloc];
    id v8 = [v6 unsignedIntValue];
    return [(UARPPersonalizationNumberTuple32 *)v7 initWithKey:a3 value:v8];
  }
  return result;
}

- (id)createManifestEntryForKey:(id)a3 dictionary:(id)a4
{
  id result = [a4 objectForKeyedSubscript:@"Digest"];
  if (result)
  {
    id v7 = result;
    id v8 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"Trusted"), "BOOLValue");
    uint64_t v9 = [UARPBundleIdentityManifestEntry alloc];
    return [(UARPBundleIdentityManifestEntry *)v9 initWithName:a3 digest:v7 trusted:v8];
  }
  return result;
}

- (id)createChipEntryFromChipEntryDict:(id)a3 chipName:(id)a4
{
  id v7 = +[NSMutableArray array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v30 = [a3 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v30)
  {
    id v11 = 0;
    id v10 = 0;
    id v9 = 0;
    id v8 = 0;
LABEL_45:
    CFStringRef v23 = 0;
    goto LABEL_46;
  }
  id v25 = a4;
  id v8 = 0;
  id v9 = 0;
  id v10 = 0;
  id v11 = 0;
  uint64_t v29 = *(void *)v36;
  do
  {
    for (i = 0; i != v30; i = (char *)i + 1)
    {
      if (*(void *)v36 != v29) {
        objc_enumerationMutation(a3);
      }
      id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      id v14 = objc_msgSend(a3, "objectForKeyedSubscript:", v13, v25);
      if ([v13 hasSuffix:@"BoardID"])
      {
        if (v8) {
          goto LABEL_45;
        }
        id v8 = [(UARPBuildManifest *)self createNumberTupleForKey:v13 object:v14];
        if (!v8) {
          goto LABEL_45;
        }
      }
      else if ([v13 hasSuffix:@"ChipID"])
      {
        if (v9) {
          goto LABEL_45;
        }
        id v9 = [(UARPBuildManifest *)self createNumberTupleForKey:v13 object:v14];
        if (!v9) {
          goto LABEL_45;
        }
      }
      else if ([v13 hasSuffix:@"ManifestEpoch"])
      {
        if (v10) {
          goto LABEL_45;
        }
        id v10 = [(UARPBuildManifest *)self createNumberTupleForKey:v13 object:v14];
        if (!v10) {
          goto LABEL_45;
        }
      }
      else if ([v13 hasSuffix:@"SecurityDomain"])
      {
        if (v11) {
          goto LABEL_45;
        }
        id v11 = [(UARPBuildManifest *)self createNumberTupleForKey:v13 object:v14];
        if (!v11) {
          goto LABEL_45;
        }
      }
      else if ([v13 isEqual:@"Manifest"])
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v15)
        {
          id v16 = v15;
          id v26 = v9;
          id v27 = v10;
          id v28 = v11;
          uint64_t v17 = *(void *)v32;
          while (2)
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v32 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = -[UARPBuildManifest createManifestEntryForKey:dictionary:](self, "createManifestEntryForKey:dictionary:", *(void *)(*((void *)&v31 + 1) + 8 * (void)j), [v14 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * (void)j)]);
              if (!v19)
              {
                CFStringRef v23 = 0;
                id v10 = v27;
                id v11 = v28;
                id v9 = v26;
                goto LABEL_46;
              }
              v20 = v19;
              [v7 addObject:v19];
            }
            id v16 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v16) {
              continue;
            }
            break;
          }
          id v10 = v27;
          id v11 = v28;
          id v9 = v26;
        }
      }
    }
    id v30 = [a3 countByEnumeratingWithState:&v35 objects:v40 count:16];
  }
  while (v30);
  if (v8) {
    BOOL v21 = v9 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  BOOL v22 = v21 || v11 == 0;
  if (v22 || ![v7 count]) {
    goto LABEL_45;
  }
  CFStringRef v23 = [[UARPBundleIdentityChipEntry alloc] initWithChipName:v25 boardID:v8 chipID:v9 securityDomain:v11 manifest:v7];
  [(UARPBundleIdentityChipEntry *)v23 setManifestEpoch:v10];
LABEL_46:

  return v23;
}

- (id)generateChipEntries:(id)a3
{
  id v5 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return +[NSArray arrayWithArray:v5];
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a3);
    }
    id result = -[UARPBuildManifest createChipEntryFromChipEntryDict:chipName:](self, "createChipEntryFromChipEntryDict:chipName:", [a3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * v9)], *(void *)(*((void *)&v12 + 1) + 8 * v9));
    if (!result) {
      return result;
    }
    id v11 = result;
    [v5 addObject:result];

    if (v7 == (id)++v9)
    {
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return +[NSArray arrayWithArray:v5];
    }
  }
}

- (NSArray)bundleIdentities
{
  return self->_bundleIdentities;
}

@end