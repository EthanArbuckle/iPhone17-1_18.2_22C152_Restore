@interface ICASNoteAttachmentItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASNoteAttachmentItemData)initWithTotalCountOfNotesWithAttachmentDocScan:(id)a3 totalCountOfNotesWithAttachmentInlineDrawingV1:(id)a4 totalCountOfNotesWithAttachmentInlineDrawingV2:(id)a5 totalCountOfNotesWithAttachmentPaperKit:(id)a6 totalCountOfNotesWithAttachmentFullscreenDrawing:(id)a7 totalCountOfNotesWithAttachmentTables:(id)a8 totalCountOfNotesWithAttachmentOther:(id)a9 totalCountOfNotesWithAttachmentRichUrl:(id)a10 totalCountOfNotesWithAttachmentMapLink:(id)a11 totalCountOfNotesWithAttachmentDeepLink:(id)a12 totalCountOfNotesWithPaperDocument:(id)a13 totalCountOfNotesWithPdfDocument:(id)a14 totalCountOfNotesWithNoteLinks:(id)a15 totalCountOfNotesWithFolderLinks:(id)a16 totalCountOfNotesWithAttachmentAudio:(id)a17 totalCountOfAudioAttachments:(id)a18 totalCountOfAudioAttachmentsRecordedInNotes:(id)a19 totalCountOfAudioAttachmentsWithAppendedAudio:(id)a20 totalCountOfNotesWithAttachmentAudioTranscript:(id)a21 totalCountOfNotesWithAttachmentAudioSummary:(id)a22;
- (NSNumber)totalCountOfAudioAttachments;
- (NSNumber)totalCountOfAudioAttachmentsRecordedInNotes;
- (NSNumber)totalCountOfAudioAttachmentsWithAppendedAudio;
- (NSNumber)totalCountOfNotesWithAttachmentAudio;
- (NSNumber)totalCountOfNotesWithAttachmentAudioSummary;
- (NSNumber)totalCountOfNotesWithAttachmentAudioTranscript;
- (NSNumber)totalCountOfNotesWithAttachmentDeepLink;
- (NSNumber)totalCountOfNotesWithAttachmentDocScan;
- (NSNumber)totalCountOfNotesWithAttachmentFullscreenDrawing;
- (NSNumber)totalCountOfNotesWithAttachmentInlineDrawingV1;
- (NSNumber)totalCountOfNotesWithAttachmentInlineDrawingV2;
- (NSNumber)totalCountOfNotesWithAttachmentMapLink;
- (NSNumber)totalCountOfNotesWithAttachmentOther;
- (NSNumber)totalCountOfNotesWithAttachmentPaperKit;
- (NSNumber)totalCountOfNotesWithAttachmentRichUrl;
- (NSNumber)totalCountOfNotesWithAttachmentTables;
- (NSNumber)totalCountOfNotesWithFolderLinks;
- (NSNumber)totalCountOfNotesWithNoteLinks;
- (NSNumber)totalCountOfNotesWithPaperDocument;
- (NSNumber)totalCountOfNotesWithPdfDocument;
- (id)toDict;
@end

@implementation ICASNoteAttachmentItemData

