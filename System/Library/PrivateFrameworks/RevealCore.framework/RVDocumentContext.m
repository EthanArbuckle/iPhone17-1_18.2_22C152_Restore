@interface RVDocumentContext
+ (BOOL)supportsSecureCoding;
- (NSArray)existingDDResultsList;
- (NSArray)groupAllResults;
- (NSDate)contentReferenceDate;
- (NSNumber)groupCategory;
- (NSString)authorContactUUID;
- (NSString)authorEmailAddress;
- (NSString)authorName;
- (NSString)contentSubject;
- (NSString)coreSpotlightUniqueIdentifier;
- (NSString)groupTranscript;
- (NSString)selectedText;
- (NSTimeZone)contentReferenceTimeZone;
- (NSURL)documentURL;
- (RVDocumentContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorContactUUID:(id)a3;
- (void)setAuthorEmailAddress:(id)a3;
- (void)setAuthorName:(id)a3;
- (void)setContentReferenceDate:(id)a3;
- (void)setContentReferenceTimeZone:(id)a3;
- (void)setContentSubject:(id)a3;
- (void)setCoreSpotlightUniqueIdentifier:(id)a3;
- (void)setDocumentURL:(id)a3;
- (void)setExistingDDResultsList:(id)a3;
- (void)setGroupAllResults:(id)a3;
- (void)setGroupCategory:(id)a3;
- (void)setGroupTranscript:(id)a3;
- (void)setNameAndEmailWithRawSenderField:(id)a3;
- (void)setSelectedText:(id)a3;
@end

@implementation RVDocumentContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->groupTranscript, 0);
  objc_storeStrong((id *)&self->groupCategory, 0);
  objc_storeStrong((id *)&self->coreSpotlightUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->documentURL, 0);
  objc_storeStrong((id *)&self->selectedText, 0);
  objc_storeStrong((id *)&self->contentSubject, 0);
  objc_storeStrong((id *)&self->contentReferenceTimeZone, 0);
  objc_storeStrong((id *)&self->contentReferenceDate, 0);
  objc_storeStrong((id *)&self->authorContactUUID, 0);
  objc_storeStrong((id *)&self->authorEmailAddress, 0);
  objc_storeStrong((id *)&self->authorName, 0);
  objc_storeStrong((id *)&self->groupAllResults, 0);

  objc_storeStrong((id *)&self->existingDDResultsList, 0);
}

- (void)setGroupTranscript:(id)a3
{
}

- (NSString)groupTranscript
{
  return self->groupTranscript;
}

- (void)setGroupCategory:(id)a3
{
}

- (NSNumber)groupCategory
{
  return self->groupCategory;
}

- (void)setCoreSpotlightUniqueIdentifier:(id)a3
{
}

- (NSString)coreSpotlightUniqueIdentifier
{
  return self->coreSpotlightUniqueIdentifier;
}

- (void)setDocumentURL:(id)a3
{
}

- (NSURL)documentURL
{
  return self->documentURL;
}

- (void)setSelectedText:(id)a3
{
}

- (NSString)selectedText
{
  return self->selectedText;
}

- (void)setContentSubject:(id)a3
{
}

- (NSString)contentSubject
{
  return self->contentSubject;
}

- (void)setContentReferenceTimeZone:(id)a3
{
}

- (NSTimeZone)contentReferenceTimeZone
{
  return self->contentReferenceTimeZone;
}

- (void)setContentReferenceDate:(id)a3
{
}

- (NSDate)contentReferenceDate
{
  return self->contentReferenceDate;
}

- (void)setAuthorContactUUID:(id)a3
{
}

- (NSString)authorContactUUID
{
  return self->authorContactUUID;
}

- (void)setAuthorEmailAddress:(id)a3
{
}

- (NSString)authorEmailAddress
{
  return self->authorEmailAddress;
}

- (void)setAuthorName:(id)a3
{
}

- (NSString)authorName
{
  return self->authorName;
}

