@interface _UICommandChange
+ (BOOL)supportsSecureCoding;
- (BOOL)acceptBoolItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6;
- (BOOL)isEqual:(id)a3;
- (_UICommandChange)initWithAnchor:(id)a3;
- (_UICommandChange)initWithCoder:(id)a3;
- (id)anchor;
- (unint64_t)hash;
- (void)acceptItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UICommandChange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICommandChange)initWithAnchor:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICommandChange;
  v5 = [(_UICommandChange *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id anchor = v5->_anchor;
    v5->_id anchor = (id)v6;
  }
  return v5;
}

- (_UICommandChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICommandChange;
  v5 = [(_UICommandChange *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"anchor"];
    id anchor = v5->_anchor;
    v5->_id anchor = (id)v9;
  }
  return v5;
}

- (void)acceptItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 handleFailureInMethod:a2 object:self file:@"_UICommandDiffv1.m" lineNumber:51 description:@"Use concrete subclass"];
}

- (BOOL)acceptBoolItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  id v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  [v8 handleFailureInMethod:a2 object:self file:@"_UICommandDiffv1.m" lineNumber:58 description:@"Use concrete subclass"];

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  return [self->_anchor hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [self->_anchor isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)anchor
{
  return self->_anchor;
}

- (void).cxx_destruct
{
}

@end