@interface TTVersionedDocument
+ (unsigned)minimumSupportedVersion;
+ (unsigned)serializationVersion;
+ (unsigned)versionedDocumentSerializationVersion;
- (TTVersionedDocument)initWithArchive:(const void *)a3;
- (TTVersionedDocument)initWithData:(id)a3;
- (id)serialize;
- (id)serializeCurrentVersion:(unsigned int *)a3;
- (unint64_t)futureVersionCount;
- (unint64_t)mergeWithVersionedDocument:(id)a3;
- (unsigned)maxDocumentVersion;
- (void)dealloc;
- (void)documentArchive;
- (void)loadArchive:(const void *)a3;
- (void)loadData:(id)a3;
- (void)loadDocumentArchive:(void *)a3;
- (void)saveCurrentVersion:(void *)a3;
- (void)saveToArchive:(void *)a3;
- (void)serialize;
- (void)setDocumentArchive:(void *)a3;
@end

@implementation TTVersionedDocument

+ (unsigned)serializationVersion
{
  return 0;
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

+ (unsigned)versionedDocumentSerializationVersion
{
  return 0;
}

- (TTVersionedDocument)initWithData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TTVersionedDocument;
  v5 = [(TTVersionedDocument *)&v8 init];
  v6 = v5;
  if (v5) {
    [(TTVersionedDocument *)v5 loadData:v4];
  }

  return v6;
}

- (TTVersionedDocument)initWithArchive:(const void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TTVersionedDocument;
  id v4 = [(TTVersionedDocument *)&v7 init];
  v5 = v4;
  if (v4) {
    [(TTVersionedDocument *)v4 loadArchive:a3];
  }
  return v5;
}

- (void)loadData:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  operator new();
}

- (void)loadArchive:(const void *)a3
{
}

- (void)loadDocumentArchive:(void *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(id)objc_opt_class() serializationVersion];
  unsigned int v6 = *((_DWORD *)a3 + 12);
  if (!v6)
  {
    int v10 = -1;
    goto LABEL_32;
  }
  unsigned int v7 = v5;
  int v8 = 0;
  int v9 = -1;
  int v10 = -1;
  do
  {
    v11 = (const versioned_document::Version *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((uint64_t)a3 + 40, v8);
    versioned_document::Version::Version((versioned_document::Version *)v37, v11);
    if (v10 < 0 && v38 <= v7) {
      int v10 = v8;
    }
    if (v38 < v7)
    {
      if (v9 < 0) {
        int v9 = v8;
      }
      versioned_document::Version::~Version((versioned_document::Version *)v37);
      if ((v9 & 0x80000000) == 0) {
        goto LABEL_18;
      }
LABEL_32:
      v20 = +[REMLog crdt];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[TTVersionedDocument loadDocumentArchive:](v20, v21, v22, v23, v24, v25, v26, v27);
      }

      goto LABEL_35;
    }
    if (v39 <= v7) {
      int v9 = v8;
    }
    versioned_document::Version::~Version((versioned_document::Version *)v37);
    ++v8;
  }
  while (v6 != v8);
  if (v9 < 0) {
    goto LABEL_32;
  }
