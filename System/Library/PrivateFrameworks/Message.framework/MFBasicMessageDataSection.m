@interface MFBasicMessageDataSection
- (BOOL)isComplete;
- (BOOL)isPartial;
- (MFDataHolder)dataHolder;
- (NSString)partName;
- (void)setComplete:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setDataHolder:(id)a3;
- (void)setPartName:(id)a3;
- (void)setPartial:(BOOL)a3;
@end

@implementation MFBasicMessageDataSection

- (void)setData:(id)a3
{
  id v6 = a3;
  v4 = (MFDataHolder *)[objc_alloc(MEMORY[0x1E4F734C8]) initWithData:v6];
  dataHolder = self->_dataHolder;
  self->_dataHolder = v4;
}

- (MFDataHolder)dataHolder
{
  return self->_dataHolder;
}

- (void)setDataHolder:(id)a3
{
}

- (BOOL)isPartial
{
  return self->_partial;
}

- (void)setPartial:(BOOL)a3
{
  self->_partial = a3;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (NSString)partName
{
  return self->_partName;
}

- (void)setPartName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partName, 0);
  objc_storeStrong((id *)&self->_dataHolder, 0);
}

@end