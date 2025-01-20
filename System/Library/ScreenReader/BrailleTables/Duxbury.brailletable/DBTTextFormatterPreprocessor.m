@interface DBTTextFormatterPreprocessor
- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6;
@end

@implementation DBTTextFormatterPreprocessor

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a6;
  if (v9)
  {
    if (v7)
    {
      id v11 = v9;
    }
    else
    {
      v12 = +[NSMutableString stringWithString:v9];
      v72 = a4;
      id v73 = v9;
      if (a4)
      {
        id v82 = +[NSMutableData dataWithLength:0];
      }
      else
      {
        id v82 = 0;
      }
      id v84 = v12;
      id v78 = +[NSMutableDictionary dictionary];
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      id v74 = v10;
      v13 = [v10 boldRanges];
      id v14 = [v13 countByEnumeratingWithState:&v105 objects:v113 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v106;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v106 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = (char *)[*(id *)(*((void *)&v105 + 1) + 8 * i) rangeValue];
            if (v18 != (char *)0x7FFFFFFFFFFFFFFFLL)
            {
              v20 = v18;
              v21 = &v18[v19];
              if (&v18[v19] <= [v84 length])
              {
                v22 = +[NSNumber numberWithUnsignedInteger:v20];
                [v78 setArrayObject:@"\x1Cfts~b\x1F" forKey:v22];

                v23 = +[NSNumber numberWithUnsignedInteger:v21];
                [v78 setArrayObject:@"\x1Cfte~b\x1F" forKey:v23];
              }
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v105 objects:v113 count:16];
        }
        while (v15);
      }

      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      v24 = [v74 italicRanges];
      id v25 = [v24 countByEnumeratingWithState:&v101 objects:v112 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v102;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(void *)v102 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = (char *)[*(id *)(*((void *)&v101 + 1) + 8 * (void)j) rangeValue];
            if (v29 != (char *)0x7FFFFFFFFFFFFFFFLL)
            {
              v31 = v29;
              v32 = &v29[v30];
              if (&v29[v30] <= [v84 length])
              {
                v33 = +[NSNumber numberWithUnsignedInteger:v31];
                [v78 setArrayObject:@"\x1Cfts~i\x1F" forKey:v33];

                v34 = +[NSNumber numberWithUnsignedInteger:v32];
                [v78 setArrayObject:@"\x1Cfte~i\x1F" forKey:v34];
              }
            }
          }
          id v26 = [v24 countByEnumeratingWithState:&v101 objects:v112 count:16];
        }
        while (v26);
      }

      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      v35 = [v74 underlineRanges];
      id v36 = [v35 countByEnumeratingWithState:&v97 objects:v111 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v98;
        do
        {
          for (k = 0; k != v37; k = (char *)k + 1)
          {
            if (*(void *)v98 != v38) {
              objc_enumerationMutation(v35);
            }
            v40 = (char *)[*(id *)(*((void *)&v97 + 1) + 8 * (void)k) rangeValue];
            if (v40 != (char *)0x7FFFFFFFFFFFFFFFLL)
            {
              v42 = v40;
              v43 = &v40[v41];
              if (&v40[v41] <= [v84 length])
              {
                v44 = +[NSNumber numberWithUnsignedInteger:v42];
                [v78 setArrayObject:@"\x1Cfts~u\x1F" forKey:v44];

                v45 = +[NSNumber numberWithUnsignedInteger:v43];
                [v78 setArrayObject:@"\x1Cfte~u\x1F" forKey:v45];
              }
            }
          }
          id v37 = [v35 countByEnumeratingWithState:&v97 objects:v111 count:16];
        }
        while (v37);
      }

      uint64_t v96 = 0;
      id v11 = v84;
      if ([v84 length])
      {
        do
        {
          [v82 appendBytes:&v96 length:8];
          unint64_t v46 = ++v96;
        }
        while (v46 < (unint64_t)[v84 length]);
      }
      v47 = +[NSMutableArray array];
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      v48 = [v78 allKeys];
      v49 = [v48 sortedArrayUsingComparator:&__block_literal_global_0];

      id v75 = v49;
      id v77 = [v49 countByEnumeratingWithState:&v92 objects:v110 count:16];
      if (v77)
      {
        uint64_t v76 = *(void *)v93;
        do
        {
          uint64_t v50 = 0;
          do
          {
            if (*(void *)v93 != v76) {
              objc_enumerationMutation(v75);
            }
            uint64_t v80 = v50;
            v51 = *(void **)(*((void *)&v92 + 1) + 8 * v50);
            v52 = [v78 objectForKeyedSubscript:v51];
            v53 = [v52 sortedArrayUsingComparator:&__block_literal_global_22];

            long long v90 = 0u;
            long long v91 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            id v79 = v53;
            id v81 = [v53 reverseObjectEnumerator];
            id v85 = [v81 countByEnumeratingWithState:&v88 objects:v109 count:16];
            if (v85)
            {
              uint64_t v83 = *(void *)v89;
              do
              {
                uint64_t v54 = 0;
                do
                {
                  if (*(void *)v89 != v83) {
                    objc_enumerationMutation(v81);
                  }
                  uint64_t v87 = v54;
                  v55 = *(void **)(*((void *)&v88 + 1) + 8 * v54);
                  objc_msgSend(v11, "insertString:atIndex:", v55, objc_msgSend(v51, "integerValue"));
                  [v55 length];
                  v86 = &v72;
                  __chkstk_darwin();
                  v57 = (char *)&v72 - v56;
                  if ([v55 length])
                  {
                    unint64_t v58 = 0;
                    do
                      *(void *)&v57[8 * v58++] = [v51 integerValue];
                    while (v58 < (unint64_t)[v55 length]);
                  }
                  uint64_t v59 = 8 * (void)[v51 integerValue];
                  id v60 = [v55 length];
                  objc_msgSend(v82, "replaceBytesInRange:withBytes:length:", v59, 0, v57, 8 * (void)v60);
                  if ([v47 count])
                  {
                    unint64_t v61 = 0;
                    do
                    {
                      v62 = [v47 objectAtIndexedSubscript:v61];
                      id v63 = [v62 rangeValue];
                      v64 = (char *)[v55 length] + (void)v63;
                      v65 = [v47 objectAtIndexedSubscript:v61];
                      [v65 rangeValue];
                      v67 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v64, v66);
                      [v47 setObject:v67 atIndexedSubscript:v61];

                      ++v61;
                    }
                    while (v61 < (unint64_t)[v47 count]);
                  }
                  v68 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", [v51 integerValue], objc_msgSend(v55, "length"));
                  [v47 addObject:v68];

                  uint64_t v54 = v87 + 1;
                  id v11 = v84;
                }
                while ((id)(v87 + 1) != v85);
                id v85 = [v81 countByEnumeratingWithState:&v88 objects:v109 count:16];
              }
              while (v85);
            }

            uint64_t v50 = v80 + 1;
          }
          while ((id)(v80 + 1) != v77);
          id v77 = [v75 countByEnumeratingWithState:&v92 objects:v110 count:16];
        }
        while (v77);
      }

      v69 = v72;
      id v70 = v82;
      if (v72) {
        id *v69 = v82;
      }

      id v9 = v73;
      id v10 = v74;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

int64_t __102__DBTTextFormatterPreprocessor_preprocessPrintString_withLocationMap_isEightDot_textFormattingRanges___block_invoke(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

int64_t __102__DBTTextFormatterPreprocessor_preprocessPrintString_withLocationMap_isEightDot_textFormattingRanges___block_invoke_2(id a1, id a2, id a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 containsString:@"~b"]) {
    goto LABEL_7;
  }
  if (([v5 containsString:@"~b"] & 1) == 0)
  {
    if (([v4 containsString:@"~i"] & 1) == 0)
    {
      if ([v5 containsString:@"~i"]) {
        goto LABEL_5;
      }
      if (([v4 containsString:@"~u"] & 1) == 0)
      {
        int64_t v6 = [v5 containsString:@"~u"];
        goto LABEL_8;
      }
    }
LABEL_7:
    int64_t v6 = -1;
    goto LABEL_8;
  }
LABEL_5:
  int64_t v6 = 1;
LABEL_8:

  return v6;
}

@end