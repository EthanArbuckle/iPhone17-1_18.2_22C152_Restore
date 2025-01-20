@interface _UITransformToReasonAssociation
+ (id)association:(id)a3 reason:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)reason;
- (UITransform)transform;
- (_UITransformToReasonAssociation)initWithTransform:(id)a3 reason:(id)a4;
- (unint64_t)hash;
- (void)setReason:(id)a3;
- (void)setTransform:(id)a3;
@end

@implementation _UITransformToReasonAssociation

+ (id)association:(id)a3 reason:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_UITransformToReasonAssociation alloc] initWithTransform:v6 reason:v5];

  return v7;
}

- (_UITransformToReasonAssociation)initWithTransform:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UITransformToReasonAssociation;
  v9 = [(_UITransformToReasonAssociation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transform, a3);
    objc_storeStrong((id *)&v10->_reason, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(UITransform *)self->_transform hash];
  return 11 * v3 * [(NSString *)self->_reason hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UITransformToReasonAssociation *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && BSEqualObjects()) {
    char v6 = BSEqualObjects();
  }
  else {
LABEL_6:
  }
    char v6 = 0;
LABEL_8:

  return v6;
}

- (UITransform)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_transform, 0);
}

@end