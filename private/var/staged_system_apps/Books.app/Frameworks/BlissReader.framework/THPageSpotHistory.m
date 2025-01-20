@interface THPageSpotHistory
+ (id)bookspotWithPageIndex:(unint64_t)a3;
+ (unint64_t)pageIndexFromBookspot:(id)a3;
- (BOOL)clearUpperStackOnMinorPaging;
- (BOOL)gotoBookspot:(id)a3 minor:(BOOL)a4;
- (BOOL)gotoBookspotPageIndex:(unint64_t)a3 minor:(BOOL)a4;
- (BOOL)gotoNextBookspot;
- (BOOL)gotoPrevBookspot;
- (BOOL)p_gotoNextDistinctBookspot;
- (BOOL)p_gotoNextImmediateBookspot;
- (BOOL)p_gotoPrevDistinctBookspot;
- (BOOL)p_gotoPrevImmediateBookspot;
- (BOOL)p_hasNextBookspot;
- (BOOL)p_hasNextDistinctBookspot;
- (BOOL)p_hasNextImmediateBookspot;
- (BOOL)p_hasPrevBookspot;
- (BOOL)p_hasPrevDistinctBookspot;
- (BOOL)p_hasPrevImmediateBookspot;
- (BOOL)rejectDuplicates;
- (BOOL)seekDistinctSpots;
- (NSMutableArray)stack;
- (THPageSpotHistory)init;
- (THPageSpotHistoryDelegate)delegate;
- (id)curBookspot;
- (id)dictionaryRepresentation;
- (id)nextBookspot;
- (id)p_bookspotAtCursor:(unint64_t)a3;
- (id)p_nextBookspot;
- (id)p_nextDistinctBookspot;
- (id)p_nextImmediateBookspot;
- (id)p_prevBookspot;
- (id)p_prevDistinctBookspot;
- (id)p_prevImmediateBookspot;
- (id)prevBookspot;
- (unint64_t)cursorIndex;
- (unint64_t)p_nextDistinctBookspotCursorIndex;
- (unint64_t)p_nextImmediateBookspotCursorIndex;
- (unint64_t)p_prevDistinctBookspotCursorIndex;
- (unint64_t)p_prevImmediateBookspotCursorIndex;
- (unint64_t)stackLimit;
- (void)dealloc;
- (void)p_cleanseStack;
- (void)p_clearUpperStack;
- (void)p_pushBookspot:(id)a3;
- (void)p_removeStackItemAtIndex:(unint64_t)a3;
- (void)p_setBookspot:(id)a3;
- (void)recordCurrentLocationInHistory;
- (void)recordOutgoingMajorNavigationJump;
- (void)recordOutgoingMajorNavigationJumpSuppressingToolbar:(BOOL)a3;
- (void)resetWithDictionaryRepresentation:(id)a3;
- (void)setClearUpperStackOnMinorPaging:(BOOL)a3;
- (void)setCursorIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setRejectDuplicates:(BOOL)a3;
- (void)setSeekDistinctSpots:(BOOL)a3;
- (void)setStack:(id)a3;
- (void)setStackLimit:(unint64_t)a3;
@end

@implementation THPageSpotHistory

- (THPageSpotHistory)init
{
  v5.receiver = self;
  v5.super_class = (Class)THPageSpotHistory;
  v2 = [(THPageSpotHistory *)&v5 init];
  v3 = v2;
  if (v2) {
    [(THPageSpotHistory *)v2 resetWithDictionaryRepresentation:0];
  }
  return v3;
}

- (void)dealloc
{
  self->mStack = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPageSpotHistory;
  [(THPageSpotHistory *)&v3 dealloc];
}

