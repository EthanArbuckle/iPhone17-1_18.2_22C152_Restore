@interface UIStatusBarComposedData
- ($6C45178016D353444451090973A2A97F)rawData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isItemEnabled:(int)a3;
- (NSString)doubleHeightStatus;
- (UIStatusBarComposedData)initWithRawData:(id *)a3;
- (UISystemNavigationAction)systemNavigationItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDoubleHeightStatus:(id)a3;
- (void)setItem:(int)a3 enabled:(BOOL)a4;
- (void)setSystemNavigationItem:(id)a3;
@end

@implementation UIStatusBarComposedData

- (UIStatusBarComposedData)initWithRawData:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIStatusBarComposedData;
  v4 = [(UIStatusBarComposedData *)&v7 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      memcpy(&v4->_rawData, a3, sizeof(v4->_rawData));
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRawData:", -[UIStatusBarComposedData rawData](self, "rawData"));
  v5 = [(UIStatusBarComposedData *)self doubleHeightStatus];
  [v4 setDoubleHeightStatus:v5];

  for (uint64_t i = 0; i != 52; ++i)
    objc_msgSend(v4, "setItem:enabled:", i, -[UIStatusBarComposedData isItemEnabled:](self, "isItemEnabled:", i));
  return v4;
}

- ($6C45178016D353444451090973A2A97F)rawData
{
  return ($6C45178016D353444451090973A2A97F *)&self->_rawData;
}

- (BOOL)isItemEnabled:(int)a3
{
  return a3 <= 0x33 && self->_itemEnabled[a3];
}

- (void)setItem:(int)a3 enabled:(BOOL)a4
{
  if (a3 <= 0x33) {
    self->_itemEnabled[a3] = a4;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (memcmp(&self->_rawData, (const void *)[v5 rawData], 0xF28uLL))
    {
LABEL_3:
      char v6 = 0;
LABEL_17:

      goto LABEL_18;
    }
    objc_super v7 = [(UIStatusBarComposedData *)self doubleHeightStatus];
    v8 = [v5 doubleHeightStatus];
    id v9 = v7;
    id v10 = v8;
    if (v9 == v10)
    {
    }
    else
    {
      v11 = v10;
      char v6 = 0;
      if (!v9 || !v10)
      {
LABEL_16:

        goto LABEL_17;
      }
      char v12 = [v9 isEqual:v10];

      if ((v12 & 1) == 0) {
        goto LABEL_3;
      }
    }
    v13 = [(UIStatusBarComposedData *)self systemNavigationItem];
    v14 = [v5 systemNavigationItem];
    id v9 = v13;
    id v15 = v14;
    if (v9 == v15)
    {
      char v6 = 1;
      v11 = v9;
    }
    else
    {
      v11 = v15;
      char v6 = 0;
      if (v9 && v15) {
        char v6 = [v9 isEqual:v15];
      }
    }
    goto LABEL_16;
  }
  char v6 = 0;
LABEL_18:

  return v6;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarComposedData;
  v3 = [(UIStatusBarComposedData *)&v8 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @"\nPrimary breadcrumb override: “%s”", -[UIStatusBarComposedData rawData](self, "rawData") + 2537);
  objc_msgSend(v4, "appendFormat:", @"\nSecondary breadcrumb override: “%s”", -[UIStatusBarComposedData rawData](self, "rawData") + 2793);
  objc_msgSend(v4, "appendFormat:", @"\nService: “%s”", -[UIStatusBarComposedData rawData](self, "rawData") + 448);
  if ([(UIStatusBarComposedData *)self isItemEnabled:6]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [v4 appendFormat:@"\nService Enabled? %@", v5];
  objc_msgSend(v4, "appendFormat:", @"\nPerson Name: “%s”", -[UIStatusBarComposedData rawData](self, "rawData") + 3049);
  if ([(UIStatusBarComposedData *)self isItemEnabled:8]) {
    char v6 = @"YES";
  }
  else {
    char v6 = @"NO";
  }
  [v4 appendFormat:@"\nPerson Enabled? %@", v6];
  return v4;
}

- (NSString)doubleHeightStatus
{
  return self->_doubleHeightStatus;
}

- (void)setDoubleHeightStatus:(id)a3
{
}

- (UISystemNavigationAction)systemNavigationItem
{
  return self->_systemNavigationItem;
}

- (void)setSystemNavigationItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemNavigationItem, 0);
  objc_storeStrong((id *)&self->_doubleHeightStatus, 0);
}

@end