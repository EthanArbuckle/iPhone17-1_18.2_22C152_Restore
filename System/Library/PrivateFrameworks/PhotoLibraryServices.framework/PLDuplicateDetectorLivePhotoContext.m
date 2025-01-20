@interface PLDuplicateDetectorLivePhotoContext
- (BOOL)hasFingerprint:(id)a3 contextData:(id)a4;
- (PLDuplicateDetectorLivePhotoContext)init;
- (id)description;
- (void)addFingerprint:(id)a3 contextData:(id)a4;
@end

@implementation PLDuplicateDetectorLivePhotoContext

- (void).cxx_destruct
{
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PLDuplicateDetectorLivePhotoContext;
  v3 = [(PLDuplicateDetectorLivePhotoContext *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" %@", self->_container];

  return v4;
}

- (BOOL)hasFingerprint:(id)a3 contextData:(id)a4
{
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_container objectForKeyedSubscript:a3];
  v8 = v7;
  if (v7) {
    char v9 = [v7 containsObject:v6];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (void)addFingerprint:(id)a3 contextData:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_container, "objectForKeyedSubscript:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [(NSMutableDictionary *)self->_container setObject:v7 forKeyedSubscript:v8];
    }
    [v7 addObject:v6];
  }
}

- (PLDuplicateDetectorLivePhotoContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLDuplicateDetectorLivePhotoContext;
  v2 = [(PLDuplicateDetectorLivePhotoContext *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    container = v2->_container;
    v2->_container = v3;
  }
  return v2;
}

@end