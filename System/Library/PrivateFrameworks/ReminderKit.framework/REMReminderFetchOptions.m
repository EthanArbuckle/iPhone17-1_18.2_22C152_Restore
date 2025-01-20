@interface REMReminderFetchOptions
+ (BOOL)supportsSecureCoding;
+ (REMReminderFetchOptions)defaultFetchOptions;
+ (id)fetchOptionsIncludingConcealed;
+ (id)fetchOptionsIncludingDueDateDeltaAlerts;
- (BOOL)includeConcealed;
- (BOOL)includeDueDateDeltaAlerts;
- (BOOL)isEqual:(id)a3;
- (REMReminderFetchOptions)initWithCoder:(id)a3;
- (REMReminderFetchOptions)initWithIncludeConcealed:(BOOL)a3 includeDueDateDeltaAlerts:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fetchOptionsIncludingConcealed;
- (id)fetchOptionsIncludingDueDateDeltaAlerts;
- (unint64_t)hash;
- (void)copyFromFetchOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIncludeConcealed:(BOOL)a3;
- (void)setIncludeDueDateDeltaAlerts:(BOOL)a3;
@end

@implementation REMReminderFetchOptions

+ (REMReminderFetchOptions)defaultFetchOptions
{
  v2 = objc_opt_new();

  return (REMReminderFetchOptions *)v2;
}

+ (id)fetchOptionsIncludingConcealed
{
  v2 = objc_opt_new();
  [v2 setIncludeConcealed:1];

  return v2;
}

+ (id)fetchOptionsIncludingDueDateDeltaAlerts
{
  v2 = objc_opt_new();
  [v2 setIncludeDueDateDeltaAlerts:1];

  return v2;
}

- (id)fetchOptionsIncludingConcealed
{
  v2 = (void *)[(REMReminderFetchOptions *)self copy];
  [v2 setIncludeConcealed:1];

  return v2;
}

- (id)fetchOptionsIncludingDueDateDeltaAlerts
{
  v2 = (void *)[(REMReminderFetchOptions *)self copy];
  [v2 setIncludeDueDateDeltaAlerts:1];

  return v2;
}

- (REMReminderFetchOptions)initWithIncludeConcealed:(BOOL)a3 includeDueDateDeltaAlerts:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)REMReminderFetchOptions;
  result = [(REMReminderFetchOptions *)&v7 init];
  if (result)
  {
    result->_includeConcealed = a3;
    result->_includeDueDateDeltaAlerts = a4;
  }
  return result;
}

- (void)copyFromFetchOptions:(id)a3
{
  id v4 = a3;
  -[REMReminderFetchOptions setIncludeConcealed:](self, "setIncludeConcealed:", [v4 includeConcealed]);
  uint64_t v5 = [v4 includeDueDateDeltaAlerts];

  [(REMReminderFetchOptions *)self setIncludeDueDateDeltaAlerts:v5];
}

- (unint64_t)hash
{
  BOOL v3 = [(REMReminderFetchOptions *)self includeConcealed];
  return v3 ^ [(REMReminderFetchOptions *)self includeDueDateDeltaAlerts];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderFetchOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)REMReminderFetchOptions;
  uint64_t v5 = [(REMReminderFetchOptions *)&v7 init];
  if (v5)
  {
    v5->_includeConcealed = [v4 decodeBoolForKey:@"includeConcealed"];
    v5->_includeDueDateDeltaAlerts = [v4 decodeBoolForKey:@"includeDueDateDeltaAlerts"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[REMReminderFetchOptions includeConcealed](self, "includeConcealed"), @"includeConcealed");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMReminderFetchOptions includeDueDateDeltaAlerts](self, "includeDueDateDeltaAlerts"), @"includeDueDateDeltaAlerts");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setIncludeConcealed:", -[REMReminderFetchOptions includeConcealed](self, "includeConcealed"));
  objc_msgSend(v4, "setIncludeDueDateDeltaAlerts:", -[REMReminderFetchOptions includeDueDateDeltaAlerts](self, "includeDueDateDeltaAlerts"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMReminderFetchOptions *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (BOOL v7 = [(REMReminderFetchOptions *)self includeConcealed],
          v7 == [(REMReminderFetchOptions *)v6 includeConcealed]))
    {
      BOOL v9 = [(REMReminderFetchOptions *)self includeDueDateDeltaAlerts];
      BOOL v8 = v9 ^ [(REMReminderFetchOptions *)v6 includeDueDateDeltaAlerts] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (BOOL)includeConcealed
{
  return self->_includeConcealed;
}

- (void)setIncludeConcealed:(BOOL)a3
{
  self->_includeConcealed = a3;
}

- (BOOL)includeDueDateDeltaAlerts
{
  return self->_includeDueDateDeltaAlerts;
}

- (void)setIncludeDueDateDeltaAlerts:(BOOL)a3
{
  self->_includeDueDateDeltaAlerts = a3;
}

@end