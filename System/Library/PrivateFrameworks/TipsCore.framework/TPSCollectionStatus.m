@interface TPSCollectionStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)canNotify;
- (NSDate)activatedDate;
- (NSDate)featuredDate;
- (NSDate)firstViewedDate;
- (NSString)identifier;
- (TPSCollectionStatus)initWithCoder:(id)a3;
- (TPSCollectionStatus)initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setActivatedDate:(id)a3;
- (void)setCanNotify:(BOOL)a3;
- (void)setFeaturedDate:(id)a3;
- (void)setFirstViewedDate:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation TPSCollectionStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)featuredDate
{
  return self->_featuredDate;
}

- (NSDate)activatedDate
{
  return self->_activatedDate;
}

- (void)setActivatedDate:(id)a3
{
}

- (TPSCollectionStatus)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSCollectionStatus;
  v6 = [(TPSCollectionStatus *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_canNotify = 1;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredDate, 0);
  objc_storeStrong((id *)&self->_firstViewedDate, 0);
  objc_storeStrong((id *)&self->_activatedDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_activatedDate forKey:@"activatedDate"];
  [v5 encodeObject:self->_firstViewedDate forKey:@"firstViewedDate"];
  [v5 encodeObject:self->_featuredDate forKey:@"featuredDate"];
  [v5 encodeBool:self->_canNotify forKey:@"canNotify"];
}

- (void)setFeaturedDate:(id)a3
{
}

- (TPSCollectionStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSCollectionStatus;
  id v5 = [(TPSCollectionStatus *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activatedDate"];
    activatedDate = v5->_activatedDate;
    v5->_activatedDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstViewedDate"];
    firstViewedDate = v5->_firstViewedDate;
    v5->_firstViewedDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featuredDate"];
    featuredDate = v5->_featuredDate;
    v5->_featuredDate = (NSDate *)v12;

    v5->_canNotify = [v4 decodeBoolForKey:@"canNotify"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TPSCollectionStatus allocWithZone:a3];
  [(TPSCollectionStatus *)v4 setIdentifier:self->_identifier];
  [(TPSCollectionStatus *)v4 setActivatedDate:self->_activatedDate];
  [(TPSCollectionStatus *)v4 setFirstViewedDate:self->_firstViewedDate];
  [(TPSCollectionStatus *)v4 setFeaturedDate:self->_featuredDate];
  [(TPSCollectionStatus *)v4 setCanNotify:self->_canNotify];
  id v5 = self;

  return v5;
}

- (id)debugDescription
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@", self];
  [v3 appendFormat:@"\n %@ = %@\n", @"identifier", self->_identifier];
  activatedDate = self->_activatedDate;
  if (activatedDate) {
    [v3 appendFormat:@" %@ = %@\n", @"activatedDate", activatedDate];
  }
  firstViewedDate = self->_firstViewedDate;
  if (firstViewedDate) {
    [v3 appendFormat:@" %@ = %@\n", @"firstViewedDate", firstViewedDate];
  }
  featuredDate = self->_featuredDate;
  if (featuredDate) {
    [v3 appendFormat:@" %@ = %@\n", @"featuredDate", featuredDate];
  }
  [v3 appendFormat:@" %@ = %d\n", @"canNotify", self->_canNotify];
  return v3;
}

- (BOOL)canNotify
{
  return self->_canNotify;
}

- (void)setCanNotify:(BOOL)a3
{
  self->_canNotify = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)firstViewedDate
{
  return self->_firstViewedDate;
}

- (void)setFirstViewedDate:(id)a3
{
}

@end