@interface UIStatusBarItem
+ (BOOL)isItemWithTypeExclusive:(int)a3 outBlacklistItems:(id *)a4 outWhitelistItems:(id *)a5;
+ (BOOL)itemType:(int)a3 idiom:(int64_t)a4 appearsInRegion:(int)a5;
+ (BOOL)itemType:(int)a3 idiom:(int64_t)a4 canBeEnabledForData:(id)a5 style:(id)a6;
+ (BOOL)typeIsValid:(int)a3;
+ (UIStatusBarItem)itemWithType:(int)a3 idiom:(int64_t)a4;
- (BOOL)appearsInRegion:(int)a3;
- (BOOL)appearsOnCenter;
- (BOOL)appearsOnLeft;
- (BOOL)appearsOnRight;
- (Class)viewClass;
- (NSString)indicatorName;
- (UIStatusBarItem)initWithType:(int)a3;
- (id)description;
- (int)centerOrder;
- (int)leftOrder;
- (int)priority;
- (int)rightOrder;
- (int)type;
- (int64_t)compareCenterOrder:(id)a3;
- (int64_t)compareLeftOrder:(id)a3;
- (int64_t)comparePriority:(id)a3;
- (int64_t)compareRightOrder:(id)a3;
@end

@implementation UIStatusBarItem

+ (UIStatusBarItem)itemWithType:(int)a3 idiom:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if (objc_msgSend(a1, "typeIsValid:"))
  {
    v6 = (char *)&_MergedGlobals_1235;
    if (a4 != 3) {
      v6 = (char *)&unk_1EB2632C0;
    }
    v7 = (id *)&v6[8 * v5];
    v8 = (UIStatusBarItem *)*v7;
    if (!v8)
    {
      v8 = [[UIStatusBarItem alloc] initWithType:v5];
      v8->_idiom = a4;
      objc_storeStrong(v7, v8);
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (BOOL)typeIsValid:(int)a3
{
  return a3 < 0x34;
}

+ (BOOL)itemType:(int)a3 idiom:(int64_t)a4 canBeEnabledForData:(id)a5 style:(id)a6
{
  v6 = &__itemValues;
  if (a4 == 1) {
    v6 = &__padItemValues;
  }
  v7 = v6[5 * a3 + 4];
  if (!v7) {
    return *(unsigned char *)([a5 rawData] + a3);
  }
  return ((uint64_t (*)(id, id))v7)(a5, a6);
}

+ (BOOL)itemType:(int)a3 idiom:(int64_t)a4 appearsInRegion:(int)a5
{
  if (a4 == 3)
  {
    v8 = &(&__externalItemValues)[5 * a3];
    int v9 = *((_DWORD *)v8 + 5);
    v10 = (int *)(v8 + 3);
  }
  else
  {
    if (a4 == 1) {
      v11 = &__padItemValues;
    }
    else {
      v11 = &__itemValues;
    }
    int64_t v12 = +[UIStatusBar _deviceUserInterfaceLayoutDirection];
    v13 = &v11[5 * a3];
    v14 = (int *)v13 + 5;
    v15 = (int *)(v13 + 3);
    if (v12) {
      v16 = (int *)(v13 + 3);
    }
    else {
      v16 = (int *)v13 + 5;
    }
    int v9 = *v16;
    if (+[UIStatusBar _deviceUserInterfaceLayoutDirection])
    {
      v10 = v14;
    }
    else
    {
      v10 = v15;
    }
  }
  if (a5 == 2)
  {
    v18 = &__itemValues;
    if (a4 == 1) {
      v18 = &__padItemValues;
    }
    if (a4 == 3) {
      v18 = &__externalItemValues;
    }
    int v19 = HIDWORD(v18[5 * a3 + 3]);
    return v19 != 0;
  }
  if (a5 == 1)
  {
    int v19 = *v10;
    return v19 != 0;
  }
  return !a5 && v9 != 0;
}

+ (BOOL)isItemWithTypeExclusive:(int)a3 outBlacklistItems:(id *)a4 outWhitelistItems:(id *)a5
{
  BOOL result = 0;
  switch(a3)
  {
    case '*':
      if (!a4) {
        goto LABEL_11;
      }
      v7 = (void *)MEMORY[0x1E4F1CAD0];
      v8 = &unk_1ED3F68D0;
      goto LABEL_8;
    case '+':
    case ',':
    case '-':
    case '.':
    case '0':
    case '1':
      return result;
    case '/':
      goto LABEL_5;
    case '2':
      if (!a4) {
        goto LABEL_11;
      }
      v7 = (void *)MEMORY[0x1E4F1CAD0];
      v8 = &unk_1ED3F68B8;
LABEL_8:
      id v9 = [v7 setWithObject:v8];
      BOOL result = 0;
      *a4 = v9;
      break;
    case '3':
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1ED3F6888, &unk_1ED3F68A0, 0);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        BOOL result = 0;
        *a5 = v11;
      }
      else
      {
LABEL_11:
        BOOL result = 0;
      }
      break;
    default:
      if (a3 == 36) {
LABEL_5:
      }
        BOOL result = 1;
      break;
  }
  return result;
}

