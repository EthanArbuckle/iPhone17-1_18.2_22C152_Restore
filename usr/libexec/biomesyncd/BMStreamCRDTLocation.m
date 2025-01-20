@interface BMStreamCRDTLocation
+ (id)dayFromRecordName:(id)a3;
+ (id)recordNameFromSite:(id)a3 day:(id)a4;
- (BMStreamCRDTLocation)initWithCKMergeableValueID:(id)a3;
- (BMStreamCRDTLocation)initWithCKMergeableValueID:(id)a3 streamName:(id)a4;
- (BMStreamCRDTLocation)initWithStreamName:(id)a3 siteIdentifier:(id)a4 day:(id)a5;
- (BMStreamCRDTLocation)initWithTriple:(id)a3;
- (BMStreamCRDTLocation)initWithZoneName:(id)a3 recordName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)day;
- (NSString)siteIdentifier;
- (NSString)streamName;
- (double)secondsUntilExpirationWithStreamConfiguration:(id)a3;
- (id)ckMergeableValueID;
- (id)ckMergeableValueIDWithFormatVersion:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (id)recordName;
- (id)triple;
- (unint64_t)hash;
@end

@implementation BMStreamCRDTLocation

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"stream"];
  v6 = [v4 objectForKeyedSubscript:@"site"];
  v7 = [v4 objectForKeyedSubscript:@"day"];

  v8 = [(BMStreamCRDTLocation *)self initWithStreamName:v5 siteIdentifier:v6 day:v7];
  return v8;
}

- (id)dictionaryRepresentation
{
  v8[0] = @"stream";
  v3 = [(BMStreamCRDTLocation *)self streamName];
  v9[0] = v3;
  v8[1] = @"site";
  id v4 = [(BMStreamCRDTLocation *)self siteIdentifier];
  v9[1] = v4;
  v8[2] = @"day";
  v5 = [(BMStreamCRDTLocation *)self day];
  v9[2] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (BMStreamCRDTLocation)initWithStreamName:(id)a3 siteIdentifier:(id)a4 day:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9 && v10 && v11)
  {
    v18.receiver = self;
    v18.super_class = (Class)BMStreamCRDTLocation;
    v13 = [(BMStreamCRDTLocation *)&v18 init];
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_streamName, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 4, a5);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2112;
      v24 = v12;
      _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "nil value encountered in [BMStreamCRDTLocation initWithStreamName:%@ siteIdentifier:%@ day:%@]", buf, 0x20u);
    }

    v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BMStreamCRDTLocation *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    streamName = self->_streamName;
    v7 = [(BMStreamCRDTLocation *)v4 streamName];
    if ([(NSString *)streamName isEqualToString:v7])
    {
      siteIdentifier = self->_siteIdentifier;
      id v9 = [(BMStreamCRDTLocation *)v5 siteIdentifier];
      if ([(NSString *)siteIdentifier isEqualToString:v9])
      {
        day = self->_day;
        id v11 = [(BMStreamCRDTLocation *)v5 day];
        unsigned __int8 v12 = [(NSDate *)day isEqualToDate:v11];
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_streamName hash];
  unint64_t v4 = [(NSString *)self->_siteIdentifier hash] ^ v3;
  return v4 ^ (unint64_t)[(NSDate *)self->_day hash];
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"BMStreamCRDTLocation(stream: %@, site: %@, day: %@)", self->_streamName, self->_siteIdentifier, self->_day];

  return v2;
}

- (id)triple
{
  NSUInteger v3 = +[BMDateFormatterVendor sharedInstance];
  unint64_t v4 = [v3 dateFormatter];

  id v5 = objc_alloc((Class)NSString);
  streamName = self->_streamName;
  siteIdentifier = self->_siteIdentifier;
  v8 = [v4 stringFromDate:self->_day];
  id v9 = [v5 initWithFormat:@"(%@,%@,%@)", streamName, siteIdentifier, v8];

  return v9;
}

+ (id)recordNameFromSite:(id)a3 day:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[BMDateFormatterVendor sharedInstance];
  v8 = [v7 dateFormatter];

  id v9 = objc_alloc((Class)NSString);
  id v10 = [v8 stringFromDate:v5];

  id v11 = [v9 initWithFormat:@"%@,%@", v6, v10];

  return v11;
}

- (id)recordName
{
  return +[BMStreamCRDTLocation recordNameFromSite:self->_siteIdentifier day:self->_day];
}

