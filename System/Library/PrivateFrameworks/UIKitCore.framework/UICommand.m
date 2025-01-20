@interface UICommand
+ (BOOL)supportsSecureCoding;
+ (UICommand)commandWithTitle:(NSString *)title image:(UIImage *)image action:(SEL)action propertyList:(id)propertyList;
+ (UICommand)commandWithTitle:(NSString *)title image:(UIImage *)image action:(SEL)action propertyList:(id)propertyList alternates:(NSArray *)alternates;
+ (UICommand)commandWithTitle:(id)a3 imageName:(id)a4 action:(SEL)a5;
+ (UICommand)commandWithTitle:(id)a3 imageName:(id)a4 action:(SEL)a5 fallbackAction:(SEL)a6;
+ (UICommand)commandWithTitle:(id)a3 imageName:(id)a4 attributes:(unint64_t)a5 action:(SEL)a6;
+ (UICommand)commandWithTitle:(id)a3 imageName:(id)a4 preferredDisplayMode:(unint64_t)a5 action:(SEL)a6;
+ (id)_defaultCommandForAction:(SEL)a3;
+ (id)_defaultCommands;
- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5;
- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4;
- (BOOL)_isDefaultCommand;
- (BOOL)_isLeaf;
- (BOOL)_useSenderForResolvingTarget;
- (BOOL)isEqual:(id)a3;
- (BOOL)keepsMenuPresented;
- (BOOL)requiresAuthenticatedInput;
- (NSArray)alternates;
- (NSPointerArray)_getStateObservers;
- (NSString)description;
- (NSString)discoverabilityTitle;
- (SEL)action;
- (SEL)fallbackAction;
- (UICommand)initWithCoder:(NSCoder *)coder;
- (UICommand)initWithCommand:(id)a3;
- (UICommand)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 action:(SEL)a6 fallbackAction:(SEL)a7 propertyList:(id)a8 alternates:(id)a9 discoverabilityTitle:(id)a10 attributes:(unint64_t)a11 state:(int64_t)a12;
- (UICommand)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 action:(SEL)a6 propertyList:(id)a7 alternates:(id)a8 discoverabilityTitle:(id)a9 attributes:(unint64_t)a10 state:(int64_t)a11;
- (UIImage)selectedImage;
- (UIMenuElementAttributes)attributes;
- (UIMenuElementState)state;
- (UIPopoverPresentationControllerSourceItem)presentationSourceItem;
- (id)_alternateForModifierFlags:(int64_t)a3;
- (id)_alternateForModifierFlags:(int64_t)a3 usingAlternates:(id)a4;
- (id)_identifier;
- (id)_immutableCopy;
- (id)_leafAlternates;
- (id)_leafKeyInput;
- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4;
- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4 shouldUseFallbackActionOut:(BOOL *)a5;
- (id)_target;
- (id)_validatedLeafWithAlternate:(id)a3 target:(id)a4 validation:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)propertyList;
- (id)sender;
- (int64_t)_leafKeyModifierFlags;
- (unint64_t)hash;
- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6;
- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4;
- (void)_addStateObserver:(id)a3;
- (void)_performFallbackActionWithSender:(id)a3 target:(id)a4;
- (void)_performWithSender:(id)a3 handler:(id)a4;
- (void)_removeStateObserver:(id)a3;
- (void)_setState:(int64_t)a3 notifyingObservers:(BOOL)a4;
- (void)_setStateObservers:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)performWithSender:(id)a3 target:(id)a4;
- (void)setAttributes:(UIMenuElementAttributes)attributes;
- (void)setDiscoverabilityTitle:(NSString *)discoverabilityTitle;
- (void)setImage:(UIImage *)image;
- (void)setSelectedImage:(id)a3;
- (void)setState:(UIMenuElementState)state;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(NSString *)title;
- (void)set_useSenderForResolvingTarget:(BOOL)a3;
@end

@implementation UICommand

- (SEL)action
{
  return self->_action;
}

uint64_t __46__UICommand_DefaultCommands___defaultCommands__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 action];
}

- (void)setDiscoverabilityTitle:(NSString *)discoverabilityTitle
{
}

+ (id)_defaultCommandForAction:(SEL)a3
{
  v4 = [a1 _defaultCommands];
  v5 = [v4 objectForSelector:a3];

  return v5;
}

+ (id)_defaultCommands
{
  if (_MergedGlobals_1167 != -1) {
    dispatch_once(&_MergedGlobals_1167, &__block_literal_global_397);
  }
  v2 = (void *)qword_1EB261FE0;
  return v2;
}