- (UIStatusBarItem)initWithType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarItem;
  BOOL result = [(UIStatusBarItem *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (Class)viewClass
{
  int64_t idiom = self->_idiom;
  v3 = &__itemValues;
  if (idiom == 1) {
    v3 = &__padItemValues;
  }
  if (idiom == 3) {
    v4 = &__externalItemValues;
  }
  else {
    v4 = v3;
  }
  return (Class)v4[5 * self->_type];
}

- (int)priority
{
  v2 = &__itemValues;
  int64_t idiom = self->_idiom;
  if (idiom == 1) {
    v2 = &__padItemValues;
  }
  if (idiom == 3) {
    v2 = &__externalItemValues;
  }
  return (int)v2[5 * self->_type + 2];
}

- (int)leftOrder
{
  unsigned int type = self->_type;
  int64_t idiom = self->_idiom;
  if (idiom == 3)
  {
    v4 = (int *)&(&__externalItemValues)[5 * type] + 5;
  }
  else
  {
    if (idiom == 1) {
      objc_super v5 = &__padItemValues;
    }
    else {
      objc_super v5 = &__itemValues;
    }
    int64_t v6 = +[UIStatusBar _deviceUserInterfaceLayoutDirection];
    v7 = &v5[5 * type];
    v8 = (int *)v7 + 5;
    v4 = (int *)(v7 + 3);
    if (!v6) {
      v4 = v8;
    }
  }
  return *v4;
}

- (int)rightOrder
{
  unsigned int type = self->_type;
  int64_t idiom = self->_idiom;
  if (idiom == 3)
  {
    v4 = (int *)(&(&__externalItemValues)[5 * type] + 3);
  }
  else
  {
    if (idiom == 1) {
      objc_super v5 = &__padItemValues;
    }
    else {
      objc_super v5 = &__itemValues;
    }
    int64_t v6 = +[UIStatusBar _deviceUserInterfaceLayoutDirection];
    v7 = &v5[5 * type];
    v8 = (int *)(v7 + 3);
    v4 = (int *)v7 + 5;
    if (!v6) {
      v4 = v8;
    }
  }
  return *v4;
}

- (int)centerOrder
{
  int64_t idiom = self->_idiom;
  v3 = &__itemValues;
  if (idiom == 1) {
    v3 = &__padItemValues;
  }
  if (idiom == 3) {
    v4 = &__externalItemValues;
  }
  else {
    v4 = v3;
  }
  return HIDWORD(v4[5 * self->_type + 3]);
}

- (NSString)indicatorName
{
  if (self->_idiom == 1) {
    v2 = &__padItemValues;
  }
  else {
    v2 = &__itemValues;
  }
  return (NSString *)v2[5 * self->_type + 1];
}

- (BOOL)appearsOnLeft
{
  return [(UIStatusBarItem *)self leftOrder] != 0;
}

- (BOOL)appearsOnRight
{
  return [(UIStatusBarItem *)self rightOrder] != 0;
}

- (BOOL)appearsOnCenter
{
  return [(UIStatusBarItem *)self centerOrder] != 0;
}

- (BOOL)appearsInRegion:(int)a3
{
  if (a3 == 2) {
    return [(UIStatusBarItem *)self appearsOnCenter];
  }
  if (a3 == 1) {
    return [(UIStatusBarItem *)self appearsOnRight];
  }
  if (a3) {
    return 0;
  }
  return [(UIStatusBarItem *)self appearsOnLeft];
}

- (int64_t)comparePriority:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(UIStatusBarItem *)self priority];
  unsigned int v6 = [v4 priority];

  if (v5 >= v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
  if (v5 > v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (int64_t)compareLeftOrder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(UIStatusBarItem *)self leftOrder];
  unsigned int v6 = [v4 leftOrder];

  if (v5 >= v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
  if (v5 > v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (int64_t)compareRightOrder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(UIStatusBarItem *)self rightOrder];
  unsigned int v6 = [v4 rightOrder];

  if (v5 >= v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
  if (v5 > v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (int64_t)compareCenterOrder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(UIStatusBarItem *)self centerOrder];
  unsigned int v6 = [v4 centerOrder];

  if (v5 >= v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
  if (v5 > v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)UIStatusBarItem;
  v3 = [(UIStatusBarItem *)&v12 description];
  id v4 = NSStringFromClass([(UIStatusBarItem *)self viewClass]);
  unsigned int v5 = [v3 stringByAppendingFormat:@" [%@", v4];

  unsigned int v6 = [(UIStatusBarItem *)self indicatorName];

  if (v6)
  {
    int64_t v7 = [(UIStatusBarItem *)self indicatorName];
    uint64_t v8 = [v5 stringByAppendingFormat:@":%@", v7];

    unsigned int v5 = (void *)v8;
  }
  if ([(UIStatusBarItem *)self appearsOnLeft]
    && [(UIStatusBarItem *)self appearsOnRight])
  {
    id v9 = @" (Left/Right)]";
  }
  else if ([(UIStatusBarItem *)self appearsOnRight])
  {
    id v9 = @" (Right)]";
  }
  else if ([(UIStatusBarItem *)self appearsOnLeft])
  {
    id v9 = @" (Left)]";
  }
  else
  {
    if (![(UIStatusBarItem *)self appearsOnCenter]) {
      goto LABEL_13;
    }
    id v9 = @" (Center)]";
  }
  uint64_t v10 = [v5 stringByAppendingString:v9];

  unsigned int v5 = (void *)v10;
LABEL_13:
  return v5;
}

- (int)type
{
  return self->_type;
}

@end