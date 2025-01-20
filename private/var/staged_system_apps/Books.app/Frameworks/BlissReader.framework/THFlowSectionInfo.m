@interface THFlowSectionInfo
- (Class)layoutClass;
- (Class)repClass;
- (THPresentationType)presentationType;
- (id)childInfos;
- (void)dealloc;
- (void)setPresentationType:(id)a3;
@end

@implementation THFlowSectionInfo

- (id)childInfos
{
  if (![(THSectionInfo *)self contentNode]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionInfo childInfos]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionInfo.mm") lineNumber:21 description:@"invalid nil value for '%s'", "self.contentNode"];
  }
  if (![(THFlowSectionInfo *)self presentationType]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THFlowSectionInfo childInfos]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionInfo.mm"] lineNumber:22 description:@"invalid nil value for '%s'", "self.presentationType"];
  }
  if (![(THSectionInfo *)self pages])
  {
    id v3 = [(THModelContentNode *)[(THSectionInfo *)self contentNode] pageAtRelativeIndex:0 forPresentationType:[(THFlowSectionInfo *)self presentationType]];
    if (v3) {
      [(THSectionInfo *)self setPages:+[NSArray arrayWithObject:v3]];
    }
    else {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THFlowSectionInfo childInfos]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionInfo.mm"] lineNumber:27 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"pageInfo"];
    }
  }
  v4 = [(THSectionInfo *)self pages];

  return +[NSArray arrayWithArray:v4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THFlowSectionInfo;
  [(THSectionInfo *)&v3 dealloc];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(id)a3
{
}

@end