- (ICASNoteAttachmentItemData)initWithTotalCountOfNotesWithAttachmentDocScan:(id)a3 totalCountOfNotesWithAttachmentInlineDrawingV1:(id)a4 totalCountOfNotesWithAttachmentInlineDrawingV2:(id)a5 totalCountOfNotesWithAttachmentPaperKit:(id)a6 totalCountOfNotesWithAttachmentFullscreenDrawing:(id)a7 totalCountOfNotesWithAttachmentTables:(id)a8 totalCountOfNotesWithAttachmentOther:(id)a9 totalCountOfNotesWithAttachmentRichUrl:(id)a10 totalCountOfNotesWithAttachmentMapLink:(id)a11 totalCountOfNotesWithAttachmentDeepLink:(id)a12 totalCountOfNotesWithPaperDocument:(id)a13 totalCountOfNotesWithPdfDocument:(id)a14 totalCountOfNotesWithNoteLinks:(id)a15 totalCountOfNotesWithFolderLinks:(id)a16 totalCountOfNotesWithAttachmentAudio:(id)a17 totalCountOfAudioAttachments:(id)a18 totalCountOfAudioAttachmentsRecordedInNotes:(id)a19 totalCountOfAudioAttachmentsWithAppendedAudio:(id)a20 totalCountOfNotesWithAttachmentAudioTranscript:(id)a21 totalCountOfNotesWithAttachmentAudioSummary:(id)a22
{
  id v54 = a3;
  id v38 = a4;
  id v53 = a4;
  id v39 = a5;
  id v52 = a5;
  id v40 = a6;
  id v51 = a6;
  id v50 = a7;
  id v49 = a8;
  id v48 = a9;
  id v47 = a10;
  id v46 = a11;
  id v45 = a12;
  id v44 = a13;
  id v43 = a14;
  id v27 = a15;
  id v28 = a16;
  id v29 = a17;
  id v30 = a18;
  id v31 = a19;
  id v32 = a20;
  id v33 = a21;
  id v42 = a22;
  v55.receiver = self;
  v55.super_class = (Class)ICASNoteAttachmentItemData;
  v34 = [(ICASNoteAttachmentItemData *)&v55 init];
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_totalCountOfNotesWithAttachmentDocScan, a3);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentInlineDrawingV1, v38);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentInlineDrawingV2, v39);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentPaperKit, v40);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentFullscreenDrawing, a7);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentTables, a8);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentOther, a9);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentRichUrl, a10);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentMapLink, a11);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentDeepLink, a12);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithPaperDocument, a13);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithPdfDocument, a14);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithNoteLinks, a15);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithFolderLinks, a16);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentAudio, a17);
    objc_storeStrong((id *)&v35->_totalCountOfAudioAttachments, a18);
    objc_storeStrong((id *)&v35->_totalCountOfAudioAttachmentsRecordedInNotes, a19);
    objc_storeStrong((id *)&v35->_totalCountOfAudioAttachmentsWithAppendedAudio, a20);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentAudioTranscript, a21);
    objc_storeStrong((id *)&v35->_totalCountOfNotesWithAttachmentAudioSummary, a22);
  }

  return v35;
}

