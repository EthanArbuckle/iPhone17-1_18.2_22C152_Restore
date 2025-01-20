@interface _SBPowerAssertionContext
- (NSString)processName;
- (id)collectionBlock;
- (void)setCollectionBlock:(id)a3;
- (void)setProcessName:(id)a3;
@end

@implementation _SBPowerAssertionContext

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (id)collectionBlock
{
  return self->_collectionBlock;
}

- (void)setCollectionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_collectionBlock, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end