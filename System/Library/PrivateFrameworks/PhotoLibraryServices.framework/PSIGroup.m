@interface PSIGroup
+ (void)_getTokenRanges:(_NSRange)a3[8] fromCompressedRanges:(unint64_t)a4[2];
+ (void)getCompressedRanges:(unint64_t)a3[2] fromTokenRanges:(id *)a4 count:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExactMatchForQuery;
- (NSString)contentString;
- (NSString)lookupIdentifier;
- (NSString)normalizedString;
- (PSIGroup)init;
- (PSIGroup)initWithContentString:(id)a3 lookupIdentifier:(id)a4 category:(signed __int16)a5 score:(double)a6;
- (PSIGroup)initWithContentString:(id)a3 normalizedString:(id)a4 lookupIdentifier:(id)a5 category:(signed __int16)a6 groupId:(unint64_t)a7 owningGroupId:(int64_t)a8 score:(double)a9;
- (_NSRange)tokenRangeAtIndex:(unint64_t)a3;
- (__CFArray)assetIds;
- (__CFArray)collectionIds;
- (__CFArray)intersectedAssetIds;
- (__CFArray)intersectedCollectionIds;
- (double)score;
- (id)_tokenRangesDescription;
- (id)description;
- (int)_assetIdsCount;
- (int)_collectionIdsCount;
- (int64_t)compareToGroup:(id)a3;
- (signed)category;
- (unint64_t)groupId;
- (unint64_t)groupIdForObjectLookup;
- (unint64_t)hash;
- (unint64_t)matchTypeForQuery;
- (unint64_t)objectType;
- (unint64_t)owningGroupId;
- (unint64_t)tokenRangesCount;
- (void)_resetTokenRangesForContentString;
- (void)_updateWithIntersectedAssetIds:(__CFArray *)a3;
- (void)_updateWithIntersectedCollectionIds:(__CFArray *)a3;
- (void)dealloc;
- (void)prepareForReuse;
- (void)prepareFromFilenameStatement:(sqlite3_stmt *)a3;
- (void)prepareFromStatement:(sqlite3_stmt *)a3;
- (void)resetIntersectedIds;
- (void)setAssetIds:(__CFArray *)a3;
- (void)setCategory:(signed __int16)a3;
- (void)setCollectionIds:(__CFArray *)a3;
- (void)setGroupId:(unint64_t)a3;
- (void)setMatchTypeForQuery:(unint64_t)a3;
- (void)setOwningGroupId:(unint64_t)a3;
- (void)setScore:(double)a3;
- (void)unionCollectionIdsWithGroup:(id)a3;
- (void)unionIdsWithGroup:(id)a3;
- (void)updateWithIntersectedIds:(__CFArray *)a3 searchResultType:(unint64_t)a4;
@end

@implementation PSIGroup

- (void)setAssetIds:(__CFArray *)a3
{
}

- (void)prepareFromStatement:(sqlite3_stmt *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PSIGroup;
  -[PSIReusableObject prepareFromStatement:](&v10, sel_prepareFromStatement_);
  self->_groupId = sqlite3_column_int64(a3, 0);
  self->_category = sqlite3_column_int(a3, 1);
  self->_owningGroupId = sqlite3_column_int64(a3, 2);
  v5 = sqlite3_column_text(a3, 3);
  v6 = sqlite3_column_text(a3, 4);
  v7 = sqlite3_column_text(a3, 5);
  self->_score = sqlite3_column_double(a3, 6);
  self->_compressedRanges[0] = sqlite3_column_int64(a3, 7);
  self->_compressedRanges[1] = sqlite3_column_int64(a3, 8);
  CFStringAppendCString((CFMutableStringRef)self->_contentString, (const char *)v5, 0x8000100u);
  CFStringAppendCString((CFMutableStringRef)self->_normalizedString, (const char *)v6, 0x8000100u);
  CFStringAppendCString((CFMutableStringRef)self->_lookupIdentifier, (const char *)v7, 0x8000100u);
  [(id)objc_opt_class() _getTokenRanges:self->_tokenRanges fromCompressedRanges:self->_compressedRanges];
  unint64_t v8 = 0;
  self->_tokenRangesCount = 8;
  uint64_t v9 = 64;
  while (*(Class *)((char *)&self->super.super.isa + v9))
  {
    ++v8;
    v9 += 16;
    if (v8 == 8) {
      goto LABEL_6;
    }
  }
  self->_tokenRangesCount = v8;
LABEL_6:
  [(PSIReusableObject *)self didPrepareFromStatement:a3];
}

