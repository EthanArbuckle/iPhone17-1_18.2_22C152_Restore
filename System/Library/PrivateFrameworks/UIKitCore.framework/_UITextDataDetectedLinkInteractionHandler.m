@interface _UITextDataDetectedLinkInteractionHandler
- (BOOL)_useDataDetectorsContextMenuConfiguration;
- (CGRect)rect;
- (_UITextDataDetectedLinkInteractionHandler)initWithItem:(id)a3 textContentView:(id)a4;
- (id)_dataDetectorsRevealControllerAction;
- (id)_defaultContextMenuConfiguration;
- (id)_defaultDataDetectorsPrimaryAction;
- (id)_defaultPrimaryActionForInteractableItem;
@end

@implementation _UITextDataDetectedLinkInteractionHandler

- (_UITextDataDetectedLinkInteractionHandler)initWithItem:(id)a3 textContentView:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UITextDataDetectedLinkInteractionHandler;
  v7 = [(_UITextItemInteractionHandler *)&v31 initWithItem:v6 textContentView:a4];
  v8 = v7;
  if (v7)
  {
    p_x = &v7->_rect.origin.x;
    id v10 = v6;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v11 = [v10 rects];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v33;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * v15) CGRectValue];
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          [v10 location];
          v38.x = v24;
          v38.y = v25;
          v39.origin.x = v17;
          v39.origin.y = v19;
          v39.size.width = v21;
          v39.size.height = v23;
          if (CGRectContainsPoint(v39, v38))
          {

            goto LABEL_12;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    [v10 bounds];
    CGFloat v17 = v26;
    CGFloat v19 = v27;
    CGFloat v21 = v28;
    CGFloat v23 = v29;
LABEL_12:

    CGFloat *p_x = v17;
    v8->_rect.origin.y = v19;
    v8->_rect.size.width = v21;
    v8->_rect.size.height = v23;
  }

  return v8;
}

- (BOOL)_useDataDetectorsContextMenuConfiguration
{
  v3 = [(_UITextItemInteractionHandler *)self item];
  v4 = [v3 link];

  id v5 = v4;
  id v6 = [v5 scheme];
  char v7 = [v6 hasPrefix:@"x-apple-data-detectors"];

  if (v7) {
    goto LABEL_4;
  }
  if (!DataDetectorsUILibrary())
  {

    goto LABEL_8;
  }
  if (objc_msgSend(v5, "dd_isMaps:", 1))
  {
LABEL_4:
    BOOL v8 = 0;
    v9 = v5;
LABEL_9:

    goto LABEL_10;
  }
  char v10 = objc_msgSend(v5, "dd_isAnySimpleTelephonyScheme");

  if ((v10 & 1) == 0)
  {
LABEL_8:
    v9 = [(_UITextItemInteractionHandler *)self item];
    v11 = [(_UITextItemInteractionHandler *)self textContentView];
    uint64_t v12 = [v9 range];
    uint64_t v13 = [v12 asRange];

    uint64_t v14 = [v11 textStorage];
    uint64_t v15 = [v14 attribute:@"DDResultAttributeName" atIndex:v13 effectiveRange:0];
    BOOL v8 = v15 == 0;

    goto LABEL_9;
  }
  BOOL v8 = 0;
LABEL_10:
  double v16 = [(_UITextItemInteractionHandler *)self _menuForInteractableItem];
  CGFloat v17 = v16;
  char v18 = 1;
  if (v8 && v16)
  {
    CGFloat v19 = [v16 identifier];
    char v18 = [v19 isEqualToString:@"UITextItemDefaultMenuIdentifier"];
  }
  return v18;
}

