@interface MFBasicMessageDataSection
- (BOOL)isComplete;
- (BOOL)isPartial;
- (MFDataHolder)dataHolder;
- (NSString)partName;
- (void)dealloc;
- (void)setComplete:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setDataHolder:(id)a3;
- (void)setPartName:(id)a3;
- (void)setPartial:(BOOL)a3;
@end

@implementation MFBasicMessageDataSection

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFBasicMessageDataSection;
  [(MFBasicMessageDataSection *)&v3 dealloc];
}

- (void)setData:(id)a3
{
  self->_dataHolder = (MFDataHolder *)[objc_alloc(MEMORY[0x1E4F734C8]) initWithData:a3];
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

@end