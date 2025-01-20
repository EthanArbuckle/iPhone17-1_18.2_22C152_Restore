@interface UIDropProposal
+ (UIDropProposal)new;
- (BOOL)isPrecise;
- (BOOL)prefersFullSizePreview;
- (UIDropOperation)operation;
- (UIDropProposal)init;
- (UIDropProposal)initWithDropOperation:(UIDropOperation)operation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_preferredBadgeStyle;
- (void)_setPreferredBadgeStyle:(int64_t)a3;
- (void)setOperation:(unint64_t)a3;
- (void)setPrecise:(BOOL)precise;
- (void)setPrefersFullSizePreview:(BOOL)prefersFullSizePreview;
@end

@implementation UIDropProposal

- (UIDropProposal)initWithDropOperation:(UIDropOperation)operation
{
  v5.receiver = self;
  v5.super_class = (Class)UIDropProposal;
  result = [(UIDropProposal *)&v5 init];
  if (result)
  {
    result->_operation = operation;
    result->_prefersFullSizePreview = 1;
  }
  return result;
}

- (UIDropProposal)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIDropInteraction.m" lineNumber:108 description:@"Not implemented"];

  return 0;
}

+ (UIDropProposal)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"UIDropInteraction.m" lineNumber:114 description:@"Not implemented"];

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDropOperation:", -[UIDropProposal operation](self, "operation"));
  objc_msgSend(v4, "setPrecise:", -[UIDropProposal isPrecise](self, "isPrecise"));
  objc_msgSend(v4, "setPrefersFullSizePreview:", -[UIDropProposal prefersFullSizePreview](self, "prefersFullSizePreview"));
  objc_msgSend(v4, "_setPreferredBadgeStyle:", -[UIDropProposal _preferredBadgeStyle](self, "_preferredBadgeStyle"));
  return v4;
}

- (id)description
{
  v3 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  unint64_t v4 = [(UIDropProposal *)self operation] - 1;
  if (v4 > 2) {
    objc_super v5 = @"Cancel";
  }
  else {
    objc_super v5 = off_1E52EBF68[v4];
  }
  id v6 = (id)[v3 appendName:@"operation" object:v5];
  id v7 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"isPrecise", -[UIDropProposal isPrecise](self, "isPrecise"));
  id v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"prefersFullSizePreview", -[UIDropProposal prefersFullSizePreview](self, "prefersFullSizePreview"));
  if ([(UIDropProposal *)self _preferredBadgeStyle])
  {
    unint64_t v9 = [(UIDropProposal *)self _preferredBadgeStyle] - 1;
    if (v9 > 3) {
      v10 = @"Automatic";
    }
    else {
      v10 = off_1E52EBF80[v9];
    }
    id v11 = (id)[v3 appendName:@"preferredBadgeStyle" object:v10];
  }
  v12 = [v3 string];

  return v12;
}

- (UIDropOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_operation = a3;
}

- (BOOL)isPrecise
{
  return self->_precise;
}

- (void)setPrecise:(BOOL)precise
{
  self->_precise = precise;
}

- (BOOL)prefersFullSizePreview
{
  return self->_prefersFullSizePreview;
}

- (void)setPrefersFullSizePreview:(BOOL)prefersFullSizePreview
{
  self->_prefersFullSizePreview = prefersFullSizePreview;
}

- (int64_t)_preferredBadgeStyle
{
  return self->_preferredBadgeStyle;
}

- (void)_setPreferredBadgeStyle:(int64_t)a3
{
  self->_preferredBadgeStyle = a3;
}

@end