- (UICommand)initWithCommand:(id)a3
{
  v4 = (id *)a3;
  v5 = [v4 _imageOrName];
  v6 = [v4 title];
  v7 = [v5 _asMenuElementImage];
  v8 = [v5 _asMenuElementImageName];
  v11.receiver = self;
  v11.super_class = (Class)UICommand;
  v9 = [(UIMenuElement *)&v11 initWithTitle:v6 image:v7 imageName:v8];

  if (v9)
  {
    objc_storeStrong(&v9->__target, v4[19]);
    v9->_action = (SEL)v4[15];
    v9->_fallbackAction = (SEL)v4[18];
    objc_storeStrong((id *)&v9->super._attributedTitle, v4[1]);
    objc_storeStrong((id *)&v9->super._subtitle, v4[2]);
    objc_storeStrong(&v9->_propertyList, v4[16]);
    objc_storeStrong((id *)&v9->_alternates, v4[17]);
    objc_storeStrong((id *)&v9->_discoverabilityTitle, v4[14]);
    *((_DWORD *)v9 + 18) = *((_DWORD *)v4 + 18);
    *((_DWORD *)v9 + 19) = *((_DWORD *)v4 + 19);
    objc_storeStrong((id *)&v9->_selectedImage, v4[13]);
    objc_storeStrong((id *)&v9->super._accessibilityIdentifier, v4[3]);
    v9->super.__preferredDisplayMode = (unint64_t)v4[4];
  }

  return v9;
}

- (UICommand)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 action:(SEL)a6 propertyList:(id)a7 alternates:(id)a8 discoverabilityTitle:(id)a9 attributes:(unint64_t)a10 state:(int64_t)a11
{
  return [(UICommand *)self initWithTitle:a3 image:a4 imageName:a5 action:a6 fallbackAction:0 propertyList:a7 alternates:a8 discoverabilityTitle:a9 attributes:a10 state:a11];
}

- (UICommand)initWithTitle:(id)a3 image:(id)a4 imageName:(id)a5 action:(SEL)a6 fallbackAction:(SEL)a7 propertyList:(id)a8 alternates:(id)a9 discoverabilityTitle:(id)a10 attributes:(unint64_t)a11 state:(int64_t)a12
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v44 = a5;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  v41 = v16;
  v42 = v15;
  if (v17)
  {
    DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v17, 0);
    if (!DeepCopy)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"UICommand.m", 312, @"Invalid parameter not satisfying: %@", @"propertyListCopy" object file lineNumber description];
    }
  }
  else
  {
    DeepCopy = 0;
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v22 = v18;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v23)
  {
    v25 = 0;
    goto LABEL_20;
  }
  uint64_t v24 = v23;
  v25 = 0;
  uint64_t v26 = *(void *)v47;
  do
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v47 != v26) {
        objc_enumerationMutation(v22);
      }
      uint64_t v28 = [*(id *)(*((void *)&v46 + 1) + 8 * i) modifierFlags];
      if (!v28 || [v25 containsIndex:v28])
      {
        v29 = [MEMORY[0x1E4F28B00] currentHandler];
        [v29 handleFailureInMethod:a2, self, @"UICommand.m", 321, @"Invalid parameter not satisfying: %@", @"alternateModifierFlags != 0 && ![allAlternateModifierFlags containsIndex:alternateModifierFlags]" object file lineNumber description];

        if (v25)
        {
LABEL_13:
          [v25 addIndex:v28];
          continue;
        }
      }
      else if (v25)
      {
        goto LABEL_13;
      }
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:v28];
    }
    uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v50 count:16];
  }
  while (v24);
LABEL_20:

  v45.receiver = self;
  v45.super_class = (Class)UICommand;
  v30 = [(UIMenuElement *)&v45 initWithTitle:v42 image:v41 imageName:v44];
  v31 = v30;
  if (v30)
  {
    id target = v30->__target;
    v30->__id target = 0;

    v31->_action = a6;
    v31->_fallbackAction = a7;
    objc_storeStrong(&v31->_propertyList, DeepCopy);
    uint64_t v33 = [v22 copy];
    alternates = v31->_alternates;
    v31->_alternates = (NSArray *)v33;

    uint64_t v35 = [v19 copy];
    discoverabilityTitle = v31->_discoverabilityTitle;
    v31->_discoverabilityTitle = (NSString *)v35;

    *((_DWORD *)v31 + 18) = a11;
    *((_DWORD *)v31 + 19) = a12;
  }

  return v31;
}

- (id)propertyList
{
  return self->_propertyList;
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5
{
  if (a4) {
    return (*((uint64_t (**)(id, UICommand *))a4 + 2))(a4, self);
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__target, 0);
  objc_storeStrong((id *)&self->_alternates, 0);
  objc_storeStrong(&self->_propertyList, 0);
  objc_storeStrong((id *)&self->_discoverabilityTitle, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->stateObservers, 0);
}

- (void)setState:(UIMenuElementState)state
{
}

+ (UICommand)commandWithTitle:(id)a3 imageName:(id)a4 attributes:(unint64_t)a5 action:(SEL)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc((Class)a1);
  v13 = (void *)[v12 initWithTitle:v11 image:0 imageName:v10 action:a6 propertyList:0 alternates:MEMORY[0x1E4F1CBF0] discoverabilityTitle:0 attributes:a5 state:0];

  return (UICommand *)v13;
}

