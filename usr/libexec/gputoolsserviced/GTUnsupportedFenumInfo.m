@interface GTUnsupportedFenumInfo
+ (BOOL)supportsSecureCoding;
- (GTUnsupportedFenumInfo)initWithCoder:(id)a3;
- (GTUnsupportedFenumInfo)initWithFenum:(id)a3 category:(id)a4 customMessage:(id)a5 customRecoverySuggestion:(id)a6;
- (NSString)category;
- (NSString)customMessage;
- (NSString)customRecoverySuggestion;
- (NSString)fenum;
- (id)asError;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GTUnsupportedFenumInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTUnsupportedFenumInfo)initWithFenum:(id)a3 category:(id)a4 customMessage:(id)a5 customRecoverySuggestion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GTUnsupportedFenumInfo;
  v15 = [(GTUnsupportedFenumInfo *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fenum, a3);
    objc_storeStrong((id *)&v16->_category, a4);
    objc_storeStrong((id *)&v16->_customMessage, a5);
    objc_storeStrong((id *)&v16->_customRecoverySuggestion, a6);
  }

  return v16;
}

- (GTUnsupportedFenumInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GTUnsupportedFenumInfo;
  v5 = [(GTUnsupportedFenumInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fenum"];
    fenum = v5->_fenum;
    v5->_fenum = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    category = v5->_category;
    v5->_category = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customMessage"];
    customMessage = v5->_customMessage;
    v5->_customMessage = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customRecoverySuggestion"];
    customRecoverySuggestion = v5->_customRecoverySuggestion;
    v5->_customRecoverySuggestion = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  fenum = self->_fenum;
  id v5 = a3;
  [v5 encodeObject:fenum forKey:@"fenum"];
  [v5 encodeObject:self->_category forKey:@"category"];
  [v5 encodeObject:self->_customMessage forKey:@"customMessage"];
  [v5 encodeObject:self->_customRecoverySuggestion forKey:@"customRecoverySuggestion"];
}

- (id)asError
{
  if ([(NSString *)self->_fenum isEqualToString:&stru_100035040]) {
    fenum = 0;
  }
  else {
    fenum = self->_fenum;
  }
  id v4 = PrettifyFenumString(fenum, 0, 1);
  if ([(NSString *)self->_category isEqualToString:&stru_100035040]) {
    category = 0;
  }
  else {
    category = self->_category;
  }
  uint64_t v6 = category;
  if ([(NSString *)self->_customMessage isEqualToString:&stru_100035040]) {
    customMessage = 0;
  }
  else {
    customMessage = self->_customMessage;
  }
  uint64_t v8 = customMessage;
  if ([(NSString *)self->_customRecoverySuggestion isEqualToString:&stru_100035040]) {
    customRecoverySuggestion = 0;
  }
  else {
    customRecoverySuggestion = self->_customRecoverySuggestion;
  }
  uint64_t v10 = customRecoverySuggestion;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v12 = v11;
  if (v6)
  {
    id v13 = +[NSString stringWithFormat:@"Capturing %@ is not supported.", v6];
    [v12 setObject:v13 forKey:NSLocalizedDescriptionKey];

    if (!v4) {
      goto LABEL_19;
    }
    id v14 = +[NSString stringWithFormat:@"Unsupported method: %@", v4];
    NSErrorUserInfoKey v15 = NSLocalizedFailureReasonErrorKey;
  }
  else
  {
    if (!v4)
    {
      [v11 setObject:@"Capturing disabled. Unsupported API usage." forKey:NSLocalizedDescriptionKey];
      if (!v8) {
        goto LABEL_24;
      }
      goto LABEL_20;
    }
    id v14 = +[NSString stringWithFormat:@"Capturing %@ is not supported.", v4];
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
  }
  [v12 setObject:v14 forKey:v15];

LABEL_19:
  if (!v8) {
    goto LABEL_24;
  }
LABEL_20:
  v16 = [v12 objectForKey:NSLocalizedFailureReasonErrorKey];
  v17 = v16;
  if (v16)
  {
    objc_super v18 = [v16 stringByAppendingFormat:@"\n\n%@", v8];
  }
  else
  {
    objc_super v18 = v8;
  }
  v19 = v18;
  [v12 setObject:v18 forKey:NSLocalizedFailureReasonErrorKey];

LABEL_24:
  if (!v10) {
    uint64_t v10 = @"To enable capturing, disable calls to unsupported APIs and relaunch your application.";
  }
  [v12 setObject:v10 forKey:NSLocalizedRecoverySuggestionErrorKey];
  v20 = +[NSError errorWithDomain:@"com.apple.gputools.capture" code:1000 userInfo:v12];

  return v20;
}

- (NSString)fenum
{
  return self->_fenum;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)customMessage
{
  return self->_customMessage;
}

- (NSString)customRecoverySuggestion
{
  return self->_customRecoverySuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customRecoverySuggestion, 0);
  objc_storeStrong((id *)&self->_customMessage, 0);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_fenum, 0);
}

@end