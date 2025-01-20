@interface WDDocument
- (BOOL)autoHyphenate;
- (BOOL)bookFold;
- (BOOL)borderSurroundFooter;
- (BOOL)borderSurroundHeader;
- (BOOL)evenAndOddHeaders;
- (BOOL)isFromBinary;
- (BOOL)kinsokuStrict;
- (BOOL)mirrorMargins;
- (BOOL)noTabForHangingIndents;
- (BOOL)showComments;
- (BOOL)showFormatting;
- (BOOL)showInsertionsAndDeletions;
- (BOOL)showMarkup;
- (BOOL)showOutline;
- (BOOL)showRevisionMarksOnScreen;
- (BOOL)trackChanges;
- (WDDocument)init;
- (id)addImageBulletText;
- (id)addSection;
- (id)annotationBlockIterator;
- (id)annotationIterator;
- (id)applicationName;
- (id)changeTrackingEditAuthors;
- (id)changeTrackingEditDates;
- (id)citationFor:(id)a3;
- (id)citationTable;
- (id)colorMap;
- (id)creationDate;
- (id)description;
- (id)documentBackground;
- (id)endnoteBlockIterator;
- (id)endnoteContinuationNotice;
- (id)endnoteContinuationSeparator;
- (id)endnoteIterator;
- (id)endnoteSeparator;
- (id)fontTable;
- (id)footnoteBlockIterator;
- (id)footnoteContinuationNotice;
- (id)footnoteContinuationSeparator;
- (id)footnoteIterator;
- (id)footnoteSeparator;
- (id)imageBulletParagraph;
- (id)imageBulletText;
- (id)imageBulletWithCharacterOffset:(int)a3;
- (id)imageBullets;
- (id)kinsokuAltBreakAfter;
- (id)kinsokuAltBreakBefore;
- (id)language;
- (id)lastModDate;
- (id)lastSection;
- (id)listDefinitionTable;
- (id)listDefinitionWithListDefinitionId:(int)a3;
- (id)listDefinitionWithListId:(int)a3;
- (id)listLevelWithListId:(int)a3 levelIndex:(unsigned __int8)a4;
- (id)listTable;
- (id)listWithListId:(int)a3;
- (id)mainBlocksIterator;
- (id)mainRunsIterator;
- (id)newAnnotationBlockIterator;
- (id)newAnnotationIterator;
- (id)newEndnoteBlockIterator;
- (id)newEndnoteIterator;
- (id)newFootnoteBlockIterator;
- (id)newFootnoteIterator;
- (id)newMainBlocksIterator;
- (id)newMainRunsIterator;
- (id)newSectionIterator;
- (id)oleFilename;
- (id)revisionAuthorAt:(unint64_t)a3;
- (id)revisionAuthorTable;
- (id)sectionAt:(unint64_t)a3;
- (id)sectionIterator;
- (id)sections;
- (id)styleSheet;
- (id)version;
- (int)endnoteNumberFormat;
- (int)endnotePosition;
- (int)endnoteRestart;
- (int)footnoteNumberFormat;
- (int)footnotePosition;
- (int)footnoteRestart;
- (int)gutterPosition;
- (signed)zoomPercentage;
- (unint64_t)citationCount;
- (unint64_t)revisionAuthorAddLookup:(id)a3;
- (unint64_t)revisionAuthorCount;
- (unint64_t)sectionCount;
- (unsigned)defaultTabWidth;
- (unsigned)footnoteNumberingStart;
- (void)addChangeTrackingEditAtDate:(id)a3 authorIndex:(int)a4;
- (void)addCitation:(id)a3 forID:(id)a4;
- (void)addImageBullets;
- (void)addObjPointer:(id)a3;
- (void)addRevisionAuthor:(id)a3;
- (void)removeEmptySections;
- (void)removeObjPointer:(id)a3;
- (void)setAutoHyphenate:(BOOL)a3;
- (void)setBookFold:(BOOL)a3;
- (void)setBorderSurroundFooter:(BOOL)a3;
- (void)setBorderSurroundHeader:(BOOL)a3;
- (void)setColorMap:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDefaultTabWidth:(unsigned __int16)a3;
- (void)setDocumentBackground:(id)a3;
- (void)setEndnoteNumberFormat:(int)a3;
- (void)setEndnotePosition:(int)a3;
- (void)setEndnoteRestart:(int)a3;
- (void)setEvenAndOddHeaders:(BOOL)a3;
- (void)setFootnoteNumberFormat:(int)a3;
- (void)setFootnoteNumberingStart:(unsigned __int16)a3;
- (void)setFootnotePosition:(int)a3;
- (void)setFootnoteRestart:(int)a3;
- (void)setGutterPosition:(int)a3;
- (void)setKinsokuAltBreakAfter:(id)a3;
- (void)setKinsokuAltBreakBefore:(id)a3;
- (void)setKinsokuStrict:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLastModDate:(id)a3;
- (void)setMirrorMargins:(BOOL)a3;
- (void)setNoTabForHangingIndents:(BOOL)a3;
- (void)setOleFilename:(id)a3;
- (void)setShowComments:(BOOL)a3;
- (void)setShowFormatting:(BOOL)a3;
- (void)setShowInsertionsAndDeletions:(BOOL)a3;
- (void)setShowMarkup:(BOOL)a3;
- (void)setShowOutline:(BOOL)a3;
- (void)setShowRevisionMarksOnScreen:(BOOL)a3;
- (void)setTrackChanges:(BOOL)a3;
- (void)setVersion:(id)a3;
- (void)setZoomPercentage:(signed __int16)a3;
@end

