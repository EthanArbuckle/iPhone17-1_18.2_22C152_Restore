@interface PLDuplicateDetectorLivePhotoContextData
+ (id)dataWithSubtype:(signed __int16)a3 isSharedLibrary:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSharedLibrary;
- (id)description;
- (signed)subtype;
- (unint64_t)hash;
- (void)setIsSharedLibrary:(BOOL)a3;
- (void)setSubtype:(signed __int16)a3;
@end

@implementation PLDuplicateDetectorLivePhotoContextData

- (void)setIsSharedLibrary:(BOOL)a3
{
  self->_isSharedLibrary = a3;
}

- (BOOL)isSharedLibrary
{
  return self->_isSharedLibrary;
}

- (void)setSubtype:(signed __int16)a3
{
  self->_subtype = a3;
}

- (signed)subtype
{
  return self->_subtype;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)PLDuplicateDetectorLivePhotoContextData;
  v3 = [(PLDuplicateDetectorLivePhotoContextData *)&v9 description];
  int v4 = [(PLDuplicateDetectorLivePhotoContextData *)self subtype];
  BOOL v5 = [(PLDuplicateDetectorLivePhotoContextData *)self isSharedLibrary];
  v6 = @"NO";
  if (v5) {
    v6 = @"YES";
  }
  v7 = [v3 stringByAppendingFormat:@" subType: %d, isSharedLibrary: %@", v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [(PLDuplicateDetectorLivePhotoContextData *)self subtype];
  if (v5 == [v4 subtype])
  {
    BOOL v6 = [(PLDuplicateDetectorLivePhotoContextData *)self isSharedLibrary];
    int v7 = v6 ^ [v4 isSharedLibrary] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[PLDuplicateDetectorLivePhotoContextData subtype](self, "subtype") + 1);
  uint64_t v4 = [v3 hash];
  int v5 = NSNumber;
  if ([(PLDuplicateDetectorLivePhotoContextData *)self isSharedLibrary]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  int v7 = [v5 numberWithInt:v6];
  unint64_t v8 = [v7 hash] + v4;

  return v8;
}

+ (id)dataWithSubtype:(signed __int16)a3 isSharedLibrary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  uint64_t v6 = objc_alloc_init(PLDuplicateDetectorLivePhotoContextData);
  [(PLDuplicateDetectorLivePhotoContextData *)v6 setSubtype:v5];
  [(PLDuplicateDetectorLivePhotoContextData *)v6 setIsSharedLibrary:v4];
  return v6;
}

@end