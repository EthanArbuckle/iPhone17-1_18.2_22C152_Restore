@interface LiblouisTextFormattingProcessor
- (id)processText:(id)a3 withFormattingRanges:(id)a4;
@end

@implementation LiblouisTextFormattingProcessor

- (id)processText:(id)a3 withFormattingRanges:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5) {
    goto LABEL_51;
  }
  v8 = [v6 boldRanges];
  if (![v8 count])
  {
    v9 = [v7 italicRanges];
    if ([v9 count])
    {

      goto LABEL_5;
    }
    v47 = [v7 underlineRanges];
    id v48 = [v47 count];

    if (v48) {
      goto LABEL_6;
    }
LABEL_51:
    v10 = 0;
    goto LABEL_52;
  }
LABEL_5:

LABEL_6:
  v10 = +[NSMutableData data];
  if ([v5 length])
  {
    unint64_t v11 = 0;
    do
    {
      __int16 v63 = 0;
      [v10 appendBytes:&v63 length:2];
      ++v11;
    }
    while (v11 < (unint64_t)[v5 length]);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v50 = v7;
  v12 = [v7 boldRanges];
  id v13 = [v12 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v60;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v60 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (char *)[*(id *)(*((void *)&v59 + 1) + 8 * i) rangeValue];
        if (v17 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = v17;
          uint64_t v20 = v18;
          v21 = &v17[v18];
          if (&v17[v18] <= [v5 length])
          {
            __int16 v63 = 4;
            if (v19 < v21)
            {
              uint64_t v22 = 2 * (void)v19;
              do
              {
                objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", v22, 2, &v63, 2);
                v22 += 2;
                --v20;
              }
              while (v20);
            }
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v14);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v23 = [v50 italicRanges];
  id v24 = [v23 countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v56;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v56 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = (char *)[*(id *)(*((void *)&v55 + 1) + 8 * (void)j) rangeValue];
        if (v28 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v30 = v28;
          uint64_t v31 = v29;
          v32 = &v28[v29];
          if (&v28[v29] <= [v5 length] && v30 < v32)
          {
            uint64_t v34 = 2 * (void)v30;
            do
            {
              __int16 v63 = 0;
              objc_msgSend(v10, "getBytes:range:", &v63, v34, 2);
              v63 |= 1u;
              objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", v34, 2, &v63, 2);
              v34 += 2;
              --v31;
            }
            while (v31);
          }
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v55 objects:v65 count:16];
    }
    while (v25);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v35 = [v50 underlineRanges];
  id v36 = [v35 countByEnumeratingWithState:&v51 objects:v64 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v52;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v52 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = (char *)[*(id *)(*((void *)&v51 + 1) + 8 * (void)k) rangeValue];
        if (v40 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v42 = v40;
          uint64_t v43 = v41;
          v44 = &v40[v41];
          if (&v40[v41] <= [v5 length] && v42 < v44)
          {
            uint64_t v46 = 2 * (void)v42;
            do
            {
              __int16 v63 = 0;
              objc_msgSend(v10, "getBytes:range:", &v63, v46, 2);
              v63 |= 2u;
              objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", v46, 2, &v63, 2);
              v46 += 2;
              --v43;
            }
            while (v43);
          }
        }
      }
      id v37 = [v35 countByEnumeratingWithState:&v51 objects:v64 count:16];
    }
    while (v37);
  }

  v7 = v50;
LABEL_52:

  return v10;
}

@end