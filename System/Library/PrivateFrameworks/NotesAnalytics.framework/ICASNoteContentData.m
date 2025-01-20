@interface ICASNoteContentData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASNoteContentData)initWithCharacterCount:(id)a3 hasChecklist:(id)a4 hasStyleFormatting:(id)a5 hasTable:(id)a6 hasAttachmentInlineDrawingV1:(id)a7 hasAttachmentInlineDrawingV2:(id)a8 hasAttachmentFullscreenDrawing:(id)a9 hasAttachmentOther:(id)a10 hasAttachedPhoto:(id)a11 weeksSinceCreation:(id)a12 hasAttachmentRichUrl:(id)a13 hasAttachmentMapLink:(id)a14 hasTags:(id)a15 hasScannedDoc:(id)a16 countOfTags:(id)a17 countOfDistinctTags:(id)a18 hasMentions:(id)a19 countOfMentions:(id)a20 countOfDistinctMentions:(id)a21 hasPaperKitDrawing:(id)a22 hasPaperDocument:(id)a23 hasPdf:(id)a24 countOfNoteLinks:(id)a25 countOfDistinctNoteLinks:(id)a26 countOfFolderLinks:(id)a27 countOfDistinctFolderLinks:(id)a28 countOfAudioAttachments:(id)a29;
- (NSNumber)characterCount;
- (NSNumber)countOfAudioAttachments;
- (NSNumber)countOfDistinctFolderLinks;
- (NSNumber)countOfDistinctMentions;
- (NSNumber)countOfDistinctNoteLinks;
- (NSNumber)countOfDistinctTags;
- (NSNumber)countOfFolderLinks;
- (NSNumber)countOfMentions;
- (NSNumber)countOfNoteLinks;
- (NSNumber)countOfTags;
- (NSNumber)hasAttachedPhoto;
- (NSNumber)hasAttachmentFullscreenDrawing;
- (NSNumber)hasAttachmentInlineDrawingV1;
- (NSNumber)hasAttachmentInlineDrawingV2;
- (NSNumber)hasAttachmentMapLink;
- (NSNumber)hasAttachmentOther;
- (NSNumber)hasAttachmentRichUrl;
- (NSNumber)hasChecklist;
- (NSNumber)hasMentions;
- (NSNumber)hasPaperDocument;
- (NSNumber)hasPaperKitDrawing;
- (NSNumber)hasPdf;
- (NSNumber)hasScannedDoc;
- (NSNumber)hasStyleFormatting;
- (NSNumber)hasTable;
- (NSNumber)hasTags;
- (NSNumber)weeksSinceCreation;
- (id)toDict;
@end

@implementation ICASNoteContentData

