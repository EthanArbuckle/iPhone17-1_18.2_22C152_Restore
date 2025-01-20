@interface PXFetchResultDataSection
- (PHFetchResult)fetchResult;
- (PXFetchResultDataSection)initWithFetchResult:(id)a3;
- (PXFetchResultDataSection)initWithOutlineObject:(id)a3;
- (id)objectAtIndex:(int64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (int64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation PXFetchResultDataSection

- (void).cxx_destruct
{
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = [(PXFetchResultDataSection *)self fetchResult];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (id)objectsAtIndexes:(id)a3
{
  id v4 = a3;
  v5 = [(PXFetchResultDataSection *)self fetchResult];
  v6 = [v5 objectsAtIndexes:v4];

  return v6;
}

- (id)objectAtIndex:(int64_t)a3
{
  id v4 = [(PXFetchResultDataSection *)self fetchResult];
  v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (int64_t)count
{
  v2 = [(PXFetchResultDataSection *)self fetchResult];
  int64_t v3 = [v2 count];

  return v3;
}

- (PXFetchResultDataSection)initWithOutlineObject:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFetchResultDataSection.m", 23, @"%s is not available as initializer", "-[PXFetchResultDataSection initWithOutlineObject:]");

  abort();
}

- (PXFetchResultDataSection)initWithFetchResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFetchResultDataSection;
  v6 = [(PXDataSection *)&v9 initWithOutlineObject:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fetchResult, a3);
  }

  return v7;
}

@end