@interface SFShareSheetRemoteActivity
+ (BOOL)supportsSecureCoding;
+ (id)activitySourceTypeToString:(int64_t)a3;
+ (id)builtinActivityWithUUID:(id)a3;
+ (id)sharingServiceWithIdentifier:(id)a3;
- (BOOL)isRTS;
- (NSString)identifier;
- (NSString)title;
- (NSUUID)uuid;
- (SFShareSheetRemoteActivity)initWithActivitySourceType:(int64_t)a3 identifier:(id)a4 uuid:(id)a5;
- (SFShareSheetRemoteActivity)initWithCoder:(id)a3;
- (id)description;
- (int64_t)activitySourceType;
- (void)encodeWithCoder:(id)a3;
- (void)setIsRTS:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFShareSheetRemoteActivity

- (SFShareSheetRemoteActivity)initWithActivitySourceType:(int64_t)a3 identifier:(id)a4 uuid:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SFShareSheetRemoteActivity;
  v11 = [(SFShareSheetRemoteActivity *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_activitySourceType = a3;
    objc_storeStrong((id *)&v11->_identifier, a4);
    uint64_t v13 = [v10 copy];
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v13;
  }
  return v12;
}

+ (id)sharingServiceWithIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[SFShareSheetRemoteActivity alloc] initWithActivitySourceType:0 identifier:v3 uuid:0];

  return v4;
}

+ (id)builtinActivityWithUUID:(id)a3
{
  id v3 = a3;
  v4 = [[SFShareSheetRemoteActivity alloc] initWithActivitySourceType:1 identifier:0 uuid:v3];

  return v4;
}

+ (id)activitySourceTypeToString:(int64_t)a3
{
  if (a3) {
    return @"SFShareSheetActivitySourceTypeBuiltin";
  }
  else {
    return @"SFShareSheetActivitySourceTypeSharingService";
  }
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)SFShareSheetRemoteActivity;
  v4 = [(SFShareSheetRemoteActivity *)&v13 description];
  v5 = +[SFShareSheetRemoteActivity activitySourceTypeToString:[(SFShareSheetRemoteActivity *)self activitySourceType]];
  v6 = [(SFShareSheetRemoteActivity *)self identifier];
  v7 = [(SFShareSheetRemoteActivity *)self uuid];
  v8 = [(SFShareSheetRemoteActivity *)self title];
  BOOL v9 = [(SFShareSheetRemoteActivity *)self isRTS];
  id v10 = @"NO";
  if (v9) {
    id v10 = @"YES";
  }
  v11 = [v3 stringWithFormat:@"< %@ activitySourceType:%@, identifier:%@, uuid:%@, title:%@, isRTS:%@>", v4, v5, v6, v7, v8, v10];

  return v11;
}

- (SFShareSheetRemoteActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SFShareSheetRemoteActivity *)self init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_activitySourceType);
    v5->_activitySourceType = [v4 decodeIntegerForKey:v6];

    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromSelector(sel_identifier);
    uint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    v12 = NSStringFromSelector(sel_uuid);
    objc_super v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    uint64_t v14 = [v13 copy];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v14;

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_title);
    uint64_t v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    title = v5->_title;
    v5->_title = (NSString *)v18;

    v20 = NSStringFromSelector(sel_isRTS);
    v5->_isRTS = [v4 decodeBoolForKey:v20];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t activitySourceType = self->_activitySourceType;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_activitySourceType);
  [v5 encodeInteger:activitySourceType forKey:v6];

  identifier = self->_identifier;
  v8 = NSStringFromSelector(sel_identifier);
  [v5 encodeObject:identifier forKey:v8];

  uuid = self->_uuid;
  id v10 = NSStringFromSelector(sel_uuid);
  [v5 encodeObject:uuid forKey:v10];

  title = self->_title;
  v12 = NSStringFromSelector(sel_title);
  [v5 encodeObject:title forKey:v12];

  BOOL isRTS = self->_isRTS;
  NSStringFromSelector(sel_isRTS);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeBool:isRTS forKey:v14];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)activitySourceType
{
  return self->_activitySourceType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isRTS
{
  return self->_isRTS;
}

- (void)setIsRTS:(BOOL)a3
{
  self->_BOOL isRTS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end