@interface ICAddAttachmentsManager
+ (id)sharedManager;
- (id)saveAttachmentsToNewNote:(id)a3 inFolder:(id)a4 isSystemPaper:(BOOL)a5 textBefore:(id)a6 textAfter:(id)a7;
- (unsigned)styleForTitleLength:(int64_t)a3;
- (void)saveAttachments:(id)a3 toNote:(id)a4 textBefore:(id)a5 textAfter:(id)a6;
- (void)saveAttachments:(id)a3 toNote:(id)a4 textBefore:(id)a5 textAfter:(id)a6 fetchFirst:(BOOL)a7;
@end

@implementation ICAddAttachmentsManager

+ (id)sharedManager
{
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, &__block_literal_global_57);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

uint64_t __40__ICAddAttachmentsManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(ICAddAttachmentsManager);
  sharedManager_sharedManager = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

- (id)saveAttachmentsToNewNote:(id)a3 inFolder:(id)a4 isSystemPaper:(BOOL)a5 textBefore:(id)a6 textAfter:(id)a7
{
  BOOL v9 = a5;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!v13)
  {
    v16 = (void *)MEMORY[0x1E4F83380];
    [MEMORY[0x1E4F83428] sharedContext];
    v18 = id v17 = v15;
    v19 = [v18 managedObjectContext];
    id v13 = [v16 defaultFolderInContext:v19];

    id v15 = v17;
  }
  v20 = (void *)[MEMORY[0x1E4F83418] newEmptyNoteInFolder:v13];
  v21 = v20;
  if (v9) {
    [v20 markAsSystemPaperIfNeeded:1];
  }
  [v21 updateChangeCountWithReason:@"Saved attachment to new note"];
  id v74 = v13;
  if ([v14 length] || objc_msgSend(v15, "length"))
  {
    v22 = v21;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v24 = [v14 string];
    uint64_t v25 = -[ICAddAttachmentsManager styleForTitleLength:](self, "styleForTitleLength:", [v24 length]);

    v26 = [MEMORY[0x1E4F834E8] paragraphStyleNamed:v25];
    [v23 setObject:v26 forKey:*MEMORY[0x1E4F83220]];

    v27 = (void *)MEMORY[0x1E4F83798];
    v28 = [v14 string];
    uint64_t v29 = [v27 rangeForTitleInContent:v28 truncated:0];
    uint64_t v31 = v30;

    if (v29 != 0x7FFFFFFFFFFFFFFFLL && v29 + v31 <= (unint64_t)[v14 length])
    {
      v32 = (void *)[v14 mutableCopy];
      objc_msgSend(v32, "addAttributes:range:", v23, v29, v31);
      uint64_t v33 = [v32 copy];

      id v14 = (id)v33;
    }
    v34 = v74;

    v35 = v22;
    goto LABEL_11;
  }
  id v69 = v12;
  v70 = v21;
  v68 = self;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v12;
  uint64_t v37 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (!v37)
  {
    uint64_t v72 = 0;
    uint64_t v73 = 0;
LABEL_31:

    v56 = 0;
    v34 = v74;
    v35 = v70;
    goto LABEL_34;
  }
  uint64_t v38 = v37;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  uint64_t v39 = *(void *)v76;
  uint64_t v40 = *MEMORY[0x1E4F44400];
  id v67 = v15;