@implementation WDDocument

- (WDDocument)init
{
  v45.receiver = self;
  v45.super_class = (Class)WDDocument;
  v2 = [(OCDDocument *)&v45 init];
  v3 = v2;
  if (v2)
  {
    v2->mZoomPercentage = 100;
    v4 = objc_alloc_init(WDFontTable);
    mFontTable = v3->mFontTable;
    v3->mFontTable = v4;

    v6 = [[WDStyleSheet alloc] initWithDocument:v3];
    mStyleSheet = v3->mStyleSheet;
    v3->mStyleSheet = v6;

    v8 = [[WDListDefinitionTable alloc] initWithDocument:v3];
    mListDefinitionTable = v3->mListDefinitionTable;
    v3->mListDefinitionTable = v8;

    v10 = [[WDListTable alloc] initWithDocument:v3];
    mListTable = v3->mListTable;
    v3->mListTable = v10;

    v12 = [[WDRevisionAuthorTable alloc] initWithDocument:v3];
    mRevisionAuthorTable = v3->mRevisionAuthorTable;
    v3->mRevisionAuthorTable = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mSections = v3->mSections;
    v3->mSections = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mChangeTrackingEditDates = v3->mChangeTrackingEditDates;
    v3->mChangeTrackingEditDates = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mChangeTrackingEditAuthors = v3->mChangeTrackingEditAuthors;
    v3->mChangeTrackingEditAuthors = v18;

    v20 = [[WDCitationTable alloc] initWithDocument:v3];
    mCitationTable = v3->mCitationTable;
    v3->mCitationTable = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mObjPointers = v3->mObjPointers;
    v3->mObjPointers = v22;

    v24 = [[WDText alloc] initWithDocument:v3 textType:2];
    mFootnoteSeparator = v3->mFootnoteSeparator;
    v3->mFootnoteSeparator = v24;

    v26 = [[WDText alloc] initWithDocument:v3 textType:2];
    mFootnoteContinuationSeparator = v3->mFootnoteContinuationSeparator;
    v3->mFootnoteContinuationSeparator = v26;

    v28 = [[WDText alloc] initWithDocument:v3 textType:2];
    mFootnoteContinuationNotice = v3->mFootnoteContinuationNotice;
    v3->mFootnoteContinuationNotice = v28;

    v30 = [[WDText alloc] initWithDocument:v3 textType:2];
    mEndnoteSeparator = v3->mEndnoteSeparator;
    v3->mEndnoteSeparator = v30;

    v32 = [[WDText alloc] initWithDocument:v3 textType:2];
    mEndnoteContinuationSeparator = v3->mEndnoteContinuationSeparator;
    v3->mEndnoteContinuationSeparator = v32;

    v34 = [[WDText alloc] initWithDocument:v3 textType:2];
    mEndnoteContinuationNotice = v3->mEndnoteContinuationNotice;
    v3->mEndnoteContinuationNotice = v34;

    v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mDocumentImages = v3->mDocumentImages;
    v3->mDocumentImages = v36;

    v38 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mImageBullets = v3->mImageBullets;
    v3->mImageBullets = v38;

    v3->mFootnoteNumberingStart = 1;
    v3->mFootnotePosition = 1;
    v3->mFootnoteNumberFormat = 0;
    v3->mEndnotePosition = 3;
    v3->mEndnoteNumberFormat = 2;
    v40 = objc_alloc_init(OADBackgroundProperties);
    mDocumentBackground = v3->mDocumentBackground;
    v3->mDocumentBackground = &v40->super;

    v42 = v3->mDocumentBackground;
    v43 = +[OADNullFill nullFill];
    [(OADBackground *)v42 setFill:v43];
  }
  return v3;
}