void __46__UICommand_DefaultCommands___defaultCommands__block_invoke()
{
  v109 = _UINSLocalizedStringWithDefaultValue(@"Duplicate", @"Duplicate");
  v39 = _UINSLocalizedStringWithDefaultValue(@"Move", @"Move");
  v40 = _UINSLocalizedStringWithDefaultValue(@"Rename", @"Rename");
  v37 = _UINSLocalizedStringWithDefaultValue(@"Export", @"Export");
  v52 = [_UISelectorDictionary alloc];
  v67 = _UIKitBundle();
  v66 = [v67 localizedStringForKey:@"Copy[Menu]" value:@"Copy" table:@"Localizable"];
  v108 = +[UIKeyCommand commandWithTitle:v66 imageName:@"doc.on.doc" action:sel_copy_ input:@"c" modifierFlags:0x100000];
  v65 = _UINSLocalizedStringWithDefaultValue(@"Cut", @"Cut");
  v107 = +[UIKeyCommand commandWithTitle:v65 imageName:@"scissors" action:sel_cut_ input:@"x" modifierFlags:0x100000];
  v64 = _UINSLocalizedStringWithDefaultValue(@"Smaller", @"Smaller");
  v106 = +[UIKeyCommand commandWithTitle:v64 imageName:@"textformat.size.smaller" action:sel_decreaseSize_ input:@"-" modifierFlags:0x100000];
  v63 = _UIKitBundle();
  v62 = [v63 localizedStringForKey:@"Delete[Menu]" value:@"Delete" table:@"Localizable"];
  v105 = +[UICommand commandWithTitle:v62 imageName:@"trash" attributes:2 action:sel_delete_];
  v61 = _UINSLocalizedStringWithDefaultValue(@"Bigger", @"Bigger");
  v104 = +[UIKeyCommand commandWithTitle:v61 imageName:@"textformat.size.larger" action:sel_increaseSize_ input:@"+" modifierFlags:0x100000];
  v60 = _UINSLocalizedStringWithDefaultValue(@"Default", @"Default");
  v103 = +[UICommand commandWithTitle:v60 imageName:0 action:sel_makeTextWritingDirectionNatural_];
  v59 = _UINSLocalizedStringWithDefaultValue(@"Left to Right", @"Left to Right");
  v102 = +[UICommand commandWithTitle:v59 imageName:@"arrow.text.left.to.right" preferredDisplayMode:3 action:sel_makeTextWritingDirectionLeftToRight_];
  v58 = _UINSLocalizedStringWithDefaultValue(@"Right to Left", @"Right to Left");
  v101 = +[UICommand commandWithTitle:v58 imageName:@"arrow.text.right.to.left" preferredDisplayMode:3 action:sel_makeTextWritingDirectionRightToLeft_];
  v57 = _UINSLocalizedStringWithDefaultValue(@"Paste", @"Paste");
  v100 = +[UIKeyCommand commandWithTitle:v57 imageName:@"doc.on.clipboard" action:sel_paste_ input:@"v" modifierFlags:0x100000];
  v56 = _UINSLocalizedStringWithDefaultValue(@"Paste and Match Style", @"Paste and Match Style");
  v99 = +[UIKeyCommand commandWithTitle:v56 imageName:@"doc.on.clipboard" action:sel_pasteAndMatchStyle_ input:@"v" modifierFlags:1703936];
  v55 = _UINSLocalizedStringWithDefaultValue(@"Redo", @"Redo");
  v98 = +[UIKeyCommand commandWithTitle:v55 imageName:@"arrow.uturn.forward.circle" action:sel_redo_ input:@"z" modifierFlags:1179648];
  v54 = _UINSLocalizedStringWithDefaultValue(@"Select", @"Select");
  v97 = +[UICommand commandWithTitle:v54 imageName:@"selection.pin.in.out" action:sel_select_];
  v53 = _UINSLocalizedStringWithDefaultValue(@"Select All", @"Select All");
  v96 = +[UIKeyCommand commandWithTitle:v53 imageName:@"character.textbox" action:sel_selectAll_ input:@"a" modifierFlags:0x100000];
  uint64_t v51 = _UINSLocalizedStringWithDefaultValue(@"TEXT_FORMATTING_MORE", @"More…");
  v95 = +[UIKeyCommand commandWithTitle:v51 imageName:@"textformat" action:sel__showTextFormattingOptions_ input:@"t" modifierFlags:1572864];
  v50 = _UINSLocalizedStringWithDefaultValue(@"Bold", @"Bold");
  v94 = +[UIKeyCommand commandWithTitle:v50 imageName:@"bold" action:sel_toggleBoldface_ input:@"b" modifierFlags:0x100000];
  long long v49 = _UINSLocalizedStringWithDefaultValue(@"Italic", @"Italic");
  v93 = +[UIKeyCommand commandWithTitle:v49 imageName:@"italic" action:sel_toggleItalics_ input:@"i" modifierFlags:0x100000];
  long long v48 = _UINSLocalizedStringWithDefaultValue(@"Underline", @"Underline");
  v92 = +[UIKeyCommand commandWithTitle:v48 imageName:@"underline" action:sel_toggleUnderline_ input:@"u" modifierFlags:0x100000];
  long long v47 = _UINSLocalizedStringWithDefaultValue(@"Undo", @"Undo");
  v91 = +[UIKeyCommand commandWithTitle:v47 imageName:@"arrow.uturn.backward.circle" action:sel_undo_ input:@"z" modifierFlags:0x100000];
  long long v46 = _UINSLocalizedStringWithDefaultValue(@"Pause", @"Pause");
  v90 = +[UICommand commandWithTitle:v46 imageName:@"pause" action:sel__accessibilityPauseSpeaking_];
  objc_super v45 = _UINSLocalizedStringWithDefaultValue(@"Speak", @"Speak");
  v89 = +[UICommand commandWithTitle:v45 imageName:@"play" action:sel__accessibilitySpeak_];
  id v44 = _UINSLocalizedStringWithDefaultValue(@"Speak…", @"Speak…");
  v88 = +[UICommand commandWithTitle:v44 imageName:@"play" action:sel__accessibilitySpeakLanguageSelection_];
  v43 = _UINSLocalizedStringWithDefaultValue(@"Learn…", @"Learn…");
  v87 = +[UICommand commandWithTitle:v43 imageName:@"character.book.closed" action:sel_addShortcut_ fallbackAction:sel__addShortcut_];
  v42 = _UINSLocalizedStringWithDefaultValue(@"Look Up", @"Look Up");
  v86 = +[UICommand commandWithTitle:v42 imageName:@"doc.text.magnifyingglass" action:sel__define_ fallbackAction:sel_define_];
  v41 = _UINSLocalizedStringWithDefaultValue(@"Insert Drawing", @"Insert Drawing");
  v85 = +[UICommand commandWithTitle:v41 imageName:@"scribble" action:sel__insertDrawing_];
  v38 = _UINSLocalizedStringWithDefaultValue(@"Look Up", @"Look Up");
  v84 = +[UICommand commandWithTitle:v38 imageName:@"doc.text.magnifyingglass" action:sel__lookup_ fallbackAction:sel_lookup_];
  v36 = _UINSLocalizedStringWithDefaultValue(@"Replace…", @"Replace…");
  v83 = +[UICommand commandWithTitle:v36 imageName:@"character.cursor.ibeam" action:sel_promptForReplace_ fallbackAction:sel__promptForReplace_];
  uint64_t v35 = _UINSLocalizedStringWithDefaultValue(@"Share…", @"Share…");
  v82 = +[UICommand commandWithTitle:v35 imageName:@"square.and.arrow.up" action:sel_share_ fallbackAction:sel__share_];
  v34 = _UINSLocalizedStringWithDefaultValue(@"Find", @"Find");
  v81 = +[UIKeyCommand commandWithTitle:v34 imageName:0 action:sel_find_ input:@"f" modifierFlags:0x100000];
  uint64_t v33 = _UINSLocalizedStringWithDefaultValue(@"Find & Replace", @"Find & Replace");
  v80 = +[UIKeyCommand commandWithTitle:v33 imageName:0 action:sel_findAndReplace_ input:@"f" modifierFlags:1572864];
  v32 = _UINSLocalizedStringWithDefaultValue(@"Find Next", @"Find Next");
  v79 = +[UIKeyCommand commandWithTitle:v32 imageName:0 action:sel_findNext_ input:@"g" modifierFlags:0x100000];
  v31 = _UINSLocalizedStringWithDefaultValue(@"Find Previous", @"Find Previous");
  v78 = +[UIKeyCommand commandWithTitle:v31 imageName:0 action:sel_findPrevious_ input:@"g" modifierFlags:1179648];
  v30 = _UINSLocalizedStringWithDefaultValue(@"Use Selection for Find", @"Use Selection for Find");
  v77 = +[UIKeyCommand commandWithTitle:v30 imageName:0 action:sel_useSelectionForFind_ input:@"e" modifierFlags:0x100000];
  v29 = _UINSLocalizedStringWithDefaultValue(@"Find Selection", @"Find Selection");
  v74 = +[UICommand commandWithTitle:v29 imageName:@"text.magnifyingglass" action:sel_findSelected_ fallbackAction:sel__findSelected_];
  v76 = +[UIKeyCommand commandWithTitle:v109 imageName:@"plus.square.on.square" action:sel_duplicate_ input:@"S" modifierFlags:1179648];
  v75 = +[UICommand commandWithTitle:v40 imageName:@"pencil" action:sel_rename_];
  v70 = +[UICommand commandWithTitle:v39 imageName:@"folder" action:sel_move_];
  v73 = +[UICommand commandWithTitle:v37 imageName:@"square.and.arrow.up.on.square" action:sel_export_];
  uint64_t v24 = +[UICommand commandWithTitle:@"简⇄繁" imageName:0 action:sel_transliterateChinese_ fallbackAction:sel__transliterateChinese_];
  uint64_t v28 = _UINSLocalizedStringWithDefaultValue(@"Open...", @"Open...");
  v72 = +[UIKeyCommand commandWithTitle:v28 imageName:0 action:sel_open_ input:@"o" modifierFlags:0x100000];
  v27 = _UINSLocalizedStringWithDefaultValue(@"Open in New Window", @"Open in New Window");
  v71 = +[UICommand commandWithTitle:v27 imageName:@"rectangle.badge.plus" action:sel__openInNewCanvas_];
  v0 = _UINSLocalizedStringWithDefaultValue(@"Show Sidebar", @"Show Sidebar");
  v1 = +[UIKeyCommand commandWithTitle:v0 imageName:0 action:sel_toggleSidebar_ input:@"s" modifierFlags:1310720];

  v69 = [v1 _immutableCopy];

  v68 = +[UIKeyCommand commandWithTitle:&stru_1ED0E84C0 imageName:0 action:sel_showHelp_ input:@"?" modifierFlags:0x100000];
  uint64_t v26 = _UINSLocalizedStringWithDefaultValue(@"Print", @"Print");
  v25 = +[UIKeyCommand commandWithTitle:v26 imageName:@"printer" action:sel_print_ input:@"p" modifierFlags:0x100000];
  id v16 = [v25 _nonRepeatableKeyCommand];
  uint64_t v23 = _UINSLocalizedStringWithDefaultValue(@"Dictation", @"Dictation");
  id v22 = +[UIKeyCommand commandWithTitle:v23 imageName:0 action:sel_startDictation_ input:@"D" modifierFlags:0x800000];
  v21 = [v22 _allowGlobeModifierKeyCommand];
  v13 = [v21 _nonRepeatableKeyCommand];
  v20 = _UINSLocalizedStringWithDefaultValue(@"Emoji", @"Emoji");
  id v19 = +[UIKeyCommand commandWithTitle:v20 imageName:@"emoji.face.grinning" action:sel_orderFrontCharacterPalette_ input:@"E" modifierFlags:0x800000];
  id v18 = [v19 _allowGlobeModifierKeyCommand];
  id v12 = [v18 _nonRepeatableKeyCommand];
  id v17 = +[UIKeyCommand commandWithTitle:&stru_1ED0E84C0 imageName:0 action:sel__handleLegacyEmojiKeyboardShortcut_ input:@" " modifierFlags:1310720];
  v2 = [v17 _nonRepeatableKeyCommand];
  id v15 = +[UIAction _textFromCameraTitle];
  v14 = +[UIAction _textFromCameraImageName];
  v3 = +[UICommand commandWithTitle:v15 imageName:v14 action:sel_captureTextFromCamera_];
  v4 = _UINSLocalizedStringWithDefaultValue(@"Translate", @"Translate");
  v5 = +[UICommand commandWithTitle:v4 imageName:@"translate" action:sel__translate_ fallbackAction:sel_translate_];
  v6 = _UINSLocalizedStringWithDefaultValue(@"Close", @"Close");
  v7 = +[UIKeyCommand commandWithTitle:v6 image:0 action:sel__performClose_ input:@"w" modifierFlags:0x100000 propertyList:0];
  v8 = _UINSLocalizedStringWithDefaultValue(@"Writing Tools", @"Writing Tools");
  v9 = +[UICommand commandWithTitle:v8 imageName:@"apple.writing.tools" action:sel_showWritingTools_];
  uint64_t v10 = -[_UISelectorDictionary initWithMapping:objects:](v52, "initWithMapping:objects:", &__block_literal_global_16_4, v108, v107, v106, v105, v104, v103, v102, v101, v100, v99, v98, v97, v96, v95, v94, v93,
          v92,
          v91,
          v90,
          v89,
          v88,
          v87,
          v86,
          v85,
          v84,
          v83,
          v82,
          v81,
          v80,
          v79,
          v78,
          v77,
          v74,
          v76,
          v75,
          v70,
          v73,
          v24,
          v72,
          v71,
          v69,
          v68,
          v16,
          v13,
          v12,
          v2,
          v3,
          v5,
          v7,
          v9,
          0);
  id v11 = (void *)qword_1EB261FE0;
  qword_1EB261FE0 = v10;
}

