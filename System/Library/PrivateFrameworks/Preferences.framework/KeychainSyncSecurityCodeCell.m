@interface KeychainSyncSecurityCodeCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (NSString)firstPasscodeEntry;
- (int)mode;
- (int)securityCodeType;
- (void)layoutSubviews;
- (void)setBulletText:(id)a3;
- (void)setFirstPasscodeEntry:(id)a3;
- (void)setMode:(int)a3;
- (void)setSecurityCodeType:(int)a3;
@end

@implementation KeychainSyncSecurityCodeCell

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  int securityCodeType = self->_securityCodeType;
  if (securityCodeType == 1)
  {
    v14 = [v9 text];
    v15 = objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", location, length, v10);

    unint64_t v16 = [v15 length];
    if (v16 > 0x20)
    {
LABEL_29:
      BOOL v17 = 0;
      goto LABEL_30;
    }
  }
  else if (securityCodeType == 2)
  {
    if (self->_firstPasscodeEntry || (self->_mode & 0xFFFFFFFE) == 2)
    {
      v12 = [v9 text];
      if (self->_mode == 3)
      {
        [v9 setText:&stru_1EFB51FD0];
        uint64_t v13 = [v9 text];

        NSUInteger location = 0;
        NSUInteger length = 0;
        v12 = (void *)v13;
      }
      if (length + location <= [v12 length])
      {
        unint64_t v31 = [(NSString *)self->_firstPasscodeEntry length];
        uint64_t v18 = [v9 selectionRange];
        unint64_t v19 = v18 + [v10 length];
        if (length == 1) {
          unint64_t v19 = (__PAIR128__(v19, [v10 length]) - 1) >> 64;
        }
        v20 = objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v10);

        v21 = [v20 uppercaseString];

        v22 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
        v23 = [v22 invertedSet];

        v24 = (void *)[v21 mutableCopy];
        uint64_t v25 = [v24 length];
        if (v25 - 1 < 1)
        {
          int v27 = 0;
        }
        else
        {
          uint64_t v26 = v25;
          int v27 = 0;
          do
          {
            if (objc_msgSend(v23, "characterIsMember:", objc_msgSend(v24, "characterAtIndex:", --v26)))
            {
              objc_msgSend(v24, "deleteCharactersInRange:", v26, 1);
              v27 -= v26 < v19;
            }
          }
          while (v26 > 1);
        }
        if ((unint64_t)[v24 length] >= 5)
        {
          unint64_t v28 = 4;
          do
          {
            if (v19 > v28) {
              ++v27;
            }
            [v24 insertString:@"-" atIndex:v28];
            v28 += 5;
          }
          while ([v24 length] > v28);
        }
        if ([v24 length] <= v31 || (self->_mode & 0xFFFFFFFE) == 2)
        {
          [v9 setText:v24];
          objc_msgSend(v9, "setSelectionRange:", v19 + v27, 0);
          v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v29 postNotificationName:*MEMORY[0x1E4F43E28] object:v9];
        }
      }
      else
      {
      }
    }
    goto LABEL_29;
  }
  BOOL v17 = 1;
LABEL_30:

  return v17;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return self->_securityCodeType != 2 || self->_firstPasscodeEntry || self->_mode == 2;
}

- (void)setBulletText:(id)a3
{
  id v12 = a3;
  if (!self->_bulletTextLabel && [v12 length])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    bulletTextLabel = self->_bulletTextLabel;
    self->_bulletTextLabel = v5;

    v7 = self->_bulletTextLabel;
    v8 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:13.0];
    [(UILabel *)v7 setFont:v8];

    id v9 = [(KeychainSyncSecurityCodeCell *)self contentView];
    [v9 addSubview:self->_bulletTextLabel];
  }
  id v10 = [(UILabel *)self->_bulletTextLabel text];
  char v11 = [v10 isEqualToString:v12];

  if ((v11 & 1) == 0)
  {
    [(UILabel *)self->_bulletTextLabel setText:v12];
    [(UILabel *)self->_bulletTextLabel sizeToFit];
    [(KeychainSyncSecurityCodeCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)KeychainSyncSecurityCodeCell;
  [(PSEditableTableCell *)&v41 layoutSubviews];
  v3 = [(KeychainSyncSecurityCodeCell *)self contentView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  id v10 = [(KeychainSyncSecurityCodeCell *)self contentView];
  char v11 = [v10 layer];
  [v11 borderWidth];
  double v13 = v12;

  if (v13 > 0.0)
  {
    double v7 = v7 + -30.0;
    v14 = [(KeychainSyncSecurityCodeCell *)self contentView];
    objc_msgSend(v14, "setFrame:", 15.0, v5, v7, v9);
  }
  v15 = [(UILabel *)self->_bulletTextLabel text];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    [(UILabel *)self->_bulletTextLabel frame];
    double v18 = v17;
    double v20 = v19;
    v21 = [(PSEditableTableCell *)self textField];
    [v21 frame];
    double v23 = v22;
    v24 = [(PSEditableTableCell *)self textField];
    uint64_t v25 = [v24 font];
    [v25 ascender];
    double v27 = v23 + v26;
    unint64_t v28 = [(UILabel *)self->_bulletTextLabel font];
    [v28 ascender];
    double v30 = v27 - v29;

    if (PSLocaleLanguageDirection() == 1) {
      double v31 = 15.0;
    }
    else {
      double v31 = v7 + -15.0 - v18;
    }
    -[UILabel setFrame:](self->_bulletTextLabel, "setFrame:", v31, v30, v18, v20);
  }
  else
  {
    double v31 = *MEMORY[0x1E4F1DB28];
    double v30 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v32 = [(PSEditableTableCell *)self textField];
  [v32 frame];
  double v34 = v33;
  double v36 = v35;

  if (PSLocaleLanguageDirection() == 1)
  {
    v42.origin.x = v31;
    v42.origin.y = v30;
    v42.size.width = v18;
    v42.size.height = v20;
    double v37 = CGRectGetMaxX(v42) + 15.0;
    v43.origin.x = v31;
    v43.origin.y = v30;
    v43.size.width = v18;
    v43.size.height = v20;
    double v38 = v7 - CGRectGetMaxX(v43) + -30.0;
  }
  else
  {
    double v39 = 0.0;
    double v37 = 15.0;
    if (v18 > 0.0) {
      double v39 = 15.0;
    }
    double v38 = v7 - v18 + -30.0 - v39;
  }
  v40 = [(PSEditableTableCell *)self textField];
  objc_msgSend(v40, "setFrame:", v37, v34, v38, v36);
}

- (int)securityCodeType
{
  return self->_securityCodeType;
}

- (void)setSecurityCodeType:(int)a3
{
  self->_int securityCodeType = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (NSString)firstPasscodeEntry
{
  return self->_firstPasscodeEntry;
}

- (void)setFirstPasscodeEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPasscodeEntry, 0);
  objc_storeStrong((id *)&self->_bulletTextLabel, 0);
}

@end