LABEL_16:
  uint64_t v41 = 0;
  while (1)
  {
    if (*(void *)v76 != v39) {
      objc_enumerationMutation(obj);
    }
    v42 = *(void **)(*((void *)&v75 + 1) + 8 * v41);
    v43 = objc_msgSend(v42, "attachment", v67);
    v44 = [v43 title];
    uint64_t v45 = [v44 length];

    if (v45)
    {
      v56 = [v42 attachment];
      v42 = v56;
      goto LABEL_33;
    }
    uint64_t v46 = [v42 mediaUTI];
    if (!v46) {
      break;
    }
    v47 = (void *)v46;
    v48 = (void *)MEMORY[0x1E4F442D8];
    v49 = [v42 mediaUTI];
    v50 = [v48 typeWithIdentifier:v49];
    int v51 = [v50 conformsToType:v40];

    if (!v51) {
      break;
    }
    ++v72;
LABEL_26:
    if (v38 == ++v41)
    {
      uint64_t v38 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
      id v15 = v67;
      if (v38) {
        goto LABEL_16;
      }
      goto LABEL_31;
    }
  }
  v52 = (void *)MEMORY[0x1E4F832A0];
  v53 = [v42 mediaUTI];
  LODWORD(v52) = [v52 typeUTIIsPlayableMovie:v53];

  if (v52)
  {
    ++v73;
    goto LABEL_26;
  }
  v54 = [v42 title];
  uint64_t v55 = [v54 length];

  if (!v55) {
    goto LABEL_26;
  }
  v56 = [v42 attachment];
LABEL_33:
  v57 = [v42 title];

  id v15 = v67;
  v34 = v74;
  v35 = v70;
  if (v57) {
    goto LABEL_51;
  }
LABEL_34:
  if (v72)
  {
    if (v73)
    {
      v58 = (void *)MEMORY[0x1E4F83770];
      if (v72 == 1)
      {
        if (v73 == 1) {
          v59 = @"Saved Photo and Saved Video";
        }
        else {
          v59 = @"Saved Photo and Saved Videos";
        }
      }
      else if (v73 == 1)
      {
        v59 = @"Saved Photos and Saved Video";
      }
      else
      {
        v59 = @"Saved Photos and Saved Videos";
      }
    }
    else
    {
      v58 = (void *)MEMORY[0x1E4F83770];
      if (v72 == 1) {
        v59 = @"Saved Photo";
      }
      else {
        v59 = @"Saved Photos";
      }
    }
LABEL_50:
    v57 = [v58 localizedFrameworkStringForKey:v59 value:v59 table:0 allowSiri:1];
    if (v57)
    {
LABEL_51:
      id v60 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v61 = objc_msgSend(MEMORY[0x1E4F834E8], "paragraphStyleNamed:", +[ICTextStyle noteDefaultNamedStyle](ICTextStyle, "noteDefaultNamedStyle"));
      [v60 setObject:v61 forKey:*MEMORY[0x1E4F83220]];

      if (v56)
      {
        v62 = (void *)MEMORY[0x1E4F1CB10];
        v63 = [v56 urlString];
        v64 = [v62 URLWithString:v63];

        if (objc_msgSend(v64, "ic_isMapURL")) {
          [v60 setObject:v64 forKey:*MEMORY[0x1E4FB0720]];
        }
      }
      v35 = v70;
      v65 = [v70 textStorage];
      v66 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v57 attributes:v60];
      [v65 appendAttributedString:v66];

      v34 = v74;
    }
  }
  else if (v73)
  {
    v58 = (void *)MEMORY[0x1E4F83770];
    if (v73 == 1) {
      v59 = @"Saved Video";
    }
    else {
      v59 = @"Saved Videos";
    }
    goto LABEL_50;
  }

  self = v68;
  id v12 = v69;
LABEL_11:
  [(ICAddAttachmentsManager *)self saveAttachments:v12 toNote:v35 textBefore:v14 textAfter:v15 fetchFirst:0];

  return v35;
}

- (unsigned)styleForTitleLength:(int64_t)a3
{
  unsigned int result = +[ICTextStyle noteDefaultNamedStyle];
  if (result < 3 && a3 > 64) {
    return 3;
  }
  return result;
}

- (void)saveAttachments:(id)a3 toNote:(id)a4 textBefore:(id)a5 textAfter:(id)a6
{
}

