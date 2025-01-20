@interface _ICNANoteReportToAccount
- (_ICNANoteReportToAccount)init;
- (unint64_t)countOfAudioAttachments;
- (unint64_t)countOfAudioAttachmentsRecordedInNotes;
- (unint64_t)countOfAudioAttachmentsWithAppendedAudio;
- (unint64_t)countOfChecklists;
- (unint64_t)countOfCollaboratedScrapPapers;
- (unint64_t)countOfLockedNotes;
- (unint64_t)countOfLockedNotesWithDivergedMode;
- (unint64_t)countOfLockedNotesWithDivergedPassword;
- (unint64_t)countOfLockedScrapPapers;
- (unint64_t)countOfNotes;
- (unint64_t)countOfNotesWithAttachmentAudio;
- (unint64_t)countOfNotesWithAttachmentAudioSummary;
- (unint64_t)countOfNotesWithAttachmentAudioTranscript;
- (unint64_t)countOfNotesWithChecklists;
- (unint64_t)countOfNotesWithCollaborationStatus:(int64_t)a3 collaborationType:(int64_t)a4;
- (unint64_t)countOfNotesWithCollapsedSections;
- (unint64_t)countOfNotesWithDeepLink;
- (unint64_t)countOfNotesWithDocScan;
- (unint64_t)countOfNotesWithFactor:(int64_t)a3 andFactor:(int64_t)a4;
- (unint64_t)countOfNotesWithFolderLink;
- (unint64_t)countOfNotesWithFullscreenDrawing;
- (unint64_t)countOfNotesWithInlineDrawingV1;
- (unint64_t)countOfNotesWithInlineDrawingV2;
- (unint64_t)countOfNotesWithMapLink;
- (unint64_t)countOfNotesWithMathUsage;
- (unint64_t)countOfNotesWithMentions;
- (unint64_t)countOfNotesWithNoteLink;
- (unint64_t)countOfNotesWithOtherAttachments;
- (unint64_t)countOfNotesWithPDF;
- (unint64_t)countOfNotesWithPaperDocument;
- (unint64_t)countOfNotesWithPaperKit;
- (unint64_t)countOfNotesWithRichURL;
- (unint64_t)countOfNotesWithTable;
- (unint64_t)countOfNotesWithTags;
- (unint64_t)countOfPinnedNotes;
- (unint64_t)countOfPinnedScrapPapers;
- (unint64_t)countOfScrapPapersWithDeepLink;
- (unint64_t)countOfScrapPapersWithDocScan;
- (unint64_t)countOfScrapPapersWithFullscreenDrawing;
- (unint64_t)countOfScrapPapersWithInlineDrawingV1;
- (unint64_t)countOfScrapPapersWithInlineDrawingV2;
- (unint64_t)countOfScrapPapersWithMapLink;
- (unint64_t)countOfScrapPapersWithMentions;
- (unint64_t)countOfScrapPapersWithOtherAttachments;
- (unint64_t)countOfScrapPapersWithPaperKit;
- (unint64_t)countOfScrapPapersWithRichUrl;
- (unint64_t)countOfScrapPapersWithTables;
- (unint64_t)countOfScrapPapersWithTags;
- (unint64_t)countOfV1LockedNotes;
- (unint64_t)countOfV2LockedNotes;
- (unint64_t)scrapPaperCount;
- (void)completeTwoFactorMatrixReportingForCurrentNote;
- (void)setCountOfAudioAttachments:(unint64_t)a3;
- (void)setCountOfAudioAttachmentsRecordedInNotes:(unint64_t)a3;
- (void)setCountOfAudioAttachmentsWithAppendedAudio:(unint64_t)a3;
- (void)setCountOfChecklists:(unint64_t)a3;
- (void)setCountOfCollaboratedScrapPapers:(unint64_t)a3;
- (void)setCountOfLockedNotes:(unint64_t)a3;
- (void)setCountOfLockedNotesWithDivergedMode:(unint64_t)a3;
- (void)setCountOfLockedNotesWithDivergedPassword:(unint64_t)a3;
- (void)setCountOfLockedScrapPapers:(unint64_t)a3;
- (void)setCountOfNotes:(unint64_t)a3;
- (void)setCountOfNotesWithAttachmentAudio:(unint64_t)a3;
- (void)setCountOfNotesWithAttachmentAudioSummary:(unint64_t)a3;
- (void)setCountOfNotesWithAttachmentAudioTranscript:(unint64_t)a3;
- (void)setCountOfNotesWithChecklists:(unint64_t)a3;
- (void)setCountOfNotesWithCollapsedSections:(unint64_t)a3;
- (void)setCountOfNotesWithDeepLink:(unint64_t)a3;
- (void)setCountOfNotesWithDocScan:(unint64_t)a3;
- (void)setCountOfNotesWithFolderLink:(unint64_t)a3;
- (void)setCountOfNotesWithFullscreenDrawing:(unint64_t)a3;
- (void)setCountOfNotesWithInlineDrawingV1:(unint64_t)a3;
- (void)setCountOfNotesWithInlineDrawingV2:(unint64_t)a3;
- (void)setCountOfNotesWithMapLink:(unint64_t)a3;
- (void)setCountOfNotesWithMathUsage:(unint64_t)a3;
- (void)setCountOfNotesWithMentions:(unint64_t)a3;
- (void)setCountOfNotesWithNoteLink:(unint64_t)a3;
- (void)setCountOfNotesWithOtherAttachments:(unint64_t)a3;
- (void)setCountOfNotesWithPDF:(unint64_t)a3;
- (void)setCountOfNotesWithPaperDocument:(unint64_t)a3;
- (void)setCountOfNotesWithPaperKit:(unint64_t)a3;
- (void)setCountOfNotesWithRichURL:(unint64_t)a3;
- (void)setCountOfNotesWithTable:(unint64_t)a3;
- (void)setCountOfNotesWithTags:(unint64_t)a3;
- (void)setCountOfPinnedNotes:(unint64_t)a3;
- (void)setCountOfPinnedScrapPapers:(unint64_t)a3;
- (void)setCountOfScrapPapersWithDeepLink:(unint64_t)a3;
- (void)setCountOfScrapPapersWithDocScan:(unint64_t)a3;
- (void)setCountOfScrapPapersWithFullscreenDrawing:(unint64_t)a3;
- (void)setCountOfScrapPapersWithInlineDrawingV1:(unint64_t)a3;
- (void)setCountOfScrapPapersWithInlineDrawingV2:(unint64_t)a3;
- (void)setCountOfScrapPapersWithMapLink:(unint64_t)a3;
- (void)setCountOfScrapPapersWithMentions:(unint64_t)a3;
- (void)setCountOfScrapPapersWithOtherAttachments:(unint64_t)a3;
- (void)setCountOfScrapPapersWithPaperKit:(unint64_t)a3;
- (void)setCountOfScrapPapersWithRichUrl:(unint64_t)a3;
- (void)setCountOfScrapPapersWithTables:(unint64_t)a3;
- (void)setCountOfScrapPapersWithTags:(unint64_t)a3;
- (void)setCountOfV1LockedNotes:(unint64_t)a3;
- (void)setCountOfV2LockedNotes:(unint64_t)a3;
- (void)setScrapPaperCount:(unint64_t)a3;
- (void)updateNoteCollaborationMatrixWithCollaborationStatus:(id)a3 collaborationType:(id)a4;
- (void)updateNoteTwoFactorMatrixWithIndex:(int64_t)a3;
@end