+ (UICommand)commandWithTitle:(id)a3 imageName:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)a1);
  id v11 = (void *)[v10 initWithTitle:v9 image:0 imageName:v8 action:a5 propertyList:0 alternates:MEMORY[0x1E4F1CBF0] discoverabilityTitle:0 attributes:0 state:0];

  return (UICommand *)v11;
}

+ (UICommand)commandWithTitle:(id)a3 imageName:(id)a4 action:(SEL)a5 fallbackAction:(SEL)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc((Class)a1);
  v13 = (void *)[v12 initWithTitle:v11 image:0 imageName:v10 action:a5 fallbackAction:a6 propertyList:0 alternates:MEMORY[0x1E4F1CBF0] discoverabilityTitle:0 attributes:0 state:0];

  return (UICommand *)v13;
}

+ (UICommand)commandWithTitle:(id)a3 imageName:(id)a4 preferredDisplayMode:(unint64_t)a5 action:(SEL)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc((Class)a1);
  v13 = (void *)[v12 initWithTitle:v11 image:0 imageName:v10 action:a6 propertyList:0 alternates:MEMORY[0x1E4F1CBF0] discoverabilityTitle:0 attributes:0 state:0];

  v13[4] = a5;
  return (UICommand *)v13;
}

- (void)_setState:(int64_t)a3 notifyingObservers:(BOOL)a4
{
  if (*((_DWORD *)self + 19) != a3)
  {
    *((_DWORD *)self + 19) = a3;
    if (a4) {
      _UIMenuStateObserverableLeafStateDidChange(self);
    }
  }
}

