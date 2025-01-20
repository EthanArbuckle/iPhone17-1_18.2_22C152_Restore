@interface REMSmartListCustomContext
- (NSString)name;
- (REMAccount)account;
- (REMColor)color;
- (REMList)parentList;
- (REMListBadge)badge;
- (REMSmartList)smartlist;
- (REMSmartListCustomContext)initWithSmartList:(id)a3 account:(id)a4 parentList:(id)a5;
- (void)setSmartlist:(id)a3;
@end

@implementation REMSmartListCustomContext

- (REMSmartListCustomContext)initWithSmartList:(id)a3 account:(id)a4 parentList:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMSmartListCustomContext;
  v12 = [(REMSmartListCustomContext *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_smartlist, a3);
    objc_storeStrong((id *)&v13->_account, a4);
    objc_storeStrong((id *)&v13->_parentList, a5);
  }

  return v13;
}

- (NSString)name
{
  v2 = [(REMSmartListCustomContext *)self smartlist];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (REMColor)color
{
  v2 = [(REMSmartListCustomContext *)self smartlist];
  v3 = [v2 color];

  return (REMColor *)v3;
}

- (REMListBadge)badge
{
  v2 = [(REMSmartListCustomContext *)self smartlist];
  v3 = [v2 badgeEmblem];

  if (v3) {
    v4 = [[REMListBadge alloc] initWithRawValue:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (REMAccount)account
{
  return self->_account;
}

- (REMList)parentList
{
  return self->_parentList;
}

- (REMSmartList)smartlist
{
  return self->_smartlist;
}

- (void)setSmartlist:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartlist, 0);
  objc_storeStrong((id *)&self->_parentList, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end