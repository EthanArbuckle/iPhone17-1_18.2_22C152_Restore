@interface ICASAccountNotesTwoFactorItemData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASAccountNotesTwoFactorItemData)initWithTotalCountOfNotesWithCollabAndDocScan:(id)a3 totalCountOfNotesWithCollabAndInlineDrawingV1:(id)a4 totalCountOfNotesWithCollabAndInlineDrawingV2:(id)a5 totalCountOfNotesWithCollabAndFullscreenDrawing:(id)a6 totalCountOfNotesWithCollabAndTables:(id)a7 totalCountOfNotesWithCollabAndOtherAttachments:(id)a8 totalCountOfNotesWithCollabAndChecklist:(id)a9 totalCountOfNotesWithCollabAndIsPinned:(id)a10 totalCountOfNotesWithDocScanAndInlineDrawingV1:(id)a11 totalCountOfNotesWithDocScanAndInlineDrawingV2:(id)a12 totalCountOfNotesWithDocScanAndFullscreenDrawing:(id)a13 totalCountOfNotesWithDocScanAndTables:(id)a14 totalCountOfNotesWithDocScanAndOtherAttachments:(id)a15 totalCountOfNotesWithDocScanAndChecklist:(id)a16 totalCountOfNotesWithDocScanAndIsPinned:(id)a17 totalCountOfNotesWithDocScanAndIsLocked:(id)a18 totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2:(id)a19 totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing:(id)a20 totalCountOfNotesWithInlineDrawingV1AndTables:(id)a21 totalCountOfNotesWithInlineDrawingV1AndOtherAttachments:(id)a22 totalCountOfNotesWithInlineDrawingV1AndChecklist:(id)a23 totalCountOfNotesWithInlineDrawingV1AndIsPinned:(id)a24 totalCountOfNotesWithInlineDrawingV1AndIsLocked:(id)a25 totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing:(id)a26 totalCountOfNotesWithInlineDrawingV2AndTables:(id)a27 totalCountOfNotesWithInlineDrawingV2AndOtherAttachments:(id)a28 totalCountOfNotesWithInlineDrawingV2AndChecklist:(id)a29 totalCountOfNotesWithInlineDrawingV2AndIsPinned:(id)a30 totalCountOfNotesWithInlineDrawingV2AndIsLocked:(id)a31 totalCountOfNotesWithFullscreenDrawingAndTables:(id)a32 totalCountOfNotesWithFullscreenDrawingAndOtherAttachments:(id)a33 totalCountOfNotesWithFullscreenDrawingAndChecklist:(id)a34 totalCountOfNotesWithFullscreenDrawingAndIsPinned:(id)a35 totalCountOfNotesWithFullscreenDrawingAndIsLocked:(id)a36 totalCountOfNotesWithTablesAndOtherAttachments:(id)a37 totalCountOfNotesWithTablesAndChecklist:(id)a38 totalCountOfNotesWithTablesAndIsPinned:(id)a39 totalCountOfNotesWithTablesAndIsLocked:(id)a40 totalCountOfNotesWithOtherAttachmentsAndChecklist:(id)a41 totalCountOfNotesWithOtherAttachmentsAndIsPinned:(id)a42 totalCountOfNotesWithOtherAttachmentsAndIsLocked:(id)a43 totalCountOfNotesWithChecklistAndIsPinned:(id)a44 totalCountOfNotesIsPinnedAndIsLocked:(id)a45;
- (NSNumber)totalCountOfNotesIsPinnedAndIsLocked;
- (NSNumber)totalCountOfNotesWithChecklistAndIsPinned;
- (NSNumber)totalCountOfNotesWithCollabAndChecklist;
- (NSNumber)totalCountOfNotesWithCollabAndDocScan;
- (NSNumber)totalCountOfNotesWithCollabAndFullscreenDrawing;
- (NSNumber)totalCountOfNotesWithCollabAndInlineDrawingV1;
- (NSNumber)totalCountOfNotesWithCollabAndInlineDrawingV2;
- (NSNumber)totalCountOfNotesWithCollabAndIsPinned;
- (NSNumber)totalCountOfNotesWithCollabAndOtherAttachments;
- (NSNumber)totalCountOfNotesWithCollabAndTables;
- (NSNumber)totalCountOfNotesWithDocScanAndChecklist;
- (NSNumber)totalCountOfNotesWithDocScanAndFullscreenDrawing;
- (NSNumber)totalCountOfNotesWithDocScanAndInlineDrawingV1;
- (NSNumber)totalCountOfNotesWithDocScanAndInlineDrawingV2;
- (NSNumber)totalCountOfNotesWithDocScanAndIsLocked;
- (NSNumber)totalCountOfNotesWithDocScanAndIsPinned;
- (NSNumber)totalCountOfNotesWithDocScanAndOtherAttachments;
- (NSNumber)totalCountOfNotesWithDocScanAndTables;
- (NSNumber)totalCountOfNotesWithFullscreenDrawingAndChecklist;
- (NSNumber)totalCountOfNotesWithFullscreenDrawingAndIsLocked;
- (NSNumber)totalCountOfNotesWithFullscreenDrawingAndIsPinned;
- (NSNumber)totalCountOfNotesWithFullscreenDrawingAndOtherAttachments;
- (NSNumber)totalCountOfNotesWithFullscreenDrawingAndTables;
- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndChecklist;
- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing;
- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2;
- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndIsLocked;
- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndIsPinned;
- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndOtherAttachments;
- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndTables;
- (NSNumber)totalCountOfNotesWithInlineDrawingV2AndChecklist;
- (NSNumber)totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing;
- (NSNumber)totalCountOfNotesWithInlineDrawingV2AndIsLocked;
- (NSNumber)totalCountOfNotesWithInlineDrawingV2AndIsPinned;
- (NSNumber)totalCountOfNotesWithInlineDrawingV2AndOtherAttachments;
- (NSNumber)totalCountOfNotesWithInlineDrawingV2AndTables;
- (NSNumber)totalCountOfNotesWithOtherAttachmentsAndChecklist;
- (NSNumber)totalCountOfNotesWithOtherAttachmentsAndIsLocked;
- (NSNumber)totalCountOfNotesWithOtherAttachmentsAndIsPinned;
- (NSNumber)totalCountOfNotesWithTablesAndChecklist;
- (NSNumber)totalCountOfNotesWithTablesAndIsLocked;
- (NSNumber)totalCountOfNotesWithTablesAndIsPinned;
- (NSNumber)totalCountOfNotesWithTablesAndOtherAttachments;
- (id)toDict;
@end

