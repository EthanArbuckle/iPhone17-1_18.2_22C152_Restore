@interface WBSCloudTabCloseRequest
+ (BOOL)isCloudTabCloseRequestDictionary:(id)a3;
+ (id)_dictionaryWithURL:(id)a3 tabUUIDString:(id)a4 lastModified:(id)a5 sourceDeviceUUID:(id)a6 destinationDeviceUUID:(id)a7;
+ (id)destinationDeviceUUIDInDictionary:(id)a3;
- (BOOL)matchesCloudTab:(id)a3;
- (NSDate)lastModified;
- (NSDictionary)dictionaryRepresentation;
- (NSURL)url;
- (NSUUID)destinationDeviceUUID;
- (NSUUID)requestUUID;
- (NSUUID)tabUUID;
- (WBSCloudTabCloseRequest)initWithDictionary:(id)a3 requestUUID:(id)a4;
- (WBSCloudTabCloseRequest)initWithURL:(id)a3 tabUUIDString:(id)a4 lastModified:(id)a5 sourceDeviceUUID:(id)a6 destinationDeviceUUID:(id)a7 requestUUID:(id)a8;
- (id)description;
@end

@implementation WBSCloudTabCloseRequest

- (WBSCloudTabCloseRequest)initWithDictionary:(id)a3 requestUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && (v26.receiver = self,
        v26.super_class = (Class)WBSCloudTabCloseRequest,
        (self = [(WBSCloudTabCloseRequest *)&v26 init]) != 0))
  {
    v8 = objc_msgSend(v6, "safari_stringForKey:", @"TabURL");
    v9 = objc_msgSend(v8, "safari_bestURLStringForUserTypedString");

    if (![v9 length]) {
      goto LABEL_10;
    }
    v10 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v9];
    url = self->_url;
    self->_url = v10;

    objc_storeStrong((id *)&self->_requestUUID, a4);
    objc_msgSend(v6, "safari_dateForKey:", @"LastModified");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastModified = self->_lastModified;
    self->_lastModified = v12;

    uint64_t v14 = objc_msgSend(v6, "safari_stringForKey:", @"TabUUID");
    if (!v14) {
      goto LABEL_10;
    }
    v15 = (void *)v14;
    v16 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v14];
    tabUUID = self->_tabUUID;
    self->_tabUUID = v16;

    v18 = objc_msgSend(v6, "safari_stringForKey:", @"SourceDeviceUUID");

    if ([v18 length])
    {
      v19 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v18];
      sourceDeviceUUID = self->_sourceDeviceUUID;
      self->_sourceDeviceUUID = v19;
    }
    v21 = objc_msgSend(v6, "safari_stringForKey:", @"DestinationDeviceUUID");

    if (v21)
    {
      v22 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v21];
      destinationDeviceUUID = self->_destinationDeviceUUID;
      self->_destinationDeviceUUID = v22;

      v24 = self;
    }
    else
    {
LABEL_10:
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (WBSCloudTabCloseRequest)initWithURL:(id)a3 tabUUIDString:(id)a4 lastModified:(id)a5 sourceDeviceUUID:(id)a6 destinationDeviceUUID:(id)a7 requestUUID:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [(id)objc_opt_class() _dictionaryWithURL:v19 tabUUIDString:v18 lastModified:v17 sourceDeviceUUID:v16 destinationDeviceUUID:v15];

  v21 = [(WBSCloudTabCloseRequest *)self initWithDictionary:v20 requestUUID:v14];
  return v21;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_opt_class();
  url = self->_url;
  v5 = [(NSUUID *)self->_tabUUID UUIDString];
  id v6 = [v3 _dictionaryWithURL:url tabUUIDString:v5 lastModified:self->_lastModified sourceDeviceUUID:self->_sourceDeviceUUID destinationDeviceUUID:self->_destinationDeviceUUID];

  return (NSDictionary *)v6;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  url = self->_url;
  id v7 = [(NSUUID *)self->_tabUUID UUIDString];
  v8 = [(NSUUID *)self->_sourceDeviceUUID UUIDString];
  v9 = [(NSUUID *)self->_destinationDeviceUUID UUIDString];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; url = \"%@\"; tab UUID = \"%@\"; source device UUID = \"%@\"; destination device UUID = \"%@\"; lastModified = %@>",
    v5,
    self,
    url,
    v7,
    v8,
    v9,
  v10 = self->_lastModified);

  return v10;
}

+ (id)_dictionaryWithURL:(id)a3 tabUUIDString:(id)a4 lastModified:(id)a5 sourceDeviceUUID:(id)a6 destinationDeviceUUID:(id)a7
{
  v24[5] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = v14;
  id v16 = 0;
  if (v11 && v14)
  {
    uint64_t v17 = objc_msgSend(a3, "safari_userVisibleString");
    id v18 = (void *)v17;
    if (v17)
    {
      v23[0] = @"DictionaryType";
      v23[1] = @"TabURL";
      v24[0] = @"CloseTabRequest";
      v24[1] = v17;
      v24[2] = v11;
      v23[2] = @"TabUUID";
      v23[3] = @"DestinationDeviceUUID";
      id v19 = [v15 UUIDString];
      v23[4] = @"LastModified";
      v24[3] = v19;
      v24[4] = v12;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
      id v16 = (void *)[v20 mutableCopy];

      v21 = [v13 UUIDString];
      [v16 setObject:v21 forKeyedSubscript:@"SourceDeviceUUID"];
    }
    else
    {
      id v16 = 0;
    }
  }
  return v16;
}

- (BOOL)matchesCloudTab:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  int v6 = [v5 isEqual:self->_tabUUID];

  if (v6)
  {
    id v7 = [v4 url];
    char v8 = [v7 isEqual:self->_url];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isCloudTabCloseRequestDictionary:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_msgSend(v3, "safari_stringForKey:", @"DictionaryType");
    char v5 = [v4 isEqualToString:@"CloseTabRequest"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)destinationDeviceUUIDInDictionary:(id)a3
{
  id v3 = objc_msgSend(a3, "safari_stringForKey:", @"DestinationDeviceUUID");
  if ([v3 length]) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (NSUUID)destinationDeviceUUID
{
  return self->_destinationDeviceUUID;
}

- (NSUUID)tabUUID
{
  return self->_tabUUID;
}

- (NSURL)url
{
  return self->_url;
}

- (NSDate)lastModified
{
  return self->_lastModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_tabUUID, 0);
  objc_storeStrong((id *)&self->_destinationDeviceUUID, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_sourceDeviceUUID, 0);
}

@end