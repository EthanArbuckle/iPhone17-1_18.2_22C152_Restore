@interface PXFeedTestSectionInfo
- (BOOL)isLoaded;
- (PXFeedTestSectionInfo)initWithPhotoLibrary:(id)a3;
- (id)albumTitle;
- (id)captionForItemAtIndex:(int64_t)a3;
- (id)date;
- (id)photoLibrary;
- (int64_t)countOfItems;
- (int64_t)sectionType;
@end

@implementation PXFeedTestSectionInfo

- (void).cxx_destruct
{
}

- (int64_t)countOfItems
{
  return self->_countOfItems;
}

- (id)photoLibrary
{
  return self->_photoLibrary;
}

- (id)captionForItemAtIndex:(int64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Mock Caption %ld", a3);
}

- (id)albumTitle
{
  return @"Mock Album";
}

- (id)date
{
  return (id)[MEMORY[0x1E4F1C9C8] date];
}

- (BOOL)isLoaded
{
  return 1;
}

- (int64_t)sectionType
{
  return 0;
}

- (PXFeedTestSectionInfo)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXFeedTestSectionInfo;
  v6 = [(PXFeedTestSectionInfo *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    uint32_t v8 = arc4random_uniform(5u);
    if (v8 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    v7->_countOfItems = v9;
  }

  return v7;
}

@end