- (void)saveAttachments:(id)a3 toNote:(id)a4 textBefore:(id)a5 textAfter:(id)a6 fetchFirst:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v122 = a5;
  id v121 = a6;
  if (v7)
  {
    id v13 = (void *)MEMORY[0x1E4F83418];
    id v14 = [v12 identifier];
    id v15 = [MEMORY[0x1E4F83428] sharedContext];
    v16 = [v15 managedObjectContext];
    id v17 = (id)[v13 refreshAllOfNoteWithIdentifier:v14 context:v16];
  }
  v18 = objc_alloc_init(ICTextController);
  [(ICTextController *)v18 setNote:v12 stylingTextUsingSeparateTextStorageForRendering:0 withLayoutManager:0];
  v19 = [v12 textStorage];
  v120 = v18;
  [v19 setStyler:v18];

  v20 = [MEMORY[0x1E4F1C9C8] now];
  [v12 setModificationDate:v20];

  if ([v122 length])
  {
    v21 = [v12 textStorage];
    v22 = [v21 string];
    id v23 = [v12 textStorage];
    objc_msgSend(v22, "paragraphRangeForRange:", objc_msgSend(v23, "length"), 0);
    uint64_t v25 = v24;

    if (v25)
    {
      v26 = [v12 textStorage];
      v27 = [v12 textStorage];
      objc_msgSend(v26, "replaceCharactersInRange:withString:", objc_msgSend(v27, "length"), 0, @"\n");

      v28 = [v12 textStorage];
      uint64_t v29 = [v12 modificationDate];
      uint64_t v30 = [v12 textStorage];
      objc_msgSend(v28, "setTimestamp:range:", v29, objc_msgSend(v30, "length") - 1, 1);
    }
    uint64_t v31 = [v12 textStorage];
    v32 = [v12 textStorage];
    objc_msgSend(v31, "replaceCharactersInRange:withAttributedString:", objc_msgSend(v32, "length"), 0, v122);

    uint64_t v33 = [v12 textStorage];
    v34 = [v12 textStorage];
    objc_msgSend(v33, "replaceCharactersInRange:withString:", objc_msgSend(v34, "length"), 0, @"\n");

    v35 = [v12 textStorage];
    v36 = [v12 modificationDate];
    uint64_t v37 = [v12 textStorage];
    objc_msgSend(v35, "setTimestamp:range:", v36, objc_msgSend(v37, "length") + ~objc_msgSend(v122, "length"), objc_msgSend(v122, "length") + 1);
  }
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id obj = v11;
  uint64_t v128 = [obj countByEnumeratingWithState:&v134 objects:v140 count:16];
  char v38 = 0;
  if (v128)
  {
    uint64_t v127 = *(void *)v135;
    uint64_t v125 = *MEMORY[0x1E4F44450];
    uint64_t v124 = *MEMORY[0x1E4F83080];
    v123 = (void *)*MEMORY[0x1E4F44410];
    uint64_t v129 = *MEMORY[0x1E4FB06B8];
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v135 != v127) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = *(void **)(*((void *)&v134 + 1) + 8 * v39);
        uint64_t v41 = [v12 account];
        v42 = [v40 attachmentIfExistsForAccount:v41];

        if (v42)
        {
LABEL_13:
          [v42 setNote:v12];
          [v12 addAttachmentsObject:v42];
          v43 = [v40 image];

          if (v43)
          {
            v44 = [v40 attachment];
            uint64_t v45 = [v40 image];
            id v46 = (id)[v44 updateAttachmentPreviewImageWithImage:v45 scale:1 scaleWhenDrawing:0 metadata:1 sendNotification:0.0];
          }
          goto LABEL_32;
        }
        if (ICInternalSettingsDefaultToPaperKitPDFsAndScans())
        {
          uint64_t v47 = [v40 mediaUTI];
          if (v47)
          {
            v48 = (void *)v47;
            v49 = (void *)MEMORY[0x1E4F442D8];
            v50 = [v40 mediaUTI];
            int v51 = [v49 typeWithIdentifier:v50];
            int v52 = [v51 conformsToType:v125];

            if (v52)
            {
              v53 = [MEMORY[0x1E4F29128] UUID];
              v54 = [v53 UUIDString];
              v42 = [v12 addPaperDocumentAttachmentWithIdentifier:v54 subtype:v124];

              uint64_t v55 = [v40 title];
              [v42 setTitle:v55];

              v56 = (void *)MEMORY[0x1E4F83460];
              v57 = [v40 mediaURL];
              id v133 = 0;
              LOBYTE(v56) = [v56 createPaperDocumentForAttachment:v42 fromLegacyMediaAtURL:v57 error:&v133];
              id v58 = v133;

              if (v56)
              {

                if (v42) {
                  goto LABEL_13;
                }
              }
              else
              {
                v59 = os_log_create("com.apple.notes", "DragAndDrop");
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v139 = v58;
                  _os_log_error_impl(&dword_1B08EB000, v59, OS_LOG_TYPE_ERROR, "Failed to create paper document attachment; deleting and falling back to PDF (error: %@)",
                    buf,
                    0xCu);
                }

                [MEMORY[0x1E4F832A0] deleteAttachment:v42];
              }
            }
          }
        }
        id v60 = [v40 mediaURL];

        if (v60)
        {
          v61 = [v40 mediaURL];
          v42 = [v12 addAttachmentWithFileURL:v61];

          v62 = [v40 title];
          [v42 setTitle:v62];
LABEL_31:

          if (!v42) {
            goto LABEL_43;
          }
LABEL_32:
          uint64_t v130 = v39;
          uint64_t v72 = +[ICTextAttachment textAttachmentWithAttachment:v42];
          uint64_t v73 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v72];
          id v74 = (void *)[v73 mutableCopy];

          objc_msgSend(v74, "addAttribute:value:range:", v129, v72, 0, objc_msgSend(v74, "length"));
          long long v75 = [v12 textStorage];
          unint64_t v76 = [v75 length];

          if ([v12 attachmentViewType] == 1)
          {
            id v77 = v12;
            if (v76 >= 2)
            {
              long long v78 = [v12 textStorage];
              v79 = [v78 string];

              uint64_t v80 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
              if (objc_msgSend(v80, "characterIsMember:", objc_msgSend(v79, "characterAtIndex:", v76 - 1)))
              {
                v81 = [v12 textStorage];
                v82 = objc_msgSend(v81, "attribute:atIndex:longestEffectiveRange:inRange:", v129, v76 - 2, 0, v76 - 2, 1);

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && [v72 supportsMultipleThumbnailsOnSameLine])
                {
                  --v76;
                }
              }
            }
            id v12 = v77;
          }
          v83 = [v12 textStorage];
          objc_msgSend(v83, "replaceCharactersInRange:withAttributedString:", v76, 0, v74);

          v84 = [v12 textStorage];
          v85 = [v12 modificationDate];
          char v38 = 1;
          objc_msgSend(v84, "setTimestamp:range:", v85, v76, 1);

          [v42 updateChangeCountWithReason:@"Saved attachment"];
          v86 = [v42 media];
          [v86 updateChangeCountWithReason:@"Saved attachment"];

          v87 = [MEMORY[0x1E4F83428] sharedContext];
          [v87 save];

          v88 = +[ICAttachmentPreviewGenerator sharedGenerator];
          [v88 generatePreviewIfNeededForAttachment:v42];

          uint64_t v39 = v130;
