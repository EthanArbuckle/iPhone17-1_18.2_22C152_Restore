@interface _ICNAAttachmentReportToNote
- (BOOL)hasAudioSummary;
- (BOOL)hasAudioTranscript;
- (BOOL)hasDeepLink;
- (BOOL)hasImages;
- (BOOL)hasMathUsage;
- (BOOL)hasSafariHighlight;
- (NSMutableDictionary)countOfAttachmentByUTI;
- (_ICNAAttachmentReportToNote)init;
- (unint64_t)countOfAttachments;
- (unint64_t)countOfAudioAttachments;
- (unint64_t)countOfAudioAttachmentsRecordedInNotes;
- (unint64_t)countOfAudioAttachmentsWithAppendedAudio;
- (unint64_t)countOfFullscreenDrawingStrokes;
- (unint64_t)countOfInlineDrawingV1FingerStrokes;
- (unint64_t)countOfInlineDrawingV1PencilStrokes;
- (unint64_t)countOfInlineDrawingV2FingerStrokes;
- (unint64_t)countOfInlineDrawingV2PencilStrokes;
- (void)reportAttachmentTypeUTI:(id)a3;
- (void)reportDrawingWithSnapshotData:(id)a3;
- (void)setCountOfAttachmentByUTI:(id)a3;
- (void)setCountOfAttachments:(unint64_t)a3;
- (void)setCountOfAudioAttachments:(unint64_t)a3;
- (void)setCountOfAudioAttachmentsRecordedInNotes:(unint64_t)a3;
- (void)setCountOfAudioAttachmentsWithAppendedAudio:(unint64_t)a3;
- (void)setCountOfFullscreenDrawingStrokes:(unint64_t)a3;
- (void)setCountOfInlineDrawingV1FingerStrokes:(unint64_t)a3;
- (void)setCountOfInlineDrawingV1PencilStrokes:(unint64_t)a3;
- (void)setCountOfInlineDrawingV2FingerStrokes:(unint64_t)a3;
- (void)setCountOfInlineDrawingV2PencilStrokes:(unint64_t)a3;
- (void)setHasAudioSummary:(BOOL)a3;
- (void)setHasAudioTranscript:(BOOL)a3;
- (void)setHasDeepLink:(BOOL)a3;
- (void)setHasImages:(BOOL)a3;
- (void)setHasMathUsage:(BOOL)a3;
- (void)setHasSafariHighlight:(BOOL)a3;
@end

@implementation _ICNAAttachmentReportToNote

- (_ICNAAttachmentReportToNote)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ICNAAttachmentReportToNote;
  v2 = [(_ICNAAttachmentReportToNote *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    countOfAttachmentByUTI = v2->_countOfAttachmentByUTI;
    v2->_countOfAttachmentByUTI = v3;
  }
  return v2;
}

- (void)reportAttachmentTypeUTI:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(_ICNAAttachmentReportToNote *)self countOfAttachmentByUTI];
    objc_super v6 = [v5 objectForKeyedSubscript:v4];
    uint64_t v7 = [v6 unsignedIntegerValue];

    v8 = [NSNumber numberWithUnsignedInteger:v7 + 1];
    v9 = [(_ICNAAttachmentReportToNote *)self countOfAttachmentByUTI];
    [v9 setObject:v8 forKeyedSubscript:v4];

    unint64_t v10 = [(_ICNAAttachmentReportToNote *)self countOfAttachments] + 1;
    [(_ICNAAttachmentReportToNote *)self setCountOfAttachments:v10];
  }
}