- (unint64_t)groupIdForObjectLookup
{
  int IsSynonym = PLSearchIndexCategoryIsSynonym(self->_category);
  v4 = &OBJC_IVAR___PSIGroup__groupId;
  if (IsSynonym) {
    v4 = &OBJC_IVAR___PSIGroup__owningGroupId;
  }
  return *(unint64_t *)((char *)&self->super.super.isa + *v4);
}

- (void)setGroupId:(unint64_t)a3
{
  self->_groupId = a3;
}

- (PSIGroup)init
{
  v11.receiver = self;
  v11.super_class = (Class)PSIGroup;
  v2 = [(PSIReusableObject *)&v11 init];
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    contentString = v2->_contentString;
    v2->_contentString = (NSMutableString *)Mutable;

    CFMutableStringRef v6 = CFStringCreateMutable(v3, 0);
    normalizedString = v2->_normalizedString;
    v2->_normalizedString = (NSMutableString *)v6;

    CFMutableStringRef v8 = CFStringCreateMutable(v3, 0);
    lookupIdentifier = v2->_lookupIdentifier;
    v2->_lookupIdentifier = (NSMutableString *)v8;
  }
  return v2;
}

+ (void)_getTokenRanges:(_NSRange)a3[8] fromCompressedRanges:(unint64_t)a4[2]
{
  for (uint64_t i = 0; i != 8; ++i)
  {
    lldiv_t v7 = lldiv(i, 4);
    CFMutableStringRef v8 = (const double *)&a4[v7.quot];
    v9.i64[0] = 16 * v7.rem;
    v9.i64[1] = (16 * v7.rem) | 8;
    v10.i64[0] = 255;
    v10.i64[1] = 255;
    int8x16_t v11 = (int8x16_t)vld1q_dup_f64(v8);
    a3[i] = (_NSRange)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v10, v9), v11), (uint64x2_t)vnegq_s64((int64x2_t)v9));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupIdentifier, 0);
  objc_storeStrong((id *)&self->_normalizedString, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
}

- (NSString)contentString
{
  return &self->_contentString->super;
}

- (__CFArray)assetIds
{
  return self->_assetIds;
}

- (signed)category
{
  return self->_category;
}

- (NSString)lookupIdentifier
{
  return &self->_lookupIdentifier->super;
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (double)score
{
  return self->_score;
}

- (unint64_t)owningGroupId
{
  return self->_owningGroupId;
}

- (PSIGroup)initWithContentString:(id)a3 normalizedString:(id)a4 lookupIdentifier:(id)a5 category:(signed __int16)a6 groupId:(unint64_t)a7 owningGroupId:(int64_t)a8 score:(double)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PSIGroup;
  v19 = [(PSIReusableObject *)&v27 init];
  if (v19)
  {
    uint64_t v20 = [v16 mutableCopy];
    contentString = v19->_contentString;
    v19->_contentString = (NSMutableString *)v20;

    uint64_t v22 = [v17 mutableCopy];
    normalizedString = v19->_normalizedString;
    v19->_normalizedString = (NSMutableString *)v22;

    uint64_t v24 = [v18 mutableCopy];
    lookupIdentifier = v19->_lookupIdentifier;
    v19->_lookupIdentifier = (NSMutableString *)v24;

    v19->_category = a6;
    v19->_groupId = a7;
    v19->_owningGroupId = a8;
    v19->_score = a9;
    [(PSIGroup *)v19 _resetTokenRangesForContentString];
  }

  return v19;
}

