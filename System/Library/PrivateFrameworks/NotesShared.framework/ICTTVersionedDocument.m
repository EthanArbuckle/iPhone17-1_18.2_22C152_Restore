@interface ICTTVersionedDocument
+ (unsigned)minimumSupportedVersion;
+ (unsigned)serializationVersion;
+ (unsigned)versionedDocumentSerializationVersion;
- (ICTTVersionedDocument)initWithArchive:(const void *)a3 replicaID:(id)a4;
- (ICTTVersionedDocument)initWithData:(id)a3 replicaID:(id)a4;
- (NSUUID)replicaID;
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

@implementation ICTTVersionedDocument

- (NSUUID)replicaID
{
  return self->_replicaID;
}

- (ICTTVersionedDocument)initWithData:(id)a3 replicaID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICTTVersionedDocument;
  v8 = [(ICTTVersionedDocument *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_replicaID, a4);
    [(ICTTVersionedDocument *)v9 loadData:v6];
  }

  return v9;
}

- (void)loadData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__ICTTVersionedDocument_loadData___block_invoke;
  v6[3] = &unk_1E64A68C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_1C3A61000, "Loading versioned document", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __34__ICTTVersionedDocument_loadData___block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  operator new();
}

- (void)loadDocumentArchive:(void *)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(id)objc_opt_class() serializationVersion];
  unsigned int v6 = *((_DWORD *)a3 + 12);
  v43 = a3;
  if (!v6)
  {
    int v11 = -1;
    goto LABEL_34;
  }
  unsigned int v7 = v5;
  int v8 = 0;
  v9 = (char *)a3 + 40;
  int v10 = -1;
  int v11 = -1;
  do
  {
    v12 = (const versioned_document::Version *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((uint64_t)v9, v8);
    versioned_document::Version::Version((versioned_document::Version *)v44, v12);
    if (v11 < 0 && v45 <= v7) {
      int v11 = v8;
    }
    if (v45 < v7)
    {
      if (v10 < 0) {
        int v10 = v8;
      }
      versioned_document::Version::~Version((versioned_document::Version *)v44);
      if ((v10 & 0x80000000) == 0) {
        goto LABEL_18;
      }
LABEL_34:
      v26 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[ICTTVersionedDocument loadDocumentArchive:](v26, v27, v28, v29, v30, v31, v32, v33);
      }

      goto LABEL_37;
    }
    if (v46 <= v7) {
      int v10 = v8;
    }
    versioned_document::Version::~Version((versioned_document::Version *)v44);
    ++v8;
  }
  while (v6 != v8);
  if (v10 < 0) {
    goto LABEL_34;
  }
LABEL_18:
  if (v10 >= v6)
  {
LABEL_37:
    if (v11 < 0) {
      return;
    }
    goto LABEL_38;
  }
  unint64_t v15 = 0x1E4F1C000uLL;
  *(void *)&long long v14 = 67109632;
  long long v41 = v14;
  v42 = v9;
  while (1)
  {
    v16 = (const versioned_document::Version *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((uint64_t)v9, v10);
    versioned_document::Version::Version((versioned_document::Version *)v44, v16);
    v17 = objc_msgSend(*(id *)(v15 + 2488), "dataWithBytesNoCopy:length:freeWhenDone:", v41);
    if (v45 < v7)
    {
      v18 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        unsigned int v48 = v45;
        __int16 v49 = 1024;
        unsigned int v50 = v7;
        v19 = v18;
        v20 = "Loading old version %d < %d";
        uint32_t v21 = 14;
LABEL_27:
        _os_log_debug_impl(&dword_1C3A61000, v19, OS_LOG_TYPE_DEBUG, v20, buf, v21);
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    if (v45 != v7) {
      break;
    }
    v18 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v48 = v7;
      v19 = v18;
      v20 = "Loading current version %d";
      uint32_t v21 = 8;
      goto LABEL_27;
    }
LABEL_32:

    [(ICTTVersionedDocument *)self mergeVersion:v45 fromData:v17];
    versioned_document::Version::~Version((versioned_document::Version *)v44);
    if (v6 == ++v10) {
      goto LABEL_37;
    }
  }
  v22 = self;
  unint64_t v23 = v15;
  unsigned int v24 = v46;
  v25 = os_log_create("com.apple.notes", "Topotext");
  v18 = v25;
  if (v24 <= v7)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v41;
      unsigned int v48 = v45;
      __int16 v49 = 1024;
      unsigned int v50 = v7;
      __int16 v51 = 1024;
      unsigned int v52 = v46;
      _os_log_debug_impl(&dword_1C3A61000, v18, OS_LOG_TYPE_DEBUG, "Loading future version %d > %d where min-supported %d", buf, 0x14u);
    }
    unint64_t v15 = v23;
    self = v22;
    v9 = v42;
    goto LABEL_32;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    -[ICTTVersionedDocument loadDocumentArchive:](v18, v34, v35, v36, v37, v38, v39, v40);
  }

  versioned_document::Version::~Version((versioned_document::Version *)v44);
  if ((v11 & 0x80000000) == 0) {
LABEL_38:
  }
    google::protobuf::RepeatedPtrField<versioned_document::Version>::DeleteSubrange((google::protobuf::internal::RepeatedPtrFieldBase *)(v43 + 10), v11, v43[12] - v11);
}

