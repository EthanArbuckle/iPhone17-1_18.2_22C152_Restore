@interface MOContextFeedback
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MOContextFeedback)initWithCoder:(id)a3;
- (MOContextFeedback)initWithContextIdentifier:(id)a3;
- (NSArray)contextStringFeedback;
- (NSDate)contextFetchedTimestamp;
- (NSUUID)contextIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContextFetchedTimestamp:(id)a3;
- (void)setContextStringFeedback:(id)a3;
@end

@implementation MOContextFeedback

- (MOContextFeedback)initWithContextIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOContextFeedback;
  v6 = [(MOContextFeedback *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contextIdentifier, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  contextIdentifier = self->_contextIdentifier;
  id v5 = a3;
  [v5 encodeObject:contextIdentifier forKey:@"contextIdentifier"];
  [v5 encodeObject:self->_contextFetchedTimestamp forKey:@"contextFetchedTimestamp"];
  [v5 encodeObject:self->_contextStringFeedback forKey:@"contextStringFeedback"];
}

- (MOContextFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextIdentifier"];
  v6 = [(MOContextFeedback *)self initWithContextIdentifier:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextFetchedTimestamp"];
    contextFetchedTimestamp = v6->_contextFetchedTimestamp;
    v6->_contextFetchedTimestamp = (NSDate *)v7;

    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"contextStringFeedback"];
    contextStringFeedback = v6->_contextStringFeedback;
    v6->_contextStringFeedback = (NSArray *)v11;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 isMemberOfClass:objc_opt_class()];
  contextIdentifier = self->_contextIdentifier;
  uint64_t v7 = [v4 contextIdentifier];

  LOBYTE(contextIdentifier) = [(NSUUID *)contextIdentifier isEqual:v7];
  return v5 & contextIdentifier;
}

- (id)description
{
  v3 = [(MOContextFeedback *)self contextIdentifier];
  id v4 = [(MOContextFeedback *)self contextFetchedTimestamp];
  unsigned __int8 v5 = [(MOContextFeedback *)self contextStringFeedback];
  v6 = [v5 description];
  uint64_t v7 = +[NSString stringWithFormat:@"contextIdentifier, %@, contextFetchedTimestamp, %@, contextStringFeedback, %@", v3, v4, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MOContextFeedback alloc];
  unsigned __int8 v5 = [(MOContextFeedback *)self contextIdentifier];
  v6 = [(MOContextFeedback *)v4 initWithContextIdentifier:v5];

  uint64_t v7 = [(MOContextFeedback *)self contextFetchedTimestamp];
  [(MOContextFeedback *)v6 setContextFetchedTimestamp:v7];

  v8 = [(MOContextFeedback *)self contextStringFeedback];
  [(MOContextFeedback *)v6 setContextStringFeedback:v8];

  return v6;
}

- (NSUUID)contextIdentifier
{
  return self->_contextIdentifier;
}

- (NSDate)contextFetchedTimestamp
{
  return self->_contextFetchedTimestamp;
}

- (void)setContextFetchedTimestamp:(id)a3
{
}

- (NSArray)contextStringFeedback
{
  return self->_contextStringFeedback;
}

- (void)setContextStringFeedback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextStringFeedback, 0);
  objc_storeStrong((id *)&self->_contextFetchedTimestamp, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
}

@end