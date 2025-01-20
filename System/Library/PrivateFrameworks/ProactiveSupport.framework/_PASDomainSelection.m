@interface _PASDomainSelection
+ (BOOL)supportsSecureCoding;
- (BOOL)containsDomain:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDomainSelection:(id)a3;
- (_PASDomainSelection)init;
- (_PASDomainSelection)initWithCoder:(id)a3;
- (_PASDomainSelection)initWithDomain:(id)a3;
- (_PASDomainSelection)initWithDomainsFromArray:(id)a3;
- (_PASDomainSelection)initWithDomainsFromSet:(id)a3;
- (id)_initWithNonOverlappingDomainSet:(id)a3;
- (id)allDomains;
- (id)description;
- (id)globPatterns;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _PASDomainSelection

- (unint64_t)count
{
  if ([(_PASDomainSelection *)self isEmpty]) {
    return 0;
  }
  v4 = [(_PASDomainSelection *)self allDomains];
  unint64_t v5 = [v4 count];

  return v5;
}

- (_PASDomainSelection)initWithDomainsFromArray:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] > 1)
  {
    v6 = (_PASDomainSelection *)objc_opt_new();
    [(_PASDomainSelection *)v6 addDomainsFromArray:v4];
  }
  else
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];

    self = (_PASDomainSelection *)[(_PASDomainSelection *)self _initWithNonOverlappingDomainSet:v5];
    id v4 = (id)v5;
    v6 = self;
  }

  return v6;
}

- (id)_initWithNonOverlappingDomainSet:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    id v5 = [[_PASImmutableDomainSelection alloc] _initWithNonOverlappingDomainSet:v4];
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  v6 = v5;

  return v6;
}

- (_PASDomainSelection)init
{
  v3.receiver = self;
  v3.super_class = (Class)_PASDomainSelection;
  return [(_PASDomainSelection *)&v3 init];
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(_PASDomainSelection *)self count];
  BOOL v6 = [(_PASDomainSelection *)self isEmpty];
  v7 = [(_PASDomainSelection *)self allDomains];
  if (description__pasOnceToken6 != -1) {
    dispatch_once(&description__pasOnceToken6, &__block_literal_global_2553);
  }
  if (v6) {
    v8 = &stru_1EF678A50;
  }
  else {
    v8 = @": ";
  }
  v9 = [v7 sortedArrayUsingDescriptors:description__pasExprOnceResult];
  v10 = objc_msgSend(v9, "_pas_componentsJoinedByString:", @", ");
  v11 = (void *)[v3 initWithFormat:@"%@ (count=%tu%@%@)", v4, v5, v8, v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_PASDomainSelection *)self allDomains];
  [v4 encodeObject:v5 forKey:@"d"];
}

- (_PASDomainSelection)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1A62450A0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"d"];

  if (!v9) {
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_PASDomainSelectionErrorDomain" code:1 userInfo:0];
    [v4 failWithError:v18];

LABEL_16:
    v15 = 0;
    goto LABEL_14;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_PASDomainSelectionErrorDomain" code:1 userInfo:0];
          [v4 failWithError:v16];

          v15 = 0;
          goto LABEL_13;
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  self = (_PASDomainSelection *)[(_PASDomainSelection *)self _initWithNonOverlappingDomainSet:v10];
  v15 = self;
LABEL_13:

LABEL_14:
  return v15;
}

- (BOOL)isEqualToDomainSelection:(id)a3
{
  if (a3) {
    return [a3 isEmpty];
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_PASDomainSelection *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_PASDomainSelection *)self isEqualToDomainSelection:v5];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  [v4 addDomainsFromSelection:self];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEmpty
{
  return 1;
}