@implementation _ICNANoteReportToAccount

- (_ICNANoteReportToAccount)init
{
  v3.receiver = self;
  v3.super_class = (Class)_ICNANoteReportToAccount;
  result = [(_ICNANoteReportToAccount *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_noteTwoFactorMatrix[0][0] = 0u;
    result->_noteCollaborationMatrix[2][2] = 0;
    *(_OWORD *)&result->_noteCollaborationMatrix[0][0] = 0u;
    *(_OWORD *)&result->_noteCollaborationMatrix[1][1] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[9][2] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[9][6] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[8][4] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[8][8] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[7][6] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[8][0] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[6][8] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[7][2] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[6][0] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[6][4] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[5][2] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[5][6] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[4][4] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[4][8] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[3][6] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[4][0] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[2][8] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[3][2] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[2][0] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[2][4] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[1][2] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[1][6] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[0][4] = 0u;
    *(_OWORD *)&result->_noteTwoFactorMatrix[0][8] = 0u;
  }
  return result;
}

- (void)updateNoteTwoFactorMatrixWithIndex:(int64_t)a3
{
  if (a3 < 1) {
    goto LABEL_5;
  }
  objc_super v3 = &self->_noteTwoFactorMatrix[0][a3];
  int64_t v4 = a3;
  do
  {
    float v5 = *v3 + 0.51;
    *objc_super v3 = v5;
    v3 += 10;
    --v4;
  }
  while (v4);
  if (a3 <= 8)
  {
LABEL_5:
    int64_t v6 = a3 - 9;
    v7 = &self->_noteTwoFactorMatrix[0][11 * a3 + 1];
    do
    {
      float v8 = *v7 + 0.51;
      *v7++ = v8;
    }
    while (!__CFADD__(v6++, 1));
  }
}

- (void)updateNoteCollaborationMatrixWithCollaborationStatus:(id)a3 collaborationType:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 collaborationStatus];
  int v8 = 3;
  if (v7 == 1) {
    int v8 = 0;
  }
  BOOL v9 = v7 != 2 && v7 != 1;
  if (v7 == 2) {
    int v8 = 1;
  }
  BOOL v10 = v7 != 3 && v9;
  if (v7 == 3) {
    unsigned int v11 = 2;
  }
  else {
    unsigned int v11 = v8;
  }
  uint64_t v12 = [v6 collaborationType];

  if ((unint64_t)(v12 - 1) <= 2 && !v10)
  {
    v13 = (char *)self + 12 * v11 + 4 * v12 - 4;
    ++*((_DWORD *)v13 + 102);
  }
}

