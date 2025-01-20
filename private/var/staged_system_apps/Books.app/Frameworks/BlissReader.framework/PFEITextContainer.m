@interface PFEITextContainer
- (BOOL)mapStartElementWithState:(id)a3;
- (THWPStorage)storage;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFEITextContainer

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFEITextContainer;
  [(PFEITextContainer *)&v3 dealloc];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  self->_storage = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", [a3 tspContext], &stru_46D7E8, objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"), 3);
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "setOverriddenStorage:", self->_storage);
  [a3 setUniqueIdForInfo:self->_storage fromStackEntry:[a3 currentHtmlStackEntry]];
  [a3 setCfiPathForInfo:self->_storage fromStackEntry:[a3 currentHtmlStackEntry]];
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  storage = self->_storage;
  id v4 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");

  [v4 setResult:storage];
}

- (THWPStorage)storage
{
  return self->_storage;
}

@end