- (void)dealloc
{
  assetIds = self->_assetIds;
  if (assetIds) {
    CFRelease(assetIds);
  }
  collectionIds = self->_collectionIds;
  if (collectionIds) {
    CFRelease(collectionIds);
  }
  intersectedAssetIds = self->_intersectedAssetIds;
  if (intersectedAssetIds) {
    CFRelease(intersectedAssetIds);
  }
  intersectedCollectionIds = self->_intersectedCollectionIds;
  if (intersectedCollectionIds) {
    CFRelease(intersectedCollectionIds);
  }
  v7.receiver = self;
  v7.super_class = (Class)PSIGroup;
  [(PSIGroup *)&v7 dealloc];
}

- (void)_resetTokenRangesForContentString
{
  self->_tokenRanges[0] = 0u;
  self->_tokenRanges[1] = 0u;
  self->_tokenRanges[2] = 0u;
  self->_tokenRanges[3] = 0u;
  self->_tokenRanges[4] = 0u;
  self->_tokenRanges[5] = 0u;
  self->_tokenRanges[6] = 0u;
  self->_tokenRanges[7] = 0u;
  self->_tokenRanges[0].length = [(NSMutableString *)self->_contentString length];
  self->_tokenRangesCount = 1;
}

- (__CFArray)intersectedCollectionIds
{
  return self->_intersectedCollectionIds;
}

- (__CFArray)intersectedAssetIds
{
  return self->_intersectedAssetIds;
}

- (void)setMatchTypeForQuery:(unint64_t)a3
{
  self->_matchTypeForQuery = a3;
}

- (unint64_t)matchTypeForQuery
{
  return self->_matchTypeForQuery;
}

- (void)setCollectionIds:(__CFArray *)a3
{
}

- (__CFArray)collectionIds
{
  return self->_collectionIds;
}

