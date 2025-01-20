@interface VenueCardDealer
- (id)existingCardForHand:(id)a3 cardItem:(id)a4;
- (id)newHandFromExistingHand:(id)a3 nextTopCard:(id)a4 source:(unint64_t)a5;
- (unint64_t)_indexOfFirstNonPlaceCardInHand:(id)a3;
- (unint64_t)_venueIdForHand:(id)a3;
@end

@implementation VenueCardDealer

- (id)newHandFromExistingHand:(id)a3 nextTopCard:(id)a4 source:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 isVenueItem])
  {
    v10 = [(VenueCardDealer *)self existingCardForHand:v8 cardItem:v9];
    if (v10 && (v11 = (char *)[v8 indexOfObject:v10], v11 != (char *)0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v18 = [v8 subarrayWithRange:0, v11 + 1];
    }
    else
    {
      if ([v8 count])
      {
        id v12 = [(VenueCardDealer *)self _venueIdForHand:v8];
        if (v12 == [v9 venueID])
        {
          if (a5 != 1
            || ![v9 conformsToProtocol:&OBJC_PROTOCOL___VenuePlaceCardItem]
            || ([v8 lastObject],
                v13 = objc_claimAutoreleasedReturnValue(),
                unsigned int v14 = [v13 conformsToProtocol:&OBJC_PROTOCOL___VenuePlaceCardItem],
                v13,
                !v14))
          {
            uint64_t v18 = [v8 arrayByAddingObject:v9];
            goto LABEL_17;
          }
          unint64_t v15 = [(VenueCardDealer *)self _indexOfFirstNonPlaceCardInHand:v8];
          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v20 = [v8 subarrayWithRange:0, v15 + 1];
            id v17 = [v20 arrayByAddingObject:v9];

            goto LABEL_18;
          }
          id v21 = v9;
          v16 = &v21;
        }
        else
        {
          id v22 = v9;
          v16 = &v22;
        }
      }
      else
      {
        id v23 = v9;
        v16 = &v23;
      }
      uint64_t v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 1, v21, v22, v23);
    }
LABEL_17:
    id v17 = (id)v18;
LABEL_18:

    goto LABEL_19;
  }
  id v17 = v8;
LABEL_19:

  return v17;
}

- (id)existingCardForHand:(id)a3 cardItem:(id)a4
{
  id v5 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [a3 reverseObjectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = v5;
        id v12 = v11;
        if (v10 == v11)
        {

          id v10 = v12;
LABEL_16:
          id v7 = v10;
          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (id v13 = [v10 venueCardID], v13 == objc_msgSend(v12, "venueCardID")))
        {
          id v14 = [v10 venueCardID];

          if (v14) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v7;
}

- (unint64_t)_venueIdForHand:(id)a3
{
  v3 = [a3 firstObject];
  v4 = v3;
  if (v3) {
    id v5 = [v3 venueID];
  }
  else {
    id v5 = 0;
  }

  return (unint64_t)v5;
}

- (unint64_t)_indexOfFirstNonPlaceCardInHand:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003B0DDC;
  v6[3] = &unk_1012E7698;
  v6[4] = &v7;
  [v3 enumerateObjectsWithOptions:2 usingBlock:v6];
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

@end