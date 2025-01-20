@interface MusicMapKitLocalSearchWrapper
- (MKLocalSearchCompleter)searchCompleter;
- (MusicMapKitLocalSearchWrapper)init;
- (NSString)query;
- (id)didUpdateResults;
- (void)completerDidUpdateResults:(id)a3;
- (void)setDidUpdateResults:(id)a3;
- (void)setQuery:(id)a3;
- (void)setSearchCompleter:(id)a3;
@end

@implementation MusicMapKitLocalSearchWrapper

- (MusicMapKitLocalSearchWrapper)init
{
  v5.receiver = self;
  v5.super_class = (Class)MusicMapKitLocalSearchWrapper;
  v2 = [(MusicMapKitLocalSearchWrapper *)&v5 init];
  id v3 = objc_alloc_init((Class)MKLocalSearchCompleter);
  [v3 setResultTypes:1];
  [v3 setDelegate:v2];
  [(MusicMapKitLocalSearchWrapper *)v2 setSearchCompleter:v3];

  return v2;
}

- (void)setQuery:(id)a3
{
  id v4 = a3;
  id v5 = [(MusicMapKitLocalSearchWrapper *)self searchCompleter];
  [v5 setQueryFragment:v4];
}

- (void)completerDidUpdateResults:(id)a3
{
  id v3 = a3;
  id v4 = [v3 results];
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v20 = v3;
  v6 = [v3 results];
  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v10);
        v12 = objc_alloc_init(MusicMapKitLocalSearchCompletionWrapper);
        v13 = [v11 title];
        [(MusicMapKitLocalSearchCompletionWrapper *)v12 setTitle:v13];

        v14 = [v11 subtitle];
        [(MusicMapKitLocalSearchCompletionWrapper *)v12 setSubtitle:v14];

        v15 = [v11 mapItem];
        v16 = [v15 placemark];
        v17 = [v16 location];
        [v17 coordinate];
        -[MusicMapKitLocalSearchCompletionWrapper setCoordinate:](v12, "setCoordinate:");

        [v5 addObject:v12];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  v18 = [(MusicMapKitLocalSearchWrapper *)self didUpdateResults];
  ((void (**)(void, void *))v18)[2](v18, v5);
}

- (NSString)query
{
  return self->_query;
}

- (id)didUpdateResults
{
  return self->_didUpdateResults;
}

- (void)setDidUpdateResults:(id)a3
{
}

- (MKLocalSearchCompleter)searchCompleter
{
  return self->_searchCompleter;
}

- (void)setSearchCompleter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCompleter, 0);
  objc_storeStrong(&self->_didUpdateResults, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end