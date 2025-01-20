@interface PlaceCardLinkedPlacesItemSource
- (id)allItems;
- (unint64_t)featureID;
- (void)updateForPlaceCardItem:(id)a3;
@end

@implementation PlaceCardLinkedPlacesItemSource

- (id)allItems
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSArray *)v2->_linkedPlaces copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)updateForPlaceCardItem:(id)a3
{
  id v4 = a3;
  v51 = self;
  p_geoMapItem = &self->_geoMapItem;
  v49 = self->_geoMapItem;
  v50 = v4;
  if ([v4 isCurrentLocation])
  {
    v6 = 0;
    v7 = 0;
    goto LABEL_7;
  }
  v8 = [v4 personalizedItem];

  if (v8)
  {
    v9 = [v50 personalizedItem];
    v6 = v9;
  }
  else
  {
    v10 = [v50 mapItem];

    v6 = 0;
    v7 = 0;
    v9 = v50;
    if (!v10) {
      goto LABEL_7;
    }
  }
  v11 = [v9 mapItem];
  v7 = [v11 _geoMapItem];

LABEL_7:
  if ([(GEOMapItem *)v7 _isTransitDisplayFeature])
  {

    v7 = 0;
  }
  if (v7 != *p_geoMapItem)
  {
    v46 = v6;
    objc_storeStrong((id *)p_geoMapItem, v7);
    v12 = +[NSMutableArray array];
    v53 = +[NSMutableSet set];
    if (v7)
    {
      id featureID = (id)v51->_featureID;
      v13 = [(GEOMapItem *)v7 _identifier];
      BOOL v44 = v13 == 0;
      v14 = [PlaceCardLinkedPlacesItem alloc];
      if (v6) {
        v15 = -[PlaceCardLinkedPlacesItem initWithPersonalizedItem:](v14, "initWithPersonalizedItem:");
      }
      else {
        v15 = [(PlaceCardLinkedPlacesItem *)v14 initWithGEOMapItem:v7];
      }
      v47 = v15;
      id v48 = [(GEOMapItem *)*p_geoMapItem _containedPlace];
      if (v48)
      {
        [v12 addObject:v47];
        if (v13) {
          [v53 addObject:v13];
        }
        v17 = [v48 children];
        id v18 = [v17 count];

        if (v18)
        {
          [(PlaceCardLinkedPlacesItem *)v47 setParent:1];
          [(PlaceCardLinkedPlacesItem *)v47 setSortOrder:1];
          id featureID = [v48 featureId];
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          v19 = [v48 children];
          id v20 = [v19 countByEnumeratingWithState:&v58 objects:v63 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v59;
            uint64_t v22 = 2;
            do
            {
              v23 = 0;
              v24 = v13;
              do
              {
                if (*(void *)v59 != v21) {
                  objc_enumerationMutation(v19);
                }
                v25 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v23);
                v26 = [[PlaceCardLinkedPlacesItem alloc] initWithGEOMapItem:v25];
                [(PlaceCardLinkedPlacesItem *)v26 setSortOrder:(char *)v23 + v22];
                [(PlaceCardLinkedPlacesItem *)v26 setChild:1];
                [v12 addObject:v26];
                v13 = [v25 _identifier];

                if (v13) {
                  [v53 addObject:v13];
                }

                v23 = (char *)v23 + 1;
                v24 = v13;
              }
              while (v20 != v23);
              id v20 = [v19 countByEnumeratingWithState:&v58 objects:v63 count:16];
              v22 += (uint64_t)v23;
            }
            while (v20);
          }
        }
        else
        {
          v27 = [v48 parent];

          if (v27)
          {
            v43 = [v48 parent];
            id featureID = [v48 parentFeatureId];
            v28 = [[PlaceCardLinkedPlacesItem alloc] initWithGEOMapItem:v43];
            [(PlaceCardLinkedPlacesItem *)v28 setParent:1];
            [(PlaceCardLinkedPlacesItem *)v28 setSortOrder:1];
            [v12 addObject:v28];
            [(PlaceCardLinkedPlacesItem *)v47 setChild:1];
            [(PlaceCardLinkedPlacesItem *)v47 setSortOrder:2];
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            id obj = [v48 siblings];
            id v29 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
            if (v29)
            {
              uint64_t v30 = *(void *)v55;
              uint64_t v31 = 3;
              do
              {
                for (i = 0; i != v29; i = (char *)i + 1)
                {
                  if (*(void *)v55 != v30) {
                    objc_enumerationMutation(obj);
                  }
                  v33 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                  v34 = [[PlaceCardLinkedPlacesItem alloc] initWithGEOMapItem:v33];

                  v28 = v34;
                  [(PlaceCardLinkedPlacesItem *)v34 setSortOrder:(char *)i + v31];
                  [(PlaceCardLinkedPlacesItem *)v34 setChild:1];
                  [v12 addObject:v34];
                  uint64_t v35 = [v33 _identifier];

                  v13 = (void *)v35;
                  if (v35) {
                    [v53 addObject:v35];
                  }
                }
                id v29 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
                v31 += (uint64_t)i;
              }
              while (v29);
            }
          }
          else
          {
            id featureID = [v48 featureId];
          }
        }
        BOOL v16 = 1;
      }
      else if (v13 && [(NSSet *)v51->_linkedPlaceIdentifiers containsObject:v13])
      {
        BOOL v16 = 0;
      }
      else
      {
        id featureID = 0;
        BOOL v16 = v51->_featureID != 0;
      }

      if (v44)
      {
LABEL_51:
        if (v49)
        {
          v36 = [(GEOMapItem *)v49 _identifier];
          BOOL v37 = v36 == 0;

          if (!v37 && !v16) {
            goto LABEL_56;
          }
        }
        else if (!v16)
        {
LABEL_56:

          v6 = v46;
          goto LABEL_57;
        }
        v38 = v51;
        objc_sync_enter(v38);
        v39 = (NSArray *)[v12 copy];
        linkedPlaces = v38->_linkedPlaces;
        v38->_linkedPlaces = v39;

        objc_sync_exit(v38);
        objc_storeStrong((id *)&v38->_containedPlace, v48);
        v51->_id featureID = (unint64_t)featureID;
        v41 = (NSSet *)[v53 copy];
        linkedPlaceIdentifiers = v38->_linkedPlaceIdentifiers;
        v38->_linkedPlaceIdentifiers = v41;

        [(PersonalizedItemSource *)v38 _notifyObserversItemsDidChange];
        goto LABEL_56;
      }
    }
    else
    {
      v47 = 0;
      id v48 = 0;
      BOOL v16 = v51->_featureID != 0;
      id featureID = 0;
    }
    if (v16
      && [(NSSet *)v51->_linkedPlaceIdentifiers isEqualToSet:v53]
      && featureID == (id)v51->_featureID)
    {
      BOOL v16 = 0;
    }
    goto LABEL_51;
  }
LABEL_57:
}

- (unint64_t)featureID
{
  return self->_featureID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedPlaceIdentifiers, 0);
  objc_storeStrong((id *)&self->_linkedPlaces, 0);
  objc_storeStrong((id *)&self->_containedPlace, 0);

  objc_storeStrong((id *)&self->_geoMapItem, 0);
}

@end