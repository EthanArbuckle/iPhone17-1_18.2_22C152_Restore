@interface TUAutocompleteResultPartitioner
+ (BOOL)sourceTypeIsFoundInMail:(unint64_t)a3;
+ (BOOL)sourceTypeIsFoundOnServers:(unint64_t)a3;
- (NSMutableArray)foundInMailResultsArray;
- (NSMutableArray)foundOnServersResultsArray;
- (NSMutableArray)normalResultsArray;
- (TUAutocompleteResultPartitioner)init;
- (TUSearchController)searchController;
- (id)searchResults;
- (void)addResult:(id)a3;
- (void)setFoundInMailResultsArray:(id)a3;
- (void)setFoundOnServersResultsArray:(id)a3;
- (void)setNormalResultsArray:(id)a3;
- (void)setSearchController:(id)a3;
@end

@implementation TUAutocompleteResultPartitioner

- (TUAutocompleteResultPartitioner)init
{
  v11.receiver = self;
  v11.super_class = (Class)TUAutocompleteResultPartitioner;
  v2 = [(TUAutocompleteResultPartitioner *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    normalResultsArray = v2->_normalResultsArray;
    v2->_normalResultsArray = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    foundInMailResultsArray = v2->_foundInMailResultsArray;
    v2->_foundInMailResultsArray = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    foundOnServersResultsArray = v2->_foundOnServersResultsArray;
    v2->_foundOnServersResultsArray = v7;

    v9 = v2;
  }

  return v2;
}

- (void)addResult:(id)a3
{
  id v7 = a3;
  v4 = [[TUProxyAutocompleteResult alloc] initWithAutocompleteResult:v7];
  if (objc_msgSend((id)objc_opt_class(), "sourceTypeIsFoundInMail:", objc_msgSend(v7, "sourceType")))
  {
    v5 = [(TUAutocompleteResultPartitioner *)self foundInMailResultsArray];
  }
  else
  {
    if (objc_msgSend((id)objc_opt_class(), "sourceTypeIsFoundOnServers:", objc_msgSend(v7, "sourceType"))) {
      [(TUAutocompleteResultPartitioner *)self foundOnServersResultsArray];
    }
    else {
    v5 = [(TUAutocompleteResultPartitioner *)self normalResultsArray];
    }
  }
  v6 = v5;
  [v5 addObject:v4];
}

+ (BOOL)sourceTypeIsFoundInMail:(unint64_t)a3
{
  return (a3 & 7) == 4;
}

+ (BOOL)sourceTypeIsFoundOnServers:(unint64_t)a3
{
  return a3 == 8;
}

- (TUSearchController)searchController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchController);

  return (TUSearchController *)WeakRetained;
}

- (void)setSearchController:(id)a3
{
}

- (NSMutableArray)normalResultsArray
{
  return self->_normalResultsArray;
}

- (void)setNormalResultsArray:(id)a3
{
}

- (NSMutableArray)foundInMailResultsArray
{
  return self->_foundInMailResultsArray;
}

- (void)setFoundInMailResultsArray:(id)a3
{
}

- (NSMutableArray)foundOnServersResultsArray
{
  return self->_foundOnServersResultsArray;
}

- (void)setFoundOnServersResultsArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundOnServersResultsArray, 0);
  objc_storeStrong((id *)&self->_foundInMailResultsArray, 0);
  objc_storeStrong((id *)&self->_normalResultsArray, 0);

  objc_destroyWeak((id *)&self->_searchController);
}

- (id)searchResults
{
  v3 = objc_alloc_init(TUSearchResults);
  v4 = [(TUAutocompleteResultPartitioner *)self searchController];
  [(TUSearchResults *)v3 setSearchController:v4];

  v5 = [(TUAutocompleteResultPartitioner *)self normalResultsArray];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [TUResultGroup alloc];
    v8 = TUBundle();
    v9 = [v8 localizedStringForKey:@"CONTACTS" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
    v10 = [(TUAutocompleteResultPartitioner *)self normalResultsArray];
    objc_super v11 = [(TUResultGroup *)v7 initWithTitle:v9 results:v10];
    [(TUSearchResults *)v3 addResultGroup:v11];
  }
  v12 = [(TUAutocompleteResultPartitioner *)self foundInMailResultsArray];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v14 = [TUResultGroup alloc];
    v15 = TUBundle();
    v16 = [v15 localizedStringForKey:@"FOUND_IN_APPS" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
    v17 = [(TUAutocompleteResultPartitioner *)self foundInMailResultsArray];
    v18 = [(TUResultGroup *)v14 initWithTitle:v16 results:v17];
    [(TUSearchResults *)v3 addResultGroup:v18];
  }

  return v3;
}

@end