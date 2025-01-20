@interface CarFocusOrderEnvironment
+ (CarFocusOrderEnvironment)environmentWithFocusEnvironment:(id)a3;
+ (CarFocusOrderEnvironment)environmentWithRepresentativeItemType:(unint64_t)a3;
- (NSNumber)representativeItemTypeNumber;
- (UIFocusEnvironment)focusEnvironment;
- (unint64_t)representativeItemType;
- (void)ifFocusEnvironment:(id)a3 ifRepresentativeItem:(id)a4;
- (void)setFocusEnvironment:(id)a3;
- (void)setRepresentativeItemTypeNumber:(id)a3;
@end

@implementation CarFocusOrderEnvironment

+ (CarFocusOrderEnvironment)environmentWithFocusEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setFocusEnvironment:v4];

  [v5 setRepresentativeItemTypeNumber:&off_1013AA5A0];

  return (CarFocusOrderEnvironment *)v5;
}

+ (CarFocusOrderEnvironment)environmentWithRepresentativeItemType:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  [v4 setRepresentativeItemTypeNumber:v5];

  return (CarFocusOrderEnvironment *)v4;
}

- (unint64_t)representativeItemType
{
  v2 = [(CarFocusOrderEnvironment *)self representativeItemTypeNumber];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)ifFocusEnvironment:(id)a3 ifRepresentativeItem:(id)a4
{
  v8 = a3;
  v6 = a4;
  if (self->_focusEnvironment)
  {
    v7 = (void (*)(void))v8[2];
  }
  else
  {
    if (!self->_representativeItemTypeNumber) {
      goto LABEL_6;
    }
    [(CarFocusOrderEnvironment *)self representativeItemType];
    v7 = (void (*)(void))v6[2];
  }
  v7();
LABEL_6:
}

- (UIFocusEnvironment)focusEnvironment
{
  return self->_focusEnvironment;
}

- (void)setFocusEnvironment:(id)a3
{
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

  objc_storeStrong((id *)&self->_focusEnvironment, 0);
}

@end