@interface ICASAccountSnapshotData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (NSArray)accountNotesTwoFactorSummary;
- (NSArray)accountSnapshotSummary;
- (NSArray)attachmentCountPerNoteHistogram;
- (NSArray)attachmentUTISummary;
- (NSArray)collabFoldersSummary;
- (NSArray)collabNotesSummary;
- (NSArray)collabOwnedRootFolderAcceptanceCountHistogram;
- (NSArray)collabOwnedRootFolderAcceptanceRatioHistogram;
- (NSArray)collabOwnedRootFolderInviteeCountHistogram;
- (NSArray)collabOwnedRootFolderNoReplyCountHistogram;
- (NSArray)collabOwnedSingleNoteAcceptanceCountHistogram;
- (NSArray)collabOwnedSingleNoteAcceptanceRatioHistogram;
- (NSArray)collabOwnedSingleNoteInviteeCountHistogram;
- (NSArray)collabOwnedSingleNoteNoReplyCountHistogram;
- (NSArray)collabRootFolderTotalNoteCountHistogram;
- (NSArray)deviceSnapshotSummary;
- (NSArray)distinctMentionCountPerNoteHistogram;
- (NSArray)distinctTagCountPerNoteHistogram;
- (NSArray)docScanPageCountHistogram;
- (NSArray)drawingCountPerNoteHistogram;
- (NSArray)folderDirectNoteCountHistogram;
- (NSArray)fullScreenDrawingStrokesCountPerNoteHistogram;
- (NSArray)fullscreenDrawingStrokeCountHistogram;
- (NSArray)inlineDrawingFingerStrokesCountPerNoteHistogram;
- (NSArray)inlineDrawingPencilStrokesCountPerNoteHistogram;
- (NSArray)inlineDrawingV1FingerStrokeCountHistogram;
- (NSArray)inlineDrawingV1FingerStrokeRatioHistogram;
- (NSArray)inlineDrawingV1PencilStrokeCountHistogram;
- (NSArray)inlineDrawingV1TotalStrokeCountHistogram;
- (NSArray)inlineDrawingV2FingerStrokeCountHistogram;
- (NSArray)inlineDrawingV2FingerStrokeRatioHistogram;
- (NSArray)inlineDrawingV2PencilStrokeCountHistogram;
- (NSArray)inlineDrawingV2TotalStrokeCountHistogram;
- (NSArray)lockedNotesSummary;
- (NSArray)mentionCountPerNoteHistogram;
- (NSArray)noteAttachmentSummary;
- (NSArray)noteCharCountHistogram;
- (NSArray)passwordProtectedNoteWeeklyAgeHistogram;
- (NSArray)scrapPaperAttachmentSummary;
- (NSArray)smartFoldersSummary;
- (NSArray)tableCellCountHistogram;
- (NSArray)tableColumnCountHistogram;
- (NSArray)tableRowCountHistogram;
- (NSArray)tagCountPerNoteHistogram;
- (NSArray)topLevelFolderTotalNoteCountHistogram;
- (NSArray)totalStrokesCountPerNoteHistogram;
- (NSArray)userSnapshotSummary;
- (NSNumber)totalChecklistCount;
- (NSNumber)totalCountOfCollaboratedScrapPapers;
- (NSNumber)totalCountOfLockedNotes;
- (NSNumber)totalCountOfLockedScrapPapers;
- (NSNumber)totalCountOfNotesWithCollapsedSections;
- (NSNumber)totalCountOfNotesWithMathUsage;
- (NSNumber)totalCountOfNotesWithMentions;
- (NSNumber)totalCountOfNotesWithTags;
- (NSNumber)totalCountOfPinnedNotes;
- (NSNumber)totalCountOfPinnedScrapPapers;
- (NSNumber)totalCountOfScrapPapersWithMentions;
- (NSNumber)totalCountOfScrapPapersWithTags;
- (NSNumber)totalFolderCount;
- (NSNumber)totalNoteCount;
- (NSNumber)totalNotesWithChecklistCount;
- (NSNumber)totalScrapPaperCount;
- (NSNumber)totalSmartFolderCount;
- (NSNumber)userStartMonth;
- (NSNumber)userStartYear;
- (NSString)saltVersion;
- (id)initWithUserStartMonth:(void *)a3 userStartYear:(void *)a4 saltVersion:(void *)a5 accountSnapshotSummary:(void *)a6 accountNotesTwoFactorSummary:(void *)a7 collabNotesSummary:(void *)a8 collabFoldersSummary:(id)a9 noteAttachmentSummary:(id)a10 scrapPaperAttachmentSummary:(id)a11 lockedNotesSummary:(id)a12 smartFoldersSummary:(id)a13 totalNoteCount:(id)a14 totalFolderCount:(id)a15 totalSmartFolderCount:(id)a16 totalChecklistCount:(id)a17 totalNotesWithChecklistCount:(id)a18 totalCountOfPinnedNotes:(id)a19 totalCountOfLockedNotes:(id)a20 deviceSnapshotSummary:(id)a21 userSnapshotSummary:(id)a22 attachmentUTISummary:(id)a23 folderDirectNoteCountHistogram:(id)a24 collabRootFolderTotalNoteCountHistogram:(id)a25 docScanPageCountHistogram:(id)a26 collabOwnedRootFolderInviteeCountHistogram:(id)a27 collabOwnedRootFolderAcceptanceCountHistogram:(id)a28 collabOwnedRootFolderNoReplyCountHistogram:(id)a29 collabOwnedRootFolderAcceptanceRatioHistogram:(id)a30 collabOwnedSingleNoteInviteeCountHistogram:(id)a31 collabOwnedSingleNoteAcceptanceCountHistogram:(id)a32 collabOwnedSingleNoteNoReplyCountHistogram:(id)a33 collabOwnedSingleNoteAcceptanceRatioHistogram:(id)a34 noteCharCountHistogram:(id)a35 inlineDrawingV1TotalStrokeCountHistogram:(id)a36 inlineDrawingV1PencilStrokeCountHistogram:(id)a37 inlineDrawingV1FingerStrokeCountHistogram:(id)a38 inlineDrawingV1FingerStrokeRatioHistogram:(id)a39 inlineDrawingV2TotalStrokeCountHistogram:(id)a40 inlineDrawingV2PencilStrokeCountHistogram:(id)a41 inlineDrawingV2FingerStrokeCountHistogram:(id)a42 inlineDrawingV2FingerStrokeRatioHistogram:(id)a43 fullscreenDrawingStrokeCountHistogram:(id)a44 tableRowCountHistogram:(id)a45 tableColumnCountHistogram:(id)a46 tableCellCountHistogram:(id)a47 passwordProtectedNoteWeeklyAgeHistogram:(id)a48 topLevelFolderTotalNoteCountHistogram:(id)a49 attachmentCountPerNoteHistogram:(id)a50 drawingCountPerNoteHistogram:(id)a51 inlineDrawingFingerStrokesCountPerNoteHistogram:(id)a52 inlineDrawingPencilStrokesCountPerNoteHistogram:(id)a53 fullScreenDrawingStrokesCountPerNoteHistogram:(id)a54 totalStrokesCountPerNoteHistogram:(id)a55 tagCountPerNoteHistogram:(id)a56 distinctTagCountPerNoteHistogram:(id)a57 totalCountOfNotesWithTags:(id)a58 totalCountOfNotesWithCollapsedSections:(id)a59 totalCountOfNotesWithMentions:(id)a60 totalScrapPaperCount:(id)a61 totalCountOfScrapPapersWithTags:(id)a62 totalCountOfScrapPapersWithMentions:(id)a63 totalCountOfPinnedScrapPapers:totalCountOfLockedScrapPapers:totalCountOfCollaboratedScrapPapers:mentionCountPerNoteHistogram:distinctMentionCountPerNoteHistogram:totalCountOfNotesWithMathUsage:;
- (id)toDict;
@end

