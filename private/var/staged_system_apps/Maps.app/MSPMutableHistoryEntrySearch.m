@interface MSPMutableHistoryEntrySearch
- (MSPMutableHistoryEntrySearch)initWithTicket:(id)a3;
- (MSPMutableHistoryEntrySearch)initWithTicket:(id)a3 completionTitle:(id)a4;
@end

@implementation MSPMutableHistoryEntrySearch

- (MSPMutableHistoryEntrySearch)initWithTicket:(id)a3
{
  return [(MSPMutableHistoryEntrySearch *)self initWithTicket:a3 completionTitle:0];
}

- (MSPMutableHistoryEntrySearch)initWithTicket:(id)a3 completionTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSPMutableHistoryEntrySearch;
  v8 = [(MSPMutableHistoryEntrySearch *)&v14 init];
  if (v8)
  {
    if ([v7 length])
    {
      [(MSPMutableHistoryEntrySearch *)v8 setQuery:v7];
    }
    else
    {
      v9 = [v6 searchQuery];
      v10 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      v11 = [v9 stringByTrimmingCharactersInSet:v10];
      [(MSPMutableHistoryEntrySearch *)v8 setQuery:v11];
    }
    v12 = [v6 boundingRegion];
    [(MSPMutableHistoryEntrySearch *)v8 setMapRegion:v12];
  }
  return v8;
}

@end