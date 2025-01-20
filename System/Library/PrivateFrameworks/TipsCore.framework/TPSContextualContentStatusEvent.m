@interface TPSContextualContentStatusEvent
+ (BOOL)supportsSecureCoding;
- (NSString)contentID;
- (TPSContextualContentStatusEvent)initWithCoder:(id)a3;
- (TPSContextualContentStatusEvent)initWithDictionary:(id)a3;
- (TPSContextualContentStatusEvent)initWithEventIdentifier:(id)a3 contentIdentifier:(id)a4 statusType:(int64_t)a5 status:(int64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)statusType;
- (unsigned)minObservationCount;
- (void)encodeWithCoder:(id)a3;
- (void)setContentID:(id)a3;
- (void)setStatusType:(int64_t)a3;
- (void)updateStatusTypeIfOutOfBound;
@end

@implementation TPSContextualContentStatusEvent

- (TPSContextualContentStatusEvent)initWithEventIdentifier:(id)a3 contentIdentifier:(id)a4 statusType:(int64_t)a5 status:(int64_t)a6
{
  id v10 = a4;
  v11 = +[TPSContextualEvent eventDictionaryForIdentifier:a3 type:2 status:a6];
  v12 = (void *)[v11 mutableCopy];

  [v12 setObject:v10 forKeyedSubscript:@"contentID"];
  v13 = [NSNumber numberWithInteger:a5];
  [v12 setObject:v13 forKeyedSubscript:@"statusType"];

  v14 = [(TPSContextualContentStatusEvent *)self initWithDictionary:v12];
  return v14;
}

- (TPSContextualContentStatusEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualContentStatusEvent;
  v5 = [(TPSContextualEvent *)&v9 initWithDictionary:v4];
  if (v5)
  {
    v5->_statusType = [v4 TPSSafeUIntegerForKey:@"statusType"];
    [(TPSContextualContentStatusEvent *)v5 updateStatusTypeIfOutOfBound];
    uint64_t v6 = [v4 TPSSafeStringForKey:@"contentID"];
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;
  }
  return v5;
}

- (void)updateStatusTypeIfOutOfBound
{
  if (self->_statusType >= 0xAuLL) {
    self->_statusType = 6;
  }
}

- (void).cxx_destruct
{
}

- (unsigned)minObservationCount
{
  return 1;
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (NSString)contentID
{
  return self->_contentID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualContentStatusEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualContentStatusEvent;
  v5 = [(TPSContextualEvent *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_statusType = [v4 decodeIntegerForKey:@"statusType"];
    [(TPSContextualContentStatusEvent *)v5 updateStatusTypeIfOutOfBound];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentID"];
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSContextualContentStatusEvent;
  id v4 = a3;
  [(TPSContextualEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_statusType, @"statusType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_contentID forKey:@"contentID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSContextualContentStatusEvent;
  id v4 = [(TPSContextualEvent *)&v6 copyWithZone:a3];
  [v4 setStatusType:self->_statusType];
  [v4 setContentID:self->_contentID];
  return v4;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v7.receiver = self;
  v7.super_class = (Class)TPSContextualContentStatusEvent;
  id v4 = [(TPSContextualEvent *)&v7 debugDescription];
  objc_super v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@"%@ = %ld\n", @"statusType", self->_statusType];
  [v5 appendFormat:@"%@ = %@\n", @"contentID", self->_contentID];
  return v5;
}

- (void)setStatusType:(int64_t)a3
{
  self->_statusType = a3;
}

- (void)setContentID:(id)a3
{
}

@end