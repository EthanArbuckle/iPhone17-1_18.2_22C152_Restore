@interface WFWorkflowUser
+ (id)JSONKeyPathsByPropertyKey;
+ (id)mainIdentityJSONTransformer;
- (NSDate)dateJoined;
- (NSNumber)isAdmin;
- (NSString)displayName;
- (NSString)email;
- (NSString)fullName;
- (NSString)twitter;
- (NSString)twitterDisplayName;
- (NSString)websiteDisplayName;
- (NSURL)profileImageURL;
- (NSURL)websiteURL;
- (NSUUID)identifier;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)mainIdentity;
@end

@implementation WFWorkflowUser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isAdmin, 0);
  objc_storeStrong((id *)&self->_dateJoined, 0);
  objc_storeStrong((id *)&self->_profileImageURL, 0);
  objc_storeStrong((id *)&self->_websiteURL, 0);
  objc_storeStrong((id *)&self->_twitter, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (int64_t)mainIdentity
{
  return self->_mainIdentity;
}

- (NSNumber)isAdmin
{
  return self->_isAdmin;
}

- (NSDate)dateJoined
{
  return self->_dateJoined;
}

- (NSURL)profileImageURL
{
  return self->_profileImageURL;
}

- (NSURL)websiteURL
{
  return self->_websiteURL;
}

- (NSString)twitter
{
  return self->_twitter;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)email
{
  return self->_email;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(MTLModel *)+[WFMutableWorkflowUser allocWithZone:a3] init];
  v5 = [(MTLModel *)self dictionaryValue];
  [(WFMutableWorkflowUser *)v4 setValuesForKeysWithDictionary:v5];

  return v4;
}

- (NSString)displayName
{
  v3 = [(WFWorkflowUser *)self websiteDisplayName];
  v4 = [(WFWorkflowUser *)self fullName];
  v5 = [(WFWorkflowUser *)self twitterDisplayName];
  int64_t v6 = [(WFWorkflowUser *)self mainIdentity];
  v7 = v5;
  if (!v6) {
    goto LABEL_6;
  }
  if (v6 == 2)
  {
    v7 = v4;
    goto LABEL_6;
  }
  v7 = v3;
  if (v6 == 1)
  {
LABEL_6:
    id v8 = v7;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  if (![v8 length] && objc_msgSend(v4, "length"))
  {
    id v9 = v4;

    id v8 = v9;
  }
  if (![v8 length] && objc_msgSend(v5, "length"))
  {
    id v10 = v5;

    id v8 = v10;
  }
  if (![v8 length] && objc_msgSend(v3, "length"))
  {
    id v11 = v3;

    id v8 = v11;
  }
  if ([v8 length]) {
    v12 = v8;
  }
  else {
    v12 = 0;
  }
  v13 = v12;

  return v13;
}

- (NSString)twitterDisplayName
{
  v2 = [(WFWorkflowUser *)self twitter];
  if ([v2 length])
  {
    v3 = [@"@" stringByAppendingString:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)websiteDisplayName
{
  v2 = [(WFWorkflowUser *)self websiteURL];
  v3 = objc_msgSend(v2, "wf_displayStringWithCharacterLimit:", 0x7FFFFFFFFFFFFFFFLL);

  return (NSString *)v3;
}

+ (id)mainIdentityJSONTransformer
{
  return +[NSValueTransformer mtl_valueMappingTransformerWithDictionary:&unk_1F2318048 defaultValue:&unk_1F2317298 reverseDefaultValue:0];
}

+ (id)JSONKeyPathsByPropertyKey
{
  v5[9] = *MEMORY[0x1E4F143B8];
  v4[0] = @"identifier";
  v4[1] = @"email";
  v5[0] = @"uuid";
  v5[1] = @"email";
  v4[2] = @"fullName";
  v4[3] = @"twitter";
  v5[2] = @"fullName";
  v5[3] = @"twitter";
  v4[4] = @"websiteURL";
  v4[5] = @"mainIdentity";
  v5[4] = @"website";
  v5[5] = @"mainIdentity";
  v4[6] = @"profileImageURL";
  v4[7] = @"isAdmin";
  v5[6] = @"profileImage";
  v5[7] = @"isAdmin";
  v4[8] = @"dateJoined";
  v5[8] = @"dateJoined";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:9];
  return v2;
}

@end