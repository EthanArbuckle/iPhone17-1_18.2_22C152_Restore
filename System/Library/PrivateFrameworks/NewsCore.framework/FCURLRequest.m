@interface FCURLRequest
- (id)description;
@end

@implementation FCURLRequest

uint64_t __26__FCURLRequest_comparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = a3;
  if (a2)
  {
    v5 = a2;
    v6 = v5;
    if (v4) {
      uint64_t v7 = v4[3];
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v5[3];
    BOOL v9 = v7 < (uint64_t)v8;
    BOOL v10 = v7 > (uint64_t)v8;
    if (v9) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = v10;
    }
    if (!v11)
    {
      if (v4) {
        uint64_t v12 = v4[4];
      }
      else {
        uint64_t v12 = 0;
      }
      id v13 = v5[4];
      uint64_t v11 = [v13 compare:v12];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = [[FCDescription alloc] initWithObject:self];
  if (self)
  {
    v4 = [(NSURLRequest *)self->_URLRequest URL];
    v5 = [v4 absoluteString];
    [(FCDescription *)v3 addField:@"URL" value:v5];

    unint64_t priority = self->_priority;
  }
  else
  {
    uint64_t v12 = [0 URL];
    id v13 = [v12 absoluteString];
    [(FCDescription *)v3 addField:@"URL" value:v13];

    unint64_t priority = 0;
  }
  uint64_t v7 = FCStringFromRelativePriority(priority);
  [(FCDescription *)v3 addField:@"priority" object:v7];

  if (self)
  {
    id v8 = [(NSDate *)self->_dateInitiated description];
    [(FCDescription *)v3 addField:@"dateInitiated" object:v8];

    loggingKey = self->_loggingKey;
  }
  else
  {
    v14 = [0 description];
    [(FCDescription *)v3 addField:@"dateInitiated" object:v14];

    loggingKey = 0;
  }
  [(FCDescription *)v3 addField:@"loggingKey" object:loggingKey];
  BOOL v10 = [(FCDescription *)v3 descriptionString];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_loggingKey, 0);
  objc_storeStrong((id *)&self->_dateInitiated, 0);
  objc_storeStrong((id *)&self->_URLRequest, 0);
}

@end