@interface TFFeedbackEntryGroup
- (BOOL)isToggleable;
- (NSArray)entries;
- (NSDictionary)footerTextLinkMap;
- (NSDictionary)headerTextLinkMap;
- (NSString)footerText;
- (NSString)headerText;
- (NSString)identifier;
- (NSString)title;
- (TFFeedbackEntry)groupToggleEntry;
- (TFFeedbackEntryGroup)initWithIdentifier:(id)a3 entries:(id)a4 title:(id)a5 election:(unint64_t)a6 headerText:(id)a7 headerTextLinkMap:(id)a8 footerText:(id)a9 footerTextLinkMap:(id)a10;
- (id)visibleEntryForIndex:(unint64_t)a3;
- (unint64_t)election;
- (unint64_t)numberOfVisibleItemsForIncludeState:(BOOL)a3;
@end

@implementation TFFeedbackEntryGroup

- (TFFeedbackEntryGroup)initWithIdentifier:(id)a3 entries:(id)a4 title:(id)a5 election:(unint64_t)a6 headerText:(id)a7 headerTextLinkMap:(id)a8 footerText:(id)a9 footerTextLinkMap:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v42.receiver = self;
  v42.super_class = (Class)TFFeedbackEntryGroup;
  v23 = [(TFFeedbackEntryGroup *)&v42 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    identifier = v23->_identifier;
    v23->_identifier = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    entries = v23->_entries;
    v23->_entries = (NSArray *)v26;

    uint64_t v28 = [v18 copy];
    title = v23->_title;
    v23->_title = (NSString *)v28;

    v23->_unint64_t election = a6;
    uint64_t v30 = [v19 copy];
    headerText = v23->_headerText;
    v23->_headerText = (NSString *)v30;

    if (v19)
    {
      uint64_t v32 = [v20 copy];
      headerTextLinkMap = v23->_headerTextLinkMap;
      v23->_headerTextLinkMap = (NSDictionary *)v32;
    }
    else
    {
      headerTextLinkMap = v23->_headerTextLinkMap;
      v23->_headerTextLinkMap = 0;
    }

    uint64_t v34 = [v21 copy];
    footerText = v23->_footerText;
    v23->_footerText = (NSString *)v34;

    if (v21)
    {
      uint64_t v36 = [v22 copy];
      footerTextLinkMap = v23->_footerTextLinkMap;
      v23->_footerTextLinkMap = (NSDictionary *)v36;
    }
    else
    {
      footerTextLinkMap = v23->_footerTextLinkMap;
      v23->_footerTextLinkMap = 0;
    }

    unint64_t election = v23->_election;
    v23->_toggleable = election != 0;
    if (election)
    {
      v39 = [[TFFeedbackEntryGroupToggle alloc] initWithGroupIdentifier:v16 title:v18];
      groupToggleEntry = v23->_groupToggleEntry;
      v23->_groupToggleEntry = &v39->super;
    }
    else
    {
      groupToggleEntry = v23->_groupToggleEntry;
      v23->_groupToggleEntry = 0;
    }
  }
  return v23;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)entries
{
  return self->_entries;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (NSDictionary)headerTextLinkMap
{
  return self->_headerTextLinkMap;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (NSDictionary)footerTextLinkMap
{
  return self->_footerTextLinkMap;
}

- (unint64_t)election
{
  return self->_election;
}

- (BOOL)isToggleable
{
  return self->_toggleable;
}

- (TFFeedbackEntry)groupToggleEntry
{
  return self->_groupToggleEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupToggleEntry, 0);
  objc_storeStrong((id *)&self->_footerTextLinkMap, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerTextLinkMap, 0);
  objc_storeStrong((id *)&self->_headerText, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (unint64_t)numberOfVisibleItemsForIncludeState:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(TFFeedbackEntryGroup *)self isToggleable];
  if (![(TFFeedbackEntryGroup *)self isToggleable] || v3)
  {
    v6 = [(TFFeedbackEntryGroup *)self entries];
    unint64_t v5 = [v6 count] + v5;
  }
  return v5;
}

- (id)visibleEntryForIndex:(unint64_t)a3
{
  BOOL v5 = [(TFFeedbackEntryGroup *)self isToggleable];
  if (a3 || !v5)
  {
    unint64_t v7 = a3 - v5;
    v8 = [(TFFeedbackEntryGroup *)self entries];
    v6 = [v8 objectAtIndex:v7];
  }
  else
  {
    v6 = [(TFFeedbackEntryGroup *)self groupToggleEntry];
  }

  return v6;
}

@end