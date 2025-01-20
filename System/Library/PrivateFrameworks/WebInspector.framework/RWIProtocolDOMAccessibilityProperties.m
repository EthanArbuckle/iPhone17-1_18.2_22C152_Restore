@interface RWIProtocolDOMAccessibilityProperties
- (BOOL)busy;
- (BOOL)disabled;
- (BOOL)exists;
- (BOOL)expanded;
- (BOOL)focused;
- (BOOL)hidden;
- (BOOL)ignored;
- (BOOL)ignoredByDefault;
- (BOOL)isPopUpButton;
- (BOOL)liveRegionAtomic;
- (BOOL)pressed;
- (BOOL)readonly;
- (BOOL)required;
- (BOOL)selected;
- (NSArray)childNodeIds;
- (NSArray)controlledNodeIds;
- (NSArray)flowedNodeIds;
- (NSArray)liveRegionRelevant;
- (NSArray)ownedNodeIds;
- (NSArray)selectedChildNodeIds;
- (NSString)label;
- (NSString)role;
- (RWIProtocolDOMAccessibilityProperties)initWithExists:(BOOL)a3 label:(id)a4 nodeId:(int)a5 role:(id)a6;
- (double)headingLevel;
- (double)hierarchyLevel;
- (int)activeDescendantNodeId;
- (int)mouseEventNodeId;
- (int)nodeId;
- (int)parentNodeId;
- (int64_t)checked;
- (int64_t)current;
- (int64_t)invalid;
- (int64_t)liveRegionStatus;
- (int64_t)switchState;
- (void)setActiveDescendantNodeId:(int)a3;
- (void)setBusy:(BOOL)a3;
- (void)setChecked:(int64_t)a3;
- (void)setChildNodeIds:(id)a3;
- (void)setControlledNodeIds:(id)a3;
- (void)setCurrent:(int64_t)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setExists:(BOOL)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setFlowedNodeIds:(id)a3;
- (void)setFocused:(BOOL)a3;
- (void)setHeadingLevel:(double)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHierarchyLevel:(double)a3;
- (void)setIgnored:(BOOL)a3;
- (void)setIgnoredByDefault:(BOOL)a3;
- (void)setInvalid:(int64_t)a3;
- (void)setIsPopUpButton:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLiveRegionAtomic:(BOOL)a3;
- (void)setLiveRegionRelevant:(id)a3;
- (void)setLiveRegionStatus:(int64_t)a3;
- (void)setMouseEventNodeId:(int)a3;
- (void)setNodeId:(int)a3;
- (void)setOwnedNodeIds:(id)a3;
- (void)setParentNodeId:(int)a3;
- (void)setPressed:(BOOL)a3;
- (void)setReadonly:(BOOL)a3;
- (void)setRequired:(BOOL)a3;
- (void)setRole:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedChildNodeIds:(id)a3;
- (void)setSwitchState:(int64_t)a3;
@end

@implementation RWIProtocolDOMAccessibilityProperties

- (RWIProtocolDOMAccessibilityProperties)initWithExists:(BOOL)a3 label:(id)a4 nodeId:(int)a5 role:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  v12 = [(RWIProtocolJSONObject *)&v15 init];
  if (v12)
  {
    if (!v10) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"label" format];
    }
    if (!v11) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"role" format];
    }
    [(RWIProtocolDOMAccessibilityProperties *)v12 setExists:v8];
    [(RWIProtocolDOMAccessibilityProperties *)v12 setLabel:v10];
    [(RWIProtocolDOMAccessibilityProperties *)v12 setNodeId:v7];
    [(RWIProtocolDOMAccessibilityProperties *)v12 setRole:v11];
    v13 = v12;
  }

  return v12;
}

- (void)setActiveDescendantNodeId:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"activeDescendantNodeId"];
}

- (int)activeDescendantNodeId
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"activeDescendantNodeId"];
}

- (void)setBusy:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"busy"];
}

- (BOOL)busy
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"busy"];
}

- (void)setChecked:(int64_t)a3
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v4 = v7;
  if (v7) {
    v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    v5 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"checked"];

  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
}