- (ICASNoteContentData)initWithCharacterCount:(id)a3 hasChecklist:(id)a4 hasStyleFormatting:(id)a5 hasTable:(id)a6 hasAttachmentInlineDrawingV1:(id)a7 hasAttachmentInlineDrawingV2:(id)a8 hasAttachmentFullscreenDrawing:(id)a9 hasAttachmentOther:(id)a10 hasAttachedPhoto:(id)a11 weeksSinceCreation:(id)a12 hasAttachmentRichUrl:(id)a13 hasAttachmentMapLink:(id)a14 hasTags:(id)a15 hasScannedDoc:(id)a16 countOfTags:(id)a17 countOfDistinctTags:(id)a18 hasMentions:(id)a19 countOfMentions:(id)a20 countOfDistinctMentions:(id)a21 hasPaperKitDrawing:(id)a22 hasPaperDocument:(id)a23 hasPdf:(id)a24 countOfNoteLinks:(id)a25 countOfDistinctNoteLinks:(id)a26 countOfFolderLinks:(id)a27 countOfDistinctFolderLinks:(id)a28 countOfAudioAttachments:(id)a29
{
  id v69 = a3;
  id v45 = a4;
  id v68 = a4;
  id v46 = a5;
  id v67 = a5;
  id v47 = a6;
  id v66 = a6;
  id v48 = a7;
  id v65 = a7;
  id v64 = a8;
  id v63 = a9;
  id v62 = a10;
  id v61 = a11;
  id v60 = a12;
  id v59 = a13;
  id v58 = a14;
  id v57 = a15;
  id v56 = a16;
  id v55 = a17;
  id v54 = a18;
  id v34 = a19;
  id v35 = a20;
  id v36 = a21;
  id v37 = a22;
  id v38 = a23;
  id v39 = a24;
  id v40 = a25;
  id v53 = a26;
  id v52 = a27;
  id v51 = a28;
  id v50 = a29;
  v70.receiver = self;
  v70.super_class = (Class)ICASNoteContentData;
  v41 = [(ICASNoteContentData *)&v70 init];
  v42 = v41;
  if (v41)
  {
    objc_storeStrong((id *)&v41->_characterCount, a3);
    objc_storeStrong((id *)&v42->_hasChecklist, v45);
    objc_storeStrong((id *)&v42->_hasStyleFormatting, v46);
    objc_storeStrong((id *)&v42->_hasTable, v47);
    objc_storeStrong((id *)&v42->_hasAttachmentInlineDrawingV1, v48);
    objc_storeStrong((id *)&v42->_hasAttachmentInlineDrawingV2, a8);
    objc_storeStrong((id *)&v42->_hasAttachmentFullscreenDrawing, a9);
    objc_storeStrong((id *)&v42->_hasAttachmentOther, a10);
    objc_storeStrong((id *)&v42->_hasAttachedPhoto, a11);
    objc_storeStrong((id *)&v42->_weeksSinceCreation, a12);
    objc_storeStrong((id *)&v42->_hasAttachmentRichUrl, a13);
    objc_storeStrong((id *)&v42->_hasAttachmentMapLink, a14);
    objc_storeStrong((id *)&v42->_hasTags, a15);
    objc_storeStrong((id *)&v42->_hasScannedDoc, a16);
    objc_storeStrong((id *)&v42->_countOfTags, a17);
    objc_storeStrong((id *)&v42->_countOfDistinctTags, a18);
    objc_storeStrong((id *)&v42->_hasMentions, a19);
    objc_storeStrong((id *)&v42->_countOfMentions, a20);
    objc_storeStrong((id *)&v42->_countOfDistinctMentions, a21);
    objc_storeStrong((id *)&v42->_hasPaperKitDrawing, a22);
    objc_storeStrong((id *)&v42->_hasPaperDocument, a23);
    objc_storeStrong((id *)&v42->_hasPdf, a24);
    objc_storeStrong((id *)&v42->_countOfNoteLinks, a25);
    objc_storeStrong((id *)&v42->_countOfDistinctNoteLinks, a26);
    objc_storeStrong((id *)&v42->_countOfFolderLinks, a27);
    objc_storeStrong((id *)&v42->_countOfDistinctFolderLinks, a28);
    objc_storeStrong((id *)&v42->_countOfAudioAttachments, a29);
  }

  return v42;
}