@implementation ICASAccountNotesTwoFactorItemData

- (ICASAccountNotesTwoFactorItemData)initWithTotalCountOfNotesWithCollabAndDocScan:(id)a3 totalCountOfNotesWithCollabAndInlineDrawingV1:(id)a4 totalCountOfNotesWithCollabAndInlineDrawingV2:(id)a5 totalCountOfNotesWithCollabAndFullscreenDrawing:(id)a6 totalCountOfNotesWithCollabAndTables:(id)a7 totalCountOfNotesWithCollabAndOtherAttachments:(id)a8 totalCountOfNotesWithCollabAndChecklist:(id)a9 totalCountOfNotesWithCollabAndIsPinned:(id)a10 totalCountOfNotesWithDocScanAndInlineDrawingV1:(id)a11 totalCountOfNotesWithDocScanAndInlineDrawingV2:(id)a12 totalCountOfNotesWithDocScanAndFullscreenDrawing:(id)a13 totalCountOfNotesWithDocScanAndTables:(id)a14 totalCountOfNotesWithDocScanAndOtherAttachments:(id)a15 totalCountOfNotesWithDocScanAndChecklist:(id)a16 totalCountOfNotesWithDocScanAndIsPinned:(id)a17 totalCountOfNotesWithDocScanAndIsLocked:(id)a18 totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2:(id)a19 totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing:(id)a20 totalCountOfNotesWithInlineDrawingV1AndTables:(id)a21 totalCountOfNotesWithInlineDrawingV1AndOtherAttachments:(id)a22 totalCountOfNotesWithInlineDrawingV1AndChecklist:(id)a23 totalCountOfNotesWithInlineDrawingV1AndIsPinned:(id)a24 totalCountOfNotesWithInlineDrawingV1AndIsLocked:(id)a25 totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing:(id)a26 totalCountOfNotesWithInlineDrawingV2AndTables:(id)a27 totalCountOfNotesWithInlineDrawingV2AndOtherAttachments:(id)a28 totalCountOfNotesWithInlineDrawingV2AndChecklist:(id)a29 totalCountOfNotesWithInlineDrawingV2AndIsPinned:(id)a30 totalCountOfNotesWithInlineDrawingV2AndIsLocked:(id)a31 totalCountOfNotesWithFullscreenDrawingAndTables:(id)a32 totalCountOfNotesWithFullscreenDrawingAndOtherAttachments:(id)a33 totalCountOfNotesWithFullscreenDrawingAndChecklist:(id)a34 totalCountOfNotesWithFullscreenDrawingAndIsPinned:(id)a35 totalCountOfNotesWithFullscreenDrawingAndIsLocked:(id)a36 totalCountOfNotesWithTablesAndOtherAttachments:(id)a37 totalCountOfNotesWithTablesAndChecklist:(id)a38 totalCountOfNotesWithTablesAndIsPinned:(id)a39 totalCountOfNotesWithTablesAndIsLocked:(id)a40 totalCountOfNotesWithOtherAttachmentsAndChecklist:(id)a41 totalCountOfNotesWithOtherAttachmentsAndIsPinned:(id)a42 totalCountOfNotesWithOtherAttachmentsAndIsLocked:(id)a43 totalCountOfNotesWithChecklistAndIsPinned:(id)a44 totalCountOfNotesIsPinnedAndIsLocked:(id)a45
{
  id v96 = a3;
  id v95 = a4;
  id v94 = a5;
  id v93 = a6;
  id v92 = a7;
  id v91 = a8;
  id v90 = a9;
  id v89 = a10;
  id v88 = a11;
  id v87 = a12;
  id v86 = a13;
  id v85 = a14;
  id v84 = a15;
  id v83 = a16;
  id v82 = a17;
  id v81 = a18;
  id v80 = a19;
  id v79 = a20;
  id v78 = a21;
  id v77 = a22;
  id v76 = a23;
  id v75 = a24;
  id v74 = a25;
  id v73 = a26;
  id v72 = a27;
  id v71 = a28;
  id v49 = a29;
  id v64 = a30;
  id v50 = a31;
  id v51 = a32;
  id v69 = a33;
  id v67 = a34;
  id v52 = a35;
  id v53 = a36;
  id v65 = a37;
  id v70 = a38;
  id v68 = a39;
  id v66 = a40;
  id v63 = a41;
  id v62 = a42;
  id v61 = a43;
  id v60 = a44;
  id v59 = a45;
  v98.receiver = self;
  v98.super_class = (Class)ICASAccountNotesTwoFactorItemData;
  v54 = [(ICASAccountNotesTwoFactorItemData *)&v98 init];
  v55 = v54;
  if (v54)
  {
    objc_storeStrong((id *)&v54->_totalCountOfNotesWithCollabAndDocScan, a3);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithCollabAndInlineDrawingV1, a4);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithCollabAndInlineDrawingV2, a5);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithCollabAndFullscreenDrawing, a6);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithCollabAndTables, a7);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithCollabAndOtherAttachments, a8);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithCollabAndChecklist, a9);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithCollabAndIsPinned, a10);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithDocScanAndInlineDrawingV1, a11);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithDocScanAndInlineDrawingV2, a12);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithDocScanAndFullscreenDrawing, a13);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithDocScanAndTables, a14);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithDocScanAndOtherAttachments, a15);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithDocScanAndChecklist, a16);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithDocScanAndIsPinned, a17);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithDocScanAndIsLocked, a18);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2, a19);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing, a20);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV1AndTables, a21);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV1AndOtherAttachments, a22);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV1AndChecklist, a23);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV1AndIsPinned, a24);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV1AndIsLocked, a25);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing, a26);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV2AndTables, a27);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV2AndOtherAttachments, a28);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV2AndChecklist, a29);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV2AndIsPinned, a30);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithInlineDrawingV2AndIsLocked, a31);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithFullscreenDrawingAndTables, a32);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithFullscreenDrawingAndOtherAttachments, a33);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithFullscreenDrawingAndChecklist, a34);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithFullscreenDrawingAndIsPinned, a35);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithFullscreenDrawingAndIsLocked, a36);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithTablesAndOtherAttachments, a37);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithTablesAndChecklist, a38);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithTablesAndIsPinned, a39);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithTablesAndIsLocked, a40);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithOtherAttachmentsAndChecklist, a41);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithOtherAttachmentsAndIsPinned, a42);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithOtherAttachmentsAndIsLocked, a43);
    objc_storeStrong((id *)&v55->_totalCountOfNotesWithChecklistAndIsPinned, a44);
    objc_storeStrong((id *)&v55->_totalCountOfNotesIsPinnedAndIsLocked, a45);
  }

  return v55;
}

