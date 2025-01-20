@interface ICDateCreatedFilterTypeSelection
- (id)copyWithZone:(_NSZone *)a3;
- (id)emptySummary;
- (id)emptySummaryTitle;
- (id)filterName;
- (id)shortEmptySummary;
- (int64_t)filterType;
@end

@implementation ICDateCreatedFilterTypeSelection

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(ICDateFilterTypeSelection *)+[ICDateCreatedFilterTypeSelection allocWithZone:](ICDateCreatedFilterTypeSelection, "allocWithZone:") initWithSelectionType:[(ICDateFilterTypeSelection *)self selectionType]];
  v6 = [(ICDateFilterTypeSelection *)self primaryDate];
  [(ICDateFilterTypeSelection *)v5 setPrimaryDate:v6];

  v7 = [(ICDateFilterTypeSelection *)self secondaryDate];
  [(ICDateFilterTypeSelection *)v5 setSecondaryDate:v7];

  [(ICDateFilterTypeSelection *)v5 setRelativeRangeSelectionType:[(ICDateFilterTypeSelection *)self relativeRangeSelectionType]];
  v8 = [(ICDateFilterTypeSelection *)self relativeRangeAmount];
  v9 = (void *)[v8 copyWithZone:a3];
  [(ICDateFilterTypeSelection *)v5 setRelativeRangeAmount:v9];

  return v5;
}

- (int64_t)filterType
{
  return 1;
}

- (id)filterName
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Date Created" value:@"Date Created" table:0 allowSiri:1];
}

- (id)emptySummaryTitle
{
  if ([(ICDateFilterTypeSelection *)self isEmpty]
    && [(ICDateFilterTypeSelection *)self selectionType] == 7)
  {
    v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Date Created Filter Incomplete" value:@"Date Created Filter Incomplete" table:0 allowSiri:1];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)emptySummary
{
  if ([(ICDateFilterTypeSelection *)self isEmpty]
    && [(ICDateFilterTypeSelection *)self selectionType] == 7)
  {
    v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You must enter a relative range number for the Date Created filter." value:@"You must enter a relative range number for the Date Created filter." table:0 allowSiri:1];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)shortEmptySummary
{
  if ([(ICDateFilterTypeSelection *)self isEmpty]
    && [(ICDateFilterTypeSelection *)self selectionType] == 7)
  {
    v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Number for the Date Created filter" value:@"Number for the Date Created filter" table:0 allowSiri:1];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end