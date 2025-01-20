@interface WBSHistoryServicePendingVisit
- (BOOL)loadSuccessful;
- (BOOL)wasHTTPNonGet;
- (NSString)title;
- (NSString)urlString;
- (WBSHistoryServicePendingVisit)initWithWithVisitIdentifier:(id)a3;
- (WBSHistoryVisitIdentifier)sourceVisitIdentifier;
- (WBSHistoryVisitIdentifier)visitIdentifier;
- (double)visitTime;
- (int64_t)origin;
- (int64_t)statusCode;
- (unint64_t)attributes;
- (unint64_t)operation;
- (unint64_t)score;
- (unint64_t)visitCount;
- (void)setAttributes:(unint64_t)a3;
- (void)setLoadSuccessful:(BOOL)a3;
- (void)setOperation:(unint64_t)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setSourceVisitIdentifier:(id)a3;
- (void)setStatusCode:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setVisitCount:(unint64_t)a3;
- (void)setWasHTTPNonGet:(BOOL)a3;
@end

@implementation WBSHistoryServicePendingVisit

- (WBSHistoryServicePendingVisit)initWithWithVisitIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServicePendingVisit;
  v6 = [(WBSHistoryServicePendingVisit *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visitIdentifier, a3);
    v7->_visitCount = 1;
    v8 = v7;
  }

  return v7;
}

- (void)setTitle:(id)a3
{
  self->_operation |= 2uLL;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setAttributes:(unint64_t)a3
{
  self->_operation |= 4uLL;
  self->_attributes = a3;
}

- (NSString)urlString
{
  return [(WBSHistoryVisitIdentifier *)self->_visitIdentifier urlString];
}

- (double)visitTime
{
  [(WBSHistoryVisitIdentifier *)self->_visitIdentifier visitTime];
  return result;
}

- (unint64_t)score
{
  float v2 = WBHistoryVisitWeightForAttributesAndOrigin(self->_attributes, self->_origin);
  return (int)WBSHistoryVisitScoreForWeightedVisitCount(v2);
}

- (WBSHistoryVisitIdentifier)visitIdentifier
{
  return self->_visitIdentifier;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_operation = a3;
}

- (WBSHistoryVisitIdentifier)sourceVisitIdentifier
{
  return self->_sourceVisitIdentifier;
}

- (void)setSourceVisitIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)wasHTTPNonGet
{
  return self->_wasHTTPNonGet;
}

- (void)setWasHTTPNonGet:(BOOL)a3
{
  self->_wasHTTPNonGet = a3;
}

- (BOOL)loadSuccessful
{
  return self->_loadSuccessful;
}

- (void)setLoadSuccessful:(BOOL)a3
{
  self->_loadSuccessful = a3;
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (unint64_t)attributes
{
  return self->_attributes;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (unint64_t)visitCount
{
  return self->_visitCount;
}

- (void)setVisitCount:(unint64_t)a3
{
  self->_visitCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sourceVisitIdentifier, 0);
  objc_storeStrong((id *)&self->_visitIdentifier, 0);
}

@end