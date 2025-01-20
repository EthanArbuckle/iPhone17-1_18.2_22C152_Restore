@interface ICImportNoteGeneralFileParser
- (BOOL)canHandleFileURL:(id)a3;
- (BOOL)isParsing;
- (ICImportNoteGeneralFileParser)init;
- (ICNotesImporterClient)notesImporterClient;
- (NSArray)allowedContentTypes;
- (id)attributedStringContentFromFileURL:(id)a3 error:(id *)a4;
- (id)getTypeIdentifierForFileURL:(id)a3;
- (void)addTitleInContent:(id)a3 titleString:(id)a4;
- (void)parseFileURL:(id)a3 newNoteBlock:(id)a4 updatedNoteBlock:(id)a5 errorBlock:(id)a6 completionBlock:(id)a7;
- (void)setIsParsing:(BOOL)a3;
- (void)setNotesImporterClient:(id)a3;
- (void)totalNotesFoundAtFileURL:(id)a3 completionBlock:(id)a4;
@end

@implementation ICImportNoteGeneralFileParser

- (ICImportNoteGeneralFileParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICImportNoteGeneralFileParser;
  v2 = [(ICImportNoteGeneralFileParser *)&v6 init];
  if (v2)
  {
    v3 = (ICNotesImporterClient *)objc_alloc_init((Class)ICNotesImporterClient);
    notesImporterClient = v2->_notesImporterClient;
    v2->_notesImporterClient = v3;
  }
  return v2;
}

- (NSArray)allowedContentTypes
{
  v2 = +[ICUTType typeWithIdentifier:@"com.apple.stickies.appexport", UTTypeText, UTTypeHTML, UTTypeRTF, UTTypeRTFD];
  v5[4] = v2;
  v3 = +[NSArray arrayWithObjects:v5 count:5];

  return (NSArray *)v3;
}

- (BOOL)canHandleFileURL:(id)a3
{
  id v4 = a3;
  v5 = [(ICImportNoteGeneralFileParser *)self getTypeIdentifierForFileURL:v4];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  objc_super v6 = [(ICImportNoteGeneralFileParser *)self allowedContentTypes];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002F228;
  v9[3] = &unk_1000EED28;
  v11 = &v12;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  LOBYTE(v6) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v6;
}

- (void)totalNotesFoundAtFileURL:(id)a3 completionBlock:(id)a4
{
  if (a4) {
    (*((void (**)(id, BOOL))a4 + 2))(a4, a3 != 0);
  }
}

- (void)parseFileURL:(id)a3 newNoteBlock:(id)a4 updatedNoteBlock:(id)a5 errorBlock:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  v43 = (void (**)(void))a4;
  v44 = (void (**)(id, id))a5;
  v13 = (void (**)(id, id))a6;
  uint64_t v14 = (void (**)(void))a7;
  [(ICImportNoteGeneralFileParser *)self setIsParsing:1];
  id v69 = 0;
  char v15 = [(ICImportNoteGeneralFileParser *)self attributedStringContentFromFileURL:v12 error:&v69];
  id v16 = v69;
  if (v16)
  {
    id v17 = v16;
    v18 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000B6BB4(v17);
    }

    if (v13) {
      v13[2](v13, v17);
    }
    goto LABEL_14;
  }
  if (!v15)
  {
LABEL_13:
    id v17 = 0;
LABEL_14:
    id v28 = 0;
    goto LABEL_15;
  }
  v19 = +[ICCloudConfiguration sharedConfiguration];
  v20 = [v19 maximumAttachmentSizeMB];
  id v21 = [v20 unsignedLongLongValue];

  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  id v22 = [v15 length];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10002F9C8;
  v56[3] = &unk_1000EED50;
  id v23 = v12;
  id v57 = v23;
  v58 = &v65;
  v59 = &v61;
  uint64_t v60 = (void)v21 << 20;
  [v15 enumerateAttribute:NSAttachmentAttributeName inRange:0 options:v22 usingBlock:v56];
  if (*((unsigned char *)v66 + 24))
  {
    v24 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v36 = +[NSByteCountFormatter stringFromByteCount:v62[3] countStyle:0];
      v37 = +[NSByteCountFormatter stringFromByteCount:(void)v21 << 20 countStyle:0];
      *(_DWORD *)buf = 138412802;
      id v73 = v36;
      __int16 v74 = 2112;
      v75 = v37;
      __int16 v76 = 2112;
      id v77 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Attachment size (%@) is greater then our max (%@) for %@", buf, 0x20u);
    }
    v71[0] = @"Note has an attachment that is too large";
    v70[0] = ICErrorFailureReasonKey;
    v70[1] = ICErrorAttachmentCountKey;
    v25 = +[NSNumber numberWithUnsignedInteger:v62[3]];
    v71[1] = v25;
    v26 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
    id v27 = +[NSError errorWithDomain:ICErrorDomain code:202 userInfo:v26];

    if (v13) {
      v13[2](v13, 0);
    }

    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(&v65, 8);
    goto LABEL_13;
  }

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  if (v43)
  {
    v29 = v43[2]();
  }
  else
  {
    v29 = 0;
  }
  v30 = [v29 managedObjectContext];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10002FC34;
  v53[3] = &unk_1000EE0E8;
  id v41 = v29;
  id v54 = v41;
  id v55 = v15;
  [v30 performBlockAndWait:v53];

  id v52 = 0;
  id v51 = 0;
  [v23 getResourceValue:&v52 forKey:NSURLCreationDateKey error:&v51];
  id v40 = v52;
  id v31 = v51;
  if (v31)
  {
    v32 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000B6B3C((uint64_t)v23, v32);
    }
  }
  id v50 = 0;
  id v49 = 0;
  [v23 getResourceValue:&v50 forKey:NSURLContentModificationDateKey error:&v49];
  id v38 = v50;
  id v17 = v49;

  if (v17)
  {
    v33 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_1000B6AC4((uint64_t)v23, v33);
    }
  }
  v34 = [v41 managedObjectContext];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10002FD38;
  v45[3] = &unk_1000EE008;
  id v28 = v41;
  id v46 = v28;
  id v47 = v40;
  id v48 = v39;
  id v42 = v39;
  id v35 = v40;
  [v34 performBlockAndWait:v45];

  if (v44 && v28) {
    v44[2](v44, v28);
  }