LABEL_18:
  if (v9 >= v6)
  {
LABEL_35:
    if (v10 < 0) {
      return;
    }
    goto LABEL_36;
  }
  *(void *)&long long v13 = 67109632;
  long long v36 = v13;
  while (1)
  {
    v14 = (const versioned_document::Version *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((uint64_t)a3 + 40, v9);
    versioned_document::Version::Version((versioned_document::Version *)v37, v14);
    v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v36);
    if (v38 < v7)
    {
      v16 = +[REMLog crdt];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        unsigned int v41 = v38;
        __int16 v42 = 1024;
        unsigned int v43 = v7;
        v17 = v16;
        v18 = "Loading old version %d < %d";
        uint32_t v19 = 14;
LABEL_29:
        _os_log_debug_impl(&dword_1B9AA2000, v17, OS_LOG_TYPE_DEBUG, v18, buf, v19);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
    if (v38 != v7) {
      break;
    }
    v16 = +[REMLog crdt];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v41 = v7;
      v17 = v16;
      v18 = "Loading current version %d";
      uint32_t v19 = 8;
      goto LABEL_29;
    }
LABEL_30:

    [(TTVersionedDocument *)self mergeVersion:v38 fromData:v15];
    versioned_document::Version::~Version((versioned_document::Version *)v37);
    if (v6 == ++v9) {
      goto LABEL_35;
    }
  }
  if (v39 <= v7)
  {
    v16 = +[REMLog crdt];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v36;
      unsigned int v41 = v38;
      __int16 v42 = 1024;
      unsigned int v43 = v7;
      __int16 v44 = 1024;
      unsigned int v45 = v39;
      v17 = v16;
      v18 = "Loading future version %d > %d where min-supported %d";
      uint32_t v19 = 20;
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  v28 = +[REMLog crdt];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[TTVersionedDocument loadDocumentArchive:](v28, v29, v30, v31, v32, v33, v34, v35);
  }

  versioned_document::Version::~Version((versioned_document::Version *)v37);
  if ((v10 & 0x80000000) == 0) {
LABEL_36:
  }
    google::protobuf::RepeatedPtrField<versioned_document::Version>::DeleteSubrange((google::protobuf::internal::RepeatedPtrFieldBase *)((char *)a3 + 40), v10, *((_DWORD *)a3 + 12) - v10);
}

- (void)dealloc
{
  documentArchive = self->_documentArchive;
  if (documentArchive) {
    (*(void (**)(void *, SEL))(*(void *)documentArchive + 8))(documentArchive, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)TTVersionedDocument;
  [(TTVersionedDocument *)&v4 dealloc];
}

- (unint64_t)futureVersionCount
{
  return *((int *)self->_documentArchive + 12);
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  return 0;
}

- (void)saveCurrentVersion:(void *)a3
{
  int v5 = [(id)objc_opt_class() minimumSupportedVersion];
  int v9 = 0;
  unsigned int v6 = [(TTVersionedDocument *)self serializeCurrentVersion:&v9];
  int v7 = v9;
  *((_DWORD *)a3 + 8) |= 3u;
  *((_DWORD *)a3 + 10) = v7;
  *((_DWORD *)a3 + 11) = v5;
  id v8 = v6;
  [v8 bytes];
  [v8 length];
  *((_DWORD *)a3 + 8) |= 4u;
  if (!google::protobuf::internal::empty_string_) {
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  }
  if (*((void *)a3 + 6) == google::protobuf::internal::empty_string_) {
    operator new();
  }
  MEMORY[0x1BA9DB490]();
}

- (unint64_t)mergeWithVersionedDocument:(id)a3
{
  id v4 = a3;
  int v5 = [(TTVersionedDocument *)self documentArchive];
  uint64_t v6 = [v4 documentArchive];
  if ((char *)v6 != v5)
  {
    int v7 = (google::protobuf::internal::RepeatedPtrFieldBase *)(v5 + 40);
    google::protobuf::internal::RepeatedPtrFieldBase::Clear<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((uint64_t)v7);
    google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>(v7, (google::protobuf::internal::RepeatedPtrFieldBase *)(v6 + 40));
  }

  return 1;
}

- (unsigned)maxDocumentVersion
{
  if (*(int *)([(TTVersionedDocument *)self documentArchive] + 48) < 1)
  {
    uint64_t v6 = objc_opt_class();
    return [v6 serializationVersion];
  }
  else
  {
    id v3 = [(TTVersionedDocument *)self documentArchive];
    if (v3[12] <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ReminderKit/CRProtobuf/protobuf-lite/google/protobuf/repeated_field.h", 886);
      id v4 = google::protobuf::internal::LogMessage::operator<<(v8, "CHECK failed: (index) < (size()): ");
      google::protobuf::internal::LogFinisher::operator=((uint64_t)&v7, (google::protobuf::internal::LogMessage *)v4);
      google::protobuf::internal::LogMessage::~LogMessage((void **)&v8[0].__r_.__value_.__l.__data_);
    }
    return *(_DWORD *)(**((void **)v3 + 5) + 40);
  }
}

- (id)serialize
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = +[REMLog crdt];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = [(id)objc_opt_class() serializationVersion];
    [(uint64_t)[(TTVersionedDocument *)self documentArchive] serialize];
  }

  int v5 = [(TTVersionedDocument *)self documentArchive];
  unsigned int v6 = +[TTVersionedDocument versionedDocumentSerializationVersion];
  v5[8] |= 1u;
  v5[16] = v6;
  char v7 = [(TTVersionedDocument *)self documentArchive];
  int v8 = v7[13];
  uint64_t v9 = v7[12];
  if ((int)v9 >= v8)
  {
    if (v8 == v7[14]) {
      google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)(v7 + 10), v8 + 1);
    }
    google::protobuf::internal::GenericTypeHandler<versioned_document::Version>::New();
  }
  uint64_t v10 = *((void *)v7 + 5);
  v7[12] = v9 + 1;
  [(TTVersionedDocument *)self saveCurrentVersion:*(void *)(v10 + 8 * v9)];
  id v11 = objc_alloc(MEMORY[0x1E4F1CA58]);
  v12 = [(TTVersionedDocument *)self documentArchive];
  long long v13 = (void *)[v11 initWithLength:(*(int (**)(void *))(*(void *)v12 + 72))(v12)];
  v14 = [(TTVersionedDocument *)self documentArchive];
  id v15 = v13;
  google::protobuf::MessageLite::SerializeToArray(v14, (void *)[v15 mutableBytes], objc_msgSend(v15, "length"));
  v16 = [(TTVersionedDocument *)self documentArchive];
  v17 = v16;
  int v18 = v16[12];
  if (v18 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ReminderKit/CRProtobuf/protobuf-lite/google/protobuf/repeated_field.h", 913);
    uint32_t v19 = google::protobuf::internal::LogMessage::operator<<(v25, "CHECK failed: (current_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((uint64_t)&v24, (google::protobuf::internal::LogMessage *)v19);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v25[0].__r_.__value_.__l.__data_);
    int v18 = v17[12];
  }
  uint64_t v20 = *((void *)v17 + 5);
  int v21 = v18 - 1;
  v17[12] = v21;
  (*(void (**)(void))(**(void **)(v20 + 8 * v21) + 32))(*(void *)(v20 + 8 * v21));
  uint64_t v22 = objc_msgSend(v15, "TT_gzipDeflate");

  return v22;
}

