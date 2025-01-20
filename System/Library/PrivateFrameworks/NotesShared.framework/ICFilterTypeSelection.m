@interface ICFilterTypeSelection
+ (id)keyPathsForValuesAffectingIsValid;
- (BOOL)isEmpty;
- (BOOL)isValid;
- (NSManagedObjectID)accountObjectID;
- (NSString)emptySummary;
- (NSString)emptySummaryTitle;
- (NSString)filterName;
- (NSString)rawFilterValue;
- (NSString)shortEmptySummary;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)filterType;
- (void)setAccountObjectID:(id)a3;
@end

@implementation ICFilterTypeSelection

- (NSString)filterName
{
  return (NSString *)&stru_1F1F2FFF8;
}

- (BOOL)isEmpty
{
  return 0;
}

- (BOOL)isValid
{
  return 1;
}

+ (id)keyPathsForValuesAffectingIsValid
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (NSString)rawFilterValue
{
  return (NSString *)&stru_1F1F2FFF8;
}

- (NSString)emptySummaryTitle
{
  return 0;
}

- (NSString)emptySummary
{
  return 0;
}

- (NSString)shortEmptySummary
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ICFilterTypeSelection allocWithZone:a3];
  v5 = [(ICFilterTypeSelection *)self accountObjectID];
  [(ICFilterTypeSelection *)v4 setAccountObjectID:v5];

  return v4;
}

- (int64_t)filterType
{
  return self->_filterType;
}

- (NSManagedObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (void)setAccountObjectID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end