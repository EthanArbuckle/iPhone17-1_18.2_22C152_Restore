@interface WFCloudKitWebServiceQueryFilterCombination
- (NSArray)filters;
- (id)stringRepresentationWithRecordType:(id)a3;
- (unint64_t)type;
- (void)setFilters:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation WFCloudKitWebServiceQueryFilterCombination

- (void).cxx_destruct
{
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setFilters:(id)a3
{
}

- (NSArray)filters
{
  return self->_filters;
}

- (id)stringRepresentationWithRecordType:(id)a3
{
  id v4 = a3;
  v5 = [(WFCloudKitWebServiceQueryFilterCombination *)self filters];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __81__WFCloudKitWebServiceQueryFilterCombination_stringRepresentationWithRecordType___block_invoke;
  v18 = &unk_1E6553C18;
  id v19 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "if_map:", &v15);

  unint64_t v8 = [(WFCloudKitWebServiceQueryFilterCombination *)self type];
  v9 = @" OR ";
  if (v8 != 1) {
    v9 = 0;
  }
  if (v8) {
    v10 = v9;
  }
  else {
    v10 = @" AND ";
  }
  v11 = NSString;
  v12 = [v7 componentsJoinedByString:v10];
  v13 = [v11 stringWithFormat:@"(%@)", v12, v15, v16, v17, v18];

  return v13;
}

uint64_t __81__WFCloudKitWebServiceQueryFilterCombination_stringRepresentationWithRecordType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringRepresentationWithRecordType:*(void *)(a1 + 32)];
}

@end