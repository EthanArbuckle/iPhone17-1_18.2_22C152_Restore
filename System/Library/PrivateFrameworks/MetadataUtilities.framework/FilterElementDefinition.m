@interface FilterElementDefinition
- ($89967B733E8F0E8859294B5D59E7AF0F)encodeInto:(_MDPlistContainer *)a3 auxArray:(id)a4 namedRootMap:(id)a5;
- (BOOL)isBottomValue;
- (id)initAsRoot:(id)a3;
- (void)addRuleField:(int)a3 value:(int)a4 hasAuxValue:(BOOL)a5 auxValue:(unint64_t)a6 inside:(BOOL)a7 forPathComponents:(id)a8 permitLink:(BOOL)a9 componentIndex:(int)a10 parentElement:(id)a11 copyParentWildcardLink:(BOOL)a12;
- (void)dealloc;
- (void)dumpAttributesInto:(char *)a3 forLevel:(int)a4;
@end

@implementation FilterElementDefinition

- (id)initAsRoot:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)FilterElementDefinition;
  v4 = [(FilterElementDefinition *)&v6 init];
  if (v4)
  {
    v4->_rootName = (NSString *)a3;
    v4->_setOfMatches = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)FilterElementDefinition;
  [(FilterElementDefinition *)&v3 dealloc];
}

- (BOOL)isBottomValue
{
  return ![(NSMutableDictionary *)self->_setOfMatches count]
      && !self->_namedLink
      && !self->_wildCard
      && self->_superWildCard == 0;
}

- ($89967B733E8F0E8859294B5D59E7AF0F)encodeInto:(_MDPlistContainer *)a3 auxArray:(id)a4 namedRootMap:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  __int16 v12 = objc_msgSend(a4, "count", _MDPlistContainerBeginArray((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, v6, v7));
  if (self->_hasAuxValue) {
    objc_msgSend(a4, "addObject:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_auxValue));
  }
  if (self->_namedLink)
  {
    v13 = objc_msgSend(a5, "objectForKey:");
    if (!v13) {
      -[FilterElementDefinition encodeInto:auxArray:namedRootMap:]();
    }
    __int16 v14 = [v13 intValue] + 1;
  }
  else
  {
    __int16 v14 = 0;
  }
  __int16 v64 = v14;
  uint64_t v65 = 0;
  int v66 = 0;
  __int16 hasAuxValue = self->_hasAuxValue;
  if (self->_hasAuxValue) {
    __int16 v16 = v12 + 1;
  }
  else {
    __int16 v16 = 0;
  }
  __int16 v67 = v16;
  __int16 v68 = hasAuxValue + v12;
  __int16 subAuxValueCount = self->_subAuxValueCount;
  unint64_t mask = self->_mask;
  if ([(FilterElementDefinition *)self isBottomValue]) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = 0x4000000000000000;
  }
  unint64_t v70 = v18 | mask;
  unint64_t rule = self->_rule;
  if ([(FilterElementDefinition *)self isBottomValue]) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = 0x4000000000000000;
  }
  unint64_t v71 = v24 | rule;
  int8x16_t v72 = vextq_s8(*(int8x16_t *)&self->_subRule, *(int8x16_t *)&self->_subRule, 8uLL);
  unsigned __int8 v63 = 0;
  unsigned int v62 = 0;
  char v61 = 0;
  int v60 = 0;
  _MDPlistContainerAddDataValue((uint64_t)a3, &v64, 0x34uLL, (uint64_t)&v62, v20, v21, v22, v23);
  if ([(NSMutableDictionary *)self->_setOfMatches count])
  {
    _MDPlistContainerBeginDictionary((uint64_t)a3, v25, v26, v27, v28, v29, v30, v31);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    setOfMatches = self->_setOfMatches;
    uint64_t v33 = [(NSMutableDictionary *)setOfMatches countByEnumeratingWithState:&v76 objects:v75 count:16];
    if (v33)
    {
      uint64_t v40 = v33;
      uint64_t v41 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v77 != v41) {
            objc_enumerationMutation(setOfMatches);
          }
          v43 = *(const void **)(*((void *)&v76 + 1) + 8 * i);
          v44 = (void *)[(NSMutableDictionary *)self->_setOfMatches objectForKey:v43];
          _MDPlistContainerAddObject((uint64_t)a3, v43, 0);
          [v44 encodeInto:a3 auxArray:a4 namedRootMap:a5];
        }
        uint64_t v40 = [(NSMutableDictionary *)setOfMatches countByEnumeratingWithState:&v76 objects:v75 count:16];
      }
      while (v40);
    }
    _MDPlistContainerEndDictionary((uint64_t)a3, (uint64_t)&v60, v34, v35, v36, v37, v38, v39);
  }
  wildCard = self->_wildCard;
  if (wildCard) {
    int v46 = (int)[(FilterElementDefinition *)wildCard encodeInto:a3 auxArray:a4 namedRootMap:a5];
  }
  else {
    int v46 = 0;
  }
  superWildCard = self->_superWildCard;
  if (superWildCard) {
    int v48 = (int)[(FilterElementDefinition *)superWildCard encodeInto:a3 auxArray:a4 namedRootMap:a5];
  }
  else {
    int v48 = 0;
  }
  unsigned __int8 v74 = 0;
  unsigned int v73 = 0;
  _MDPlistContainerEndArray((uint64_t)a3, (uint64_t)&v73, v26, v27, v28, v29, v30, v31);
  long long v58 = 0uLL;
  uint64_t v59 = 0;
  _MDPlistReferenceToPlistObject((unint64_t)a3, v62 | ((unint64_t)v63 << 32), v49, v50, v51, v52, v53, &v58);
  long long v56 = v58;
  uint64_t v57 = v59;
  uint64_t BytePtr = _MDPlistDataGetBytePtr((uint64_t *)&v56, 0);
  *(_DWORD *)(BytePtr + 2) = v60;
  *(_DWORD *)(BytePtr + 6) = v46;
  *(_DWORD *)(BytePtr + 10) = v48;
  return ($89967B733E8F0E8859294B5D59E7AF0F)(v73 | ((unint64_t)v74 << 32));
}