- (void)resetWithDictionaryRepresentation:(id)a3
{
  [(THPageSpotHistory *)self setCursorIndex:0];
  [(THPageSpotHistory *)self setRejectDuplicates:1];
  [(THPageSpotHistory *)self setSeekDistinctSpots:1];
  [(THPageSpotHistory *)self setStackLimit:20];
  if (!a3) {
    goto LABEL_8;
  }
  id v5 = [a3 objectForKey:@"stack"];
  id v6 = [a3 objectForKey:@"cursor"];
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      uint64_t v10 = 0;
      v11 = &v10;
      uint64_t v12 = 0x3052000000;
      v13 = sub_112348;
      v14 = sub_112358;
      v15 = 0;
      v15 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_112364;
      v9[3] = &unk_459988;
      v9[4] = &v10;
      [v5 enumerateObjectsUsingBlock:v9];
      v8 = +[NSMutableArray arrayWithArray:v11[5]];
      -[THPageSpotHistory setCursorIndex:](self, "setCursorIndex:", [v7 unsignedIntValue]);
      _Block_object_dispose(&v10, 8);
      if (v8) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:@"-[THPageSpotHistory resetWithDictionaryRepresentation:]"] file:[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THPageSpotHistory.m"] lineNumber:117 description:@"missing stack in page history serialization"];
  if (!v7) {
LABEL_7:
  }
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageSpotHistory resetWithDictionaryRepresentation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THPageSpotHistory.m") lineNumber:118 description:@"missing cursor index in page history serialization"];
LABEL_8:
  v8 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", +[THPageSpotHistory bookspotWithPageIndex:0]);
LABEL_9:
  if (![(NSMutableArray *)v8 count]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageSpotHistory resetWithDictionaryRepresentation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THPageSpotHistory.m") lineNumber:137 description:@"Page history must have at least one cursor"];
  }
  [(THPageSpotHistory *)self setStack:v8];
}

- (id)dictionaryRepresentation
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = sub_112348;
  v11 = sub_112358;
  uint64_t v12 = 0;
  uint64_t v12 = +[NSMutableArray arrayWithCapacity:[(NSMutableArray *)[(THPageSpotHistory *)self stack] count]];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_112524;
  v6[3] = &unk_4599B0;
  v6[4] = &v7;
  [(NSMutableArray *)[(THPageSpotHistory *)self stack] enumerateObjectsUsingBlock:v6];
  objc_super v3 = +[NSNumber numberWithUnsignedInteger:[(THPageSpotHistory *)self cursorIndex]];
  v4 = +[NSDictionary dictionaryWithObjectsAndKeys:v3, @"cursor", v8[5], @"stack", 0];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)recordOutgoingMajorNavigationJump
{
}

- (void)recordOutgoingMajorNavigationJumpSuppressingToolbar:(BOOL)a3
{
  BOOL v3 = a3;
  [(THPageSpotHistory *)self recordCurrentLocationInHistory];
  BOOL v5 = +[THPageSpotHistory pageIndexFromBookspot:[(THPageSpotHistory *)self curBookspot]] == 0x7FFFFFFFFFFFFFFFLL;
  id v6 = [[THPageLocation alloc] initWithAbsolutePageIndex:0x7FFFFFFFFFFFFFFFLL];
  [(THPageSpotHistory *)self gotoBookspot:v6 minor:v5];
  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  v8 = THNavigationHistoryDidChangeNotification;
  v10[0] = v6;
  v9[0] = @"pageLocation";
  v9[1] = @"minor";
  v10[1] = +[NSNumber numberWithBool:v5];
  v9[2] = @"suppressToolbar";
  v10[2] = +[NSNumber numberWithBool:v3];
  [(NSNotificationCenter *)v7 postNotificationName:v8 object:+[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3]];
}

- (void)recordCurrentLocationInHistory
{
  if ([(THPageSpotHistoryDelegate *)[(THPageSpotHistory *)self delegate] currentAbsolutePageIndex] == (id)0x7FFFFFFFFFFFFFFFLL)id v3 = 0; {
  else
  }
    id v3 = [(THPageSpotHistoryDelegate *)[(THPageSpotHistory *)self delegate] currentBookspotLocation];

  [(THPageSpotHistory *)self gotoBookspot:v3 minor:1];
}

