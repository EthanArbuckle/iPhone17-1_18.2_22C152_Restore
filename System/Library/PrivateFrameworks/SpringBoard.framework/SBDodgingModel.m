@interface SBDodgingModel
- (CGPoint)centerForIdentifier:(id)a3;
- (CGRect)referenceBounds;
- (CGSize)sizeForIdentifier:(id)a3;
- (NSMutableArray)identifiers;
- (NSMutableDictionary)centersForIdentifiers;
- (NSMutableDictionary)sizesForIdentifiers;
- (SBDodgingModel)initWithReferenceBounds:(CGRect)a3;
- (id)description;
- (id)modelByModifyingModelWithBlock:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setCentersForIdentifiers:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setReferenceBounds:(CGRect)a3;
- (void)setSizesForIdentifiers:(id)a3;
@end

@implementation SBDodgingModel

- (SBDodgingModel)initWithReferenceBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)SBDodgingModel;
  v7 = [(SBDodgingModel *)&v15 init];
  if (v7)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    identifiers = v7->_identifiers;
    v7->_identifiers = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    centersForIdentifiers = v7->_centersForIdentifiers;
    v7->_centersForIdentifiers = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sizesForIdentifiers = v7->_sizesForIdentifiers;
    v7->_sizesForIdentifiers = v12;

    v7->_referenceBounds.origin.CGFloat x = x;
    v7->_referenceBounds.origin.CGFloat y = y;
    v7->_referenceBounds.size.CGFloat width = width;
    v7->_referenceBounds.size.CGFloat height = height;
  }
  return v7;
}

- (NSMutableArray)identifiers
{
  return self->_identifiers;
}

- (CGPoint)centerForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_centersForIdentifiers objectForKey:a3];
  [v3 CGPointValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGSize)sizeForIdentifier:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_sizesForIdentifiers objectForKey:a3];
  [v3 CGSizeValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGRect)referenceBounds
{
  double x = self->_referenceBounds.origin.x;
  double y = self->_referenceBounds.origin.y;
  double width = self->_referenceBounds.size.width;
  double height = self->_referenceBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)modelByModifyingModelWithBlock:(id)a3
{
  double v4 = (void (**)(id, void *))a3;
  double v5 = (void *)[(SBDodgingModel *)self mutableCopy];
  v4[2](v4, v5);

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  double v4 = -[SBDodgingModel initWithReferenceBounds:]([SBMutableDodgingModel alloc], "initWithReferenceBounds:", self->_referenceBounds.origin.x, self->_referenceBounds.origin.y, self->_referenceBounds.size.width, self->_referenceBounds.size.height);
  double v5 = (void *)[(NSMutableArray *)self->_identifiers mutableCopy];
  [(SBDodgingModel *)v4 setIdentifiers:v5];

  double v6 = (void *)[(NSMutableDictionary *)self->_centersForIdentifiers mutableCopy];
  [(SBDodgingModel *)v4 setCentersForIdentifiers:v6];

  double v7 = (void *)[(NSMutableDictionary *)self->_sizesForIdentifiers mutableCopy];
  [(SBDodgingModel *)v4 setSizesForIdentifiers:v7];

  return v4;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  double v4 = NSStringFromCGRect(self->_referenceBounds);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v5 = self->_identifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        [(SBDodgingModel *)self sizeForIdentifier:v10];
        SBRectWithSize();
        [(SBDodgingModel *)self centerForIdentifier:v10];
        UIRectCenteredAboutPoint();
        v11 = NSStringFromCGRect(v23);
        [v3 appendFormat:@"\n%@ frame:%@ inBounds:%@", v10, v11, v4];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v15.receiver = self;
  v15.super_class = (Class)SBDodgingModel;
  v12 = [(SBDodgingModel *)&v15 description];
  v13 = [v12 stringByAppendingFormat:@"%@", v3];

  return v13;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSMutableDictionary)centersForIdentifiers
{
  return self->_centersForIdentifiers;
}

- (void)setCentersForIdentifiers:(id)a3
{
}

- (NSMutableDictionary)sizesForIdentifiers
{
  return self->_sizesForIdentifiers;
}

- (void)setSizesForIdentifiers:(id)a3
{
}

- (void)setReferenceBounds:(CGRect)a3
{
  self->_referenceBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizesForIdentifiers, 0);
  objc_storeStrong((id *)&self->_centersForIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end