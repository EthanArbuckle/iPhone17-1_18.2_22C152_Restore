@interface MRDCommandClientRestriction
+ (id)restrictedTo:(id)a3 by:(id)a4;
- (MRDMediaRemoteClient)requester;
- (NSDate)date;
- (NSSet)allowedAuditTokens;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAllowedAuditTokens:(id)a3;
- (void)setDate:(id)a3;
- (void)setRequester:(id)a3;
@end

@implementation MRDCommandClientRestriction

+ (id)restrictedTo:(id)a3 by:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(MRDCommandClientRestriction);
  v8 = +[NSDate date];
  [(MRDCommandClientRestriction *)v7 setDate:v8];

  [(MRDCommandClientRestriction *)v7 setAllowedAuditTokens:v6];
  [(MRDCommandClientRestriction *)v7 setRequester:v5];

  return v7;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@ (%p): ", v5, self];

  v7 = [(MRDCommandClientRestriction *)self allowedAuditTokens];
  v8 = [v7 allObjects];
  v9 = objc_msgSend(v8, "msv_map:", &stru_10041D190);
  [v6 appendFormat:@"allowedAuditTokens: %@", v9];

  v10 = [(MRDCommandClientRestriction *)self requester];
  [v6 appendFormat:@", requester: %@", v10];

  v11 = [(MRDCommandClientRestriction *)self date];
  [v6 appendFormat:@", date: %@", v11];

  [v6 appendString:@">"];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  id v6 = [(MRDCommandClientRestriction *)self date];
  id v7 = [v6 copyWithZone:a3];
  [v5 setDate:v7];

  v8 = [(MRDCommandClientRestriction *)self allowedAuditTokens];
  id v9 = [v8 copyWithZone:a3];
  [v5 setAllowedAuditTokens:v9];

  v10 = [(MRDCommandClientRestriction *)self requester];
  [v5 setRequester:v10];

  return v5;
}

- (MRDMediaRemoteClient)requester
{
  return self->_requester;
}

- (void)setRequester:(id)a3
{
}

- (NSSet)allowedAuditTokens
{
  return self->_allowedAuditTokens;
}

- (void)setAllowedAuditTokens:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_allowedAuditTokens, 0);

  objc_storeStrong((id *)&self->_requester, 0);
}

@end