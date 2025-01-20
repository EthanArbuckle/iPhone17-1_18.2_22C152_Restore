@interface FMTSEventCellChanged
- (FMTSEventCellChanged)initWithTimestamp:(unint64_t)a3 andDict:(id)a4;
- (FMTSEventCellChanged)initWithTimestamp:(unint64_t)a3 fromCellGCI:(id)a4 toCellGCI:(id)a5;
- (NSDictionary)detailsAsDict;
- (NSString)fromCellGCI;
- (NSString)toCellGCI;
- (id)description;
- (signed)type;
@end

@implementation FMTSEventCellChanged

- (FMTSEventCellChanged)initWithTimestamp:(unint64_t)a3 fromCellGCI:(id)a4 toCellGCI:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FMTSEventCellChanged;
  v11 = [(FMTSEvent *)&v15 initWithTimestamp:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fromCellGCI, a4);
    objc_storeStrong((id *)&v12->_toCellGCI, a5);
    v13 = v12;
  }

  return v12;
}

- (FMTSEventCellChanged)initWithTimestamp:(unint64_t)a3 andDict:(id)a4
{
  id v6 = a4;
  v7 = [v6 valueForKey:@"from"];
  uint64_t v8 = [v6 valueForKey:@"to"];
  id v9 = (void *)v8;
  id v10 = 0;
  if (v7 && v8)
  {
    self = [(FMTSEventCellChanged *)self initWithTimestamp:a3 fromCellGCI:v7 toCellGCI:v8];
    id v10 = self;
  }

  return v10;
}

- (signed)type
{
  return 1;
}

- (NSDictionary)detailsAsDict
{
  v7[0] = @"from";
  v3 = [(FMTSEventCellChanged *)self fromCellGCI];
  v7[1] = @"to";
  v8[0] = v3;
  v4 = [(FMTSEventCellChanged *)self toCellGCI];
  v8[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)FMTSEventCellChanged;
  v3 = [(FMTSEvent *)&v8 description];
  v4 = [(FMTSEventCellChanged *)self fromCellGCI];
  v5 = [(FMTSEventCellChanged *)self toCellGCI];
  id v6 = +[NSString stringWithFormat:@"FMTSEventCellChanged: %@, fromCellGCI %@, toCellGCI %@", v3, v4, v5];

  return v6;
}

- (NSString)fromCellGCI
{
  return self->_fromCellGCI;
}

- (NSString)toCellGCI
{
  return self->_toCellGCI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toCellGCI, 0);

  objc_storeStrong((id *)&self->_fromCellGCI, 0);
}

@end