- (void)addRuleField:(int)a3 value:(int)a4 hasAuxValue:(BOOL)a5 auxValue:(unint64_t)a6 inside:(BOOL)a7 forPathComponents:(id)a8 permitLink:(BOOL)a9 componentIndex:(int)a10 parentElement:(id)a11 copyParentWildcardLink:(BOOL)a12
{
  BOOL v13 = a7;
  BOOL v14 = a5;
  uint64_t v15 = *(void *)&a4;
  uint64_t v16 = *(void *)&a3;
  uint64_t v18 = [a8 count];
  if (v18 > a10)
  {
    uint64_t v19 = v18;
    uint64_t v20 = (void *)[a8 objectAtIndex:a10];
    id v21 = v20;
    id v31 = v20;
    if (a9)
    {
      if ([v20 hasPrefix:@"<"]
        && [v31 hasSuffix:@">"])
      {
        id v22 = v31;
        namedLink = self->_namedLink;
        if (namedLink && ![(NSString *)namedLink isEqualToString:v22] || v19 - 1 != a10 || v13)
        {
          CFLog();
          __break(1u);
        }
        if (v16 != 196607) {
          -[FilterElementDefinition addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:]();
        }

        self->_namedLink = (NSString *)v22;

        return;
      }
      if ([v31 isEqualToString:@"*"])
      {
        wildCard = self->_wildCard;
        if (!wildCard)
        {
          wildCard = [[FilterElementDefinition alloc] initAsRoot:0];
          self->_wildCard = wildCard;
        }
        if (a10
          && objc_msgSend((id)objc_msgSend(a8, "objectAtIndex:", a10 - 1), "isEqualToString:", @"**"))
        {
          -[FilterElementDefinition addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:]();
        }
LABEL_39:
        if (v14) {
          ++self->_subAuxValueCount;
        }
        -[FilterElementDefinition addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:](wildCard, "addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:", v16, v15, v14, a6, v13, a8);
        return;
      }
      int v30 = [v31 isEqualToString:@"**"];
      id v21 = v31;
      if (v30)
      {
        wildCard = self->_superWildCard;
        if (!wildCard)
        {
          wildCard = [[FilterElementDefinition alloc] initAsRoot:0];
          self->_superWildCard = wildCard;
        }
        if (a10
          && objc_msgSend((id)objc_msgSend(a8, "objectAtIndex:", a10 - 1), "isEqualToString:", @"**"))
        {
          -[FilterElementDefinition addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:]();
        }
        goto LABEL_39;
      }
    }
    wildCard = (FilterElementDefinition *)[(NSMutableDictionary *)self->_setOfMatches objectForKey:v21];
    if (!wildCard)
    {
      wildCard = [[FilterElementDefinition alloc] initAsRoot:0];
      [(NSMutableDictionary *)self->_setOfMatches setObject:wildCard forKey:v31];
    }
    goto LABEL_39;
  }
  if (v16 == 196607) {
    -[FilterElementDefinition addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:].cold.4();
  }
  uint64_t v24 = -1 << (v16 >> 6);
  uint64_t v25 = ~v24 << v16;
  unint64_t v26 = ((int)v15 & (unint64_t)~v24) << v16;
  uint64_t v27 = 16;
  if (v13) {
    uint64_t v27 = 32;
  }
  *(Class *)((char *)&self->super.isa + v27) = (Class)(v26 | *(uint64_t *)((unsigned char *)&self->super.isa + v27) & ~v25 | 0x8000000000000000);
  if (v13) {
    uint64_t v28 = 40;
  }
  else {
    uint64_t v28 = 24;
  }
  *(Class *)((char *)&self->super.isa + v28) = (Class)(*(uint64_t *)((char *)&self->super.isa + v28) | v25);
  if (v14)
  {
    self->___int16 hasAuxValue = v14;
    self->_auxValue = a6;
    if (a11)
    {
      if (*((void *)a11 + 10) && a12)
      {

        self->_namedLink = (NSString *)*(id *)(*((void *)a11 + 10) + 72);
      }
    }
  }
}

- (void)dumpAttributesInto:(char *)a3 forLevel:(int)a4
{
  rootName = self->_rootName;
  if (rootName)
  {
    uint64_t v7 = [(NSString *)rootName UTF8String];
    unint64_t rule = self->_rule;
    unint64_t mask = self->_mask;
    [(FilterElementDefinition *)self isBottomValue];
    sprintf(a3, "--| (name:%s rule:%llX %llX %s sub:%llX %llX bottom:%d auxValue:%lld count:%d %d)", v7, rule, mask);
  }
  else
  {
    unint64_t v10 = self->_rule;
    unint64_t v11 = self->_mask;
    [(FilterElementDefinition *)self isBottomValue];
    sprintf(a3, "  (rule:%llX %llX %s sub:%llX %llX bottom:%d auxValue:%lld count:%d %d)", v10, v11);
  }
}

- (void)encodeInto:auxArray:namedRootMap:.cold.1()
{
}

- (void)addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:.cold.1()
{
}

- (void)addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:.cold.2()
{
}

- (void)addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:.cold.3()
{
}

- (void)addRuleField:value:hasAuxValue:auxValue:inside:forPathComponents:permitLink:componentIndex:parentElement:copyParentWildcardLink:.cold.4()
{
}

@end