- (id)fontTable
{
  return self->mFontTable;
}

- (void)setTrackChanges:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 297) = *((unsigned char *)self + 297) & 0xFD | v3;
}

- (void)setShowRevisionMarksOnScreen:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 297) = *((unsigned char *)self + 297) & 0xFB | v3;
}

- (void)setShowInsertionsAndDeletions:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 297) = *((unsigned char *)self + 297) & 0xF7 | v3;
}

- (void)setShowFormatting:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 297) = *((unsigned char *)self + 297) & 0xEF | v3;
}

- (void)setShowMarkup:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 296) = v3 & 0x80 | *((unsigned char *)self + 296) & 0x7F;
}

- (void)setShowComments:(BOOL)a3
{
  *((unsigned char *)self + 297) = *((unsigned char *)self + 297) & 0xFE | a3;
}

- (void)setMirrorMargins:(BOOL)a3
{
  *((unsigned char *)self + 296) = *((unsigned char *)self + 296) & 0xFE | a3;
}

- (void)setBorderSurroundHeader:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 296) = *((unsigned char *)self + 296) & 0xFD | v3;
}

- (void)setBorderSurroundFooter:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 296) = *((unsigned char *)self + 296) & 0xFB | v3;
}

- (void)setDefaultTabWidth:(unsigned __int16)a3
{
  self->mDefaultTabWidth = a3;
}

- (void)setAutoHyphenate:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 296) = *((unsigned char *)self + 296) & 0xEF | v3;
}

- (void)setEvenAndOddHeaders:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 296) = *((unsigned char *)self + 296) & 0xDF | v3;
}

- (void)setFootnotePosition:(int)a3
{
  self->mFootnotePosition = a3;
}

- (void)setEndnotePosition:(int)a3
{
  self->mEndnotePosition = a3;
}

- (void)setFootnoteNumberFormat:(int)a3
{
  self->mFootnoteNumberFormat = a3;
}

- (void)setEndnoteNumberFormat:(int)a3
{
  self->mEndnoteNumberFormat = a3;
}

- (void)setFootnoteRestart:(int)a3
{
  self->mFootnoteRestart = a3;
}

- (void)setEndnoteRestart:(int)a3
{
  self->mEndnoteRestart = a3;
}

- (void)setFootnoteNumberingStart:(unsigned __int16)a3
{
  self->mFootnoteNumberingStart = a3;
}

- (void)setGutterPosition:(int)a3
{
  self->mGutterPosition = a3;
}

- (void)setBookFold:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 296) = *((unsigned char *)self + 296) & 0xBF | v3;
}

- (void)setZoomPercentage:(signed __int16)a3
{
  self->mZoomPercentage = a3;
}

- (void)setShowOutline:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 297) = *((unsigned char *)self + 297) & 0xDF | v3;
}

- (void)setKinsokuStrict:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 296) = *((unsigned char *)self + 296) & 0xF7 | v3;
}

- (void)setOleFilename:(id)a3
{
}

- (id)styleSheet
{
  return self->mStyleSheet;
}

- (id)imageBullets
{
  return self->mImageBullets;
}

- (id)listDefinitionTable
{
  return self->mListDefinitionTable;
}

- (id)listTable
{
  return self->mListTable;
}