- (id)_defaultContextMenuConfiguration
{
  v3 = [(_UITextItemInteractionHandler *)self textContentView];
  v4 = [v3 textStorage];

  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x2050000000;
  id v5 = (void *)qword_1EB25EED0;
  uint64_t v29 = qword_1EB25EED0;
  if (!qword_1EB25EED0)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    CGFloat v23 = __getDDContextMenuActionClass_block_invoke;
    CGFloat v24 = &unk_1E52D9900;
    CGFloat v25 = &v26;
    __getDDContextMenuActionClass_block_invoke((uint64_t)&v21);
    id v5 = (void *)v27[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v26, 8);
  char v7 = objc_msgSend(v4, "dd_contextAtLocation:", -[_UITextItemInteractionHandler range](self, "range"));
  BOOL v8 = (void *)[v7 mutableCopy];

  CGSize size = self->_rect.size;
  v20[0] = self->_rect.origin;
  v20[1] = size;
  char v10 = [MEMORY[0x1E4F29238] valueWithBytes:v20 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v11 = (void *)qword_1EB25EED8;
  uint64_t v29 = qword_1EB25EED8;
  if (!qword_1EB25EED8)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    CGFloat v23 = __getkDataDetectorsSourceRectKeySymbolLoc_block_invoke;
    CGFloat v24 = &unk_1E52D9900;
    CGFloat v25 = &v26;
    uint64_t v12 = DataDetectorsUILibrary();
    uint64_t v13 = dlsym(v12, "kDataDetectorsSourceRectKey");
    *(void *)(v25[1] + 24) = v13;
    qword_1EB25EED8 = *(void *)(v25[1] + 24);
    v11 = (void *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (v11)
  {
    [v8 setObject:v10 forKeyedSubscript:*v11];

    uint64_t v14 = [(_UITextItemInteractionHandler *)self range];
    uint64_t v15 = [(_UITextItemInteractionHandler *)self textContentView];
    double v16 = [v6 contextMenuConfigurationAtIndex:v14 inTextStorage:v4 inView:v15 context:v8 menuIdentifier:0];

    return v16;
  }
  else
  {
    char v18 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v19 = [NSString stringWithUTF8String:"NSString *getkDataDetectorsSourceRectKey(void)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"_UITextItemInteractionHandler.m", 33, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

- (id)_defaultPrimaryActionForInteractableItem
{
  v3 = [(_UITextDataDetectedLinkInteractionHandler *)self _dataDetectorsRevealControllerAction];
  if (!v3)
  {
    v3 = [(_UITextDataDetectedLinkInteractionHandler *)self _defaultDataDetectorsPrimaryAction];
    if (!v3)
    {
      v5.receiver = self;
      v5.super_class = (Class)_UITextDataDetectedLinkInteractionHandler;
      v3 = [(_UITextLinkInteractionHandler *)&v5 _defaultPrimaryActionForInteractableItem];
    }
  }
  return v3;
}

- (id)_dataDetectorsRevealControllerAction
{
  return 0;
}

- (id)_defaultDataDetectorsPrimaryAction
{
  uint64_t v3 = [(_UITextItemInteractionHandler *)self range];
  v4 = [(_UITextItemInteractionHandler *)self textContentView];
  objc_super v5 = [v4 textStorage];

  uint64_t v37 = 0;
  CGPoint v38 = &v37;
  uint64_t v39 = 0x2050000000;
  id v6 = (void *)getDDDetectionControllerClass_softClass;
  uint64_t v40 = getDDDetectionControllerClass_softClass;
  if (!getDDDetectionControllerClass_softClass)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __getDDDetectionControllerClass_block_invoke;
    v36[3] = &unk_1E52D9900;
    v36[4] = &v37;
    __getDDDetectionControllerClass_block_invoke((uint64_t)v36);
    id v6 = (void *)v38[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v37, 8);
  BOOL v8 = objc_msgSend(v5, "dd_contextAtLocation:", v3);
  v9 = [v7 sharedController];
  int v10 = [v9 shouldImmediatelyShowActionSheetForTapAtIndex:v3 ofStorage:v5];

  v11 = [v7 sharedController];
  uint64_t v12 = v11;
  if (v10)
  {
    id v13 = [v11 titleForResultAtIndex:v3 ofStorage:v5 context:v8];

    if (![v13 length])
    {
      uint64_t v14 = [(_UITextItemInteractionHandler *)self range];
      double v16 = objc_msgSend(v5, "attributedSubstringFromRange:", v14, v15);
      uint64_t v17 = [v16 string];

      id v13 = (id)v17;
    }
    char v18 = [(_UITextItemInteractionHandler *)self item];
    CGFloat v19 = [v18 contextMenuInteraction];

    p_rect = &self->_rect;
    CGFloat MidX = CGRectGetMidX(*p_rect);
    CGFloat MidY = CGRectGetMidY(*p_rect);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __79___UITextDataDetectedLinkInteractionHandler__defaultDataDetectorsPrimaryAction__block_invoke;
    v34[3] = &unk_1E52DB0B0;
    CGFloat v23 = (id *)v35;
    v35[0] = v19;
    *(CGFloat *)&v35[1] = MidX;
    *(CGFloat *)&v35[2] = MidY;
    id v24 = v19;
    CGFloat v25 = +[UIAction actionWithTitle:v13 image:0 identifier:@"_UITextItemInteractionHandler.presentMenu.action" handler:v34];
    goto LABEL_9;
  }
  id v13 = [v11 defaultActionAtIndex:v3 ofStorage:v5 context:v8];

  if (v13)
  {
    uint64_t v26 = [(_UITextItemInteractionHandler *)self textContentView];
    double v27 = [v13 localizedName];
    uint64_t v28 = [v13 icon];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __79___UITextDataDetectedLinkInteractionHandler__defaultDataDetectorsPrimaryAction__block_invoke_2;
    v30[3] = &unk_1E52DB0D8;
    id v33 = v7;
    CGFloat v23 = &v31;
    id v13 = v13;
    id v31 = v13;
    id v32 = v26;
    id v24 = v26;
    CGFloat v25 = +[UIAction actionWithTitle:v27 image:v28 identifier:0 handler:v30];

LABEL_9:
    goto LABEL_10;
  }
  CGFloat v25 = 0;
LABEL_10:

  return v25;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end