@interface ICASNoteSnapshotItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCollaborationStatus)collaborationStatus;
- (ICASCollaborationType)collaborationType;
- (ICASNoteSnapshotItemData)initWithNoteID:(id)a3 noteType:(id)a4 collaborationStatus:(id)a5 collaborationType:(id)a6 countOfInvitees:(id)a7 countOfAcceptances:(id)a8 countOfDocScan:(id)a9 countOfInlineDrawingV1:(id)a10 countOfInlineDrawingV2:(id)a11 countOfFullscreenDrawing:(id)a12 countOfTables:(id)a13 countOfAttachmentOther:(id)a14 hasChecklist:(id)a15 isPinned:(id)a16 isLocked:(id)a17 charLength:(id)a18 creationDate:(id)a19 countOfInlineDrawingV1PencilStrokes:(id)a20 countOfInlineDrawingV1FingerStrokes:(id)a21 countOfInlineDrawingV2PencilStrokes:(id)a22 countOfInlineDrawingV2FingerStrokes:(id)a23 countOfFullscreenDrawingStrokes:(id)a24;
- (ICASNoteType)noteType;
- (NSNumber)charLength;
- (NSNumber)countOfAcceptances;
- (NSNumber)countOfAttachmentOther;
- (NSNumber)countOfDocScan;
- (NSNumber)countOfFullscreenDrawing;
- (NSNumber)countOfFullscreenDrawingStrokes;
- (NSNumber)countOfInlineDrawingV1;
- (NSNumber)countOfInlineDrawingV1FingerStrokes;
- (NSNumber)countOfInlineDrawingV1PencilStrokes;
- (NSNumber)countOfInlineDrawingV2;
- (NSNumber)countOfInlineDrawingV2FingerStrokes;
- (NSNumber)countOfInlineDrawingV2PencilStrokes;
- (NSNumber)countOfInvitees;
- (NSNumber)countOfTables;
- (NSNumber)creationDate;
- (NSNumber)hasChecklist;
- (NSNumber)isLocked;
- (NSNumber)isPinned;
- (NSString)noteID;
- (id)toDict;
@end

@implementation ICASNoteSnapshotItemData

- (ICASNoteSnapshotItemData)initWithNoteID:(id)a3 noteType:(id)a4 collaborationStatus:(id)a5 collaborationType:(id)a6 countOfInvitees:(id)a7 countOfAcceptances:(id)a8 countOfDocScan:(id)a9 countOfInlineDrawingV1:(id)a10 countOfInlineDrawingV2:(id)a11 countOfFullscreenDrawing:(id)a12 countOfTables:(id)a13 countOfAttachmentOther:(id)a14 hasChecklist:(id)a15 isPinned:(id)a16 isLocked:(id)a17 charLength:(id)a18 creationDate:(id)a19 countOfInlineDrawingV1PencilStrokes:(id)a20 countOfInlineDrawingV1FingerStrokes:(id)a21 countOfInlineDrawingV2PencilStrokes:(id)a22 countOfInlineDrawingV2FingerStrokes:(id)a23 countOfFullscreenDrawingStrokes:(id)a24
{
  id v57 = a3;
  id v39 = a4;
  id v56 = a4;
  id v40 = a5;
  id v55 = a5;
  id v54 = a6;
  id v53 = a7;
  id v52 = a8;
  id v51 = a9;
  id v50 = a10;
  id v49 = a11;
  id v48 = a12;
  id v47 = a13;
  id v46 = a14;
  id v45 = a15;
  id v29 = a16;
  id v30 = a17;
  id v31 = a18;
  id v32 = a19;
  id v33 = a20;
  id v34 = a21;
  id v44 = a22;
  id v43 = a23;
  id v42 = a24;
  v58.receiver = self;
  v58.super_class = (Class)ICASNoteSnapshotItemData;
  v35 = [(ICASNoteSnapshotItemData *)&v58 init];
  v36 = v35;
  if (v35)
  {
    objc_storeStrong((id *)&v35->_noteID, a3);
    objc_storeStrong((id *)&v36->_noteType, v39);
    objc_storeStrong((id *)&v36->_collaborationStatus, v40);
    objc_storeStrong((id *)&v36->_collaborationType, a6);
    objc_storeStrong((id *)&v36->_countOfInvitees, a7);
    objc_storeStrong((id *)&v36->_countOfAcceptances, a8);
    objc_storeStrong((id *)&v36->_countOfDocScan, a9);
    objc_storeStrong((id *)&v36->_countOfInlineDrawingV1, a10);
    objc_storeStrong((id *)&v36->_countOfInlineDrawingV2, a11);
    objc_storeStrong((id *)&v36->_countOfFullscreenDrawing, a12);
    objc_storeStrong((id *)&v36->_countOfTables, a13);
    objc_storeStrong((id *)&v36->_countOfAttachmentOther, a14);
    objc_storeStrong((id *)&v36->_hasChecklist, a15);
    objc_storeStrong((id *)&v36->_isPinned, a16);
    objc_storeStrong((id *)&v36->_isLocked, a17);
    objc_storeStrong((id *)&v36->_charLength, a18);
    objc_storeStrong((id *)&v36->_creationDate, a19);
    objc_storeStrong((id *)&v36->_countOfInlineDrawingV1PencilStrokes, a20);
    objc_storeStrong((id *)&v36->_countOfInlineDrawingV1FingerStrokes, a21);
    objc_storeStrong((id *)&v36->_countOfInlineDrawingV2PencilStrokes, a22);
    objc_storeStrong((id *)&v36->_countOfInlineDrawingV2FingerStrokes, a23);
    objc_storeStrong((id *)&v36->_countOfFullscreenDrawingStrokes, a24);
  }

  return v36;
}

