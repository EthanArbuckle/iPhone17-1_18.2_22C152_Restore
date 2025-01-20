@interface MapsSearchPrintingInfo
- (MapsSearchPrintingInfo)initWithNumberOfPages:(int64_t)a3 searchResultCells:(id)a4;
- (NSArray)searchResultCells;
@end

@implementation MapsSearchPrintingInfo

- (MapsSearchPrintingInfo)initWithNumberOfPages:(int64_t)a3 searchResultCells:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsSearchPrintingInfo;
  v7 = [(MapsPrintingInfo *)&v12 initWithNumberOfPages:a3];
  if (v7)
  {
    v8 = (NSArray *)[v6 copy];
    searchResultCells = v7->_searchResultCells;
    v7->_searchResultCells = v8;

    v10 = v7;
  }

  return v7;
}

- (NSArray)searchResultCells
{
  return self->_searchResultCells;
}

- (void).cxx_destruct
{
}

@end