- (id)revisionAuthorTable
{
  return self->mRevisionAuthorTable;
}

- (id)addSection
{
  char v3 = [[WDSection alloc] initWithDocument:self];
  [(NSMutableArray *)self->mSections addObject:v3];
  return v3;
}

- (id)footnoteSeparator
{
  return self->mFootnoteSeparator;
}

- (id)footnoteContinuationSeparator
{
  return self->mFootnoteContinuationSeparator;
}

- (id)footnoteContinuationNotice
{
  return self->mFootnoteContinuationNotice;
}

- (id)endnoteSeparator
{
  return self->mEndnoteSeparator;
}

- (id)endnoteContinuationSeparator
{
  return self->mEndnoteContinuationSeparator;
}

- (id)endnoteContinuationNotice
{
  return self->mEndnoteContinuationNotice;
}

- (unint64_t)sectionCount
{
  return [(NSMutableArray *)self->mSections count];
}

- (id)sections
{
  return self->mSections;
}

- (id)sectionAt:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mSections objectAtIndex:a3];
}

- (unsigned)defaultTabWidth
{
  return self->mDefaultTabWidth;
}

- (void)addObjPointer:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(NSMutableSet *)self->mObjPointers addObject:v4];
  }
}

- (void)setDocumentBackground:(id)a3
{
}

- (id)addImageBulletText
{
  mImageBulletText = self->mImageBulletText;
  if (!mImageBulletText)
  {
    id v4 = [[WDText alloc] initWithDocument:self textType:0];
    v5 = self->mImageBulletText;
    self->mImageBulletText = v4;

    mImageBulletText = self->mImageBulletText;
  }
  return mImageBulletText;
}

- (id)imageBulletWithCharacterOffset:(int)a3
{
  if ((int)[(NSMutableArray *)self->mImageBullets count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->mImageBullets objectAtIndex:a3];
  }
  return v5;
}

- (id)lastSection
{
  return (id)[(NSMutableArray *)self->mSections lastObject];
}

- (id)oleFilename
{
  return self->mOleFilename;
}

- (void)addChangeTrackingEditAtDate:(id)a3 authorIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(NSMutableArray *)self->mChangeTrackingEditDates addObject:a3];
  id v6 = (id)[objc_alloc(NSNumber) initWithInt:v4];
  -[NSMutableArray addObject:](self->mChangeTrackingEditAuthors, "addObject:");
}

- (void)setKinsokuAltBreakAfter:(id)a3
{
}

- (void)setKinsokuAltBreakBefore:(id)a3
{
}

- (id)imageBulletParagraph
{
  mImageBulletText = self->mImageBulletText;
  if (!mImageBulletText)
  {
    uint64_t v4 = [[WDText alloc] initWithDocument:self textType:0];
    v5 = self->mImageBulletText;
    self->mImageBulletText = v4;

    mImageBulletText = self->mImageBulletText;
  }
  if (![(WDText *)mImageBulletText blockCount])
  {
    id v6 = [(WDText *)self->mImageBulletText addParagraph];
    id v7 = (id)[v6 addBookmark:@"_PictureBullets" type:0];
  }
  v8 = self->mImageBulletText;
  return [(WDText *)v8 blockAt:0];
}

- (void)removeObjPointer:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(NSMutableSet *)self->mObjPointers removeObject:v4];
  }
}

- (BOOL)mirrorMargins
{
  return *((unsigned char *)self + 296) & 1;
}

- (BOOL)borderSurroundHeader
{
  return (*((unsigned __int8 *)self + 296) >> 1) & 1;
}

- (BOOL)borderSurroundFooter
{
  return (*((unsigned __int8 *)self + 296) >> 2) & 1;
}

- (id)kinsokuAltBreakBefore
{
  return self->mKinsokuAltBreakBefore;
}

- (id)kinsokuAltBreakAfter
{
  return self->mKinsokuAltBreakAfter;
}

- (BOOL)kinsokuStrict
{
  return (*((unsigned __int8 *)self + 296) >> 3) & 1;
}

- (BOOL)autoHyphenate
{
  return (*((unsigned __int8 *)self + 296) >> 4) & 1;
}

- (BOOL)evenAndOddHeaders
{
  return (*((unsigned __int8 *)self + 296) >> 5) & 1;
}