- (void)p_removeStackItemAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)[(THPageSpotHistory *)self stack] count] > a3)
  {
    [(NSMutableArray *)[(THPageSpotHistory *)self stack] removeObjectAtIndex:a3];
    if ([(THPageSpotHistory *)self cursorIndex] > a3) {
      [(THPageSpotHistory *)self setCursorIndex:(char *)[(THPageSpotHistory *)self cursorIndex] - 1];
    }
    BOOL v5 = (char *)[(THPageSpotHistory *)self cursorIndex] + 1;
    if (v5 > [(NSMutableArray *)[(THPageSpotHistory *)self stack] count])
    {
      if ([(NSMutableArray *)[(THPageSpotHistory *)self stack] count]) {
        uint64_t v6 = (uint64_t)[(NSMutableArray *)[(THPageSpotHistory *)self stack] count] - 1;
      }
      else {
        uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
      }
      [(THPageSpotHistory *)self setCursorIndex:v6];
    }
  }
}

- (void)p_cleanseStack
{
  if ([(THPageSpotHistory *)self rejectDuplicates]
    && (unint64_t)[(NSMutableArray *)[(THPageSpotHistory *)self stack] count] >= 2)
  {
    id v3 = 0;
    uint64_t v4 = 1;
    do
    {
      if (objc_msgSend(-[NSMutableArray objectAtIndex:](-[THPageSpotHistory stack](self, "stack"), "objectAtIndex:", v3), "isEqual:", -[NSMutableArray objectAtIndex:](-[THPageSpotHistory stack](self, "stack"), "objectAtIndex:", v4)))
      {
        if ((char *)[(THPageSpotHistory *)self cursorIndex] == v3) {
          BOOL v5 = (char *)v4;
        }
        else {
          BOOL v5 = v3;
        }
        [(THPageSpotHistory *)self p_removeStackItemAtIndex:v5];
      }
      else
      {
        id v3 = (char *)v4;
      }
      uint64_t v4 = (uint64_t)(v3 + 1);
    }
    while (v3 + 1 < [(NSMutableArray *)[(THPageSpotHistory *)self stack] count]);
  }
  if ([(THPageSpotHistory *)self stackLimit]
    && [(THPageSpotHistory *)self stackLimit] != 0x7FFFFFFFFFFFFFFFLL)
  {
    while (1)
    {
      id v6 = [(NSMutableArray *)[(THPageSpotHistory *)self stack] count];
      if (v6 <= (id)[(THPageSpotHistory *)self stackLimit]) {
        break;
      }
      [(THPageSpotHistory *)self p_removeStackItemAtIndex:0];
    }
  }
}

- (void)p_pushBookspot:(id)a3
{
  if (![(THPageSpotHistory *)self rejectDuplicates]
    || (objc_msgSend(a3, "isEqual:", -[THPageSpotHistory curBookspot](self, "curBookspot")) & 1) == 0)
  {
    [(NSMutableArray *)[(THPageSpotHistory *)self stack] addObject:a3];
    [(THPageSpotHistory *)self setCursorIndex:(char *)[(NSMutableArray *)[(THPageSpotHistory *)self stack] count] - 1];
    [(THPageSpotHistory *)self p_cleanseStack];
  }
}

- (void)p_clearUpperStack
{
  id v3 = [(THPageSpotHistory *)self cursorIndex];
  if (v3 < (char *)[(NSMutableArray *)[(THPageSpotHistory *)self stack] count] - 1)
  {
    uint64_t v4 = (char *)[(THPageSpotHistory *)self cursorIndex] + 1;
    BOOL v5 = (char *)[(NSMutableArray *)[(THPageSpotHistory *)self stack] count];
    id v6 = &v5[~[(THPageSpotHistory *)self cursorIndex]];
    uint64_t v7 = [(THPageSpotHistory *)self stack];
    -[NSMutableArray removeObjectsInRange:](v7, "removeObjectsInRange:", v4, v6);
  }
}