- (void)saveToArchive:(void *)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  int v5 = +[REMLog crdt];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(id)objc_opt_class() serializationVersion];
    [(uint64_t)[(TTVersionedDocument *)self documentArchive] serialize];
  }

  unsigned int v7 = +[TTVersionedDocument versionedDocumentSerializationVersion];
  *((_DWORD *)a3 + 8) |= 1u;
  *((_DWORD *)a3 + 16) = v7;
  int v8 = [(TTVersionedDocument *)self documentArchive];
  if (v8 != a3)
  {
    google::protobuf::internal::RepeatedPtrFieldBase::Clear<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((uint64_t)a3 + 40);
    google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((google::protobuf::internal::RepeatedPtrFieldBase *)((char *)a3 + 40), (google::protobuf::internal::RepeatedPtrFieldBase *)(v8 + 40));
  }
  int v9 = *((_DWORD *)a3 + 13);
  uint64_t v10 = *((int *)a3 + 12);
  if ((int)v10 >= v9)
  {
    if (v9 == *((_DWORD *)a3 + 14)) {
      google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 40, v9 + 1);
    }
    google::protobuf::internal::GenericTypeHandler<versioned_document::Version>::New();
  }
  uint64_t v11 = *((void *)a3 + 5);
  *((_DWORD *)a3 + 12) = v10 + 1;
  [(TTVersionedDocument *)self saveCurrentVersion:*(void *)(v11 + 8 * v10)];
}

- (void)documentArchive
{
  return self->_documentArchive;
}

- (void)setDocumentArchive:(void *)a3
{
  self->_documentArchive = a3;
}

- (void)loadData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)loadData:(int)a3 .cold.2(uint8_t *buf, int a2, int a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a3;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "TTVersionedDocument is wrong versionedDocumentSerializationVersion %d != %d.", buf, 0xEu);
}

- (void)loadDocumentArchive:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)loadDocumentArchive:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)serialize
{
  OUTLINED_FUNCTION_0_8(1.5047e-36, a1, a2, a3);
  _os_log_debug_impl(&dword_1B9AA2000, v4, OS_LOG_TYPE_DEBUG, "Saving versioned document %d with %d future versions.", v3, 0xEu);
}

@end