- (void)setNameAndEmailWithRawSenderField:(id)a3
{
  id v64 = a3;
  if (![v64 length]) {
    goto LABEL_128;
  }
  if (![(NSString *)self->authorEmailAddress length])
  {
    v62 = self;
    id v4 = v64;
    uint64_t v5 = [v4 length];
    v6 = NSZoneMalloc(0, 2 * v5 + 2);
    v7 = v6;
    v8 = v6;
    if (v5 >= 1)
    {
      uint64_t v9 = 0;
      int v10 = 0;
      int v11 = 0;
      char v60 = 0;
      char v12 = 0;
      char v13 = 1;
      v8 = v6;
      do
      {
        unsigned int v14 = [v4 characterAtIndex:v9];
        unsigned int v15 = v14;
        if (v14 == 92)
        {
          if (v5 <= v10 + 1)
          {
            if ((v12 & 1) == 0)
            {
              if (v11 < 1) {
                goto LABEL_20;
              }
LABEL_17:
              char v12 = 0;
              v11 -= v14 == 41;
              goto LABEL_26;
            }
LABEL_12:
            *v8++ = v14;
            v12 &= v14 != 34;
            goto LABEL_26;
          }
          _WORD *v8 = 92;
          v8[1] = [v4 characterAtIndex:v10 + 1];
          v8 += 2;
          ++v10;
        }
        else
        {
          if (v12) {
            goto LABEL_12;
          }
          if (v14 == 40)
          {
            char v12 = 0;
            ++v11;
          }
          else
          {
            if (v11 > 0) {
              goto LABEL_17;
            }
            if (v14 != 60)
            {
              if ((v60 & (v14 == 62)) != 0) {
                break;
              }
              if (v14 > 0x7F)
              {
                if (__maskrune(v14, 0x4000uLL))
                {
LABEL_21:
                  char v12 = 0;
                  if ((v13 & 1) == 0) {
                    *v8++ = 32;
                  }
                  char v13 = 1;
                  goto LABEL_26;
                }
              }
              else
              {
LABEL_20:
                if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v14 + 60) & 0x4000) != 0) {
                  goto LABEL_21;
                }
              }
              char v13 = 0;
              *v8++ = v15;
              v12 |= v15 == 34;
              goto LABEL_26;
            }
            char v12 = 0;
            char v60 = 1;
            v8 = v7;
          }
        }
LABEL_26:
        uint64_t v9 = ++v10;
      }
      while (v5 > v10);
    }
    uint64_t v16 = MEMORY[0x263EF8318];
    self = v62;
    while (1)
    {
      v17 = v8;
      uint64_t v18 = (char *)v8 - (char *)v7;
      if (v8 <= v7) {
        break;
      }
      --v8;
      unint64_t v19 = (unsigned __int16)*(v17 - 1);
      if (v19 > 0x7F)
      {
        if (!__maskrune(v19, 0x4000uLL)) {
          break;
        }
      }
      else if ((*(_DWORD *)(v16 + 4 * v19 + 60) & 0x4000) == 0)
      {
        break;
      }
    }
    _WORD *v17 = 0;
    v20 = (void *)[[NSString alloc] initWithCharacters:v7 length:v18 >> 1];
    NSZoneFree(0, v7);

    if ([v20 containsString:@"@"]
      && (unint64_t)[v20 length] >= 3)
    {
      uint64_t v21 = [v20 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C1EB018];
      authorEmailAddress = v62->authorEmailAddress;
      v62->authorEmailAddress = (NSString *)v21;
    }
  }
  authorName = self->authorName;
  p_authorName = &self->authorName;
  if ([(NSString *)authorName length]) {
    goto LABEL_128;
  }
  id v25 = v64;
  uint64_t v26 = [v25 length];
  NSUInteger v27 = 2 * v26 + 2;
  v28 = (unsigned __int16 *)NSZoneMalloc(0, v27);
  v29 = (unsigned __int16 *)NSZoneMalloc(0, v27);
  [v25 getCharacters:v29];
  v61 = v25;
  if (v26 < 1)
  {
    LOBYTE(v38) = 0;
    int v39 = 0;
    goto LABEL_100;
  }
  v63 = p_authorName;
  uint64_t v30 = 0;
  int v31 = 0;
  int v32 = 0;
  BOOL v33 = 1;
  while (1)
  {
    int v34 = v29[v30];
    if (v34 != 34 || v32 != 0) {
      break;
    }
    int v32 = 0;
    v31 ^= 1u;
LABEL_53:
    BOOL v33 = v26 > ++v30;
    if (v26 == v30) {
      goto LABEL_54;
    }
  }
  if (!((v34 != 40) | v31 & 1))
  {
    int v31 = 0;
    ++v32;
    goto LABEL_53;
  }
  if (!((v34 != 41) | v31 & 1))
  {
    int v31 = 0;
    --v32;
    goto LABEL_53;
  }
  if (v34 != 60 || ((v31 ^ 1) & 1) == 0 || v32) {
    goto LABEL_53;
  }