- (NSString)normalizedString
{
  return &self->_normalizedString->super;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (void)setCategory:(signed __int16)a3
{
  self->_category = a3;
}

- (void)setOwningGroupId:(unint64_t)a3
{
  self->_owningGroupId = a3;
}

- (unint64_t)objectType
{
  return 2;
}

- (void)resetIntersectedIds
{
  intersectedAssetIds = self->_intersectedAssetIds;
  if (intersectedAssetIds) {
    CFRelease(intersectedAssetIds);
  }
  intersectedCollectionIds = self->_intersectedCollectionIds;
  if (intersectedCollectionIds) {
    CFRelease(intersectedCollectionIds);
  }
  self->_intersectedAssetIds = 0;
  self->_intersectedCollectionIds = 0;
}

- (void)_updateWithIntersectedCollectionIds:(__CFArray *)a3
{
  p_intersectedCollectionIds = &self->_intersectedCollectionIds;
  if (self->_intersectedCollectionIds)
  {
    +[PLScopedSearchUtilities intersectSortedArray:p_intersectedCollectionIds withOtherSortedArray:a3 intersectionLimit:0];
  }
  else
  {
    *p_intersectedCollectionIds = CFArrayCreateCopy(0, a3);
  }
}

- (void)_updateWithIntersectedAssetIds:(__CFArray *)a3
{
  p_intersectedAssetIds = &self->_intersectedAssetIds;
  if (self->_intersectedAssetIds)
  {
    +[PLScopedSearchUtilities intersectSortedArray:p_intersectedAssetIds withOtherSortedArray:a3 intersectionLimit:0];
  }
  else
  {
    *p_intersectedAssetIds = CFArrayCreateCopy(0, a3);
  }
}

- (void)updateWithIntersectedIds:(__CFArray *)a3 searchResultType:(unint64_t)a4
{
  if (a4)
  {
    if (a4)
    {
      [(PSIGroup *)self _updateWithIntersectedAssetIds:a3];
    }
    else if ((a4 & 2) != 0)
    {
      [(PSIGroup *)self _updateWithIntersectedCollectionIds:a3];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 handleFailureInMethod:a2, self, @"PSIGroup.m", 296, @"Invalid parameter not satisfying: %@", @"searchResultType != (PLSearchResultTypeAsset & PLSearchResultTypeCollection)" object file lineNumber description];
  }
}

- (BOOL)isExactMatchForQuery
{
  return [(PSIGroup *)self matchTypeForQuery] - 1 < 3;
}

- (void)unionIdsWithGroup:(id)a3
{
  id v4 = a3;
  assetIds = self->_assetIds;
  id v33 = v4;
  CFArrayRef v6 = (const __CFArray *)[v4 assetIds];
  if (!assetIds || (CFIndex Count = CFArrayGetCount(assetIds)) == 0)
  {
    CFArrayRef v18 = v6;
LABEL_20:
    CFMutableStringRef Mutable = (__CFArray *)CFRetain(v18);
    goto LABEL_21;
  }
  if (!v6 || (unint64_t v8 = Count, (v9 = CFArrayGetCount(v6)) == 0))
  {
    CFArrayRef v18 = assetIds;
    goto LABEL_20;
  }
  unint64_t v10 = v9;
  CFMutableStringRef Mutable = CFArrayCreateMutable(0, v9 + v8, 0);
  unint64_t v12 = 0;
  unint64_t v13 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(assetIds, v12);
    v15 = CFArrayGetValueAtIndex(v6, v13);
    if (ValueAtIndex < v15) {
      id v16 = ValueAtIndex;
    }
    else {
      id v16 = v15;
    }
    if (ValueAtIndex <= v15) {
      ++v12;
    }
    if (ValueAtIndex >= v15) {
      ++v13;
    }
    CFArrayAppendValue(Mutable, v16);
  }
  while (v8 > v12 && v10 > v13);
  v35.location = v12;
  v35.length = v8 - v12;
  CFArrayAppendArray(Mutable, assetIds, v35);
  v36.length = v10 - v13;
  v36.location = v13;
  CFArrayAppendArray(Mutable, v6, v36);
LABEL_21:
  [(PSIGroup *)self setAssetIds:CFAutorelease(Mutable)];
  collectionIds = self->_collectionIds;
  CFArrayRef v20 = (const __CFArray *)[v33 collectionIds];
  if (!collectionIds || (CFIndex v21 = CFArrayGetCount(collectionIds)) == 0)
  {
    CFArrayRef v32 = v20;
LABEL_40:
    v25 = (__CFArray *)CFRetain(v32);
    goto LABEL_41;
  }
  if (!v20 || (unint64_t v22 = v21, (v23 = CFArrayGetCount(v20)) == 0))
  {
    CFArrayRef v32 = collectionIds;
    goto LABEL_40;
  }
  unint64_t v24 = v23;
  v25 = CFArrayCreateMutable(0, v23 + v22, 0);
  unint64_t v26 = 0;
  unint64_t v27 = 0;
  do
  {
    v28 = CFArrayGetValueAtIndex(collectionIds, v26);
    v29 = CFArrayGetValueAtIndex(v20, v27);
    if (v28 < v29) {
      v30 = v28;
    }
    else {
      v30 = v29;
    }
    if (v28 <= v29) {
      ++v26;
    }
    if (v28 >= v29) {
      ++v27;
    }
    CFArrayAppendValue(v25, v30);
  }
  while (v22 > v26 && v24 > v27);
  v37.location = v26;
  v37.length = v22 - v26;
  CFArrayAppendArray(v25, collectionIds, v37);
  v38.length = v24 - v27;
  v38.location = v27;
  CFArrayAppendArray(v25, v20, v38);
LABEL_41:
  [(PSIGroup *)self setCollectionIds:CFAutorelease(v25)];
}

