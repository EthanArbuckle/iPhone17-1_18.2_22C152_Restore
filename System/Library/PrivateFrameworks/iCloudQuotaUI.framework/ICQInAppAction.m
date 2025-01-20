@interface ICQInAppAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICQInAppAction)initWithCoder:(id)a3;
- (ICQInAppAction)initWithTitle:(id)a3 type:(id)a4 icqActionType:(int64_t)a5;
- (NSString)title;
- (NSString)type;
- (id)description;
- (int64_t)icqActionType;
- (void)encodeWithCoder:(id)a3;
- (void)performAction;
@end

@implementation ICQInAppAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)performAction
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ICQInAppAction *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(ICQInAppAction *)self type];
  [v4 encodeObject:v6 forKey:@"type"];

  objc_msgSend(NSNumber, "numberWithInteger:", -[ICQInAppAction icqActionType](self, "icqActionType"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"icqActionType"];
}

- (ICQInAppAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICQInAppAction;
  v5 = [(ICQInAppAction *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icqActionType"];
    v5->_icqActionType = (int)[v10 intValue];
  }
  return v5;
}

- (ICQInAppAction)initWithTitle:(id)a3 type:(id)a4 icqActionType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICQInAppAction;
  v11 = [(ICQInAppAction *)&v14 init];
  objc_super v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_type, a4);
    objc_storeStrong((id *)&v12->_title, a3);
    v12->_icqActionType = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    title = self->_title;
    id v7 = [v5 title];
    if ([(NSString *)title isEqualToString:v7])
    {
      type = self->_type;
      id v9 = [v5 type];
      if ([(NSString *)type isEqualToString:v9])
      {
        int64_t icqActionType = self->_icqActionType;
        BOOL v11 = icqActionType == [v5 icqActionType];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(ICQInAppAction *)self title];
  id v5 = [(ICQInAppAction *)self type];
  uint64_t v6 = [v3 stringWithFormat:@"actionTitle: %@, actionType: %@", v4, v5];

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)type
{
  return self->_type;
}

- (int64_t)icqActionType
{
  return self->_icqActionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end