@interface RAPCuratedCollectionContext
- (GEOPlaceCollection)curatedCollection;
- (GEORPCuratedCollectionContext)geoContext;
- (NSArray)placeCollectionMapItems;
- (RAPCuratedCollectionContext)initWithCuratedCollection:(id)a3 placeCollectionMapItems:(id)a4;
- (void)setCuratedCollection:(id)a3;
- (void)setPlaceCollectionMapItems:(id)a3;
@end

@implementation RAPCuratedCollectionContext

- (RAPCuratedCollectionContext)initWithCuratedCollection:(id)a3 placeCollectionMapItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RAPCuratedCollectionContext;
  v9 = [(RAPCuratedCollectionContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_curatedCollection, a3);
    v11 = (NSArray *)[v8 copy];
    placeCollectionMapItems = v10->_placeCollectionMapItems;
    v10->_placeCollectionMapItems = v11;
  }
  return v10;
}

- (GEORPCuratedCollectionContext)geoContext
{
  id v3 = objc_alloc_init((Class)GEORPCuratedCollectionContext);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v4 = self;
  v5 = [(GEOPlaceCollection *)self->_curatedCollection itemIds];
  id v6 = [v5 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if ([v10 muid]) {
          objc_msgSend(v3, "addPlaceEntityMuid:", objc_msgSend(v10, "muid"));
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v7);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [(GEOPlaceCollection *)v4->_curatedCollection photos];
  id v11 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        id v16 = objc_alloc_init((Class)GEORPFeedbackClientImageInfo);
        v17 = [v15 largestPhoto];
        v18 = [v17 url];
        v19 = [v18 absoluteString];
        [v16 setImageUrl:v19];

        v20 = [(GEOPlaceCollection *)v4->_curatedCollection publisherAttributionIdentifierString];
        [v16 setProviderImageId:v20];

        [v3 addImageInfo:v16];
      }
      id v12 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v12);
  }

  v21 = [(GEOPlaceCollection *)v4->_curatedCollection collectionTitle];
  [v3 setOriginalName:v21];

  v22 = [(GEOPlaceCollection *)v4->_curatedCollection collectionDescription];
  [v3 setOriginalDescription:v22];

  v23 = [(GEOPlaceCollection *)v4->_curatedCollection collectionURL];
  v24 = [v23 absoluteString];
  [v3 setOriginalUrl:v24];

  v25 = [(GEOPlaceCollection *)v4->_curatedCollection collectionIdentifier];
  [v3 setCuratedCollectionMuid:[v25 muid]];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v26 = [(GEOPlaceCollection *)v4->_curatedCollection itemIds];
  id v27 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        objc_msgSend(v3, "addPlaceEntityMuid:", objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * (void)k), "muid"));
      }
      id v28 = [v26 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v28);
  }

  return (GEORPCuratedCollectionContext *)v3;
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (void)setCuratedCollection:(id)a3
{
}

- (NSArray)placeCollectionMapItems
{
  return self->_placeCollectionMapItems;
}

- (void)setPlaceCollectionMapItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollectionMapItems, 0);

  objc_storeStrong((id *)&self->_curatedCollection, 0);
}

@end