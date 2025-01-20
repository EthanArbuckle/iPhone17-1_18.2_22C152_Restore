@interface ExternalURLQuery
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToExternalURLQuery:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (ExternalURLQuery)initWithQuery:(id)a3 coordinate:(CLLocationCoordinate2D)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7;
- (NSString)contentProvider;
- (NSString)query;
- (id)description;
- (int)resultProviderId;
- (unint64_t)hash;
- (unint64_t)muid;
@end

@implementation ExternalURLQuery

- (ExternalURLQuery)initWithQuery:(id)a3 coordinate:(CLLocationCoordinate2D)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v13 = a3;
  id v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ExternalURLQuery;
  v15 = [(ExternalURLQuery *)&v21 init];
  if (v15)
  {
    v16 = (NSString *)[v13 copy];
    query = v15->_query;
    v15->_query = v16;

    v15->_coordinate.CLLocationDegrees latitude = latitude;
    v15->_coordinate.CLLocationDegrees longitude = longitude;
    v15->_muid = a5;
    v15->_resultProviderId = a6;
    v18 = (NSString *)[v14 copy];
    contentProvider = v15->_contentProvider;
    v15->_contentProvider = v18;
  }
  return v15;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(ExternalURLQuery *)self query];
  [(ExternalURLQuery *)self coordinate];
  uint64_t v6 = v5;
  [(ExternalURLQuery *)self coordinate];
  uint64_t v8 = v7;
  v9 = +[NSNumber numberWithUnsignedLongLong:[(ExternalURLQuery *)self muid]];
  v10 = +[NSNumber numberWithInt:[(ExternalURLQuery *)self resultProviderId]];
  v11 = [(ExternalURLQuery *)self contentProvider];
  v12 = +[NSString stringWithFormat:@"<%@: %p query=%@ coordinate=%lf,%lf muid=%@ resultProviderId=%@ contentProvider=%@>", v3, self, v4, v6, v8, v9, v10, v11];

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(ExternalURLQuery *)self query];
  unint64_t v4 = (unint64_t)[v3 hash];
  [(ExternalURLQuery *)self coordinate];
  double v6 = -v5;
  if (v5 >= 0.0) {
    double v6 = v5;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  double v9 = fmod(v7, 1.84467441e19);
  unint64_t v10 = 2654435761u * (unint64_t)v9;
  unint64_t v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0) {
    unint64_t v11 = 2654435761u * (unint64_t)v9;
  }
  unint64_t v12 = v10 - (unint64_t)fabs(v8);
  if (v8 < 0.0) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v11;
  }
  [(ExternalURLQuery *)self coordinate];
  if (v14 < 0.0) {
    double v14 = -v14;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  double v17 = fmod(v15, 1.84467441e19);
  unint64_t v18 = 2654435761u * (unint64_t)v17;
  unint64_t v19 = v18 + (unint64_t)v16;
  if (v16 <= 0.0) {
    unint64_t v19 = 2654435761u * (unint64_t)v17;
  }
  unint64_t v20 = v18 - (unint64_t)fabs(v16);
  if (v16 < 0.0) {
    unint64_t v21 = v20;
  }
  else {
    unint64_t v21 = v19;
  }
  uint64_t v22 = v13 ^ v4 ^ v21 ^ (2654435761u * [(ExternalURLQuery *)self muid]);
  uint64_t v23 = 2654435761 * [(ExternalURLQuery *)self resultProviderId];
  v24 = [(ExternalURLQuery *)self contentProvider];
  unint64_t v25 = v22 ^ v23 ^ (unint64_t)[v24 hash];

  return v25;
}

- (BOOL)isEqualToExternalURLQuery:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    unsigned __int8 v10 = 0;
    goto LABEL_23;
  }
  double v8 = [(ExternalURLQuery *)self query];
  if (v8 || ([v7 query], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unint64_t v4 = [(ExternalURLQuery *)self query];
    double v5 = [v7 query];
    if (([v4 isEqualToString:v5] & 1) == 0)
    {

      unsigned __int8 v10 = 0;
      goto LABEL_20;
    }
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  [(ExternalURLQuery *)self coordinate];
  double v12 = v11;
  [v7 coordinate];
  if (v12 == v13)
  {
    [(ExternalURLQuery *)self coordinate];
    double v15 = v14;
    [v7 coordinate];
    if (v15 == v16)
    {
      id v17 = [(ExternalURLQuery *)self muid];
      if (v17 == [v7 muid])
      {
        unsigned int v18 = [(ExternalURLQuery *)self resultProviderId];
        if (v18 == [v7 resultProviderId])
        {
          unint64_t v19 = [(ExternalURLQuery *)self contentProvider];
          if (v19 || ([v7 contentProvider], (uint64_t v24 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            unint64_t v20 = [(ExternalURLQuery *)self contentProvider];
            unint64_t v21 = [v7 contentProvider];
            unsigned __int8 v10 = [v20 isEqualToString:v21];

            if (v19)
            {

              if ((v9 & 1) == 0) {
                goto LABEL_20;
              }
              goto LABEL_19;
            }
            uint64_t v23 = (void *)v24;
          }
          else
          {
            uint64_t v23 = 0;
            unsigned __int8 v10 = 1;
          }

          if ((v9 & 1) == 0) {
            goto LABEL_20;
          }
LABEL_19:

          goto LABEL_20;
        }
      }
    }
  }
  unsigned __int8 v10 = 0;
  if (v9) {
    goto LABEL_19;
  }
LABEL_20:
  if (!v8) {

  }
LABEL_23:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ExternalURLQuery *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(ExternalURLQuery *)self isEqualToExternalURLQuery:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (NSString)query
{
  return self->_query;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (int)resultProviderId
{
  return self->_resultProviderId;
}

- (NSString)contentProvider
{
  return self->_contentProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProvider, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end