@interface NFReaderSessionInternalCallbacks
+ (id)interface;
@end

@implementation NFReaderSessionInternalCallbacks

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46600];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_didDetectTags_connectedTagIndex_ argumentIndex:0 ofReply:0];

  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback_ argumentIndex:0 ofReply:0];

  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_didDetectNDEFMessages_fromTags_connectedTagIndex_updateUICallback_ argumentIndex:1 ofReply:0];

  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v12, "initWithObjects:", v13, v14, objc_opt_class(), 0);
  [v2 setClasses:v15 forSelector:sel_didDetectExternalReaderWithNotification_ argumentIndex:0 ofReply:0];

  return v2;
}

@end