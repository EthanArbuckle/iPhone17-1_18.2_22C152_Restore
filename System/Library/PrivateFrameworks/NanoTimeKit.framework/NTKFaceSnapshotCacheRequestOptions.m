@interface NTKFaceSnapshotCacheRequestOptions
- (NTKFaceSnapshotCacheRequestOptions)initWithPriority:(unint64_t)a3;
- (id)ntk_asDictionaryOptions;
- (unint64_t)priority;
@end

@implementation NTKFaceSnapshotCacheRequestOptions

- (id)ntk_asDictionaryOptions
{
  v3 = +[NTKFaceSnapshotter defaultModernSnapshotOptions];
  v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NTKFaceSnapshotCacheRequestOptions priority](self, "priority"));
  [v4 setObject:v5 forKey:@"NTKSnapshotPriorityKey"];

  v6 = (void *)[v4 copy];
  return v6;
}

- (NTKFaceSnapshotCacheRequestOptions)initWithPriority:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKFaceSnapshotCacheRequestOptions;
  result = [(NTKFaceSnapshotCacheRequestOptions *)&v5 init];
  if (result) {
    result->_priority = a3;
  }
  return result;
}

- (unint64_t)priority
{
  return self->_priority;
}

@end