+ (unsigned)versionedDocumentSerializationVersion
{
  return 0;
}

+ (unsigned)serializationVersion
{
  return 0;
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

- (ICTTVersionedDocument)initWithArchive:(const void *)a3 replicaID:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICTTVersionedDocument;
  int v8 = [(ICTTVersionedDocument *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_replicaID, a4);
    [(ICTTVersionedDocument *)v9 loadArchive:a3];
  }

  return v9;
}

- (void)loadArchive:(const void *)a3
{
}

- (void)dealloc
{
  documentArchive = self->_documentArchive;
  if (documentArchive) {
    (*(void (**)(void *, SEL))(*(void *)documentArchive + 8))(documentArchive, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)ICTTVersionedDocument;
  [(ICTTVersionedDocument *)&v4 dealloc];
}

- (unint64_t)futureVersionCount
{
  return *((int *)self->_documentArchive + 12);
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

- (void)saveCurrentVersion:(void *)a3
{
  int v5 = [(id)objc_opt_class() minimumSupportedVersion];
  int v9 = 0;
  unsigned int v6 = [(ICTTVersionedDocument *)self serializeCurrentVersion:&v9];
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
  MEMORY[0x1C877D5C0]();
}

- (unint64_t)mergeWithVersionedDocument:(id)a3
{
  id v4 = a3;
  int v5 = [(ICTTVersionedDocument *)self documentArchive];
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
  if (*(int *)([(ICTTVersionedDocument *)self documentArchive] + 48) < 1)
  {
    uint64_t v6 = objc_opt_class();
    return [v6 serializationVersion];
  }
  else
  {
    v3 = [(ICTTVersionedDocument *)self documentArchive];
    if (v3[12] <= 0)
    {
      google::protobuf::internal::LogMessage::LogMessage((uint64_t)v8, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Source/Shared/protobuf-lite/google/protobuf/repeated_field.h", 886);
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
  v3 = os_log_create("com.apple.notes", "Topotext");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = [(id)objc_opt_class() serializationVersion];
    [(uint64_t)[(ICTTVersionedDocument *)self documentArchive] serialize];
  }

  int v5 = [(ICTTVersionedDocument *)self documentArchive];
  unsigned int v6 = +[ICTTVersionedDocument versionedDocumentSerializationVersion];
  v5[8] |= 1u;
  v5[16] = v6;
  char v7 = [(ICTTVersionedDocument *)self documentArchive];
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
  [(ICTTVersionedDocument *)self saveCurrentVersion:*(void *)(v10 + 8 * v9)];
  id v11 = objc_alloc(MEMORY[0x1E4F1CA58]);
  v12 = [(ICTTVersionedDocument *)self documentArchive];
  v13 = (void *)[v11 initWithLength:(*(int (**)(void *))(*(void *)v12 + 72))(v12)];
  long long v14 = [(ICTTVersionedDocument *)self documentArchive];
  id v15 = v13;
  google::protobuf::MessageLite::SerializeToArray(v14, (void *)[v15 mutableBytes], objc_msgSend(v15, "length"));
  v16 = [(ICTTVersionedDocument *)self documentArchive];
  v17 = v16;
  int v18 = v16[12];
  if (v18 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v25, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Source/Shared/protobuf-lite/google/protobuf/repeated_field.h", 913);
    v19 = google::protobuf::internal::LogMessage::operator<<(v25, "CHECK failed: (current_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((uint64_t)&v24, (google::protobuf::internal::LogMessage *)v19);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v25[0].__r_.__value_.__l.__data_);
    int v18 = v17[12];
  }
  uint64_t v20 = *((void *)v17 + 5);
  int v21 = v18 - 1;
  v17[12] = v21;
  (*(void (**)(void))(**(void **)(v20 + 8 * v21) + 32))(*(void *)(v20 + 8 * v21));
  v22 = objc_msgSend(v15, "ic_gzipDeflate");

  return v22;
}

- (void)saveToArchive:(void *)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  int v5 = os_log_create("com.apple.notes", "Topotext");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(id)objc_opt_class() serializationVersion];
    [(uint64_t)[(ICTTVersionedDocument *)self documentArchive] serialize];
  }

  unsigned int v7 = +[ICTTVersionedDocument versionedDocumentSerializationVersion];
  *((_DWORD *)a3 + 8) |= 1u;
  *((_DWORD *)a3 + 16) = v7;
  int v8 = [(ICTTVersionedDocument *)self documentArchive];
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
  [(ICTTVersionedDocument *)self saveCurrentVersion:*(void *)(v11 + 8 * v10)];
}

- (void)documentArchive
{
  return self->_documentArchive;
}

- (void)setDocumentArchive:(void *)a3
{
  self->_documentArchive = a3;
}

- (void).cxx_destruct
{
}

void __34__ICTTVersionedDocument_loadData___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __34__ICTTVersionedDocument_loadData___block_invoke_cold_2(uint8_t *buf, int a2, int a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a3;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "ICTTVersionedDocument is wrong versionedDocumentSerializationVersion %d != %d.", buf, 0xEu);
}

- (void)loadDocumentArchive:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)loadDocumentArchive:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)serialize
{
  OUTLINED_FUNCTION_0_10(1.5047e-36, a1, a2, a3);
  _os_log_debug_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEBUG, "Saving versioned document %d with %d future versions.", v3, 0xEu);
}

@end