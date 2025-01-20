@interface PXSoftLinkedProtoIsAvailable
@end

@implementation PXSoftLinkedProtoIsAvailable

id ___PXSoftLinkedProtoIsAvailable_block_invoke()
{
  id result = getPXProtoRootSettingsClass();
  _PXSoftLinkedProtoIsAvailable_isAvailable = result != 0;
  return result;
}

@end