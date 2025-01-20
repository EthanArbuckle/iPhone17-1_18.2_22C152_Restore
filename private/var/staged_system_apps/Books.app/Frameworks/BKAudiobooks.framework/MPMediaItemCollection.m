@interface MPMediaItemCollection
- (BOOL)_hasBeenPlayed:(id)a3;
- (BOOL)bk_cloudHasBeenPlayed;
- (BOOL)bk_localHasBeenPlayed;
- (double)_bookmarkTime:(id)a3 timestamp:(id *)a4;
- (double)_duration:(id)a3;
- (double)_timeRemaining:(id)a3;
- (double)bk_cloudBookmarkTime;
- (double)bk_cloudDuration;
- (double)bk_cloudTimeRemaining;
- (double)bk_localBookmarkTime;
- (double)bk_localDuration;
- (double)bk_localTimeRemaining;
- (id)bk_cloudBookmarkTimestamp;
- (id)bk_cloudItems;
- (id)bk_cloudRepresentativeItem;
- (id)bk_items;
- (id)bk_localBookmarkTimestamp;
- (id)bk_localItems;
- (id)bk_localRepresentativeItem;
- (id)bk_mostRecentListeningProgress;
- (id)bk_representativeItem;
@end

@implementation MPMediaItemCollection

- (id)bk_cloudRepresentativeItem
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(MPMediaItemCollection *)self items];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = MPMediaItemPropertyPurchaseHistoryID;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = [v8 valueForProperty:v6];
        if ([v8 mediaType] == &dword_4 && objc_msgSend(v9, "longLongValue"))
        {
          id v10 = v8;

          goto LABEL_12;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (id)bk_localRepresentativeItem
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(MPMediaItemCollection *)self items];
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    uint64_t v6 = MPMediaItemPropertyPurchaseHistoryID;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = [v8 valueForProperty:v6];
        if ([v8 mediaType] == &dword_4 && !objc_msgSend(v9, "longLongValue"))
        {
          id v10 = v8;

          goto LABEL_12;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (id)bk_representativeItem
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(MPMediaItemCollection *)self items];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 mediaType] == &dword_4)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)bk_items
{
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(MPMediaItemCollection *)self items];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 mediaType] == &dword_4) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];

  return v10;
}