+ (UICommand)commandWithTitle:(NSString *)title image:(UIImage *)image action:(SEL)action propertyList:(id)propertyList
{
  id v10 = propertyList;
  id v11 = image;
  id v12 = title;
  id v13 = objc_alloc((Class)a1);
  v14 = [MEMORY[0x1E4F1C978] array];
  id v15 = (void *)[v13 initWithTitle:v12 image:v11 imageName:0 action:action propertyList:v10 alternates:v14 discoverabilityTitle:0 attributes:0 state:0];

  return (UICommand *)v15;
}

+ (UICommand)commandWithTitle:(NSString *)title image:(UIImage *)image action:(SEL)action propertyList:(id)propertyList alternates:(NSArray *)alternates
{
  id v12 = alternates;
  id v13 = propertyList;
  v14 = image;
  id v15 = title;
  id v16 = (void *)[objc_alloc((Class)a1) initWithTitle:v15 image:v14 imageName:0 action:action propertyList:v13 alternates:v12 discoverabilityTitle:0 attributes:0 state:0];

  return (UICommand *)v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isLeaf
{
  return 1;
}

- (UICommand)initWithCoder:(NSCoder *)coder
{
  v4 = coder;
  v27.receiver = self;
  v27.super_class = (Class)UICommand;
  v5 = [(UIMenuElement *)&v27 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"discoverabilityTitle"];
    discoverabilityTitle = v5->_discoverabilityTitle;
    v5->_discoverabilityTitle = (NSString *)v6;

    id v8 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    v5->_action = NSSelectorFromString(v8);

    id v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [(NSCoder *)v4 decodeObjectOfClasses:v15 forKey:@"propertyList"];
    id propertyList = v5->_propertyList;
    v5->_id propertyList = (id)v16;

    id v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [(NSCoder *)v4 decodeObjectOfClasses:v20 forKey:@"alternates"];
    id v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = (void *)v21;
    }
    else {
      uint64_t v23 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v5->_alternates, v23);

    *((_DWORD *)v5 + 18) = [(NSCoder *)v4 decodeIntegerForKey:@"attributes"];
    *((_DWORD *)v5 + 19) = [(NSCoder *)v4 decodeIntegerForKey:@"states"];
    uint64_t v24 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedImage"];
    selectedImage = v5->_selectedImage;
    v5->_selectedImage = (UIImage *)v24;
  }
  return v5;
}

