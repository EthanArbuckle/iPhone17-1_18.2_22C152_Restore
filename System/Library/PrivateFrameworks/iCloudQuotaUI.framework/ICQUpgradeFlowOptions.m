@interface ICQUpgradeFlowOptions
+ (BOOL)supportsSecureCoding;
+ (id)flowOptionsFromData:(id)a3;
- (ICQUpgradeFlowOptions)initWithCoder:(id)a3;
- (UIColor)buttonTintColor;
- (UIColor)navigationBarTintColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializedData;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonTintColor:(id)a3;
- (void)setNavigationBarTintColor:(id)a3;
@end

@implementation ICQUpgradeFlowOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(ICQUpgradeFlowOptions *)self navigationBarTintColor];
  [v4 setNavigationBarTintColor:v5];

  v6 = [(ICQUpgradeFlowOptions *)self buttonTintColor];
  [v4 setButtonTintColor:v6];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  navigationBarTintColor = self->_navigationBarTintColor;
  id v5 = a3;
  [v5 encodeObject:navigationBarTintColor forKey:@"navigationBarTintColor"];
  [v5 encodeObject:self->_buttonTintColor forKey:@"buttonTintColor"];
}

- (ICQUpgradeFlowOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICQUpgradeFlowOptions;
  id v5 = [(ICQUpgradeFlowOptions *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"navigationBarTintColor"];
    navigationBarTintColor = v5->_navigationBarTintColor;
    v5->_navigationBarTintColor = (UIColor *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buttonTintColor"];
    buttonTintColor = v5->_buttonTintColor;
    v5->_buttonTintColor = (UIColor *)v8;
  }
  return v5;
}

- (UIColor)navigationBarTintColor
{
  return self->_navigationBarTintColor;
}

- (void)setNavigationBarTintColor:(id)a3
{
}

- (UIColor)buttonTintColor
{
  return self->_buttonTintColor;
}

- (void)setButtonTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_navigationBarTintColor, 0);
}

- (id)serializedData
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v9 = 0;
  v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v9];
  id v4 = (ICQUpgradeFlowOptions *)v9;
  id v5 = _ICQGetLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    objc_super v11 = v4;
    v7 = "Caught error (%@) serializing flowOptions";
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    objc_super v11 = self;
    v7 = "flowOptions %@ encoded successfully";
  }
  _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
LABEL_7:

  return v3;
}

+ (id)flowOptionsFromData:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v12 = 0;
    id v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v12];
    id v5 = v12;
    BOOL v6 = _ICQGetLogSystem();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412546;
        v14 = v5;
        __int16 v15 = 2112;
        id v16 = v3;
        uint64_t v8 = "Caught error (%@) unserializing flowOptions data (%@)";
        id v9 = v6;
        uint32_t v10 = 22;
LABEL_10:
        _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
    else if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      uint64_t v8 = "Successfully formed FlowOptions: %@";
      id v9 = v6;
      uint32_t v10 = 12;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "flow options is nil", buf, 2u);
  }
  id v4 = 0;
LABEL_12:

  return v4;
}

@end