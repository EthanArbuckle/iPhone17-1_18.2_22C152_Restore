@interface NFSeshatSessionInterface
+ (id)interface;
@end

@implementation NFSeshatSessionInterface

+ (id)interface
{
  self;
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEF46EA0];
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v1 forSelector:sel_allocateSlot_authorizingUser_authorizingUserToken_completion_ argumentIndex:0 ofReply:0];

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:sel_derive_userHash_completion_ argumentIndex:0 ofReply:0];

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_resetCounter_userToken_completion_ argumentIndex:0 ofReply:0];

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v4 forSelector:sel_authorizeUpdate_slotIndex_userToken_completion_ argumentIndex:0 ofReply:0];

  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v5 forSelector:sel_allocateSlot_authorizingUser_authorizingUserToken_completion_ argumentIndex:0 ofReply:1];

  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v6 forSelector:sel_derive_userHash_completion_ argumentIndex:0 ofReply:1];

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  [v0 setClasses:v7 forSelector:sel_getDataWithCompletion_ argumentIndex:0 ofReply:1];

  return v0;
}

@end