+ (NSString)dataName
{
  return (NSString *)@"NoteAttachmentItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v66[20] = *MEMORY[0x1E4F143B8];
  v65[0] = @"totalCountOfNotesWithAttachmentDocScan";
  v64 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentDocScan];
  if (v64)
  {
    uint64_t v3 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentDocScan];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  v63 = (void *)v3;
  v66[0] = v3;
  v65[1] = @"totalCountOfNotesWithAttachmentInlineDrawingV1";
  v62 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentInlineDrawingV1];
  if (v62)
  {
    uint64_t v4 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentInlineDrawingV1];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v61 = (void *)v4;
  v66[1] = v4;
  v65[2] = @"totalCountOfNotesWithAttachmentInlineDrawingV2";
  v60 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentInlineDrawingV2];
  if (v60)
  {
    uint64_t v5 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentInlineDrawingV2];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  v59 = (void *)v5;
  v66[2] = v5;
  v65[3] = @"totalCountOfNotesWithAttachmentPaperKit";
  v58 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentPaperKit];
  if (v58)
  {
    uint64_t v6 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentPaperKit];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  v57 = (void *)v6;
  v66[3] = v6;
  v65[4] = @"totalCountOfNotesWithAttachmentFullscreenDrawing";
  v56 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentFullscreenDrawing];
  if (v56)
  {
    uint64_t v7 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentFullscreenDrawing];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  objc_super v55 = (void *)v7;
  v66[4] = v7;
  v65[5] = @"totalCountOfNotesWithAttachmentTables";
  id v54 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentTables];
  if (v54)
  {
    uint64_t v8 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentTables];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  id v53 = (void *)v8;
  v66[5] = v8;
  v65[6] = @"totalCountOfNotesWithAttachmentOther";
  id v52 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentOther];
  if (v52)
  {
    uint64_t v9 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentOther];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  id v51 = (void *)v9;
  v66[6] = v9;
  v65[7] = @"totalCountOfNotesWithAttachmentRichUrl";
  id v50 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentRichUrl];
  if (v50)
  {
    uint64_t v10 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentRichUrl];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v49 = (void *)v10;
  v66[7] = v10;
  v65[8] = @"totalCountOfNotesWithAttachmentMapLink";
  id v48 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentMapLink];
  if (v48)
  {
    uint64_t v11 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentMapLink];
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  id v47 = (void *)v11;
  v66[8] = v11;
  v65[9] = @"totalCountOfNotesWithAttachmentDeepLink";
  id v46 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentDeepLink];
  if (v46)
  {
    uint64_t v12 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentDeepLink];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  id v45 = (void *)v12;
  v66[9] = v12;
  v65[10] = @"totalCountOfNotesWithPaperDocument";
  id v44 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithPaperDocument];
  if (v44)
  {
    uint64_t v13 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithPaperDocument];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v43 = (void *)v13;
  v66[10] = v13;
  v65[11] = @"totalCountOfNotesWithPdfDocument";
  id v42 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithPdfDocument];
  if (v42)
  {
    uint64_t v14 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithPdfDocument];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
  }
  v41 = (void *)v14;
  v66[11] = v14;
  v65[12] = @"totalCountOfNotesWithNoteLinks";
  id v40 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithNoteLinks];
  if (v40)
  {
    uint64_t v15 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithNoteLinks];
  }
  else
  {
    uint64_t v15 = objc_opt_new();
  }
  id v39 = (void *)v15;
  v66[12] = v15;
  v65[13] = @"totalCountOfNotesWithFolderLinks";
  id v38 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithFolderLinks];
  if (v38)
  {
    uint64_t v16 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithFolderLinks];
  }
  else
  {
    uint64_t v16 = objc_opt_new();
  }
  v37 = (void *)v16;
  v66[13] = v16;
  v65[14] = @"totalCountOfNotesWithAttachmentAudio";
  v36 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentAudio];
  if (v36)
  {
    uint64_t v17 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentAudio];
  }
  else
  {
    uint64_t v17 = objc_opt_new();
  }
  v35 = (void *)v17;
  v66[14] = v17;
  v65[15] = @"totalCountOfAudioAttachments";
  v18 = [(ICASNoteAttachmentItemData *)self totalCountOfAudioAttachments];
  if (v18)
  {
    uint64_t v19 = [(ICASNoteAttachmentItemData *)self totalCountOfAudioAttachments];
  }
  else
  {
    uint64_t v19 = objc_opt_new();
  }
  v20 = (void *)v19;
  v66[15] = v19;
  v65[16] = @"totalCountOfAudioAttachmentsRecordedInNotes";
  v21 = [(ICASNoteAttachmentItemData *)self totalCountOfAudioAttachmentsRecordedInNotes];
  if (v21)
  {
    uint64_t v22 = [(ICASNoteAttachmentItemData *)self totalCountOfAudioAttachmentsRecordedInNotes];
  }
  else
  {
    uint64_t v22 = objc_opt_new();
  }
  v23 = (void *)v22;
  v66[16] = v22;
  v65[17] = @"totalCountOfAudioAttachmentsWithAppendedAudio";
  v24 = [(ICASNoteAttachmentItemData *)self totalCountOfAudioAttachmentsWithAppendedAudio];
  if (v24)
  {
    uint64_t v25 = [(ICASNoteAttachmentItemData *)self totalCountOfAudioAttachmentsWithAppendedAudio];
  }
  else
  {
    uint64_t v25 = objc_opt_new();
  }
  v26 = (void *)v25;
  v66[17] = v25;
  v65[18] = @"totalCountOfNotesWithAttachmentAudioTranscript";
  id v27 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentAudioTranscript];
  if (v27)
  {
    uint64_t v28 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentAudioTranscript];
  }
  else
  {
    uint64_t v28 = objc_opt_new();
  }
  id v29 = (void *)v28;
  v66[18] = v28;
  v65[19] = @"totalCountOfNotesWithAttachmentAudioSummary";
  id v30 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentAudioSummary];
  if (v30)
  {
    uint64_t v31 = [(ICASNoteAttachmentItemData *)self totalCountOfNotesWithAttachmentAudioSummary];
  }
  else
  {
    uint64_t v31 = objc_opt_new();
  }
  id v32 = (void *)v31;
  v66[19] = v31;
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:20];

  return v34;
}

