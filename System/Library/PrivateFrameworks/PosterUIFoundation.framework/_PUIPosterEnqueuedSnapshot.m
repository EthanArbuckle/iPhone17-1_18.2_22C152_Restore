@interface _PUIPosterEnqueuedSnapshot
- (FBSSceneSettings)posterSettings;
- (NSDate)date;
- (NSNumber)priority;
- (NSString)logIdentifier;
- (PFPosterPath)path;
- (PUIPosterSnapshotRequest)request;
- (_PUIPosterEnqueuedSnapshot)initWithRequest:(id)a3 completion:(id)a4;
- (id)completion;
- (int)retryCount;
- (void)dealloc;
- (void)invalidate;
- (void)setRetryCount:(int)a3;
@end

@implementation _PUIPosterEnqueuedSnapshot

- (_PUIPosterEnqueuedSnapshot)initWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)_PUIPosterEnqueuedSnapshot;
  v9 = [(_PUIPosterEnqueuedSnapshot *)&v43 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "priority"));
    priority = v10->_priority;
    v10->_priority = (NSNumber *)v11;

    uint64_t v13 = [v7 date];
    date = v10->_date;
    v10->_date = (NSDate *)v13;

    uint64_t v15 = [v7 path];
    path = v10->_path;
    v10->_path = (PFPosterPath *)v15;

    v17 = [v7 path];
    uint64_t v18 = [v17 extendContentsReadAccessToAuditToken:0 error:0];
    extendedPath = v10->_extendedPath;
    v10->_extendedPath = (PFPosterPath *)v18;

    v20 = [v7 path];
    uint64_t v21 = [v20 extendValidityForReason:@"SNAPSHOTTIN!!!!"];
    pathValidityToken = v10->_pathValidityToken;
    v10->_pathValidityToken = (BSInvalidatable *)v21;

    v23 = [v7 settings];
    v24 = (void *)[v23 mutableCopy];

    v42 = v24;
    objc_msgSend(v24, "pui_setPosterContents:", v10->_extendedPath);
    uint64_t v25 = [v24 copy];
    posterSettings = v10->_posterSettings;
    v10->_posterSettings = (FBSSceneSettings *)v25;

    uint64_t v27 = [v8 copy];
    id completion = v10->_completion;
    v10->_id completion = (id)v27;

    v40 = NSString;
    v41 = [v7 uniqueIdentifier];
    v29 = [v41 UUIDString];
    v30 = [v29 substringToIndex:8];
    v31 = [(PFPosterPath *)v10->_path serverIdentity];
    v32 = [v31 posterUUID];
    [v32 UUIDString];
    v34 = id v33 = v8;
    v35 = [v34 substringToIndex:8];
    v36 = [(FBSSceneSettings *)v10->_posterSettings pui_provider];
    uint64_t v37 = [v40 stringWithFormat:@"%@:%@:%@", v30, v35, v36];
    logIdentifier = v10->_logIdentifier;
    v10->_logIdentifier = (NSString *)v37;

    id v8 = v33;
  }

  return v10;
}

- (void)dealloc
{
  [(_PUIPosterEnqueuedSnapshot *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_PUIPosterEnqueuedSnapshot;
  [(_PUIPosterEnqueuedSnapshot *)&v3 dealloc];
}

- (void)invalidate
{
  request = self->_request;
  self->_request = 0;

  id completion = self->_completion;
  self->_id completion = 0;

  path = self->_path;
  self->_path = 0;

  extendedPath = self->_extendedPath;
  self->_extendedPath = 0;

  [(BSInvalidatable *)self->_pathValidityToken invalidate];
  id v7 = self->_path;
  self->_path = 0;

  date = self->_date;
  self->_date = 0;
}

- (PUIPosterSnapshotRequest)request
{
  return self->_request;
}

- (id)completion
{
  return self->_completion;
}

- (FBSSceneSettings)posterSettings
{
  return self->_posterSettings;
}

- (PFPosterPath)path
{
  return self->_path;
}

- (NSNumber)priority
{
  return self->_priority;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (int)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_posterSettings, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_pathValidityToken, 0);
  objc_storeStrong((id *)&self->_extendedPath, 0);
}

@end