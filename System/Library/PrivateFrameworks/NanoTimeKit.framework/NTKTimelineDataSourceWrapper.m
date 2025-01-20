@interface NTKTimelineDataSourceWrapper
- (CLKComplicationDataSource)dataSource;
- (NTKTimelineDataSourceWrapper)initWithDataSource:(id)a3;
- (void)tl_getCurrentTimelineEntryForIdentifiable:(id)a3 withHandler:(id)a4;
- (void)tl_getTimelineEntriesForIdentifiable:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5 withHandler:(id)a6;
@end

@implementation NTKTimelineDataSourceWrapper

- (NTKTimelineDataSourceWrapper)initWithDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKTimelineDataSourceWrapper;
  v6 = [(NTKTimelineDataSourceWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v7;
}

- (void)tl_getCurrentTimelineEntryForIdentifiable:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  id v17 = [(NTKTimelineDataSourceWrapper *)self dataSource];
  if (v13[5] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = (void *)v13[5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__NTKTimelineDataSourceWrapper_tl_getCurrentTimelineEntryForIdentifiable_withHandler___block_invoke;
    v9[3] = &unk_1E62C1170;
    id v10 = v7;
    v11 = &v12;
    [v8 getCurrentTimelineEntryForComplication:v6 withHandler:v9];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
  _Block_object_dispose(&v12, 8);
}

void __86__NTKTimelineDataSourceWrapper_tl_getCurrentTimelineEntryForIdentifiable_withHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)tl_getTimelineEntriesForIdentifiable:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5 withHandler:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void))a6;
  uint64_t v12 = [(NTKTimelineDataSourceWrapper *)self dataSource];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    [v12 getTimelineEntriesForComplication:v13 afterDate:v10 limit:a5 withHandler:v11];
  }
  else {
    v11[2](v11, 0);
  }
}

- (CLKComplicationDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

@end