@interface SFProxyText
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (SFProxyText)initWithCoder:(id)a3;
- (SFProxyText)initWithSlotIdentifier:(unsigned int)a3;
- (SFProxyText)initWithSlotIdentifier:(unsigned int)a3 slotTextHeight:(double)a4;
- (SFProxyText)initWithText:(id)a3;
- (double)slotTextHeight;
- (id)description;
- (unint64_t)hash;
- (unsigned)slotIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFProxyText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFProxyText)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
  uint64_t v6 = [v4 decodeInt32ForKey:@"slotIdentifier"];
  [v4 decodeDoubleForKey:@"slotTextHeight"];
  double v8 = v7;

  if (v5) {
    v9 = [(SFProxyText *)self initWithText:v5];
  }
  else {
    v9 = [(SFProxyText *)self initWithSlotIdentifier:v6 slotTextHeight:v8];
  }
  v10 = v9;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeInt32:self->_slotIdentifier forKey:@"slotIdentifier"];
  [v5 encodeDouble:@"slotTextHeight" forKey:self->_slotTextHeight];
}

- (SFProxyText)initWithText:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFProxyText;
  id v5 = [(SFProxyText *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    text = v5->_text;
    v5->_text = (NSString *)v6;
  }
  return v5;
}

- (SFProxyText)initWithSlotIdentifier:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFProxyText;
  result = [(SFProxyText *)&v5 init];
  if (result) {
    result->_slotIdentifier = a3;
  }
  return result;
}

- (SFProxyText)initWithSlotIdentifier:(unsigned int)a3 slotTextHeight:(double)a4
{
  result = [(SFProxyText *)self initWithSlotIdentifier:*(void *)&a3];
  if (result) {
    result->_slotTextHeight = a4;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)SFProxyText;
  id v4 = [(SFProxyText *)&v10 description];
  objc_super v5 = [(SFProxyText *)self text];
  uint64_t v6 = [(SFProxyText *)self slotIdentifier];
  [(SFProxyText *)self slotTextHeight];
  double v8 = [v3 stringWithFormat:@"<%@: text:%@ slotIdentifier:%u slotTextHeight:%f>", v4, v5, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 hash];

  uint64_t v6 = [(SFProxyText *)self text];
  if (v6)
  {
    uint64_t v7 = [(SFProxyText *)self text];
    uint64_t v8 = [v7 hash];
  }
  else
  {
    uint64_t v8 = [(SFProxyText *)self slotIdentifier];
  }

  return v8 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFProxyText *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(SFProxyText *)self text];
      uint64_t v7 = [(SFProxyText *)v5 text];
      id v8 = v6;
      id v9 = v7;
      objc_super v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        if ((v8 == 0) == (v9 != 0))
        {

          goto LABEL_13;
        }
        int v11 = [v8 isEqual:v9];

        if (!v11) {
          goto LABEL_13;
        }
      }
      unsigned int v13 = [(SFProxyText *)self slotIdentifier];
      if (v13 == [(SFProxyText *)v5 slotIdentifier])
      {
        [(SFProxyText *)self slotTextHeight];
        double v15 = v14;
        [(SFProxyText *)v5 slotTextHeight];
        BOOL v12 = v15 == v16;
LABEL_14:

        goto LABEL_15;
      }
LABEL_13:
      BOOL v12 = 0;
      goto LABEL_14;
    }
    BOOL v12 = 0;
  }
LABEL_15:

  return v12;
}

- (NSString)text
{
  return self->_text;
}

- (unsigned)slotIdentifier
{
  return self->_slotIdentifier;
}

- (double)slotTextHeight
{
  return self->_slotTextHeight;
}

- (void).cxx_destruct
{
}

@end