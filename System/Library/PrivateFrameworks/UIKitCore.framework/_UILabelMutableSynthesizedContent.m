@interface _UILabelMutableSynthesizedContent
- (_UILabelMutableSynthesizedContent)initWithContent:(id)a3;
- (void)_resetSynthesizedResults;
- (void)setContent:(id)a3;
- (void)setDisableLinkHypenation:(BOOL)a3;
- (void)setEliminateShadows:(BOOL)a3;
- (void)setOverallWritingDirectionFollowsLayoutDirection:(BOOL)a3;
- (void)setOverrideTextColor:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setTextEncapsulation:(id)a3;
@end

@implementation _UILabelMutableSynthesizedContent

- (_UILabelMutableSynthesizedContent)initWithContent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UILabelMutableSynthesizedContent;
  v6 = [(_UILabelMutableSynthesizedContent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->super._content, a3);
  }

  return v7;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->super._content, a3);
  [(_UILabelMutableSynthesizedContent *)self _resetSynthesizedResults];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  self->super._semanticContentAttribute = a3;
  [(_UILabelMutableSynthesizedContent *)self _resetSynthesizedResults];
}

- (void)setOverrideTextColor:(id)a3
{
  objc_storeStrong((id *)&self->super._overrideTextColor, a3);
  [(_UILabelMutableSynthesizedContent *)self _resetSynthesizedResults];
}

- (void)setEliminateShadows:(BOOL)a3
{
  *(unsigned char *)&self->super._flags = *(unsigned char *)&self->super._flags & 0xFE | a3;
  [(_UILabelMutableSynthesizedContent *)self _resetSynthesizedResults];
}

- (void)setOverallWritingDirectionFollowsLayoutDirection:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->super._flags = *(unsigned char *)&self->super._flags & 0xFD | v3;
  [(_UILabelMutableSynthesizedContent *)self _resetSynthesizedResults];
}

- (void)setDisableLinkHypenation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->super._flags = *(unsigned char *)&self->super._flags & 0xFB | v3;
  [(_UILabelMutableSynthesizedContent *)self _resetSynthesizedResults];
}

- (void)setTextEncapsulation:(id)a3
{
  objc_storeStrong((id *)&self->super._textEncapsulation, a3);
  [(_UILabelMutableSynthesizedContent *)self _resetSynthesizedResults];
}

- (void)_resetSynthesizedResults
{
  objc_setAssociatedObject(self, &_MergedGlobals_1339, 0, (void *)0x301);
  objc_setAssociatedObject(self, &unk_1EB265518, 0, (void *)0x301);
}

@end