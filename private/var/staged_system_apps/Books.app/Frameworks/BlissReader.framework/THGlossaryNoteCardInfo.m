@interface THGlossaryNoteCardInfo
- (BOOL)darkMode;
- (BOOL)hasBackContent;
- (BOOL)isEmptyCard;
- (BOOL)shouldShowWithStudyOptions:(id)a3;
- (NSString)backTitle;
- (NSString)title;
- (THModelGlossaryEntry)glossaryEntry;
- (int64_t)compareToNoteCard:(id)a3;
- (unsigned)noteCardTypeSortOrder;
- (void)dealloc;
- (void)populateNoteCardBack:(id)a3;
- (void)populateNoteCardFront:(id)a3;
- (void)setBackTitle:(id)a3;
- (void)setDarkMode:(BOOL)a3;
- (void)setGlossaryEntry:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation THGlossaryNoteCardInfo

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryNoteCardInfo;
  [(THGlossaryNoteCardInfo *)&v3 dealloc];
}

- (unsigned)noteCardTypeSortOrder
{
  return 0;
}

- (int64_t)compareToNoteCard:(id)a3
{
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!v4) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THGlossaryNoteCardInfo compareToNoteCard:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardInfo.m"] lineNumber:61 description:@"invalid nil value for '%s'", "glossaryCard"];
  }
  NSComparisonResult v5 = [-[THModelGlossaryEntry term](-[THGlossaryNoteCardInfo glossaryEntry](self, "glossaryEntry"), "term") caseInsensitiveCompare:[self glossaryEntry].term];
  if (v5 == NSOrderedDescending) {
    int64_t v6 = -1;
  }
  else {
    int64_t v6 = v5;
  }
  if (v5 == NSOrderedAscending) {
    return 1;
  }
  else {
    return v6;
  }
}

- (BOOL)shouldShowWithStudyOptions:(id)a3
{
  return [a3 showVocabulary];
}

- (BOOL)hasBackContent
{
  return 1;
}

- (BOOL)isEmptyCard
{
  return 0;
}

- (void)populateNoteCardFront:(id)a3
{
  NSComparisonResult v5 = objc_alloc_init(THNoteCardStorageLayer);
  [(THNoteCardStorageLayer *)v5 setText:[(THModelGlossaryEntry *)self->_glossaryEntry term] context:[(THModelGlossaryEntry *)[(THGlossaryNoteCardInfo *)self glossaryEntry] context]];
  -[THNoteCardStorageLayer setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:](v5, "setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:", [+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 12.0) familyName], THNoteCardFrontTextColor(-[THGlossaryNoteCardInfo darkMode](self, "darkMode")), 0, 0, 2, 0.0, 1.0);
  [a3 setBodyLayer:v5];
  [a3 setShowFlipGlyph:[self hasBackContent]];

  title = self->_title;

  [a3 setTitle:title];
}

- (void)populateNoteCardBack:(id)a3
{
  NSComparisonResult v5 = objc_alloc_init(THNoteCardStorageLayer);
  glossaryEntry = self->_glossaryEntry;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_F49BC;
  v7[3] = &unk_4596D8;
  v7[4] = v5;
  v7[5] = self;
  [(THModelGlossaryEntry *)glossaryEntry synchronouslyLoadInfoOnComplete:v7];
  [a3 setBodyLayer:v5];
  [a3 setShowFlipGlyph:[self hasBackContent]];

  [a3 setTitle:self->_backTitle];
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
}

- (THModelGlossaryEntry)glossaryEntry
{
  return self->_glossaryEntry;
}

- (void)setGlossaryEntry:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)backTitle
{
  return self->_backTitle;
}

- (void)setBackTitle:(id)a3
{
}

@end