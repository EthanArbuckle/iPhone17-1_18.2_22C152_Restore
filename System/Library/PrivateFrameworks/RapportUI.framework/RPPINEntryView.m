@interface RPPINEntryView
- (BOOL)alphaNumeric;
- (BOOL)canBecomeFirstResponder;
- (BOOL)disabled;
- (BOOL)hasText;
- (NSArray)labels;
- (NSArray)wells;
- (NSString)text;
- (UIColor)wellFocusColor;
- (UILabel)label1;
- (UILabel)label2;
- (UILabel)label3;
- (UILabel)label4;
- (UILabel)label5;
- (UILabel)label6;
- (UILabel)label7;
- (UILabel)label8;
- (UIView)well1;
- (UIView)well2;
- (UIView)well3;
- (UIView)well4;
- (UIView)well5;
- (UIView)well6;
- (UIView)well7;
- (UIView)well8;
- (id)textChangedHandler;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (int64_t)spellCheckingType;
- (void)_updateFields;
- (void)awakeFromNib;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)setAlphaNumeric:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setLabel1:(id)a3;
- (void)setLabel2:(id)a3;
- (void)setLabel3:(id)a3;
- (void)setLabel4:(id)a3;
- (void)setLabel5:(id)a3;
- (void)setLabel6:(id)a3;
- (void)setLabel7:(id)a3;
- (void)setLabel8:(id)a3;
- (void)setLabels:(id)a3;
- (void)setText:(id)a3;
- (void)setTextChangedHandler:(id)a3;
- (void)setWell1:(id)a3;
- (void)setWell2:(id)a3;
- (void)setWell3:(id)a3;
- (void)setWell4:(id)a3;
- (void)setWell5:(id)a3;
- (void)setWell6:(id)a3;
- (void)setWell7:(id)a3;
- (void)setWell8:(id)a3;
- (void)setWellFocusColor:(id)a3;
- (void)setWells:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation RPPINEntryView

- (void)awakeFromNib
{
  v7.receiver = self;
  v7.super_class = (Class)RPPINEntryView;
  [(RPPINEntryView *)&v7 awakeFromNib];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = v3;
  if (self->_label1) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_label2) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_label3) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_label4) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_label5) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_label6) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_label7) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_label8) {
    objc_msgSend(v4, "addObject:");
  }
  if ([v4 count]) {
    objc_storeStrong((id *)&self->_labels, v4);
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = v5;
  if (self->_well1) {
    objc_msgSend(v5, "addObject:");
  }
  if (self->_well2) {
    objc_msgSend(v6, "addObject:");
  }
  if (self->_well3) {
    objc_msgSend(v6, "addObject:");
  }
  if (self->_well4) {
    objc_msgSend(v6, "addObject:");
  }
  if (self->_well5) {
    objc_msgSend(v6, "addObject:");
  }
  if (self->_well6) {
    objc_msgSend(v6, "addObject:");
  }
  if (self->_well7) {
    objc_msgSend(v6, "addObject:");
  }
  if (self->_well8) {
    objc_msgSend(v6, "addObject:");
  }
  if ([v6 count]) {
    objc_storeStrong((id *)&self->_wells, v6);
  }
  [(RPPINEntryView *)self setText:&stru_26F2A7210];
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  [(RPPINEntryView *)self _updateFields];
}

- (NSString)text
{
  text = self->_text;
  if (text) {
    id v3 = (__CFString *)[(NSMutableString *)text copy];
  }
  else {
    id v3 = &stru_26F2A7210;
  }
  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  v4 = [a3 uppercaseString];
  id v5 = (NSMutableString *)[v4 mutableCopy];
  text = self->_text;
  self->_text = v5;

  [(RPPINEntryView *)self _updateFields];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)RPPINEntryView;
  [(RPPINEntryView *)&v5 touchesBegan:a3 withEvent:a4];
  if (!self->_disabled) {
    [(RPPINEntryView *)self becomeFirstResponder];
  }
}