- (NSNumber)totalCountOfNotesWithAttachmentDocScan
{
  return self->_totalCountOfNotesWithAttachmentDocScan;
}

- (NSNumber)totalCountOfNotesWithAttachmentInlineDrawingV1
{
  return self->_totalCountOfNotesWithAttachmentInlineDrawingV1;
}

- (NSNumber)totalCountOfNotesWithAttachmentInlineDrawingV2
{
  return self->_totalCountOfNotesWithAttachmentInlineDrawingV2;
}

- (NSNumber)totalCountOfNotesWithAttachmentPaperKit
{
  return self->_totalCountOfNotesWithAttachmentPaperKit;
}

- (NSNumber)totalCountOfNotesWithAttachmentFullscreenDrawing
{
  return self->_totalCountOfNotesWithAttachmentFullscreenDrawing;
}

- (NSNumber)totalCountOfNotesWithAttachmentTables
{
  return self->_totalCountOfNotesWithAttachmentTables;
}

- (NSNumber)totalCountOfNotesWithAttachmentOther
{
  return self->_totalCountOfNotesWithAttachmentOther;
}

- (NSNumber)totalCountOfNotesWithAttachmentRichUrl
{
  return self->_totalCountOfNotesWithAttachmentRichUrl;
}

- (NSNumber)totalCountOfNotesWithAttachmentMapLink
{
  return self->_totalCountOfNotesWithAttachmentMapLink;
}

- (NSNumber)totalCountOfNotesWithAttachmentDeepLink
{
  return self->_totalCountOfNotesWithAttachmentDeepLink;
}

- (NSNumber)totalCountOfNotesWithPaperDocument
{
  return self->_totalCountOfNotesWithPaperDocument;
}

- (NSNumber)totalCountOfNotesWithPdfDocument
{
  return self->_totalCountOfNotesWithPdfDocument;
}

- (NSNumber)totalCountOfNotesWithNoteLinks
{
  return self->_totalCountOfNotesWithNoteLinks;
}

- (NSNumber)totalCountOfNotesWithFolderLinks
{
  return self->_totalCountOfNotesWithFolderLinks;
}

- (NSNumber)totalCountOfNotesWithAttachmentAudio
{
  return self->_totalCountOfNotesWithAttachmentAudio;
}

- (NSNumber)totalCountOfAudioAttachments
{
  return self->_totalCountOfAudioAttachments;
}

- (NSNumber)totalCountOfAudioAttachmentsRecordedInNotes
{
  return self->_totalCountOfAudioAttachmentsRecordedInNotes;
}

- (NSNumber)totalCountOfAudioAttachmentsWithAppendedAudio
{
  return self->_totalCountOfAudioAttachmentsWithAppendedAudio;
}

- (NSNumber)totalCountOfNotesWithAttachmentAudioTranscript
{
  return self->_totalCountOfNotesWithAttachmentAudioTranscript;
}

- (NSNumber)totalCountOfNotesWithAttachmentAudioSummary
{
  return self->_totalCountOfNotesWithAttachmentAudioSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentAudioSummary, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentAudioTranscript, 0);
  objc_storeStrong((id *)&self->_totalCountOfAudioAttachmentsWithAppendedAudio, 0);
  objc_storeStrong((id *)&self->_totalCountOfAudioAttachmentsRecordedInNotes, 0);
  objc_storeStrong((id *)&self->_totalCountOfAudioAttachments, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentAudio, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithFolderLinks, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithNoteLinks, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithPdfDocument, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithPaperDocument, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentDeepLink, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentMapLink, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentRichUrl, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentOther, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentTables, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentFullscreenDrawing, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentPaperKit, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentInlineDrawingV2, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentInlineDrawingV1, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithAttachmentDocScan, 0);
}

@end