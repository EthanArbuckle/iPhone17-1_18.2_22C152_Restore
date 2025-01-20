@interface SIPersonDetectorData
- (NSMutableArray)boundingBoxes;
- (SIPersonDetectorData)init;
- (void)setBoundingBoxes:(id)a3;
@end

@implementation SIPersonDetectorData

- (SIPersonDetectorData)init
{
  v7.receiver = self;
  v7.super_class = (Class)SIPersonDetectorData;
  v2 = [(SIPersonDetectorData *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    boundingBoxes = v2->_boundingBoxes;
    v2->_boundingBoxes = v3;

    v5 = v2;
  }

  return v2;
}

- (NSMutableArray)boundingBoxes
{
  return self->_boundingBoxes;
}

- (void)setBoundingBoxes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end