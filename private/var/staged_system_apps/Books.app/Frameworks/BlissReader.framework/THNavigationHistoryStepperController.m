@interface THNavigationHistoryStepperController
- (THBookPresentationPageIndexFormatter)pageIndexFormatter;
- (THBookspotHistoryStack)bookspotHistoryStack;
- (THNavigationHistoryStepperChrome)chrome;
- (THNavigationHistoryStepperController)init;
- (void)dealloc;
- (void)jumpToNext:(id)a3;
- (void)jumpToPrev:(id)a3;
- (void)setBookspotHistoryStack:(id)a3;
- (void)setChrome:(id)a3;
- (void)setPageIndexFormatter:(id)a3;
- (void)teardown;
- (void)updateHistoryNavigation;
@end

@implementation THNavigationHistoryStepperController

- (THNavigationHistoryStepperController)init
{
  v5.receiver = self;
  v5.super_class = (Class)THNavigationHistoryStepperController;
  v2 = [(THNavigationHistoryStepperController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v3 addObserver:v2 selector:"p_handleNavigationHistoryDidChange:" name:THNavigationHistoryDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  if ([(THNavigationHistoryStepperController *)self bookspotHistoryStack]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationHistoryStepperController dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THNavigationHistoryStepperController.m") lineNumber:37 description:@"should have been torn down"];
  }
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  self->_pageIndexFormatter = 0;
  self->_bookspotHistoryStack = 0;
  self->_chrome = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNavigationHistoryStepperController;
  [(THNavigationHistoryStepperController *)&v3 dealloc];
}

- (void)teardown
{
  self->_pageIndexFormatter = 0;
  self->_bookspotHistoryStack = 0;
  self->_chrome = 0;
  objc_super v3 = +[NSNotificationCenter defaultCenter];

  [(NSNotificationCenter *)v3 removeObserver:self];
}

- (void)jumpToPrev:(id)a3
{
  objc_super v3 = [(THNavigationHistoryStepperController *)self bookspotHistoryStack];

  [(THBookspotHistoryStack *)v3 gotoPrevBookspot];
}

- (void)jumpToNext:(id)a3
{
  objc_super v3 = [(THNavigationHistoryStepperController *)self bookspotHistoryStack];

  [(THBookspotHistoryStack *)v3 gotoNextBookspot];
}

- (void)updateHistoryNavigation
{
  if (![(THNavigationHistoryStepperController *)self chrome]) {
    return;
  }
  id v3 = [(THBookspotHistoryStack *)[(THNavigationHistoryStepperController *)self bookspotHistoryStack] prevBookspot];
  id v4 = [(THBookspotHistoryStack *)[(THNavigationHistoryStepperController *)self bookspotHistoryStack] nextBookspot];
  id v5 = v4;
  if (v3)
  {
    id v6 = [(THBookPresentationPageIndexFormatter *)[(THNavigationHistoryStepperController *)self pageIndexFormatter] pageNumberStringForLocation:v3];
    if (v5)
    {
LABEL_4:
      id v7 = [(THBookPresentationPageIndexFormatter *)[(THNavigationHistoryStepperController *)self pageIndexFormatter] pageNumberStringForLocation:v5];
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = 0;
    if (v4) {
      goto LABEL_4;
    }
  }
  id v7 = 0;
LABEL_8:
  if (v3)
  {
    CFStringRef v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"Back to page %@" value:&stru_46D7E8 table:0], v6);
    if (v5)
    {
LABEL_10:
      CFStringRef v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"Go to page %@" value:&stru_46D7E8 table:0], v7);
      goto LABEL_13;
    }
  }
  else
  {
    CFStringRef v8 = &stru_46D7E8;
    if (v5) {
      goto LABEL_10;
    }
  }
  CFStringRef v9 = &stru_46D7E8;
LABEL_13:
  [(THNavigationHistoryStepperController *)self chrome];
  char v10 = objc_opt_respondsToSelector();
  v11 = [(THNavigationHistoryStepperController *)self chrome];
  if (v10)
  {
    -[THNavigationHistoryStepperChrome setPrevButtonTitle:andPrevButtonEnable:nextButtonTitle:andNextButtonEnabled:](v11, "setPrevButtonTitle:andPrevButtonEnable:nextButtonTitle:andNextButtonEnabled:", v8, v3 != 0);
  }
  else
  {
    BOOL v12 = v5 != 0;
    [(THNavigationHistoryStepperChrome *)v11 setPrevButtonTitle:v8 andEnable:v3 != 0];
    v13 = [(THNavigationHistoryStepperController *)self chrome];
    [(THNavigationHistoryStepperChrome *)v13 setNextButtonTitle:v9 andEnable:v12];
  }
}

- (THBookPresentationPageIndexFormatter)pageIndexFormatter
{
  return self->_pageIndexFormatter;
}

- (void)setPageIndexFormatter:(id)a3
{
  self->_pageIndexFormatter = (THBookPresentationPageIndexFormatter *)a3;
}

- (THBookspotHistoryStack)bookspotHistoryStack
{
  return self->_bookspotHistoryStack;
}

- (void)setBookspotHistoryStack:(id)a3
{
  self->_bookspotHistoryStack = (THBookspotHistoryStack *)a3;
}

- (THNavigationHistoryStepperChrome)chrome
{
  return self->_chrome;
}

- (void)setChrome:(id)a3
{
  self->_chrome = (THNavigationHistoryStepperChrome *)a3;
}

@end