- (void)completeTwoFactorMatrixReportingForCurrentNote
{
  uint64_t v2 = 0;
  objc_super v3 = &self->_noteTwoFactorMatrix[0][1];
  do
  {
    uint64_t v4 = 0;
    uint64_t v5 = v2++;
    do
    {
      v3[v4] = floorf(v3[v4]);
      ++v4;
    }
    while (v5 + v4 != 9);
    v3 += 11;
  }
  while (v2 != 9);
}

- (unint64_t)countOfNotesWithFactor:(int64_t)a3 andFactor:(int64_t)a4
{
  uint64_t v4 = &self->_noteTwoFactorMatrix[a3][a4];
  if (a3 > a4) {
    uint64_t v4 = &self->_noteTwoFactorMatrix[a4][a3];
  }
  return (unint64_t)*v4;
}

- (unint64_t)countOfNotesWithCollaborationStatus:(int64_t)a3 collaborationType:(int64_t)a4
{
  return self->_noteCollaborationMatrix[a3][a4];
}

- (unint64_t)countOfNotesWithDocScan
{
  return self->_countOfNotesWithDocScan;
}

- (void)setCountOfNotesWithDocScan:(unint64_t)a3
{
  self->_countOfNotesWithDocScan = a3;
}

- (unint64_t)countOfNotesWithInlineDrawingV1
{
  return self->_countOfNotesWithInlineDrawingV1;
}

- (void)setCountOfNotesWithInlineDrawingV1:(unint64_t)a3
{
  self->_countOfNotesWithInlineDrawingV1 = a3;
}

- (unint64_t)countOfNotesWithInlineDrawingV2
{
  return self->_countOfNotesWithInlineDrawingV2;
}

- (void)setCountOfNotesWithInlineDrawingV2:(unint64_t)a3
{
  self->_countOfNotesWithInlineDrawingV2 = a3;
}

- (unint64_t)countOfNotesWithFullscreenDrawing
{
  return self->_countOfNotesWithFullscreenDrawing;
}