- (BOOL)requiresAuthenticatedInput
{
  return self->_action == sel_paste_;
}

- (void)setTitle:(NSString *)title
{
  v3.receiver = self;
  v3.super_class = (Class)UICommand;
  [(UIMenuElement *)&v3 _setTitle:title];
}

- (void)setSubtitle:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UICommand;
  [(UIMenuElement *)&v3 _setSubtitle:a3];
}

- (void)setImage:(UIImage *)image
{
  v3.receiver = self;
  v3.super_class = (Class)UICommand;
  [(UIMenuElement *)&v3 _setImage:image];
}

- (void)_acceptMenuVisit:(id)a3 commandVisit:(id)a4 actionVisit:(id)a5 deferredElementVisit:(id)a6
{
  if (a4) {
    (*((void (**)(id, UICommand *))a4 + 2))(a4, self);
  }
}

- (void)_acceptMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4) {
    (*((void (**)(id, UICommand *))a4 + 2))(a4, self);
  }
}

- (BOOL)_acceptBoolMenuVisit:(id)a3 leafVisit:(id)a4
{
  if (a4) {
    return (*((uint64_t (**)(id, UICommand *))a4 + 2))(a4, self);
  }
  else {
    return 0;
  }
}

- (id)_alternateForModifierFlags:(int64_t)a3
{
  return [(UICommand *)self _alternateForModifierFlags:a3 usingAlternates:self->_alternates];
}

