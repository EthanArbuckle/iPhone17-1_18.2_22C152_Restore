@interface _DUIPotentialDrop
+ (BOOL)supportsSecureCoding;
- (BOOL)forbidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)precise;
- (BOOL)prefersFullSizePreview;
- (_DUIPotentialDrop)init;
- (_DUIPotentialDrop)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)preferredBadgeStyle;
- (unint64_t)operation;
- (void)encodeWithCoder:(id)a3;
- (void)setForbidden:(BOOL)a3;
- (void)setOperation:(unint64_t)a3;
- (void)setPrecise:(BOOL)a3;
- (void)setPreferredBadgeStyle:(int64_t)a3;
- (void)setPrefersFullSizePreview:(BOOL)a3;
@end

@implementation _DUIPotentialDrop

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUIPotentialDrop)init
{
  v3.receiver = self;
  v3.super_class = (Class)_DUIPotentialDrop;
  result = [(_DUIPotentialDrop *)&v3 init];
  if (result) {
    result->_operation = 0;
  }
  return result;
}

- (_DUIPotentialDrop)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_DUIPotentialDrop;
  v5 = [(_DUIPotentialDrop *)&v7 init];
  if (v5)
  {
    v5->_operation = [v4 decodeIntegerForKey:@"operation"];
    v5->_forbidden = [v4 decodeBoolForKey:@"forbidden"];
    v5->_precise = [v4 decodeBoolForKey:@"precise"];
    v5->_prefersFullSizePreview = [v4 decodeBoolForKey:@"prefersFullSizePreview"];
    v5->_preferredBadgeStyle = [v4 decodeIntegerForKey:@"preferredBadgeStyle"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t operation = self->_operation;
  id v5 = a3;
  [v5 encodeInteger:operation forKey:@"operation"];
  [v5 encodeBool:self->_forbidden forKey:@"forbidden"];
  [v5 encodeBool:self->_precise forKey:@"precise"];
  [v5 encodeBool:self->_prefersFullSizePreview forKey:@"prefersFullSizePreview"];
  [v5 encodeInteger:self->_preferredBadgeStyle forKey:@"preferredBadgeStyle"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p: operation=%ld forbidden=%d precise=%d prefersFullSizePreview=%d preferredBadgeStyle=%ld>", objc_opt_class(), self, self->_operation, self->_forbidden, self->_precise, self->_prefersFullSizePreview, self->_preferredBadgeStyle];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_DUIPotentialDrop *)self operation];
    if (v6 == [v5 operation]
      && (int v7 = -[_DUIPotentialDrop forbidden](self, "forbidden"), v7 == [v5 forbidden])
      && (int v8 = -[_DUIPotentialDrop precise](self, "precise"), v8 == [v5 precise])
      && (int v9 = [(_DUIPotentialDrop *)self prefersFullSizePreview],
          v9 == [v5 prefersFullSizePreview]))
    {
      int64_t v12 = [(_DUIPotentialDrop *)self preferredBadgeStyle];
      BOOL v10 = v12 == [v5 preferredBadgeStyle];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  objc_msgSend(v4, "setOperation:", -[_DUIPotentialDrop operation](self, "operation"));
  objc_msgSend(v4, "setForbidden:", -[_DUIPotentialDrop forbidden](self, "forbidden"));
  objc_msgSend(v4, "setPrecise:", -[_DUIPotentialDrop precise](self, "precise"));
  objc_msgSend(v4, "setPrefersFullSizePreview:", -[_DUIPotentialDrop prefersFullSizePreview](self, "prefersFullSizePreview"));
  objc_msgSend(v4, "setPreferredBadgeStyle:", -[_DUIPotentialDrop preferredBadgeStyle](self, "preferredBadgeStyle"));
  return v4;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_unint64_t operation = a3;
}

- (BOOL)forbidden
{
  return self->_forbidden;
}

- (void)setForbidden:(BOOL)a3
{
  self->_forbidden = a3;
}

- (BOOL)precise
{
  return self->_precise;
}

- (void)setPrecise:(BOOL)a3
{
  self->_precise = a3;
}

- (BOOL)prefersFullSizePreview
{
  return self->_prefersFullSizePreview;
}

- (void)setPrefersFullSizePreview:(BOOL)a3
{
  self->_prefersFullSizePreview = a3;
}

- (int64_t)preferredBadgeStyle
{
  return self->_preferredBadgeStyle;
}

- (void)setPreferredBadgeStyle:(int64_t)a3
{
  self->_preferredBadgeStyle = a3;
}

@end