- (id)p_bookspotAtCursor:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)[(THPageSpotHistory *)self stack] count] <= a3) {
    return 0;
  }
  BOOL v5 = [(THPageSpotHistory *)self stack];

  return [(NSMutableArray *)v5 objectAtIndex:a3];
}

- (void)p_setBookspot:(id)a3
{
  if (a3)
  {
    BOOL v5 = [(THPageSpotHistory *)self stack];
    unint64_t v6 = [(THPageSpotHistory *)self cursorIndex];
    [(NSMutableArray *)v5 replaceObjectAtIndex:v6 withObject:a3];
  }
}

+ (id)bookspotWithPageIndex:(unint64_t)a3
{
  id v3 = [[THPageLocation alloc] initWithAbsolutePageIndex:a3];

  return v3;
}

+ (unint64_t)pageIndexFromBookspot:(id)a3
{
  objc_opt_class();
  id v3 = (void *)TSUDynamicCast();
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return (unint64_t)[v3 absolutePhysicalPageIndex];
}

- (id)curBookspot
{
  unint64_t v3 = [(THPageSpotHistory *)self cursorIndex];

  return [(THPageSpotHistory *)self p_bookspotAtCursor:v3];
}

- (BOOL)p_hasPrevImmediateBookspot
{
  return [(THPageSpotHistory *)self cursorIndex] != 0;
}

