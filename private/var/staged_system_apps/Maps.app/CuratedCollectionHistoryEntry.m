@interface CuratedCollectionHistoryEntry
+ (Class)mutableObjectClass;
+ (id)mutableObjectProtocol;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFailed;
- (BOOL)isUserVisibleDuplicateOfEntry:(id)a3;
- (BOOL)tracksRAPReportingOnly;
- (CuratedCollectionHistoryEntry)initWithMapsSyncHistoryCuratedCollection:(id)a3 placeCollection:(id)a4;
- (GEOPlaceCollection)placeCollection;
- (MSHistoryCuratedCollection)curatedCollection;
- (NSDate)usageDate;
- (id)storageIdentifier;
- (unint64_t)hash;
@end

@implementation CuratedCollectionHistoryEntry

- (CuratedCollectionHistoryEntry)initWithMapsSyncHistoryCuratedCollection:(id)a3 placeCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionHistoryEntry;
  v9 = [(CuratedCollectionHistoryEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_curatedCollection, a3);
    objc_storeStrong((id *)&v10->_placeCollection, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(MSHistoryCuratedCollection *)self->_curatedCollection hash];
  return (unint64_t)[(GEOPlaceCollection *)self->_placeCollection hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CuratedCollectionHistoryEntry *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = [(CuratedCollectionHistoryEntry *)v6 curatedCollection];
    id v8 = v7;
    if (v7 == self->_curatedCollection || -[MSHistoryCuratedCollection isEqual:](v7, "isEqual:"))
    {
      v9 = [(CuratedCollectionHistoryEntry *)v6 placeCollection];
      v10 = v9;
      if (v9 == self->_placeCollection) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = -[GEOPlaceCollection isEqual:](v9, "isEqual:");
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

+ (Class)mutableObjectClass
{
  return 0;
}

+ (id)mutableObjectProtocol
{
  return 0;
}

- (id)storageIdentifier
{
  return [(MSHistoryCuratedCollection *)self->_curatedCollection storageIdentifier];
}

- (NSDate)usageDate
{
  return (NSDate *)[(MSHistoryCuratedCollection *)self->_curatedCollection usageDate];
}

- (BOOL)isUserVisibleDuplicateOfEntry:(id)a3
{
  return [(MSHistoryCuratedCollection *)self->_curatedCollection isUserVisibleDuplicateOfEntry:a3];
}

- (BOOL)tracksRAPReportingOnly
{
  return [(MSHistoryCuratedCollection *)self->_curatedCollection tracksRAPReportingOnly];
}

- (BOOL)isFailed
{
  return 0;
}

- (MSHistoryCuratedCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (GEOPlaceCollection)placeCollection
{
  return self->_placeCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollection, 0);

  objc_storeStrong((id *)&self->_curatedCollection, 0);
}

@end