+ (NSString)dataName
{
  return (NSString *)@"AccountNotesTwoFactorItemData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v135[43] = *MEMORY[0x1E4F143B8];
  v134[0] = @"totalCountOfNotesWithCollabAndDocScan";
  v133 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndDocScan];
  if (v133)
  {
    uint64_t v3 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndDocScan];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  v132 = (void *)v3;
  v135[0] = v3;
  v134[1] = @"totalCountOfNotesWithCollabAndInlineDrawingV1";
  v131 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndInlineDrawingV1];
  if (v131)
  {
    uint64_t v4 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndInlineDrawingV1];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v130 = (void *)v4;
  v135[1] = v4;
  v134[2] = @"totalCountOfNotesWithCollabAndInlineDrawingV2";
  v129 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndInlineDrawingV2];
  if (v129)
  {
    uint64_t v5 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndInlineDrawingV2];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  v128 = (void *)v5;
  v135[2] = v5;
  v134[3] = @"totalCountOfNotesWithCollabAndFullscreenDrawing";
  v127 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndFullscreenDrawing];
  if (v127)
  {
    uint64_t v6 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndFullscreenDrawing];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  v126 = (void *)v6;
  v135[3] = v6;
  v134[4] = @"totalCountOfNotesWithCollabAndTables";
  v125 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndTables];
  if (v125)
  {
    uint64_t v7 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndTables];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v124 = (void *)v7;
  v135[4] = v7;
  v134[5] = @"totalCountOfNotesWithCollabAndOtherAttachments";
  v123 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndOtherAttachments];
  if (v123)
  {
    uint64_t v8 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndOtherAttachments];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  v122 = (void *)v8;
  v135[5] = v8;
  v134[6] = @"totalCountOfNotesWithCollabAndChecklist";
  v121 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndChecklist];
  if (v121)
  {
    uint64_t v9 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndChecklist];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  v120 = (void *)v9;
  v135[6] = v9;
  v134[7] = @"totalCountOfNotesWithCollabAndIsPinned";
  v119 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndIsPinned];
  if (v119)
  {
    uint64_t v10 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithCollabAndIsPinned];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  v118 = (void *)v10;
  v135[7] = v10;
  v134[8] = @"totalCountOfNotesWithDocScanAndInlineDrawingV1";
  v117 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndInlineDrawingV1];
  if (v117)
  {
    uint64_t v11 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndInlineDrawingV1];
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  v116 = (void *)v11;
  v135[8] = v11;
  v134[9] = @"totalCountOfNotesWithDocScanAndInlineDrawingV2";
  v115 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndInlineDrawingV2];
  if (v115)
  {
    uint64_t v12 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndInlineDrawingV2];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  v114 = (void *)v12;
  v135[9] = v12;
  v134[10] = @"totalCountOfNotesWithDocScanAndFullscreenDrawing";
  v113 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndFullscreenDrawing];
  if (v113)
  {
    uint64_t v13 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndFullscreenDrawing];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  v112 = (void *)v13;
  v135[10] = v13;
  v134[11] = @"totalCountOfNotesWithDocScanAndTables";
  v111 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndTables];
  if (v111)
  {
    uint64_t v14 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndTables];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
  }
  v110 = (void *)v14;
  v135[11] = v14;
  v134[12] = @"totalCountOfNotesWithDocScanAndOtherAttachments";
  v109 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndOtherAttachments];
  if (v109)
  {
    uint64_t v15 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndOtherAttachments];
  }
  else
  {
    uint64_t v15 = objc_opt_new();
  }
  v108 = (void *)v15;
  v135[12] = v15;
  v134[13] = @"totalCountOfNotesWithDocScanAndChecklist";
  v107 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndChecklist];
  if (v107)
  {
    uint64_t v16 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndChecklist];
  }
  else
  {
    uint64_t v16 = objc_opt_new();
  }
  v106 = (void *)v16;
  v135[13] = v16;
  v134[14] = @"totalCountOfNotesWithDocScanAndIsPinned";
  v105 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndIsPinned];
  if (v105)
  {
    uint64_t v17 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndIsPinned];
  }
  else
  {
    uint64_t v17 = objc_opt_new();
  }
  v104 = (void *)v17;
  v135[14] = v17;
  v134[15] = @"totalCountOfNotesWithDocScanAndIsLocked";
  v103 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndIsLocked];
  if (v103)
  {
    uint64_t v18 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithDocScanAndIsLocked];
  }
  else
  {
    uint64_t v18 = objc_opt_new();
  }
  v102 = (void *)v18;
  v135[15] = v18;
  v134[16] = @"totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2";
  v101 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2];
  if (v101)
  {
    uint64_t v19 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2];
  }
  else
  {
    uint64_t v19 = objc_opt_new();
  }
  v100 = (void *)v19;
  v135[16] = v19;
  v134[17] = @"totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing";
  v99 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing];
  if (v99)
  {
    uint64_t v20 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing];
  }
  else
  {
    uint64_t v20 = objc_opt_new();
  }
  objc_super v98 = (void *)v20;
  v135[17] = v20;
  v134[18] = @"totalCountOfNotesWithInlineDrawingV1AndTables";
  v97 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndTables];
  if (v97)
  {
    uint64_t v21 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndTables];
  }
  else
  {
    uint64_t v21 = objc_opt_new();
  }
  id v96 = (void *)v21;
  v135[18] = v21;
  v134[19] = @"totalCountOfNotesWithInlineDrawingV1AndOtherAttachments";
  id v95 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndOtherAttachments];
  if (v95)
  {
    uint64_t v22 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndOtherAttachments];
  }
  else
  {
    uint64_t v22 = objc_opt_new();
  }
  id v94 = (void *)v22;
  v135[19] = v22;
  v134[20] = @"totalCountOfNotesWithInlineDrawingV1AndChecklist";
  id v93 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndChecklist];
  if (v93)
  {
    uint64_t v23 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndChecklist];
  }
  else
  {
    uint64_t v23 = objc_opt_new();
  }
  id v92 = (void *)v23;
  v135[20] = v23;
  v134[21] = @"totalCountOfNotesWithInlineDrawingV1AndIsPinned";
  id v91 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndIsPinned];
  if (v91)
  {
    uint64_t v24 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndIsPinned];
  }
  else
  {
    uint64_t v24 = objc_opt_new();
  }
  id v90 = (void *)v24;
  v135[21] = v24;
  v134[22] = @"totalCountOfNotesWithInlineDrawingV1AndIsLocked";
  id v89 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndIsLocked];
  if (v89)
  {
    uint64_t v25 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV1AndIsLocked];
  }
  else
  {
    uint64_t v25 = objc_opt_new();
  }
  id v88 = (void *)v25;
  v135[22] = v25;
  v134[23] = @"totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing";
  id v87 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing];
  if (v87)
  {
    uint64_t v26 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing];
  }
  else
  {
    uint64_t v26 = objc_opt_new();
  }
  id v86 = (void *)v26;
  v135[23] = v26;
  v134[24] = @"totalCountOfNotesWithInlineDrawingV2AndTables";
  id v85 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV2AndTables];
  if (v85)
  {
    uint64_t v27 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV2AndTables];
  }
  else
  {
    uint64_t v27 = objc_opt_new();
  }
  id v84 = (void *)v27;
  v135[24] = v27;
  v134[25] = @"totalCountOfNotesWithInlineDrawingV2AndOtherAttachments";
  id v83 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV2AndOtherAttachments];
  if (v83)
  {
    uint64_t v28 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV2AndOtherAttachments];
  }
  else
  {
    uint64_t v28 = objc_opt_new();
  }
  id v82 = (void *)v28;
  v135[25] = v28;
  v134[26] = @"totalCountOfNotesWithInlineDrawingV2AndChecklist";
  id v81 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV2AndChecklist];
  if (v81)
  {
    uint64_t v29 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV2AndChecklist];
  }
  else
  {
    uint64_t v29 = objc_opt_new();
  }
  id v80 = (void *)v29;
  v135[26] = v29;
  v134[27] = @"totalCountOfNotesWithInlineDrawingV2AndIsPinned";
  id v79 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV2AndIsPinned];
  if (v79)
  {
    uint64_t v30 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV2AndIsPinned];
  }
  else
  {
    uint64_t v30 = objc_opt_new();
  }
  id v78 = (void *)v30;
  v135[27] = v30;
  v134[28] = @"totalCountOfNotesWithInlineDrawingV2AndIsLocked";
  id v77 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV2AndIsLocked];
  if (v77)
  {
    uint64_t v31 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithInlineDrawingV2AndIsLocked];
  }
  else
  {
    uint64_t v31 = objc_opt_new();
  }
  id v76 = (void *)v31;
  v135[28] = v31;
  v134[29] = @"totalCountOfNotesWithFullscreenDrawingAndTables";
  id v75 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithFullscreenDrawingAndTables];
  if (v75)
  {
    uint64_t v32 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithFullscreenDrawingAndTables];
  }
  else
  {
    uint64_t v32 = objc_opt_new();
  }
  id v74 = (void *)v32;
  v135[29] = v32;
  v134[30] = @"totalCountOfNotesWithFullscreenDrawingAndOtherAttachments";
  id v73 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithFullscreenDrawingAndOtherAttachments];
  if (v73)
  {
    uint64_t v33 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithFullscreenDrawingAndOtherAttachments];
  }
  else
  {
    uint64_t v33 = objc_opt_new();
  }
  id v72 = (void *)v33;
  v135[30] = v33;
  v134[31] = @"totalCountOfNotesWithFullscreenDrawingAndChecklist";
  id v71 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithFullscreenDrawingAndChecklist];
  if (v71)
  {
    uint64_t v34 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithFullscreenDrawingAndChecklist];
  }
  else
  {
    uint64_t v34 = objc_opt_new();
  }
  id v70 = (void *)v34;
  v135[31] = v34;
  v134[32] = @"totalCountOfNotesWithFullscreenDrawingAndIsPinned";
  id v69 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithFullscreenDrawingAndIsPinned];
  if (v69)
  {
    uint64_t v35 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithFullscreenDrawingAndIsPinned];
  }
  else
  {
    uint64_t v35 = objc_opt_new();
  }
  id v68 = (void *)v35;
  v135[32] = v35;
  v134[33] = @"totalCountOfNotesWithFullscreenDrawingAndIsLocked";
  id v67 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithFullscreenDrawingAndIsLocked];
  if (v67)
  {
    uint64_t v36 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithFullscreenDrawingAndIsLocked];
  }
  else
  {
    uint64_t v36 = objc_opt_new();
  }
  id v66 = (void *)v36;
  v135[33] = v36;
  v134[34] = @"totalCountOfNotesWithTablesAndOtherAttachments";
  id v65 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithTablesAndOtherAttachments];
  if (v65)
  {
    uint64_t v37 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithTablesAndOtherAttachments];
  }
  else
  {
    uint64_t v37 = objc_opt_new();
  }
  id v64 = (void *)v37;
  v135[34] = v37;
  v134[35] = @"totalCountOfNotesWithTablesAndChecklist";
  id v63 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithTablesAndChecklist];
  if (v63)
  {
    uint64_t v38 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithTablesAndChecklist];
  }
  else
  {
    uint64_t v38 = objc_opt_new();
  }
  id v62 = (void *)v38;
  v135[35] = v38;
  v134[36] = @"totalCountOfNotesWithTablesAndIsPinned";
  id v61 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithTablesAndIsPinned];
  if (v61)
  {
    uint64_t v39 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithTablesAndIsPinned];
  }
  else
  {
    uint64_t v39 = objc_opt_new();
  }
  id v60 = (void *)v39;
  v135[36] = v39;
  v134[37] = @"totalCountOfNotesWithTablesAndIsLocked";
  id v59 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithTablesAndIsLocked];
  if (v59)
  {
    uint64_t v40 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithTablesAndIsLocked];
  }
  else
  {
    uint64_t v40 = objc_opt_new();
  }
  v58 = (void *)v40;
  v135[37] = v40;
  v134[38] = @"totalCountOfNotesWithOtherAttachmentsAndChecklist";
  v41 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithOtherAttachmentsAndChecklist];
  if (v41)
  {
    uint64_t v42 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithOtherAttachmentsAndChecklist];
  }
  else
  {
    uint64_t v42 = objc_opt_new();
  }
  v43 = (void *)v42;
  v135[38] = v42;
  v134[39] = @"totalCountOfNotesWithOtherAttachmentsAndIsPinned";
  v44 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithOtherAttachmentsAndIsPinned];
  if (v44)
  {
    uint64_t v45 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithOtherAttachmentsAndIsPinned];
  }
  else
  {
    uint64_t v45 = objc_opt_new();
  }
  v46 = (void *)v45;
  v135[39] = v45;
  v134[40] = @"totalCountOfNotesWithOtherAttachmentsAndIsLocked";
  v47 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithOtherAttachmentsAndIsLocked];
  if (v47)
  {
    uint64_t v48 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithOtherAttachmentsAndIsLocked];
  }
  else
  {
    uint64_t v48 = objc_opt_new();
  }
  id v49 = (void *)v48;
  v135[40] = v48;
  v134[41] = @"totalCountOfNotesWithChecklistAndIsPinned";
  id v50 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithChecklistAndIsPinned];
  if (v50)
  {
    uint64_t v51 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesWithChecklistAndIsPinned];
  }
  else
  {
    uint64_t v51 = objc_opt_new();
  }
  id v52 = (void *)v51;
  v135[41] = v51;
  v134[42] = @"totalCountOfNotesIsPinnedAndIsLocked";
  id v53 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesIsPinnedAndIsLocked];
  if (v53)
  {
    uint64_t v54 = [(ICASAccountNotesTwoFactorItemData *)self totalCountOfNotesIsPinnedAndIsLocked];
  }
  else
  {
    uint64_t v54 = objc_opt_new();
  }
  v55 = (void *)v54;
  v135[42] = v54;
  id v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v135 forKeys:v134 count:43];

  return v57;
}

