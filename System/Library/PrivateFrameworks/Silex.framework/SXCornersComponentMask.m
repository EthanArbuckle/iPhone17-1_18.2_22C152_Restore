@interface SXCornersComponentMask
- (BOOL)cornerWithValue:(id)a3 withType:(int)a4;
- (id)curveWithValue:(id)a3 withType:(int)a4;
- (unint64_t)cornerMask;
@end

@implementation SXCornersComponentMask

- (BOOL)cornerWithValue:(id)a3 withType:(int)a4
{
  if (a3 && a4 == 2) {
    return [a3 BOOLValue];
  }
  else {
    return 1;
  }
}

- (id)curveWithValue:(id)a3 withType:(int)a4
{
  id v6 = (id)*MEMORY[0x263F15A10];
  if (a4 == 3 && [a3 isEqualToString:@"continuous"])
  {
    id v7 = (id)*MEMORY[0x263F15A20];

    id v6 = v7;
  }
  return v6;
}

- (unint64_t)cornerMask
{
  unint64_t v3 = [(SXCornersComponentMask *)self topLeft];
  if ([(SXCornersComponentMask *)self topRight]) {
    v3 |= 2uLL;
  }
  if ([(SXCornersComponentMask *)self bottomRight]) {
    v3 |= 8uLL;
  }
  if ([(SXCornersComponentMask *)self bottomLeft]) {
    return v3 | 4;
  }
  else {
    return v3;
  }
}

@end