@implementation ICASAccountSnapshotData

- (id)initWithUserStartMonth:(void *)a3 userStartYear:(void *)a4 saltVersion:(void *)a5 accountSnapshotSummary:(void *)a6 accountNotesTwoFactorSummary:(void *)a7 collabNotesSummary:(void *)a8 collabFoldersSummary:(id)a9 noteAttachmentSummary:(id)a10 scrapPaperAttachmentSummary:(id)a11 lockedNotesSummary:(id)a12 smartFoldersSummary:(id)a13 totalNoteCount:(id)a14 totalFolderCount:(id)a15 totalSmartFolderCount:(id)a16 totalChecklistCount:(id)a17 totalNotesWithChecklistCount:(id)a18 totalCountOfPinnedNotes:(id)a19 totalCountOfLockedNotes:(id)a20 deviceSnapshotSummary:(id)a21 userSnapshotSummary:(id)a22 attachmentUTISummary:(id)a23 folderDirectNoteCountHistogram:(id)a24 collabRootFolderTotalNoteCountHistogram:(id)a25 docScanPageCountHistogram:(id)a26 collabOwnedRootFolderInviteeCountHistogram:(id)a27 collabOwnedRootFolderAcceptanceCountHistogram:(id)a28 collabOwnedRootFolderNoReplyCountHistogram:(id)a29 collabOwnedRootFolderAcceptanceRatioHistogram:(id)a30 collabOwnedSingleNoteInviteeCountHistogram:(id)a31 collabOwnedSingleNoteAcceptanceCountHistogram:(id)a32 collabOwnedSingleNoteNoReplyCountHistogram:(id)a33 collabOwnedSingleNoteAcceptanceRatioHistogram:(id)a34 noteCharCountHistogram:(id)a35 inlineDrawingV1TotalStrokeCountHistogram:(id)a36 inlineDrawingV1PencilStrokeCountHistogram:(id)a37 inlineDrawingV1FingerStrokeCountHistogram:(id)a38 inlineDrawingV1FingerStrokeRatioHistogram:(id)a39 inlineDrawingV2TotalStrokeCountHistogram:(id)a40 inlineDrawingV2PencilStrokeCountHistogram:(id)a41 inlineDrawingV2FingerStrokeCountHistogram:(id)a42 inlineDrawingV2FingerStrokeRatioHistogram:(id)a43 fullscreenDrawingStrokeCountHistogram:(id)a44 tableRowCountHistogram:(id)a45 tableColumnCountHistogram:(id)a46 tableCellCountHistogram:(id)a47 passwordProtectedNoteWeeklyAgeHistogram:(id)a48 topLevelFolderTotalNoteCountHistogram:(id)a49 attachmentCountPerNoteHistogram:(id)a50 drawingCountPerNoteHistogram:(id)a51 inlineDrawingFingerStrokesCountPerNoteHistogram:(id)a52 inlineDrawingPencilStrokesCountPerNoteHistogram:(id)a53 fullScreenDrawingStrokesCountPerNoteHistogram:(id)a54 totalStrokesCountPerNoteHistogram:(id)a55 tagCountPerNoteHistogram:(id)a56 distinctTagCountPerNoteHistogram:(id)a57 totalCountOfNotesWithTags:(id)a58 totalCountOfNotesWithCollapsedSections:(id)a59 totalCountOfNotesWithMentions:(id)a60 totalScrapPaperCount:(id)a61 totalCountOfScrapPapersWithTags:(id)a62 totalCountOfScrapPapersWithMentions:(id)a63 totalCountOfPinnedScrapPapers:totalCountOfLockedScrapPapers:totalCountOfCollaboratedScrapPapers:mentionCountPerNoteHistogram:distinctMentionCountPerNoteHistogram:totalCountOfNotesWithMathUsage:
{
  id v144 = a3;
  id v82 = a4;
  id v143 = a4;
  id v142 = a5;
  id v141 = a6;
  id v140 = a7;
  id v139 = a8;
  id v138 = a9;
  id v137 = a10;
  id v136 = a11;
  id v135 = a12;
  id v134 = a13;
  id v133 = a14;
  id v132 = a15;
  id v131 = a16;
  id v130 = a17;
  id v129 = a18;
  id v128 = a19;
  id v127 = a20;
  id v126 = a21;
  id v125 = a22;
  id v124 = a23;
  id v123 = a24;
  id v122 = a25;
  id v121 = a26;
  id v120 = a27;
  id v119 = a28;
  id v118 = a29;
  id v117 = a30;
  id v116 = a31;
  id v115 = a32;
  id v114 = a33;
  id v113 = a34;
  id v112 = a35;
  id v111 = a36;
  id v110 = a37;
  id v109 = a38;
  id v108 = a39;
  id v107 = a40;
  id v106 = a41;
  id v105 = a42;
  id v72 = a43;
  id v92 = a44;
  id v73 = a45;
  id v74 = a46;
  id v75 = a47;
  id v76 = a48;
  id v93 = a49;
  id v77 = a50;
  id v95 = a51;
  id v104 = a52;
  id v103 = a53;
  id v102 = a54;
  id v101 = a55;
  id v100 = a56;
  id v99 = a57;
  id v98 = a58;
  id v97 = a59;
  id v96 = a60;
  id v94 = a61;
  id v91 = a62;
  id v90 = a63;
  id v89 = a64;
  id v88 = a65;
  id v87 = a66;
  id v86 = a67;
  id v85 = a68;
  id v84 = a69;
  v147.receiver = a1;
  v147.super_class = (Class)ICASAccountSnapshotData;
  v78 = [(ICASAccountSnapshotData *)&v147 init];
  p_isa = (id *)&v78->super.isa;
  if (v78)
  {
    objc_storeStrong((id *)&v78->_userStartMonth, a3);
    objc_storeStrong(p_isa + 2, v82);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, a7);
    objc_storeStrong(p_isa + 6, a8);
    objc_storeStrong(p_isa + 7, a9);
    objc_storeStrong(p_isa + 8, a10);
    objc_storeStrong(p_isa + 9, a11);
    objc_storeStrong(p_isa + 10, a12);
    objc_storeStrong(p_isa + 11, a13);
    objc_storeStrong(p_isa + 12, a14);
    objc_storeStrong(p_isa + 13, a15);
    objc_storeStrong(p_isa + 14, a16);
    objc_storeStrong(p_isa + 15, a17);
    objc_storeStrong(p_isa + 16, a18);
    objc_storeStrong(p_isa + 17, a19);
    objc_storeStrong(p_isa + 18, a20);
    objc_storeStrong(p_isa + 19, a21);
    objc_storeStrong(p_isa + 20, a22);
    objc_storeStrong(p_isa + 21, a23);
    objc_storeStrong(p_isa + 22, a24);
    objc_storeStrong(p_isa + 23, a25);
    objc_storeStrong(p_isa + 24, a26);
    objc_storeStrong(p_isa + 25, a27);
    objc_storeStrong(p_isa + 26, a28);
    objc_storeStrong(p_isa + 27, a29);
    objc_storeStrong(p_isa + 28, a30);
    objc_storeStrong(p_isa + 29, a31);
    objc_storeStrong(p_isa + 30, a32);
    objc_storeStrong(p_isa + 31, a33);
    objc_storeStrong(p_isa + 32, a34);
    objc_storeStrong(p_isa + 33, a35);
    objc_storeStrong(p_isa + 34, a36);
    objc_storeStrong(p_isa + 35, a37);
    objc_storeStrong(p_isa + 36, a38);
    objc_storeStrong(p_isa + 37, a39);
    objc_storeStrong(p_isa + 38, a40);
    objc_storeStrong(p_isa + 39, a41);
    objc_storeStrong(p_isa + 40, a42);
    objc_storeStrong(p_isa + 41, a43);
    objc_storeStrong(p_isa + 42, a44);
    objc_storeStrong(p_isa + 43, a45);
    objc_storeStrong(p_isa + 44, a46);
    objc_storeStrong(p_isa + 45, a47);
    objc_storeStrong(p_isa + 46, a48);
    objc_storeStrong(p_isa + 47, a49);
    objc_storeStrong(p_isa + 48, a50);
    objc_storeStrong(p_isa + 49, a51);
    objc_storeStrong(p_isa + 50, a52);
    objc_storeStrong(p_isa + 51, a53);
    objc_storeStrong(p_isa + 52, a54);
    objc_storeStrong(p_isa + 53, a55);
    objc_storeStrong(p_isa + 54, a56);
    objc_storeStrong(p_isa + 55, a57);
    objc_storeStrong(p_isa + 56, a58);
    objc_storeStrong(p_isa + 57, a59);
    objc_storeStrong(p_isa + 58, a60);
    objc_storeStrong(p_isa + 59, a61);
    objc_storeStrong(p_isa + 60, a62);
    objc_storeStrong(p_isa + 61, a63);
    objc_storeStrong(p_isa + 62, a64);
    objc_storeStrong(p_isa + 63, a65);
    objc_storeStrong(p_isa + 64, a66);
    objc_storeStrong(p_isa + 65, a67);
    objc_storeStrong(p_isa + 66, a68);
    objc_storeStrong(p_isa + 67, a69);
  }

  return p_isa;
}

