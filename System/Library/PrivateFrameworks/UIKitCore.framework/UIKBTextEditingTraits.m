@interface UIKBTextEditingTraits
+ (UIKBTextEditingTraits)traitsWithResponder:(id)a3 keyMaskFlags:(unint64_t)a4;
+ (id)traitsForEditingInteractionWithFirstResponder:(id)a3 canRespondBlock:(id)a4 keyMaskFlags:(unint64_t)a5;
- (BOOL)canCopy;
- (BOOL)canCut;
- (BOOL)canMoveCursorLeft;
- (BOOL)canMoveCursorRight;
- (BOOL)canPaste;
- (BOOL)canToggleBoldface;
- (BOOL)canToggleItalics;
- (BOOL)canToggleUnderline;
- (BOOL)isBold;
- (BOOL)isItalicized;
- (BOOL)isUnderlined;
- (BOOL)supportStyling;
- (UIKBTextEditingTraits)initWithResponder:(id)a3 canRespondBlock:(id)a4 keyMaskFlags:(unint64_t)a5 sender:(id)a6;
- (UIResponder)firstResponder;
- (void)setCanCut:(BOOL)a3;
@end

@implementation UIKBTextEditingTraits

- (UIKBTextEditingTraits)initWithResponder:(id)a3 canRespondBlock:(id)a4 keyMaskFlags:(unint64_t)a5 sender:(id)a6
{
  char v7 = a5;
  id v10 = a3;
  v11 = (uint64_t (**)(id, char *, void))a4;
  id v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)UIKBTextEditingTraits;
  v13 = [(UIKBTextEditingTraits *)&v27 init];
  v14 = v13;
  v15 = 0;
  if (v10 && v13)
  {
    objc_storeWeak((id *)&v13->_firstResponder, v10);
    if ((v7 & 4) != 0
      && +[UIResponder conformsToProtocol:&unk_1ED42F658])
    {
      id v16 = v10;
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_9;
      }
      v17 = [v16 selectedTextRange];
      v18 = [v17 start];

      if (!v18) {
        goto LABEL_9;
      }
      v19 = [v16 selectedTextRange];
      v20 = [v19 start];
      v21 = objc_msgSend(v16, "textStylingAtPosition:inDirection:", v20, objc_msgSend(v16, "selectionAffinity"));

      if (v21)
      {
        v14->_supportStyling = 1;
        v22 = [v21 objectForKey:*(void *)off_1E52D2040];
        v23 = [v22 fontDescriptor];
        v14->_isBold = ([v23 symbolicTraits] & 2) != 0;

        v24 = [v22 fontDescriptor];
        v14->_isItalicized = [v24 symbolicTraits] & 1;

        v25 = [v21 objectForKey:*(void *)off_1E52D23E8];
        v14->_isUnderlined = [v25 BOOLValue];

        v14->_canToggleBoldface = v11[2](v11, sel_toggleBoldface_, 0);
        v14->_canToggleItalics = v11[2](v11, sel_toggleItalics_, 0);
        v14->_canToggleUnderline = v11[2](v11, sel_toggleUnderline_, 0);
      }
      else
      {
LABEL_9:
        *(_WORD *)&v14->_isBold = 0;
        v14->_isUnderlined = 0;
        *(_DWORD *)&v14->_canToggleBoldface = 0;
      }
    }
    if ((v7 & 2) != 0)
    {
      v14->_canCut = ((uint64_t (**)(id, char *, id))v11)[2](v11, sel_cut_, v12);
      v14->_canCopy = ((uint64_t (**)(id, char *, id))v11)[2](v11, sel_copy_, v12);
      v14->_canPaste = ((uint64_t (**)(id, char *, id))v11)[2](v11, sel_paste_, v12);
    }
    v14->_canMoveCursorLeft = v7 & 1;
    v14->_canMoveCursorRight = v7 & 1;
    v15 = v14;
  }

  return v15;
}

+ (UIKBTextEditingTraits)traitsWithResponder:(id)a3 keyMaskFlags:(unint64_t)a4
{
  id v5 = a3;
  v6 = [UIKBTextEditingTraits alloc];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__UIKBTextEditingTraits_traitsWithResponder_keyMaskFlags___block_invoke;
  v10[3] = &unk_1E52FD0C8;
  id v11 = v5;
  id v7 = v5;
  v8 = [(UIKBTextEditingTraits *)v6 initWithResponder:v7 canRespondBlock:v10 keyMaskFlags:a4 sender:0];

  return v8;
}

uint64_t __58__UIKBTextEditingTraits_traitsWithResponder_keyMaskFlags___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) canPerformAction:a2 withSender:a3];
}

+ (id)traitsForEditingInteractionWithFirstResponder:(id)a3 canRespondBlock:(id)a4 keyMaskFlags:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[UIKBTextEditingTraits alloc] initWithResponder:v8 canRespondBlock:v7 keyMaskFlags:a5 sender:@"UIEditingInteraction"];

  return v9;
}

- (BOOL)canToggleBoldface
{
  return self->_canToggleBoldface;
}

- (BOOL)canToggleItalics
{
  return self->_canToggleItalics;
}

- (BOOL)canToggleUnderline
{
  return self->_canToggleUnderline;
}

- (BOOL)supportStyling
{
  return self->_supportStyling;
}

- (BOOL)canCut
{
  return self->_canCut;
}

- (void)setCanCut:(BOOL)a3
{
  self->_canCut = a3;
}

- (BOOL)canCopy
{
  return self->_canCopy;
}

- (BOOL)canPaste
{
  return self->_canPaste;
}

- (BOOL)canMoveCursorLeft
{
  return self->_canMoveCursorLeft;
}

- (BOOL)canMoveCursorRight
{
  return self->_canMoveCursorRight;
}

- (UIResponder)firstResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstResponder);
  return (UIResponder *)WeakRetained;
}

- (BOOL)isBold
{
  return self->_isBold;
}

- (BOOL)isItalicized
{
  return self->_isItalicized;
}

- (BOOL)isUnderlined
{
  return self->_isUnderlined;
}

- (void).cxx_destruct
{
}

@end