@interface PLTrip
- (NSArray)items;
- (PLTrip)initWithItems:(id)a3 type:(unint64_t)a4;
- (double)duration;
- (id)description;
- (id)typeDescription;
- (unint64_t)type;
@end

@implementation PLTrip

- (void).cxx_destruct
{
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)type
{
  return self->_type;
}

- (double)duration
{
  v3 = [(PLTrip *)self items];
  v4 = [v3 firstObject];

  v5 = [(PLTrip *)self items];
  v6 = [v5 lastObject];

  v7 = objc_msgSend(v6, "pl_endDate");
  v8 = objc_msgSend(v4, "pl_startDate");
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  return v10;
}

- (id)typeDescription
{
  unint64_t type = self->_type;
  v3 = @"Short";
  if (type == 1) {
    v3 = @"Long";
  }
  if (type == 2) {
    return @"Ongoing";
  }
  else {
    return v3;
  }
}

- (id)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)PLTrip;
  v4 = [(PLTrip *)&v14 description];
  v5 = [(PLTrip *)self items];
  v6 = [v5 firstObject];
  v7 = objc_msgSend(v6, "pl_startDate");
  v8 = [(PLTrip *)self items];
  double v9 = [v8 lastObject];
  double v10 = objc_msgSend(v9, "pl_endDate");
  v11 = [(PLTrip *)self typeDescription];
  v12 = [v3 stringWithFormat:@"%@ %@ - %@, %@, %lu moments", v4, v7, v10, v11, -[NSArray count](self->_items, "count")];

  return v12;
}

- (PLTrip)initWithItems:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLTrip;
  v7 = [(PLTrip *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_unint64_t type = a4;
    uint64_t v9 = [v6 copy];
    items = v8->_items;
    v8->_items = (NSArray *)v9;
  }
  return v8;
}

@end