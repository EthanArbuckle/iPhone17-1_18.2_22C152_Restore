@interface ICPinnedNotesFilterTypeSelection
- (id)copyWithZone:(_NSZone *)a3;
- (id)filterName;
- (int64_t)filterType;
@end

@implementation ICPinnedNotesFilterTypeSelection

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ICPinnedNotesFilterTypeSelection allocWithZone:a3];
  unint64_t v5 = [(ICInclusionFilterTypeSelection *)self inclusionType];
  return [(ICInclusionFilterTypeSelection *)v4 initWithInclusionType:v5];
}

- (int64_t)filterType
{
  return 9;
}

- (id)filterName
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Pinned Notes" value:@"Pinned Notes" table:0 allowSiri:1];
}

@end