- (BMStreamCRDTLocation)initWithTriple:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [v4 substringWithRange:1, [v4 length] - 2];
    id v6 = [v5 componentsSeparatedByString:@","];

    if ([v6 count] == (id)3)
    {
      v7 = [v6 objectAtIndexedSubscript:0];
      v8 = [v6 objectAtIndexedSubscript:1];
      id v9 = +[BMDateFormatterVendor sharedInstance];
      id v10 = [v9 dateFormatter];

      id v11 = [v6 objectAtIndexedSubscript:2];
      unsigned __int8 v12 = [v10 dateFromString:v11];

      v13 = [[BMStreamCRDTLocation alloc] initWithStreamName:v7 siteIdentifier:v8 day:v12];
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)dayFromRecordName:(id)a3
{
  NSUInteger v3 = [a3 componentsSeparatedByString:@","];
  id v4 = +[BMDateFormatterVendor sharedInstance];
  id v5 = [v4 dateFormatter];

  id v6 = [v3 objectAtIndexedSubscript:1];
  v7 = [v5 dateFromString:v6];

  return v7;
}

- (BMStreamCRDTLocation)initWithZoneName:(id)a3 recordName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)NSString) initWithFormat:@"(%@,%@)", v7, v6];

  id v9 = [(BMStreamCRDTLocation *)self initWithTriple:v8];
  return v9;
}

- (BMStreamCRDTLocation)initWithCKMergeableValueID:(id)a3
{
  return [(BMStreamCRDTLocation *)self initWithCKMergeableValueID:a3 streamName:0];
}

- (BMStreamCRDTLocation)initWithCKMergeableValueID:(id)a3 streamName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)NSString);
  id v9 = [v6 identifier];
  id v10 = [v8 initWithData:v9 encoding:4];

  if ([v10 characterAtIndex:0] == 40)
  {
    if (v10 && [v10 length])
    {
      self = [(BMStreamCRDTLocation *)self initWithTriple:v10];
      id v11 = self;
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    if (v7)
    {
      id v12 = v7;
    }
    else
    {
      v13 = [v6 zoneID];
      id v12 = [v13 zoneName];

      if (!v12)
      {
        v14 = __biome_log_for_category();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
          sub_10004813C(v14);
        }

        id v12 = 0;
      }
    }
    v15 = [v6 recordID];
    v16 = [v15 recordName];

    id v25 = v7;
    if (v16) {
      v17 = v16;
    }
    else {
      v17 = v10;
    }
    objc_super v18 = [v17 componentsSeparatedByString:@","];
    v19 = [v18 objectAtIndexedSubscript:0];
    id v20 = +[BMDateFormatterVendor sharedInstance];
    __int16 v21 = [v20 dateFormatter];

    id v22 = [v18 objectAtIndexedSubscript:1];
    __int16 v23 = [v21 dateFromString:v22];

    self = [(BMStreamCRDTLocation *)self initWithStreamName:v12 siteIdentifier:v19 day:v23];
    id v11 = self;
    id v7 = v25;
  }

  return v11;
}

- (id)ckMergeableValueID
{
  return [(BMStreamCRDTLocation *)self ckMergeableValueIDWithFormatVersion:0];
}

- (id)ckMergeableValueIDWithFormatVersion:(unint64_t)a3
{
  p_streamName = &self->_streamName;
  if ([(NSString *)self->_streamName length])
  {
    id v6 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:*p_streamName ownerName:CKCurrentUserDefaultName];
    if (a3 == 1)
    {
      id v15 = objc_alloc((Class)CKMergeableValueID);
      v16 = [(BMStreamCRDTLocation *)self recordName];
      id v14 = [v15 initWithName:v16 zoneID:v6];

      goto LABEL_12;
    }
    if (!a3)
    {
      id v7 = +[BMDateFormatterVendor sharedInstance];
      id v8 = [v7 dateFormatter];

      id v9 = objc_alloc((Class)NSString);
      streamName = self->_streamName;
      siteIdentifier = self->_siteIdentifier;
      id v12 = [v8 stringFromDate:self->_day];
      id v13 = [v9 initWithFormat:@"(%@,%@,%@)", streamName, siteIdentifier, v12];

      id v14 = [objc_alloc((Class)CKMergeableValueID) initWithName:v13 zoneID:v6];
      goto LABEL_12;
    }
    v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_100048228(a3, v17);
    }
  }
  else
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100048180(p_streamName, (uint64_t)self, v6);
    }
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

- (double)secondsUntilExpirationWithStreamConfiguration:(id)a3
{
  id v4 = [a3 storeConfig];
  id v5 = [v4 pruningPolicy];
  [v5 maxAge];
  double v7 = v6;

  double v8 = 2419200.0;
  if (v7 != 0.0) {
    double v8 = v7;
  }
  if (v7 == BMPruningPolicyMaxAgeNoLimit) {
    double v9 = 157680000.0;
  }
  else {
    double v9 = v8;
  }
  id v10 = [(BMStreamCRDTLocation *)self day];
  [v10 timeIntervalSinceNow];
  double v12 = v11;

  return v9 + v12;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (NSString)siteIdentifier
{
  return self->_siteIdentifier;
}

- (NSDate)day
{
  return self->_day;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_day, 0);
  objc_storeStrong((id *)&self->_siteIdentifier, 0);
  objc_storeStrong((id *)&self->_streamName, 0);

  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end