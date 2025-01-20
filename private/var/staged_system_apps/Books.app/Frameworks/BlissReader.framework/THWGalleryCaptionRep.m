@interface THWGalleryCaptionRep
- (TSWPStorage)currentCaptionStorage;
- (void)didCreateLayer:(id)a3;
- (void)didUpdateLayer:(id)a3;
@end

@implementation THWGalleryCaptionRep

- (void)didCreateLayer:(id)a3
{
  self->_currentCaptionStorage = (TSWPStorage *)objc_msgSend(objc_msgSend(-[THWGalleryCaptionRep layout](self, "layout", a3), "delegate"), "galleryCaptionStorage");
}

- (void)didUpdateLayer:(id)a3
{
  v5 = (TSWPStorage *)objc_msgSend(objc_msgSend(-[THWGalleryCaptionRep layout](self, "layout"), "delegate"), "galleryCaptionStorage");
  v6 = v5;
  currentCaptionStorage = self->_currentCaptionStorage;
  if (currentCaptionStorage) {
    BOOL v8 = v5 == currentCaptionStorage;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id v9 = +[CATransition animation];
    [v9 setType:kCATransitionFade];
    [v9 setDuration:0.15];
    [a3 addAnimation:v9 forKey:@"fadeAnimation"];
  }
  self->_currentCaptionStorage = v6;
}

- (TSWPStorage)currentCaptionStorage
{
  return self->_currentCaptionStorage;
}

@end