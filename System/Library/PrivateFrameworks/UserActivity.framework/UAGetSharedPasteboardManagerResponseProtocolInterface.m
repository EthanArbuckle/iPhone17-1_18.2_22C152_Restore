@interface UAGetSharedPasteboardManagerResponseProtocolInterface
@end

@implementation UAGetSharedPasteboardManagerResponseProtocolInterface

void ___UAGetSharedPasteboardManagerResponseProtocolInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0CC2C00];
  v1 = (void *)_UAGetSharedPasteboardManagerResponseProtocolInterface_result;
  _UAGetSharedPasteboardManagerResponseProtocolInterface_result = v0;

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v14 = objc_msgSend(v13, "setWithObjects:", v12, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [(id)_UAGetSharedPasteboardManagerResponseProtocolInterface_result setClasses:v14 forSelector:sel_writeLocalPasteboardToFile_itemDir_withCompletion_ argumentIndex:0 ofReply:1];
  [(id)_UAGetSharedPasteboardManagerResponseProtocolInterface_result setClasses:v14 forSelector:sel_writeLocalPasteboardToFile_itemDir_extension_withCompletion_ argumentIndex:0 ofReply:1];
}

@end