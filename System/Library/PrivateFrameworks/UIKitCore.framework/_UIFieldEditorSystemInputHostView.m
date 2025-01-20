@interface _UIFieldEditorSystemInputHostView
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)widthConstraint;
- (void)setHeightConstraint:(id)a3;
- (void)setWidthConstraint:(id)a3;
@end

@implementation _UIFieldEditorSystemInputHostView

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end