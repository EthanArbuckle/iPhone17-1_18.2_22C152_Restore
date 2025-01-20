@interface REMReminderAttachmentContextChangeItem
- (NSArray)attachments;
- (NSArray)fileAttachments;
- (NSArray)imageAttachments;
- (NSArray)urlAttachments;
- (NSMutableArray)mutableAttachments;
- (REMReminderAttachmentContextChangeItem)initWithReminderChangeItem:(id)a3;
- (REMReminderChangeItem)reminderChangeItem;
- (id)addFileAttachmentWithData:(id)a3 uti:(id)a4;
- (id)addFileAttachmentWithURL:(id)a3 error:(id *)a4;
- (id)addImageAttachmentWithData:(id)a3 uti:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (id)addImageAttachmentWithURL:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 error:(id *)a6;
- (id)addURLAttachmentWithURL:(id)a3;
- (id)attachmentsOfClass:(Class)a3;
- (id)newObjectIDForFileAttachment;
- (id)newObjectIDForImageAttachment;
- (id)newObjectIDForURLAttachment;
- (id)setURLAttachmentWithURL:(id)a3;
- (void)addAttachment:(id)a3;
- (void)insertAttachment:(id)a3 afterAttachment:(id)a4;
- (void)insertAttachment:(id)a3 beforeAttachment:(id)a4;
- (void)removeAllAttachments;
- (void)removeAllAttachmentsWithClass:(Class)a3;
- (void)removeAttachment:(id)a3;
- (void)removeURLAttachments;
- (void)setMutableAttachments:(id)a3;
- (void)setReminderChangeItem:(id)a3;
@end

@implementation REMReminderAttachmentContextChangeItem

- (REMReminderAttachmentContextChangeItem)initWithReminderChangeItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderAttachmentContextChangeItem;
  v6 = [(REMReminderAttachmentContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reminderChangeItem, a3);
  }

  return v7;
}

- (NSArray)attachments
{
  v2 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  v3 = [v2 attachments];

  return (NSArray *)v3;
}

- (id)attachmentsOfClass:(Class)a3
{
  v4 = [(REMReminderAttachmentContextChangeItem *)self attachments];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__REMReminderAttachmentContextChangeItem_attachmentsOfClass___block_invoke;
  v8[3] = &__block_descriptor_40_e26_B24__0__REMAttachment_8_16lu32l8;
  v8[4] = a3;
  id v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:v8];
  v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

uint64_t __61__REMReminderAttachmentContextChangeItem_attachmentsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (NSArray)fileAttachments
{
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[(REMReminderAttachmentContextChangeItem *)self attachmentsOfClass:v3];
}

- (NSArray)imageAttachments
{
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[(REMReminderAttachmentContextChangeItem *)self attachmentsOfClass:v3];
}

- (NSArray)urlAttachments
{
  uint64_t v3 = objc_opt_class();

  return (NSArray *)[(REMReminderAttachmentContextChangeItem *)self attachmentsOfClass:v3];
}

- (id)addFileAttachmentWithURL:(id)a3 error:(id *)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F1C728];
  uint64_t v8 = *MEMORY[0x1E4F1C5F8];
  v21[0] = *MEMORY[0x1E4F1C728];
  v21[1] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v10 = [v6 resourceValuesForKeys:v9 error:a4];

  if (v10)
  {
    v20 = [v10 objectForKeyedSubscript:v7];
    v19 = [v10 objectForKeyedSubscript:v8];
    id v11 = [(REMReminderAttachmentContextChangeItem *)self newObjectIDForFileAttachment];
    v12 = [REMFileAttachment alloc];
    v13 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
    v14 = [v13 accountID];
    v15 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
    v16 = [v15 objectID];
    v17 = -[REMFileAttachment initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:](v12, "initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:", v11, v14, v16, v20, [v19 unsignedLongLongValue], v6, 0);

    [(REMReminderAttachmentContextChangeItem *)self insertAttachment:v17 afterAttachment:0];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)addFileAttachmentWithData:(id)a3 uti:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[REMLogStore write];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_super v9 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
    *(_DWORD *)buf = 138412802;
    v19 = v9;
    __int16 v20 = 2048;
    uint64_t v21 = [v6 length];
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Adding data attachment {reminderChangeItem: %@, data.length: %ld, uti: %@}", buf, 0x20u);
  }
  id v10 = [(REMReminderAttachmentContextChangeItem *)self newObjectIDForFileAttachment];
  id v11 = [REMFileAttachment alloc];
  v12 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  v13 = [v12 accountID];
  v14 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  v15 = [v14 objectID];
  v16 = -[REMFileAttachment initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:](v11, "initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:", v10, v13, v15, v7, [v6 length], 0, v6);

  [(REMReminderAttachmentContextChangeItem *)self insertAttachment:v16 afterAttachment:0];

  return v16;
}

