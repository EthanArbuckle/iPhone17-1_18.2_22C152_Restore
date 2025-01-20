@interface DataComparisonByBytes
+ (id)dataComparisonByBytesWithData1:(id)a3 data2:(id)a4 reference:(id)a5;
@end

@implementation DataComparisonByBytes

+ (id)dataComparisonByBytesWithData1:(id)a3 data2:(id)a4 reference:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithObj1:v8 obj2:v9 reference:v10];
  if (v11)
  {
    unint64_t v12 = [v8 length];
    unint64_t v13 = [v9 length];
    if (v12 >= v13) {
      unint64_t v14 = v13;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14)
    {
      unint64_t v15 = 0;
      do
      {
        id v16 = v8;
        uint64_t v17 = [v16 bytes];
        id v18 = v9;
        uint64_t v19 = [v18 bytes];
        [v11 incrementTokensWith:*(unsigned __int8 *)(v17 + v15) == *(unsigned __int8 *)(v19 + v15)];
        unsigned int v20 = *(unsigned __int8 *)(v17 + v15);
        unsigned int v21 = *(unsigned __int8 *)(v19 + v15);
        int v22 = v21 - v20;
        BOOL v23 = v20 >= v21;
        int v24 = v20 - v21;
        if (!v23) {
          int v24 = v22;
        }
        [v11 incrementDistanceWith:v24];
        ++v15;
        unint64_t v25 = [v16 length];
        unint64_t v26 = [v18 length];
        if (v25 >= v26) {
          unint64_t v27 = v26;
        }
        else {
          unint64_t v27 = v25;
        }
      }
      while (v15 < v27);
    }
    [v11 accountForadditionalLength];
    id v28 = v11;
  }

  return v11;
}

@end