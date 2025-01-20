@interface THAnnotationNoteCardInfo
- (BOOL)darkMode;
- (BOOL)hasBackContent;
- (BOOL)isEmptyCard;
- (BOOL)shouldShowWithStudyOptions:(id)a3;
- (NSString)pageNumberString;
- (NSString)title;
- (THAnnotation)annotation;
- (THAnnotationNoteCardInfo)init;
- (THWPStorage)storage;
- (int64_t)bodyPosition;
- (int64_t)compareToNoteCard:(id)a3;
- (int64_t)pageIndex;
- (unsigned)noteCardTypeSortOrder;
- (void)dealloc;
- (void)populateNoteCardBack:(id)a3;
- (void)populateNoteCardFront:(id)a3;
- (void)setAnnotation:(id)a3;
- (void)setBodyPosition:(int64_t)a3;
- (void)setDarkMode:(BOOL)a3;
- (void)setPageIndex:(int64_t)a3;
- (void)setPageNumberString:(id)a3;
- (void)setStorage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation THAnnotationNoteCardInfo

- (THAnnotationNoteCardInfo)init
{
  v5.receiver = self;
  v5.super_class = (Class)THAnnotationNoteCardInfo;
  v2 = [(THAnnotationNoteCardInfo *)&v5 init];
  v3 = v2;
  if (v2) {
    [(THAnnotationNoteCardInfo *)v2 setPageNumberString:0];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THAnnotationNoteCardInfo;
  [(THAnnotationNoteCardInfo *)&v3 dealloc];
}

- (unsigned)noteCardTypeSortOrder
{
  return 1;
}

- (int64_t)compareToNoteCard:(id)a3
{
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!v4) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationNoteCardInfo compareToNoteCard:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardInfo.m"] lineNumber:176 description:@"invalid nil value for '%s'", "annotationCard"];
  }
  id v5 = [(THAnnotationNoteCardInfo *)self pageIndex];
  if (v5 == [v4 pageIndex])
  {
    int64_t v6 = [(THAnnotationNoteCardInfo *)self bodyPosition];
    id v7 = [v4 bodyPosition];
  }
  else
  {
    int64_t v6 = [(THAnnotationNoteCardInfo *)self pageIndex];
    id v7 = [v4 pageIndex];
  }
  if (v6 > (uint64_t)v7) {
    return -1;
  }
  else {
    return 1;
  }
}

- (BOOL)shouldShowWithStudyOptions:(id)a3
{
  unsigned int v5 = [a3 showAnnotations];
  if (v5)
  {
    id v6 = [(THAnnotation *)self->annotation annotationStyle];
    LOBYTE(v5) = [a3 shouldShowAnnotationStyle:v6];
  }
  return v5;
}

- (BOOL)hasBackContent
{
  return [(THAnnotation *)self->annotation annotationNote] != 0;
}

- (BOOL)isEmptyCard
{
  return 0;
}

- (void)populateNoteCardFront:(id)a3
{
  id v5 = +[AEAnnotationTheme themeForAnnotationStyle:[(THAnnotation *)self->annotation annotationStyle] pageTheme:4 isUnderline:[(THAnnotation *)self->annotation annotationIsUnderline]];
  if ([v5 isUnderline] && (id v6 = objc_msgSend(v5, "highlightColor")) != 0) {
    id v7 = +[TSUColor colorWithPlatformColor:v6];
  }
  else {
    id v7 = 0;
  }
  v8 = objc_alloc_init(THNoteCardStorageLayer);
  storage = self->storage;
  id v10 = [(THAnnotation *)self->annotation annotationStorageRange];
  -[THNoteCardStorageLayer setStorage:range:](v8, "setStorage:range:", storage, v10, v11);
  -[THNoteCardStorageLayer setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:](v8, "setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:", [+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 12.0) familyName], THNoteCardFrontTextColor(-[THAnnotationNoteCardInfo darkMode](self, "darkMode")), v7, 0, 4, 0.0, 1.0);
  [a3 setBodyLayer:v8];
  [a3 setShowFlipGlyph:[self hasBackContent]];

  [a3 setTitle:self->title];
  if (self->pageNumberString) {
    [a3 setPageNumber:];
  }
  id v12 = objc_msgSend(objc_msgSend(v5, "notesSidebarBarColor"), "CGColor");

  [a3 setColorBarColor:v12];
}

- (void)populateNoteCardBack:(id)a3
{
  if (![(THAnnotation *)self->annotation annotationNote]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationNoteCardInfo populateNoteCardBack:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardInfo.m"] lineNumber:241 description:@"no content to put on back of card"];
  }
  id v5 = objc_alloc_init(THNoteCardStorageLayer);
  [(THNoteCardStorageLayer *)v5 setText:[(THAnnotation *)self->annotation annotationNote] context:[(THWPStorage *)self->storage context]];
  -[THNoteCardStorageLayer setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:](v5, "setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:alignment:", +[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 12.0).familyName, THNoteCardBackTextColor(-[THAnnotationNoteCardInfo darkMode](self, "darkMode")), 0, 0, 4, -0.01, 1.0);
  [a3 setBodyLayer:v5];
  [a3 setShowFlipGlyph:[self hasBackContent]];

  [a3 setTitle:self->title];
  if (self->pageNumberString)
  {
    [a3 setPageNumber:];
  }
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
}

- (THWPStorage)storage
{
  return self->storage;
}

- (void)setStorage:(id)a3
{
}

- (THAnnotation)annotation
{
  return self->annotation;
}

- (void)setAnnotation:(id)a3
{
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)pageNumberString
{
  return self->pageNumberString;
}

- (void)setPageNumberString:(id)a3
{
}

- (int64_t)pageIndex
{
  return self->pageIndex;
}

- (void)setPageIndex:(int64_t)a3
{
  self->pageIndex = a3;
}

- (int64_t)bodyPosition
{
  return self->bodyPosition;
}

- (void)setBodyPosition:(int64_t)a3
{
  self->bodyPosition = a3;
}

@end