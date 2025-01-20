@interface FPOutputFormatterPerfdata
- (void)close;
- (void)endAtTime:(id)a3;
- (void)printGlobalAuxData:(id)a3;
- (void)printProcessAuxData:(id)a3 forProcess:(id)a4;
- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5;
- (void)printProcessHeader:(id)a3;
- (void)printProcessTotal:(id)a3 forProcess:(id)a4;
- (void)printSharedCache:(id)a3 categories:(id)a4 sharedWith:(id)a5 total:(id *)a6;
- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7;
- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5;
- (void)startAtTime:(id)a3;
@end

@implementation FPOutputFormatterPerfdata

- (void)startAtTime:(id)a3
{
}

- (void)printProcessHeader:(id)a3
{
}

- (void)printProcessTotal:(id)a3 forProcess:(id)a4
{
  id v5 = a4;
  [a3 unsignedLongLongValue];
  pdwriter_new_value();
  id v6 = [v5 name];
  [v6 UTF8String];
  pdwriter_record_variable_str();

  id v7 = [v5 name];
  [v7 UTF8String];
  pdwriter_record_variable_str();

  LODWORD(a3) = [v5 pid];
  snprintf(__str, 0xBuLL, "%d", a3);
  pdwriter_record_label_str();
  pdwriter_record_tag();
}

- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5
{
  id v10 = a3;
  id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  currentProcessTotals = self->_currentProcessTotals;
  self->_currentProcessTotals = v6;

  v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  currentProcessAuxDatas = self->_currentProcessAuxDatas;
  self->_currentProcessAuxDatas = v8;

  sub_100018FA0((uint64_t)self, v10);
}

- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7
{
}

- (void)printSharedCache:(id)a3 categories:(id)a4 sharedWith:(id)a5 total:(id *)a6
{
}

- (void)printProcessAuxData:(id)a3 forProcess:(id)a4
{
  id v22 = a3;
  id v6 = [a4 name];
  id v7 = [v6 UTF8String];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = self->_currentProcessTotals;
  id v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v24 = *(void *)v26;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v10);
        v12 = [(NSMutableDictionary *)self->_currentProcessTotals objectForKeyedSubscript:v11];
        uint64_t v13 = [(NSMutableDictionary *)self->_currentProcessAuxDatas objectForKeyedSubscript:v11];
        v14 = (void **)v13;
        if (v13) {
          v15 = *(void **)(v13 + 16);
        }
        else {
          v15 = 0;
        }
        if (v15) {
          v16 = v15;
        }
        else {
          v16 = v11;
        }
        id v17 = v16;
        id v18 = v15;
        [v17 UTF8String];
        [v12 unsignedLongLongValue];
        pdwriter_new_value();

        pdwriter_record_variable_str();
        pdwriter_record_variable_str();
        if (v14) {
          sub_100019444((uint64_t)self, v14[1], 0);
        }

        id v10 = (char *)v10 + 1;
      }
      while (v9 != v10);
      id v19 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      id v9 = v19;
    }
    while (v19);
  }

  currentProcessTotals = self->_currentProcessTotals;
  self->_currentProcessTotals = 0;

  currentProcessAuxDatas = self->_currentProcessAuxDatas;
  self->_currentProcessAuxDatas = 0;

  sub_100019618((uint64_t)self, v22, "aux_data", (uint64_t)v7);
}

- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5
{
  id v7 = a3;
  pdwriter_new_group();
  pdwriter_new_value();
  pdwriter_record_variable_str();
  pdwriter_record_variable_str();
  pdwriter_record_tag();
  if (v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = v7;
    id v15 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v15)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(obj);
          }
          id v9 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          id v10 = sub_10001D514(v9);
          if (v10 && (sub_10001D5B0((uint64_t)v9), (v11 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v12 = v11;
            int v13 = 0;
          }
          else
          {
            v11 = sub_10001D4CC((uint64_t)v9);
            id v5 = v11;
            v12 = 0;
            int v13 = 1;
          }
          [v11 UTF8String];
          [v9 totalDirtySize];
          [v9 totalSwappedSize];
          pdwriter_new_value();
          if (v13) {

          }
          pdwriter_record_variable_str();
          pdwriter_record_variable_str();
          if (v10) {
            sub_100019444((uint64_t)self, v10, 0);
          }
        }
        id v15 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v15);
    }
  }
}

- (void)printGlobalAuxData:(id)a3
{
}

- (void)endAtTime:(id)a3
{
  sub_100018C10((unint64_t)a3);
  sub_100018C10((unint64_t)self->_startTime);
  pdwriter_new_value();

  pdwriter_record_tag();
}

- (void)close
{
  self->_writer = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_currentProcessAuxDatas, 0);

  objc_storeStrong((id *)&self->_currentProcessTotals, 0);
}

@end