- (void)_updateFields
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  NSUInteger v3 = [(NSArray *)self->_wells count];
  v4 = &stru_26F2A7210;
  if (!v3) {
    v4 = @"-";
  }
  v30 = v4;
  unint64_t v5 = [(NSMutableString *)self->_text length];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v6 = self->_labels;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (v9 + i >= v5)
        {
          [*(id *)(*((void *)&v35 + 1) + 8 * i) setText:v30];
        }
        else
        {
          v13 = -[NSMutableString substringWithRange:](self->_text, "substringWithRange:");
          [v12 setText:v13];
        }
        if (self->_disabled) {
          [MEMORY[0x263F1C550] systemGrayColor];
        }
        else {
        v14 = [MEMORY[0x263F1C550] blackColor];
        }
        [v12 setTextColor:v14];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
      v9 += i;
    }
    while (v8);
  }

  wellFocusColor = self->_wellFocusColor;
  if (wellFocusColor)
  {
    v16 = wellFocusColor;
  }
  else
  {
    v16 = [MEMORY[0x263F1C550] grayColor];
  }
  v29 = v16;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v17 = self->_wells;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v32;
    do
    {
      uint64_t v22 = 0;
      uint64_t v28 = v20;
      uint64_t v23 = v5 - v20;
      do
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v17);
        }
        v24 = *(void **)(*((void *)&v31 + 1) + 8 * v22);
        if (v23 == v22 && !self->_disabled)
        {
          [*(id *)(*((void *)&v31 + 1) + 8 * v22) setBorderColor:v29];
          double v26 = 2.0;
        }
        else
        {
          v25 = [MEMORY[0x263F1C550] colorWithWhite:0.800000012 alpha:1.0];
          [v24 setBorderColor:v25];

          double v26 = 1.5;
        }
        [v24 setBorderWidth:v26];
        ++v22;
      }
      while (v19 != v22);
      uint64_t v20 = v28 + v19;
      uint64_t v27 = [(NSArray *)v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
      uint64_t v19 = v27;
    }
    while (v27);
  }
}

- (int64_t)autocapitalizationType
{
  return 3;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)deleteBackward
{
  if (!self->_disabled)
  {
    if ([(NSMutableString *)self->_text length])
    {
      text = self->_text;
      uint64_t v4 = [(NSMutableString *)text rangeOfComposedCharacterSequenceAtIndex:[(NSMutableString *)text length] - 1];
      -[NSMutableString deleteCharactersInRange:](text, "deleteCharactersInRange:", v4, v5);
      [(RPPINEntryView *)self _updateFields];
      id textChangedHandler = self->_textChangedHandler;
      if (textChangedHandler)
      {
        uint64_t v7 = (void (*)(void))*((void *)textChangedHandler + 2);
        v7();
      }
    }
  }
}

- (void)insertText:(id)a3
{
  id textChangedHandler = a3;
  id v5 = textChangedHandler;
  if (!self->_disabled)
  {
    id v19 = textChangedHandler;
    v6 = (unsigned char *)[textChangedHandler UTF8String];
    NSUInteger v7 = [(NSArray *)self->_labels count];
    NSUInteger v8 = v7 - [(NSMutableString *)self->_text length];
    unsigned int v9 = *v6;
    if (*v6) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      uint64_t v11 = MEMORY[0x263EF8318];
      v12 = v6 + 1;
      do
      {
        if ((v9 & 0x80) != 0)
        {
          if (__maskrune(v9, 0x4000uLL)) {
            goto LABEL_24;
          }
        }
        else if ((*(_DWORD *)(v11 + 4 * v9 + 60) & 0x4000) != 0)
        {
          goto LABEL_24;
        }
        if (self->_alphaNumeric)
        {
          if ((v9 & 0x80) != 0)
          {
            __maskrune(v9, 0x500uLL);
          }
          else if ((*(_DWORD *)(v11 + 4 * v9 + 60) & 0x500) != 0 && v9 - 48 < 0xA)
          {
LABEL_20:
            text = self->_text;
            if (!text)
            {
              v15 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
              v16 = self->_text;
              self->_text = v15;

              text = self->_text;
            }
            [(NSMutableString *)text appendFormat:@"%c", __toupper(v9)];
            --v8;
          }
        }
        else if (v9 - 48 <= 9)
        {
          goto LABEL_20;
        }
LABEL_24:
        unsigned int v17 = *v12++;
        unsigned int v9 = v17;
      }
      while (v17 && v8);
    }
    [(RPPINEntryView *)self _updateFields];
    id textChangedHandler = self->_textChangedHandler;
    id v5 = v19;
    if (textChangedHandler)
    {
      if (self->_text) {
        uint64_t v18 = self->_text;
      }
      else {
        uint64_t v18 = (NSMutableString *)&stru_26F2A7210;
      }
      id textChangedHandler = (id)(*((uint64_t (**)(id, NSMutableString *))textChangedHandler + 2))(textChangedHandler, v18);
      id v5 = v19;
    }
  }
  MEMORY[0x270F9A758](textChangedHandler, v5);
}

