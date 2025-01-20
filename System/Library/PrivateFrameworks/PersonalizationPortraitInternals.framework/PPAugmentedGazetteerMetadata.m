@interface PPAugmentedGazetteerMetadata
- (PPAugmentedGazetteerMetadata)initWithStatement:(id)a3;
@end

@implementation PPAugmentedGazetteerMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_qid, 0);
}

- (PPAugmentedGazetteerMetadata)initWithStatement:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PPAugmentedGazetteerMetadata;
  v5 = [(PPAugmentedGazetteerMetadata *)&v20 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = (void *)MEMORY[0x1CB79D060]();
  unint64_t v7 = [v4 getInt64ForColumnName:"qid" table:"metadata"];
  if (HIDWORD(v7))
  {
    v16 = pp_default_log_handle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
LABEL_9:

      v15 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v17 = "Augmented gazetteer qid was not a valid uint32_t value";
LABEL_12:
    _os_log_fault_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_FAULT, v17, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    v16 = pp_default_log_handle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid augmented gazetteer qid of 0 detected";
    goto LABEL_12;
  }
  uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Q%u", v7);
  qid = v5->_qid;
  v5->_qid = (NSString *)v8;

  v5->_threshold = (double)[v4 getInt64ForColumnName:"threshold" table:"metadata"] * 0.125;
  uint64_t v10 = [v4 getNSStringForColumnName:"category" table:"metadata"];
  category = v5->_category;
  v5->_category = (NSString *)v10;

  v5->_gazetteerDomain = [v4 getInt64ForColumnName:"gazetteerDomain" table:"metadata"];
  uint64_t v12 = [v4 getNSStringForColumnName:"alias" table:"metadata"];
  alias = v5->_alias;
  v5->_alias = (NSString *)v12;

  v14 = [v4 getInt64AsNSNumberForColumnName:"isLocation" table:"metadata"];
  v5->_isLocation = [v14 BOOLValue];

LABEL_5:
  v15 = v5;
LABEL_10:

  return v15;
}

@end