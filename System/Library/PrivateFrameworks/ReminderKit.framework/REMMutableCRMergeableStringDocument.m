@interface REMMutableCRMergeableStringDocument
- (REMMutableCRMergeableStringDocument)initWithReplicaIDSource:(id)a3;
- (REMMutableCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 immutableDocumentToEdit:(id)a4;
- (REMReplicaIDHelper)replicaIDHelper;
- (REMReplicaIDSource)replicaIDSource;
- (REMReplicaManagerProviding)replicaManagerProvider;
- (TTMergeableAttributedString)mergeableString;
- (TTMergeableStringVersionedDocument)document;
- (id)hashtagAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)immutableDocument;
- (id)wipeAndReplaceWithString:(id)a3;
- (void)_test_insertString:(id)a3 atIndex:(unint64_t)a4;
- (void)addHashtag:(id)a3 range:(_NSRange)a4;
- (void)enumerateHashtagInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)removeHashtagInRange:(_NSRange)a3;
- (void)replicaIDHelperDidAcquireReplicaUUID:(id)a3;
- (void)setDocument:(id)a3;
- (void)setReplicaIDHelper:(id)a3;
- (void)setReplicaIDSource:(id)a3;
- (void)setReplicaManagerProvider:(id)a3;
@end

@implementation REMMutableCRMergeableStringDocument

- (id)hashtagAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  v6 = [(REMMutableCRMergeableStringDocument *)self mergeableString];
  v7 = [v6 attributedString];
  v8 = objc_msgSend(v7, "rem_hashtagAtIndex:effectiveRange:", a3, a4);

  return v8;
}

- (void)enumerateHashtagInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a5;
  id v11 = [(REMMutableCRMergeableStringDocument *)self mergeableString];
  v10 = [v11 attributedString];
  objc_msgSend(v10, "rem_enumerateHashtagInRange:options:usingBlock:", location, length, a4, v9);
}

- (void)addHashtag:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v10 = +[REMLog crdt];
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR)) {
      [(REMMutableCRMergeableStringDocument(Hashtags) *)self addHashtag:length range:&v10->super];
    }
    goto LABEL_12;
  }
  v8 = [(REMMutableCRMergeableStringDocument *)self mergeableString];
  unint64_t v9 = [v8 length];

  if (location >= v9) {
    NSUInteger location = v9;
  }
  if (location + length > v9) {
    NSUInteger length = v9 - location;
  }
  if (length)
  {
    v10 = objc_alloc_init(TTREMHashtag);
    id v11 = [v7 objectIdentifier];
    [(TTREMHashtag *)v10 setObjectIdentifier:v11];

    v12 = [(REMMutableCRMergeableStringDocument *)self mergeableString];
    v25 = @"_TTREMHashtag";
    v26[0] = v10;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    objc_msgSend(v12, "setAttributes:range:", v13, location, length);

    v14 = +[REMLog crdt];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [(REMMutableCRMergeableStringDocument *)self replicaIDSource];
      v27.NSUInteger location = location;
      v27.NSUInteger length = length;
      v16 = NSStringFromRange(v27);
      int v17 = 134218754;
      v18 = self;
      __int16 v19 = 2112;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = v10;
      __int16 v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_INFO, "Added TTREMHashtag to this REMMutableCRMergeableStringDocument {self: %p, replicaID: %@, value: %@, range: %@}", (uint8_t *)&v17, 0x2Au);
    }
LABEL_12:
  }
}

- (void)removeHashtagInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6 = [(REMMutableCRMergeableStringDocument *)self mergeableString];
  unint64_t v7 = [v6 length];
  if (location >= v7) {
    NSUInteger location = v7;
  }
  if (location + length > v7) {
    NSUInteger length = v7 - location;
  }
  if (length)
  {
    v8 = [v6 attributedString];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__REMMutableCRMergeableStringDocument_Hashtags__removeHashtagInRange___block_invoke;
    v9[3] = &unk_1E61DCC78;
    id v10 = v6;
    id v11 = self;
    objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v9);
  }
}

void __70__REMMutableCRMergeableStringDocument_Hashtags__removeHashtagInRange___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v8 = [v7 objectForKeyedSubscript:@"_TTREMHashtag"];

  if (v8)
  {
    unint64_t v9 = [v7 objectForKeyedSubscript:@"_TTREMHashtag"];
    id v10 = (void *)[v7 mutableCopy];
    [v10 removeObjectForKey:@"_TTREMHashtag"];
    id v11 = *(void **)(a1 + 32);
    v12 = (void *)[v10 copy];
    objc_msgSend(v11, "setAttributes:range:", v12, a3, a4);

    v13 = +[REMLog crdt];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(void **)(a1 + 40);
      v15 = [v14 replicaIDSource];
      v26.NSUInteger location = a3;
      v26.NSUInteger length = a4;
      v16 = NSStringFromRange(v26);
      int v17 = 134218754;
      v18 = v14;
      __int16 v19 = 2112;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = v9;
      __int16 v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1B9AA2000, v13, OS_LOG_TYPE_INFO, "Removed TTREMHashtag from this REMMutableCRMergeableStringDocument {self: %p, replicaID: %@, value: %@, range: %@}", (uint8_t *)&v17, 0x2Au);
    }
  }
}

