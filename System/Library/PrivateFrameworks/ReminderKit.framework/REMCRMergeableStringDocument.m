@interface REMCRMergeableStringDocument
+ (BOOL)supportsSecureCoding;
+ (id)documentFromSerializedData:(id)a3 replicaIDSource:(id)a4 forKey:(id)a5 ofObjectID:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)attributedString;
- (NSString)string;
- (REMCRMergeableStringDocument)initWithCoder:(id)a3;
- (REMCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 attributedString:(id)a4;
- (REMCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 document:(id)a4;
- (REMCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 serializedData:(id)a4 error:(id *)a5;
- (REMCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 string:(id)a4;
- (REMReplicaIDSource)replicaIDSource;
- (TTMergeableAttributedString)mergeableString;
- (TTMergeableStringVersionedDocument)document;
- (id)hashtagAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)mergedWithDocument:(id)a3 error:(id *)a4;
- (id)mutableDocument;
- (id)serializedData;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateHashtagInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)setDocument:(id)a3;
- (void)setReplicaIDSource:(id)a3;
@end

@implementation REMCRMergeableStringDocument

- (id)hashtagAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  v6 = [(REMCRMergeableStringDocument *)self mergeableString];
  v7 = [v6 attributedString];
  v8 = objc_msgSend(v7, "rem_hashtagAtIndex:effectiveRange:", a3, a4);

  return v8;
}

- (void)enumerateHashtagInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a5;
  id v11 = [(REMCRMergeableStringDocument *)self mergeableString];
  v10 = [v11 attributedString];
  objc_msgSend(v10, "rem_enumerateHashtagInRange:options:usingBlock:", location, length, a4, v9);
}

- (REMCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 string:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[REMReplicaIDHelper replicaUUIDForCreation];
  id v9 = [(TTMergeableString *)[TTMergeableAttributedString alloc] initWithReplicaID:v8];
  [(TTMergeableAttributedString *)v9 insertString:v6 atIndex:0];

  v10 = [[TTMergeableStringVersionedDocument alloc] initWithMergeableString:v9];
  id v11 = [(REMCRMergeableStringDocument *)self initWithReplicaIDSource:v7 document:v10];

  return v11;
}

- (REMCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 attributedString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[REMReplicaIDHelper replicaUUIDForCreation];
  id v9 = [(TTMergeableString *)[TTMergeableAttributedString alloc] initWithReplicaID:v8];
  [(TTMergeableString *)v9 insertAttributedString:v6 atIndex:0];

  v10 = [[TTMergeableStringVersionedDocument alloc] initWithMergeableString:v9];
  id v11 = [(REMCRMergeableStringDocument *)self initWithReplicaIDSource:v7 document:v10];

  return v11;
}

- (REMCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 serializedData:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [TTMergeableStringVersionedDocument alloc];
  v10 = +[REMReplicaIDHelper nonEditingReplicaUUID];
  id v11 = [(TTMergeableStringVersionedDocument *)v9 initWithData:v7 andReplicaID:v10];

  v12 = [(REMCRMergeableStringDocument *)self initWithReplicaIDSource:v8 document:v11];
  return v12;
}

- (REMCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 document:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMCRMergeableStringDocument;
  id v9 = [(REMCRMergeableStringDocument *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_replicaIDSource, a3);
    objc_storeStrong((id *)&v10->_document, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMCRMergeableStringDocument *)self document];
  id v7 = [v5 serialize];

  [v4 encodeObject:v7 forKey:@"document"];
  id v6 = [(REMCRMergeableStringDocument *)self replicaIDSource];
  [v4 encodeObject:v6 forKey:@"replicaIDSource"];
}

- (REMCRMergeableStringDocument)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REMCRMergeableStringDocument;
  v5 = [(REMCRMergeableStringDocument *)&v14 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replicaIDSource"];
  replicaIDSource = v5->_replicaIDSource;
  v5->_replicaIDSource = (REMReplicaIDSource *)v6;

  if (!v5->_replicaIDSource)
  {
    id v8 = 0;
    goto LABEL_7;
  }
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"document"];
  if (v8)
  {
    id v9 = [TTMergeableStringVersionedDocument alloc];
    v10 = +[REMReplicaIDHelper nonEditingReplicaUUID];
    uint64_t v11 = [(TTMergeableStringVersionedDocument *)v9 initWithData:v8 andReplicaID:v10];
    document = v5->_document;
    v5->_document = (TTMergeableStringVersionedDocument *)v11;

LABEL_5:
    id v8 = v5;
  }