+ (NSString)dataName
{
  return (NSString *)@"NoteSnapshotItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v72[22] = *MEMORY[0x1E4F143B8];
  v71[0] = @"noteID";
  v70 = [(ICASNoteSnapshotItemData *)self noteID];
  if (v70)
  {
    uint64_t v3 = [(ICASNoteSnapshotItemData *)self noteID];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  v69 = (void *)v3;
  v72[0] = v3;
  v71[1] = @"noteType";
  v68 = [(ICASNoteSnapshotItemData *)self noteType];
  if (v68)
  {
    uint64_t v4 = [(ICASNoteSnapshotItemData *)self noteType];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v67 = (void *)v4;
  v72[1] = v4;
  v71[2] = @"collaborationStatus";
  v66 = [(ICASNoteSnapshotItemData *)self collaborationStatus];
  if (v66)
  {
    uint64_t v5 = [(ICASNoteSnapshotItemData *)self collaborationStatus];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  v65 = (void *)v5;
  v72[2] = v5;
  v71[3] = @"collaborationType";
  v64 = [(ICASNoteSnapshotItemData *)self collaborationType];
  if (v64)
  {
    uint64_t v6 = [(ICASNoteSnapshotItemData *)self collaborationType];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  v63 = (void *)v6;
  v72[3] = v6;
  v71[4] = @"countOfInvitees";
  v62 = [(ICASNoteSnapshotItemData *)self countOfInvitees];
  if (v62)
  {
    uint64_t v7 = [(ICASNoteSnapshotItemData *)self countOfInvitees];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v61 = (void *)v7;
  v72[4] = v7;
  v71[5] = @"countOfAcceptances";
  v60 = [(ICASNoteSnapshotItemData *)self countOfAcceptances];
  if (v60)
  {
    uint64_t v8 = [(ICASNoteSnapshotItemData *)self countOfAcceptances];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  v59 = (void *)v8;
  v72[5] = v8;
  v71[6] = @"countOfDocScan";
  objc_super v58 = [(ICASNoteSnapshotItemData *)self countOfDocScan];
  if (v58)
  {
    uint64_t v9 = [(ICASNoteSnapshotItemData *)self countOfDocScan];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  id v57 = (void *)v9;
  v72[6] = v9;
  v71[7] = @"countOfInlineDrawingV1";
  id v56 = [(ICASNoteSnapshotItemData *)self countOfInlineDrawingV1];
  if (v56)
  {
    uint64_t v10 = [(ICASNoteSnapshotItemData *)self countOfInlineDrawingV1];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  id v55 = (void *)v10;
  v72[7] = v10;
  v71[8] = @"countOfInlineDrawingV2";
  id v54 = [(ICASNoteSnapshotItemData *)self countOfInlineDrawingV2];
  if (v54)
  {
    uint64_t v11 = [(ICASNoteSnapshotItemData *)self countOfInlineDrawingV2];
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  id v53 = (void *)v11;
  v72[8] = v11;
  v71[9] = @"countOfFullscreenDrawing";
  id v52 = [(ICASNoteSnapshotItemData *)self countOfFullscreenDrawing];
  if (v52)
  {
    uint64_t v12 = [(ICASNoteSnapshotItemData *)self countOfFullscreenDrawing];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  id v51 = (void *)v12;
  v72[9] = v12;
  v71[10] = @"countOfTables";
  id v50 = [(ICASNoteSnapshotItemData *)self countOfTables];
  if (v50)
  {
    uint64_t v13 = [(ICASNoteSnapshotItemData *)self countOfTables];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v49 = (void *)v13;
  v72[10] = v13;
  v71[11] = @"countOfAttachmentOther";
  id v48 = [(ICASNoteSnapshotItemData *)self countOfAttachmentOther];
  if (v48)
  {
    uint64_t v14 = [(ICASNoteSnapshotItemData *)self countOfAttachmentOther];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
  }
  id v47 = (void *)v14;
  v72[11] = v14;
  v71[12] = @"hasChecklist";
  id v46 = [(ICASNoteSnapshotItemData *)self hasChecklist];
  if (v46)
  {
    uint64_t v15 = [(ICASNoteSnapshotItemData *)self hasChecklist];
  }
  else
  {
    uint64_t v15 = objc_opt_new();
  }
  id v45 = (void *)v15;
  v72[12] = v15;
  v71[13] = @"isPinned";
  id v44 = [(ICASNoteSnapshotItemData *)self isPinned];
  if (v44)
  {
    uint64_t v16 = [(ICASNoteSnapshotItemData *)self isPinned];
  }
  else
  {
    uint64_t v16 = objc_opt_new();
  }
  id v43 = (void *)v16;
  v72[13] = v16;
  v71[14] = @"isLocked";
  id v42 = [(ICASNoteSnapshotItemData *)self isLocked];
  if (v42)
  {
    uint64_t v17 = [(ICASNoteSnapshotItemData *)self isLocked];
  }
  else
  {
    uint64_t v17 = objc_opt_new();
  }
  v41 = (void *)v17;
  v72[14] = v17;
  v71[15] = @"charLength";
  id v40 = [(ICASNoteSnapshotItemData *)self charLength];
  if (v40)
  {
    uint64_t v18 = [(ICASNoteSnapshotItemData *)self charLength];
  }
  else
  {
    uint64_t v18 = objc_opt_new();
  }
  id v39 = (void *)v18;
  v72[15] = v18;
  v71[16] = @"creationDate";
  v38 = [(ICASNoteSnapshotItemData *)self creationDate];
  if (v38)
  {
    uint64_t v19 = [(ICASNoteSnapshotItemData *)self creationDate];
  }
  else
  {
    uint64_t v19 = objc_opt_new();
  }
  v37 = (void *)v19;
  v72[16] = v19;
  v71[17] = @"countOfInlineDrawingV1PencilStrokes";
  v20 = [(ICASNoteSnapshotItemData *)self countOfInlineDrawingV1PencilStrokes];
  if (v20)
  {
    uint64_t v21 = [(ICASNoteSnapshotItemData *)self countOfInlineDrawingV1PencilStrokes];
  }
  else
  {
    uint64_t v21 = objc_opt_new();
  }
  v22 = (void *)v21;
  v72[17] = v21;
  v71[18] = @"countOfInlineDrawingV1FingerStrokes";
  v23 = [(ICASNoteSnapshotItemData *)self countOfInlineDrawingV1FingerStrokes];
  if (v23)
  {
    uint64_t v24 = [(ICASNoteSnapshotItemData *)self countOfInlineDrawingV1FingerStrokes];
  }
  else
  {
    uint64_t v24 = objc_opt_new();
  }
  v25 = (void *)v24;
  v72[18] = v24;
  v71[19] = @"countOfInlineDrawingV2PencilStrokes";
  v26 = [(ICASNoteSnapshotItemData *)self countOfInlineDrawingV2PencilStrokes];
  if (v26)
  {
    uint64_t v27 = [(ICASNoteSnapshotItemData *)self countOfInlineDrawingV2PencilStrokes];
  }
  else
  {
    uint64_t v27 = objc_opt_new();
  }
  v28 = (void *)v27;
  v72[19] = v27;
  v71[20] = @"countOfInlineDrawingV2FingerStrokes";
  id v29 = [(ICASNoteSnapshotItemData *)self countOfInlineDrawingV2FingerStrokes];
  if (v29)
  {
    uint64_t v30 = [(ICASNoteSnapshotItemData *)self countOfInlineDrawingV2FingerStrokes];
  }
  else
  {
    uint64_t v30 = objc_opt_new();
  }
  id v31 = (void *)v30;
  v72[20] = v30;
  v71[21] = @"countOfFullscreenDrawingStrokes";
  id v32 = [(ICASNoteSnapshotItemData *)self countOfFullscreenDrawingStrokes];
  if (v32)
  {
    uint64_t v33 = [(ICASNoteSnapshotItemData *)self countOfFullscreenDrawingStrokes];
  }
  else
  {
    uint64_t v33 = objc_opt_new();
  }
  id v34 = (void *)v33;
  v72[21] = v33;
  id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:22];

  return v36;
}

- (NSString)noteID
{
  return self->_noteID;
}

- (ICASNoteType)noteType
{
  return self->_noteType;
}

- (ICASCollaborationStatus)collaborationStatus
{
  return self->_collaborationStatus;
}

- (ICASCollaborationType)collaborationType
{
  return self->_collaborationType;
}

- (NSNumber)countOfInvitees
{
  return self->_countOfInvitees;
}

- (NSNumber)countOfAcceptances
{
  return self->_countOfAcceptances;
}

- (NSNumber)countOfDocScan
{
  return self->_countOfDocScan;
}

- (NSNumber)countOfInlineDrawingV1
{
  return self->_countOfInlineDrawingV1;
}

- (NSNumber)countOfInlineDrawingV2
{
  return self->_countOfInlineDrawingV2;
}

- (NSNumber)countOfFullscreenDrawing
{
  return self->_countOfFullscreenDrawing;
}

- (NSNumber)countOfTables
{
  return self->_countOfTables;
}

- (NSNumber)countOfAttachmentOther
{
  return self->_countOfAttachmentOther;
}

- (NSNumber)hasChecklist
{
  return self->_hasChecklist;
}

- (NSNumber)isPinned
{
  return self->_isPinned;
}

- (NSNumber)isLocked
{
  return self->_isLocked;
}

- (NSNumber)charLength
{
  return self->_charLength;
}

- (NSNumber)creationDate
{
  return self->_creationDate;
}

- (NSNumber)countOfInlineDrawingV1PencilStrokes
{
  return self->_countOfInlineDrawingV1PencilStrokes;
}

- (NSNumber)countOfInlineDrawingV1FingerStrokes
{
  return self->_countOfInlineDrawingV1FingerStrokes;
}

- (NSNumber)countOfInlineDrawingV2PencilStrokes
{
  return self->_countOfInlineDrawingV2PencilStrokes;
}

- (NSNumber)countOfInlineDrawingV2FingerStrokes
{
  return self->_countOfInlineDrawingV2FingerStrokes;
}

- (NSNumber)countOfFullscreenDrawingStrokes
{
  return self->_countOfFullscreenDrawingStrokes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfFullscreenDrawingStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV2FingerStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV2PencilStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV1FingerStrokes, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV1PencilStrokes, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_charLength, 0);
  objc_storeStrong((id *)&self->_isLocked, 0);
  objc_storeStrong((id *)&self->_isPinned, 0);
  objc_storeStrong((id *)&self->_hasChecklist, 0);
  objc_storeStrong((id *)&self->_countOfAttachmentOther, 0);
  objc_storeStrong((id *)&self->_countOfTables, 0);
  objc_storeStrong((id *)&self->_countOfFullscreenDrawing, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV2, 0);
  objc_storeStrong((id *)&self->_countOfInlineDrawingV1, 0);
  objc_storeStrong((id *)&self->_countOfDocScan, 0);
  objc_storeStrong((id *)&self->_countOfAcceptances, 0);
  objc_storeStrong((id *)&self->_countOfInvitees, 0);
  objc_storeStrong((id *)&self->_collaborationType, 0);
  objc_storeStrong((id *)&self->_collaborationStatus, 0);
  objc_storeStrong((id *)&self->_noteType, 0);
  objc_storeStrong((id *)&self->_noteID, 0);
}

@end