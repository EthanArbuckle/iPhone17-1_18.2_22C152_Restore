@interface RAPAddressLayoutOptions
+ (id)allFieldsDisabledOptions;
+ (id)allFieldsEnabledOptions;
+ (id)clientOverrideOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)showBuilding;
- (BOOL)showFloor;
- (BOOL)showUnit;
- (RAPAddressLayoutOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)numberOfEnabledOptions;
- (void)setShowBuilding:(BOOL)a3;
- (void)setShowFloor:(BOOL)a3;
- (void)setShowUnit:(BOOL)a3;
@end

@implementation RAPAddressLayoutOptions

+ (id)clientOverrideOptions
{
  v2 = objc_alloc_init(RAPAddressLayoutOptions);
  [(RAPAddressLayoutOptions *)v2 setShowFloor:GEOConfigGetBOOL()];
  [(RAPAddressLayoutOptions *)v2 setShowBuilding:GEOConfigGetBOOL()];
  [(RAPAddressLayoutOptions *)v2 setShowUnit:GEOConfigGetBOOL()];

  return v2;
}

+ (id)allFieldsEnabledOptions
{
  v2 = objc_alloc_init(RAPAddressLayoutOptions);
  [(RAPAddressLayoutOptions *)v2 setShowUnit:1];
  [(RAPAddressLayoutOptions *)v2 setShowBuilding:1];
  [(RAPAddressLayoutOptions *)v2 setShowFloor:1];

  return v2;
}

+ (id)allFieldsDisabledOptions
{
  v2 = objc_alloc_init(RAPAddressLayoutOptions);
  [(RAPAddressLayoutOptions *)v2 setShowUnit:0];
  [(RAPAddressLayoutOptions *)v2 setShowBuilding:0];
  [(RAPAddressLayoutOptions *)v2 setShowFloor:0];

  return v2;
}

- (RAPAddressLayoutOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)RAPAddressLayoutOptions;
  result = [(RAPAddressLayoutOptions *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_showUnit = 0;
    result->_showFloor = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setShowUnit:[self showUnit]];
  [v4 setShowBuilding:[self showBuilding]];
  [v4 setShowFloor:[self showFloor]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(RAPAddressLayoutOptions *)self showFloor];
  if (v5 == [v4 showFloor]
    && (unsigned int v6 = -[RAPAddressLayoutOptions showUnit](self, "showUnit"), v6 == [v4 showUnit]))
  {
    unsigned int v8 = [(RAPAddressLayoutOptions *)self showBuilding];
    unsigned int v7 = v8 ^ [v4 showBuilding] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (int64_t)numberOfEnabledOptions
{
  LODWORD(v3) = [(RAPAddressLayoutOptions *)self showBuilding];
  unsigned int v4 = [(RAPAddressLayoutOptions *)self showFloor];
  uint64_t v5 = 1;
  if (v3) {
    uint64_t v5 = 2;
  }
  if (v4) {
    uint64_t v3 = v5;
  }
  else {
    uint64_t v3 = v3;
  }
  return v3 + [(RAPAddressLayoutOptions *)self showUnit];
}

- (BOOL)showUnit
{
  return self->_showUnit;
}

- (void)setShowUnit:(BOOL)a3
{
  self->_showUnit = a3;
}

- (BOOL)showBuilding
{
  return self->_showBuilding;
}

- (void)setShowBuilding:(BOOL)a3
{
  self->_showBuilding = a3;
}

- (BOOL)showFloor
{
  return self->_showFloor;
}

- (void)setShowFloor:(BOOL)a3
{
  self->_showFloor = a3;
}

@end