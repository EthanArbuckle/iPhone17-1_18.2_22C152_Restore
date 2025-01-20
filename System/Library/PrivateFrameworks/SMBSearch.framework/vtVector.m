@interface vtVector
- (NSMutableArray)vVectorData;
- (int)addElement:(id)a3;
- (unsigned)vVectorElements;
- (void)setVVectorData:(id)a3;
- (void)setVVectorElements:(unsigned int)a3;
- (vtVector)init;
@end

@implementation vtVector

- (vtVector)init
{
  v7.receiver = self;
  v7.super_class = (Class)vtVector;
  v2 = [(vtVector *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_vVectorElements = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    vVectorData = v3->_vVectorData;
    v3->_vVectorData = v4;

    if (!v3->_vVectorData)
    {

      return 0;
    }
  }
  return v3;
}

- (int)addElement:(id)a3
{
  id v4 = a3;
  v5 = [(vtVector *)self vVectorData];
  [v5 addObject:v4];

  ++self->_vVectorElements;
  return 0;
}

- (unsigned)vVectorElements
{
  return self->_vVectorElements;
}

- (void)setVVectorElements:(unsigned int)a3
{
  self->_vVectorElements = a3;
}

- (NSMutableArray)vVectorData
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVVectorData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end