- (id)_alternateForModifierFlags:(int64_t)a3 usingAlternates:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v20;
    int64_t v11 = ~a3;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int8x8_t v14 = (int8x8_t)[v13 modifierFlags];
        uint8x8_t v15 = (uint8x8_t)vcnt_s8(v14);
        v15.i16[0] = vaddlv_u8(v15);
        if ((*(void *)&v14 & v11) != 0) {
          int v16 = -1;
        }
        else {
          int v16 = v15.i32[0];
        }
        if (v8 < v16)
        {
          id v17 = v13;

          int v8 = v16;
          id v9 = v17;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_immutableCopy
{
  v2 = [(UICommand *)[_UIImmutableCommand alloc] initWithCommand:self];
  return v2;
}

- (id)_identifier
{
  return +[_UICommandIdentifier identifierWithAction:self->_action propertyList:self->_propertyList];
}

- (id)_leafAlternates
{
  return self->_alternates;
}

- (id)_leafKeyInput
{
  return 0;
}

- (int64_t)_leafKeyModifierFlags
{
  return 0;
}

- (BOOL)keepsMenuPresented
{
  return ([(UICommand *)self attributes] >> 3) & 1;
}

- (BOOL)_isDefaultCommand
{
  v2 = +[UICommand _defaultCommandForAction:self->_action];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)sender
{
  return _UIMenuLeafAPISenderFromSender(self->_sender);
}

- (UIPopoverPresentationControllerSourceItem)presentationSourceItem
{
  return (UIPopoverPresentationControllerSourceItem *)_UIMenuLeafPresentationSourceItemFromSender(self->_sender);
}

- (void)performWithSender:(id)a3 target:(id)a4
{
  id v13 = a3;
  p_sender = &self->_sender;
  objc_storeStrong(&self->_sender, a3);
  id v8 = a4;
  _UIMenuStateObserverableLeafWillPerformAction(self);
  if (self->__useSenderForResolvingTarget) {
    id v9 = v13;
  }
  else {
    id v9 = 0;
  }
  uint64_t v10 = v9;
  int64_t v11 = [(UICommand *)self action];
  if (v10) {
    self = v10;
  }
  if (dyld_program_sdk_at_least()) {
    objc_msgSend(v8, v11, self);
  }
  else {
    objc_msgSend(v8, sel_performSelector_withObject_, v11, self);
  }

  id v12 = *p_sender;
  id *p_sender = 0;
}

- (void)_performFallbackActionWithSender:(id)a3 target:(id)a4
{
  id v13 = (UICommand *)a3;
  p_sender = &self->_sender;
  objc_storeStrong(&self->_sender, a3);
  id v8 = a4;
  _UIMenuStateObserverableLeafWillPerformAction(self);
  if (self->__useSenderForResolvingTarget) {
    id v9 = v13;
  }
  else {
    id v9 = 0;
  }
  fallbackAction = self->_fallbackAction;
  if (v9) {
    self = v9;
  }
  int64_t v11 = v9;
  if (dyld_program_sdk_at_least()) {
    objc_msgSend(v8, fallbackAction, self);
  }
  else {
    objc_msgSend(v8, sel_performSelector_withObject_, fallbackAction, self);
  }

  id v12 = *p_sender;
  id *p_sender = 0;
}

- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4
{
  uint64_t v6 = self;
  p_sender = &self->_sender;
  objc_storeStrong(&self->_sender, a4);
  id v8 = (UICommand *)a4;
  id v9 = a3;
  if (v6->__useSenderForResolvingTarget) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0;
  }
  SEL action = v6->_action;
  if (v10) {
    uint64_t v6 = v10;
  }
  id v12 = v10;
  id v13 = [v9 targetForAction:action withSender:v6];

  id v14 = *p_sender;
  id *p_sender = 0;

  return v13;
}

