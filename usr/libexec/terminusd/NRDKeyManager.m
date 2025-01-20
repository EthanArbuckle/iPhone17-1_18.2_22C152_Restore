@interface NRDKeyManager
@end

@implementation NRDKeyManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classAUnlockedBlocks, 0);
  objc_storeStrong((id *)&self->_classCUnlockedBlocks, 0);
  objc_storeStrong(&self->_localDeviceClassCUnlockedBlock, 0);
  objc_storeStrong(&self->_idsKeyManagerUpdateBlock, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end