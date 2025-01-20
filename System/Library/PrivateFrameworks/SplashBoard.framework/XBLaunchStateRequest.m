@interface XBLaunchStateRequest
- (BOOL)isEqual:(id)a3;
- (CGSize)naturalSize;
- (CGSize)referenceSize;
- (FBSDisplayConfiguration)displayConfiguration;
- (NSString)description;
- (NSString)groupID;
- (NSString)launchInterfaceIdentifier;
- (NSString)urlSchemeName;
- (XBDisplayEdgeInsetsWrapper)customSafeAreaInsets;
- (XBLaunchStateRequest)initWithXPCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)interfaceOrientation;
- (int64_t)userInterfaceStyle;
- (unint64_t)hash;
- (unint64_t)statusBarState;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setCustomSafeAreaInsets:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setLaunchInterfaceIdentifier:(id)a3;
- (void)setNaturalSize:(CGSize)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setStatusBarState:(unint64_t)a3;
- (void)setUrlSchemeName:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation XBLaunchStateRequest

- (id)copyWithZone:(_NSZone *)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  [(XBLaunchStateRequest *)self encodeWithXPCDictionary:v5];
  v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithXPCDictionary:", v5);

  return v6;
}

- (XBLaunchStateRequest)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)XBLaunchStateRequest;
  xpc_object_t v5 = [(XBLaunchStateRequest *)&v21 init];
  if (v5)
  {
    uint64_t v6 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
    displayConfiguration = v5->_displayConfiguration;
    v5->_displayConfiguration = (FBSDisplayConfiguration *)v6;

    uint64_t v8 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v8;

    v5->_statusBarState = xpc_dictionary_get_int64(v4, "statusBarState");
    BSDeserializeCGSizeFromXPCDictionaryWithKey();
    v5->_referenceSize.width = v10;
    v5->_referenceSize.height = v11;
    BSDeserializeCGSizeFromXPCDictionaryWithKey();
    v5->_naturalSize.width = v12;
    v5->_naturalSize.height = v13;
    v5->_interfaceOrientation = xpc_dictionary_get_int64(v4, "interfaceOrientation");
    v5->_userInterfaceStyle = xpc_dictionary_get_int64(v4, "userInterfaceStyle");
    uint64_t v14 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    customSafeAreaInsets = v5->_customSafeAreaInsets;
    v5->_customSafeAreaInsets = (XBDisplayEdgeInsetsWrapper *)v14;

    uint64_t v16 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    urlSchemeName = v5->_urlSchemeName;
    v5->_urlSchemeName = (NSString *)v16;

    uint64_t v18 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    launchInterfaceIdentifier = v5->_launchInterfaceIdentifier;
    v5->_launchInterfaceIdentifier = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  xpc_dictionary_set_int64(xdict, "statusBarState", self->_statusBarState);
  BSSerializeCGSizeToXPCDictionaryWithKey();
  BSSerializeCGSizeToXPCDictionaryWithKey();
  xpc_dictionary_set_int64(xdict, "interfaceOrientation", self->_interfaceOrientation);
  xpc_dictionary_set_int64(xdict, "userInterfaceStyle", self->_userInterfaceStyle);
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_urlSchemeName, 0);
  objc_storeStrong((id *)&self->_customSafeAreaInsets, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

- (NSString)urlSchemeName
{
  return self->_urlSchemeName;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (unint64_t)statusBarState
{
  return self->_statusBarState;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)launchInterfaceIdentifier
{
  return self->_launchInterfaceIdentifier;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (XBDisplayEdgeInsetsWrapper)customSafeAreaInsets
{
  return self->_customSafeAreaInsets;
}

- (void)setReferenceSize:(CGSize)a3
{
  self->_referenceSize = a3;
  int64_t interfaceOrientation = self->_interfaceOrientation;
  if ((unint64_t)(interfaceOrientation - 3) > 1)
  {
    if (interfaceOrientation) {
      self->_naturalSize = self->_referenceSize;
    }
  }
  else
  {
    self->_naturalSize.double width = a3.height;
    self->_naturalSize.double height = a3.width;
  }
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (void)setUrlSchemeName:(id)a3
{
}

- (void)setStatusBarState:(unint64_t)a3
{
  self->_statusBarState = a3;
}

- (void)setLaunchInterfaceIdentifier:(id)a3
{
}

- (void)setGroupID:(id)a3
{
}

- (void)setDisplayConfiguration:(id)a3
{
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_int64_t interfaceOrientation = a3;
  if (self->_referenceSize.width == *MEMORY[0x263F001B0]
    && self->_referenceSize.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    -[XBLaunchStateRequest setNaturalSize:](self, "setNaturalSize:", self->_naturalSize.width, self->_naturalSize.height);
  }
  else
  {
    -[XBLaunchStateRequest setReferenceSize:](self, "setReferenceSize:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_groupID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 groupID];
    if (BSEqualStrings()
      && (([v5 referenceSize], self->_referenceSize.width == v8)
        ? (BOOL v9 = self->_referenceSize.height == v7)
        : (BOOL v9 = 0),
          v9
       && (unint64_t statusBarState = self->_statusBarState, statusBarState == [v5 statusBarState])
       && (int64_t interfaceOrientation = self->_interfaceOrientation,
           interfaceOrientation == [v5 interfaceOrientation])
       && (int64_t userInterfaceStyle = self->_userInterfaceStyle, userInterfaceStyle == [v5 userInterfaceStyle])))
    {
      CGFloat v13 = [v5 urlSchemeName];
      if (BSEqualStrings())
      {
        uint64_t v14 = [v5 launchInterfaceIdentifier];
        char v15 = BSEqualStrings();
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (NSString)description
{
  return (NSString *)[(XBLaunchStateRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(XBLaunchStateRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(XBLaunchStateRequest *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_groupID withName:@"groupID"];
  unint64_t statusBarState = self->_statusBarState;
  if (statusBarState > 2) {
    uint64_t v6 = @"invalid";
  }
  else {
    uint64_t v6 = off_2646A58F0[statusBarState];
  }
  id v7 = (id)[v3 appendObject:v6 withName:@"statusBar"];
  id v8 = (id)objc_msgSend(v3, "appendSize:withName:", @"refSize", self->_referenceSize.width, self->_referenceSize.height);
  if (self->_referenceSize.width != self->_naturalSize.width
    || self->_referenceSize.height != self->_naturalSize.height)
  {
    id v10 = (id)objc_msgSend(v3, "appendSize:withName:", @"naturalSize");
  }
  id v11 = (id)[v3 appendObject:self->_customSafeAreaInsets withName:@"customSafeAreaInsets" skipIfNil:1];
  CGFloat v12 = XBStringForInterfaceOrientation(self->_interfaceOrientation);
  id v13 = (id)[v3 appendObject:v12 withName:@"orientation"];

  uint64_t v14 = XBStringForUserInterfaceStyle(self->_userInterfaceStyle);
  id v15 = (id)[v3 appendObject:v14 withName:@"userInterfaceStyle"];

  id v16 = (id)[v3 appendObject:self->_urlSchemeName withName:@"scheme" skipIfNil:1];
  return v3;
}

- (void)setNaturalSize:(CGSize)a3
{
  self->_naturalSize = a3;
  int64_t interfaceOrientation = self->_interfaceOrientation;
  if ((unint64_t)(interfaceOrientation - 3) > 1)
  {
    if (interfaceOrientation) {
      self->_referenceSize = self->_naturalSize;
    }
  }
  else
  {
    self->_referenceSize.double width = a3.height;
    self->_referenceSize.double height = a3.width;
  }
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (CGSize)naturalSize
{
  double width = self->_naturalSize.width;
  double height = self->_naturalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCustomSafeAreaInsets:(id)a3
{
}

@end