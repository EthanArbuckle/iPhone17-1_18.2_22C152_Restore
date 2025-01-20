@interface BMSyncCRDTLocationRow
- (BMStreamCRDTLocation)location;
- (BMSyncCRDTLocationRow)initWithFMResultSet:(id)a3 modifier:(unint64_t)a4;
- (BMSyncCRDTLocationRow)initWithLocation:(id)a3 state:(unint64_t)a4;
- (BMSyncCRDTLocationRow)initWithLocation:(id)a3 state:(unint64_t)a4 primaryKey:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)primaryKey;
- (unint64_t)state;
@end

@implementation BMSyncCRDTLocationRow

- (BMSyncCRDTLocationRow)initWithLocation:(id)a3 state:(unint64_t)a4
{
  return [(BMSyncCRDTLocationRow *)self initWithLocation:a3 state:a4 primaryKey:0];
}

- (BMSyncCRDTLocationRow)initWithLocation:(id)a3 state:(unint64_t)a4 primaryKey:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BMSyncCRDTLocationRow;
  v10 = [(BMSyncCRDTLocationRow *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_location, a3);
    v11->_state = a4;
    v11->_primaryKey = a5;
  }

  return v11;
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"<%@: location=%@, state=%lu>", objc_opt_class(), self->_location, self->_state];

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BMSyncCRDTLocationRow *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    location = self->_location;
    v7 = [(BMSyncCRDTLocationRow *)v4 location];
    if ([(BMStreamCRDTLocation *)location isEqual:v7])
    {
      id state = self->_state;
      BOOL v9 = state == (id)[(BMSyncCRDTLocationRow *)v5 state];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BMStreamCRDTLocation *)self->_location hash];
  v4 = +[NSNumber numberWithUnsignedInteger:self->_state];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (BMStreamCRDTLocation)location
{
  return self->_location;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)primaryKey
{
  return self->_primaryKey;
}

- (void).cxx_destruct
{
}

- (BMSyncCRDTLocationRow)initWithFMResultSet:(id)a3 modifier:(unint64_t)a4
{
  id v6 = a3;
  if (a4 >= 3)
  {
    v25 = __biome_log_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000441EC(a4, v25);
    }

    v17 = 0;
  }
  else
  {
    uint64_t v7 = (uint64_t)*(&off_10006CAE0 + a4);
    id v8 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v7, @"stream"];
    BOOL v9 = [v6 stringForColumn:v8];

    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v7, @"site"];
    v11 = [v6 stringForColumn:v10];

    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v7, @"day"];
    [v6 doubleForColumn:v12];
    double v14 = v13;

    id v15 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:v14];
    v16 = v15;
    if (a4 == 1 || (v17 = 0, v9) && v11 && v15)
    {
      v18 = [[BMStreamCRDTLocation alloc] initWithStreamName:v9 siteIdentifier:v11 day:v15];
      if (v18)
      {
        v27 = self;
        id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v7, @"state"];
        uint64_t v20 = (int)[v6 intForColumn:v19];

        id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v7, @"id"];
        uint64_t v22 = (int)[v6 intForColumn:v21];

        v23 = [BMSyncCRDTLocationRow alloc];
        uint64_t v24 = v22;
        self = v27;
        v17 = [(BMSyncCRDTLocationRow *)v23 initWithLocation:v18 state:v20 primaryKey:v24];
      }
      else
      {
        v17 = 0;
      }
    }
  }

  return v17;
}

@end