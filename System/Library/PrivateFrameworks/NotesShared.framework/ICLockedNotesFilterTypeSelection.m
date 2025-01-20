@interface ICLockedNotesFilterTypeSelection
- (id)copyWithZone:(_NSZone *)a3;
- (id)filterName;
- (int64_t)filterType;
@end

@implementation ICLockedNotesFilterTypeSelection

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ICLockedNotesFilterTypeSelection allocWithZone:a3];
  unint64_t v5 = [(ICInclusionFilterTypeSelection *)self inclusionType];
  return [(ICInclusionFilterTypeSelection *)v4 initWithInclusionType:v5];
}

- (int64_t)filterType
{
  return 10;
}

- (id)filterName
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Locked Notes" value:@"Locked Notes" table:0 allowSiri:1];
}

@end