- (id)addImageAttachmentWithURL:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 error:(id *)a6
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = *MEMORY[0x1E4F1C728];
  uint64_t v12 = *MEMORY[0x1E4F1C5F8];
  v29[0] = *MEMORY[0x1E4F1C728];
  v29[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v14 = [v10 resourceValuesForKeys:v13 error:a6];

  if (v14)
  {
    [v14 objectForKeyedSubscript:v11];
    v28 = unint64_t v26 = a4;
    v15 = [v14 objectForKeyedSubscript:v12];
    id v16 = [(REMReminderAttachmentContextChangeItem *)self newObjectIDForImageAttachment];
    id v17 = v10;
    v18 = [REMImageAttachment alloc];
    v27 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
    v19 = [v27 accountID];
    __int16 v20 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
    uint64_t v21 = [v20 objectID];
    uint64_t v22 = [v15 unsignedLongLongValue];
    id v23 = v18;
    id v10 = v17;
    uint64_t v24 = [(REMImageAttachment *)v23 initWithObjectID:v16 accountID:v19 reminderID:v21 UTI:v28 fileSize:v22 fileURL:v17 data:0 width:v26 height:a5];

    [(REMReminderAttachmentContextChangeItem *)self insertAttachment:v24 afterAttachment:0];
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (id)addImageAttachmentWithData:(id)a3 uti:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v21 = a4;
  uint64_t v11 = +[REMLogStore write];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
    *(_DWORD *)buf = 138413058;
    id v23 = v12;
    __int16 v24 = 2048;
    uint64_t v25 = [v10 length];
    __int16 v26 = 2048;
    unint64_t v27 = a5;
    __int16 v28 = 2048;
    unint64_t v29 = a6;
    _os_log_impl(&dword_1B9AA2000, v11, OS_LOG_TYPE_INFO, "Adding image attachment {reminderChangeItem: %@, data.length: %ld, width: %ld, height: %ld}", buf, 0x2Au);
  }
  id v13 = [(REMReminderAttachmentContextChangeItem *)self newObjectIDForImageAttachment];
  v14 = [REMImageAttachment alloc];
  v15 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  id v16 = [v15 accountID];
  id v17 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  v18 = [v17 objectID];
  v19 = -[REMImageAttachment initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:width:height:](v14, "initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:width:height:", v13, v16, v18, v21, [v10 length], 0, v10, a5, a6);

  [(REMReminderAttachmentContextChangeItem *)self insertAttachment:v19 afterAttachment:0];

  return v19;
}

- (id)setURLAttachmentWithURL:(id)a3
{
  id v4 = a3;
  [(REMReminderAttachmentContextChangeItem *)self removeURLAttachments];
  id v5 = [(REMReminderAttachmentContextChangeItem *)self addURLAttachmentWithURL:v4];

  return v5;
}

- (id)addURLAttachmentWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(REMReminderAttachmentContextChangeItem *)self newObjectIDForURLAttachment];
  id v6 = [REMURLAttachment alloc];
  id v7 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  uint64_t v8 = [v7 accountID];
  objc_super v9 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  id v10 = [v9 objectID];
  uint64_t v11 = [(REMURLAttachment *)v6 initWithObjectID:v5 accountID:v8 reminderID:v10 url:v4 metadata:0];

  [(REMReminderAttachmentContextChangeItem *)self insertAttachment:v11 afterAttachment:0];

  return v11;
}

- (void)removeURLAttachments
{
  uint64_t v3 = objc_opt_class();

  [(REMReminderAttachmentContextChangeItem *)self removeAllAttachmentsWithClass:v3];
}

- (void)addAttachment:(id)a3
{
}

- (void)insertAttachment:(id)a3 beforeAttachment:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[REMLogStore write];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_super v9 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
    int v15 = 138412802;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Adding attachment before attachment {reminderChangeItem: %@, attachment: %@, siblisngAttachment: %@}", (uint8_t *)&v15, 0x20u);
  }
  id v10 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  uint64_t v11 = [v10 attachments];
  id v12 = (id)[v11 mutableCopy];

  if (v12)
  {
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!v7)
    {
LABEL_8:
      uint64_t v13 = 0;
      goto LABEL_9;
    }
  }
  uint64_t v13 = [v12 indexOfObject:v7];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_8;
  }
