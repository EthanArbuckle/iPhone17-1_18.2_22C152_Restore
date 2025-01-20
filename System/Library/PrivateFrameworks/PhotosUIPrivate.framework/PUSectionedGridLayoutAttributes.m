@interface PUSectionedGridLayoutAttributes
- (BOOL)exists;
- (BOOL)extendsTopContent;
- (BOOL)floating;
- (BOOL)isEqual:(id)a3;
- (PUSectionedGridLayoutAttributes)init;
- (double)interactiveTransitionProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setExists:(BOOL)a3;
- (void)setExtendsTopContent:(BOOL)a3;
- (void)setFloating:(BOOL)a3;
- (void)setInteractiveTransitionProgress:(double)a3;
@end

@implementation PUSectionedGridLayoutAttributes

- (void)setExists:(BOOL)a3
{
  self->_exists = a3;
}

- (BOOL)exists
{
  return self->_exists;
}

- (void)setExtendsTopContent:(BOOL)a3
{
  self->_extendsTopContent = a3;
}

- (BOOL)extendsTopContent
{
  return self->_extendsTopContent;
}

- (void)setInteractiveTransitionProgress:(double)a3
{
  self->_interactiveTransitionProgress = a3;
}

- (double)interactiveTransitionProgress
{
  return self->_interactiveTransitionProgress;
}

- (void)setFloating:(BOOL)a3
{
  self->_floating = a3;
}

- (BOOL)floating
{
  return self->_floating;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)PUSectionedGridLayoutAttributes;
  v3 = [(UICollectionViewLayoutAttributes *)&v9 description];
  v4 = v3;
  v5 = @"Y";
  if (self->_floating) {
    v6 = @"Y";
  }
  else {
    v6 = @"N";
  }
  if (!self->_extendsTopContent) {
    v5 = @"N";
  }
  objc_msgSend(v3, "stringByAppendingFormat:", @"floating = %@; interactiveTransitionProgress = %0.2f; extendsTopContent = %@",
    v6,
    *(void *)&self->_interactiveTransitionProgress,
  v7 = v5);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUSectionedGridLayoutAttributes;
  if (![(UICollectionViewLayoutAttributes *)&v12 isEqual:v4]) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v10 = 1;
    goto LABEL_9;
  }
  int floating = self->_floating;
  if (floating == [v4 floating]
    && (double interactiveTransitionProgress = self->_interactiveTransitionProgress,
        [v4 interactiveTransitionProgress],
        interactiveTransitionProgress == v7)
    && (int exists = self->_exists, exists == [v4 exists]))
  {
    int extendsTopContent = self->_extendsTopContent;
    BOOL v10 = extendsTopContent == [v4 extendsTopContent];
  }
  else
  {
LABEL_7:
    BOOL v10 = 0;
  }
LABEL_9:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUSectionedGridLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  [v4 setFloating:self->_floating];
  [v4 setInteractiveTransitionProgress:self->_interactiveTransitionProgress];
  [v4 setExists:self->_exists];
  [v4 setExtendsTopContent:self->_extendsTopContent];
  return v4;
}

- (PUSectionedGridLayoutAttributes)init
{
  v3.receiver = self;
  v3.super_class = (Class)PUSectionedGridLayoutAttributes;
  result = [(UICollectionViewLayoutAttributes *)&v3 init];
  result->_double interactiveTransitionProgress = -1.0;
  return result;
}

@end