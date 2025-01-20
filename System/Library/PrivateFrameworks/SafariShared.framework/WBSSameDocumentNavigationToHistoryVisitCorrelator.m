@interface WBSSameDocumentNavigationToHistoryVisitCorrelator
- (WBSSameDocumentNavigationToHistoryVisitCorrelator)init;
- (id)visitForSameDocumentNavigationToURL:(id)a3;
- (void)noteVisit:(id)a3;
@end

@implementation WBSSameDocumentNavigationToHistoryVisitCorrelator

- (WBSSameDocumentNavigationToHistoryVisitCorrelator)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSSameDocumentNavigationToHistoryVisitCorrelator;
  v2 = [(WBSSameDocumentNavigationToHistoryVisitCorrelator *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
    visits = v2->_visits;
    v2->_visits = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)noteVisit:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if ((unint64_t)[(NSMutableArray *)self->_visits count] >= 5) {
      [(NSMutableArray *)self->_visits removeObjectAtIndex:0];
    }
    [(NSMutableArray *)self->_visits addObject:v5];
    id v4 = v5;
  }
}

- (id)visitForSameDocumentNavigationToURL:(id)a3
{
  id v4 = a3;
  visits = self->_visits;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__WBSSameDocumentNavigationToHistoryVisitCorrelator_visitForSameDocumentNavigationToURL___block_invoke;
  v11[3] = &unk_1E5C9FB40;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [(NSMutableArray *)visits indexOfObjectPassingTest:v11];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    uint64_t v9 = v7;
    v8 = [(NSMutableArray *)self->_visits objectAtIndexedSubscript:v7];
    -[NSMutableArray removeObjectsInRange:](self->_visits, "removeObjectsInRange:", 0, v9 + 1);
  }

  return v8;
}

uint64_t __89__WBSSameDocumentNavigationToHistoryVisitCorrelator_visitForSameDocumentNavigationToURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 item];
  id v4 = [v3 url];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (void).cxx_destruct
{
}

@end