LABEL_9:
  [v12 insertObject:v6 atIndex:v13];
  v14 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  [v14 setAttachments:v12];
}

- (void)insertAttachment:(id)a3 afterAttachment:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[REMLogStore write];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_super v9 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
    int v15 = 138412802;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Adding attachment after attachment {reminderChangeItem: %@, attachment: %@, siblisngAttachment: %@}", (uint8_t *)&v15, 0x20u);
  }
  id v10 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  uint64_t v11 = [v10 attachments];
  id v12 = (id)[v11 mutableCopy];

  if (v12)
  {
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!v7) {
      goto LABEL_8;
    }
  }
  uint64_t v13 = [v12 indexOfObject:v7];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v12 insertObject:v6 atIndex:v13 + 1];
    goto LABEL_10;
  }
LABEL_8:
  [v12 addObject:v6];
LABEL_10:
  v14 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  [v14 setAttachments:v12];
}

- (void)removeAttachment:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Removing attachment {reminderChangeItem: %@, attachment: %@}", buf, 0x16u);
  }
  id v7 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  uint64_t v8 = [v7 attachments];
  objc_super v9 = (void *)[v8 mutableCopy];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__REMReminderAttachmentContextChangeItem_removeAttachment___block_invoke;
  v13[3] = &unk_1E61DC120;
  id v10 = v4;
  id v14 = v10;
  uint64_t v11 = [v9 indexOfObjectPassingTest:v13];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v9 removeObjectAtIndex:v11];
    id v12 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
    [v12 setAttachments:v9];
  }
}

uint64_t __59__REMReminderAttachmentContextChangeItem_removeAttachment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectID];
  id v4 = [*(id *)(a1 + 32) objectID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)removeAllAttachments
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[REMLogStore write];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1B9AA2000, v3, OS_LOG_TYPE_INFO, "Removing all attachments {reminderChangeItem: %@}", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v5 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  [v5 setAttachments:MEMORY[0x1E4F1CBF0]];
}

- (void)removeAllAttachmentsWithClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    Class v16 = a3;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Removing all attachments {reminderChangeItem: %@} for class %@", buf, 0x16u);
  }
  id v7 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  uint64_t v8 = [v7 attachments];
  id v9 = (id)[v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__REMReminderAttachmentContextChangeItem_removeAllAttachmentsWithClass___block_invoke;
  v12[3] = &__block_descriptor_40_e40_B24__0__REMAttachment_8__NSDictionary_16lu32l8;
  v12[4] = a3;
  id v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:v12];
  [v9 filterUsingPredicate:v10];

  uint64_t v11 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  [v11 setAttachments:v9];
}

BOOL __72__REMReminderAttachmentContextChangeItem_removeAllAttachmentsWithClass___block_invoke()
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (id)newObjectIDForURLAttachment
{
  v2 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  uint64_t v3 = [v2 objectID];
  id v4 = [v3 entityName];
  uint64_t v5 = +[REMTemplate cdEntityNameForSavedReminder];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    return +[REMTemplate newObjectIDForSavedAttachment];
  }
  else
  {
    return +[REMAttachment newObjectID];
  }
}

- (id)newObjectIDForFileAttachment
{
  v2 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  uint64_t v3 = [v2 objectID];
  id v4 = [v3 entityName];
  uint64_t v5 = +[REMTemplate cdEntityNameForSavedReminder];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    return +[REMTemplate newObjectIDForSavedAttachment];
  }
  else
  {
    return +[REMAttachment newObjectID];
  }
}

- (id)newObjectIDForImageAttachment
{
  v2 = [(REMReminderAttachmentContextChangeItem *)self reminderChangeItem];
  uint64_t v3 = [v2 objectID];
  id v4 = [v3 entityName];
  uint64_t v5 = +[REMTemplate cdEntityNameForSavedReminder];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    return +[REMTemplate newObjectIDForSavedAttachment];
  }
  else
  {
    return +[REMAttachment newObjectID];
  }
}

- (REMReminderChangeItem)reminderChangeItem
{
  return self->_reminderChangeItem;
}

- (void)setReminderChangeItem:(id)a3
{
}

- (NSMutableArray)mutableAttachments
{
  return self->_mutableAttachments;
}

- (void)setMutableAttachments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAttachments, 0);

  objc_storeStrong((id *)&self->_reminderChangeItem, 0);
}

@end