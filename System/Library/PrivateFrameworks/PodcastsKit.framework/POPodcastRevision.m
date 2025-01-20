@interface POPodcastRevision
- (BOOL)isPodcastCollection;
- (NSString)objectID;
- (id)deletedModelObject;
- (id)description;
- (int64_t)revisionType;
- (unint64_t)revisionID;
- (void)setIsPodcastCollection:(BOOL)a3;
- (void)setObjectID:(id)a3;
- (void)setRevisionID:(unint64_t)a3;
- (void)setRevisionType:(int64_t)a3;
@end

@implementation POPodcastRevision

- (id)deletedModelObject
{
  if ([(POPodcastRevision *)self isPodcastCollection]) {
    v3 = @"POPodcastCollection";
  }
  else {
    v3 = @"POPodcastStation";
  }
  id v4 = objc_alloc_init(NSClassFromString(&v3->isa));
  v5 = [(POPodcastRevision *)self objectID];
  [v4 setUuid:v5];

  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(POPodcastRevision *)self revisionID];
  unint64_t v7 = [(POPodcastRevision *)self revisionType];
  if (v7 > 2) {
    v8 = @"unknown";
  }
  else {
    v8 = off_265055768[v7];
  }
  v9 = [(POPodcastRevision *)self objectID];
  v10 = [v3 stringWithFormat:@"%@ (%p) revisionID: %lu, type: %@, uuid, %@", v5, self, v6, v8, v9];

  return v10;
}

- (unint64_t)revisionID
{
  return self->_revisionID;
}

- (void)setRevisionID:(unint64_t)a3
{
  self->_revisionID = a3;
}

- (int64_t)revisionType
{
  return self->_revisionType;
}

- (void)setRevisionType:(int64_t)a3
{
  self->_revisionType = a3;
}

- (NSString)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (BOOL)isPodcastCollection
{
  return self->_isPodcastCollection;
}

- (void)setIsPodcastCollection:(BOOL)a3
{
  self->_isPodcastCollection = a3;
}

- (void).cxx_destruct
{
}

@end