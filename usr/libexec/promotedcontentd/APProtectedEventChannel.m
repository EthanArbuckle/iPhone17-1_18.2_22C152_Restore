@interface APProtectedEventChannel
- (APProtectedDestination)destination;
- (APProtectedEventChannel)initWithDestination:(id)a3 purpose:(int64_t)a4;
- (id)description;
- (int64_t)purpose;
@end

@implementation APProtectedEventChannel

- (APProtectedEventChannel)initWithDestination:(id)a3 purpose:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APProtectedEventChannel;
  v7 = [(APProtectedEventChannel *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 protectedDestination];
    destination = v7->_destination;
    v7->_destination = (APProtectedDestination *)v8;

    v7->_purpose = a4;
  }

  return v7;
}

- (id)description
{
  v3 = [(APProtectedEventChannel *)self destination];
  v4 = +[NSNumber numberWithInteger:[(APProtectedEventChannel *)self purpose]];
  v5 = +[NSString stringWithFormat:@"%@/%@", v3, v4];

  return v5;
}

- (APProtectedDestination)destination
{
  return self->_destination;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void).cxx_destruct
{
}

@end