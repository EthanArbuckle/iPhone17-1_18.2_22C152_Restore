@interface MTAStateStoreEvent
+ (BOOL)supportsSecureCoding;
+ (id)blankEvent;
+ (id)eventWithType:(int64_t)a3;
+ (id)eventWithType:(int64_t)a3 identifier:(id)a4;
+ (id)eventWithType:(int64_t)a3 identifier:(id)a4 value:(double)a5 indexPath:(id)a6;
+ (id)eventWithType:(int64_t)a3 indexPath:(id)a4;
+ (id)eventWithType:(int64_t)a3 value:(double)a4;
- (MTAStateStoreEvent)initWithCoder:(id)a3;
- (NSIndexPath)indexPath;
- (NSString)identifier;
- (double)value;
- (id)description;
- (int64_t)eventType;
- (void)encodeWithCoder:(id)a3;
- (void)setEventType:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIndexPath:(id)a3;
- (void)setValue:(double)a3;
@end

@implementation MTAStateStoreEvent

- (void)encodeWithCoder:(id)a3
{
  int64_t eventType = self->_eventType;
  id v7 = a3;
  v5 = +[NSNumber numberWithInteger:eventType];
  [v7 encodeObject:v5 forKey:@"kMTAStateStoreEventType"];

  v6 = +[NSNumber numberWithDouble:self->_value];
  [v7 encodeObject:v6 forKey:@"kMTAStateStoreEventValue"];

  [v7 encodeObject:self->_identifier forKey:@"kMTAStateStoreEventIdentifier"];
  [v7 encodeObject:self->_indexPath forKey:@"kMTAStateStoreEventIndexPath"];
}

+ (id)eventWithType:(int64_t)a3 identifier:(id)a4 value:(double)a5 indexPath:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  v11 = objc_opt_new();
  [v11 setEventType:a3];
  [v11 setValue:a5];
  [v11 setIdentifier:v10];

  [v11 setIndexPath:v9];

  return v11;
}

- (MTAStateStoreEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MTAStateStoreEvent;
  v5 = [(MTAStateStoreEvent *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMTAStateStoreEventType"];
    v5->_int64_t eventType = (int64_t)[v6 integerValue];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMTAStateStoreEventValue"];
    [v7 floatValue];
    v5->_value = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMTAStateStoreEventIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMTAStateStoreEventIndexPath"];
    indexPath = v5->_indexPath;
    v5->_indexPath = (NSIndexPath *)v11;
  }
  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:@"State store event: %li, identifier:%@, value: %f, indexPath: %@", self->_eventType, self->_identifier, *(void *)&self->_value, self->_indexPath];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (void)setIndexPath:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setEventType:(int64_t)a3
{
  self->_int64_t eventType = a3;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)eventWithType:(int64_t)a3 value:(double)a4
{
  return _[a1 eventWithType:a3 identifier:0 value:0 indexPath:a4];
}

+ (id)eventWithType:(int64_t)a3
{
  return _[a1 eventWithType:a3 value:0.0];
}

+ (id)eventWithType:(int64_t)a3 identifier:(id)a4
{
  return _[a1 eventWithType:a3 identifier:a4 value:0 indexPath:0.0];
}

+ (id)eventWithType:(int64_t)a3 indexPath:(id)a4
{
  return _[a1 eventWithType:a3 identifier:0 value:a4 indexPath:0.0];
}

+ (id)blankEvent
{
  return _[a1 eventWithType:0 value:0.0];
}

- (double)value
{
  return self->_value;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

@end