- (int64_t)checked
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"checked"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    objc_super v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    objc_super v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 9; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesChecked>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesChecked>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 9);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesChecked>(WTF::String const&)::mappings)[i + 2];
  uint64_t v7 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v7)
  {
    if (*v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v7 -= 2;
    }
  }
  return (int64_t)v6;
}

- (void)setChildNodeIds:(id)a3
{
  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"childNodeIds"];
  unint64_t v4 = v6;
  objc_super v6 = 0;
  if (v4)
  {
    if (*v4 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v4;
    }
  }
}

- (NSArray)childNodeIds
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"childNodeIds"];
  id v2 = Inspector::toObjCIntegerArray(&v6);
  objc_super v3 = v6;
  objc_super v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v3;
    }
  }
  return (NSArray *)v2;
}

- (void)setControlledNodeIds:(id)a3
{
  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"controlledNodeIds"];
  unint64_t v4 = v6;
  objc_super v6 = 0;
  if (v4)
  {
    if (*v4 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v4;
    }
  }
}

- (NSArray)controlledNodeIds
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"controlledNodeIds"];
  id v2 = Inspector::toObjCIntegerArray(&v6);
  objc_super v3 = v6;
  objc_super v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v3;
    }
  }
  return (NSArray *)v2;
}

- (void)setCurrent:(int64_t)a3
{
  Inspector::toProtocolString(&v7);
  if (v7) {
    unint64_t v4 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    unint64_t v4 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v6 setString:v4 forKey:@"current"];

  objc_super v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
}

- (int64_t)current
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"current"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    objc_super v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    objc_super v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 21; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesCurrent>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesCurrent>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 21);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesCurrent>(WTF::String const&)::mappings)[i + 2];
  uint64_t v7 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v7)
  {
    if (*v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v7 -= 2;
    }
  }
  return (int64_t)v6;
}

- (void)setDisabled:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"disabled"];
}

- (BOOL)disabled
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"disabled"];
}

- (void)setHeadingLevel:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"headingLevel" forKey:a3];
}

- (double)headingLevel
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"headingLevel"];
  return result;
}

- (void)setHierarchyLevel:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"hierarchyLevel" forKey:a3];
}

- (double)hierarchyLevel
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"hierarchyLevel"];
  return result;
}

- (void)setIsPopUpButton:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isPopUpButton"];
}

- (BOOL)isPopUpButton
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isPopUpButton"];
}

- (void)setExists:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"exists"];
}

- (BOOL)exists
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"exists"];
}

- (void)setExpanded:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"expanded"];
}

- (BOOL)expanded
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"expanded"];
}

- (void)setFlowedNodeIds:(id)a3
{
  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"flowedNodeIds"];
  unint64_t v4 = v6;
  objc_super v6 = 0;
  if (v4)
  {
    if (*v4 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v4;
    }
  }
}

- (NSArray)flowedNodeIds
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"flowedNodeIds"];
  id v2 = Inspector::toObjCIntegerArray(&v6);
  objc_super v3 = v6;
  objc_super v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v3;
    }
  }
  return (NSArray *)v2;
}

- (void)setFocused:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"focused"];
}

- (BOOL)focused
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"focused"];
}

- (void)setIgnored:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"ignored"];
}

- (BOOL)ignored
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"ignored"];
}

- (void)setIgnoredByDefault:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"ignoredByDefault"];
}

- (BOOL)ignoredByDefault
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"ignoredByDefault"];
}

- (void)setInvalid:(int64_t)a3
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  unint64_t v4 = v7;
  if (v7) {
    objc_super v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    objc_super v5 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"invalid"];

  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
}

- (int64_t)invalid
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"invalid"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    objc_super v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    objc_super v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 12; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesInvalid>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesInvalid>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 12);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesInvalid>(WTF::String const&)::mappings)[i + 2];
  uint64_t v7 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v7)
  {
    if (*v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v7 -= 2;
    }
  }
  return (int64_t)v6;
}

- (void)setHidden:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"hidden"];
}