- (NSNumber)totalCountOfNotesWithCollabAndDocScan
{
  return self->_totalCountOfNotesWithCollabAndDocScan;
}

- (NSNumber)totalCountOfNotesWithCollabAndInlineDrawingV1
{
  return self->_totalCountOfNotesWithCollabAndInlineDrawingV1;
}

- (NSNumber)totalCountOfNotesWithCollabAndInlineDrawingV2
{
  return self->_totalCountOfNotesWithCollabAndInlineDrawingV2;
}

- (NSNumber)totalCountOfNotesWithCollabAndFullscreenDrawing
{
  return self->_totalCountOfNotesWithCollabAndFullscreenDrawing;
}

- (NSNumber)totalCountOfNotesWithCollabAndTables
{
  return self->_totalCountOfNotesWithCollabAndTables;
}

- (NSNumber)totalCountOfNotesWithCollabAndOtherAttachments
{
  return self->_totalCountOfNotesWithCollabAndOtherAttachments;
}

- (NSNumber)totalCountOfNotesWithCollabAndChecklist
{
  return self->_totalCountOfNotesWithCollabAndChecklist;
}

- (NSNumber)totalCountOfNotesWithCollabAndIsPinned
{
  return self->_totalCountOfNotesWithCollabAndIsPinned;
}