LABEL_15:
  [(ICImportNoteGeneralFileParser *)self setIsParsing:0];
  if (v14) {
    v14[2](v14);
  }
}

- (id)attributedStringContentFromFileURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ICImportNoteGeneralFileParser *)self getTypeIdentifierForFileURL:v6];
  if (!v7)
  {
    id v15 = 0;
    goto LABEL_15;
  }
  v8 = +[UTType typeWithIdentifier:v7];
  unsigned int v9 = [v8 conformsToType:UTTypeHTML];

  if (v9)
  {
    id v10 = +[NSString stringWithContentsOfURL:v6 encoding:4 error:a4];
    v11 = v10;
    if (!a4 || !*a4)
    {
      v20 = [v6 URLByDeletingLastPathComponent];
      id v21 = +[ICNote attributedStringFromHTMLString:v11 baseURL:v20 readerDelegate:0];
      id v22 = [v21 mutableCopy];

      uint64_t v30 = 0;
      id v31 = &v30;
      uint64_t v32 = 0x3032000000;
      v33 = sub_1000301A4;
      v34 = sub_1000301B4;
      id v35 = 0;
      dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
      v24 = [(ICImportNoteGeneralFileParser *)self notesImporterClient];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000301BC;
      v27[3] = &unk_1000EEDB8;
      v29 = &v30;
      v25 = v23;
      id v28 = v25;
      [v24 parseTitleFromHTMLString:v11 completionBlock:v27];

      dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
      [(ICImportNoteGeneralFileParser *)self addTitleInContent:v22 titleString:v31[5]];
      id v15 = [v22 copy];

      _Block_object_dispose(&v30, 8);
      goto LABEL_14;
    }
  }
  v11 = NSPlainTextDocumentType;
  id v12 = +[UTType typeWithIdentifier:v7];
  unsigned __int8 v13 = [v12 conformsToType:UTTypeRTF];

  if (v13)
  {
    uint64_t v14 = (id *)&NSRTFTextDocumentType;
LABEL_11:
    v18 = (NSString *)*v14;

    v11 = v18;
    goto LABEL_12;
  }
  id v16 = +[UTType typeWithIdentifier:v7];
  unsigned int v17 = [v16 conformsToType:UTTypeRTFD];

  if (v17)
  {
    uint64_t v14 = (id *)&NSRTFDTextDocumentType;
    goto LABEL_11;
  }
LABEL_12:
  id v19 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringDocumentAttributeKey v36 = NSDocumentTypeDocumentAttribute;
  v37 = v11;
  v20 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  id v15 = [v19 initWithURL:v6 options:v20 documentAttributes:0 error:a4];
LABEL_14:

LABEL_15:

  return v15;
}

- (void)addTitleInContent:(id)a3 titleString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v8 = [v6 stringByTrimmingCharactersInSet:v7];

  if ([v8 length])
  {
    id v9 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
    [v5 insertAttributedString:v9 atIndex:0];

    id v10 = +[ICTTParagraphStyle paragraphStyleNamed:0];
    id v11 = objc_alloc((Class)NSAttributedString);
    id v12 = +[NSString stringWithFormat:@"%@\n", v8];
    uint64_t v15 = ICTTAttributeNameParagraphStyle;
    id v16 = v10;
    unsigned __int8 v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v14 = [v11 initWithString:v12 attributes:v13];

    [v5 insertAttributedString:v14 atIndex:0];
  }
}

- (id)getTypeIdentifierForFileURL:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  id v9 = 0;
  unsigned __int8 v4 = [v3 getResourceValue:&v10 forKey:NSURLTypeIdentifierKey error:&v9];
  id v5 = v10;
  id v6 = v9;
  if ((v4 & 1) == 0)
  {
    id v7 = os_log_create("com.apple.notes", "Import");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000B6C4C(v6);
    }
  }

  return v5;
}

- (BOOL)isParsing
{
  return self->_isParsing;
}

- (void)setIsParsing:(BOOL)a3
{
  self->_isParsing = a3;
}

- (ICNotesImporterClient)notesImporterClient
{
  return self->_notesImporterClient;
}

- (void)setNotesImporterClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end