- (int)footnoteNumberFormat
{
  return self->mFootnoteNumberFormat;
}

- (int)endnoteNumberFormat
{
  return self->mEndnoteNumberFormat;
}

- (int)footnotePosition
{
  return self->mFootnotePosition;
}

- (int)endnotePosition
{
  return self->mEndnotePosition;
}

- (int)footnoteRestart
{
  return self->mFootnoteRestart;
}

- (int)endnoteRestart
{
  return self->mEndnoteRestart;
}

- (unsigned)footnoteNumberingStart
{
  return self->mFootnoteNumberingStart;
}

- (unint64_t)citationCount
{
  return [(WDCitationTable *)self->mCitationTable count];
}

- (id)citationFor:(id)a3
{
  char v3 = [(WDCitationTable *)self->mCitationTable citationFor:a3];
  return v3;
}

- (void)addCitation:(id)a3 forID:(id)a4
{
}

- (id)citationTable
{
  return self->mCitationTable;
}

- (id)listDefinitionWithListDefinitionId:(int)a3
{
  return [(WDListDefinitionTable *)self->mListDefinitionTable resolvedDefinitionWithDefinitionId:*(void *)&a3];
}

- (id)listDefinitionWithListId:(int)a3
{
  id v4 = [(WDDocument *)self listWithListId:*(void *)&a3];
  v5 = v4;
  if (v4)
  {
    id v6 = -[WDDocument listDefinitionWithListDefinitionId:](self, "listDefinitionWithListDefinitionId:", [v4 listDefinitionId]);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)listWithListId:(int)a3
{
  return [(WDListTable *)self->mListTable listWithListId:*(void *)&a3];
}

- (id)listLevelWithListId:(int)a3 levelIndex:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = -[WDDocument listWithListId:](self, "listWithListId:");
  v8 = [v7 levelOverrideForLevel:v4];
  if ([v8 isListLevelOverridden])
  {
    v9 = [v8 listLevel];
  }
  else
  {
    v10 = [(WDDocument *)self listDefinitionWithListId:v5];
    v9 = [v10 levelAt:v4];
  }
  return v9;
}

- (int)gutterPosition
{
  return self->mGutterPosition;
}

- (BOOL)bookFold
{
  return (*((unsigned __int8 *)self + 296) >> 6) & 1;
}

- (signed)zoomPercentage
{
  return self->mZoomPercentage;
}

- (id)applicationName
{
  return @"Word";
}

- (void)addImageBullets
{
  if (!self->mImageBulletText) {
    return;
  }
  id v13 = [(WDDocument *)self imageBulletParagraph];
  id v3 = (id)[v13 addBookmark:@"_PictureBullets" type:1];
  uint64_t v4 = [(NSMutableArray *)self->mSections lastObject];
  uint64_t v5 = [v4 text];

  uint64_t v6 = [v5 blockCount];
  if (v6)
  {
    id v7 = [v5 blockAt:v6 - 1];
    v8 = v7;
    if (v7 && ![v7 blockType])
    {
      id v9 = v8;
      uint64_t v10 = [v13 runCount];
      if (v10)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          v12 = [v13 runAt:i];
          [v9 addRun:v12];
        }
      }

      goto LABEL_12;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;
  [v5 addBlock:v13];
LABEL_12:
}

- (id)version
{
  return self->mVersion;
}

- (void)setVersion:(id)a3
{
}

- (id)language
{
  return self->mLanguage;
}

- (void)setLanguage:(id)a3
{
}

- (unint64_t)revisionAuthorCount
{
  return [(WDRevisionAuthorTable *)self->mRevisionAuthorTable authorCount];
}

- (id)revisionAuthorAt:(unint64_t)a3
{
  if (a3 == -1)
  {
    uint64_t v4 = TCBundle();
    id v3 = [v4 localizedStringForKey:@"Unknown" value:&stru_26EBF24D8 table:@"TCCompatibility"];
  }
  else
  {
    id v3 = -[WDRevisionAuthorTable authorAt:](self->mRevisionAuthorTable, "authorAt:");
  }
  return v3;
}