- (void)reportDrawingWithSnapshotData:(id)a3
{
  id v4 = a3;
  v5 = [v4 countOfInlineDrawingV1FingerStrokes];
  -[_ICNAAttachmentReportToNote setCountOfInlineDrawingV1FingerStrokes:](self, "setCountOfInlineDrawingV1FingerStrokes:", -[_ICNAAttachmentReportToNote countOfInlineDrawingV1FingerStrokes](self, "countOfInlineDrawingV1FingerStrokes")+ [v5 integerValue]);

  objc_super v6 = [v4 countOfInlineDrawingV1PencilStrokes];
  -[_ICNAAttachmentReportToNote setCountOfInlineDrawingV1PencilStrokes:](self, "setCountOfInlineDrawingV1PencilStrokes:", -[_ICNAAttachmentReportToNote countOfInlineDrawingV1PencilStrokes](self, "countOfInlineDrawingV1PencilStrokes")+ [v6 integerValue]);

  uint64_t v7 = [v4 countOfInlineDrawingV2FingerStrokes];
  -[_ICNAAttachmentReportToNote setCountOfInlineDrawingV2FingerStrokes:](self, "setCountOfInlineDrawingV2FingerStrokes:", -[_ICNAAttachmentReportToNote countOfInlineDrawingV2FingerStrokes](self, "countOfInlineDrawingV2FingerStrokes")+ [v7 integerValue]);

  v8 = [v4 countOfInlineDrawingV2PencilStrokes];
  -[_ICNAAttachmentReportToNote setCountOfInlineDrawingV2PencilStrokes:](self, "setCountOfInlineDrawingV2PencilStrokes:", -[_ICNAAttachmentReportToNote countOfInlineDrawingV2PencilStrokes](self, "countOfInlineDrawingV2PencilStrokes")+ [v8 integerValue]);

  id v9 = [v4 countOfFullscreenDrawingStrokes];

  -[_ICNAAttachmentReportToNote setCountOfFullscreenDrawingStrokes:](self, "setCountOfFullscreenDrawingStrokes:", -[_ICNAAttachmentReportToNote countOfFullscreenDrawingStrokes](self, "countOfFullscreenDrawingStrokes")+ [v9 integerValue]);
}

- (NSMutableDictionary)countOfAttachmentByUTI
{
  return self->_countOfAttachmentByUTI;
}

- (void)setCountOfAttachmentByUTI:(id)a3
{
}

- (unint64_t)countOfAttachments
{
  return self->_countOfAttachments;
}

- (void)setCountOfAttachments:(unint64_t)a3
{
  self->_countOfAttachments = a3;
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

- (unint64_t)countOfInlineDrawingV1PencilStrokes
{
  return self->_countOfInlineDrawingV1PencilStrokes;
}

- (void)setCountOfInlineDrawingV1PencilStrokes:(unint64_t)a3
{
  self->_countOfInlineDrawingV1PencilStrokes = a3;
}

- (unint64_t)countOfInlineDrawingV1FingerStrokes
{
  return self->_countOfInlineDrawingV1FingerStrokes;
}

- (void)setCountOfInlineDrawingV1FingerStrokes:(unint64_t)a3
{
  self->_countOfInlineDrawingV1FingerStrokes = a3;
}

- (unint64_t)countOfInlineDrawingV2PencilStrokes
{
  return self->_countOfInlineDrawingV2PencilStrokes;
}

- (void)setCountOfInlineDrawingV2PencilStrokes:(unint64_t)a3
{
  self->_countOfInlineDrawingV2PencilStrokes = a3;
}

- (unint64_t)countOfInlineDrawingV2FingerStrokes
{
  return self->_countOfInlineDrawingV2FingerStrokes;
}

- (void)setCountOfInlineDrawingV2FingerStrokes:(unint64_t)a3
{
  self->_countOfInlineDrawingV2FingerStrokes = a3;
}

- (unint64_t)countOfFullscreenDrawingStrokes
{
  return self->_countOfFullscreenDrawingStrokes;
}

- (void)setCountOfFullscreenDrawingStrokes:(unint64_t)a3
{
  self->_countOfFullscreenDrawingStrokes = a3;
}

- (BOOL)hasAudioTranscript
{
  return self->_hasAudioTranscript;
}

- (void)setHasAudioTranscript:(BOOL)a3
{
  self->_hasAudioTranscript = a3;
}

- (BOOL)hasAudioSummary
{
  return self->_hasAudioSummary;
}

- (void)setHasAudioSummary:(BOOL)a3
{
  self->_hasAudioSummary = a3;
}

- (BOOL)hasDeepLink
{
  return self->_hasDeepLink;
}

- (void)setHasDeepLink:(BOOL)a3
{
  self->_hasDeepLink = a3;
}

- (BOOL)hasSafariHighlight
{
  return self->_hasSafariHighlight;
}

- (void)setHasSafariHighlight:(BOOL)a3
{
  self->_hasSafariHighlight = a3;
}

- (BOOL)hasImages
{
  return self->_hasImages;
}

- (void)setHasImages:(BOOL)a3
{
  self->_hasImages = a3;
}

- (BOOL)hasMathUsage
{
  return self->_hasMathUsage;
}

- (void)setHasMathUsage:(BOOL)a3
{
  self->_hasMathUsage = a3;
}

- (void).cxx_destruct
{
}

@end