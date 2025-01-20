@interface TPSContextualBiomeEvent
+ (BOOL)supportsSecureCoding;
+ (id)observationDateFromEvent:(id)a3;
+ (id)streamFromDictionary:(id)a3;
- (NSDictionary)filterInfo;
- (NSString)stream;
- (TPSContextualBiomeEvent)initWithCoder:(id)a3;
- (TPSContextualBiomeEvent)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)filterHandler;
- (id)filterParametersForBiomeQuery;
- (id)publisherFromStartTime:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFilterInfo:(id)a3;
- (void)setStream:(id)a3;
@end

@implementation TPSContextualBiomeEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)streamFromDictionary:(id)a3
{
  return (id)[a3 TPSSafeStringForKey:@"stream"];
}

+ (id)observationDateFromEvent:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  [a3 timestamp];
  return (id)objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
}

- (TPSContextualBiomeEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSContextualBiomeEvent;
  v5 = [(TPSContextualEvent *)&v11 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 TPSSafeStringForKey:@"stream"];
    stream = v5->_stream;
    v5->_stream = (NSString *)v6;

    uint64_t v8 = [v4 TPSSafeDictionaryForKey:@"filter"];
    filterInfo = v5->_filterInfo;
    v5->_filterInfo = (NSDictionary *)v8;
  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return 0;
}

- (id)filterHandler
{
  return 0;
}

- (id)filterParametersForBiomeQuery
{
  if (self->_filterInfo)
  {
    v3 = objc_opt_new();
    id v4 = [(TPSContextualBiomeEvent *)self filterInfo];
    v5 = [v4 TPSSafeObjectForKey:@"isStarting"];

    if (v5)
    {
      uint64_t v6 = NSNumber;
      v7 = [(TPSContextualBiomeEvent *)self filterInfo];
      uint64_t v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "TPSSafeBoolForKey:", @"isStarting"));
      [v3 setObject:v8 forKeyedSubscript:@"starting"];
    }
    v9 = [(TPSContextualBiomeEvent *)self filterInfo];
    v10 = [v9 TPSSafeObjectForKey:@"bundleID"];

    if (v10)
    {
      objc_super v11 = [(TPSContextualBiomeEvent *)self filterInfo];
      v12 = [v11 TPSSafeStringForKey:@"bundleID"];
      [v3 setObject:v12 forKeyedSubscript:@"bundleID"];
    }
    v13 = (void *)[v3 copy];
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (TPSContextualBiomeEvent)initWithCoder:(id)a3
{
  v15[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSContextualBiomeEvent;
  v5 = [(TPSContextualEvent *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stream"];
    stream = v5->_stream;
    v5->_stream = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];
    v10 = [v8 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"filter"];
    filterInfo = v5->_filterInfo;
    v5->_filterInfo = (NSDictionary *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSContextualBiomeEvent;
  id v4 = a3;
  [(TPSContextualEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_stream, @"stream", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_filterInfo forKey:@"filter"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSContextualBiomeEvent;
  id v4 = [(TPSContextualEvent *)&v6 copyWithZone:a3];
  [v4 setStream:self->_stream];
  [v4 setFilterInfo:self->_filterInfo];
  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v10.receiver = self;
  v10.super_class = (Class)TPSContextualBiomeEvent;
  id v4 = [(TPSContextualEvent *)&v10 debugDescription];
  objc_super v5 = (void *)[v3 initWithString:v4];

  stream = self->_stream;
  if (stream) {
    [v5 appendFormat:@"%@ = %@\n", @"stream", stream];
  }
  filterInfo = self->_filterInfo;
  if (filterInfo)
  {
    uint64_t v8 = [(NSDictionary *)filterInfo debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"filter", v8];
  }
  return v5;
}

- (NSString)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (NSDictionary)filterInfo
{
  return self->_filterInfo;
}

- (void)setFilterInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterInfo, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end