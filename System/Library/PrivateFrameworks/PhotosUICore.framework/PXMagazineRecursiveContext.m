@interface PXMagazineRecursiveContext
- (NSMutableArray)generatedChunks;
- (PXNewMagazineRectArray)fallbackRectArray;
- (PXNewMagazineRectArray)outRectArray;
- (void)setFallbackRectArray:(id)a3;
- (void)setGeneratedChunks:(id)a3;
- (void)setOutRectArray:(id)a3;
@end

@implementation PXMagazineRecursiveContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackRectArray, 0);
  objc_storeStrong((id *)&self->_outRectArray, 0);
  objc_storeStrong((id *)&self->_generatedChunks, 0);
}

- (void)setFallbackRectArray:(id)a3
{
}

- (PXNewMagazineRectArray)fallbackRectArray
{
  return self->_fallbackRectArray;
}

- (void)setOutRectArray:(id)a3
{
}

- (PXNewMagazineRectArray)outRectArray
{
  return self->_outRectArray;
}

- (void)setGeneratedChunks:(id)a3
{
}

- (NSMutableArray)generatedChunks
{
  return self->_generatedChunks;
}

@end