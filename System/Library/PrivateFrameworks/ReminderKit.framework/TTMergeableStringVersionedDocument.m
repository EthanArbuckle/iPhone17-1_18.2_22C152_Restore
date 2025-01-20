@interface TTMergeableStringVersionedDocument
+ (unsigned)minimumSupportedVersion;
+ (unsigned)serializationVersion;
- (BOOL)rem_isEqual:(id)a3;
- (TTMergeableAttributedString)mergeableString;
- (TTMergeableStringVersionedDocument)initWithArchive:(const void *)a3 andReplicaID:(id)a4;
- (TTMergeableStringVersionedDocument)initWithData:(id)a3 andReplicaID:(id)a4;
- (TTMergeableStringVersionedDocument)initWithMergeableString:(id)a3;
- (id)clockElementListForReplicaUUID:(id)a3;
- (id)rem_copyWithReplicaIDForNewEdits:(id)a3;
- (id)serializeCurrentVersion:(unsigned int *)a3;
- (unint64_t)mergeWithStringVersionedDocument:(id)a3;
- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4;
- (void)setMergeableString:(id)a3;
@end

@implementation TTMergeableStringVersionedDocument

- (id)clockElementListForReplicaUUID:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TTMergeableStringVersionedDocument *)self mergeableString];
  [v5 generateIdsForLocalChanges];

  v6 = [(TTMergeableStringVersionedDocument *)self mergeableString];
  v7 = [v6 timestamp];

  v8 = (void *)MEMORY[0x1E4F1CA48];
  v9 = [v7 timestamps];
  v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v11 = [v7 timestamps];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v21 = v7;
    char v14 = 0;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = [*(id *)(*((void *)&v22 + 1) + 8 * i) clockElementForUUID:v4];
        BOOL v18 = v17 != 0;
        if (!v17) {
          v17 = objc_alloc_init(TTVectorTimestampElement);
        }
        v14 |= v18;
        [v10 addObject:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);

    if (v14) {
      v19 = [[REMClockElementList alloc] initWithTTVectorTimestampElements:v10];
    }
    else {
      v19 = 0;
    }
    v7 = v21;
  }
  else
  {

    v19 = 0;
  }

  return v19;
}

- (id)rem_copyWithReplicaIDForNewEdits:(id)a3
{
  id v4 = a3;
  v5 = [(TTVersionedDocument *)self serialize];
  v6 = [[TTMergeableStringVersionedDocument alloc] initWithData:v5 andReplicaID:v4];

  return v6;
}

- (BOOL)rem_isEqual:(id)a3
{
  id v4 = (TTMergeableStringVersionedDocument *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(TTMergeableStringVersionedDocument *)self mergeableString];
      uint64_t v8 = [(TTMergeableStringVersionedDocument *)v6 mergeableString];
      if (v7 == (void *)v8)
      {
        char v12 = 1;
        v9 = v7;
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(TTMergeableStringVersionedDocument *)self mergeableString];
        v11 = [(TTMergeableStringVersionedDocument *)v6 mergeableString];
        char v12 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

+ (unsigned)serializationVersion
{
  return 0;
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

- (TTMergeableStringVersionedDocument)initWithData:(id)a3 andReplicaID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TTMergeableStringVersionedDocument;
  uint64_t v8 = [(TTMergeableStringVersionedDocument *)&v12 init];
  if (v8)
  {
    v9 = [(TTMergeableString *)[TTMergeableAttributedString alloc] initWithReplicaID:v7];
    mergeableString = v8->_mergeableString;
    v8->_mergeableString = v9;

    [(TTVersionedDocument *)v8 loadData:v6];
  }

  return v8;
}

- (TTMergeableStringVersionedDocument)initWithMergeableString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTMergeableStringVersionedDocument;
  id v6 = [(TTMergeableStringVersionedDocument *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mergeableString, a3);
    [(TTVersionedDocument *)v7 loadData:0];
  }

  return v7;
}

- (TTMergeableStringVersionedDocument)initWithArchive:(const void *)a3 andReplicaID:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TTMergeableStringVersionedDocument;
  id v7 = [(TTMergeableStringVersionedDocument *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [(TTMergeableString *)[TTMergeableAttributedString alloc] initWithReplicaID:v6];
    mergeableString = v7->_mergeableString;
    v7->_mergeableString = v8;

    [(TTVersionedDocument *)v7 loadArchive:a3];
  }

  return v7;
}

- (unint64_t)mergeWithStringVersionedDocument:(id)a3
{
  id v4 = a3;
  id v5 = [(TTMergeableStringVersionedDocument *)self mergeableString];
  id v6 = [v4 mergeableString];
  unint64_t v7 = [v5 mergeWithString:v6];

  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)TTMergeableStringVersionedDocument;
    [(TTVersionedDocument *)&v9 mergeWithVersionedDocument:v4];
  }

  return v7;
}

- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4
{
  id v7 = a4;
  id v5 = [(TTMergeableString *)[TTMergeableAttributedString alloc] initWithData:v7 andReplicaID:0];
  if (v5)
  {
    id v6 = [(TTMergeableStringVersionedDocument *)self mergeableString];
    [v6 mergeWithString:v5];
  }
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  *a3 = +[TTMergeableStringVersionedDocument serializationVersion];
  id v4 = [(TTMergeableStringVersionedDocument *)self mergeableString];
  id v5 = [v4 serialize];

  return v5;
}

- (TTMergeableAttributedString)mergeableString
{
  return self->_mergeableString;
}

- (void)setMergeableString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end