LABEL_7:

  return v8;
}

- (TTMergeableAttributedString)mergeableString
{
  v2 = [(REMCRMergeableStringDocument *)self document];
  v3 = [v2 mergeableString];

  return (TTMergeableAttributedString *)v3;
}

- (NSAttributedString)attributedString
{
  v2 = [(REMCRMergeableStringDocument *)self document];
  v3 = [v2 mergeableString];
  id v4 = [v3 attributedString];

  return (NSAttributedString *)v4;
}

- (NSString)string
{
  v2 = [(REMCRMergeableStringDocument *)self attributedString];
  v3 = [v2 string];

  return (NSString *)v3;
}

- (id)mutableDocument
{
  v3 = [REMMutableCRMergeableStringDocument alloc];
  id v4 = [(REMCRMergeableStringDocument *)self replicaIDSource];
  v5 = [(REMCRMergeableStringDocument *)self document];
  uint64_t v6 = [(REMMutableCRMergeableStringDocument *)v3 initWithReplicaIDSource:v4 immutableDocumentToEdit:v5];

  return v6;
}

- (id)serializedData
{
  v2 = [(REMCRMergeableStringDocument *)self document];
  v3 = [v2 serialize];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMCRMergeableStringDocument *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(REMCRMergeableStringDocument *)self document];
      uint64_t v6 = [(REMCRMergeableStringDocument *)v4 document];
      char v7 = objc_msgSend(v5, "rem_isEqual:", v6);
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)mergedWithDocument:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(REMCRMergeableStringDocument *)self replicaIDSource];
  id v8 = [v7 crdtID];
  id v9 = [v6 replicaIDSource];
  v10 = [v9 crdtID];
  char v11 = [v8 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    v22 = +[REMLog crdt];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[REMCRMergeableStringDocument mergedWithDocument:error:](v22);
    }
  }
  objc_super v12 = [(REMCRMergeableStringDocument *)self document];
  v13 = +[REMReplicaIDHelper nonEditingReplicaUUID];
  objc_super v14 = objc_msgSend(v12, "rem_copyWithReplicaIDForNewEdits:", v13);

  v15 = [v6 document];
  uint64_t v16 = [v14 mergeWithStringVersionedDocument:v15];

  if (v16 == 1)
  {
    a4 = self;
  }
  else if (v16)
  {
    v19 = [REMCRMergeableStringDocument alloc];
    v20 = [(REMCRMergeableStringDocument *)self replicaIDSource];
    a4 = [(REMCRMergeableStringDocument *)v19 initWithReplicaIDSource:v20 document:v14];
  }
  else if (a4)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v23 = *MEMORY[0x1E4F28588];
    v24[0] = @"Failed to merge documents.";
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a4 = (id)[v17 initWithDomain:@"REMCRMergeableStringDocument" code:-1 userInfo:v18];

    a4 = 0;
  }

  return a4;
}

- (REMReplicaIDSource)replicaIDSource
{
  return self->_replicaIDSource;
}

- (void)setReplicaIDSource:(id)a3
{
}

- (TTMergeableStringVersionedDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);

  objc_storeStrong((id *)&self->_replicaIDSource, 0);
}

+ (id)documentFromSerializedData:(id)a3 replicaIDSource:(id)a4 forKey:(id)a5 ofObjectID:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if (a3)
  {
    id v11 = a4;
    id v12 = a3;
    id v17 = 0;
    a3 = [[REMCRMergeableStringDocument alloc] initWithReplicaIDSource:v11 serializedData:v12 error:&v17];

    id v13 = v17;
    if (!a3)
    {
      objc_super v14 = +[REMLog crdt];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [v13 localizedDescription];
        *(_DWORD *)buf = 138412802;
        id v19 = v10;
        __int16 v20 = 2112;
        id v21 = v9;
        __int16 v22 = 2112;
        uint64_t v23 = v16;
        _os_log_error_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_ERROR, "Failed to deserialize mergeable string document {objectID: %@, key: %@}: %@", buf, 0x20u);
      }
    }
  }

  return a3;
}

- (void)mergedWithDocument:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (![self.replicaIDSource.crdtID isEqualToString:anotherDocument.replicaIDSource.crdtID]) -- Documents with different CRDT IDs cannot be merged.", v1, 2u);
}

@end