- (unint64_t)revisionAuthorAddLookup:(id)a3
{
  return [(WDRevisionAuthorTable *)self->mRevisionAuthorTable authorAddLookup:a3];
}

- (void)addRevisionAuthor:(id)a3
{
}

- (BOOL)showMarkup
{
  return *((unsigned __int8 *)self + 296) >> 7;
}

- (BOOL)showComments
{
  return *((unsigned char *)self + 297) & 1;
}

- (BOOL)trackChanges
{
  return (*((unsigned __int8 *)self + 297) >> 1) & 1;
}

- (BOOL)showRevisionMarksOnScreen
{
  return (*((unsigned __int8 *)self + 297) >> 2) & 1;
}

- (BOOL)showInsertionsAndDeletions
{
  return (*((unsigned __int8 *)self + 297) >> 3) & 1;
}

- (BOOL)showFormatting
{
  return (*((unsigned __int8 *)self + 297) >> 4) & 1;
}

- (BOOL)showOutline
{
  return (*((unsigned __int8 *)self + 297) >> 5) & 1;
}

- (BOOL)noTabForHangingIndents
{
  return (*((unsigned __int8 *)self + 297) >> 6) & 1;
}

- (void)setNoTabForHangingIndents:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 297) = *((unsigned char *)self + 297) & 0xBF | v3;
}

- (id)changeTrackingEditDates
{
  return self->mChangeTrackingEditDates;
}

- (id)changeTrackingEditAuthors
{
  return self->mChangeTrackingEditAuthors;
}

