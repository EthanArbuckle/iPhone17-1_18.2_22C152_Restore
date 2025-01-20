@interface PXNavigationListDataSubsection
- (BOOL)skipAssetCountFetches;
- (PXDataSection)dataSection;
- (PXNavigationListDataSection)listDataSection;
- (PXNavigationListDataSubsection)initWithDataSection:(id)a3 indexDelta:(int64_t)a4 expandedIndex:(int64_t)a5 indentationLevel:(int64_t)a6 externalStartIndex:(int64_t)a7 skipAssetCountFetches:(BOOL)a8;
- (id)description;
- (id)listItemAtExternalIndex:(int64_t)a3;
- (int64_t)expandedIndex;
- (int64_t)externalStartIndex;
- (int64_t)indentationLevel;
- (int64_t)indexDelta;
@end

@implementation PXNavigationListDataSubsection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listDataSection, 0);
  objc_storeStrong((id *)&self->_dataSection, 0);
  objc_storeStrong((id *)&self->_listItemsCache, 0);
}

- (BOOL)skipAssetCountFetches
{
  return self->_skipAssetCountFetches;
}

- (int64_t)externalStartIndex
{
  return self->_externalStartIndex;
}

- (int64_t)expandedIndex
{
  return self->_expandedIndex;
}

- (int64_t)indexDelta
{
  return self->_indexDelta;
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (PXNavigationListDataSection)listDataSection
{
  return self->_listDataSection;
}

- (PXDataSection)dataSection
{
  return self->_dataSection;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; dataSection = %@, indexDelta = %ld, globalStartIndex = %ld>",
               objc_opt_class(),
               self,
               self->_dataSection,
               self->_indexDelta,
               self->_externalStartIndex);
}

- (id)listItemAtExternalIndex:(int64_t)a3
{
  int64_t v4 = [(PXNavigationListDataSubsection *)self indexDelta] + a3;
  int64_t v5 = v4 - [(PXNavigationListDataSubsection *)self externalStartIndex];
  v6 = [(PXNavigationListDataSubsection *)self listDataSection];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 objectAtIndex:v5];
  }
  else
  {
    listItemsCache = self->_listItemsCache;
    v10 = [NSNumber numberWithInteger:v5];
    v8 = [(NSMutableDictionary *)listItemsCache objectForKeyedSubscript:v10];

    if (!v8)
    {
      v11 = [(PXNavigationListDataSubsection *)self dataSection];
      v25 = [v11 objectAtIndex:v5];
      int64_t v12 = [(PXNavigationListDataSubsection *)self expandedIndex];
      id v13 = v11;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }

      v15 = [v14 objectAtIndex:v5];
      v16 = [v13 outlineObject];
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
        id v17 = v16;
      }
      else {
        id v17 = 0;
      }

      v18 = [v17 identifier];

      uint64_t v19 = 0;
      uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      v24 = v13;
      if (v14)
      {
        if (v15)
        {
          uint64_t v19 = objc_msgSend(v14, "lockStateForCollection:", v15, v13);
          if (![(PXNavigationListDataSubsection *)self skipAssetCountFetches]) {
            uint64_t v20 = [v14 countForCollection:v15];
          }
        }
      }
      v8 = PXNavigationListItemWithObject(v25, v20, [(PXNavigationListDataSubsection *)self indentationLevel], v5 == v12, v19, v18);
      v21 = self->_listItemsCache;
      v22 = [NSNumber numberWithInteger:v5];
      [(NSMutableDictionary *)v21 setObject:v8 forKeyedSubscript:v22];
    }
  }

  return v8;
}

- (PXNavigationListDataSubsection)initWithDataSection:(id)a3 indexDelta:(int64_t)a4 expandedIndex:(int64_t)a5 indentationLevel:(int64_t)a6 externalStartIndex:(int64_t)a7 skipAssetCountFetches:(BOOL)a8
{
  id v15 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXNavigationListDataSubsection;
  v16 = [(PXNavigationListDataSubsection *)&v22 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_dataSection, a3);
    v17->_indentationLevel = a6;
    v17->_indexDelta = a4;
    v17->_expandedIndex = a5;
    v17->_externalStartIndex = a7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = v15;
    }
    else {
      v18 = 0;
    }
    objc_storeStrong((id *)&v17->_listDataSection, v18);
    uint64_t v19 = objc_opt_new();
    listItemsCache = v17->_listItemsCache;
    v17->_listItemsCache = (NSMutableDictionary *)v19;

    v17->_skipAssetCountFetches = a8;
  }

  return v17;
}

@end