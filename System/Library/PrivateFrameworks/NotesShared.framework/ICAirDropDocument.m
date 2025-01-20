@interface ICAirDropDocument
+ (BOOL)canAirDropImportIntoAccount:(id)a3 context:(id)a4;
+ (id)documentAtURL:(id)a3;
+ (id)legacyNoteAirDropDocumentWithData:(id)a3;
- (BOOL)hasDocumentForLegacyNote;
- (BOOL)hasDocumentForNote;
- (ICAirDropDocument)initWithData:(id)a3;
- (id).cxx_construct;
- (id)activityItem;
- (id)dataFromLegacyNoteDocument;
- (void)document;
@end

@implementation ICAirDropDocument

+ (id)documentAtURL:(id)a3
{
  id v4 = a3;
  if (([v4 isFileURL] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"url.fileURL", "+[ICAirDropDocument documentAtURL:]", 1, 0, @"Airdrop document is not a file url %@", v4 functionName simulateCrash showAlert format];
  }
  if ([v4 isFileURL])
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    v6 = [v4 path];
    v7 = [v5 contentsAtPath:v6];

    if (v7)
    {
      v8 = (void *)[objc_alloc((Class)a1) initWithData:v7];
    }
    else
    {
      v9 = (void *)MEMORY[0x1E4F836F8];
      v10 = [v4 path];
      [v9 handleFailedAssertWithCondition:"data", "+[ICAirDropDocument documentAtURL:]", 1, 0, @"Failed to get data from path %@", v10 functionName simulateCrash showAlert format];

      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (ICAirDropDocument)initWithData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAirDropDocument;
  v5 = [(ICAirDropDocument *)&v8 init];
  v6 = v5;
  if (v5
    && !ICProtobufUtilitiesParseArchiveFromNSData<airdrop_document::Document>((google::protobuf::MessageLite *)&v5->_document, v4))
  {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAirDropDocument initWithData:]", 1, 0, @"Failed to parse archive from data with length %lu", objc_msgSend(v4, "length"));

    v6 = 0;
  }

  return v6;
}

- (BOOL)hasDocumentForNote
{
  return self->_document._unknown_fields_.__r_.var0 & 1;
}

- (BOOL)hasDocumentForLegacyNote
{
  return (LOBYTE(self->_document._unknown_fields_.__r_.var0) >> 1) & 1;
}

- (void)document
{
  return &self->_document;
}

- (id)activityItem
{
  return ICProtobufUtilitiesNSDataFromArchive<airdrop_document::Document>((google::protobuf::MessageLite *)&self->_document);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

+ (BOOL)canAirDropImportIntoAccount:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5) {
    BOOL v7 = !+[ICLegacyAccountUtilities didChooseToMigrateAccount:v5 context:v6];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (id)legacyNoteAirDropDocumentWithData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(ICAirDropDocument);
  uint64_t v5 = [(ICAirDropDocument *)v4 document];
  *(_DWORD *)(v5 + 32) |= 2u;
  uint64_t v6 = *(void *)(v5 + 48);
  if (!v6) {
    operator new();
  }
  *(_DWORD *)(v6 + 32) |= 1u;
  uint64_t v7 = *(void *)(v6 + 40);
  if (!v7) {
    operator new();
  }
  *(_DWORD *)(v7 + 32) |= 1u;
  uint64_t v8 = *(void *)(v7 + 40);
  if (!v8) {
    operator new();
  }
  id v9 = v3;
  [v9 bytes];
  [v9 length];
  *(_DWORD *)(v8 + 32) |= 1u;
  if (!google::protobuf::internal::empty_string_) {
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  }
  if (*(void *)(v8 + 40) == google::protobuf::internal::empty_string_) {
    operator new();
  }
  MEMORY[0x1C877D5C0]();

  return v4;
}

- (id)dataFromLegacyNoteDocument
{
  v2 = [(ICAirDropDocument *)self document];
  id v3 = v2;
  if ((v2[32] & 2) == 0)
  {
    v2 = (unsigned char *)[MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"document.has_legacynotedocument()" functionName:"-[ICAirDropDocument(Legacy) dataFromLegacyNoteDocument]" simulateCrash:1 showAlert:0 format:@"AirDrop document does not have legacy note document"];
    if ((v3[32] & 2) == 0) {
      goto LABEL_11;
    }
  }
  uint64_t v4 = *((void *)v3 + 6);
  if (!v4)
  {
    v2 = (unsigned char *)airdrop_document::Document::default_instance((airdrop_document::Document *)v2);
    uint64_t v4 = *((void *)v2 + 6);
  }
  if ((*(unsigned char *)(v4 + 32) & 1) == 0)
  {
    v2 = (unsigned char *)[MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"legacyNoteDocument.has_version1_0()" functionName:"-[ICAirDropDocument(Legacy) dataFromLegacyNoteDocument]" simulateCrash:1 showAlert:0 format:@"Failed to find any legacy note document version"];
    if ((*(unsigned char *)(v4 + 32) & 1) == 0) {
      goto LABEL_11;
    }
  }
  uint64_t v5 = *(void *)(v4 + 40);
  if (!v5)
  {
    v2 = (unsigned char *)airdrop_document::LegacyNoteDocument::default_instance((airdrop_document::LegacyNoteDocument *)v2);
    uint64_t v5 = *((void *)v2 + 5);
  }
  if ((*(unsigned char *)(v5 + 32) & 1) != 0
    || (v2 = (unsigned char *)[MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"version1_0.has_webarchive()" functionName:"-[ICAirDropDocument(Legacy) dataFromLegacyNoteDocument]" simulateCrash:1 showAlert:0 format:@"No archive found from legacy version 1.0 data"], (*(unsigned char *)(v5 + 32) & 1) != 0))
  {
    uint64_t v7 = *(void *)(v5 + 40);
    if (!v7) {
      uint64_t v7 = *(void *)(airdrop_document::LegacyNoteDocument1_0::default_instance((airdrop_document::LegacyNoteDocument1_0 *)v2)
    }
                     + 40);
    uint64_t v8 = *(uint64_t **)(v7 + 40);
    if (*((char *)v8 + 23) < 0)
    {
      uint64_t v8 = (uint64_t *)*v8;
      uint64_t v9 = *(void *)(*(void *)(v7 + 40) + 8);
    }
    else
    {
      uint64_t v9 = *((unsigned __int8 *)v8 + 23);
    }
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v8 length:v9 freeWhenDone:0];
  }
  else
  {
LABEL_11:
    uint64_t v6 = 0;
  }
  return v6;
}

@end