- (id)_resolvedTargetFromFirstTarget:(id)a3 sender:(id)a4 shouldUseFallbackActionOut:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  p_sender = &self->_sender;
  objc_storeStrong(&self->_sender, a4);
  if (self->__useSenderForResolvingTarget) {
    int64_t v11 = v9;
  }
  else {
    int64_t v11 = 0;
  }
  id v12 = v11;
  id v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = self;
  }
  uint64_t v15 = [v8 targetForAction:self->_action withSender:v14];
  int v16 = (void *)v15;
  if (self->_fallbackAction) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    id v18 = objc_msgSend(v8, "targetForAction:withSender:");
    int v16 = v18;
    if (v18)
    {
      id v19 = v18;
      if (a5) {
        *a5 = 1;
      }
    }
  }
  id v20 = *p_sender;
  id *p_sender = 0;

  return v16;
}

- (void)_performWithSender:(id)a3 handler:(id)a4
{
  p_sender = &self->_sender;
  objc_storeStrong(&self->_sender, a3);
  id v9 = a3;
  uint64_t v7 = (void (**)(void))a4;
  v7[2]();

  id v8 = *p_sender;
  id *p_sender = 0;
}

- (id)_validatedLeafWithAlternate:(id)a3 target:(id)a4 validation:(id)a5
{
  return (id)[a5 validatedCommandForTarget:a4 command:self alternate:a3 sender:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UICommand alloc];
  return [(UICommand *)v4 initWithCommand:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self->__target)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UICommand.m" lineNumber:538 description:@"Commands with explicit targets cannot be encoded."];
  }
  v13.receiver = self;
  v13.super_class = (Class)UICommand;
  [(UIMenuElement *)&v13 encodeWithCoder:v5];
  uint64_t v6 = NSStringFromSelector(self->_action);
  [v5 encodeObject:v6 forKey:@"action"];

  discoverabilityTitle = self->_discoverabilityTitle;
  if (discoverabilityTitle) {
    [v5 encodeObject:discoverabilityTitle forKey:@"discoverabilityTitle"];
  }
  id propertyList = self->_propertyList;
  if (propertyList) {
    [v5 encodeObject:propertyList forKey:@"propertyList"];
  }
  if ([(NSArray *)self->_alternates count]) {
    [v5 encodeObject:self->_alternates forKey:@"alternates"];
  }
  uint64_t v9 = *((unsigned int *)self + 18);
  if (v9) {
    [v5 encodeInteger:v9 forKey:@"attributes"];
  }
  uint64_t v10 = *((int *)self + 19);
  if (v10) {
    [v5 encodeInteger:v10 forKey:@"states"];
  }
  selectedImage = self->_selectedImage;
  if (selectedImage) {
    [v5 encodeObject:selectedImage forKey:@"selectedImage"];
  }
}

- (unint64_t)hash
{
  return (unint64_t)sel_getName(self->_action);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v6 = v4;
    uint64_t v7 = (const char *)[v6 action];
    if (v7 == [(UICommand *)self action])
    {
      id v8 = [v6 propertyList];
      uint64_t v9 = [(UICommand *)self propertyList];
      id v10 = v8;
      id v11 = v9;
      id v12 = v11;
      if (v10 == v11)
      {
        char v5 = 1;
      }
      else
      {
        char v5 = 0;
        if (v10 && v11) {
          char v5 = [v10 isEqual:v11];
        }
      }
    }
    else
    {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)UICommand;
  BOOL v3 = [(UICommand *)&v8 description];
  id v4 = (void *)[v3 mutableCopy];

  char v5 = [(UIMenuElement *)self title];
  [v4 appendFormat:@" -> Title: %@", v5];

  if ([(UICommand *)self action])
  {
    id v6 = NSStringFromSelector([(UICommand *)self action]);
    [v4 appendFormat:@"  Action: %@", v6];
  }
  return (NSString *)v4;
}

- (void)_addStateObserver:(id)a3
{
}

- (void)_removeStateObserver:(id)a3
{
}

- (NSPointerArray)_getStateObservers
{
  return self->stateObservers;
}

- (void)_setStateObservers:(id)a3
{
}

- (UIMenuElementAttributes)attributes
{
  return *((unsigned int *)self + 18);
}

- (void)setAttributes:(UIMenuElementAttributes)attributes
{
  *((_DWORD *)self + 18) = attributes;
}

- (UIMenuElementState)state
{
  return (uint64_t)*((int *)self + 19);
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
}

- (NSString)discoverabilityTitle
{
  return self->_discoverabilityTitle;
}

- (NSArray)alternates
{
  return self->_alternates;
}

- (SEL)fallbackAction
{
  return self->_fallbackAction;
}

- (BOOL)_useSenderForResolvingTarget
{
  return self->__useSenderForResolvingTarget;
}

- (void)set_useSenderForResolvingTarget:(BOOL)a3
{
  self->__useSenderForResolvingTarget = a3;
}

- (id)_target
{
  return self->__target;
}

@end