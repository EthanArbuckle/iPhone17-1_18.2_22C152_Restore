@interface _UIORequestKeyShortcutHUDPresentationActionResponse
+ (id)_responseWithHUDPresentationResponse:(id)a3;
- (_UIKeyShortcutHUDPresentationResponse)response;
@end

@implementation _UIORequestKeyShortcutHUDPresentationActionResponse

+ (id)_responseWithHUDPresentationResponse:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];

  [v6 setObject:v7 forSetting:0];
  v8 = [a1 responseWithInfo:v6];

  return v8;
}

- (_UIKeyShortcutHUDPresentationResponse)response
{
  v3 = (void *)MEMORY[0x1E4F28DC0];
  v4 = self;
  id v5 = [(_UIORequestKeyShortcutHUDPresentationActionResponse *)self info];
  id v6 = [v5 objectForSetting:0];
  v7 = [v3 unarchivedObjectOfClass:v4 fromData:v6 error:0];

  return (_UIKeyShortcutHUDPresentationResponse *)v7;
}

@end