- (id)bk_localItems
{
  id v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(MPMediaItemCollection *)self items];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = MPMediaItemPropertyPurchaseHistoryID;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [v10 valueForProperty:v8];
        if ([v10 mediaType] == &dword_4 && !objc_msgSend(v11, "longLongValue")) {
          [v3 addObject:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = [v3 copy];

  return v12;
}

- (id)bk_cloudItems
{
  id v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(MPMediaItemCollection *)self items];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    uint64_t v8 = MPMediaItemPropertyPurchaseHistoryID;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = [v10 valueForProperty:v8];
        if ([v10 mediaType] == &dword_4 && objc_msgSend(v11, "longLongValue")) {
          [v3 addObject:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  if ((unint64_t)[v3 count] >= 2)
  {
    id v12 = BKAudiobooksLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_257D0(v3, v12);
    }
  }
  id v13 = [v3 copy];

  return v13;
}

- (id)bk_mostRecentListeningProgress
{
  id v3 = [(MPMediaItemCollection *)self bk_localItems];
  uint64_t v4 = [(MPMediaItemCollection *)self bk_cloudItems];
  id v22 = 0;
  [(MPMediaItemCollection *)self _bookmarkTime:v3 timestamp:&v22];
  double v6 = v5;
  id v7 = v22;
  id v21 = 0;
  [(MPMediaItemCollection *)self _bookmarkTime:v4 timestamp:&v21];
  double v9 = v8;
  id v10 = v21;
  long long v11 = v10;
  if (v7) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    if ([v7 compare:v10] != (id)-1) {
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  if (!v7 && v10)
  {
LABEL_12:
    [(MPMediaItemCollection *)self _duration:v4];
    if (v15 > 0.0)
    {
      double v14 = v9 / v15;
      goto LABEL_14;
    }
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  if (!v7) {
    goto LABEL_18;
  }
  [(MPMediaItemCollection *)self _duration:v3];
  if (v13 <= 0.0) {
    goto LABEL_18;
  }
  double v14 = v6 / v13;
LABEL_14:
  long long v16 = +[NSNumber numberWithDouble:v14];
  long long v17 = v16;
  if (!v16) {
    goto LABEL_18;
  }
  [v16 doubleValue];
  if (v18 > 1.0) {
    double v18 = 1.0;
  }
  v19 = +[NSNumber numberWithDouble:fmax(v18, 0.0)];

LABEL_19:

  return v19;
}

- (double)_bookmarkTime:(id)a3 timestamp:(id *)a4
{
  id v5 = a3;
  if ([v5 count] == (char *)&dword_0 + 1)
  {
    double v6 = [v5 firstObject];
    id v7 = [v6 valueForProperty:MPMediaItemPropertyBookmarkTime];
    [v7 doubleValue];
    double v9 = v8;

    if (![v6 hasBeenPlayed]
      || ([v6 dateAccessed], (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_opt_class();
      long long v11 = [v6 valueForProperty:MPMediaItemPropertyLastPlayedDate];
      id v10 = BUDynamicCast();
    }
    if (!a4) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if ((unint64_t)[v5 count] < 2)
  {
    id v10 = 0;
    double v9 = 0.0;
    if (!a4) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  id v29 = v5;
  v30 = a4;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v5;
  id v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    id v13 = v12;
    char v14 = 0;
    id v10 = 0;
    uint64_t v32 = *(void *)v34;
    double v15 = 0.0;
    double v16 = 0.0;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        double v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v19 = [v18 dateAccessed:v29, v30];
        unsigned int v20 = [v18 hasBeenPlayed];
        id v21 = [v18 valueForProperty:MPMediaItemPropertyPlaybackDuration];
        [v21 doubleValue];
        double v23 = v22;

        v24 = [v18 valueForProperty:MPMediaItemPropertyBookmarkTime];
        [v24 doubleValue];
        double v26 = v25;

        if (v26 > v23) {
          double v26 = 0.0;
        }
        if (v20)
        {
          if (!v10 || [v19 compare:v10] == (char *)&dword_0 + 1)
          {
            id v27 = v19;

            id v10 = v27;
          }
          double v15 = v16 + v26;
        }
        v14 |= v20;
        double v16 = v16 + v23;
      }
      id v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v13);
  }
  else
  {
    char v14 = 0;
    id v10 = 0;
    double v15 = 0.0;
  }

  if ((v10 != 0) | v14 & 1)
  {
    double v9 = v15;
  }
  else
  {
    id v10 = 0;
    double v9 = 0.0;
  }
  id v5 = v29;
  a4 = v30;
  if (v30) {
LABEL_30:
  }
    *a4 = v10;
LABEL_31:

  return v9;
}

- (double)bk_localBookmarkTime
{
  id v3 = [(MPMediaItemCollection *)self bk_localItems];
  [(MPMediaItemCollection *)self _bookmarkTime:v3 timestamp:0];
  double v5 = v4;

  return v5;
}

- (double)bk_cloudBookmarkTime
{
  id v3 = [(MPMediaItemCollection *)self bk_cloudItems];
  [(MPMediaItemCollection *)self _bookmarkTime:v3 timestamp:0];
  double v5 = v4;

  return v5;
}

- (id)bk_localBookmarkTimestamp
{
  id v3 = [(MPMediaItemCollection *)self bk_localItems];
  id v6 = 0;
  [(MPMediaItemCollection *)self _bookmarkTime:v3 timestamp:&v6];
  id v4 = v6;

  return v4;
}

- (id)bk_cloudBookmarkTimestamp
{
  id v3 = [(MPMediaItemCollection *)self bk_cloudItems];
  id v6 = 0;
  [(MPMediaItemCollection *)self _bookmarkTime:v3 timestamp:&v6];
  id v4 = v6;

  return v4;
}

- (double)_duration:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    double v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        double v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) valueForProperty:MPMediaItemPropertyPlaybackDuration];
        [v9 doubleValue];
        double v11 = v10;

        double v7 = v7 + v11;
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (double)bk_localDuration
{
  id v3 = [(MPMediaItemCollection *)self bk_localItems];
  [(MPMediaItemCollection *)self _duration:v3];
  double v5 = v4;

  return v5;
}

- (double)bk_cloudDuration
{
  id v3 = [(MPMediaItemCollection *)self bk_cloudItems];
  [(MPMediaItemCollection *)self _duration:v3];
  double v5 = v4;

  return v5;
}

- (double)_timeRemaining:(id)a3
{
  id v4 = a3;
  [(MPMediaItemCollection *)self _duration:v4];
  double v6 = v5;
  [(MPMediaItemCollection *)self _bookmarkTime:v4 timestamp:0];
  double v8 = v7;

  return v6 - v8;
}

- (double)bk_localTimeRemaining
{
  id v3 = [(MPMediaItemCollection *)self bk_localItems];
  [(MPMediaItemCollection *)self _timeRemaining:v3];
  double v5 = v4;

  return v5;
}

- (double)bk_cloudTimeRemaining
{
  id v3 = [(MPMediaItemCollection *)self bk_cloudItems];
  [(MPMediaItemCollection *)self _timeRemaining:v3];
  double v5 = v4;

  return v5;
}

- (BOOL)_hasBeenPlayed:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "hasBeenPlayed", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)bk_localHasBeenPlayed
{
  v2 = self;
  id v3 = [(MPMediaItemCollection *)self bk_localItems];
  LOBYTE(v2) = [(MPMediaItemCollection *)v2 _hasBeenPlayed:v3];

  return (char)v2;
}

- (BOOL)bk_cloudHasBeenPlayed
{
  v2 = self;
  id v3 = [(MPMediaItemCollection *)self bk_cloudItems];
  LOBYTE(v2) = [(MPMediaItemCollection *)v2 _hasBeenPlayed:v3];

  return (char)v2;
}

@end