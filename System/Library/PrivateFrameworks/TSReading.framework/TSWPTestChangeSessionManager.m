@interface TSWPTestChangeSessionManager
- (BOOL)isTrackingChanges;
- (TSWPTestChangeSessionManager)initWithContext:(id)a3;
- (id)changeSessionAuthorCreatedWithCommand:(id *)a3;
- (void)dealloc;
- (void)startNewChangeSessionIfNecessaryGettingInsertAuthorCommand:(id *)a3;
@end

@implementation TSWPTestChangeSessionManager

- (TSWPTestChangeSessionManager)initWithContext:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSWPTestChangeSessionManager;
  v4 = [(TSWPTestChangeSessionManager *)&v9 init];
  if (v4)
  {
    v5 = [TSKAnnotationAuthor alloc];
    v6 = -[TSKAnnotationAuthor initWithContext:name:color:](v5, "initWithContext:name:color:", a3, @"Testing Author", [MEMORY[0x263F7C808] greenColor]);
    v7 = [(TSPObject *)[TSWPChangeSession alloc] initWithContext:a3];
    v4->_currentSession = v7;
    [(TSWPChangeSession *)v7 setSessionUID:1];
    [(TSWPChangeSession *)v4->_currentSession setAuthor:v6];
    -[TSWPChangeSession setDate:](v4->_currentSession, "setDate:", [MEMORY[0x263EFF910] date]);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTestChangeSessionManager;
  [(TSWPTestChangeSessionManager *)&v3 dealloc];
}

- (id)changeSessionAuthorCreatedWithCommand:(id *)a3
{
  id result = self->_currentSession;
  if (!result)
  {
    v5 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPTestChangeSessionManager changeSessionAuthorCreatedWithCommand:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTestChangeSessionManager.mm"), 48, @"invalid nil value for '%s'", "_currentSession");
    return self->_currentSession;
  }
  return result;
}

- (void)startNewChangeSessionIfNecessaryGettingInsertAuthorCommand:(id *)a3
{
  currentSession = self->_currentSession;
  if (!currentSession)
  {
    v5 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPTestChangeSessionManager startNewChangeSessionIfNecessaryGettingInsertAuthorCommand:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTestChangeSessionManager.mm"), 55, @"invalid nil value for '%s'", "_currentSession");
    currentSession = self->_currentSession;
  }
  v7 = currentSession;
  self->_currentSession = [(TSPObject *)[TSWPChangeSession alloc] initWithContext:[(TSPObject *)currentSession context]];
  [(TSWPChangeSession *)self->_currentSession setSessionUID:[(TSWPChangeSession *)v7 sessionUID] + 1];
  [(TSWPChangeSession *)self->_currentSession setAuthor:[(TSWPChangeSession *)v7 author]];
  -[TSWPChangeSession setDate:](self->_currentSession, "setDate:", [MEMORY[0x263EFF910] date]);
}

- (BOOL)isTrackingChanges
{
  return 1;
}

@end