@interface MTImageDownloadClientRequest
+ (id)requestForUrl:(id)a3 key:(id)a4 podcastUuid:(id)a5 completion:(id)a6;
- (MTImageDownloadClientRequest)initWithUrl:(id)a3 key:(id)a4 podcastUuid:(id)a5 completion:(id)a6;
- (NSString)key;
- (NSString)uniqueId;
- (NSString)url;
- (NSString)uuid;
- (id)completion;
- (id)description;
@end

@implementation MTImageDownloadClientRequest

+ (id)requestForUrl:(id)a3 key:(id)a4 podcastUuid:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithUrl:v13 key:v12 podcastUuid:v11 completion:v10];

  return v14;
}

- (MTImageDownloadClientRequest)initWithUrl:(id)a3 key:(id)a4 podcastUuid:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MTImageDownloadClientRequest;
  v15 = [(MTImageDownloadClientRequest *)&v23 init];
  if (v15)
  {
    v16 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v17 = [v16 UUIDString];
    uniqueId = v15->_uniqueId;
    v15->_uniqueId = (NSString *)v17;

    objc_storeStrong((id *)&v15->_url, a3);
    objc_storeStrong((id *)&v15->_key, a4);
    if (v13)
    {
      if ([v13 length]) {
        v19 = v13;
      }
      else {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
    objc_storeStrong((id *)&v15->_uuid, v19);
    v20 = _Block_copy(v14);
    id completion = v15->_completion;
    v15->_id completion = v20;
  }
  return v15;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [NSString stringWithFormat:@"url=%@, key=%@", self->_url, self->_key];
  [v3 addObject:v4];

  if ([(NSString *)self->_uuid length])
  {
    v5 = [NSString stringWithFormat:@"uuid=%@", self->_uuid];
    [v3 addObject:v5];
  }
  if (self->_completion) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [NSString stringWithFormat:@"completion=%@", v6];
  [v3 addObject:v7];

  v8 = [v3 componentsJoinedByString:@", "];

  return v8;
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)key
{
  return self->_key;
}

- (id)completion
{
  return self->_completion;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_uniqueId, 0);
}

@end