@interface PGPublicEventTemporalClusterComparator
- (double)_distanceFromString:(id)a3 toString:(id)a4;
- (double)distanceFromPublicEvent:(id)a3 toTemporalEvents:(id)a4;
- (id)_removeDateFromString:(id)a3;
@end

@implementation PGPublicEventTemporalClusterComparator

- (id)_removeDateFromString:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    id v36 = 0;
    v4 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:8 error:&v36];
    id v5 = v36;
    v6 = v5;
    if (v4)
    {
      id v26 = v5;
      v7 = [MEMORY[0x1E4F1CA48] array];
      v27 = v4;
      v8 = objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v33 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if ([v13 resultType] == 8) {
              [v7 addObject:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v10);
      }
      v14 = [v7 sortedArrayUsingComparator:&__block_literal_global_34251];
      id v15 = v3;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v25 = v14;
      v16 = [v14 reverseObjectEnumerator];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v29;
        do
        {
          uint64_t v20 = 0;
          v21 = v15;
          do
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v22 = [*(id *)(*((void *)&v28 + 1) + 8 * v20) range];
            objc_msgSend(v21, "stringByReplacingCharactersInRange:withString:", v22, v23, &stru_1F283BC78);
            id v15 = (id)objc_claimAutoreleasedReturnValue();

            ++v20;
            v21 = v15;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v37 count:16];
        }
        while (v18);
      }

      v6 = v26;
      v4 = v27;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v6;
        _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to initialize DataDetector, error: %@", buf, 0xCu);
      }
      id v15 = v3;
    }
  }
  else
  {
    id v15 = v3;
  }

  return v15;
}

uint64_t __64__PGPublicEventTemporalClusterComparator__removeDateFromString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 range];
  unint64_t v6 = [v4 range];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (double)_distanceFromString:(id)a3 toString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 length];
  uint64_t v9 = [v7 length];
  double v10 = 1.0;
  if (v8)
  {
    unint64_t v11 = v9;
    if (v9)
    {
      v12 = [v6 lowercaseString];

      v13 = [v7 lowercaseString];

      if ([v12 isEqualToString:v13])
      {
        id v7 = v13;
        id v6 = v12;
LABEL_6:
        double v10 = 0.0;
        goto LABEL_7;
      }
      id v6 = [(PGPublicEventTemporalClusterComparator *)self _removeDateFromString:v12];

      id v7 = [(PGPublicEventTemporalClusterComparator *)self _removeDateFromString:v13];

      if ([v6 isEqualToString:v7]) {
        goto LABEL_6;
      }
      if (v8 != v11)
      {
        if (v8 >= v11) {
          id v15 = v7;
        }
        else {
          id v15 = v6;
        }
        if (v8 >= v11) {
          v16 = v6;
        }
        else {
          v16 = v7;
        }
        if ([v16 containsString:v15]) {
          double v10 = 0.0;
        }
        else {
          double v10 = 1.0;
        }
      }
    }
  }
LABEL_7:

  return v10;
}

- (double)distanceFromPublicEvent:(id)a3 toTemporalEvents:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 name];
  if ([v8 length])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v22 = v7;
      v12 = 0;
      uint64_t v13 = *(void *)v24;
      double v14 = 1.0;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v9);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v16 category])
          {
            uint64_t v17 = [v16 name];
            if ([v17 length])
            {
              [(PGPublicEventTemporalClusterComparator *)self _distanceFromString:v8 toString:v17];
              if (v18 < v14)
              {
                double v19 = v18;
                id v20 = v16;

                v12 = v20;
                double v14 = v19;
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v33 count:16];
      }
      while (v11);

      if (!v12)
      {
        id v7 = v22;
        goto LABEL_22;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478339;
        long long v28 = v12;
        __int16 v29 = 2113;
        id v30 = v6;
        __int16 v31 = 2048;
        double v32 = v14;
        _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Found matching temporal cluster %{private}@ for public event: %{private}@, distance: %.3lf", buf, 0x20u);
      }
      id v9 = v12;
      id v7 = v22;
    }
    else
    {
      double v14 = 1.0;
    }
  }
  else
  {
    double v14 = 1.0;
  }
LABEL_22:

  return v14;
}

@end