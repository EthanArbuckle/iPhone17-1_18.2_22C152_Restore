@interface FAFamilyMember
- (id)wifiDisplayName;
@end

@implementation FAFamilyMember

- (id)wifiDisplayName
{
  id v3 = objc_alloc_init((Class)NSPersonNameComponents);
  [v3 setGivenName:-[FAFamilyMember firstName](self, "firstName")];
  [v3 setFamilyName:-[FAFamilyMember lastName](self, "lastName")];
  v4 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v3 style:0 options:0];

  return v4;
}

@end