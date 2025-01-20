@interface WBSHistoryServiceImporter
- (WBSHistoryServiceDatabase)database;
- (WBSHistoryServiceImporter)initWithDatabase:(id)a3 visitTimePrecision:(unint64_t)a4;
- (unint64_t)visitTimePrecision;
- (void)_submitVisitsWithCompletionHandler:(id)a3;
- (void)addVisitWithURLString:(id)a3 visitTime:(double)a4 title:(id)a5 loadSuccessful:(BOOL)a6 httpGet:(BOOL)a7 redirectSourceURLString:(id)a8 redirectSourceVisitTime:(double)a9 visitCount:(unint64_t)a10;
- (void)finishWithCompletionHandler:(id)a3;
@end

@implementation WBSHistoryServiceImporter

- (WBSHistoryServiceImporter)initWithDatabase:(id)a3 visitTimePrecision:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSHistoryServiceImporter;
  v8 = [(WBSHistoryServiceImporter *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_database, a3);
    v9->_visitTimePrecision = a4;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    visits = v9->_visits;
    v9->_visits = v10;

    v12 = v9;
  }

  return v9;
}

- (void)addVisitWithURLString:(id)a3 visitTime:(double)a4 title:(id)a5 loadSuccessful:(BOOL)a6 httpGet:(BOOL)a7 redirectSourceURLString:(id)a8 redirectSourceVisitTime:(double)a9 visitCount:(unint64_t)a10
{
  BOOL v12 = a7;
  BOOL v13 = a6;
  id v24 = a8;
  id v18 = a5;
  id v19 = a3;
  v20 = [[WBSHistoryVisitIdentifier alloc] initWithURLString:v19 visitTime:a4];

  v21 = [[WBSHistoryServicePendingVisit alloc] initWithWithVisitIdentifier:v20];
  [(WBSHistoryServicePendingVisit *)v21 setOperation:1];
  [(WBSHistoryServicePendingVisit *)v21 setTitle:v18];

  [(WBSHistoryServicePendingVisit *)v21 setLoadSuccessful:v13];
  [(WBSHistoryServicePendingVisit *)v21 setWasHTTPNonGet:!v12];
  if (a10 <= 1) {
    unint64_t v22 = 1;
  }
  else {
    unint64_t v22 = a10;
  }
  [(WBSHistoryServicePendingVisit *)v21 setVisitCount:v22];
  if (v24)
  {
    v23 = [[WBSHistoryVisitIdentifier alloc] initWithURLString:v24 visitTime:a9];
    [(WBSHistoryServicePendingVisit *)v21 setSourceVisitIdentifier:v23];
  }
  [(NSMutableArray *)self->_visits addObject:v21];
  if ((unint64_t)[(NSMutableArray *)self->_visits count] >= 0x400) {
    [(WBSHistoryServiceImporter *)self _submitVisitsWithCompletionHandler:0];
  }
}

- (void)finishWithCompletionHandler:(id)a3
{
  visits = self->_visits;
  v5 = (void (**)(id, void))a3;
  if ([(NSMutableArray *)visits count]) {
    [(WBSHistoryServiceImporter *)self _submitVisitsWithCompletionHandler:v5];
  }
  else {
    v5[2](v5, 0);
  }
}

- (void)_submitVisitsWithCompletionHandler:(id)a3
{
  [(WBSHistoryServiceDatabase *)self->_database importVisits:self->_visits desiredVisitTimePrecision:self->_visitTimePrecision completionHandler:a3];
  visits = self->_visits;
  [(NSMutableArray *)visits removeAllObjects];
}

- (WBSHistoryServiceDatabase)database
{
  return self->_database;
}

- (unint64_t)visitTimePrecision
{
  return self->_visitTimePrecision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_visits, 0);
}

@end