+ (NSString)dataName
{
  return (NSString *)@"NoteContentData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v87[27] = *MEMORY[0x1E4F143B8];
  v86[0] = @"characterCount";
  v85 = [(ICASNoteContentData *)self characterCount];
  if (v85)
  {
    uint64_t v3 = [(ICASNoteContentData *)self characterCount];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  v84 = (void *)v3;
  v87[0] = v3;
  v86[1] = @"hasChecklist";
  v83 = [(ICASNoteContentData *)self hasChecklist];
  if (v83)
  {
    uint64_t v4 = [(ICASNoteContentData *)self hasChecklist];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v82 = (void *)v4;
  v87[1] = v4;
  v86[2] = @"hasStyleFormatting";
  v81 = [(ICASNoteContentData *)self hasStyleFormatting];
  if (v81)
  {
    uint64_t v5 = [(ICASNoteContentData *)self hasStyleFormatting];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  v80 = (void *)v5;
  v87[2] = v5;
  v86[3] = @"hasTable";
  v79 = [(ICASNoteContentData *)self hasTable];
  if (v79)
  {
    uint64_t v6 = [(ICASNoteContentData *)self hasTable];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  v78 = (void *)v6;
  v87[3] = v6;
  v86[4] = @"hasAttachmentInlineDrawingV1";
  v77 = [(ICASNoteContentData *)self hasAttachmentInlineDrawingV1];
  if (v77)
  {
    uint64_t v7 = [(ICASNoteContentData *)self hasAttachmentInlineDrawingV1];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v76 = (void *)v7;
  v87[4] = v7;
  v86[5] = @"hasAttachmentInlineDrawingV2";
  v75 = [(ICASNoteContentData *)self hasAttachmentInlineDrawingV2];
  if (v75)
  {
    uint64_t v8 = [(ICASNoteContentData *)self hasAttachmentInlineDrawingV2];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  v74 = (void *)v8;
  v87[5] = v8;
  v86[6] = @"hasAttachmentFullscreenDrawing";
  v73 = [(ICASNoteContentData *)self hasAttachmentFullscreenDrawing];
  if (v73)
  {
    uint64_t v9 = [(ICASNoteContentData *)self hasAttachmentFullscreenDrawing];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  v72 = (void *)v9;
  v87[6] = v9;
  v86[7] = @"hasAttachmentOther";
  v71 = [(ICASNoteContentData *)self hasAttachmentOther];
  if (v71)
  {
    uint64_t v10 = [(ICASNoteContentData *)self hasAttachmentOther];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  objc_super v70 = (void *)v10;
  v87[7] = v10;
  v86[8] = @"hasAttachedPhoto";
  id v69 = [(ICASNoteContentData *)self hasAttachedPhoto];
  if (v69)
  {
    uint64_t v11 = [(ICASNoteContentData *)self hasAttachedPhoto];
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  id v68 = (void *)v11;
  v87[8] = v11;
  v86[9] = @"weeksSinceCreation";
  id v67 = [(ICASNoteContentData *)self weeksSinceCreation];
  if (v67)
  {
    uint64_t v12 = [(ICASNoteContentData *)self weeksSinceCreation];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  id v66 = (void *)v12;
  v87[9] = v12;
  v86[10] = @"hasAttachmentRichUrl";
  id v65 = [(ICASNoteContentData *)self hasAttachmentRichUrl];
  if (v65)
  {
    uint64_t v13 = [(ICASNoteContentData *)self hasAttachmentRichUrl];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v64 = (void *)v13;
  v87[10] = v13;
  v86[11] = @"hasAttachmentMapLink";
  id v63 = [(ICASNoteContentData *)self hasAttachmentMapLink];
  if (v63)
  {
    uint64_t v14 = [(ICASNoteContentData *)self hasAttachmentMapLink];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
  }
  id v62 = (void *)v14;
  v87[11] = v14;
  v86[12] = @"hasTags";
  id v61 = [(ICASNoteContentData *)self hasTags];
  if (v61)
  {
    uint64_t v15 = [(ICASNoteContentData *)self hasTags];
  }
  else
  {
    uint64_t v15 = objc_opt_new();
  }
  id v60 = (void *)v15;
  v87[12] = v15;
  v86[13] = @"hasScannedDoc";
  id v59 = [(ICASNoteContentData *)self hasScannedDoc];
  if (v59)
  {
    uint64_t v16 = [(ICASNoteContentData *)self hasScannedDoc];
  }
  else
  {
    uint64_t v16 = objc_opt_new();
  }
  id v58 = (void *)v16;
  v87[13] = v16;
  v86[14] = @"countOfTags";
  id v57 = [(ICASNoteContentData *)self countOfTags];
  if (v57)
  {
    uint64_t v17 = [(ICASNoteContentData *)self countOfTags];
  }
  else
  {
    uint64_t v17 = objc_opt_new();
  }
  id v56 = (void *)v17;
  v87[14] = v17;
  v86[15] = @"countOfDistinctTags";
  id v55 = [(ICASNoteContentData *)self countOfDistinctTags];
  if (v55)
  {
    uint64_t v18 = [(ICASNoteContentData *)self countOfDistinctTags];
  }
  else
  {
    uint64_t v18 = objc_opt_new();
  }
  id v54 = (void *)v18;
  v87[15] = v18;
  v86[16] = @"hasMentions";
  id v53 = [(ICASNoteContentData *)self hasMentions];
  if (v53)
  {
    uint64_t v19 = [(ICASNoteContentData *)self hasMentions];
  }
  else
  {
    uint64_t v19 = objc_opt_new();
  }
  id v52 = (void *)v19;
  v87[16] = v19;
  v86[17] = @"countOfMentions";
  id v51 = [(ICASNoteContentData *)self countOfMentions];
  if (v51)
  {
    uint64_t v20 = [(ICASNoteContentData *)self countOfMentions];
  }
  else
  {
    uint64_t v20 = objc_opt_new();
  }
  id v50 = (void *)v20;
  v87[17] = v20;
  v86[18] = @"countOfDistinctMentions";
  v49 = [(ICASNoteContentData *)self countOfDistinctMentions];
  if (v49)
  {
    uint64_t v21 = [(ICASNoteContentData *)self countOfDistinctMentions];
  }
  else
  {
    uint64_t v21 = objc_opt_new();
  }
  id v48 = (void *)v21;
  v87[18] = v21;
  v86[19] = @"hasPaperKitDrawing";
  id v47 = [(ICASNoteContentData *)self hasPaperKitDrawing];
  if (v47)
  {
    uint64_t v22 = [(ICASNoteContentData *)self hasPaperKitDrawing];
  }
  else
  {
    uint64_t v22 = objc_opt_new();
  }
  id v46 = (void *)v22;
  v87[19] = v22;
  v86[20] = @"hasPaperDocument";
  id v45 = [(ICASNoteContentData *)self hasPaperDocument];
  if (v45)
  {
    uint64_t v23 = [(ICASNoteContentData *)self hasPaperDocument];
  }
  else
  {
    uint64_t v23 = objc_opt_new();
  }
  v44 = (void *)v23;
  v87[20] = v23;
  v86[21] = @"hasPdf";
  v43 = [(ICASNoteContentData *)self hasPdf];
  if (v43)
  {
    uint64_t v24 = [(ICASNoteContentData *)self hasPdf];
  }
  else
  {
    uint64_t v24 = objc_opt_new();
  }
  v42 = (void *)v24;
  v87[21] = v24;
  v86[22] = @"countOfNoteLinks";
  v25 = [(ICASNoteContentData *)self countOfNoteLinks];
  if (v25)
  {
    uint64_t v26 = [(ICASNoteContentData *)self countOfNoteLinks];
  }
  else
  {
    uint64_t v26 = objc_opt_new();
  }
  v27 = (void *)v26;
  v87[22] = v26;
  v86[23] = @"countOfDistinctNoteLinks";
  v28 = [(ICASNoteContentData *)self countOfDistinctNoteLinks];
  if (v28)
  {
    uint64_t v29 = [(ICASNoteContentData *)self countOfDistinctNoteLinks];
  }
  else
  {
    uint64_t v29 = objc_opt_new();
  }
  v30 = (void *)v29;
  v87[23] = v29;
  v86[24] = @"countOfFolderLinks";
  v31 = [(ICASNoteContentData *)self countOfFolderLinks];
  if (v31)
  {
    uint64_t v32 = [(ICASNoteContentData *)self countOfFolderLinks];
  }
  else
  {
    uint64_t v32 = objc_opt_new();
  }
  v33 = (void *)v32;
  v87[24] = v32;
  v86[25] = @"countOfDistinctFolderLinks";
  id v34 = [(ICASNoteContentData *)self countOfDistinctFolderLinks];
  if (v34)
  {
    uint64_t v35 = [(ICASNoteContentData *)self countOfDistinctFolderLinks];
  }
  else
  {
    uint64_t v35 = objc_opt_new();
  }
  id v36 = (void *)v35;
  v87[25] = v35;
  v86[26] = @"countOfAudioAttachments";
  id v37 = [(ICASNoteContentData *)self countOfAudioAttachments];
  if (v37)
  {
    uint64_t v38 = [(ICASNoteContentData *)self countOfAudioAttachments];
  }
  else
  {
    uint64_t v38 = objc_opt_new();
  }
  id v39 = (void *)v38;
  v87[26] = v38;
  id v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:27];

  return v41;
}

- (NSNumber)characterCount
{
  return self->_characterCount;
}

- (NSNumber)hasChecklist
{
  return self->_hasChecklist;
}

- (NSNumber)hasStyleFormatting
{
  return self->_hasStyleFormatting;
}

- (NSNumber)hasTable
{
  return self->_hasTable;
}

- (NSNumber)hasAttachmentInlineDrawingV1
{
  return self->_hasAttachmentInlineDrawingV1;
}

- (NSNumber)hasAttachmentInlineDrawingV2
{
  return self->_hasAttachmentInlineDrawingV2;
}

- (NSNumber)hasAttachmentFullscreenDrawing
{
  return self->_hasAttachmentFullscreenDrawing;
}

- (NSNumber)hasAttachmentOther
{
  return self->_hasAttachmentOther;
}

- (NSNumber)hasAttachedPhoto
{
  return self->_hasAttachedPhoto;
}

- (NSNumber)weeksSinceCreation
{
  return self->_weeksSinceCreation;
}

- (NSNumber)hasAttachmentRichUrl
{
  return self->_hasAttachmentRichUrl;
}

- (NSNumber)hasAttachmentMapLink
{
  return self->_hasAttachmentMapLink;
}

- (NSNumber)hasTags
{
  return self->_hasTags;
}

- (NSNumber)hasScannedDoc
{
  return self->_hasScannedDoc;
}

- (NSNumber)countOfTags
{
  return self->_countOfTags;
}

- (NSNumber)countOfDistinctTags
{
  return self->_countOfDistinctTags;
}

- (NSNumber)hasMentions
{
  return self->_hasMentions;
}

- (NSNumber)countOfMentions
{
  return self->_countOfMentions;
}

- (NSNumber)countOfDistinctMentions
{
  return self->_countOfDistinctMentions;
}

- (NSNumber)hasPaperKitDrawing
{
  return self->_hasPaperKitDrawing;
}

- (NSNumber)hasPaperDocument
{
  return self->_hasPaperDocument;
}

- (NSNumber)hasPdf
{
  return self->_hasPdf;
}

- (NSNumber)countOfNoteLinks
{
  return self->_countOfNoteLinks;
}

- (NSNumber)countOfDistinctNoteLinks
{
  return self->_countOfDistinctNoteLinks;
}

- (NSNumber)countOfFolderLinks
{
  return self->_countOfFolderLinks;
}

- (NSNumber)countOfDistinctFolderLinks
{
  return self->_countOfDistinctFolderLinks;
}

- (NSNumber)countOfAudioAttachments
{
  return self->_countOfAudioAttachments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfAudioAttachments, 0);
  objc_storeStrong((id *)&self->_countOfDistinctFolderLinks, 0);
  objc_storeStrong((id *)&self->_countOfFolderLinks, 0);
  objc_storeStrong((id *)&self->_countOfDistinctNoteLinks, 0);
  objc_storeStrong((id *)&self->_countOfNoteLinks, 0);
  objc_storeStrong((id *)&self->_hasPdf, 0);
  objc_storeStrong((id *)&self->_hasPaperDocument, 0);
  objc_storeStrong((id *)&self->_hasPaperKitDrawing, 0);
  objc_storeStrong((id *)&self->_countOfDistinctMentions, 0);
  objc_storeStrong((id *)&self->_countOfMentions, 0);
  objc_storeStrong((id *)&self->_hasMentions, 0);
  objc_storeStrong((id *)&self->_countOfDistinctTags, 0);
  objc_storeStrong((id *)&self->_countOfTags, 0);
  objc_storeStrong((id *)&self->_hasScannedDoc, 0);
  objc_storeStrong((id *)&self->_hasTags, 0);
  objc_storeStrong((id *)&self->_hasAttachmentMapLink, 0);
  objc_storeStrong((id *)&self->_hasAttachmentRichUrl, 0);
  objc_storeStrong((id *)&self->_weeksSinceCreation, 0);
  objc_storeStrong((id *)&self->_hasAttachedPhoto, 0);
  objc_storeStrong((id *)&self->_hasAttachmentOther, 0);
  objc_storeStrong((id *)&self->_hasAttachmentFullscreenDrawing, 0);
  objc_storeStrong((id *)&self->_hasAttachmentInlineDrawingV2, 0);
  objc_storeStrong((id *)&self->_hasAttachmentInlineDrawingV1, 0);
  objc_storeStrong((id *)&self->_hasTable, 0);
  objc_storeStrong((id *)&self->_hasStyleFormatting, 0);
  objc_storeStrong((id *)&self->_hasChecklist, 0);
  objc_storeStrong((id *)&self->_characterCount, 0);
}

@end