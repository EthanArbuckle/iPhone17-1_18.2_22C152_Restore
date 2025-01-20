@interface ICNotePasteboardData
+ (BOOL)supportsSecureCoding;
+ (id)pasteboardDataFromPersistenceData:(id)a3;
- (ICDataPersister)dataPersister;
- (ICNotePasteboardData)init;
- (ICNotePasteboardData)initWithAttributedStringData:(id)a3 dataPersister:(id)a4;
- (ICNotePasteboardData)initWithCoder:(id)a3;
- (NSData)attributedStringData;
- (id)persistenceData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICNotePasteboardData

- (ICNotePasteboardData)init
{
  return 0;
}

- (ICNotePasteboardData)initWithAttributedStringData:(id)a3 dataPersister:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICNotePasteboardData;
  v9 = [(ICNotePasteboardData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attributedStringData, a3);
    objc_storeStrong((id *)&v10->_dataPersister, a4);
  }

  return v10;
}

- (id)persistenceData
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

+ (id)pasteboardDataFromPersistenceData:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  id v17 = 0;
  v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:&v17];

  id v6 = v17;
  if (v6)
  {
    id v7 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICAttachment(ICAttachmentPersistenceAdditions) loadFromArchive:dataPersister:withIdentifierMap:]((uint64_t)v6, v7);
    }
  }
  objc_opt_class();
  id v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  v9 = ICCheckedDynamicCast();

  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = [v9 dataPersister];
  if (!v10
    || (v11 = (void *)v10,
        [v9 dataPersister],
        objc_super v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 verifyDataFiles],
        v12,
        v11,
        v13))
  {
    id v14 = v9;
  }
  else
  {
LABEL_9:
    v15 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[ICNotePasteboardData pasteboardDataFromPersistenceData:](v15);
    }

    id v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICNotePasteboardData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICNotePasteboardData;
  v5 = [(ICNotePasteboardData *)&v13 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributedStringData"];
    uint64_t v7 = ICCheckedDynamicCast();
    attributedStringData = v5->_attributedStringData;
    v5->_attributedStringData = (NSData *)v7;

    objc_opt_class();
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataPersister"];
    uint64_t v10 = ICCheckedDynamicCast();
    dataPersister = v5->_dataPersister;
    v5->_dataPersister = (ICDataPersister *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(ICNotePasteboardData *)self attributedStringData];
  [v7 encodeObject:v4 forKey:@"attributedStringData"];

  v5 = [(ICNotePasteboardData *)self dataPersister];

  if (v5)
  {
    id v6 = [(ICNotePasteboardData *)self dataPersister];
    [v7 encodeObject:v6 forKey:@"dataPersister"];
  }
}

- (NSData)attributedStringData
{
  return self->_attributedStringData;
}

- (ICDataPersister)dataPersister
{
  return self->_dataPersister;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataPersister, 0);
  objc_storeStrong((id *)&self->_attributedStringData, 0);
}

+ (void)pasteboardDataFromPersistenceData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Missing data files for pasteboard data", v1, 2u);
}

@end