+ (NSString)dataName
{
  return (NSString *)@"AccountSnapshotData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v207[67] = *MEMORY[0x1E4F143B8];
  v206[0] = @"userStartMonth";
  v205 = [(ICASAccountSnapshotData *)self userStartMonth];
  if (v205)
  {
    uint64_t v3 = [(ICASAccountSnapshotData *)self userStartMonth];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  v204 = (void *)v3;
  v207[0] = v3;
  v206[1] = @"userStartYear";
  v203 = [(ICASAccountSnapshotData *)self userStartYear];
  if (v203)
  {
    uint64_t v4 = [(ICASAccountSnapshotData *)self userStartYear];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  v202 = (void *)v4;
  v207[1] = v4;
  v206[2] = @"saltVersion";
  v201 = [(ICASAccountSnapshotData *)self saltVersion];
  if (v201)
  {
    uint64_t v5 = [(ICASAccountSnapshotData *)self saltVersion];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  v200 = (void *)v5;
  v207[2] = v5;
  v206[3] = @"accountSnapshotSummary";
  v199 = [(ICASAccountSnapshotData *)self accountSnapshotSummary];
  if (v199)
  {
    uint64_t v6 = [(ICASAccountSnapshotData *)self accountSnapshotSummary];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  v198 = (void *)v6;
  v207[3] = v6;
  v206[4] = @"accountNotesTwoFactorSummary";
  v197 = [(ICASAccountSnapshotData *)self accountNotesTwoFactorSummary];
  if (v197)
  {
    uint64_t v7 = [(ICASAccountSnapshotData *)self accountNotesTwoFactorSummary];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  v196 = (void *)v7;
  v207[4] = v7;
  v206[5] = @"collabNotesSummary";
  v195 = [(ICASAccountSnapshotData *)self collabNotesSummary];
  if (v195)
  {
    uint64_t v8 = [(ICASAccountSnapshotData *)self collabNotesSummary];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  v194 = (void *)v8;
  v207[5] = v8;
  v206[6] = @"collabFoldersSummary";
  v193 = [(ICASAccountSnapshotData *)self collabFoldersSummary];
  if (v193)
  {
    uint64_t v9 = [(ICASAccountSnapshotData *)self collabFoldersSummary];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  v192 = (void *)v9;
  v207[6] = v9;
  v206[7] = @"noteAttachmentSummary";
  v191 = [(ICASAccountSnapshotData *)self noteAttachmentSummary];
  if (v191)
  {
    uint64_t v10 = [(ICASAccountSnapshotData *)self noteAttachmentSummary];
  }
  else
  {
    uint64_t v10 = objc_opt_new();
  }
  v190 = (void *)v10;
  v207[7] = v10;
  v206[8] = @"scrapPaperAttachmentSummary";
  v189 = [(ICASAccountSnapshotData *)self scrapPaperAttachmentSummary];
  if (v189)
  {
    uint64_t v11 = [(ICASAccountSnapshotData *)self scrapPaperAttachmentSummary];
  }
  else
  {
    uint64_t v11 = objc_opt_new();
  }
  v188 = (void *)v11;
  v207[8] = v11;
  v206[9] = @"lockedNotesSummary";
  v187 = [(ICASAccountSnapshotData *)self lockedNotesSummary];
  if (v187)
  {
    uint64_t v12 = [(ICASAccountSnapshotData *)self lockedNotesSummary];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  v186 = (void *)v12;
  v207[9] = v12;
  v206[10] = @"smartFoldersSummary";
  v185 = [(ICASAccountSnapshotData *)self smartFoldersSummary];
  if (v185)
  {
    uint64_t v13 = [(ICASAccountSnapshotData *)self smartFoldersSummary];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  v184 = (void *)v13;
  v207[10] = v13;
  v206[11] = @"totalNoteCount";
  v183 = [(ICASAccountSnapshotData *)self totalNoteCount];
  if (v183)
  {
    uint64_t v14 = [(ICASAccountSnapshotData *)self totalNoteCount];
  }
  else
  {
    uint64_t v14 = objc_opt_new();
  }
  v182 = (void *)v14;
  v207[11] = v14;
  v206[12] = @"totalFolderCount";
  v181 = [(ICASAccountSnapshotData *)self totalFolderCount];
  if (v181)
  {
    uint64_t v15 = [(ICASAccountSnapshotData *)self totalFolderCount];
  }
  else
  {
    uint64_t v15 = objc_opt_new();
  }
  v180 = (void *)v15;
  v207[12] = v15;
  v206[13] = @"totalSmartFolderCount";
  v179 = [(ICASAccountSnapshotData *)self totalSmartFolderCount];
  if (v179)
  {
    uint64_t v16 = [(ICASAccountSnapshotData *)self totalSmartFolderCount];
  }
  else
  {
    uint64_t v16 = objc_opt_new();
  }
  v178 = (void *)v16;
  v207[13] = v16;
  v206[14] = @"totalChecklistCount";
  v177 = [(ICASAccountSnapshotData *)self totalChecklistCount];
  if (v177)
  {
    uint64_t v17 = [(ICASAccountSnapshotData *)self totalChecklistCount];
  }
  else
  {
    uint64_t v17 = objc_opt_new();
  }
  v176 = (void *)v17;
  v207[14] = v17;
  v206[15] = @"totalNotesWithChecklistCount";
  v175 = [(ICASAccountSnapshotData *)self totalNotesWithChecklistCount];
  if (v175)
  {
    uint64_t v18 = [(ICASAccountSnapshotData *)self totalNotesWithChecklistCount];
  }
  else
  {
    uint64_t v18 = objc_opt_new();
  }
  v174 = (void *)v18;
  v207[15] = v18;
  v206[16] = @"totalCountOfPinnedNotes";
  v173 = [(ICASAccountSnapshotData *)self totalCountOfPinnedNotes];
  if (v173)
  {
    uint64_t v19 = [(ICASAccountSnapshotData *)self totalCountOfPinnedNotes];
  }
  else
  {
    uint64_t v19 = objc_opt_new();
  }
  v172 = (void *)v19;
  v207[16] = v19;
  v206[17] = @"totalCountOfLockedNotes";
  v171 = [(ICASAccountSnapshotData *)self totalCountOfLockedNotes];
  if (v171)
  {
    uint64_t v20 = [(ICASAccountSnapshotData *)self totalCountOfLockedNotes];
  }
  else
  {
    uint64_t v20 = objc_opt_new();
  }
  v170 = (void *)v20;
  v207[17] = v20;
  v206[18] = @"deviceSnapshotSummary";
  v169 = [(ICASAccountSnapshotData *)self deviceSnapshotSummary];
  if (v169)
  {
    uint64_t v21 = [(ICASAccountSnapshotData *)self deviceSnapshotSummary];
  }
  else
  {
    uint64_t v21 = objc_opt_new();
  }
  v168 = (void *)v21;
  v207[18] = v21;
  v206[19] = @"userSnapshotSummary";
  v167 = [(ICASAccountSnapshotData *)self userSnapshotSummary];
  if (v167)
  {
    uint64_t v22 = [(ICASAccountSnapshotData *)self userSnapshotSummary];
  }
  else
  {
    uint64_t v22 = objc_opt_new();
  }
  v166 = (void *)v22;
  v207[19] = v22;
  v206[20] = @"attachmentUTISummary";
  v165 = [(ICASAccountSnapshotData *)self attachmentUTISummary];
  if (v165)
  {
    uint64_t v23 = [(ICASAccountSnapshotData *)self attachmentUTISummary];
  }
  else
  {
    uint64_t v23 = objc_opt_new();
  }
  v164 = (void *)v23;
  v207[20] = v23;
  v206[21] = @"folderDirectNoteCountHistogram";
  v163 = [(ICASAccountSnapshotData *)self folderDirectNoteCountHistogram];
  if (v163)
  {
    uint64_t v24 = [(ICASAccountSnapshotData *)self folderDirectNoteCountHistogram];
  }
  else
  {
    uint64_t v24 = objc_opt_new();
  }
  v162 = (void *)v24;
  v207[21] = v24;
  v206[22] = @"collabRootFolderTotalNoteCountHistogram";
  v161 = [(ICASAccountSnapshotData *)self collabRootFolderTotalNoteCountHistogram];
  if (v161)
  {
    uint64_t v25 = [(ICASAccountSnapshotData *)self collabRootFolderTotalNoteCountHistogram];
  }
  else
  {
    uint64_t v25 = objc_opt_new();
  }
  v160 = (void *)v25;
  v207[22] = v25;
  v206[23] = @"docScanPageCountHistogram";
  v159 = [(ICASAccountSnapshotData *)self docScanPageCountHistogram];
  if (v159)
  {
    uint64_t v26 = [(ICASAccountSnapshotData *)self docScanPageCountHistogram];
  }
  else
  {
    uint64_t v26 = objc_opt_new();
  }
  v158 = (void *)v26;
  v207[23] = v26;
  v206[24] = @"collabOwnedRootFolderInviteeCountHistogram";
  v157 = [(ICASAccountSnapshotData *)self collabOwnedRootFolderInviteeCountHistogram];
  if (v157)
  {
    uint64_t v27 = [(ICASAccountSnapshotData *)self collabOwnedRootFolderInviteeCountHistogram];
  }
  else
  {
    uint64_t v27 = objc_opt_new();
  }
  v156 = (void *)v27;
  v207[24] = v27;
  v206[25] = @"collabOwnedRootFolderAcceptanceCountHistogram";
  v155 = [(ICASAccountSnapshotData *)self collabOwnedRootFolderAcceptanceCountHistogram];
  if (v155)
  {
    uint64_t v28 = [(ICASAccountSnapshotData *)self collabOwnedRootFolderAcceptanceCountHistogram];
  }
  else
  {
    uint64_t v28 = objc_opt_new();
  }
  v154 = (void *)v28;
  v207[25] = v28;
  v206[26] = @"collabOwnedRootFolderNoReplyCountHistogram";
  v153 = [(ICASAccountSnapshotData *)self collabOwnedRootFolderNoReplyCountHistogram];
  if (v153)
  {
    uint64_t v29 = [(ICASAccountSnapshotData *)self collabOwnedRootFolderNoReplyCountHistogram];
  }
  else
  {
    uint64_t v29 = objc_opt_new();
  }
  v152 = (void *)v29;
  v207[26] = v29;
  v206[27] = @"collabOwnedRootFolderAcceptanceRatioHistogram";
  v151 = [(ICASAccountSnapshotData *)self collabOwnedRootFolderAcceptanceRatioHistogram];
  if (v151)
  {
    uint64_t v30 = [(ICASAccountSnapshotData *)self collabOwnedRootFolderAcceptanceRatioHistogram];
  }
  else
  {
    uint64_t v30 = objc_opt_new();
  }
  v150 = (void *)v30;
  v207[27] = v30;
  v206[28] = @"collabOwnedSingleNoteInviteeCountHistogram";
  v149 = [(ICASAccountSnapshotData *)self collabOwnedSingleNoteInviteeCountHistogram];
  if (v149)
  {
    uint64_t v31 = [(ICASAccountSnapshotData *)self collabOwnedSingleNoteInviteeCountHistogram];
  }
  else
  {
    uint64_t v31 = objc_opt_new();
  }
  v148 = (void *)v31;
  v207[28] = v31;
  v206[29] = @"collabOwnedSingleNoteAcceptanceCountHistogram";
  objc_super v147 = [(ICASAccountSnapshotData *)self collabOwnedSingleNoteAcceptanceCountHistogram];
  if (v147)
  {
    uint64_t v32 = [(ICASAccountSnapshotData *)self collabOwnedSingleNoteAcceptanceCountHistogram];
  }
  else
  {
    uint64_t v32 = objc_opt_new();
  }
  v146 = (void *)v32;
  v207[29] = v32;
  v206[30] = @"collabOwnedSingleNoteNoReplyCountHistogram";
  v145 = [(ICASAccountSnapshotData *)self collabOwnedSingleNoteNoReplyCountHistogram];
  if (v145)
  {
    uint64_t v33 = [(ICASAccountSnapshotData *)self collabOwnedSingleNoteNoReplyCountHistogram];
  }
  else
  {
    uint64_t v33 = objc_opt_new();
  }
  id v144 = (void *)v33;
  v207[30] = v33;
  v206[31] = @"collabOwnedSingleNoteAcceptanceRatioHistogram";
  id v143 = [(ICASAccountSnapshotData *)self collabOwnedSingleNoteAcceptanceRatioHistogram];
  if (v143)
  {
    uint64_t v34 = [(ICASAccountSnapshotData *)self collabOwnedSingleNoteAcceptanceRatioHistogram];
  }
  else
  {
    uint64_t v34 = objc_opt_new();
  }
  id v142 = (void *)v34;
  v207[31] = v34;
  v206[32] = @"noteCharCountHistogram";
  id v141 = [(ICASAccountSnapshotData *)self noteCharCountHistogram];
  if (v141)
  {
    uint64_t v35 = [(ICASAccountSnapshotData *)self noteCharCountHistogram];
  }
  else
  {
    uint64_t v35 = objc_opt_new();
  }
  id v140 = (void *)v35;
  v207[32] = v35;
  v206[33] = @"inlineDrawingV1TotalStrokeCountHistogram";
  id v139 = [(ICASAccountSnapshotData *)self inlineDrawingV1TotalStrokeCountHistogram];
  if (v139)
  {
    uint64_t v36 = [(ICASAccountSnapshotData *)self inlineDrawingV1TotalStrokeCountHistogram];
  }
  else
  {
    uint64_t v36 = objc_opt_new();
  }
  id v138 = (void *)v36;
  v207[33] = v36;
  v206[34] = @"inlineDrawingV1PencilStrokeCountHistogram";
  id v137 = [(ICASAccountSnapshotData *)self inlineDrawingV1PencilStrokeCountHistogram];
  if (v137)
  {
    uint64_t v37 = [(ICASAccountSnapshotData *)self inlineDrawingV1PencilStrokeCountHistogram];
  }
  else
  {
    uint64_t v37 = objc_opt_new();
  }
  id v136 = (void *)v37;
  v207[34] = v37;
  v206[35] = @"inlineDrawingV1FingerStrokeCountHistogram";
  id v135 = [(ICASAccountSnapshotData *)self inlineDrawingV1FingerStrokeCountHistogram];
  if (v135)
  {
    uint64_t v38 = [(ICASAccountSnapshotData *)self inlineDrawingV1FingerStrokeCountHistogram];
  }
  else
  {
    uint64_t v38 = objc_opt_new();
  }
  id v134 = (void *)v38;
  v207[35] = v38;
  v206[36] = @"inlineDrawingV1FingerStrokeRatioHistogram";
  id v133 = [(ICASAccountSnapshotData *)self inlineDrawingV1FingerStrokeRatioHistogram];
  if (v133)
  {
    uint64_t v39 = [(ICASAccountSnapshotData *)self inlineDrawingV1FingerStrokeRatioHistogram];
  }
  else
  {
    uint64_t v39 = objc_opt_new();
  }
  id v132 = (void *)v39;
  v207[36] = v39;
  v206[37] = @"inlineDrawingV2TotalStrokeCountHistogram";
  id v131 = [(ICASAccountSnapshotData *)self inlineDrawingV2TotalStrokeCountHistogram];
  if (v131)
  {
    uint64_t v40 = [(ICASAccountSnapshotData *)self inlineDrawingV2TotalStrokeCountHistogram];
  }
  else
  {
    uint64_t v40 = objc_opt_new();
  }
  id v130 = (void *)v40;
  v207[37] = v40;
  v206[38] = @"inlineDrawingV2PencilStrokeCountHistogram";
  id v129 = [(ICASAccountSnapshotData *)self inlineDrawingV2PencilStrokeCountHistogram];
  if (v129)
  {
    uint64_t v41 = [(ICASAccountSnapshotData *)self inlineDrawingV2PencilStrokeCountHistogram];
  }
  else
  {
    uint64_t v41 = objc_opt_new();
  }
  id v128 = (void *)v41;
  v207[38] = v41;
  v206[39] = @"inlineDrawingV2FingerStrokeCountHistogram";
  id v127 = [(ICASAccountSnapshotData *)self inlineDrawingV2FingerStrokeCountHistogram];
  if (v127)
  {
    uint64_t v42 = [(ICASAccountSnapshotData *)self inlineDrawingV2FingerStrokeCountHistogram];
  }
  else
  {
    uint64_t v42 = objc_opt_new();
  }
  id v126 = (void *)v42;
  v207[39] = v42;
  v206[40] = @"inlineDrawingV2FingerStrokeRatioHistogram";
  id v125 = [(ICASAccountSnapshotData *)self inlineDrawingV2FingerStrokeRatioHistogram];
  if (v125)
  {
    uint64_t v43 = [(ICASAccountSnapshotData *)self inlineDrawingV2FingerStrokeRatioHistogram];
  }
  else
  {
    uint64_t v43 = objc_opt_new();
  }
  id v124 = (void *)v43;
  v207[40] = v43;
  v206[41] = @"fullscreenDrawingStrokeCountHistogram";
  id v123 = [(ICASAccountSnapshotData *)self fullscreenDrawingStrokeCountHistogram];
  if (v123)
  {
    uint64_t v44 = [(ICASAccountSnapshotData *)self fullscreenDrawingStrokeCountHistogram];
  }
  else
  {
    uint64_t v44 = objc_opt_new();
  }
  id v122 = (void *)v44;
  v207[41] = v44;
  v206[42] = @"tableRowCountHistogram";
  id v121 = [(ICASAccountSnapshotData *)self tableRowCountHistogram];
  if (v121)
  {
    uint64_t v45 = [(ICASAccountSnapshotData *)self tableRowCountHistogram];
  }
  else
  {
    uint64_t v45 = objc_opt_new();
  }
  id v120 = (void *)v45;
  v207[42] = v45;
  v206[43] = @"tableColumnCountHistogram";
  id v119 = [(ICASAccountSnapshotData *)self tableColumnCountHistogram];
  if (v119)
  {
    uint64_t v46 = [(ICASAccountSnapshotData *)self tableColumnCountHistogram];
  }
  else
  {
    uint64_t v46 = objc_opt_new();
  }
  id v118 = (void *)v46;
  v207[43] = v46;
  v206[44] = @"tableCellCountHistogram";
  id v117 = [(ICASAccountSnapshotData *)self tableCellCountHistogram];
  if (v117)
  {
    uint64_t v47 = [(ICASAccountSnapshotData *)self tableCellCountHistogram];
  }
  else
  {
    uint64_t v47 = objc_opt_new();
  }
  id v116 = (void *)v47;
  v207[44] = v47;
  v206[45] = @"passwordProtectedNoteWeeklyAgeHistogram";
  id v115 = [(ICASAccountSnapshotData *)self passwordProtectedNoteWeeklyAgeHistogram];
  if (v115)
  {
    uint64_t v48 = [(ICASAccountSnapshotData *)self passwordProtectedNoteWeeklyAgeHistogram];
  }
  else
  {
    uint64_t v48 = objc_opt_new();
  }
  id v114 = (void *)v48;
  v207[45] = v48;
  v206[46] = @"topLevelFolderTotalNoteCountHistogram";
  id v113 = [(ICASAccountSnapshotData *)self topLevelFolderTotalNoteCountHistogram];
  if (v113)
  {
    uint64_t v49 = [(ICASAccountSnapshotData *)self topLevelFolderTotalNoteCountHistogram];
  }
  else
  {
    uint64_t v49 = objc_opt_new();
  }
  id v112 = (void *)v49;
  v207[46] = v49;
  v206[47] = @"attachmentCountPerNoteHistogram";
  id v111 = [(ICASAccountSnapshotData *)self attachmentCountPerNoteHistogram];
  if (v111)
  {
    uint64_t v50 = [(ICASAccountSnapshotData *)self attachmentCountPerNoteHistogram];
  }
  else
  {
    uint64_t v50 = objc_opt_new();
  }
  id v110 = (void *)v50;
  v207[47] = v50;
  v206[48] = @"drawingCountPerNoteHistogram";
  id v109 = [(ICASAccountSnapshotData *)self drawingCountPerNoteHistogram];
  if (v109)
  {
    uint64_t v51 = [(ICASAccountSnapshotData *)self drawingCountPerNoteHistogram];
  }
  else
  {
    uint64_t v51 = objc_opt_new();
  }
  id v108 = (void *)v51;
  v207[48] = v51;
  v206[49] = @"inlineDrawingFingerStrokesCountPerNoteHistogram";
  id v107 = [(ICASAccountSnapshotData *)self inlineDrawingFingerStrokesCountPerNoteHistogram];
  if (v107)
  {
    uint64_t v52 = [(ICASAccountSnapshotData *)self inlineDrawingFingerStrokesCountPerNoteHistogram];
  }
  else
  {
    uint64_t v52 = objc_opt_new();
  }
  id v106 = (void *)v52;
  v207[49] = v52;
  v206[50] = @"inlineDrawingPencilStrokesCountPerNoteHistogram";
  id v105 = [(ICASAccountSnapshotData *)self inlineDrawingPencilStrokesCountPerNoteHistogram];
  if (v105)
  {
    uint64_t v53 = [(ICASAccountSnapshotData *)self inlineDrawingPencilStrokesCountPerNoteHistogram];
  }
  else
  {
    uint64_t v53 = objc_opt_new();
  }
  id v104 = (void *)v53;
  v207[50] = v53;
  v206[51] = @"fullScreenDrawingStrokesCountPerNoteHistogram";
  id v103 = [(ICASAccountSnapshotData *)self fullScreenDrawingStrokesCountPerNoteHistogram];
  if (v103)
  {
    uint64_t v54 = [(ICASAccountSnapshotData *)self fullScreenDrawingStrokesCountPerNoteHistogram];
  }
  else
  {
    uint64_t v54 = objc_opt_new();
  }
  id v102 = (void *)v54;
  v207[51] = v54;
  v206[52] = @"totalStrokesCountPerNoteHistogram";
  id v101 = [(ICASAccountSnapshotData *)self totalStrokesCountPerNoteHistogram];
  if (v101)
  {
    uint64_t v55 = [(ICASAccountSnapshotData *)self totalStrokesCountPerNoteHistogram];
  }
  else
  {
    uint64_t v55 = objc_opt_new();
  }
  id v100 = (void *)v55;
  v207[52] = v55;
  v206[53] = @"tagCountPerNoteHistogram";
  id v99 = [(ICASAccountSnapshotData *)self tagCountPerNoteHistogram];
  if (v99)
  {
    uint64_t v56 = [(ICASAccountSnapshotData *)self tagCountPerNoteHistogram];
  }
  else
  {
    uint64_t v56 = objc_opt_new();
  }
  id v98 = (void *)v56;
  v207[53] = v56;
  v206[54] = @"distinctTagCountPerNoteHistogram";
  id v97 = [(ICASAccountSnapshotData *)self distinctTagCountPerNoteHistogram];
  if (v97)
  {
    uint64_t v57 = [(ICASAccountSnapshotData *)self distinctTagCountPerNoteHistogram];
  }
  else
  {
    uint64_t v57 = objc_opt_new();
  }
  id v96 = (void *)v57;
  v207[54] = v57;
  v206[55] = @"totalCountOfNotesWithTags";
  id v95 = [(ICASAccountSnapshotData *)self totalCountOfNotesWithTags];
  if (v95)
  {
    uint64_t v58 = [(ICASAccountSnapshotData *)self totalCountOfNotesWithTags];
  }
  else
  {
    uint64_t v58 = objc_opt_new();
  }
  id v94 = (void *)v58;
  v207[55] = v58;
  v206[56] = @"totalCountOfNotesWithCollapsedSections";
  id v93 = [(ICASAccountSnapshotData *)self totalCountOfNotesWithCollapsedSections];
  if (v93)
  {
    uint64_t v59 = [(ICASAccountSnapshotData *)self totalCountOfNotesWithCollapsedSections];
  }
  else
  {
    uint64_t v59 = objc_opt_new();
  }
  id v92 = (void *)v59;
  v207[56] = v59;
  v206[57] = @"totalCountOfNotesWithMentions";
  id v91 = [(ICASAccountSnapshotData *)self totalCountOfNotesWithMentions];
  if (v91)
  {
    uint64_t v60 = [(ICASAccountSnapshotData *)self totalCountOfNotesWithMentions];
  }
  else
  {
    uint64_t v60 = objc_opt_new();
  }
  id v90 = (void *)v60;
  v207[57] = v60;
  v206[58] = @"totalScrapPaperCount";
  id v89 = [(ICASAccountSnapshotData *)self totalScrapPaperCount];
  if (v89)
  {
    uint64_t v61 = [(ICASAccountSnapshotData *)self totalScrapPaperCount];
  }
  else
  {
    uint64_t v61 = objc_opt_new();
  }
  id v88 = (void *)v61;
  v207[58] = v61;
  v206[59] = @"totalCountOfScrapPapersWithTags";
  id v87 = [(ICASAccountSnapshotData *)self totalCountOfScrapPapersWithTags];
  if (v87)
  {
    uint64_t v62 = [(ICASAccountSnapshotData *)self totalCountOfScrapPapersWithTags];
  }
  else
  {
    uint64_t v62 = objc_opt_new();
  }
  id v86 = (void *)v62;
  v207[59] = v62;
  v206[60] = @"totalCountOfScrapPapersWithMentions";
  id v85 = [(ICASAccountSnapshotData *)self totalCountOfScrapPapersWithMentions];
  if (v85)
  {
    uint64_t v63 = [(ICASAccountSnapshotData *)self totalCountOfScrapPapersWithMentions];
  }
  else
  {
    uint64_t v63 = objc_opt_new();
  }
  id v84 = (void *)v63;
  v207[60] = v63;
  v206[61] = @"totalCountOfPinnedScrapPapers";
  v83 = [(ICASAccountSnapshotData *)self totalCountOfPinnedScrapPapers];
  if (v83)
  {
    uint64_t v64 = [(ICASAccountSnapshotData *)self totalCountOfPinnedScrapPapers];
  }
  else
  {
    uint64_t v64 = objc_opt_new();
  }
  id v82 = (void *)v64;
  v207[61] = v64;
  v206[62] = @"totalCountOfLockedScrapPapers";
  v65 = [(ICASAccountSnapshotData *)self totalCountOfLockedScrapPapers];
  if (v65)
  {
    uint64_t v66 = [(ICASAccountSnapshotData *)self totalCountOfLockedScrapPapers];
  }
  else
  {
    uint64_t v66 = objc_opt_new();
  }
  v67 = (void *)v66;
  v207[62] = v66;
  v206[63] = @"totalCountOfCollaboratedScrapPapers";
  v68 = [(ICASAccountSnapshotData *)self totalCountOfCollaboratedScrapPapers];
  if (v68)
  {
    uint64_t v69 = [(ICASAccountSnapshotData *)self totalCountOfCollaboratedScrapPapers];
  }
  else
  {
    uint64_t v69 = objc_opt_new();
  }
  v70 = (void *)v69;
  v207[63] = v69;
  v206[64] = @"mentionCountPerNoteHistogram";
  v71 = [(ICASAccountSnapshotData *)self mentionCountPerNoteHistogram];
  if (v71)
  {
    uint64_t v72 = [(ICASAccountSnapshotData *)self mentionCountPerNoteHistogram];
  }
  else
  {
    uint64_t v72 = objc_opt_new();
  }
  id v73 = (void *)v72;
  v207[64] = v72;
  v206[65] = @"distinctMentionCountPerNoteHistogram";
  id v74 = [(ICASAccountSnapshotData *)self distinctMentionCountPerNoteHistogram];
  if (v74)
  {
    uint64_t v75 = [(ICASAccountSnapshotData *)self distinctMentionCountPerNoteHistogram];
  }
  else
  {
    uint64_t v75 = objc_opt_new();
  }
  id v76 = (void *)v75;
  v207[65] = v75;
  v206[66] = @"totalCountOfNotesWithMathUsage";
  id v77 = [(ICASAccountSnapshotData *)self totalCountOfNotesWithMathUsage];
  if (v77)
  {
    uint64_t v78 = [(ICASAccountSnapshotData *)self totalCountOfNotesWithMathUsage];
  }
  else
  {
    uint64_t v78 = objc_opt_new();
  }
  v79 = (void *)v78;
  v207[66] = v78;
  id v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v207 forKeys:v206 count:67];

  return v81;
}

- (NSNumber)userStartMonth
{
  return self->_userStartMonth;
}

- (NSNumber)userStartYear
{
  return self->_userStartYear;
}

- (NSString)saltVersion
{
  return self->_saltVersion;
}

- (NSArray)accountSnapshotSummary
{
  return self->_accountSnapshotSummary;
}

- (NSArray)accountNotesTwoFactorSummary
{
  return self->_accountNotesTwoFactorSummary;
}

- (NSArray)collabNotesSummary
{
  return self->_collabNotesSummary;
}

- (NSArray)collabFoldersSummary
{
  return self->_collabFoldersSummary;
}

- (NSArray)noteAttachmentSummary
{
  return self->_noteAttachmentSummary;
}

- (NSArray)scrapPaperAttachmentSummary
{
  return self->_scrapPaperAttachmentSummary;
}

- (NSArray)lockedNotesSummary
{
  return self->_lockedNotesSummary;
}

- (NSArray)smartFoldersSummary
{
  return self->_smartFoldersSummary;
}

- (NSNumber)totalNoteCount
{
  return self->_totalNoteCount;
}

- (NSNumber)totalFolderCount
{
  return self->_totalFolderCount;
}

- (NSNumber)totalSmartFolderCount
{
  return self->_totalSmartFolderCount;
}

- (NSNumber)totalChecklistCount
{
  return self->_totalChecklistCount;
}

- (NSNumber)totalNotesWithChecklistCount
{
  return self->_totalNotesWithChecklistCount;
}

- (NSNumber)totalCountOfPinnedNotes
{
  return self->_totalCountOfPinnedNotes;
}

- (NSNumber)totalCountOfLockedNotes
{
  return self->_totalCountOfLockedNotes;
}

- (NSArray)deviceSnapshotSummary
{
  return self->_deviceSnapshotSummary;
}

- (NSArray)userSnapshotSummary
{
  return self->_userSnapshotSummary;
}

- (NSArray)attachmentUTISummary
{
  return self->_attachmentUTISummary;
}

- (NSArray)folderDirectNoteCountHistogram
{
  return self->_folderDirectNoteCountHistogram;
}

- (NSArray)collabRootFolderTotalNoteCountHistogram
{
  return self->_collabRootFolderTotalNoteCountHistogram;
}

- (NSArray)docScanPageCountHistogram
{
  return self->_docScanPageCountHistogram;
}

- (NSArray)collabOwnedRootFolderInviteeCountHistogram
{
  return self->_collabOwnedRootFolderInviteeCountHistogram;
}

- (NSArray)collabOwnedRootFolderAcceptanceCountHistogram
{
  return self->_collabOwnedRootFolderAcceptanceCountHistogram;
}

- (NSArray)collabOwnedRootFolderNoReplyCountHistogram
{
  return self->_collabOwnedRootFolderNoReplyCountHistogram;
}

- (NSArray)collabOwnedRootFolderAcceptanceRatioHistogram
{
  return self->_collabOwnedRootFolderAcceptanceRatioHistogram;
}

- (NSArray)collabOwnedSingleNoteInviteeCountHistogram
{
  return self->_collabOwnedSingleNoteInviteeCountHistogram;
}

- (NSArray)collabOwnedSingleNoteAcceptanceCountHistogram
{
  return self->_collabOwnedSingleNoteAcceptanceCountHistogram;
}

- (NSArray)collabOwnedSingleNoteNoReplyCountHistogram
{
  return self->_collabOwnedSingleNoteNoReplyCountHistogram;
}

- (NSArray)collabOwnedSingleNoteAcceptanceRatioHistogram
{
  return self->_collabOwnedSingleNoteAcceptanceRatioHistogram;
}

- (NSArray)noteCharCountHistogram
{
  return self->_noteCharCountHistogram;
}

- (NSArray)inlineDrawingV1TotalStrokeCountHistogram
{
  return self->_inlineDrawingV1TotalStrokeCountHistogram;
}

- (NSArray)inlineDrawingV1PencilStrokeCountHistogram
{
  return self->_inlineDrawingV1PencilStrokeCountHistogram;
}

- (NSArray)inlineDrawingV1FingerStrokeCountHistogram
{
  return self->_inlineDrawingV1FingerStrokeCountHistogram;
}

- (NSArray)inlineDrawingV1FingerStrokeRatioHistogram
{
  return self->_inlineDrawingV1FingerStrokeRatioHistogram;
}

- (NSArray)inlineDrawingV2TotalStrokeCountHistogram
{
  return self->_inlineDrawingV2TotalStrokeCountHistogram;
}

- (NSArray)inlineDrawingV2PencilStrokeCountHistogram
{
  return self->_inlineDrawingV2PencilStrokeCountHistogram;
}

- (NSArray)inlineDrawingV2FingerStrokeCountHistogram
{
  return self->_inlineDrawingV2FingerStrokeCountHistogram;
}

- (NSArray)inlineDrawingV2FingerStrokeRatioHistogram
{
  return self->_inlineDrawingV2FingerStrokeRatioHistogram;
}

- (NSArray)fullscreenDrawingStrokeCountHistogram
{
  return self->_fullscreenDrawingStrokeCountHistogram;
}

- (NSArray)tableRowCountHistogram
{
  return self->_tableRowCountHistogram;
}

- (NSArray)tableColumnCountHistogram
{
  return self->_tableColumnCountHistogram;
}

- (NSArray)tableCellCountHistogram
{
  return self->_tableCellCountHistogram;
}

- (NSArray)passwordProtectedNoteWeeklyAgeHistogram
{
  return self->_passwordProtectedNoteWeeklyAgeHistogram;
}

- (NSArray)topLevelFolderTotalNoteCountHistogram
{
  return self->_topLevelFolderTotalNoteCountHistogram;
}

- (NSArray)attachmentCountPerNoteHistogram
{
  return self->_attachmentCountPerNoteHistogram;
}

- (NSArray)drawingCountPerNoteHistogram
{
  return self->_drawingCountPerNoteHistogram;
}

- (NSArray)inlineDrawingFingerStrokesCountPerNoteHistogram
{
  return self->_inlineDrawingFingerStrokesCountPerNoteHistogram;
}

- (NSArray)inlineDrawingPencilStrokesCountPerNoteHistogram
{
  return self->_inlineDrawingPencilStrokesCountPerNoteHistogram;
}

- (NSArray)fullScreenDrawingStrokesCountPerNoteHistogram
{
  return self->_fullScreenDrawingStrokesCountPerNoteHistogram;
}

- (NSArray)totalStrokesCountPerNoteHistogram
{
  return self->_totalStrokesCountPerNoteHistogram;
}

- (NSArray)tagCountPerNoteHistogram
{
  return self->_tagCountPerNoteHistogram;
}

- (NSArray)distinctTagCountPerNoteHistogram
{
  return self->_distinctTagCountPerNoteHistogram;
}

- (NSNumber)totalCountOfNotesWithTags
{
  return self->_totalCountOfNotesWithTags;
}

- (NSNumber)totalCountOfNotesWithCollapsedSections
{
  return self->_totalCountOfNotesWithCollapsedSections;
}

- (NSNumber)totalCountOfNotesWithMentions
{
  return self->_totalCountOfNotesWithMentions;
}

- (NSNumber)totalScrapPaperCount
{
  return self->_totalScrapPaperCount;
}

- (NSNumber)totalCountOfScrapPapersWithTags
{
  return self->_totalCountOfScrapPapersWithTags;
}

- (NSNumber)totalCountOfScrapPapersWithMentions
{
  return self->_totalCountOfScrapPapersWithMentions;
}

- (NSNumber)totalCountOfPinnedScrapPapers
{
  return self->_totalCountOfPinnedScrapPapers;
}

- (NSNumber)totalCountOfLockedScrapPapers
{
  return self->_totalCountOfLockedScrapPapers;
}

- (NSNumber)totalCountOfCollaboratedScrapPapers
{
  return self->_totalCountOfCollaboratedScrapPapers;
}

- (NSArray)mentionCountPerNoteHistogram
{
  return self->_mentionCountPerNoteHistogram;
}

- (NSArray)distinctMentionCountPerNoteHistogram
{
  return self->_distinctMentionCountPerNoteHistogram;
}

- (NSNumber)totalCountOfNotesWithMathUsage
{
  return self->_totalCountOfNotesWithMathUsage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalCountOfNotesWithMathUsage, 0);
  objc_storeStrong((id *)&self->_distinctMentionCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_mentionCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_totalCountOfCollaboratedScrapPapers, 0);
  objc_storeStrong((id *)&self->_totalCountOfLockedScrapPapers, 0);
  objc_storeStrong((id *)&self->_totalCountOfPinnedScrapPapers, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithMentions, 0);
  objc_storeStrong((id *)&self->_totalCountOfScrapPapersWithTags, 0);
  objc_storeStrong((id *)&self->_totalScrapPaperCount, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithMentions, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithCollapsedSections, 0);
  objc_storeStrong((id *)&self->_totalCountOfNotesWithTags, 0);
  objc_storeStrong((id *)&self->_distinctTagCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_tagCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_totalStrokesCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_fullScreenDrawingStrokesCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingPencilStrokesCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingFingerStrokesCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_drawingCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_attachmentCountPerNoteHistogram, 0);
  objc_storeStrong((id *)&self->_topLevelFolderTotalNoteCountHistogram, 0);
  objc_storeStrong((id *)&self->_passwordProtectedNoteWeeklyAgeHistogram, 0);
  objc_storeStrong((id *)&self->_tableCellCountHistogram, 0);
  objc_storeStrong((id *)&self->_tableColumnCountHistogram, 0);
  objc_storeStrong((id *)&self->_tableRowCountHistogram, 0);
  objc_storeStrong((id *)&self->_fullscreenDrawingStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV2FingerStrokeRatioHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV2FingerStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV2PencilStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV2TotalStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV1FingerStrokeRatioHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV1FingerStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV1PencilStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_inlineDrawingV1TotalStrokeCountHistogram, 0);
  objc_storeStrong((id *)&self->_noteCharCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteAcceptanceRatioHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteNoReplyCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteAcceptanceCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedSingleNoteInviteeCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedRootFolderAcceptanceRatioHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedRootFolderNoReplyCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedRootFolderAcceptanceCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabOwnedRootFolderInviteeCountHistogram, 0);
  objc_storeStrong((id *)&self->_docScanPageCountHistogram, 0);
  objc_storeStrong((id *)&self->_collabRootFolderTotalNoteCountHistogram, 0);
  objc_storeStrong((id *)&self->_folderDirectNoteCountHistogram, 0);
  objc_storeStrong((id *)&self->_attachmentUTISummary, 0);
  objc_storeStrong((id *)&self->_userSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_deviceSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_totalCountOfLockedNotes, 0);
  objc_storeStrong((id *)&self->_totalCountOfPinnedNotes, 0);
  objc_storeStrong((id *)&self->_totalNotesWithChecklistCount, 0);
  objc_storeStrong((id *)&self->_totalChecklistCount, 0);
  objc_storeStrong((id *)&self->_totalSmartFolderCount, 0);
  objc_storeStrong((id *)&self->_totalFolderCount, 0);
  objc_storeStrong((id *)&self->_totalNoteCount, 0);
  objc_storeStrong((id *)&self->_smartFoldersSummary, 0);
  objc_storeStrong((id *)&self->_lockedNotesSummary, 0);
  objc_storeStrong((id *)&self->_scrapPaperAttachmentSummary, 0);
  objc_storeStrong((id *)&self->_noteAttachmentSummary, 0);
  objc_storeStrong((id *)&self->_collabFoldersSummary, 0);
  objc_storeStrong((id *)&self->_collabNotesSummary, 0);
  objc_storeStrong((id *)&self->_accountNotesTwoFactorSummary, 0);
  objc_storeStrong((id *)&self->_accountSnapshotSummary, 0);
  objc_storeStrong((id *)&self->_saltVersion, 0);
  objc_storeStrong((id *)&self->_userStartYear, 0);
  objc_storeStrong((id *)&self->_userStartMonth, 0);
}

@end