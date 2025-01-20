@interface RTLocationManagerLocationRequest
- (NSDate)startDate;
- (RTLocationManagerLocationRequest)initWithOptions:(id)a3 handler:(id)a4;
- (RTLocationRequestOptions)options;
- (id)description;
- (id)expiryDate;
- (id)handler;
@end

@implementation RTLocationManagerLocationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

- (RTLocationManagerLocationRequest)initWithOptions:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RTLocationManagerLocationRequest;
  v9 = [(RTLocationManagerLocationRequest *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_options, a3);
    uint64_t v11 = MEMORY[0x1E016DB00](v8);
    id handler = v10->_handler;
    v10->_id handler = (id)v11;

    uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v13;
  }
  return v10;
}

- (id)expiryDate
{
  v3 = [(RTLocationManagerLocationRequest *)self startDate];
  v4 = [(RTLocationManagerLocationRequest *)self options];
  [v4 timeout];
  v5 = [v3 dateByAddingTimeInterval:];

  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (RTLocationRequestOptions)options
{
  return self->_options;
}

- (id)handler
{
  return self->_handler;
}

- (id)description
{
  v3 = NSString;
  v4 = [(RTLocationManagerLocationRequest *)self startDate];
  v5 = [v4 stringFromDate];
  v6 = [(RTLocationManagerLocationRequest *)self expiryDate];
  id v7 = [v6 stringFromDate];
  id v8 = [(RTLocationManagerLocationRequest *)self options];
  v9 = [v3 stringWithFormat:@"startDate, %@, expiryDate, %@, options, %@", v5, v7, v8];

  return v9;
}

@end