- (void)unionCollectionIdsWithGroup:(id)a3
{
  collectionIds = self->_collectionIds;
  CFArrayRef v5 = (const __CFArray *)[a3 collectionIds];
  if (!collectionIds || (CFIndex Count = CFArrayGetCount(collectionIds)) == 0)
  {
    CFArrayRef v17 = v5;
LABEL_20:
    CFMutableStringRef Mutable = (__CFArray *)CFRetain(v17);
    goto LABEL_21;
  }
  if (!v5 || (v7 = Count, (CFIndex v8 = CFArrayGetCount(v5)) == 0))
  {
    CFArrayRef v17 = collectionIds;
    goto LABEL_20;
  }
  unint64_t v9 = v8;
  CFMutableStringRef Mutable = CFArrayCreateMutable(0, v8 + v7, 0);
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(collectionIds, v11);
    v14 = CFArrayGetValueAtIndex(v5, v12);
    if (ValueAtIndex < v14) {
      v15 = ValueAtIndex;
    }
    else {
      v15 = v14;
    }
    if (ValueAtIndex <= v14) {
      ++v11;
    }
    if (ValueAtIndex >= v14) {
      ++v12;
    }
    CFArrayAppendValue(Mutable, v15);
  }
  while (v7 > v11 && v9 > v12);
  v20.location = v11;
  v20.length = v7 - v11;
  CFArrayAppendArray(Mutable, collectionIds, v20);
  v21.length = v9 - v12;
  v21.location = v12;
  CFArrayAppendArray(Mutable, v5, v21);
LABEL_21:
  CFTypeRef v18 = CFAutorelease(Mutable);
  [(PSIGroup *)self setCollectionIds:v18];
}

- (void)prepareFromFilenameStatement:(sqlite3_stmt *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PSIGroup;
  -[PSIReusableObject prepareFromStatement:](&v9, sel_prepareFromStatement_);
  self->_groupId = sqlite3_column_int64(a3, 0);
  self->_category = 2100;
  self->_owningGroupId = 0;
  CFArrayRef v5 = sqlite3_column_text(a3, 1);
  CFArrayRef v6 = sqlite3_column_text(a3, 2);
  self->_compressedRanges[0] = sqlite3_column_int64(a3, 3);
  self->_compressedRanges[1] = sqlite3_column_int64(a3, 4);
  CFStringAppendCString((CFMutableStringRef)self->_contentString, (const char *)v5, 0x8000100u);
  CFStringAppendCString((CFMutableStringRef)self->_normalizedString, (const char *)v6, 0x8000100u);
  [(id)objc_opt_class() _getTokenRanges:self->_tokenRanges fromCompressedRanges:self->_compressedRanges];
  unint64_t v7 = 0;
  self->_tokenRangesCFIndex Count = 8;
  uint64_t v8 = 64;
  while (*(Class *)((char *)&self->super.super.isa + v8))
  {
    ++v7;
    v8 += 16;
    if (v7 == 8) {
      goto LABEL_6;
    }
  }
  self->_tokenRangesCFIndex Count = v7;
LABEL_6:
  [(PSIReusableObject *)self didPrepareFromStatement:a3];
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)PSIGroup;
  [(PSIReusableObject *)&v7 prepareForReuse];
  self->_groupId = 0;
  self->_category = 0;
  self->_owningGroupId = 0;
  self->_score = 0.0;
  CFStringReplaceAll((CFMutableStringRef)self->_contentString, &stru_1EEB2EB80);
  CFStringReplaceAll((CFMutableStringRef)self->_normalizedString, &stru_1EEB2EB80);
  CFStringReplaceAll((CFMutableStringRef)self->_lookupIdentifier, &stru_1EEB2EB80);
  assetIds = self->_assetIds;
  if (assetIds)
  {
    CFRelease(assetIds);
    self->_assetIds = 0;
  }
  collectionIds = self->_collectionIds;
  if (collectionIds)
  {
    CFRelease(collectionIds);
    self->_collectionIds = 0;
  }
  intersectedAssetIds = self->_intersectedAssetIds;
  if (intersectedAssetIds)
  {
    CFRelease(intersectedAssetIds);
    self->_intersectedAssetIds = 0;
  }
  intersectedCollectionIds = self->_intersectedCollectionIds;
  if (intersectedCollectionIds)
  {
    CFRelease(intersectedCollectionIds);
    self->_intersectedCollectionIds = 0;
  }
  self->_tokenRangesCFIndex Count = 0;
}

