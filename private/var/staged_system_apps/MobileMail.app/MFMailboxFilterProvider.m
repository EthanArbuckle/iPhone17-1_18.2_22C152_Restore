@interface MFMailboxFilterProvider
- (MFMailboxFilterProvider)initWithFilterContext:(id)a3;
- (id)criterionsForFocus:(id)a3;
- (id)filterMatchingCriterion:(id)a3;
- (id)focusFilters;
- (id)individualVIPFilterGroup;
- (void)setIndividualVIPFilterGroup:(id)a3;
@end

@implementation MFMailboxFilterProvider

- (MFMailboxFilterProvider)initWithFilterContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8.receiver = self;
  v8.super_class = (Class)MFMailboxFilterProvider;
  v6 = [(MFMailboxFilterProvider *)&v8 initWithFilterContext:v4 mailboxFilterClass:v5];

  return v6;
}

- (id)filterMatchingCriterion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFMailboxFilterProvider *)self allFilters];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001A2978;
  v9[3] = &unk_10060BA00;
  id v6 = v4;
  id v10 = v6;
  v7 = [v5 ef_firstObjectPassingTest:v9];

  return v7;
}

- (id)focusFilters
{
  v3 = [(MFMailboxFilterProvider *)self focus];
  if (v3)
  {
    id v4 = [(MFMailboxFilterProvider *)self criterionsForFocus:v3];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001A2A70;
    v7[3] = &unk_10060A080;
    v7[4] = self;
    uint64_t v5 = [v4 ef_compactMap:v7];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)criterionsForFocus:(id)a3
{
  v3 = [a3 focusedAccountIdentifiers];
  id v4 = [v3 allObjects];
  uint64_t v5 = [v4 ef_compactMap:&stru_10060BA20];

  return v5;
}

- (id)individualVIPFilterGroup
{
  individualVIPFilterGroup = self->_individualVIPFilterGroup;
  if (!individualVIPFilterGroup)
  {
    id v4 = +[VIPManager defaultInstance];
    uint64_t v5 = [v4 vipCriteria];

    id v6 = [v5 ef_compactMap:&stru_10060BA60];
    v7 = +[MUIMailboxFilterGroup groupWithName:0 combinator:1 selectionCardinality:1 filters:v6];
    objc_super v8 = self->_individualVIPFilterGroup;
    self->_individualVIPFilterGroup = v7;

    individualVIPFilterGroup = self->_individualVIPFilterGroup;
  }

  return individualVIPFilterGroup;
}

- (void)setIndividualVIPFilterGroup:(id)a3
{
  uint64_t v5 = (MUIMailboxFilterGroup *)a3;
  if (self->_individualVIPFilterGroup != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_individualVIPFilterGroup, a3);
    uint64_t v5 = v6;
  }
}

- (void).cxx_destruct
{
}

@end