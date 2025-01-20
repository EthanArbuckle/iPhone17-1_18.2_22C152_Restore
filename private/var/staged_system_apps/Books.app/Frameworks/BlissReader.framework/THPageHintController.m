@interface THPageHintController
- (BOOL)hasFullHintForRelativePageIndex:(unint64_t)a3;
- (NSArray)pageHints;
- (THPageHintController)init;
- (id)hintForRelativePageIndex:(unint64_t)a3;
- (unint64_t)pageCount;
- (void)clearHintsOnRelativePageIndex:(unint64_t)a3;
- (void)clearHintsStartingAtRelativePageIndex:(unint64_t)a3;
- (void)dealloc;
- (void)removeAllHints;
- (void)setHint:(id)a3 forRelativePageIndex:(unint64_t)a4;
- (void)setPageHints:(id)a3;
@end

@implementation THPageHintController

- (THPageHintController)init
{
  v4.receiver = self;
  v4.super_class = (Class)THPageHintController;
  v2 = [(THPageHintController *)&v4 init];
  if (v2) {
    v2->_pageHints = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  self->_pageHints = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPageHintController;
  [(THPageHintController *)&v3 dealloc];
}

- (BOOL)hasFullHintForRelativePageIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  if ((unint64_t)[(NSMutableArray *)self->_pageHints count] <= a3) {
    LOBYTE(v5) = 0;
  }
  else {
    unsigned int v5 = [[self->_pageHints objectAtIndex:a3] isEqual:[NSNull null]] ^ 1;
  }
  objc_sync_exit(self);
  return v5;
}

- (void)setHint:(id)a3 forRelativePageIndex:(unint64_t)a4
{
  objc_sync_enter(self);
  while ((unint64_t)[(NSMutableArray *)self->_pageHints count] <= a4)
    [(NSMutableArray *)self->_pageHints addObject:+[NSNull null]];
  [(NSMutableArray *)self->_pageHints replaceObjectAtIndex:a4 withObject:a3];

  objc_sync_exit(self);
}

- (void)clearHintsOnRelativePageIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  if ((unint64_t)[(NSMutableArray *)self->_pageHints count] > a3) {
    [(NSMutableArray *)self->_pageHints replaceObjectAtIndex:a3 withObject:+[NSNull null]];
  }

  objc_sync_exit(self);
}

- (id)hintForRelativePageIndex:(unint64_t)a3
{
  unsigned int v5 = +[NSNull null];
  objc_sync_enter(self);
  if ((unint64_t)[(NSMutableArray *)self->_pageHints count] > a3) {
    unsigned int v5 = (NSNull *)[(NSMutableArray *)self->_pageHints objectAtIndex:a3];
  }
  objc_sync_exit(self);
  return v5;
}

- (void)removeAllHints
{
  objc_sync_enter(self);
  [(NSMutableArray *)self->_pageHints removeAllObjects];

  objc_sync_exit(self);
}

- (void)clearHintsStartingAtRelativePageIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  -[NSMutableArray removeObjectsInRange:](self->_pageHints, "removeObjectsInRange:", a3, (char *)[(NSMutableArray *)self->_pageHints count] - a3);

  objc_sync_exit(self);
}

- (unint64_t)pageCount
{
  objc_sync_enter(self);
  id v3 = [(NSMutableArray *)self->_pageHints count];
  objc_sync_exit(self);
  return (unint64_t)v3;
}

- (NSArray)pageHints
{
  objc_sync_enter(self);
  id v3 = (NSArray *)[(NSMutableArray *)self->_pageHints copy];
  objc_sync_exit(self);
  return v3;
}

- (void)setPageHints:(id)a3
{
  objc_sync_enter(self);
  [(NSMutableArray *)self->_pageHints removeAllObjects];
  [(NSMutableArray *)self->_pageHints addObjectsFromArray:a3];

  objc_sync_exit(self);
}

@end