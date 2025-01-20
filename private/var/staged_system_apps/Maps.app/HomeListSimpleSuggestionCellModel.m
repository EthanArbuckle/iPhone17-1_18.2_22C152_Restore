@interface HomeListSimpleSuggestionCellModel
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (HomeListSimpleSuggestionCellModel)initWithEntry:(id)a3;
- (MapsSuggestionsEntry)entry;
- (NSString)_maps_diffableDataSourceIdentifier;
- (NSString)description;
- (NSString)subtitle;
- (NSString)title;
- (id)homeActionObject;
- (id)homeDragAndDropObject;
- (unint64_t)hash;
@end

@implementation HomeListSimpleSuggestionCellModel

- (HomeListSimpleSuggestionCellModel)initWithEntry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HomeListSimpleSuggestionCellModel;
  v6 = [(HomeListSimpleSuggestionCellModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entry, a3);
  }

  return v7;
}

- (NSString)title
{
  return (NSString *)[(MapsSuggestionsEntry *)self->_entry title];
}

- (NSString)subtitle
{
  return (NSString *)[(MapsSuggestionsEntry *)self->_entry subtitle];
}

- (unint64_t)hash
{
  return (unint64_t)[(MapsSuggestionsEntry *)self->_entry hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HomeListSimpleSuggestionCellModel *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    entry = self->_entry;
    v7 = [(HomeListSimpleSuggestionCellModel *)v5 entry];
    if (entry == v7) {
      unsigned __int8 v8 = 1;
    }
    else {
      unsigned __int8 v8 = [(MapsSuggestionsEntry *)entry isEqual:v7];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)[(MapsSuggestionsEntry *)self->_entry description];
}

- (id)homeActionObject
{
  return self->_entry;
}

- (id)homeDragAndDropObject
{
  return 0;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  return [(MapsSuggestionsEntry *)self->_entry _maps_diffableDataSourceIdentifier];
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return ![(HomeListSimpleSuggestionCellModel *)self isEqual:a3];
}

- (MapsSuggestionsEntry)entry
{
  return self->_entry;
}

- (void).cxx_destruct
{
}

@end