- (id)creationDate
{
  return self->mCreationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (id)lastModDate
{
  return self->mModificationDate;
}

- (void)setLastModDate:(id)a3
{
}

- (id)imageBulletText
{
  return self->mImageBulletText;
}

- (id)documentBackground
{
  return self->mDocumentBackground;
}

- (void)removeEmptySections
{
  uint64_t v3 = [(NSMutableArray *)self->mSections count];
  if (v3)
  {
    uint64_t v4 = v3 - 1;
    do
    {
      uint64_t v5 = [(NSMutableArray *)self->mSections objectAtIndex:v4];
      uint64_t v6 = [v5 text];
      uint64_t v7 = [v6 blockCount];

      if (!v7) {
        [(NSMutableArray *)self->mSections removeObjectAtIndex:v4];
      }

      --v4;
    }
    while (v4 != -1);
  }
}

- (id)sectionIterator
{
  id v2 = [(WDDocument *)self newSectionIterator];
  return v2;
}

- (id)newSectionIterator
{
  uint64_t v3 = [WDArrayIterator alloc];
  mSections = self->mSections;
  return [(WDArrayIterator *)v3 initWithArray:mSections];
}

- (id)mainBlocksIterator
{
  id v2 = [(WDDocument *)self newMainBlocksIterator];
  return v2;
}

- (id)newMainBlocksIterator
{
  id v2 = [(WDDocument *)self newSectionIterator];
  uint64_t v3 = [(WDCombinedIterator *)[WDSectionBlockIterator alloc] initWithParentIterator:v2];

  return v3;
}

- (id)mainRunsIterator
{
  id v2 = [(WDDocument *)self newMainRunsIterator];
  return v2;
}

- (id)newMainRunsIterator
{
  id v2 = [(WDDocument *)self newMainBlocksIterator];
  uint64_t v3 = [(WDCombinedIterator *)[WDBlockRunIterator alloc] initWithParentIterator:v2];

  return v3;
}

- (id)footnoteIterator
{
  id v2 = [(WDDocument *)self newFootnoteIterator];
  return v2;
}

- (id)newFootnoteIterator
{
  id v2 = [(WDDocument *)self newMainRunsIterator];
  uint64_t v3 = [(WDTestIterator *)[WDFootnoteIterator alloc] initWithIterator:v2];

  return v3;
}

- (id)endnoteIterator
{
  id v2 = [(WDDocument *)self newEndnoteIterator];
  return v2;
}

- (id)newEndnoteIterator
{
  id v2 = [(WDDocument *)self newMainRunsIterator];
  uint64_t v3 = [(WDTestIterator *)[WDEndnoteIterator alloc] initWithIterator:v2];

  return v3;
}

- (id)annotationIterator
{
  id v2 = [(WDDocument *)self newAnnotationIterator];
  return v2;
}

- (id)newAnnotationIterator
{
  id v2 = [(WDDocument *)self newMainRunsIterator];
  uint64_t v3 = [(WDTestIterator *)[WDAnnotationIterator alloc] initWithIterator:v2];

  return v3;
}

- (id)footnoteBlockIterator
{
  id v2 = [(WDDocument *)self newFootnoteBlockIterator];
  return v2;
}

- (id)newFootnoteBlockIterator
{
  id v2 = [(WDDocument *)self newFootnoteIterator];
  uint64_t v3 = [(WDCombinedIterator *)[WDNoteBlockIterator alloc] initWithParentIterator:v2];

  return v3;
}

- (id)endnoteBlockIterator
{
  id v2 = [(WDDocument *)self newEndnoteBlockIterator];
  return v2;
}

- (id)newEndnoteBlockIterator
{
  id v2 = [(WDDocument *)self newEndnoteIterator];
  uint64_t v3 = [(WDCombinedIterator *)[WDNoteBlockIterator alloc] initWithParentIterator:v2];

  return v3;
}

- (id)annotationBlockIterator
{
  id v2 = [(WDDocument *)self newAnnotationBlockIterator];
  return v2;
}

- (id)newAnnotationBlockIterator
{
  id v2 = [(WDDocument *)self newAnnotationIterator];
  uint64_t v3 = [(WDCombinedIterator *)[WDNoteBlockIterator alloc] initWithParentIterator:v2];

  return v3;
}

- (BOOL)isFromBinary
{
  return self->mOleFilename != 0;
}

- (id)colorMap
{
  mColorMap = self->mColorMap;
  if (!mColorMap)
  {
    uint64_t v4 = objc_alloc_init(OADColorMap);
    uint64_t v5 = self->mColorMap;
    self->mColorMap = v4;

    [(OADColorMap *)self->mColorMap addDefaultMappings:1];
    mColorMap = self->mColorMap;
  }
  return mColorMap;
}

- (void)setColorMap:(id)a3
{
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDDocument;
  id v2 = [(WDDocument *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColorMap, 0);
  objc_storeStrong((id *)&self->mObjPointers, 0);
  objc_storeStrong((id *)&self->mDocumentBackground, 0);
  objc_storeStrong((id *)&self->mImageBullets, 0);
  objc_storeStrong((id *)&self->mModificationDate, 0);
  objc_storeStrong((id *)&self->mCreationDate, 0);
  objc_storeStrong((id *)&self->mChangeTrackingEditAuthors, 0);
  objc_storeStrong((id *)&self->mChangeTrackingEditDates, 0);
  objc_storeStrong((id *)&self->mDocumentImages, 0);
  objc_storeStrong((id *)&self->mLanguage, 0);
  objc_storeStrong((id *)&self->mVersion, 0);
  objc_storeStrong((id *)&self->mKinsokuAltBreakAfter, 0);
  objc_storeStrong((id *)&self->mKinsokuAltBreakBefore, 0);
  objc_storeStrong((id *)&self->mOleFilename, 0);
  objc_storeStrong((id *)&self->mEndnoteContinuationNotice, 0);
  objc_storeStrong((id *)&self->mEndnoteContinuationSeparator, 0);
  objc_storeStrong((id *)&self->mEndnoteSeparator, 0);
  objc_storeStrong((id *)&self->mFootnoteContinuationNotice, 0);
  objc_storeStrong((id *)&self->mFootnoteContinuationSeparator, 0);
  objc_storeStrong((id *)&self->mFootnoteSeparator, 0);
  objc_storeStrong((id *)&self->mImageBulletText, 0);
  objc_storeStrong((id *)&self->mSections, 0);
  objc_storeStrong((id *)&self->mListTable, 0);
  objc_storeStrong((id *)&self->mCitationTable, 0);
  objc_storeStrong((id *)&self->mRevisionAuthorTable, 0);
  objc_storeStrong((id *)&self->mListDefinitionTable, 0);
  objc_storeStrong((id *)&self->mFontTable, 0);
  objc_storeStrong((id *)&self->mStyleSheet, 0);
}

@end