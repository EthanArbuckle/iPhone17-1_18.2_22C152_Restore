@interface PLPersistentHistoryMarkerDate
- (NSString)description;
- (PLPersistentHistoryMarkerDate)initWithDate:(id)a3;
- (id)overrride_changeRequestForFetching;
- (id)overrride_shortDescription;
@end

@implementation PLPersistentHistoryMarkerDate

- (void).cxx_destruct
{
}

- (id)overrride_shortDescription
{
  return (id)[NSString stringWithFormat:@".Date(%@)", self->_date];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"PLPersistentHistoryMarkerDate(%@)", self->_date];
}

- (id)overrride_changeRequestForFetching
{
  return (id)[MEMORY[0x1E4F1C160] fetchHistoryAfterDate:self->_date];
}

- (PLPersistentHistoryMarkerDate)initWithDate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLPersistentHistoryMarkerDate;
  v5 = [(PLPersistentHistoryMarkerDate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v8 = v5;
  }

  return v5;
}

@end