- (void)setCountOfNotesWithFullscreenDrawing:(unint64_t)a3
{
  self->_countOfNotesWithFullscreenDrawing = a3;
}

- (unint64_t)countOfNotesWithTable
{
  return self->_countOfNotesWithTable;
}

- (void)setCountOfNotesWithTable:(unint64_t)a3
{
  self->_countOfNotesWithTable = a3;
}

- (unint64_t)countOfNotesWithRichURL
{
  return self->_countOfNotesWithRichURL;
}

- (void)setCountOfNotesWithRichURL:(unint64_t)a3
{
  self->_countOfNotesWithRichURL = a3;
}

- (unint64_t)countOfNotesWithMapLink
{
  return self->_countOfNotesWithMapLink;
}

- (void)setCountOfNotesWithMapLink:(unint64_t)a3
{
  self->_countOfNotesWithMapLink = a3;
}

- (unint64_t)countOfNotesWithOtherAttachments
{
  return self->_countOfNotesWithOtherAttachments;
}

- (void)setCountOfNotesWithOtherAttachments:(unint64_t)a3
{
  self->_countOfNotesWithOtherAttachments = a3;
}

- (unint64_t)countOfNotesWithPaperKit
{
  return self->_countOfNotesWithPaperKit;
}

- (void)setCountOfNotesWithPaperKit:(unint64_t)a3
{
  self->_countOfNotesWithPaperKit = a3;
}

- (unint64_t)countOfNotesWithDeepLink
{
  return self->_countOfNotesWithDeepLink;
}

- (void)setCountOfNotesWithDeepLink:(unint64_t)a3
{
  self->_countOfNotesWithDeepLink = a3;
}

- (unint64_t)countOfNotesWithPaperDocument
{
  return self->_countOfNotesWithPaperDocument;
}

- (void)setCountOfNotesWithPaperDocument:(unint64_t)a3
{
  self->_countOfNotesWithPaperDocument = a3;
}

- (unint64_t)countOfNotesWithPDF
{
  return self->_countOfNotesWithPDF;
}

- (void)setCountOfNotesWithPDF:(unint64_t)a3
{
  self->_countOfNotesWithPDF = a3;
}

- (unint64_t)countOfNotesWithNoteLink
{
  return self->_countOfNotesWithNoteLink;
}

- (void)setCountOfNotesWithNoteLink:(unint64_t)a3
{
  self->_countOfNotesWithNoteLink = a3;
}

- (unint64_t)countOfNotesWithFolderLink
{
  return self->_countOfNotesWithFolderLink;
}

- (void)setCountOfNotesWithFolderLink:(unint64_t)a3
{
  self->_countOfNotesWithFolderLink = a3;
}

- (unint64_t)countOfNotesWithMathUsage
{
  return self->_countOfNotesWithMathUsage;
}

- (void)setCountOfNotesWithMathUsage:(unint64_t)a3
{
  self->_countOfNotesWithMathUsage = a3;
}

- (unint64_t)countOfNotesWithAttachmentAudio
{
  return self->_countOfNotesWithAttachmentAudio;
}

- (void)setCountOfNotesWithAttachmentAudio:(unint64_t)a3
{
  self->_countOfNotesWithAttachmentAudio = a3;
}

- (unint64_t)countOfNotesWithAttachmentAudioTranscript
{
  return self->_countOfNotesWithAttachmentAudioTranscript;
}

- (void)setCountOfNotesWithAttachmentAudioTranscript:(unint64_t)a3
{
  self->_countOfNotesWithAttachmentAudioTranscript = a3;
}

- (unint64_t)countOfNotesWithAttachmentAudioSummary
{
  return self->_countOfNotesWithAttachmentAudioSummary;
}

- (void)setCountOfNotesWithAttachmentAudioSummary:(unint64_t)a3
{
  self->_countOfNotesWithAttachmentAudioSummary = a3;
}

- (unint64_t)countOfAudioAttachments
{
  return self->_countOfAudioAttachments;
}

- (void)setCountOfAudioAttachments:(unint64_t)a3
{
  self->_countOfAudioAttachments = a3;
}