- (NSNumber)totalCountOfNotesWithDocScanAndInlineDrawingV1
{
  return self->_totalCountOfNotesWithDocScanAndInlineDrawingV1;
}

- (NSNumber)totalCountOfNotesWithDocScanAndInlineDrawingV2
{
  return self->_totalCountOfNotesWithDocScanAndInlineDrawingV2;
}

- (NSNumber)totalCountOfNotesWithDocScanAndFullscreenDrawing
{
  return self->_totalCountOfNotesWithDocScanAndFullscreenDrawing;
}

- (NSNumber)totalCountOfNotesWithDocScanAndTables
{
  return self->_totalCountOfNotesWithDocScanAndTables;
}

- (NSNumber)totalCountOfNotesWithDocScanAndOtherAttachments
{
  return self->_totalCountOfNotesWithDocScanAndOtherAttachments;
}

- (NSNumber)totalCountOfNotesWithDocScanAndChecklist
{
  return self->_totalCountOfNotesWithDocScanAndChecklist;
}

- (NSNumber)totalCountOfNotesWithDocScanAndIsPinned
{
  return self->_totalCountOfNotesWithDocScanAndIsPinned;
}

- (NSNumber)totalCountOfNotesWithDocScanAndIsLocked
{
  return self->_totalCountOfNotesWithDocScanAndIsLocked;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2
{
  return self->_totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing
{
  return self->_totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndTables
{
  return self->_totalCountOfNotesWithInlineDrawingV1AndTables;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndOtherAttachments
{
  return self->_totalCountOfNotesWithInlineDrawingV1AndOtherAttachments;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndChecklist
{
  return self->_totalCountOfNotesWithInlineDrawingV1AndChecklist;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndIsPinned
{
  return self->_totalCountOfNotesWithInlineDrawingV1AndIsPinned;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV1AndIsLocked
{
  return self->_totalCountOfNotesWithInlineDrawingV1AndIsLocked;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing
{
  return self->_totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV2AndTables
{
  return self->_totalCountOfNotesWithInlineDrawingV2AndTables;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV2AndOtherAttachments
{
  return self->_totalCountOfNotesWithInlineDrawingV2AndOtherAttachments;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV2AndChecklist
{
  return self->_totalCountOfNotesWithInlineDrawingV2AndChecklist;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV2AndIsPinned
{
  return self->_totalCountOfNotesWithInlineDrawingV2AndIsPinned;
}

- (NSNumber)totalCountOfNotesWithInlineDrawingV2AndIsLocked
{
  return self->_totalCountOfNotesWithInlineDrawingV2AndIsLocked;
}

- (NSNumber)totalCountOfNotesWithFullscreenDrawingAndTables
{
  return self->_totalCountOfNotesWithFullscreenDrawingAndTables;
}

- (NSNumber)totalCountOfNotesWithFullscreenDrawingAndOtherAttachments
{
  return self->_totalCountOfNotesWithFullscreenDrawingAndOtherAttachments;
}

- (NSNumber)totalCountOfNotesWithFullscreenDrawingAndChecklist
{
  return self->_totalCountOfNotesWithFullscreenDrawingAndChecklist;
}

- (NSNumber)totalCountOfNotesWithFullscreenDrawingAndIsPinned
{
  return self->_totalCountOfNotesWithFullscreenDrawingAndIsPinned;
}

- (NSNumber)totalCountOfNotesWithFullscreenDrawingAndIsLocked
{
  return self->_totalCountOfNotesWithFullscreenDrawingAndIsLocked;
}

- (NSNumber)totalCountOfNotesWithTablesAndOtherAttachments
{
  return self->_totalCountOfNotesWithTablesAndOtherAttachments;
}

- (NSNumber)totalCountOfNotesWithTablesAndChecklist
{
  return self->_totalCountOfNotesWithTablesAndChecklist;
}

- (NSNumber)totalCountOfNotesWithTablesAndIsPinned
{
  return self->_totalCountOfNotesWithTablesAndIsPinned;
}

- (NSNumber)totalCountOfNotesWithTablesAndIsLocked
{
  return self->_totalCountOfNotesWithTablesAndIsLocked;
}

- (NSNumber)totalCountOfNotesWithOtherAttachmentsAndChecklist
{
  return self->_totalCountOfNotesWithOtherAttachmentsAndChecklist;
}

- (NSNumber)totalCountOfNotesWithOtherAttachmentsAndIsPinned
{
  return self->_totalCountOfNotesWithOtherAttachmentsAndIsPinned;
}

- (NSNumber)totalCountOfNotesWithOtherAttachmentsAndIsLocked
{
  return self->_totalCountOfNotesWithOtherAttachmentsAndIsLocked;
}

- (NSNumber)totalCountOfNotesWithChecklistAndIsPinned
{
  return self->_totalCountOfNotesWithChecklistAndIsPinned;
}

- (NSNumber)totalCountOfNotesIsPinnedAndIsLocked
{
  return self->_totalCountOfNotesIsPinnedAndIsLocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountOfNotesIsPinnedAndIsLocked, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithChecklistAndIsPinned, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithOtherAttachmentsAndIsLocked, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithOtherAttachmentsAndIsPinned, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithOtherAttachmentsAndChecklist, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithTablesAndIsLocked, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithTablesAndIsPinned, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithTablesAndChecklist, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithTablesAndOtherAttachments, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithFullscreenDrawingAndIsLocked, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithFullscreenDrawingAndIsPinned, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithFullscreenDrawingAndChecklist, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithFullscreenDrawingAndOtherAttachments, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithFullscreenDrawingAndTables, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV2AndIsLocked, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV2AndIsPinned, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV2AndChecklist, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV2AndOtherAttachments, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV2AndTables, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV2AndFullscreenDrawing, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV1AndIsLocked, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV1AndIsPinned, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV1AndChecklist, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV1AndOtherAttachments, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV1AndTables, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV1AndFullscreenDrawing, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithInlineDrawingV1AndInlineDrawingV2, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithDocScanAndIsLocked, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithDocScanAndIsPinned, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithDocScanAndChecklist, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithDocScanAndOtherAttachments, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithDocScanAndTables, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithDocScanAndFullscreenDrawing, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithDocScanAndInlineDrawingV2, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithDocScanAndInlineDrawingV1, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithCollabAndIsPinned, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithCollabAndChecklist, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithCollabAndOtherAttachments, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithCollabAndTables, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithCollabAndFullscreenDrawing, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithCollabAndInlineDrawingV2, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithCollabAndInlineDrawingV1, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithCollabAndDocScan, 0);
}

@end