- (unint64_t)p_prevImmediateBookspotCursorIndex
{
  if ([(THPageSpotHistory *)self cursorIndex]) {
    return [(THPageSpotHistory *)self cursorIndex] - 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)p_prevImmediateBookspot
{
  unint64_t v3 = [(THPageSpotHistory *)self cursorIndex];
  BOOL v5 = objc_msgSend(-[THPageSpotHistory curBookspot](self, "curBookspot"), "pageIndex") == (id)0x7FFFFFFFFFFFFFFFLL
    && v3 != 0;
  unint64_t v6 = v3 - v5;
  if (!v6) {
    return 0;
  }

  return [(THPageSpotHistory *)self p_bookspotAtCursor:v6 - 1];
}

- (BOOL)p_hasNextImmediateBookspot
{
  unint64_t v3 = (char *)[(THPageSpotHistory *)self cursorIndex] + 1;
  return v3 < [(NSMutableArray *)[(THPageSpotHistory *)self stack] count];
}

- (unint64_t)p_nextImmediateBookspotCursorIndex
{
  unint64_t v3 = (char *)[(THPageSpotHistory *)self cursorIndex] + 1;
  if (v3 >= [(NSMutableArray *)[(THPageSpotHistory *)self stack] count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return [(THPageSpotHistory *)self cursorIndex] + 1;
  }
}

- (id)p_nextImmediateBookspot
{
  unint64_t v3 = (char *)[(THPageSpotHistory *)self cursorIndex] + 1;
  if (v3 >= [(NSMutableArray *)[(THPageSpotHistory *)self stack] count]) {
    return 0;
  }
  uint64_t v4 = (char *)[(THPageSpotHistory *)self cursorIndex] + 1;

  return [(THPageSpotHistory *)self p_bookspotAtCursor:v4];
}

- (BOOL)p_hasPrevDistinctBookspot
{
  return [(THPageSpotHistory *)self p_prevDistinctBookspot] != 0;
}

- (unint64_t)p_prevDistinctBookspotCursorIndex
{
  unint64_t v3 = [(THPageSpotHistory *)self cursorIndex];
  id v4 = [(THPageSpotHistory *)self curBookspot];
  if ([v4 pageIndex] == (id)0x7FFFFFFFFFFFFFFFLL && v3)
  {
    --v3;
  }
  else
  {
    if (v3)
    {
      while (v3)
      {
        if (([v4 isEqual:[self p_bookspotAtCursor:--v3]] & 1) == 0)return v3; {
      }
        }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (id)p_prevDistinctBookspot
{
  unint64_t v3 = [(THPageSpotHistory *)self p_prevDistinctBookspotCursorIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return [(THPageSpotHistory *)self p_bookspotAtCursor:v3];
}

- (BOOL)p_hasNextDistinctBookspot
{
  return [(THPageSpotHistory *)self p_nextDistinctBookspot] != 0;
}

- (unint64_t)p_nextDistinctBookspotCursorIndex
{
  id v3 = [(THPageSpotHistory *)self curBookspot];
  id v4 = (char *)[(THPageSpotHistory *)self cursorIndex] + 1;
  if (v4 < [(NSMutableArray *)[(THPageSpotHistory *)self stack] count])
  {
    unint64_t v5 = [(THPageSpotHistory *)self cursorIndex];
    while (++v5 < (unint64_t)[(NSMutableArray *)[(THPageSpotHistory *)self stack] count])
    {
      if ([[v3 isEqual:[self p_bookspotAtCursor:v5]] & 1] == 0)return v5; {
    }
      }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)p_nextDistinctBookspot
{
  unint64_t v3 = [(THPageSpotHistory *)self p_nextDistinctBookspotCursorIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return [(THPageSpotHistory *)self p_bookspotAtCursor:v3];
}

- (BOOL)gotoBookspot:(id)a3 minor:(BOOL)a4
{
  if (a3)
  {
    if (a4)
    {
      [(THPageSpotHistory *)self p_setBookspot:a3];
      if ([(THPageSpotHistory *)self clearUpperStackOnMinorPaging]) {
        [(THPageSpotHistory *)self p_clearUpperStack];
      }
    }
    else
    {
      [(THPageSpotHistory *)self p_clearUpperStack];
      [(THPageSpotHistory *)self p_pushBookspot:a3];
    }
  }
  return a3 != 0;
}

- (BOOL)p_gotoPrevImmediateBookspot
{
  BOOL v3 = [(THPageSpotHistory *)self p_hasPrevBookspot];
  if (v3) {
    [(THPageSpotHistory *)self setCursorIndex:(char *)[(THPageSpotHistory *)self cursorIndex] - 1];
  }
  [(THPageSpotHistory *)self p_cleanseStack];
  return v3;
}

- (BOOL)p_gotoNextImmediateBookspot
{
  BOOL v3 = [(THPageSpotHistory *)self p_hasNextBookspot];
  if (v3) {
    [(THPageSpotHistory *)self setCursorIndex:(char *)[(THPageSpotHistory *)self cursorIndex] + 1];
  }
  [(THPageSpotHistory *)self p_cleanseStack];
  return v3;
}

- (BOOL)p_gotoPrevDistinctBookspot
{
  unint64_t v3 = [(THPageSpotHistory *)self p_prevDistinctBookspotCursorIndex];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL) {
    [(THPageSpotHistory *)self setCursorIndex:v3];
  }
  [(THPageSpotHistory *)self p_cleanseStack];
  return v3 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)p_gotoNextDistinctBookspot
{
  unint64_t v3 = [(THPageSpotHistory *)self p_nextDistinctBookspotCursorIndex];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL) {
    [(THPageSpotHistory *)self setCursorIndex:v3];
  }
  [(THPageSpotHistory *)self p_cleanseStack];
  return v3 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)gotoPrevBookspot
{
  unsigned int v3 = [(THPageSpotHistory *)self hasPrevBookspot];
  if (v3)
  {
    [(THPageSpotHistory *)self recordCurrentLocationInHistory];
    if ([(THPageSpotHistory *)self seekDistinctSpots]) {
      [(THPageSpotHistory *)self p_gotoPrevDistinctBookspot];
    }
    else {
      [(THPageSpotHistory *)self p_gotoPrevImmediateBookspot];
    }
    objc_opt_class();
    [(THPageSpotHistory *)self curBookspot];
    uint64_t v4 = TSUDynamicCast();
    unint64_t v5 = [(THPageSpotHistory *)self delegate];
    LOBYTE(v3) = [(THPageSpotHistoryDelegate *)v5 jumpToPageLocation:v4 touchHistory:0 minor:1];
  }
  return v3;
}

- (BOOL)gotoNextBookspot
{
  unsigned int v3 = [(THPageSpotHistory *)self hasNextBookspot];
  if (v3)
  {
    [(THPageSpotHistory *)self recordCurrentLocationInHistory];
    if ([(THPageSpotHistory *)self seekDistinctSpots]) {
      [(THPageSpotHistory *)self p_gotoNextDistinctBookspot];
    }
    else {
      [(THPageSpotHistory *)self p_gotoNextImmediateBookspot];
    }
    objc_opt_class();
    [(THPageSpotHistory *)self curBookspot];
    uint64_t v4 = TSUDynamicCast();
    unint64_t v5 = [(THPageSpotHistory *)self delegate];
    LOBYTE(v3) = [(THPageSpotHistoryDelegate *)v5 jumpToPageLocation:v4 touchHistory:0 minor:1];
  }
  return v3;
}

- (id)prevBookspot
{
  return [(THPageSpotHistory *)self p_prevBookspot];
}

- (id)nextBookspot
{
  return [(THPageSpotHistory *)self p_nextBookspot];
}

- (BOOL)gotoBookspotPageIndex:(unint64_t)a3 minor:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = +[THPageSpotHistory bookspotWithPageIndex:a3];

  return [(THPageSpotHistory *)self gotoBookspot:v6 minor:v4];
}

- (BOOL)p_hasPrevBookspot
{
  if ([(THPageSpotHistory *)self seekDistinctSpots])
  {
    return [(THPageSpotHistory *)self p_hasPrevDistinctBookspot];
  }
  else
  {
    return [(THPageSpotHistory *)self p_hasPrevImmediateBookspot];
  }
}

- (id)p_prevBookspot
{
  if ([(THPageSpotHistory *)self seekDistinctSpots])
  {
    return [(THPageSpotHistory *)self p_prevDistinctBookspot];
  }
  else
  {
    return [(THPageSpotHistory *)self p_prevImmediateBookspot];
  }
}

- (BOOL)p_hasNextBookspot
{
  if ([(THPageSpotHistory *)self seekDistinctSpots])
  {
    return [(THPageSpotHistory *)self p_hasNextDistinctBookspot];
  }
  else
  {
    return [(THPageSpotHistory *)self p_hasNextImmediateBookspot];
  }
}

- (id)p_nextBookspot
{
  if ([(THPageSpotHistory *)self seekDistinctSpots])
  {
    return [(THPageSpotHistory *)self p_nextDistinctBookspot];
  }
  else
  {
    return [(THPageSpotHistory *)self p_nextImmediateBookspot];
  }
}

- (THPageSpotHistoryDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THPageSpotHistoryDelegate *)a3;
}

- (NSMutableArray)stack
{
  return self->mStack;
}

- (void)setStack:(id)a3
{
}

- (unint64_t)cursorIndex
{
  return self->mCursorIndex;
}

- (void)setCursorIndex:(unint64_t)a3
{
  self->mCursorIndex = a3;
}

- (unint64_t)stackLimit
{
  return self->mStackLimit;
}

- (void)setStackLimit:(unint64_t)a3
{
  self->mStackLimit = a3;
}

- (BOOL)clearUpperStackOnMinorPaging
{
  return self->mClearUpperStackOnMinorPaging;
}

- (void)setClearUpperStackOnMinorPaging:(BOOL)a3
{
  self->mClearUpperStackOnMinorPaging = a3;
}

- (BOOL)rejectDuplicates
{
  return self->mRejectDuplicates;
}

- (void)setRejectDuplicates:(BOOL)a3
{
  self->mRejectDuplicates = a3;
}

- (BOOL)seekDistinctSpots
{
  return self->mSeekDistinctSpots;
}

- (void)setSeekDistinctSpots:(BOOL)a3
{
  self->mSeekDistinctSpots = a3;
}

@end