- (unint64_t)countOfAudioAttachmentsRecordedInNotes
{
  return self->_countOfAudioAttachmentsRecordedInNotes;
}

- (void)setCountOfAudioAttachmentsRecordedInNotes:(unint64_t)a3
{
  self->_countOfAudioAttachmentsRecordedInNotes = a3;
}

- (unint64_t)countOfAudioAttachmentsWithAppendedAudio
{
  return self->_countOfAudioAttachmentsWithAppendedAudio;
}

- (void)setCountOfAudioAttachmentsWithAppendedAudio:(unint64_t)a3
{
  self->_countOfAudioAttachmentsWithAppendedAudio = a3;
}

- (unint64_t)countOfNotesWithTags
{
  return self->_countOfNotesWithTags;
}

- (void)setCountOfNotesWithTags:(unint64_t)a3
{
  self->_countOfNotesWithTags = a3;
}

- (unint64_t)countOfNotesWithMentions
{
  return self->_countOfNotesWithMentions;
}

- (void)setCountOfNotesWithMentions:(unint64_t)a3
{
  self->_countOfNotesWithMentions = a3;
}

- (unint64_t)scrapPaperCount
{
  return self->_scrapPaperCount;
}

- (void)setScrapPaperCount:(unint64_t)a3
{
  self->_scrapPaperCount = a3;
}

- (unint64_t)countOfScrapPapersWithTags
{
  return self->_countOfScrapPapersWithTags;
}

- (void)setCountOfScrapPapersWithTags:(unint64_t)a3
{
  self->_countOfScrapPapersWithTags = a3;
}

- (unint64_t)countOfScrapPapersWithMentions
{
  return self->_countOfScrapPapersWithMentions;
}

- (void)setCountOfScrapPapersWithMentions:(unint64_t)a3
{
  self->_countOfScrapPapersWithMentions = a3;
}

- (unint64_t)countOfPinnedScrapPapers
{
  return self->_countOfPinnedScrapPapers;
}

- (void)setCountOfPinnedScrapPapers:(unint64_t)a3
{
  self->_countOfPinnedScrapPapers = a3;
}

- (unint64_t)countOfLockedScrapPapers
{
  return self->_countOfLockedScrapPapers;
}

- (void)setCountOfLockedScrapPapers:(unint64_t)a3
{
  self->_countOfLockedScrapPapers = a3;
}

- (unint64_t)countOfCollaboratedScrapPapers
{
  return self->_countOfCollaboratedScrapPapers;
}

- (void)setCountOfCollaboratedScrapPapers:(unint64_t)a3
{
  self->_countOfCollaboratedScrapPapers = a3;
}

- (unint64_t)countOfScrapPapersWithDocScan
{
  return self->_countOfScrapPapersWithDocScan;
}

- (void)setCountOfScrapPapersWithDocScan:(unint64_t)a3
{
  self->_countOfScrapPapersWithDocScan = a3;
}

- (unint64_t)countOfScrapPapersWithInlineDrawingV1
{
  return self->_countOfScrapPapersWithInlineDrawingV1;
}

- (void)setCountOfScrapPapersWithInlineDrawingV1:(unint64_t)a3
{
  self->_countOfScrapPapersWithInlineDrawingV1 = a3;
}

- (unint64_t)countOfScrapPapersWithInlineDrawingV2
{
  return self->_countOfScrapPapersWithInlineDrawingV2;
}

- (void)setCountOfScrapPapersWithInlineDrawingV2:(unint64_t)a3
{
  self->_countOfScrapPapersWithInlineDrawingV2 = a3;
}

- (unint64_t)countOfScrapPapersWithFullscreenDrawing
{
  return self->_countOfScrapPapersWithFullscreenDrawing;
}

- (void)setCountOfScrapPapersWithFullscreenDrawing:(unint64_t)a3
{
  self->_countOfScrapPapersWithFullscreenDrawing = a3;
}

- (unint64_t)countOfScrapPapersWithTables
{
  return self->_countOfScrapPapersWithTables;
}

