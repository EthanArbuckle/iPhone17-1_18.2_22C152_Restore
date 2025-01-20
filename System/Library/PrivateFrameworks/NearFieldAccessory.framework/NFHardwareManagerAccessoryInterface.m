@interface NFHardwareManagerAccessoryInterface
+ (id)interface;
@end

@implementation NFHardwareManagerAccessoryInterface

+ (id)interface
{
  self;
  if (qword_26AD35270 != -1) {
    dispatch_once(&qword_26AD35270, &__block_literal_global);
  }
  v0 = (void *)_MergedGlobals;
  return v0;
}

void __48__NFHardwareManagerAccessoryInterface_interface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D057BD0];
  v1 = (void *)_MergedGlobals;
  _MergedGlobals = v0;

  v2 = (void *)_MergedGlobals;
  v3 = +[NFReaderSessionAccessoryCallbacks interface]();
  [v2 setInterface:v3 forSelector:sel_queueReaderSession_callback_ argumentIndex:0 ofReply:0];

  v4 = (void *)_MergedGlobals;
  v5 = +[NFReaderSessionAccessoryInterface interface]();
  [v4 setInterface:v5 forSelector:sel_queueReaderSession_callback_ argumentIndex:0 ofReply:1];

  id v6 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v7 = objc_opt_class();
  id v8 = (id)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  [(id)_MergedGlobals setClasses:v8 forSelector:sel_getLastDetectedTags_ argumentIndex:0 ofReply:1];
  [(id)_MergedGlobals setClasses:v8 forSelector:sel_getMultiTagState_ argumentIndex:0 ofReply:1];
}

@end