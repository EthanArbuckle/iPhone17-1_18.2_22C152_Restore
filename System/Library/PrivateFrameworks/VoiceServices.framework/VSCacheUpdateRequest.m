@interface VSCacheUpdateRequest
- (VSCacheUpdateRequest)initWithModelIdentifier:(id)a3 classIdentifier:(id)a4;
- (id)classIdentifier;
- (id)coalescedRequest:(id)a3;
- (id)description;
- (id)modelIdentifier;
- (void)dealloc;
@end

@implementation VSCacheUpdateRequest

- (id)description
{
  classID = @"all";
  modelID = (__CFString *)self->_modelID;
  if (!modelID) {
    modelID = @"all";
  }
  if (self->_classID) {
    classID = (__CFString *)self->_classID;
  }
  return (id)[NSString stringWithFormat:@"model <%@> class <%@>", modelID, classID];
}

- (id)coalescedRequest:(id)a3
{
  id v3 = a3;
  v5 = (void *)[a3 modelIdentifier];
  uint64_t v6 = [v3 classIdentifier];
  if (v5)
  {
    if (!self->_modelID) {
      return self;
    }
    v7 = (void *)v6;
    if (!objc_msgSend(v5, "isEqualToString:")) {
      return 0;
    }
    if (v7)
    {
      if (self->_classID)
      {
        if (objc_msgSend(v7, "isEqualToString:")) {
          return self;
        }
        else {
          return 0;
        }
      }
      return self;
    }
  }
  return v3;
}

- (id)classIdentifier
{
  return self->_classID;
}

- (id)modelIdentifier
{
  return self->_modelID;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VSCacheUpdateRequest;
  [(VSCacheUpdateRequest *)&v3 dealloc];
}

- (VSCacheUpdateRequest)initWithModelIdentifier:(id)a3 classIdentifier:(id)a4
{
  uint64_t v6 = [(VSCacheUpdateRequest *)self init];
  if (v6)
  {
    v6->_modelID = (NSString *)a3;
    v6->_classID = (NSString *)a4;
  }
  return v6;
}

@end