LABEL_54:
  int v36 = 0;
  int v37 = 0;
  int v38 = 0;
  int v39 = 0;
  uint64_t v40 = 0;
  v41 = v29;
  v42 = v28;
  do
  {
    unsigned int v43 = *v41;
    if (v43 != 92)
    {
      BOOL v44 = v39 == 0;
      if (v43 == 34 && v39 == 0)
      {
        int v39 = 0;
        v38 ^= 1u;
      }
      else
      {
        if ((v43 != 41) | v38 & 1) {
          goto LABEL_63;
        }
        int v38 = 0;
        --v39;
      }
LABEL_71:
      if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *v41 + 60) & 0x4000) == 0) {
        goto LABEL_77;
      }
      goto LABEL_72;
    }
    if (((v41[1] != 0) & ~v36) != 0)
    {
      int v36 = 1;
      goto LABEL_89;
    }
    BOOL v44 = v39 == 0;
LABEL_63:
    int v46 = (v43 == 60) & ~(_BYTE)v38 & v44;
    if (v46) {
      int v39 = 0;
    }
    v37 |= v46;
    if (v43 <= 0x7F) {
      goto LABEL_71;
    }
    if (!__maskrune(v43, 0x4000uLL)) {
      goto LABEL_77;
    }
LABEL_72:
    if (!v40) {
      goto LABEL_84;
    }
    unint64_t v47 = *(v42 - 1);
    if (v47 > 0x7F)
    {
      if (__maskrune(v47, 0x4000uLL)) {
        goto LABEL_84;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v47 + 60) & 0x4000) != 0)
    {
      goto LABEL_84;
    }
LABEL_77:
    int v48 = *v41;
    if (v48 != 34 || v39)
    {
      if (v33)
      {
        if (v37)
        {
          int v37 = 1;
          goto LABEL_84;
        }
      }
      else if (v39 < 1)
      {
        goto LABEL_84;
      }
      ++v40;
      unsigned __int16 *v42 = v48;
    }
LABEL_84:
    int v49 = *v41;
    if ((v49 != 40) | v38 & 1)
    {
      int v36 = 0;
      int v50 = (v49 != 62) | v38 | (v39 != 0);
      if ((v50 & 1) == 0) {
        int v39 = 0;
      }
      v37 &= v50;
    }
    else
    {
      int v38 = 0;
      int v36 = 0;
      ++v39;
    }
LABEL_89:
    v42 = &v28[v40];
    ++v41;
    --v26;
  }
  while (v26);
  if (v40 < 1)
  {
    p_authorName = v63;
  }
  else
  {
    p_authorName = v63;
    do
    {
      unint64_t v51 = *(v42 - 1);
      if (v51 > 0x7F)
      {
        if (!__maskrune(v51, 0x4000uLL)) {
          goto LABEL_102;
        }
      }
      else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v51 + 60) & 0x4000) == 0)
      {
        goto LABEL_102;
      }
      --v42;
    }
    while (v40-- > 1);
LABEL_100:
    uint64_t v40 = 0;
    v42 = v28;
  }
LABEL_102:
  unsigned __int16 *v42 = 0;
  if (v39 || (v38 & 1) != 0)
  {
    v55 = v61;
    id v57 = v61;
LABEL_114:
    if (v57) {
      goto LABEL_121;
    }
LABEL_118:
    if (v42 == v28)
    {
      id v57 = 0;
      v42 = v28;
    }
    else
    {
      id v57 = [NSString stringWithCharacters:v28 length:v42 - v28];
    }
    goto LABEL_121;
  }
  v42 = &v28[v40];
  if (v40 < 2)
  {
    v55 = v61;
    goto LABEL_118;
  }
  v53 = 0;
  uint64_t v54 = v40 + 1;
  v55 = v61;
  while (1)
  {
    int v56 = *v28;
    if (v56 != 39) {
      break;
    }
    if (*(v42 - 1) != 39) {
      goto LABEL_117;
    }
LABEL_111:
    *--v42 = 0;
    id v57 = [NSString stringWithCharacters:v28 + 1 length:v54 - 3];

    --v54;
    v53 = v57;
    if (v54 <= 2) {
      goto LABEL_114;
    }
  }
  if (v56 == 34 && *(v42 - 1) == 34) {
    goto LABEL_111;
  }
LABEL_117:
  id v57 = v53;
  if (!v53) {
    goto LABEL_118;
  }