- (id)globPatterns
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if ([(_PASDomainSelection *)self isEmpty])
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_50;
  }
  id v4 = [(_PASDomainSelection *)self allDomains];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", 2 * objc_msgSend(v4, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (!v5) {
    goto LABEL_49;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v60;
  uint64_t v41 = *(void *)v60;
  v42 = v3;
  do
  {
    uint64_t v8 = 0;
    uint64_t v43 = v6;
    do
    {
      if (*(void *)v60 != v7) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v59 + 1) + 8 * v8);
      uint64_t v46 = MEMORY[0x1A62450A0]();
      id v10 = v9;
      uint64_t v11 = self;

      if (!v11) {
        goto LABEL_45;
      }
      uint64_t v45 = v8;
      uint64_t v58 = 0;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      *(_OWORD *)theString = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      *(_OWORD *)buffer = 0u;
      CFIndex Length = CFStringGetLength(v10);
      theString[0] = v10;
      *((void *)&v56 + 1) = 0;
      *(void *)&long long v57 = Length;
      CFStringRef CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(v10);
      CStringPtr = 0;
      theString[1] = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v10, 0x600u);
      }
      *(void *)&long long v56 = CStringPtr;
      *((void *)&v57 + 1) = 0;
      uint64_t v58 = 0;
      if (Length < 1)
      {
        uint64_t v8 = v45;
LABEL_45:

LABEL_46:
        [v3 addObject:v10];
        v39 = (void *)MEMORY[0x1A62450A0]();
        v16 = [(__CFString *)v10 stringByAppendingString:@".*"];
        [v3 addObject:v16];
        v35 = (void *)v46;
        goto LABEL_47;
      }
      uint64_t v15 = 0;
      v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v20 = 64;
      do
      {
        if ((unint64_t)v19 >= 4) {
          uint64_t v21 = 4;
        }
        else {
          uint64_t v21 = v19;
        }
        uint64_t v22 = v57;
        if ((uint64_t)v57 <= v19) {
          goto LABEL_38;
        }
        if (theString[1])
        {
          UniChar v23 = *((_WORD *)&theString[1]->isa + v19 + *((void *)&v56 + 1));
        }
        else if ((void)v56)
        {
          UniChar v23 = *(char *)(v56 + *((void *)&v56 + 1) + v19);
        }
        else
        {
          uint64_t v24 = *((void *)&v57 + 1);
          if (v58 <= v19 || *((void *)&v57 + 1) > v19)
          {
            uint64_t v26 = v21 + v15;
            uint64_t v27 = v20 - v21;
            uint64_t v28 = v19 - v21;
            uint64_t v29 = v28 + 64;
            if (v28 + 64 >= (uint64_t)v57) {
              uint64_t v29 = v57;
            }
            *((void *)&v57 + 1) = v28;
            uint64_t v58 = v29;
            if ((uint64_t)v57 >= v27) {
              uint64_t v22 = v27;
            }
            v66.length = v22 + v26;
            v66.location = v28 + *((void *)&v56 + 1);
            CFStringGetCharacters(theString[0], v66, buffer);
            uint64_t v24 = *((void *)&v57 + 1);
          }
          UniChar v23 = buffer[v19 - v24];
        }
        uint64_t v30 = v23;
        uint64_t v31 = (1 << (v23 - 42)) & 0x2000000200001;
        if ((v30 - 42) > 0x31 || v31 == 0)
        {
LABEL_38:
          ++v18;
        }
        else
        {
          if (!v16) {
            v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", -[__CFString length](v10, "length"));
          }
          v33 = -[__CFString substringWithRange:](v10, "substringWithRange:", v17, v18);
          [v16 appendFormat:@"%@[%c]", v33, v30];

          uint64_t v34 = v18 + v17;
          uint64_t v18 = 0;
          uint64_t v17 = v34 + 1;
        }
        ++v19;
        --v15;
        ++v20;
      }
      while (Length != v19);

      id v3 = v42;
      uint64_t v6 = v43;
      uint64_t v7 = v41;
      uint64_t v8 = v45;
      if (!v16) {
        goto LABEL_46;
      }
      v35 = (void *)v46;
      if (v18)
      {
        v36 = (void *)MEMORY[0x1A62450A0]();
        v37 = -[__CFString substringWithRange:](v10, "substringWithRange:", v17, v18);
        [v16 appendString:v37];
      }
      v38 = (void *)[v16 copy];
      [v42 addObject:v38];

      [v16 appendString:@".*"];
      [v42 addObject:v16];
LABEL_47:

      ++v8;
    }
    while (v8 != v6);
    uint64_t v6 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
  }
  while (v6);
LABEL_49:

LABEL_50:

  return v3;
}

- (id)allDomains
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (BOOL)containsDomain:(id)a3
{
  return 0;
}

- (_PASDomainSelection)initWithDomainsFromSet:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] > 1)
  {
    uint64_t v6 = (_PASDomainSelection *)objc_opt_new();
    [(_PASDomainSelection *)v6 addDomainsFromSet:v4];
  }
  else
  {
    uint64_t v5 = (void *)[v4 copy];
    self = (_PASDomainSelection *)[(_PASDomainSelection *)self _initWithNonOverlappingDomainSet:v5];

    uint64_t v6 = self;
  }

  return v6;
}

- (_PASDomainSelection)initWithDomain:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1A62450A0]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = (void *)[v4 copy];
  uint64_t v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);

  v9 = [(_PASDomainSelection *)self _initWithNonOverlappingDomainSet:v8];

  return v9;
}

@end