- (_NSRange)tokenRangeAtIndex:(unint64_t)a3
{
  CFAllocatorRef v3 = &self->_tokenRanges[a3];
  NSUInteger location = v3->location;
  NSUInteger length = v3->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)tokenRangesCount
{
  return self->_tokenRangesCount;
}

- (int64_t)compareToGroup:(id)a3
{
  id v4 = (__int16 *)a3;
  int category = self->_category;
  int v6 = v4[96];
  if (category >= v6)
  {
    if (category <= v6) {
      int64_t v7 = [(NSMutableString *)self->_contentString compare:*((void *)v4 + 2)];
    }
    else {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)PSIGroup;
  return self->_groupId ^ [(PSIGroup *)&v3 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PSIGroup *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_groupId == v4->_groupId;
  }

  return v5;
}

- (id)_tokenRangesDescription
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendString:@"token ranges: "];
  if (self->_tokenRangesCount)
  {
    unint64_t v4 = 0;
    p_NSUInteger length = &self->_tokenRanges[0].length;
    do
    {
      int v6 = NSStringFromRange(*(NSRange *)(p_length - 1));
      [v3 appendFormat:@"%@, ", v6];

      ++v4;
      p_length += 2;
    }
    while (v4 < self->_tokenRangesCount);
  }
  return v3;
}

- (int)_collectionIdsCount
{
  collectionIds = self->_collectionIds;
  if (collectionIds) {
    LODWORD(collectionIds) = CFArrayGetCount(collectionIds);
  }
  return (int)collectionIds;
}

- (int)_assetIdsCount
{
  assetIds = self->_assetIds;
  if (assetIds) {
    LODWORD(assetIds) = CFArrayGetCount(assetIds);
  }
  return (int)assetIds;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PSIGroup;
  objc_super v3 = [(PSIGroup *)&v6 description];
  unint64_t v4 = [v3 stringByAppendingFormat:@" id=%d, category=%d, contentString=%@, normalizedString=%@, lookupIdentifier=%@, score=%f, nAssetIds=%d, nCollectionIds=%d", self->_groupId, self->_category, self->_contentString, self->_normalizedString, self->_lookupIdentifier, *(void *)&self->_score, -[PSIGroup _assetIdsCount](self, "_assetIdsCount"), -[PSIGroup _collectionIdsCount](self, "_collectionIdsCount")];

  return v4;
}

- (PSIGroup)initWithContentString:(id)a3 lookupIdentifier:(id)a4 category:(signed __int16)a5 score:(double)a6
{
  return [(PSIGroup *)self initWithContentString:a3 normalizedString:0 lookupIdentifier:a4 category:a5 groupId:0 owningGroupId:0 score:a6];
}

+ (void)getCompressedRanges:(unint64_t)a3[2] fromTokenRanges:(id *)a4 count:(int64_t)a5
{
  unint64_t v6 = 0;
  if (a5 >= 8) {
    unint64_t v7 = 8;
  }
  else {
    unint64_t v7 = a5;
  }
  p_var1 = &a4->var1;
  do
  {
    if (v6 >= v7)
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = *(p_var1 - 1);
      uint64_t v10 = *p_var1;
    }
    BOOL v12 = v9 > 256 || v10 > 256;
    uint64_t v13 = v10;
    uint64_t v14 = v9;
    lldiv_t v15 = lldiv(v6, 4);
    if (v12) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v14;
    }
    uint64_t v17 = v16 << (16 * LOBYTE(v15.rem));
    if (v12) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v13;
    }
    a3[v15.quot] |= v17 | (v18 << ((16 * LOBYTE(v15.rem)) | 8u));
    ++v6;
    p_var1 += 2;
  }
  while (v6 != 8);
}

@end