LABEL_121:
  NSZoneFree(0, v28);
  NSZoneFree(0, v29);
  if (v42 == v28) {
    v58 = v55;
  }
  else {
    v58 = v57;
  }
  id v59 = v58;

  if ([v59 length] && (objc_msgSend(v59, "containsString:", @"@") & 1) == 0) {
    objc_storeStrong((id *)p_authorName, v58);
  }

LABEL_128:
}

- (RVDocumentContext)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RVDocumentContext *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorName"];
    authorName = v5->authorName;
    v5->authorName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorEmailAddress"];
    authorEmailAddress = v5->authorEmailAddress;
    v5->authorEmailAddress = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorContactUUID"];
    authorContactUUID = v5->authorContactUUID;
    v5->authorContactUUID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentReferenceDate"];
    contentReferenceDate = v5->contentReferenceDate;
    v5->contentReferenceDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentReferenceTimeZone"];
    contentReferenceTimeZone = v5->contentReferenceTimeZone;
    v5->contentReferenceTimeZone = (NSTimeZone *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentSubject"];
    contentSubject = v5->contentSubject;
    v5->contentSubject = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedText"];
    selectedText = v5->selectedText;
    v5->selectedText = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentURL"];
    documentURL = v5->documentURL;
    v5->documentURL = (NSURL *)v20;

    v22 = (void *)MEMORY[0x263EFFA08];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"existingDDResultsList"];
    existingDDResultsList = v5->existingDDResultsList;
    v5->existingDDResultsList = (NSArray *)v25;

    uint64_t v27 = [v4 decodeObjectOfClasses:v24 forKey:@"groupAllResults"];
    groupAllResults = v5->groupAllResults;
    v5->groupAllResults = (NSArray *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupCategory"];
    groupCategory = v5->groupCategory;
    v5->groupCategory = (NSNumber *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupTranscript"];
    groupTranscript = v5->groupTranscript;
    v5->groupTranscript = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coreSpotlightUniqueIdentifier"];
    coreSpotlightUniqueIdentifier = v5->coreSpotlightUniqueIdentifier;
    v5->coreSpotlightUniqueIdentifier = (NSString *)v33;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RVDocumentContext *)self authorName];
  [v4 encodeObject:v5 forKey:@"authorName"];

  uint64_t v6 = [(RVDocumentContext *)self authorEmailAddress];
  [v4 encodeObject:v6 forKey:@"authorEmailAddress"];

  v7 = [(RVDocumentContext *)self authorContactUUID];
  [v4 encodeObject:v7 forKey:@"authorContactUUID"];

  uint64_t v8 = [(RVDocumentContext *)self contentReferenceDate];
  [v4 encodeObject:v8 forKey:@"contentReferenceDate"];

  uint64_t v9 = [(RVDocumentContext *)self contentReferenceTimeZone];
  [v4 encodeObject:v9 forKey:@"contentReferenceTimeZone"];

  uint64_t v10 = [(RVDocumentContext *)self contentSubject];
  [v4 encodeObject:v10 forKey:@"contentSubject"];

  int v11 = [(RVDocumentContext *)self selectedText];
  [v4 encodeObject:v11 forKey:@"selectedText"];

  uint64_t v12 = [(RVDocumentContext *)self documentURL];
  [v4 encodeObject:v12 forKey:@"documentURL"];

  char v13 = [(RVDocumentContext *)self existingDDResultsList];
  [v4 encodeObject:v13 forKey:@"existingDDResultsList"];

  uint64_t v14 = [(RVDocumentContext *)self groupAllResults];
  [v4 encodeObject:v14 forKey:@"groupAllResults"];

  unsigned int v15 = [(RVDocumentContext *)self groupCategory];
  [v4 encodeObject:v15 forKey:@"groupCategory"];

  uint64_t v16 = [(RVDocumentContext *)self groupTranscript];
  [v4 encodeObject:v16 forKey:@"groupTranscript"];

  id v17 = [(RVDocumentContext *)self coreSpotlightUniqueIdentifier];
  [v4 encodeObject:v17 forKey:@"coreSpotlightUniqueIdentifier"];
}

- (NSArray)groupAllResults
{
  return self->groupAllResults;
}

- (void)setGroupAllResults:(id)a3
{
  convertResultToObjCInArrayIfNecessary(a3);
  self->groupAllResults = (NSArray *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x270F9A758]();
}

- (NSArray)existingDDResultsList
{
  return self->existingDDResultsList;
}

- (void)setExistingDDResultsList:(id)a3
{
  convertResultToObjCInArrayIfNecessary(a3);
  self->existingDDResultsList = (NSArray *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x270F9A758]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end