- (BOOL)hasText
{
  return [(NSMutableString *)self->_text length] != 0;
}

- (int64_t)keyboardAppearance
{
  return 0;
}

- (int64_t)keyboardType
{
  if (self->_alphaNumeric) {
    return 6;
  }
  else {
    return 11;
  }
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (BOOL)alphaNumeric
{
  return self->_alphaNumeric;
}

- (void)setAlphaNumeric:(BOOL)a3
{
  self->_alphaNumeric = a3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (UILabel)label1
{
  return self->_label1;
}

- (void)setLabel1:(id)a3
{
}

- (UILabel)label2
{
  return self->_label2;
}

- (void)setLabel2:(id)a3
{
}

- (UILabel)label3
{
  return self->_label3;
}

- (void)setLabel3:(id)a3
{
}

- (UILabel)label4
{
  return self->_label4;
}

- (void)setLabel4:(id)a3
{
}

- (UILabel)label5
{
  return self->_label5;
}

- (void)setLabel5:(id)a3
{
}

- (UILabel)label6
{
  return self->_label6;
}

- (void)setLabel6:(id)a3
{
}

- (UILabel)label7
{
  return self->_label7;
}

- (void)setLabel7:(id)a3
{
}

- (UILabel)label8
{
  return self->_label8;
}

- (void)setLabel8:(id)a3
{
}

- (id)textChangedHandler
{
  return self->_textChangedHandler;
}

- (void)setTextChangedHandler:(id)a3
{
}

- (NSArray)wells
{
  return self->_wells;
}

- (void)setWells:(id)a3
{
}

- (UIView)well1
{
  return self->_well1;
}

- (void)setWell1:(id)a3
{
}

- (UIView)well2
{
  return self->_well2;
}

- (void)setWell2:(id)a3
{
}

- (UIView)well3
{
  return self->_well3;
}

- (void)setWell3:(id)a3
{
}

- (UIView)well4
{
  return self->_well4;
}

- (void)setWell4:(id)a3
{
}

- (UIView)well5
{
  return self->_well5;
}

- (void)setWell5:(id)a3
{
}

- (UIView)well6
{
  return self->_well6;
}

- (void)setWell6:(id)a3
{
}

- (UIView)well7
{
  return self->_well7;
}

- (void)setWell7:(id)a3
{
}

- (UIView)well8
{
  return self->_well8;
}

- (void)setWell8:(id)a3
{
}

- (UIColor)wellFocusColor
{
  return self->_wellFocusColor;
}

- (void)setWellFocusColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wellFocusColor, 0);
  objc_storeStrong((id *)&self->_well8, 0);
  objc_storeStrong((id *)&self->_well7, 0);
  objc_storeStrong((id *)&self->_well6, 0);
  objc_storeStrong((id *)&self->_well5, 0);
  objc_storeStrong((id *)&self->_well4, 0);
  objc_storeStrong((id *)&self->_well3, 0);
  objc_storeStrong((id *)&self->_well2, 0);
  objc_storeStrong((id *)&self->_well1, 0);
  objc_storeStrong((id *)&self->_wells, 0);
  objc_storeStrong(&self->_textChangedHandler, 0);
  objc_storeStrong((id *)&self->_label8, 0);
  objc_storeStrong((id *)&self->_label7, 0);
  objc_storeStrong((id *)&self->_label6, 0);
  objc_storeStrong((id *)&self->_label5, 0);
  objc_storeStrong((id *)&self->_label4, 0);
  objc_storeStrong((id *)&self->_label3, 0);
  objc_storeStrong((id *)&self->_label2, 0);
  objc_storeStrong((id *)&self->_label1, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end