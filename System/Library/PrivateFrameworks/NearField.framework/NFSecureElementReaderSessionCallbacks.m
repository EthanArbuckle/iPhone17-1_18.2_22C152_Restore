@interface NFSecureElementReaderSessionCallbacks
+ (id)interface;
@end

@implementation NFSecureElementReaderSessionCallbacks

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46E40];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_didDetectTags_ argumentIndex:0 ofReply:0];

  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:sel_didStartSecureElementReader_ argumentIndex:0 ofReply:0];
  [v2 setClasses:v12 forSelector:sel_didEndSecureElementReader_ argumentIndex:0 ofReply:0];

  return v2;
}

@end