@interface CRFormFieldLabelAssociationStep
- (CRFormFieldLabelAssociationStep)init;
- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6;
@end

@implementation CRFormFieldLabelAssociationStep

- (CRFormFieldLabelAssociationStep)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRFormFieldLabelAssociationStep;
  v2 = [(CRFormFieldLabelAssociationStep *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CRFormParser);
    parser = v2->_parser;
    v2->_parser = v3;
  }
  return v2;
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = CROSLogForCategory(6);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134217984;
    uint64_t v24 = [v10 count];
    _os_log_impl(&dword_1DD733000, v14, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldLabelAssociationStep is running (#input:%lu).", (uint8_t *)&v23, 0xCu);
  }

  v15 = [v13 objectForKeyedSubscript:@"ShouldUpdateExternalFieldsOption"];
  uint64_t v16 = [v15 BOOLValue];

  v17 = [v10 _flattenedFields];
  v18 = [v17 arrayByAddingObjectsFromArray:v11];

  v19 = [(CRFormParser *)self->_parser parseFieldsInDocument:v12 allFields:v18 shouldUpdateExternalFields:v16];
  v20 = CROSLogForCategory(6);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = [v19 count];
    int v23 = 134217984;
    uint64_t v24 = v21;
    _os_log_impl(&dword_1DD733000, v20, OS_LOG_TYPE_DEBUG, "CRFormPostProcessor: CRFormFieldLabelAssociationStep is completed (#output:%lu).", (uint8_t *)&v23, 0xCu);
  }

  return v19;
}

- (void).cxx_destruct
{
}

@end