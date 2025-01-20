@interface UICollectionViewDropProposal
- (UICollectionViewDropIntent)intent;
- (UICollectionViewDropProposal)initWithDropOperation:(UIDropOperation)operation intent:(UICollectionViewDropIntent)intent;
- (UICollectionViewDropProposal)initWithDropOperation:(unint64_t)a3;
- (UICollectionViewDropProposal)initWithDropOperation:(unint64_t)a3 dropLocation:(int64_t)a4;
- (id)description;
- (int64_t)dropLocation;
- (void)setIntent:(int64_t)a3;
@end

@implementation UICollectionViewDropProposal

- (UICollectionViewDropProposal)initWithDropOperation:(UIDropOperation)operation intent:(UICollectionViewDropIntent)intent
{
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewDropProposal;
  result = [(UIDropProposal *)&v6 initWithDropOperation:operation];
  if (result) {
    result->_intent = intent;
  }
  return result;
}

- (UICollectionViewDropProposal)initWithDropOperation:(unint64_t)a3 dropLocation:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewDropProposal;
  result = [(UIDropProposal *)&v7 initWithDropOperation:a3];
  if (result)
  {
    int64_t v6 = 2 * (a4 == 1);
    if (!a4) {
      int64_t v6 = 1;
    }
    result->_intent = v6;
  }
  return result;
}

- (UICollectionViewDropProposal)initWithDropOperation:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewDropProposal;
  result = [(UIDropProposal *)&v4 initWithDropOperation:a3];
  if (result) {
    result->_intent = 0;
  }
  return result;
}

- (int64_t)dropLocation
{
  int64_t intent = self->_intent;
  int64_t v3 = 1;
  if (intent != 2) {
    int64_t v3 = 2;
  }
  if (intent == 1) {
    return 0;
  }
  else {
    return v3;
  }
}

- (id)description
{
  int64_t v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  UIDropOperation v6 = [(UIDropProposal *)self operation];
  if (v6 > UIDropOperationMove) {
    objc_super v7 = &stru_1ED0E84C0;
  }
  else {
    objc_super v7 = off_1E52E6628[v6];
  }
  unint64_t intent = self->_intent;
  if (intent > 2) {
    v9 = &stru_1ED0E84C0;
  }
  else {
    v9 = off_1E52E6648[intent];
  }
  v10 = [v3 stringWithFormat:@"<%@:%p operation = %@ location = %@>", v5, self, v7, v9];;

  return v10;
}

- (UICollectionViewDropIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(int64_t)a3
{
  self->_unint64_t intent = a3;
}

@end