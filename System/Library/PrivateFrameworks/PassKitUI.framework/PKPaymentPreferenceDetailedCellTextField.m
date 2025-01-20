@interface PKPaymentPreferenceDetailedCellTextField
- (BOOL)isInvalid;
- (PKPaymentPreferenceDetailedCellTextField)init;
- (void)setIsInvalid:(BOOL)a3;
@end

@implementation PKPaymentPreferenceDetailedCellTextField

- (PKPaymentPreferenceDetailedCellTextField)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPreferenceDetailedCellTextField;
  v2 = [(PKPaymentPreferenceDetailedCellTextField *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] labelColor];
    defaultColor = v2->_defaultColor;
    v2->_defaultColor = (UIColor *)v3;

    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "pkui_osloErrorColor");
    invalidColor = v2->_invalidColor;
    v2->_invalidColor = (UIColor *)v5;
  }
  return v2;
}

- (void)setIsInvalid:(BOOL)a3
{
  if (self->_isInvalid != a3)
  {
    self->_isInvalid = a3;
    uint64_t v3 = 1;
    if (!a3) {
      uint64_t v3 = 0;
    }
    [(PKPaymentPreferenceDetailedCellTextField *)self setTextColor:*(Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___PKPaymentPreferenceDetailedCellTextField__defaultColor[v3])];
  }
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidColor, 0);

  objc_storeStrong((id *)&self->_defaultColor, 0);
}

@end