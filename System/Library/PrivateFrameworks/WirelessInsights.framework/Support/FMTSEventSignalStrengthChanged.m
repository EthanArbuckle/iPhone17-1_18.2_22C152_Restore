@interface FMTSEventSignalStrengthChanged
- (FMTSEventSignalStrengthChanged)initWithTimestamp:(unint64_t)a3 andDict:(id)a4;
- (FMTSEventSignalStrengthChanged)initWithTimestamp:(unint64_t)a3 fromBars:(id)a4 toBars:(id)a5;
- (NSDictionary)detailsAsDict;
- (NSNumber)fromBars;
- (NSNumber)toBars;
- (id)description;
- (signed)type;
@end

@implementation FMTSEventSignalStrengthChanged

- (FMTSEventSignalStrengthChanged)initWithTimestamp:(unint64_t)a3 fromBars:(id)a4 toBars:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FMTSEventSignalStrengthChanged;
  v11 = [(FMTSEvent *)&v15 initWithTimestamp:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fromBars, a4);
    objc_storeStrong((id *)&v12->_toBars, a5);
    v13 = v12;
  }

  return v12;
}

- (FMTSEventSignalStrengthChanged)initWithTimestamp:(unint64_t)a3 andDict:(id)a4
{
  id v6 = a4;
  v7 = [v6 valueForKey:@"from"];
  uint64_t v8 = [v6 valueForKey:@"to"];
  id v9 = (void *)v8;
  id v10 = 0;
  if (v7 && v8)
  {
    self = [(FMTSEventSignalStrengthChanged *)self initWithTimestamp:a3 fromBars:v7 toBars:v8];
    id v10 = self;
  }

  return v10;
}

- (signed)type
{
  return 2;
}

- (NSDictionary)detailsAsDict
{
  v7[0] = @"from";
  v3 = [(FMTSEventSignalStrengthChanged *)self fromBars];
  v7[1] = @"to";
  v8[0] = v3;
  v4 = [(FMTSEventSignalStrengthChanged *)self toBars];
  v8[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)FMTSEventSignalStrengthChanged;
  v3 = [(FMTSEvent *)&v8 description];
  v4 = [(FMTSEventSignalStrengthChanged *)self fromBars];
  v5 = [(FMTSEventSignalStrengthChanged *)self toBars];
  id v6 = +[NSString stringWithFormat:@"FMTSEventSignalStrengthChanged: %@, fromBars %@, toBars %@", v3, v4, v5];

  return v6;
}

- (NSNumber)fromBars
{
  return self->_fromBars;
}

- (NSNumber)toBars
{
  return self->_toBars;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toBars, 0);

  objc_storeStrong((id *)&self->_fromBars, 0);
}

@end