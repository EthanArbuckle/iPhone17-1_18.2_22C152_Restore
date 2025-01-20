@interface WBSHistoryVisitsWithItemsPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)evaluateServiceVisit:(id)a3;
- (BOOL)evaluateVisit:(id)a3;
- (NSString)description;
- (WBSHistoryVisitsWithItemsPredicate)initWithCoder:(id)a3;
- (WBSHistoryVisitsWithItemsPredicate)initWithHistoryItems:(id)a3 ignoreVisits:(id)a4;
- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSHistoryVisitsWithItemsPredicate

- (WBSHistoryVisitsWithItemsPredicate)initWithHistoryItems:(id)a3 ignoreVisits:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)WBSHistoryVisitsWithItemsPredicate;
  v8 = [(WBSHistoryVisitsWithItemsPredicate *)&v36 init];
  if (v8)
  {
    memset(v34, 0, sizeof(v34));
    int v35 = 1065353216;
    memset(v32, 0, sizeof(v32));
    int v33 = 1065353216;
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)v34, vcvtps_u32_f32((float)(unint64_t)[v6 count] / 1.0));
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__rehash<true>((uint64_t)v32, vcvtps_u32_f32((float)(unint64_t)[v7 count] / 1.0));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v29;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v27 = [*(id *)(*((void *)&v28 + 1) + 8 * v12) databaseID];
          std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v34, (unint64_t *)&v27, &v27);
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v10);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v27 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v16), "databaseID", (void)v23);
          std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>((uint64_t)v32, (unint64_t *)&v27, &v27);
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v37 count:16];
      }
      while (v14);
    }

    v17 = [[WBSSetInt64 alloc] initWithMovableSet:v34];
    itemIdentifiers = v8->_itemIdentifiers;
    v8->_itemIdentifiers = v17;

    v19 = [[WBSSetInt64 alloc] initWithMovableSet:v32];
    ignoredVisitIdentifiers = v8->_ignoredVisitIdentifiers;
    v8->_ignoredVisitIdentifiers = v19;

    v21 = v8;
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v32);
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::~__hash_table((uint64_t)v34);
  }

  return v8;
}

- (WBSHistoryVisitsWithItemsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryVisitsWithItemsPredicate;
  v5 = [(WBSHistoryVisitsWithItemsPredicate *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"items"];
    itemIdentifiers = v5->_itemIdentifiers;
    v5->_itemIdentifiers = (WBSSetInt64 *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ignoredVisits"];
    ignoredVisitIdentifiers = v5->_ignoredVisitIdentifiers;
    v5->_ignoredVisitIdentifiers = (WBSSetInt64 *)v8;

    uint64_t v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_itemIdentifiers forKey:@"items"];
  [v4 encodeObject:self->_ignoredVisitIdentifiers forKey:@"ignoredVisits"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)statementForDatabase:(id)a3 cache:(id)a4 fetchOptions:(unint64_t)a5 error:(id *)a6
{
  char v7 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v11 = [(WBSSetInt64 *)self->_itemIdentifiers commaSeparatedValues];
  objc_super v12 = [v10 stringWithFormat:@"SELECT history_visits.* FROM history_visits WHERE history_item IN (%@)", v11];

  if ([(WBSSetInt64 *)self->_ignoredVisitIdentifiers count])
  {
    id v13 = [(WBSSetInt64 *)self->_ignoredVisitIdentifiers commaSeparatedValues];
    [v12 appendFormat:@" AND history_visits.id NOT IN (%@)", v13];

    if ((v7 & 8) != 0)
    {
      uint64_t v14 = [(WBSSetInt64 *)self->_ignoredVisitIdentifiers commaSeparatedValues];
      [v12 appendFormat:@"AND NOT EXISTS (SELECT * FROM history_visits v2 WHERE id NOT IN (%@) AND history_visits.history_item = v2.history_item AND (v2.visit_time > history_visits.visit_time OR     (v2.visit_time = history_visits.visit_time AND (v2.synthesized < history_visits.synthesized OR                                                    (v2.synthesized = history_visits.synthesized AND v2.id > history_visits.id)))))", v14];
    }
  }
  else if ((v7 & 8) != 0)
  {
    [v12 appendString:@" AND history_visits.id = safari_latest_visit_for (history_item)"];
  }
  uint64_t v15 = [objc_alloc(MEMORY[0x1E4F97FA0]) initWithDatabase:v9 query:v12];
  uint64_t v16 = (void *)v15;
  if (a6 && !v15)
  {
    *a6 = [v9 lastErrorWithMethodName:"-[WBSHistoryVisitsWithItemsPredicate statementForDatabase:cache:fetchOptions:error:]"];
  }

  return v16;
}

- (BOOL)evaluateVisit:(id)a3
{
  id v4 = a3;
  itemIdentifiers = self->_itemIdentifiers;
  uint64_t v6 = [v4 item];
  LOBYTE(itemIdentifiers) = -[WBSSetInt64 contains:](itemIdentifiers, "contains:", [v6 databaseID]);

  if (itemIdentifiers) {
    BOOL v7 = !-[WBSSetInt64 contains:](self->_ignoredVisitIdentifiers, "contains:", [v4 databaseID]);
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)evaluateServiceVisit:(id)a3
{
  id v4 = a3;
  if (-[WBSSetInt64 contains:](self->_itemIdentifiers, "contains:", [v4 itemID])) {
    BOOL v5 = !-[WBSSetInt64 contains:](self->_ignoredVisitIdentifiers, "contains:", [v4 databaseID]);
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; itemIdentifiers.count = %zu; ignoredVisitIdentifiers.count = %zu>",
                       objc_opt_class(),
                       self,
                       [(WBSSetInt64 *)self->_itemIdentifiers count],
                       [(WBSSetInt64 *)self->_ignoredVisitIdentifiers count]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredVisitIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
}

@end