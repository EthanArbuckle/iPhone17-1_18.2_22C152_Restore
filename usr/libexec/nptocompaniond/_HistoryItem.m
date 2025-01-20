@interface _HistoryItem
- (NSDate)timestamp;
- (NSString)localIdentifier;
- (_HistoryItem)initWithDictionary:(id)a3;
- (id)asDictionary;
- (void)setLocalIdentifier:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation _HistoryItem

- (_HistoryItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_HistoryItem;
  v5 = [(_HistoryItem *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"localIdentifier"];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v6;

    v8 = [v4 objectForKeyedSubscript:@"timestamp"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v10 = [v4 mutableCopy];
      v11 = [v10 objectForKeyedSubscript:@"timestamp"];
      [v11 timeIntervalSince1970];
      v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v10 setObject:v12 forKeyedSubscript:@"timestamp"];

      id v13 = [v10 copy];
      id v4 = v13;
    }
    v14 = [v4 objectForKeyedSubscript:@"timestamp"];
    [v14 doubleValue];
    uint64_t v15 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v15;
  }
  return v5;
}

- (id)asDictionary
{
  v8[0] = @"localIdentifier";
  v3 = [(_HistoryItem *)self localIdentifier];
  v8[1] = @"timestamp";
  v9[0] = v3;
  id v4 = [(_HistoryItem *)self timestamp];
  [v4 timeIntervalSince1970];
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v9[1] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end