- (REMMutableCRMergeableStringDocument)initWithReplicaIDSource:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)REMMutableCRMergeableStringDocument;
  v6 = [(REMMutableCRMergeableStringDocument *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_replicaIDSource, a3);
    v8 = +[REMReplicaIDHelper replicaUUIDForCreation];
    unint64_t v9 = [(TTMergeableString *)[TTMergeableAttributedString alloc] initWithReplicaID:v8];
    id v10 = [[TTMergeableStringVersionedDocument alloc] initWithMergeableString:v9];
    document = v7->_document;
    v7->_document = v10;
    v12 = v10;

    replicaIDHelper = v7->_replicaIDHelper;
    v7->_replicaIDHelper = 0;
  }
  return v7;
}

- (REMMutableCRMergeableStringDocument)initWithReplicaIDSource:(id)a3 immutableDocumentToEdit:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMMutableCRMergeableStringDocument;
  unint64_t v9 = [(REMMutableCRMergeableStringDocument *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_replicaIDSource, a3);
    objc_storeStrong((id *)&v10->_document, a4);
    id v11 = [[REMReplicaIDHelper alloc] initWithReplicaIDSource:v7 owner:v10 replicaClockProvider:v8];
    replicaIDHelper = v10->_replicaIDHelper;
    v10->_replicaIDHelper = v11;
  }
  return v10;
}

- (TTMergeableAttributedString)mergeableString
{
  v3 = [(REMMutableCRMergeableStringDocument *)self replicaIDHelper];
  [v3 willEdit];

  v4 = [(REMMutableCRMergeableStringDocument *)self document];
  id v5 = [v4 mergeableString];

  return (TTMergeableAttributedString *)v5;
}

- (id)immutableDocument
{
  v3 = [(REMMutableCRMergeableStringDocument *)self document];
  v4 = +[REMReplicaIDHelper nonEditingReplicaUUID];
  id v5 = objc_msgSend(v3, "rem_copyWithReplicaIDForNewEdits:", v4);

  v6 = [(REMMutableCRMergeableStringDocument *)self replicaIDHelper];
  [v6 didCopy];

  id v7 = [REMCRMergeableStringDocument alloc];
  id v8 = [(REMMutableCRMergeableStringDocument *)self replicaIDSource];
  unint64_t v9 = [(REMCRMergeableStringDocument *)v7 initWithReplicaIDSource:v8 document:v5];

  return v9;
}

- (void)setReplicaManagerProvider:(id)a3
{
}

- (id)wipeAndReplaceWithString:(id)a3
{
  id v4 = a3;
  id v5 = [(REMMutableCRMergeableStringDocument *)self mergeableString];
  objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(v5, "length"));
  [v5 insertAttributedString:v4 atIndex:0];

  v6 = [v5 attributedString];
  id v7 = [v6 string];
  uint64_t v8 = [v7 length];

  unint64_t v9 = [v5 attributedString];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__REMMutableCRMergeableStringDocument_wipeAndReplaceWithString___block_invoke;
  v13[3] = &unk_1E61DDD88;
  id v14 = v5;
  id v10 = v5;
  objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, v13);

  id v11 = [(REMMutableCRMergeableStringDocument *)self immutableDocument];

  return v11;
}

uint64_t __64__REMMutableCRMergeableStringDocument_wipeAndReplaceWithString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", a2, a3, a4);
}

- (void)_test_insertString:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(REMMutableCRMergeableStringDocument *)self mergeableString];
  [v7 insertString:v6 atIndex:a4];
}

- (void)replicaIDHelperDidAcquireReplicaUUID:(id)a3
{
  id v8 = [a3 replicaUUID];
  id v4 = [(REMMutableCRMergeableStringDocument *)self document];
  id v5 = objc_msgSend(v4, "rem_copyWithReplicaIDForNewEdits:", v8);
  [(REMMutableCRMergeableStringDocument *)self setDocument:v5];

  id v6 = [(REMMutableCRMergeableStringDocument *)self document];
  id v7 = [(REMMutableCRMergeableStringDocument *)self replicaIDHelper];
  [v7 setReplicaClockProvider:v6];
}

- (REMReplicaManagerProviding)replicaManagerProvider
{
  return self->_replicaManagerProvider;
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

- (REMReplicaIDHelper)replicaIDHelper
{
  return self->_replicaIDHelper;
}

- (void)setReplicaIDHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicaIDHelper, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_replicaIDSource, 0);

  objc_storeStrong((id *)&self->_replicaManagerProvider, 0);
}

@end