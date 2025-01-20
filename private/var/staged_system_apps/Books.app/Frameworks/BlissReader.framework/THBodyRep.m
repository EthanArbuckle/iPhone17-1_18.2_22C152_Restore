@interface THBodyRep
- (BOOL)p_doesRep:(id)a3 containCharIndex:(unint64_t)a4 isStart:(BOOL)a5;
- (THBodyRep)initWithLayout:(id)a3 canvas:(id)a4;
- (id)hitRep:(CGPoint)a3;
- (id)hitRepChrome:(CGPoint)a3;
- (id)hitReps:(CGPoint)a3 withSlop:(CGSize)a4;
- (id)marginNotesController;
- (id)marginNotesOwner;
- (id)repForCharIndex:(unint64_t)a3 isStart:(BOOL)a4;
- (id)siblings;
- (id)storage;
- (void)dealloc;
- (void)setupMarginNotesControllerForHighlightController:(id)a3;
- (void)updateFromLayout;
- (void)willBeRemoved;
@end

@implementation THBodyRep

- (THBodyRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THBodyRep;
  v4 = [(THWPRep *)&v7 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4) {
    objc_msgSend(objc_msgSend(-[THBodyRep canvas](v4, "canvas"), "changeNotifier"), "addObserver:forChangeSource:", v4, -[THBodyRep storage](v4, "storage"));
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)THBodyRep;
  [(THWPRep *)&v2 dealloc];
}

- (id)storage
{
  id v2 = [(THBodyRep *)self info];

  return [v2 bodyStorage];
}

- (id)hitRep:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id result = [[self columns] count];
  if (result)
  {
    v7.receiver = self;
    v7.super_class = (Class)THBodyRep;
    return -[THWPRep hitRep:](&v7, "hitRep:", x, y);
  }
  return result;
}

- (id)hitReps:(CGPoint)a3 withSlop:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  id result = [[self columns] count];
  if (result)
  {
    v10.receiver = self;
    v10.super_class = (Class)THBodyRep;
    return -[THBodyRep hitReps:withSlop:](&v10, "hitReps:withSlop:", x, y, width, height);
  }
  return result;
}

- (id)hitRepChrome:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id result = [[self columns] count];
  if (result)
  {
    v7.receiver = self;
    v7.super_class = (Class)THBodyRep;
    return -[THBodyRep hitRepChrome:](&v7, "hitRepChrome:", x, y);
  }
  return result;
}

- (BOOL)p_doesRep:(id)a3 containCharIndex:(unint64_t)a4 isStart:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [a3 range];
  if (v5 && (unint64_t)v7 <= a4) {
    return (unint64_t)v7 + v8 > a4;
  }
  BOOL v10 = (unint64_t)v7 + v8 >= a4;
  if ((unint64_t)v7 >= a4) {
    BOOL v10 = 0;
  }
  return !v5 && v10;
}

- (id)repForCharIndex:(unint64_t)a3 isStart:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(THBodyRep *)self p_doesRep:self containCharIndex:a3 isStart:a4]) {
    return self;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(THBodyRep *)self siblings];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v9) {
    return 0;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v15;
LABEL_5:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v15 != v11) {
      objc_enumerationMutation(v8);
    }
    id v7 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
    if ([(THBodyRep *)self p_doesRep:v7 containCharIndex:a3 isStart:v4]) {
      return v7;
    }
    if (v10 == (id)++v12)
    {
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      id v7 = 0;
      if (v10) {
        goto LABEL_5;
      }
      return v7;
    }
  }
}

- (id)siblings
{
  id v3 = +[NSMutableSet set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [[[[[[self parentRep] layout] parent] info] pages];
  id v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v7);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v9 = [v8 modelBodyInfos];
        id v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v19;
          do
          {
            v13 = 0;
            do
            {
              if (*(void *)v19 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = [(THBodyRep *)[self interactiveCanvasController] repForInfo:*((void *)&v18 + 1) createIfNeeded:0];
              if (v14) {
                BOOL v15 = v14 == self;
              }
              else {
                BOOL v15 = 1;
              }
              if (!v15) {
                [v3 addObject:v14];
              }
              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            id v11 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v11);
        }
        id v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }
  return v3;
}

- (void)willBeRemoved
{
  objc_msgSend(objc_msgSend(-[THBodyRep canvas](self, "canvas"), "changeNotifier"), "removeObserver:forChangeSource:", self, -[THBodyRep storage](self, "storage"));
  v3.receiver = self;
  v3.super_class = (Class)THBodyRep;
  [(THWPRep *)&v3 willBeRemoved];
}

- (void)updateFromLayout
{
  v2.receiver = self;
  v2.super_class = (Class)THBodyRep;
  [(THWPRep *)&v2 updateFromLayout];
}

- (id)marginNotesController
{
  id v2 = [(THBodyRep *)self parentRep];

  return [v2 marginNotesController];
}

- (id)marginNotesOwner
{
  [(THBodyRep *)self parentRep];

  return (id)TSUProtocolCast();
}

- (void)setupMarginNotesControllerForHighlightController:(id)a3
{
  id v4 = [(THBodyRep *)self marginNotesController];

  [a3 setMarginNotesController:v4];
}

@end