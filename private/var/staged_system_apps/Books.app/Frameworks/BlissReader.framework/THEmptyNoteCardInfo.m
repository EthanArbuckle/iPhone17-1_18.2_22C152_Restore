@interface THEmptyNoteCardInfo
- (BOOL)darkMode;
- (BOOL)hasBackContent;
- (BOOL)isEmptyCard;
- (BOOL)isUnfilteredContentAvailable;
- (BOOL)shouldShowWithStudyOptions:(id)a3;
- (THStudyOptions)studyOptions;
- (int64_t)compareToNoteCard:(id)a3;
- (unsigned)noteCardTypeSortOrder;
- (void)dealloc;
- (void)populateNoteCardBack:(id)a3;
- (void)populateNoteCardFront:(id)a3;
- (void)setDarkMode:(BOOL)a3;
- (void)setIsUnfilteredContentAvailable:(BOOL)a3;
- (void)setStudyOptions:(id)a3;
@end

@implementation THEmptyNoteCardInfo

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THEmptyNoteCardInfo;
  [(THEmptyNoteCardInfo *)&v3 dealloc];
}

- (unsigned)noteCardTypeSortOrder
{
  return 2;
}

- (int64_t)compareToNoteCard:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THEmptyNoteCardInfo compareToNoteCard:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardInfo.m") lineNumber:289 description:@"expected empty card info"];
  }
  return 0;
}

- (BOOL)shouldShowWithStudyOptions:(id)a3
{
  return 1;
}

- (BOOL)hasBackContent
{
  return 0;
}

- (BOOL)isEmptyCard
{
  return 1;
}

- (void)populateNoteCardFront:(id)a3
{
  v4 = [[THNoteCardEmptyLayer alloc] initWithStudyOptions:[(THEmptyNoteCardInfo *)self studyOptions] unfilteredContentAvailable:[(THEmptyNoteCardInfo *)self isUnfilteredContentAvailable] darkMode:[(THEmptyNoteCardInfo *)self darkMode]];
  [a3 setBodyLayer:v4];
}

- (void)populateNoteCardBack:(id)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THEmptyNoteCardInfo populateNoteCardBack:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardInfo.m"];

  [v3 handleFailureInFunction:v4 file:v5 lineNumber:317 description:@"no content to put on back of card"];
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
}

- (THStudyOptions)studyOptions
{
  return self->studyOptions;
}

- (void)setStudyOptions:(id)a3
{
}

- (BOOL)isUnfilteredContentAvailable
{
  return self->_isUnfilteredContentAvailable;
}

- (void)setIsUnfilteredContentAvailable:(BOOL)a3
{
  self->_isUnfilteredContentAvailable = a3;
}

@end