LABEL_42:

          goto LABEL_43;
        }
        v63 = [v40 mediaData];

        if (v63)
        {
          v62 = [v40 mediaUTI];
          v64 = [v40 mediaData];
          v65 = [v40 mediaFilenameExtension];
          v66 = v12;
          id v67 = v62;
          v68 = v64;
          id v69 = v65;
LABEL_30:
          v42 = [v66 addAttachmentWithUTI:v67 data:v68 filenameExtension:v69];

          goto LABEL_31;
        }
        v70 = [v40 image];

        if (v70)
        {
          v71 = [v40 image];
          v62 = objc_msgSend(v71, "ic_JPEGData");

          v64 = [v123 preferredFilenameExtension];
          v65 = [v123 identifier];
          v66 = v12;
          id v67 = v65;
          v68 = v62;
          id v69 = v64;
          goto LABEL_30;
        }
        v89 = [v40 attributedContentText];
        uint64_t v90 = [v89 length];

        if (!v90)
        {
          v42 = os_log_create("com.apple.notes", "DragAndDrop");
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            -[ICAddAttachmentsManager saveAttachments:toNote:textBefore:textAfter:fetchFirst:](&v131, v132, v42);
          }
          goto LABEL_42;
        }
LABEL_43:
        ++v39;
      }
      while (v128 != v39);
      uint64_t v91 = [obj countByEnumeratingWithState:&v134 objects:v140 count:16];
      uint64_t v128 = v91;
    }
    while (v91);
  }

  if ([v121 length])
  {
    v92 = [v12 textStorage];
    v93 = [v92 string];
    v94 = [v12 textStorage];
    objc_msgSend(v93, "paragraphRangeForRange:", objc_msgSend(v94, "length"), 0);
    uint64_t v96 = v95;

    if (v96)
    {
      v97 = [v12 textStorage];
      v98 = [v12 textStorage];
      objc_msgSend(v97, "replaceCharactersInRange:withString:", objc_msgSend(v98, "length"), 0, @"\n");

      v99 = [v12 textStorage];
      v100 = [v12 modificationDate];
      v101 = [v12 textStorage];
      objc_msgSend(v99, "setTimestamp:range:", v100, objc_msgSend(v101, "length") - 1, 1);
    }
    v102 = [v12 textStorage];
    v103 = [v12 textStorage];
    objc_msgSend(v102, "replaceCharactersInRange:withAttributedString:", objc_msgSend(v103, "length"), 0, v121);

    v104 = [v12 textStorage];
    v105 = [v12 textStorage];
    objc_msgSend(v104, "replaceCharactersInRange:withString:", objc_msgSend(v105, "length"), 0, @"\n");

    v106 = [v12 textStorage];
    v107 = [v12 modificationDate];
    v108 = [v12 textStorage];
    uint64_t v109 = [v108 length];
    uint64_t v110 = v109 + ~[v121 length];
    uint64_t v111 = [v121 length] + 1;
    v112 = v106;
    v113 = v107;
    uint64_t v114 = v110;
    goto LABEL_53;
  }
  if ((v38 & 1) != 0 && [v12 attachmentViewType] != 1)
  {
    v118 = [v12 textStorage];
    v119 = [v12 textStorage];
    objc_msgSend(v118, "replaceCharactersInRange:withString:", objc_msgSend(v119, "length"), 0, @"\n");

    v106 = [v12 textStorage];
    v107 = [v12 modificationDate];
    v108 = [v12 textStorage];
    uint64_t v114 = [v108 length] - 1;
    v112 = v106;
    v113 = v107;
    uint64_t v111 = 1;
LABEL_53:
    objc_msgSend(v112, "setTimestamp:range:", v113, v114, v111);
  }
  if ([obj count] || objc_msgSend(v122, "length") || objc_msgSend(v121, "length"))
  {
    v115 = [v12 textStorage];
    [v115 fixupAfterEditing];

    [v12 updateChangeCountWithReason:@"Saved attachment"];
  }
  v116 = [MEMORY[0x1E4F83428] sharedContext];
  [v116 save];

  v117 = os_log_create("com.apple.notes", "DragAndDrop");
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG)) {
    -[ICAddAttachmentsManager saveAttachments:toNote:textBefore:textAfter:fetchFirst:](v12, v117);
  }
}

- (void)saveAttachments:(void *)a1 toNote:(NSObject *)a2 textBefore:textAfter:fetchFirst:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 shortLoggingDescription];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "POST SAVE note: %@", (uint8_t *)&v4, 0xCu);
}

- (void)saveAttachments:(os_log_t)log toNote:textBefore:textAfter:fetchFirst:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "created media attachment without knowing how to save it.", buf, 2u);
}

@end