- (BOOL)hidden
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"hidden"];
}

- (void)setLabel:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"label"];
}

- (NSString)label
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"label"];
  return (NSString *)v2;
}

- (void)setLiveRegionAtomic:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"liveRegionAtomic"];
}

- (BOOL)liveRegionAtomic
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"liveRegionAtomic"];
}

- (void)setLiveRegionRelevant:(id)a3
{
  Inspector::toJSONStringArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"liveRegionRelevant"];
  objc_super v4 = v6;
  objc_super v6 = 0;
  if (v4)
  {
    if (*v4 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v4;
    }
  }
}

- (NSArray)liveRegionRelevant
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"liveRegionRelevant"];
  id v2 = Inspector::toObjCStringArray(&v6);
  objc_super v3 = v6;
  objc_super v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v3;
    }
  }
  return (NSArray *)v2;
}

- (void)setLiveRegionStatus:(int64_t)a3
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  objc_super v4 = v7;
  if (v7) {
    objc_super v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    objc_super v5 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"liveRegionStatus"];

  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
}

- (int64_t)liveRegionStatus
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"liveRegionStatus"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    objc_super v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    objc_super v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 9; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesLiveRegionStatus>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesLiveRegionStatus>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 9);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesLiveRegionStatus>(WTF::String const&)::mappings)[i + 2];
  uint64_t v7 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v7)
  {
    if (*v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v7 -= 2;
    }
  }
  return (int64_t)v6;
}

- (void)setMouseEventNodeId:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"mouseEventNodeId"];
}

- (int)mouseEventNodeId
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"mouseEventNodeId"];
}

- (void)setNodeId:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"nodeId"];
}

- (int)nodeId
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"nodeId"];
}

- (void)setOwnedNodeIds:(id)a3
{
  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"ownedNodeIds"];
  unint64_t v4 = v6;
  objc_super v6 = 0;
  if (v4)
  {
    if (*v4 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v4;
    }
  }
}

- (NSArray)ownedNodeIds
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"ownedNodeIds"];
  id v2 = Inspector::toObjCIntegerArray(&v6);
  objc_super v3 = v6;
  objc_super v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v3;
    }
  }
  return (NSArray *)v2;
}

- (void)setParentNodeId:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setInteger:*(void *)&a3 forKey:@"parentNodeId"];
}

- (int)parentNodeId
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 integerForKey:@"parentNodeId"];
}

- (void)setPressed:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"pressed"];
}

- (BOOL)pressed
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"pressed"];
}

- (void)setReadonly:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"readonly"];
}

- (BOOL)readonly
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"readonly"];
}

- (void)setRequired:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"required"];
}

- (BOOL)required
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"required"];
}

- (void)setRole:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"role"];
}

- (NSString)role
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"role"];
  return (NSString *)v2;
}

- (void)setSelected:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"selected"];
}

- (BOOL)selected
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"selected"];
}

- (void)setSelectedChildNodeIds:(id)a3
{
  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v6);
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v5 setJSONArray:&v6 forKey:@"selectedChildNodeIds"];
  objc_super v4 = v6;
  objc_super v6 = 0;
  if (v4)
  {
    if (*v4 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v4;
    }
  }
}

- (NSArray)selectedChildNodeIds
{
  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v5 JSONArrayForKey:@"selectedChildNodeIds"];
  id v2 = Inspector::toObjCIntegerArray(&v6);
  objc_super v3 = v6;
  objc_super v6 = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)v3;
    }
  }
  return (NSArray *)v2;
}

- (void)setSwitchState:(int64_t)a3
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  objc_super v4 = v7;
  if (v7) {
    objc_super v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    objc_super v5 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"switchState"];

  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
}

- (int64_t)switchState
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"switchState"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    objc_super v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    objc_super v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 6; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesSwitchState>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesSwitchState>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 6);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolDOMAccessibilityPropertiesSwitchState>(WTF::String const&)::mappings)[i + 2];
  uint64_t v7 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v7)
  {
    if (*v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v7 -= 2;
    }
  }
  return (int64_t)v6;
}

@end