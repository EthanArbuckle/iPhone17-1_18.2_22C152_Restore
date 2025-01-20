@interface SFWebpageStatusBarInfoMessage
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)attributedMessageString;
- (id)initWithString:(id *)a1;
- (unint64_t)hash;
@end

@implementation SFWebpageStatusBarInfoMessage

- (id)initWithString:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)SFWebpageStatusBarInfoMessage;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (NSAttributedString)attributedMessageString
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_message];

  return (NSAttributedString *)v2;
}

- (BOOL)isEmpty
{
  return [(NSString *)self->_message length] == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFWebpageStatusBarInfoMessage *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = WBSIsEqual();
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_message hash];
}

- (void).cxx_destruct
{
}

@end