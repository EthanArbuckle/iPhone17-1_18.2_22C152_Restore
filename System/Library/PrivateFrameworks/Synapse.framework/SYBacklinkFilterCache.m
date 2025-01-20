@interface SYBacklinkFilterCache
+ (BOOL)supportsSecureCoding;
- (BOOL)containsMatchingEntriesForItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)activityTypes;
- (NSData)data;
- (NSMutableArray)entries;
- (SYBacklinkFilterCache)initWithActivityTypes:(id)a3;
- (SYBacklinkFilterCache)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)addEntriesForItem:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)finalize;
- (void)setActivityTypes:(id)a3;
- (void)setData:(id)a3;
- (void)setEntries:(id)a3;
@end

@implementation SYBacklinkFilterCache

- (SYBacklinkFilterCache)initWithActivityTypes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYBacklinkFilterCache;
  v5 = [(SYBacklinkFilterCache *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    activityTypes = v5->_activityTypes;
    v5->_activityTypes = (NSArray *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSMutableArray *)self->_entries isEqualToArray:v4[2]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  data = self->_data;
  if (!data) {
    data = self->_entries;
  }
  return [data hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYBacklinkFilterCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SYBacklinkFilterCache;
  char v5 = [(SYBacklinkFilterCache *)&v14 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"types"];
    activityTypes = v5->_activityTypes;
    v5->_activityTypes = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  activityTypes = self->_activityTypes;
  id v5 = a3;
  [v5 encodeObject:activityTypes forKey:@"types"];
  [v5 encodeObject:self->_data forKey:@"data"];
}

- (void)addEntriesForItem:(id)a3
{
  id v4 = a3;
  id v29 = v4;
  if (!self->_entries)
  {
    id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:150];
    entries = self->_entries;
    self->_entries = v5;

    id v4 = v29;
  }
  uint64_t v7 = [v4 persistentIdentifier];

  if (v7)
  {
    v8 = self->_entries;
    uint64_t v9 = (void *)MEMORY[0x1E4F28ED0];
    v10 = [v29 persistentIdentifier];
    uint64_t v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "hash"));
    [(NSMutableArray *)v8 addObject:v11];
  }
  v12 = [v29 targetContentIdentifier];

  if (v12)
  {
    v13 = self->_entries;
    objc_super v14 = (void *)MEMORY[0x1E4F28ED0];
    v15 = [v29 targetContentIdentifier];
    v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "hash"));
    [(NSMutableArray *)v13 addObject:v16];
  }
  v17 = [v29 canonicalURL];

  if (v17)
  {
    v18 = self->_entries;
    v19 = (void *)MEMORY[0x1E4F28ED0];
    v20 = [v29 canonicalURL];
    v21 = objc_msgSend(v20, "_lp_simplifiedURLStringForFuzzyMatching");
    v22 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v21, "hash"));
    [(NSMutableArray *)v18 addObject:v22];
  }
  v23 = [v29 webpageURL];

  if (v23)
  {
    v24 = self->_entries;
    v25 = (void *)MEMORY[0x1E4F28ED0];
    v26 = [v29 webpageURL];
    v27 = objc_msgSend(v26, "_lp_simplifiedURLStringForFuzzyMatching");
    v28 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v27, "hash"));
    [(NSMutableArray *)v24 addObject:v28];
  }
}

- (void)finalize
{
  if ([(NSMutableArray *)self->_entries count])
  {
    [(NSMutableArray *)self->_entries sortUsingComparator:&__block_literal_global_10];
    v3 = malloc_type_malloc(2 * [(NSMutableArray *)self->_entries count], 0x6A1E12A5uLL);
    entries = self->_entries;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__SYBacklinkFilterCache_finalize__block_invoke_2;
    v7[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8Q16_B24l;
    v7[4] = v3;
    [(NSMutableArray *)entries enumerateObjectsUsingBlock:v7];
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v3, 2 * -[NSMutableArray count](self->_entries, "count"), 1);
    id v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    data = self->_data;
    self->_data = v5;
  }
  else
  {
    self->_data = [MEMORY[0x1E4F1C9B8] data];
    MEMORY[0x1F41817F8]();
  }
}

uint64_t __33__SYBacklinkFilterCache_finalize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unsigned int v5 = [a2 unsignedShortValue];
  unsigned int v6 = [v4 unsignedShortValue];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

uint64_t __33__SYBacklinkFilterCache_finalize__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [a2 unsignedShortValue];
  *(_WORD *)(*(void *)(a1 + 32) + 2 * a3) = result;
  return result;
}

- (BOOL)containsMatchingEntriesForItem:(id)a3
{
  id v4 = a3;
  unsigned int v5 = os_log_create("com.apple.synapse", "SYBacklinkFilterCache");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SYBacklinkFilterCache containsMatchingEntriesForItem:]((uint64_t)v4, v5);
  }

  unsigned int v6 = [(SYBacklinkFilterCache *)self activityTypes];
  uint64_t v7 = [v4 activityType];
  int v8 = [v6 containsObject:v7];

  if (!v8) {
    goto LABEL_13;
  }
  unint64_t v9 = [(NSData *)self->_data length] >> 1;
  v10 = [v4 persistentIdentifier];

  if (v10)
  {
    uint64_t v11 = [v4 persistentIdentifier];
    unsigned __int16 v12 = [v11 hash];

    if (-[NSData _sy_containsUnsignedShort:inRange:](self->_data, "_sy_containsUnsignedShort:inRange:", v12, 0, v9)) {
      goto LABEL_12;
    }
  }
  v13 = [v4 targetContentIdentifier];

  if (v13)
  {
    objc_super v14 = [v4 targetContentIdentifier];
    unsigned __int16 v15 = [v14 hash];

    if (-[NSData _sy_containsUnsignedShort:inRange:](self->_data, "_sy_containsUnsignedShort:inRange:", v15, 0, v9)) {
      goto LABEL_12;
    }
  }
  v16 = [v4 canonicalURL];

  if (v16)
  {
    v17 = [v4 canonicalURL];
    v18 = objc_msgSend(v17, "_lp_simplifiedURLStringForFuzzyMatching");
    unsigned __int16 v19 = [v18 hash];

    if (-[NSData _sy_containsUnsignedShort:inRange:](self->_data, "_sy_containsUnsignedShort:inRange:", v19, 0, v9)) {
      goto LABEL_12;
    }
  }
  v20 = [v4 webpageURL];

  if (!v20) {
    goto LABEL_13;
  }
  v21 = [v4 webpageURL];
  v22 = objc_msgSend(v21, "_lp_simplifiedURLStringForFuzzyMatching");
  unsigned __int16 v23 = [v22 hash];

  if (-[NSData _sy_containsUnsignedShort:inRange:](self->_data, "_sy_containsUnsignedShort:inRange:", v23, 0, v9)) {
LABEL_12:
  }
    BOOL v24 = 1;
  else {
LABEL_13:
  }
    BOOL v24 = 0;

  return v24;
}

- (NSArray)activityTypes
{
  return self->_activityTypes;
}

- (void)setActivityTypes:(id)a3
{
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_activityTypes, 0);
}

- (void)containsMatchingEntriesForItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_DEBUG, "containsMatchingEntriesForItem: %@", (uint8_t *)&v2, 0xCu);
}

@end