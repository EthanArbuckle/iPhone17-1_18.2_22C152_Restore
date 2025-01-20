@interface PNPromoterFaceGroupFetchResult
- (NSArray)fetchedObjectIDs;
- (NSArray)fetchedObjects;
- (PHPhotoLibrary)photoLibrary;
- (PNPromoterFaceGroupFetchResult)initWithFaceGroups:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation PNPromoterFaceGroupFetchResult

- (void).cxx_destruct
{
}

- (PHPhotoLibrary)photoLibrary
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PNPromoterFaceGroup.m", 73, @"%s not implemented", "-[PNPromoterFaceGroupFetchResult photoLibrary]");

  abort();
}

- (NSArray)fetchedObjectIDs
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PNPromoterFaceGroup.m", 66, @"%s not implemented", "-[PNPromoterFaceGroupFetchResult fetchedObjectIDs]");

  abort();
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSArray *)self->_faceGroups countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (NSArray)fetchedObjects
{
  return self->_faceGroups;
}

- (unint64_t)count
{
  return [(NSArray *)self->_faceGroups count];
}

- (PNPromoterFaceGroupFetchResult)initWithFaceGroups:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PNPromoterFaceGroupFetchResult;
  v6 = [(PNPromoterFaceGroupFetchResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_faceGroups, a3);
  }

  return v7;
}

@end