@interface RERelevanceProviderManagerScheduledUpdate
- (BOOL)isEqual:(id)a3;
- (NSDate)updateDate;
- (RERelevanceProviderManagerScheduledUpdate)initWithProvider:(id)a3 updateDate:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation RERelevanceProviderManagerScheduledUpdate

- (RERelevanceProviderManagerScheduledUpdate)initWithProvider:(id)a3 updateDate:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)RERelevanceProviderManagerScheduledUpdate;
    v7 = [(RERelevanceProviderManagerUpdate *)&v12 initWithProvider:a3];
    if (v7)
    {
      uint64_t v8 = REDateByRemovingSubseconds(v6);
      updateDate = v7->_updateDate;
      v7->_updateDate = (NSDate *)v8;
    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)RERelevanceProviderManagerScheduledUpdate;
  v4 = [(RERelevanceProviderManagerScheduledUpdate *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ - %@", v4, self->_updateDate];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RERelevanceProviderManagerScheduledUpdate;
  v4 = [(RERelevanceProviderManagerUpdate *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 3, self->_updateDate);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RERelevanceProviderManagerScheduledUpdate *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v11.receiver = self,
          v11.super_class = (Class)RERelevanceProviderManagerScheduledUpdate,
          [(RERelevanceProviderManagerUpdate *)&v11 isEqual:self]))
    {
      updateDate = self->_updateDate;
      objc_super v6 = v4->_updateDate;
      objc_super v7 = updateDate;
      uint64_t v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(NSDate *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)RERelevanceProviderManagerScheduledUpdate;
  unint64_t v3 = [(RERelevanceProviderManagerUpdate *)&v5 hash];
  return [(NSDate *)self->_updateDate hash] ^ v3;
}

- (NSDate)updateDate
{
  return self->_updateDate;
}

- (void).cxx_destruct
{
}

@end