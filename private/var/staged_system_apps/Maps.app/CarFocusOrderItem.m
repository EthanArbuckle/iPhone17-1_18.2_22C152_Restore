@interface CarFocusOrderItem
+ (CarFocusOrderItem)itemWithFocusItem:(id)a3;
+ (CarFocusOrderItem)itemWithRepresentativeItemType:(unint64_t)a3;
- (BOOL)flipForRHD;
- (NSNumber)representativeItemTypeNumber;
- (UIFocusItem)focusItem;
- (id)itemFlippedForRHD;
- (unint64_t)representativeItemType;
- (void)ifFocusItem:(id)a3 ifRepresentativeItem:(id)a4;
- (void)setFlipForRHD:(BOOL)a3;
- (void)setFocusItem:(id)a3;
- (void)setRepresentativeItemTypeNumber:(id)a3;
@end

@implementation CarFocusOrderItem

+ (CarFocusOrderItem)itemWithFocusItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setFocusItem:v4];

  [v5 setRepresentativeItemTypeNumber:&off_1013AA5A0];

  return (CarFocusOrderItem *)v5;
}

+ (CarFocusOrderItem)itemWithRepresentativeItemType:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  [v4 setRepresentativeItemTypeNumber:v5];

  return (CarFocusOrderItem *)v4;
}

- (unint64_t)representativeItemType
{
  v2 = [(CarFocusOrderItem *)self representativeItemTypeNumber];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)itemFlippedForRHD
{
  return self;
}

- (BOOL)flipForRHD
{
  if (!self->_flipForRHD) {
    return 0;
  }
  v2 = +[MapsExternalDevice sharedInstance];
  unsigned __int8 v3 = [v2 rightHandDrive];

  return v3;
}

- (void)ifFocusItem:(id)a3 ifRepresentativeItem:(id)a4
{
  v8 = a3;
  v6 = a4;
  if (self->_focusItem)
  {
    v7 = (void (*)(void))v8[2];
  }
  else
  {
    if (!self->_representativeItemTypeNumber) {
      goto LABEL_6;
    }
    [(CarFocusOrderItem *)self representativeItemType];
    v7 = (void (*)(void))v6[2];
  }
  v7();
LABEL_6:
}

- (UIFocusItem)focusItem
{
  return self->_focusItem;
}

- (void)setFocusItem:(id)a3
{
}

- (void)setFlipForRHD:(BOOL)a3
{
  self->_flipForRHD = a3;
}

- (NSNumber)representativeItemTypeNumber
{
  return self->_representativeItemTypeNumber;
}

- (void)setRepresentativeItemTypeNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representativeItemTypeNumber, 0);

  objc_storeStrong((id *)&self->_focusItem, 0);
}

@end