- (void)setCountOfScrapPapersWithTables:(unint64_t)a3
{
  self->_countOfScrapPapersWithTables = a3;
}

- (unint64_t)countOfScrapPapersWithRichUrl
{
  return self->_countOfScrapPapersWithRichUrl;
}

- (void)setCountOfScrapPapersWithRichUrl:(unint64_t)a3
{
  self->_countOfScrapPapersWithRichUrl = a3;
}

- (unint64_t)countOfScrapPapersWithMapLink
{
  return self->_countOfScrapPapersWithMapLink;
}

- (void)setCountOfScrapPapersWithMapLink:(unint64_t)a3
{
  self->_countOfScrapPapersWithMapLink = a3;
}

- (unint64_t)countOfScrapPapersWithOtherAttachments
{
  return self->_countOfScrapPapersWithOtherAttachments;
}

- (void)setCountOfScrapPapersWithOtherAttachments:(unint64_t)a3
{
  self->_countOfScrapPapersWithOtherAttachments = a3;
}

- (unint64_t)countOfScrapPapersWithPaperKit
{
  return self->_countOfScrapPapersWithPaperKit;
}

- (void)setCountOfScrapPapersWithPaperKit:(unint64_t)a3
{
  self->_countOfScrapPapersWithPaperKit = a3;
}

- (unint64_t)countOfScrapPapersWithDeepLink
{
  return self->_countOfScrapPapersWithDeepLink;
}

- (void)setCountOfScrapPapersWithDeepLink:(unint64_t)a3
{
  self->_countOfScrapPapersWithDeepLink = a3;
}

- (unint64_t)countOfNotes
{
  return self->_countOfNotes;
}

- (void)setCountOfNotes:(unint64_t)a3
{
  self->_countOfNotes = a3;
}

- (unint64_t)countOfChecklists
{
  return self->_countOfChecklists;
}

- (void)setCountOfChecklists:(unint64_t)a3
{
  self->_countOfChecklists = a3;
}

- (unint64_t)countOfNotesWithChecklists
{
  return self->_countOfNotesWithChecklists;
}

- (void)setCountOfNotesWithChecklists:(unint64_t)a3
{
  self->_countOfNotesWithChecklists = a3;
}

- (unint64_t)countOfNotesWithCollapsedSections
{
  return self->_countOfNotesWithCollapsedSections;
}

- (void)setCountOfNotesWithCollapsedSections:(unint64_t)a3
{
  self->_countOfNotesWithCollapsedSections = a3;
}

- (unint64_t)countOfPinnedNotes
{
  return self->_countOfPinnedNotes;
}

- (void)setCountOfPinnedNotes:(unint64_t)a3
{
  self->_countOfPinnedNotes = a3;
}

- (unint64_t)countOfLockedNotes
{
  return self->_countOfLockedNotes;
}

- (void)setCountOfLockedNotes:(unint64_t)a3
{
  self->_countOfLockedNotes = a3;
}

- (unint64_t)countOfV1LockedNotes
{
  return self->_countOfV1LockedNotes;
}

- (void)setCountOfV1LockedNotes:(unint64_t)a3
{
  self->_countOfV1LockedNotes = a3;
}

- (unint64_t)countOfV2LockedNotes
{
  return self->_countOfV2LockedNotes;
}

- (void)setCountOfV2LockedNotes:(unint64_t)a3
{
  self->_countOfV2LockedNotes = a3;
}

- (unint64_t)countOfLockedNotesWithDivergedMode
{
  return self->_countOfLockedNotesWithDivergedMode;
}

- (void)setCountOfLockedNotesWithDivergedMode:(unint64_t)a3
{
  self->_countOfLockedNotesWithDivergedMode = a3;
}

- (unint64_t)countOfLockedNotesWithDivergedPassword
{
  return self->_countOfLockedNotesWithDivergedPassword;
}

- (void)setCountOfLockedNotesWithDivergedPassword:(unint64_t)a3
{
  self->_countOfLockedNotesWithDivergedPassword = a3;
}

@end