@interface BKDefaultCollection
+ (BOOL)isValidForDeserialization:(id)a3;
- (BOOL)allowsManualAddition;
- (BOOL)canDeleteCollection;
- (BOOL)deleteRemovesFromCollection;
- (BOOL)isDefaultCollection;
- (BOOL)isEqualToCollection:(id)a3;
- (BOOL)isSeriesCollection;
- (BOOL)isValidForSerialization;
- (NSDate)lastModification;
- (NSNumber)deletedFlag;
- (NSNumber)hidden;
- (NSNumber)maxSortKey;
- (NSNumber)sortKey;
- (NSNumber)sortMode;
- (NSNumber)viewMode;
- (NSSet)members;
- (NSString)collectionID;
- (NSString)description;
- (NSString)details;
- (NSString)seriesID;
- (NSString)title;
- (id)dictionaryRepresentation;
- (void)setSeriesID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BKDefaultCollection

- (NSNumber)deletedFlag
{
  return (NSNumber *)&__kCFBooleanFalse;
}

- (NSNumber)sortKey
{
  return (NSNumber *)&off_DA1C0;
}

- (NSString)title
{
  title = self->_title;
  if (!title)
  {
    v4 = BKLibraryFrameworkBundle();
    v5 = [v4 localizedStringForKey:@"Collections_AllBooks" value:@"All Books" table:&stru_D4160];
    v6 = self->_title;
    self->_title = v5;

    title = self->_title;
  }

  return title;
}

- (NSString)details
{
  return (NSString *)&stru_D4160;
}

- (NSNumber)hidden
{
  return (NSNumber *)&__kCFBooleanFalse;
}

- (NSNumber)sortMode
{
  return (NSNumber *)&off_D9FE0;
}

- (NSNumber)viewMode
{
  return (NSNumber *)&off_D9FE0;
}

- (NSString)collectionID
{
  return (NSString *)kBKCollectionDefaultAll;
}

- (NSDate)lastModification
{
  return 0;
}

- (NSSet)members
{
  return 0;
}

- (BOOL)isSeriesCollection
{
  v2 = [(BKDefaultCollection *)self seriesID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)allowsManualAddition
{
  return 0;
}

- (BOOL)isEqualToCollection:(id)a3
{
  id v4 = a3;
  v5 = [(BKDefaultCollection *)self collectionID];
  v6 = [v4 collectionID];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)canDeleteCollection
{
  return 0;
}

- (BOOL)isDefaultCollection
{
  v2 = [(BKDefaultCollection *)self seriesID];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)deleteRemovesFromCollection
{
  return 0;
}

- (BOOL)isValidForSerialization
{
  return 0;
}

+ (BOOL)isValidForDeserialization:(id)a3
{
  return 0;
}

- (id)dictionaryRepresentation
{
  return 0;
}

- (NSString)description
{
  v14 = [(BKDefaultCollection *)self title];
  v15 = [(BKDefaultCollection *)self collectionID];
  BOOL v3 = [(BKDefaultCollection *)self sortKey];
  id v4 = [(BKDefaultCollection *)self sortMode];
  v5 = [(BKDefaultCollection *)self viewMode];
  v13 = [(BKDefaultCollection *)self deletedFlag];
  v6 = [(BKDefaultCollection *)self hidden];
  v7 = [(BKDefaultCollection *)self lastModification];
  v8 = [(BKDefaultCollection *)self members];
  v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
  v10 = [(BKDefaultCollection *)self seriesID];
  v11 = +[NSString stringWithFormat:@"   %@ (%p) \n title: %@\n collectionID: %@\n sortKey: %@\n sortMode: %@\n viewMode: %@\n deletedFlag: %@\n hidden: %@\n lastModification: %@\n member count: %@\n seriesID: %@", @"self", self, v14, v15, v3, v4, v5, v13, v6, v7, v9, v10];

  return (NSString *)v11;
}

- (NSNumber)maxSortKey
{
  return self->_maxSortKey;
}

- (NSString)seriesID
{
  return self->_seriesID;
}

- (void)setSeriesID:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_seriesID, 0);

  objc_storeStrong((id *)&self->_maxSortKey, 0);
}

@end