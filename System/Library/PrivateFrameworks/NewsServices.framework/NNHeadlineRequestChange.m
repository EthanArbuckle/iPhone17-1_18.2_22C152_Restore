@interface NNHeadlineRequestChange
- (NNHeadlineRequestChange)initWithResultIdentifier:(id)a3 requestDate:(id)a4;
- (NSDate)requestDate;
- (NSString)resultIdentifier;
- (NSString)sequencer;
- (int64_t)changeType;
@end

@implementation NNHeadlineRequestChange

- (NNHeadlineRequestChange)initWithResultIdentifier:(id)a3 requestDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NNHeadlineRequestChange;
  v8 = [(NNHeadlineRequestChange *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    resultIdentifier = v8->_resultIdentifier;
    v8->_resultIdentifier = v9;

    v11 = (NSDate *)[v7 copy];
    requestDate = v8->_requestDate;
    v8->_requestDate = v11;
  }
  return v8;
}

- (int64_t)changeType
{
  return 2;
}

- (NSString)sequencer
{
  v2 = +[NSDate date];
  [v2 timeIntervalSinceReferenceDate];
  v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
}

@end