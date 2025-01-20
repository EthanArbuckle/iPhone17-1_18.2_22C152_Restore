@interface TUIElementNavigationBarItem
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)requiredBuilderProtocol;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (unint64_t)itemTypeFromString:(id)a3;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementNavigationBarItem

+ (unint64_t)definesScopes
{
  return 63;
}

+ (id)supportedAttributes
{
  if (qword_2DF520 != -1) {
    dispatch_once(&qword_2DF520, &stru_254470);
  }
  v2 = (void *)qword_2DF518;

  return v2;
}

+ (unint64_t)itemTypeFromString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_2DF530 != -1)
  {
    dispatch_once(&qword_2DF530, &stru_254490);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(id)qword_2DF528 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIBoxBuilding;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7 = a5;
  v8 = objc_alloc_init(_TUIElementNavigationBarItemBuilder);
  id v9 = [v7 BOOLForAttribute:139 node:a3.var0];

  [(_TUIElementNavigationBarItemBuilder *)v8 setMenuIsPrimary:v9];
  return v8;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v20 = a3;
  id v8 = a5;
  id v9 = [v8 stringForAttribute:204 node:a4.var0];
  [v20 setTitle:v9];

  [v20 setEnabled:[v8 BOOLForAttribute:74 withDefault:1 node:a4.var0]];
  v10 = [v8 stringForAttribute:116 node:a4.var0];
  [v20 setButtonType:[TUIButtonBox buttonTypeFromString:v10]];

  v11 = [v8 stringForAttribute:44 node:a4.var0];
  [v20 setButtonRole:[TUIButtonBox buttonRoleFromString:v11]];

  v12 = [v8 stringForAttribute:142 node:a4.var0];
  [v20 setObserveTrigger:v12];

  v13 = [v8 stringForAttribute:144 node:a4.var0];
  [v20 setObserveTriggerValue:[TUIBox triggerStateFromString:v13]];

  [v20 setIgnoreInsetsForOpacityTrigger:[v8 BOOLForAttribute:105 node:a4.var0]];
  v14 = [v8 stringForAttribute:140 node:a4.var0];
  [v20 setItemType:[TUIElementNavigationBarItem itemTypeFromString:v14]];

  [v20 setSearchTextMaxLength:[v8 integerForAttribute:182 withDefault:0x7FFFFFFFFFFFFFFFLL node:a4.var0]];
  v15 = [v8 stringForAttribute:200 node:a4.var0];
  [v20 setText:v15];

  v16 = (char *)[v20 itemType];
  double v17 = NAN;
  if (v16 == (unsigned char *)&dword_4 + 3) {
    [v8 floatForAttribute:146 withDefault:a4.var0 node:NAN];
  }
  [v20 setNavigationBarBackgroundOpacity:v17];
  v18 = [v8 stringForAttribute:164 node:a4.var0];
  [v20 setRefId:v18];

  v19 = [v8 stringForAttribute:165 node:a4.var0];
  [v20 setRefInstance:v19];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v22 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [TUIElementActionTriggerHandler alloc];
  v10 = [v7 finalizeTriggers];
  v11 = [v8 actionObject];
  v12 = [v8 actionDelegate];
  v13 = [(TUIElementActionTriggerHandler *)v9 initWithActionsData:v10 actionObject:v11 actionDelegate:v12];
  [v22 setActionHandler:v13];

  id v14 = [v7 finalizeModelsWithParent:v22 box:v22 context:v8];
  v15 = [v7 attributedTitle];
  if ([v22 itemType] == (char *)&def_141F14 + 3 || objc_msgSend(v22, "itemType") == &dword_4)
  {
    uint64_t v16 = [v15 tui_attributedTitleForButtonType:[v22 buttonType]];

    v15 = (void *)v16;
  }
  [v22 setAttributedTitle:v15];
  double v17 = [v7 image];
  [v22 setImage:v17];

  v18 = [v7 placeholderText];
  [v22 setPlaceholderText:v18];

  v19 = [v7 menuContainer];
  [v22 setMenuContainer:v19];

  [v22 setMenuIsPrimary:[v7 menuIsPrimary]];
  id v20 = [v7 hostingIdentifiers];
  [v22 setHostingIdentifiers:v20];

  v21 = [v7 hostingProperities];
  [v22 setHostingProperties:v21];
}

@end