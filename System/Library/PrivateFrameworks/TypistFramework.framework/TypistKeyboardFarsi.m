@interface TypistKeyboardFarsi
- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6;
- (id)init:(id)a3 options:(id)a4;
@end

@implementation TypistKeyboardFarsi

- (id)init:(id)a3 options:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TypistKeyboardFarsi;
  return [(TypistKeyboard *)&v5 init:a3 options:a4 locale:@"fa"];
}

- (BOOL)isSwitchedToCapitalPlane:(id)a3 previous:(id)a4 currentPlane:(id)a5 context:(id)a6
{
  return 0;
}

@end